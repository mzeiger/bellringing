<?php

    require_once 'inc/db_connect.php';

    try {

        $type = $_REQUEST["type"] ;

        switch ($type) {
            case "location" :
                $sql = "select id, location_name from locations";
                $query = $dbh->prepare($sql);
                $query->execute();
                $results = $query->fetchAll(PDO::FETCH_ASSOC) ;
                echo json_encode($results);
                break;

            case "ringer" :
                $sql = $sql = "select id, lname, fname from ringers order by lname";
                $query = $dbh->prepare($sql);
                $query->execute();
                $results = $query->fetchAll(PDO::FETCH_ASSOC) ;
                echo json_encode($results);
                break;

            case "slot" :
                $sql = "select id, time from timeslots order by id";
                $query = $dbh->prepare($sql);
                $query->execute();
                $results = $query->fetchAll(PDO::FETCH_ASSOC) ;
                echo json_encode($results);
                break;

            case "change" :
                change($dbh, $_REQUEST) ;
                break;

            case "startend" :
                $sql = "select start_dt, end_dt from administration";
                $query = $dbh->prepare($sql);
                $query->execute();
                $results = $query->fetchAll(PDO::FETCH_ASSOC) ;
                echo json_encode($results);
                break;
        }


    }
    catch(Exception $ex){
        echo $ex->getMessage();
    }

?>