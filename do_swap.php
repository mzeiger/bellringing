<?php

/*    if ($_SERVER['HTTP_X_REQUESTED_WITH'] == '')
    {
        echo 'Access denied';
        return;
    }
*/

    class swapperInfo
    {
        var $id;
        var $slotId;
        var $locationId;
        var $swapDate;
        var $code;
        var $fullName;
        var $email;
        var $slotName;
        var $locationName;
    }

    $requestee = new swapperInfo;  // person being asked to swap
    $requester = new swapperInfo; // person who is initiating the swap

    $requester->slotId = $_POST["swapSlot"];
    $requester->locationId = $_POST["swapLocation"];
    $requester->swapDate = $_POST["swapDate"];

    $requestee->code = $_POST["requesteeCode"];

    $sd = new DateTime($requester->swapDate);
    $requester->swapDate = $sd->format("Y-m-d");

    require_once 'inc/db_connect.php';

    list($requester->id, $requestee->slotId, $requestee->locationId, $requestee->swapDate, $requestee->id) = explode(":", $requestee->code);

    $sql = "select ringer from v_schedule where slot = ? and location = ? and dt = ? and ringer = ?" ;
    $query = $dbh->prepare($sql);

    // First see if the requester is scheduled for the date/time/location he's asking to swap with
    $query->execute(array($requester->slotId, $requester->locationId, $sd->format("Y-m-d"), $requester->id));
    $row = $query->fetch();
    if ($query->rowcount() == 0)
    {
        echo '<p style="color: red">You do not have the slot that you\'re asking to swap for reserved</p>';
        return;
    }

    // both requester and requestee are in the same time slot (differenct locations naturally) so they can swap w/o conflict
    if (($requester->slotId == $requestee->slotId) & ($requester->swapDate == $requestee->swapDate))
    {
        echo processSwap($dbh, $requester, $requestee);
        return;
    }
    // otherwise check to see if the requestee will be put in a slot they already occupy at a different location
    $sql = "select * from schedule where dt = ? and slot = ? and ringer = ?";
    $query = $dbh->prepare($sql);
    $query->execute(array($requester->swapDate, $requester->slotId, $requestee->id));
//printf("select * from schedule where dt = %s and slot = %s and ringer = %s<br/>", $requester->swapDate, $requester->slotId, $requestee->id );
    $row = $query->fetch();
    if ($query->rowcount() != 0)
    {
        echo '<p style="color: red">The person you are requesting to swap with is already scheduled for this time at another location</p>';
        return;
    }

    echo processSwap($dbh, $requester, $requestee);

    function processSwap($dbh, $requester, $requestee)
    {
        $sql = "select fname, lname, email from ringers where id = ?";
        $query = $dbh->prepare($sql);
        $query->execute(array($requestee->id));
        $row = $query->fetch();
        $requestee->fullName = $row["fname"] . " " . $row["lname"];
        $requestee->email = $row["email"];
        $query->execute(array($requester->id));
        $row = $query->fetch();
        $requester->fullName = $row["fname"] . " " . $row["lname"];
        $requester->email = $row["email"];

        $sql = "select time from timeslots where id = ?";
        $query = $dbh->prepare($sql);
        $query->execute(array($requester->slotId));
        $row = $query->fetch();
        $requester->slotName = $row["time"];
        $query->execute(array($requestee->slotId));
        $row = $query->fetch();
        $requestee->slotName = $row["time"];

        $sql = "select location_name from locations where id = ?";
        $query = $dbh->prepare($sql);
        $query->execute(array($requester->locationId));
        $row = $query->fetch();
        $requester->locationName = $row["location_name"];
        $query->execute(array($requestee->locationId));
        $row = $query->fetch();
        $requestee->locationName = $row["location_name"];

        $requesterDt = new DateTime($requester->swapDate);
        $requesterDt = $requesterDt->format("D, M d, Y");
        $requesteeDt = new DateTime($requestee->swapDate);
        $requesteeDt = $requesteeDt->format("D, M d, Y");

        $str = sprintf('<p style="color:green">An email has been sent to %s requesting that he/she swap the time slot on %s from %s at %s&nbsp;',
             $requestee->fullName, $requesteeDt, $requestee->slotName, $requestee->locationName);
        $str .= sprintf('for your time slot on %s from %s at %s.', $requesterDt, $requester->slotName, $requester->locationName);

        $swapDbId = processDatabase($dbh, $requester, $requestee);
        if ($swapDbId)
        {
            processEmail($requester, $requestee, $swapDbId);
        }
        return $str;
    }

    function processDatabase($dbh, $requester, $requestee)
    {
         $sql = "INSERT INTO swaps (requesterId, requesterSlotId, requesterLocationId, requesterDate,
                requesteeId, requesteeSlotId, requesteeLocationId, requesteeDate, swapStatus)
                     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
         try
         {
             $query = $dbh->prepare($sql);
             $query->execute(array($requester->id, $requester->slotId, $requester->locationId, $requester->swapDate,
                                   $requestee->id, $requestee->slotId, $requestee->locationId, $requestee->swapDate, "N"));
             return $dbh->lastInsertId();
         }
         catch (Exception $ex)
         {
             $msg =  $ex->getMessage();
             echo '<br/><p style="color: red">A database error has occurred<br/>' . $msg . '</p>';
             return false;
         }
    }

    function processEmail($requester, $requestee, $swapDbId)
    {
        $to = $requestee->email;
        $subject = sprintf("Request for a swap from %", $requester->fullName);
        $header = sprintf("From:%s \r\n", $requester->email);
        $header .= "MIME-Version: 1.0\r\n";
        $header .= "Content-type: text/html\r\n";
        $msg = createMessage($requester, $requestee, $swapDbId);
        $retval = mail($to, $subject, $msg, $header);
    }

    function createMessage($requester, $requestee, $swapDbId)
    {
        $dt = new DateTime($requestee->swapDate);
        $requesteeSwapDate = $dt->format("D M d, Y");
        $dt = new DateTime($requester->swapDate);
        $requesterSwapDate = $dt->format("D M d, Y");

        $msg = sprintf("%s<br/><br/>%s would like to make the following schedule swap with you", $requestee->fullName, $requester->fullName);
        $msg .= "<br><ul>";
        $msg .= sprintf("<li>Your timeslot on %s, %s at %s</li>", $requesteeSwapDate, $requestee->slotName, $requestee->locationName);
        $msg .= sprintf("<li>His/Her timeslot on %s, %s at %s</li>", $requesterSwapDate, $requester->slotName, $requester->locationName);
        $msg .= "</ul><br/><br/>";
        $msg .= 'Click on the "Accept" link to accept the swap or on the "Decline" link to decline the swap.';
        $msg .= "<br/><br/>";
        $msg .= sprintf('<a href="%s/bellringing/replyToSwap.php?swapDbId=%s&accept=1&requesterEmail=%s">Accept Swap</a>',$_SERVER["SERVER_NAME"], $swapDbId, $requester->email);
        $msg .="&nbsp;&nbsp;&nbsp;";
        $msg .= sprintf('<a href="%s/bellringing/replyToSwap.php?swapDbId=%s&accept=0&requesterEmail=%s">Decline Swap<a/>',$_SERVER["SERVER_NAME"], $swapDbId, $requester->email);
        return $msg;
    }

?>