<!DOCTYPE HTML>

<html>

<head>

<title>Empty Bell Ringing Slots</title>


<style>
    table {
        margin-left: 20%;
        border-collapse: collapse;
    }

     table td {
         border: 1px solid black;
         padding: 5px;
     }

     p {
         text-align: center;
     }
     .red {
         color: red;
     }
     td {
     padding-left: 5px;
     padding-right: 5px;
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

$ringDate = $_REQUEST["ringDate"];
$location = $_REQUEST["location"];

echo slotsForDayAndLocation($dbh, $ringDate, $location);
//echo $rv;

function slotsForDayAndLocation($dbh, $ringDate, $location) {
    try {
        $sql = "select id, time from timeslots order by id";
        $query = $dbh->prepare($sql);
        $query->execute();
        $arrayTimeslots = [];
        while ($timeslots = $query->fetch(PDO::FETCH_BOTH)) {
            array_push($arrayTimeslots, $timeslots);
        }
//print_r($arrayTimeslots); echo lb . lb .lb;
//echo = lb . lb . lb;
//echo  $arrayTimeslots[5]['time'];  $returnString =  lb . lb .lb;

        $sql = "select id, location_name from locations order by id";
        $query = $dbh->prepare($sql);
        $query->execute();
        $arrayLocations = [];
        while ($locations = $query->fetch(PDO::FETCH_BOTH)) {
            array_push($arrayLocations, $locations);
        }
//print_r($arrayLocations); echo  lb . lb . lb;
//echo  (int)$location .lb;
//echo  $arrayLocations[300]['id'];   echo lb . lb .lb;
        $loc_name = '';
        foreach ($arrayLocations as $loc) {
            if ($loc['id'] == (int) $location) {
                $loc_name = $loc['location_name'];
            }

        }
//echo $loc_name . lb .lb;

// Query will be passed to function showAllSlots
        $sql = "SELECT * FROM v_schedule_with_phone where dt = ? and location = ? and slot=?";
        $query = $dbh->prepare($sql);


        return showAllSlots($query, $ringDate, $location, $arrayTimeslots, $loc_name);

//return $returnString;
    } catch (exception $ex) {
        echo $ex->getMessage();
    }
}

function showAllSlots($query, $ringDate, $location, $arrayTimeslots, $loc_name) {
//echo "entering function 2" . lb;
//print_r($arrayTimeslots); echo  'is $arrayTimeslots' . lb . lb;
//echo "<b>Time slots for " . $ringDate . "</b><br/>";

    $rd = new DateTime($ringDate);
    try {
        $returnString = "<div>";

        $returnString .= "<table><tr>";
        $returnString .= "<td colspan='4'><b>Time slots for " . $loc_name . ' on ' . $rd->format('l, F j, Y') . "</td></b>";
        $rowString = "";
        foreach ($arrayTimeslots as $timeslot) {
//echo  $timeslot['id'] . lb;
//echo    $ringDate .spaces . $location . spaces . $timeslot['time'] .spaces . $timeslot['id'] . lb;
            $theArray = array($ringDate, (int) $location, $timeslot['id']);
//print_r($theArray); echo  'is the array' . lb;
            $query->execute($theArray);

            $slotFromView = $query->fetch(PDO::FETCH_ASSOC);
//echo  $query->rowCount();
//print_r($slotFromView); echo  ' is slot' . lb;
            if ($query->rowCount() != 0) {

                $ringerName = sprintf("<td>%s</td><td>%s</td><td>%s</td>", $timeslot['time'],
                    $slotFromView['fname'] . " " . $slotFromView['lname'], $slotFromView['phone']);
            } else {
                $ringerName = sprintf("<td>%s</td><td>%s</td><td>%s</td>",
                    $timeslot['time'], "<span class='red'>Empty</span>", "");
            }

            $rowString .= "<tr>";
            $rowString .= $ringerName;
            $rowString .= "</tr>";

        }

        $returnString .= $rowString . "</table></div>" . lb . lb;

        return $returnString;

    } catch (exception $ex) {
        echo $ex->getMessage();
    }
}

?>
</body>
</html>
