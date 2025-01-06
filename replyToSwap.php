<?php

    $swapDbId = $_REQUEST["swapDbId"];
    $accepted = $_REQUEST["accept"];
    $email = $_REQUEST["requesterEmail"];

    require_once 'inc/db_connect.php';

    $sql = "select * from v_swaps where swapId = ?";
    $query = $dbh->prepare($sql);
    $query->execute(array($swapDbId));
    $row = $query->fetch();
    if ($query->rowcount() == 0)
    {
        echo "There is no record of this swap being requested";
        return;
    }

    $requesterDt = (new DateTime($row["requesterDate"]))->format("D M d, Y");

    // first test to see if requester still owns the requested time
    if (requesterStillOwnsSlot($dbh, $row) == 0)
    {
        printf("%s no longer is scheduled for the slot on %s %s at %s.<br/>The request is automatically being declined.",
                 $row["requesterName"], $requesterDt, $row["requesterSlot"], $row["requesterLocation"]);
        updateSwapStatus($dbh, $row, 'D');
        return;
    }

    // second test to see if the date is passed. Just send a message if it is
    if (testDatePast($row) == 0)
    {
        printf("The date %s for which %s asked you to swap has passed", $requesterDt, $row["requesterName"]);
        return;
    }
    if ($accepted == 0)
    {
        printf("An email has been sent to %s indicating you are declining his/her request for a swap on %s %s at %s",
                        $row["requesterName"], $requesterDt, $row["requesterSlot"], $row["requesterLocation"]);
        sendEmail($dbh, $row, 'D');
        return;
    }

    if ($accepted == 1)
    {
        printf("An email has been sent to %s indicating you are accepting his/her request for a swap on %s %s at %s",
                        $row["requesterName"], $requesterDt, $row["requesterSlot"], $row["requesterLocation"]);
        sendEmail($dbh, $row, 'A');
        return;
    }

    function testDatePast($row)
    {
        $currDate = (new DateTime())->format("Y-m-d");
        if ($row["requesterDate"] < $currDate)
            return 0;
        else
            return 1;
    }

    function sendEmail($dbh, $row, $status)
    {
        switch ($status)
        {
            case "D" : $statusStr = "declined"; $msg = createMessage($row, $statusStr); updateSwapStatus($dbh, $row, 'D'); break;
            case "A" : $statusStr = "accepted"; $msg = createMessage($row, $statusStr); updateSwapStatus($dbh, $row, 'A'); break;
        }
        $to = $row["requesterEmail"];
        $dt = (new DateTime($row["requesteeDate"]))->format("D M d, Y");
        $subject = sprintf("Request for a swap with %s on %s has been %s", $row["requesteeName"], $dt, $statusStr);
        $header = sprintf("From:%s \r\n", $row["requesteeEmail"]);
        $header .= "MIME-Version: 1.0\r\n";
        $header .= "Content-type: text/html\r\n";
        $retval = mail($to, $subject, $msg, $header);
        if ($status == "A")
            updateSchedule($dbh, $row);
    }

    function updateSchedule($dbh, $row)
    {
        // can't do updates because the first one violates unique index
        $sqlDelete = "delete from schedule where dt = ? and slot = ? and ringer = ? and location = ?";
        $sqlInsert = "INSERT INTO schedule(dt, slot, ringer, location) VALUES (?, ?, ?, ?)";
        $queryDelete = $dbh->prepare($sqlDelete);
        $queryInsert = $dbh->prepare($sqlInsert);
        $queryDelete->execute(array($row["requesterDate"], $row["requesterSlotId"], $row["requesterId"], $row["requesterLocationId"]));
        $queryDelete->execute(array($row["requesteeDate"], $row["requesteeSlotId"], $row["requesteeId"], $row["requesteeLocationId"]));
        $queryInsert->execute(array($row["requesterDate"], $row["requesterSlotId"], $row["requesteeId"], $row["requesterLocationId"]));
        $queryInsert->execute(array($row["requesteeDate"], $row["requesteeSlotId"], $row["requesterId"], $row["requesteeLocationId"]));
    }

    function createMessage($row, $statusStr)
    {
        $msg = sprintf("%s has <strong>%s</strong> to swap your %s slot at %s on %s<br/>",
                          $row["requesteeName"], $statusStr, $row["requesterSlot"], $row["requesterLocation"], dateToString($row["requesterDate"], "D M d, Y"));
        $msg .= sprintf("for his/her timeslot on %s at %s on %s",
                        $row["requesteeSlot"], $row["requesteeLocation"], dateToString($row["requesteeDate"], "D M d, Y"));
        return $msg;
    }

    function updateSwapStatus($dbh, $row, $status)
    {
        $sql = "update swaps set swapStatus = ? where swapId = ?";
        $query = $dbh->prepare($sql);
        $query->execute(array($status, $row["swapId"]));
    }

    function requesterStillOwnsSlot($dbh, $row)
    {
        $sql = "select * from schedule where ringer = ? and slot = ? and location = ? and dt = ?";
        $query = $dbh->prepare($sql);
        $query->execute(array($row["requesterId"], $row["requesterSlotId"], $row["requesterLocationId"], $row["requesterDate"])) ;
        $result = $query->fetch();
        return $query->rowcount(); // zero means requester no longer is scheduled for the slot
    }

    function dateToString($dt, $fmt)
    {
        return (new DateTime($dt))->format($fmt);
    }
?>