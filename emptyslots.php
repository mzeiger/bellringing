<!DOCTYPE HTML>

<html>

<head>

<title>Empty Bell Ringing Slots</title>


<style>
    table {
        margin-left: 20%;
    }

     table td {
         border: 1px solid black;
         padding: 5px;
     }

     p {
         text-align: center;
     }

</style>

</head>

<body>

<?php

define("lb", "<br/>");
define("tab", "---- ");
define("dtab", "-------- ");
define("spaces", "   ");
define("arrow", " ===> ");

require_once 'inc/db_connect.php';

// first get start and end date of project

$start_dt = $_POST["start_dt"];
$end_dt = $_POST["end_dt"];

$sql = "select id, location_name from locations order by id";
$query = $dbh->prepare($sql);
$query->execute();
$arrayLocations = [];
while ($locations = $query->fetch(PDO::FETCH_BOTH)) {
    array_push($arrayLocations, $locations);
}

// id 50 is the 9 AM slot. 900 is the $$ pickup slot
$sql = "select * from timeslots where id != 900 order by id";
$query = $dbh->prepare($sql);
$query->execute();

$arrayTimeslots = [];
while ($timeslots = $query->fetch(PDO::FETCH_BOTH)) {
    array_push($arrayTimeslots, $timeslots);
}

$sql = "SELECT DATE_FORMAT(active_ringing_day,'%Y-%m-%d') as active_date FROM ringing_days";
$query = $dbh->prepare($sql);
$query->execute();

$arrayRingingDays = [];
while ($ringingDays = $query->fetch(PDO::FETCH_BOTH)) {
    array_push($arrayRingingDays, $ringingDays['active_date']);
}

// Query will be passed to function showEmpty
$sql = "SELECT * FROM v_schedule where dt = ? and location = ? and slot = ? order by dt";
$query = $dbh->prepare($sql);

showEmptySlots($query, $start_dt, $end_dt, $arrayLocations, $arrayTimeslots, $arrayRingingDays);

$query = null;
$dbh = null;

return;

function showEmptySlots($query, $startDt, $endDt, $locations, $timeslots, $arrayRingingDays) {

    $date = new DateTime($startDt);

    $end_date = new DateTime($endDt);

    $last_date = new DateTime('0000-00-00');

    while ($date <= $end_date) {
        if (in_array($date->format('Y-m-d'), $arrayRingingDays)) {
            echo "<div><table>";
            echo "<td colspan='2'><b>Empty time slots for " . $date->format('D m-d-Y') . "</b></td>";
            echo "</tr>";

            $counts = 0;

            foreach ($locations as $location) {

                foreach ($timeslots as $timeslot) {

                    $query->execute(array($date->format('Y-m-d'), $location['id'], $timeslot['id']));
                    // There can only be one row with a date, slot, and location
                    // so "fetch" is okay!!!
                    $slotFromView = $query->fetch(PDO::FETCH_ASSOC);

                    if ($query->rowCount() == 0) {

                        if ($last_date->format('m-d-Y') != $date->format('m-d-Y')) {
                            $last_date = $date;
                        }

                        echo "<tr>";
                        echo "<td>" . $location['location_name'] . "</td><td>" . $timeslot['time'] . "</td>";
                        echo "</tr>";
                        $counts++;
                    }
                }
            }

            if ($counts == 0) {

                echo "<tr><td colspan='2'><p>No empty time slots</p></td></tr>" . lb;

            }
            echo "</table></div>" . lb;

        }
        $date->add(new DateInterval('P1D'));
    }

}

?>
</body>
</html>