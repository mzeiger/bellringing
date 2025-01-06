<!DOCTYPE HTML>

<html>

<head>
  <title>Bell Ringers</title>

  <style>

    body {
        display:flex;
        flex-direction: column;
    }

    div {
        align-self: center;
    }

    table {
        border-collapse: collapse;
        align-self: center;
    }

    td, th  {
        border: 1px solid;
        padding-left: 5px;
        padding-right: 5px;
        padding-top: 2px;
        padding-bottom: 2px;
    }

    tr:nth-child(even) {
      background-color: #DDDDDD;
    }

    tr:hover {
        background-color: #C0C0C0;
    }

    html body {
        width: 100%;
    }

    p {
        align-self: center;
        text-align: center;
        font-weight: bold;
        font-size: 20pt;
    }

  </style>

</head>

<body>

<?php

require_once 'inc/db_connect.php';

 try
  {
    $yearSQL = "select year(MIN(active_ringing_day)) from ringing_days";
    $yearQuery = $dbh->prepare($yearSQL);
    $yearQuery->execute();
    $yearArray = $yearQuery->fetch();
    $year = $yearArray[0];

    $sql = "select fname, lname, email, phone, id, administrator, Comments from ringers ";
    $sql .= "where id in (select ringer from schedule) order by lname, fname";

    $query = $dbh->prepare($sql);

    $query->execute();
    $roster = $query->fetchAll(PDO::FETCH_ASSOC) ;
    //print json_encode($roster);

    // $year = date("Y");
    $title = "<p>" .  $year . " Scheduled Ringers" . "</p>";

    $txt = '<div>';
    $txt .= $title;
    $txt .= '<table>';
    $txt .= '<tr><th>Last Name</th><th>First Name</th><th>Email</th><th>Phone</th></tr>';
    foreach( $roster as $person) {
          $txt .= '<tr>';
          $txt .= sprintf('<td>%s</td>', $person['lname']);
          $txt .= sprintf('<td>%s</td>', $person['fname']);
          $txt .= sprintf('<td style="text-align: left"><a href=mailto:">%s</a></td>', $person['email']);
          $txt .= sprintf('<td>%s</td>', $person['phone']);
          // $txt .= sprintf('<td style="text-align: center">%s</td>', $person['administrator']);
          $txt .= '</tr>';
    }
    $txt .= '</table>';
    $txt .= '</div>';
    echo $txt;

  }
  catch (Exception $ex)
  {
        $msg = $ex->getMessage();
        echo $msg;
        return;
  }


?>
</body>

</html>