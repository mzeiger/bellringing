<?php

    $cd = $_POST["code"];

    list($callingRinger, $slot, $location, $dt, $scheduledRinger) = explode(":", $cd);

require_once 'inc/db_connect.php';

 try
  {
    $sql = "insert into schedule (dt, slot, ringer, location) values (?, ?, ?, ?)";

    $query = $dbh->prepare($sql);
    $query->execute(array($dt, $slot, $callingRinger, $location));
  }
  catch (Exception $ex)
  {
        $msg = $ex->getMessage();
        echo "Sorry but this slot must have been recently selected";
        return;
  }

  echo "Registration suceeded";
  return;

?>