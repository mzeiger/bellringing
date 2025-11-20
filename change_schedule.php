<?php  // change_schedule.php

   /* This program returns a string consisting of "ret_cd#msg#cd" to index.html
      ret_cd = 0 means index.html calls the remove function
      ret_cd = 1 means index.html displays an alert box indicating slot is already occupied by somebody else
      ret_cd = 2 means index calls the insert function
      ret_cd = 3 means index.html displays a message indicating user is already in the same time slot for another location
      ret_cd = 4 means index.html displays a message indicating past dates can't be changed
      ret_cd = 5 indicates a database error
      
      The #cd at the end is the $_POST["code"]
   */
    $cd = $_POST["code"];

    // code takes the form of ringerIdofCaller:slot:location:date:idOfRingerScheduled
    // (i.e. 31:2:3:2015-11-31:4 means ringer 31 at 11 AM ~ 12 Noon at King Soopers on 11/31/2015 and ringer 4 has slot
    // If idOfRingerScheduled = 0 then nobody is scheduled for that slot
    list($callingRinger, $slot, $location, $dt, $scheduledRinger) = explode(":", $cd);

    // first check to see the date is not in the past. We don't need database for this
    $currDt = new DateTime();
    $currDt = $currDt->format('Y-m-d');
    if ($dt < $currDt)
    {
        echo "4#A timeslot in the past can not be changed #$cd";
        return;
    }

    // for the rest we need the database
    require_once 'inc/db_connect.php';

    // see if somebody else is occuping the slot
    $sql = "select * from schedule where dt = ? and slot = ? and location = ?";
    $query = $dbh->prepare($sql);
    $query->execute(array($dt, $slot, $location));
    $row = $query->fetch();
    if ($query->rowCount() != 0)
    {
        if ($row["ringer"] == $callingRinger)
        {
            echo "0#Are you sure you want to remove yourself from this slot#$cd" ;
            return;
        }
        else
        {
            echo "1#This slot is already occupied#$cd";
            return;
        }
    }

    // now see if the ringer occupies any location in the date and time
    $sql = "select * from schedule where ringer = ? and dt = ? and slot = ?";
    $query = $dbh->prepare($sql);
    $query->execute(array($callingRinger, $dt, $slot));
    $row = $query->fetch();
    if ($query->rowCount() != 0)
    {
        echo  "3#You have already registered for another location in this same time period#$cd";
        return;
    }

    list ($ret_cd, $msg) = explode("#", checkForSlotConflict($callingRinger, $slot, $dt, $dbh));
    switch ($ret_cd)
    {
       case "2" : echo "2#Are you sure you want to register for this slot#$cd"; return;
       case "3" : echo "3#You have already registered for another location in this same time period#$cd"; return;
       case "4" : echo "4#A database error has occurred\n $msg#$cd"; return;
       default  : echo "4#HELP  Something is bad\n $msg#$cd"; return;
    }


    // returns "2#0" if there is no conflict, returns "3#0" if  $callingRinger at $slot and $date, returns "4#errorMsg" if sql error
    function checkForSlotConflict($callingRinger, $slot, $dt, $dbh)
    {
      try
      {
         $sql = "select ringer from schedule where ringer = ? and slot = ? and dt = ?" ;
         $query = $dbh->prepare($sql);
         $query->execute(array($callingRinger, $slot, $dt));
         if ($query->rowCount() <> 0)
             return "3#0";  // you're in date/slot at another location
         else
             return "2#0";  // you're not in this date/slot at all
      }
      catch (PDOException $ex)
      {
        return "4#" . $e->getMessage();
      }
   }
?>
