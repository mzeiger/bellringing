<!DOCTYPE HTML>

<html>

<head>
  <title>Bell Ringing Collectors</title>

  <style>

    div {
        margin-left: 20%;
    }

    table {

        border-collapse: collapse;
    }

     table td, th {
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

require_once 'inc/db_connect.php';

$yearSQL = "select year(MIN(active_ringing_day)) from ringing_days";
$yearQuery = $dbh->prepare($yearSQL);
$yearQuery->execute();
$yearArray = $yearQuery->fetch();
$year = $yearArray[0];

$sql = "select * from ringing_days order by active_ringing_day";
$query = $dbh->prepare($sql);
$query->execute();
$arrayRingingDays = [];
while ($ringingDays = $query->fetch(PDO::FETCH_BOTH)) {
    array_push($arrayRingingDays, $ringingDays['active_ringing_day']);
}


$sql = "SELECT dt, location_name, lname, fname, phone  FROM `v_schedule_with_phone` WHERE slot = 900 and location = ? and dt = ?";

$query = $dbh->prepare($sql);

//echo "<div>2023 Money Collectors and Pickup Schedule<br/>";
echo "<div><table>";
echo "<tr><th colspan='4'>" .$year . " Money Collectors and Pickup Schedule</th></tr>" ;
echo "<tr><th>Date</th><th>Day</th><th>Walmart</th><th>King Soopers</th></tr>";
foreach($arrayRingingDays as $dt) {

   showCollectorsOnDay($dt, $query);
}
echo "</table></div>";

return;

function showCollectorsOnDay($dt, $query) {

try {
// Walmart
$query->execute(array(100, $dt));
$walmart = $query->fetch(PDO::FETCH_BOTH);

// King Soopers
$query->execute(array(300, $dt));
$ks = $query->fetch(PDO::FETCH_BOTH);
$timestamp = strtotime($dt);
$walmartName = sprintf("%s %s<br/>%s", $walmart['fname'], $walmart['lname'], $walmart['phone']);
$ksName = sprintf("%s %s<br/>%s", $ks['fname'], $ks['lname'], $ks['phone']);
echo sprintf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>", $dt, date("l", $timestamp), $walmartName, $ksName);

}
catch (exception $ex)
{
    echo $ex->message;
}

}

?>
</body>
</html>