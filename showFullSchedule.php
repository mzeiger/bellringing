<!DOCTYPE HTML>

<html>

    <head>
        <title>Individual Schedule</title>

        <style type="text/css">

            div {
                display:flex;
                flex-direction: column;
                align-self: center;
            }

            .aligncenter {
                align-self: center;
            }

            table {
                align-self: center;
                border: solid 1px;
                border-collapse: collapse;
            }

            td, th {
                border: solid 1px;
                padding: 5px;
            }

        </style>
    </head>

<body>
  <div>
<?php

$ringerId = $_GET["rgrid"];

require_once 'inc/db_connect.php';

$sql = $sql = "SELECT `Date`, `Day`, `Name`, `Time`, `Location` from v_individual_schedule where ringer = ?";
try
{
    $query = $dbh->prepare($sql);
    $query->execute(array($ringerId));
    //$query->bind_result($date, $day, $name, $time, $location);
    $str = "<table><tr><th>Date</th><th>Day</th><th>Time</th><th>Location</th></tr>";
    $getName = true;
    $fullName = "";

    while ($row = $query->fetch()) {
        $str = $str . sprintf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>", date_format(date_create($row[0]), "M-d-Y"), $row[1], $row[3], $row[4]);
        if ($getName) {
            $fullName = $row[2];
            $getName = false;
        }
    }
    $str = $str . "</table>";
    echo "<h2 class='aligncenter'>Full Schedule for " . $fullName . "</h2><br/><br/>";
    echo $str;
} catch (Exception $ex) {
    echo "Error Ocurred: " . $ex->getMessage();
    return;
}

?>
        </div>
      </body>
</html>