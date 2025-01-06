<!DOCTYPE HTML>

<html>
    <head>
        <title>Ringer Counts</title>

        <style type="text/css">

        div {
            display: flex;
            flex-direction: column;

        }

        table {
           align-self: center;
        }

        table td {
             border: 1px solid;
             padding: 5px;
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

    $dtStr = $_POST["asOfDate"];

    $sql = "select fname,lname, email, count(0) AS Count from v_schedule ";
    //$sql .= "where ((dt >= (select start_dt from administration)) and ";
    //$sql .= "(dt <= (select end_dt from administration))) and dt <= ? ";
    $sql .= "group by fname, lname, email order by count(0) desc, lname";

    $year = $year . " ";
    $title = "<div><p style='font-weight:bold;font-size:15pt;align-self:center;'>";
    $title .= $year . "Ringer Counts";
    $title .= "</p></div>";
    echo $title;
    try {

         $str = "<tr><td><b>Last Name</b></td><td><b>First Name Name</b></td><td><b>Email</b></td><td><b>Count</b></td></tr>";
         $dt = new DateTime($dtStr);

         $query = $dbh->prepare($sql);
         $query->execute();
         while ($row = $query->fetch()) {
             $str .= sprintf("<tr> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td></tr>", $row['lname'], $row['fname'], $row['email'], $row['Count']);
            // $str .= "<tr><td>" . $row["Name"] . "</td><td>" . $row["email"] . "</td><td>" . $row["Count"] . "</td></tr>";
         }
         echo '<div><table>' . $str . "</table></div>";
    }
    catch (Exception $ex) {
        echo $ex->getMessage();
    }
?>
    </body>
</html>