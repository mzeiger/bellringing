<?php

     require_once 'inc/db_connect.php';

     // the code of the requestee - person being asked to swap
     // which contains the id of the requestor as first element and requestee as last
     $code = $_POST["code"];

     list($callingRingerId, $slotId, $locationId, $dt, $scheduledRingerId) = explode(":", $code);

     $currDt = new DateTime();
     $currDt = $currDt->format('Y-m-d');
     if ($dt < $currDt)
     {
         echo "You can not swap for a date that is in the past@@@!!!@@@&nbsp;";
         return;
     }

     // check to see if the swap will put the requestor or requestee in a timeslot they already occupy in another location
/*
     $sql = "select * from schedule where ringer = ? and dt = ? and slot = ?";
     $query = $dbh->prepare($sql);
     $query->execute(array($callingRingerId, $dt, $slotId));
     $row = $query->fetch();
     if ($query->rowcount() != 0)
     {
         echo '<p style="color: red">You are already scheduled for another location at the same time</p>@@@!!!@@@&nbsp;';
         return;
     }
*/
     // Set up the HTML <form>
     $sql = "select fname, lname from ringers where id = ?";
     $query = $dbh->prepare($sql);
     $query->execute(array($scheduledRingerId));
     $row = $query->fetch();
     $name = $row["fname"] . " " . $row["lname"];

     $sql = "select time from timeslots where id = ?";
     $query = $dbh->prepare($sql);
     $query->execute(array($slotId));
     $row = $query->fetch();
     $time = $row["time"];

     $sql = "select location_name from locations where id = ?";
     $query = $dbh->prepare($sql);
     $query->execute(array($locationId));
     $row = $query->fetch();
     $location = $row["location_name"];

     $sql = "select * from locations";
     $query = $dbh->prepare($sql);
     $query->execute();
     $locations = $query->fetchAll();

     $sql = "select * from timeslots";
     $query = $dbh->prepare($sql);
     $query->execute();
     $timeslots = $query->fetchAll();

     $date = new DateTime($dt);
     $date = $date->format('D') . ' ' . $date->format("M-d-Y") ;
     $str = sprintf("You have asked to swap with %s for his/her timeslot at %s on %s from %s", $name, $location , $date, $time);

     $str .= sprintf("<br/><br/>Please pick a location, date, and time for which you are currently scheduled that you wish to swap with %s", $name);

     $str .= "@@@!!!@@@"; // Used as the "split" delimiter to separate swapFormTopMessage from swapFormDiv


     // Create an HTML <form> that has the locations and timeslots and an <input> for the Date Picker
     $str .=  '<form id="swapForm">
                 <div style="float: left">
                    <label style="text-align: left">Timeslot</label><br/>
                    <select name="swapSlot" form="swapForm" id="swapSlot">
                      <option value="">--- Select ---</option>' ;

    for ($i = 1; $i <= count($timeslots); $i++)
    {
        $str .= '<option value="' . $timeslots[$i-1]["id"] . '">' . $timeslots[$i-1]["time"] . '</option>';
    }
    $str .=  '</select></div>';

    $str .= '<div style="float: left">
                    <label style="text-align: left">Location</label><br/>
                    <select name="swapLocation" form="swapForm" id="swapLocation">
                      <option value="">--- Select ---</option> ';

    for ($i = 1; $i <= count($locations); $i++)
    {
        $str .= '<option value="' . $locations[$i-1]["id"] . '">' . $locations[$i-1]["location_name"] . '</option>';
    }
    $str .= '</select>
                 </div>';

    $str .= '<div>
              <label style="text-align: left">Date</label><br/>
              <input name="swapDate" id="swapDate" form="swapForm"  />
            </div>
            <input type="hidden" id="requesteeCode" name="requesteeCode" value="' . $code . '"/>
            <div id="errorContainer"><ul class="errorMessageList"></ul></div>
          </form>';

    echo $str;
?>
