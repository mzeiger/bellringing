<?php

    require_once 'inc/db_connect.php';

    try {
        $date = $_GET["dateNM"];
        $locationId = $_GET["locationNM"];
        $slotId = $_GET["slotNM"];
        $ringerId = $_GET["ringerNM"];
        $locationId += isset($_GET["secondaryLocNM"]) ? 40 : 0;
        $sql = "select * from v_schedule where dt = ? and slot = ? and location = ?";
        $query = $dbh->prepare($sql);
        $query->execute(array($date, $slotId, $locationId));
        $row = $query->fetch() ;
       
        if ($ringerId == 0)
            $delete = true;
        else
            $delete = false;

        if ($query->rowCount() == 0) {
           $sql = "select fname, lname from ringers where id = ?";
           $query = $dbh->prepare($sql);
           $query->execute((array($ringerId)));
           $row = $query->fetch();
           $firstName = $row["fname"] ;
           $lastName = $row["lname"];
           $sql = "select location_name from locations where id = ?";
           $query = $dbh->prepare($sql);
           $query->execute(array($locationId));
           $row = $query->fetch();
           $locationName = $row["location_name"];
           $sql  = "select time from timeslots where id = ?";
           $query = $dbh->prepare($sql);
           $query->execute(array($slotId));
           $row = $query->fetch();
           $timeName = $row["time"];
           insertIntoSchedule($dbh, $date, $locationId, $slotId, $ringerId, $firstName, $lastName, $locationName, $timeName) ;
        }
        else {
            if ($delete) {
                $sql = "delete from schedule where slot = ? and location = ? and dt = ?";
                $query = $dbh->prepare($sql);
                $query->execute(array($slotId, $locationId, $date));
                echo "Time slot has been deleted" ;
            }
            else {
                $sql ="update schedule set ringer = ? where slot = ? and location = ? and dt = ?";
                $query = $dbh->prepare($sql);
                $query->execute(array($ringerId, $slotId, $locationId, $date));
                echo sprintf("Ringer has been changed");
            }
        }
    }
    catch (Exception $ex) {
        echo $ex->getMessage();
    }

    function insertIntoSchedule($dbh, $date, $locationId, $slotId, $ringerId, $firstName, $lastName, $locationName, $timeName) {
        try {
            $sql = "insert into schedule (`dt`, `slot`, `ringer`, `location`) VALUES (?, ?, ?, ?)";
            $query = $dbh->prepare($sql);
            $query->execute(array($date, $slotId, $ringerId, $locationId)) ;
            echo sprintf("%s %s has been scheduled at %s on %s from %s", $firstName, $lastName, $locationName,
                $date, $timeName);
        }
        catch (Exception $ex)
        {
            echo $ex->getMessage();
        }
    }

?>