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
        echo "error#Sorry but this slot must have been recently selected";
        return;
  }

  $nameSql = "select fname, lname from ringers where id = ?";
  $nameQuery = $dbh->prepare($nameSql);
  $nameQuery->execute(array($callingRinger));
  $ringer = $nameQuery->fetch(PDO::FETCH_ASSOC);
  $name = $ringer["fname"] . " " . $ringer["lname"];
  $newCode = sprintf("%s:%s:%s:%s:%s", $callingRinger, $slot, $location, $dt, $callingRinger);
  echo "success#Registration suceeded#$newCode#$name";
  return;

?>