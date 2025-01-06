<?php

/*
The input file must be a tab-delimited file:
fname lname \t email \t phone \t plain text password \t date \t endoced time <eol>
 */

require_once 'inc/db_connect.php';

function insert_ringer_and_schedule($array, $dbh)
{
      try {
        $hashed_pwd = password_hash($array[4], PASSWORD_DEFAULT);
        $sql = "insert into ringers (fname, lname, email, phone, password) values (?, ?, ?, ?, ?)";
        $query = $dbh->prepare($sql);
        $query->execute(array($array[0], $array[1], $array[2], $array[3], $hashed_pwd));
        $LastID = $dbh->lastInsertId();
        // echo "Last id = " . $LastID . "\n";
    }
    catch (Exception $e)
    {
        echo "error in insert_ringer_and_schedule: " . $e->getMessage() . "\n";
    }
}

function insert_schedule($array, $dbh, $row)
{
    // echo "ID = " . $row['id'] . "  " . $row['lname'] . "\n";
    // echo "time encoded = " . $array[6] . "\n";
    switch ($array[6])
    {
        case 10:$time_id = 100;
            break;
        case 11:$time_id = 200;
            break;
        case 12:$time_id = 300;
            break;
        case 1:$time_id = 400;
            break;
        case 2:$time_id = 500;
            break;
        case 3:$time_id = 600;
            break;
        case 4:$time_id = 700;
            break;
        case 5:$time_id = 800;
            break;
        case 9:$time_id = 50;
            break;
    }
    try {
        $sql = "insert into schedule (dt, slot, ringer, location) values (?, ?, ?, ?)";
        $stmt = $dbh->prepare($sql);
        // location for TLWC is always Walmart West which has location id 200
        $stmt->execute(array($array[5], $time_id, $row['id'], $array[7]));
        return;
    }
    catch (Exception $e)
    {
        echo "error insert_schedule: " . $e->getMessage() . "\n";
    }
}

// Main

if (count($argv) < 2) {
    die("No tab-delimited text file was specified\n");
}
$tabSeparatedTextFile = $argv[1];
$file = fopen($tabSeparatedTextFile, "r") or die("Unable to open input file " . $tabSeparatedTextFile . "\n");
try {
    $line = fgets($file); // get rid of header
    while ($line = fgets($file))
    {
        if (trim($line) == "") {
            continue;
        }
        $array = explode("\t", rtrim($line));
        $email = $array[2];
        $sql_in_ringers = "select * from ringers where email = ?";
        $query_in_ringers = $dbh->prepare($sql_in_ringers);
        $query_in_ringers->execute(array($email));
        $rc = $query_in_ringers->rowCount();
        // echo "row count = " . $rc . "\n";
        if ($rc == 0)
        {
            insert_ringer_and_schedule($array, $dbh);
            $sql = "select * from ringers where email = ?";
            $query = $dbh->prepare($sql);
            $query->execute(array($email));
            $row = $query->fetch(PDO::FETCH_ASSOC);
            insert_schedule($array, $dbh, $row);
        }
        else
        {
            $row = $query_in_ringers->fetch(PDO::FETCH_ASSOC);
            insert