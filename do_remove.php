<?php

    $cd = $_POST["code"];
    $oldCode = $cd;

    list($callingRinger, $slot, $location, $dt, $scheduledRinger) = explode(":", $cd);

require_once 'inc/db_connect.php';
require_once 'inc/pusher_notify.php';

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
      $socketId = isset($_POST['socket_id']) ? trim($_POST['socket_id']) : null;
      notifyScheduleChange($oldCode, $newCode, "", $callingRinger, $socketId);
      echo "success#Removal suceeded#$newCode#";
      return;

?>