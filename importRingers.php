<?php

/*
The input file must be a tab-delimited file:
fname \t lname \t email \t phone \t plain text password \t date \t endoced time \t location code <eol>
 */

//require_once 'inc/db_connect_for_import.php';

function insert_ringer_and_schedule($array, $dbh)
{
      try {
        $sql = "select * from ringers where email = ?";
        $query_ringers = $dbh->prepare($sql);
        $query_ringers->execute(array($array[2]));
        $row = $query_ringers->fetch(PDO::FETCH_ASSOC);
        if (!$row) {
            $hashed_pwd = password_hash($array[4], PASSWORD_DEFAULT);
            $sql = "insert into ringers (fname, lname, email, phone, password, Comments) values (?, ?, ?, ?, ?, ?)";
            $query = $dbh->prepare($sql);
            $query->execute(array($array[0], $array[1], $array[2], $array[3], $hashed_pwd, ""));
        }
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
    $time_id = getSlot($array[6]);

    try {
        $sql = "insert into schedule (dt, slot, ringer, location) values (?, ?, ?, ?)";
        $stmt = $dbh->prepare($sql);
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


    $userName="monumen8_bellrg";
    $DBpwd="Tango_32";
try {


    $dbh = new PDO("mysql:host=localhost;dbname=monumen8_bellringing", $userName, $DBpwd);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo $e->getMessage();
    return;
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
        $row = $query_in_ringers->fetch(PDO::FETCH_ASSOC);
        $sql_in_schedule = "select * from schedule where dt = ? and slot = ? and location =?";
        $query_in_schedule_stmt = $dbh->prepare($sql_in_schedule);
        $slot = getSlot($array[6]);
        $query_in_schedule_stmt->execute(array($array[5], $slot,  $array[7]));
        $row_schedule = $query_in_schedule_stmt->fetch(PDO::FETCH_ASSOC);
        if ($row_schedule)
        {
            $sql = "delete from schedule where dt = ? and slot = ? and ringer = ? and location = ?";
            $stmt = $dbh->prepare($sql);
            $stmt->execute(array($row_schedule['dt'], $row_schedule['slot'], $row_schedule['ringer'], $row_schedule['location']));
        }
            insert_ringer_and_schedule($array, $dbh);
            $sql = "select * from ringers where email = ?";
            $query = $dbh->prepare($sql);
            $query->execute(array($email));
            $row = $query->fetch(PDO::FETCH_ASSOC);
            insert_schedule($array, $dbh, $row);

    }
} catch (Exception $e)   {
    echo  $e->getMessage();
}

function getSlot($timeCode) {
     switch ($timeCode)
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
        case 6: $time_id = 900;
            break;
        case 9:$time_id = 50;
            break;
    }
    return $time_id;
}

?>