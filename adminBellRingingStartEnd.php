<?php

    require_once 'inc/db_connect.php';

    try {
        $startDate = $_REQUEST["startDate"];
        $endDate = $_REQUEST["endDate"] ;

        $sql = "update administration set start_dt = ?, end_dt = ?";
        $query = $dbh->prepare($sql);
        $query->execute(array($startDate, $endDate));
        echo "Start and end dates changed successfully";
    }
    catch (exception $ex) {
        echo $ex->getMessage();
    }

?>