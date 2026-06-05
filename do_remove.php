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
            echo "error#" . $ex->getMessage();
            return;
      }

      $newCode = sprintf("%s:%s:%s:%s:0", $callingRinger, $slot, $location, $dt);
      echo "success#Removal suceeded#$newCode#";
      return;

?>