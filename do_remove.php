<?php

    $cd = $_POST["code"];

    list($callingRinger, $slot, $location, $dt, $scheduledRinger) = explode(":", $cd);

require_once 'inc/db_connect.php';

     try
      {
        $sql = "delete from schedule where dt = ? and slot = ? and ringer = ? and  location = ?";
        $query = $dbh->prepare($sql);
        $query->execute(array($dt, $slot, $callingRinger, $location));
      }
      catch (Exception $ex)
      {
            echo $ex->getMessage();
            return;
      }

      echo "Removal suceeded";
      return;

?>