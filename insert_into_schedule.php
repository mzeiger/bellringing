<?php

    $cd = $_POST["code"];

    // code takes the form of ringerIdofCaller:slot:location:date:idOfRingerScheduled
    // (i.e. 31:2:3:2015-11-31:4 means ringer 31 at 11 AM ~ 12 Noon at King Soopers on 11/31/2015 and ringer 4 has slot
    // If idOfRingerScheduled = 0 then nobody is scheduled for that slot
    list($callingRinger, $slot, $location, $dt, $scheduledRinger) = explode(":", $cd);
   // echo "callingRinger = $callingRinger, slot = $slot, location = $location, date = $dt, scheduledRinger = $scheduledRinger" ;

    if ($callingRinger == $scheduledRinger)
    {
        echo "0#Are you sure you want to remove yourself from this slot#$cd" ;
    }
    else if ($scheduledRinger != 0)
    {
        echo "1#This slot is already occupied#$cd";
    }
    else
    {
        echo "2#Are you sure you want to register for this slot#$cd";
    }
?>