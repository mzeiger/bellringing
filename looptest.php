<?php


    require_once 'inc/db_connect.php';

    $sql = "select * from locations";  // "select id, location_name from locations";
    $query = $dbh->prepare($sql);
    $query->execute();
    $results = $query->fetchAll(PDO::FETCH_ASSOC) ;

    foreach ($results as $result) {
       echo $result["location_name"];
        echo  "<br/>";
    }
?>