
<?php
	header( "Content-Type: application/vnd.ms-excel" );
    // Can not use xlsx as a file extension
	header( "Content-disposition: attachment; filename=BellRingingCounts.xls" );

	// print your data here. note the following:
	// - cells/columns are separated by tabs ("\t")
	// - rows are separated by newlines ("\n")

	// for example:
	// echo 'First Name' . "," . 'Last Name' . "," . 'Phone' . "\n";
	// echo 'John' . "," . 'Doe' . "," . '555-5555' . "\n";

    require_once 'inc/db_connect.php';

    $sql = "select fname, lname, email, count(0) AS Count from v_schedule ";
    $sql .= "group by ringer order by count(0) desc, lname";
    try
    {
        $query = $dbh->prepare($sql);
        $query->execute();
        //$query->bind_result($date, $day, $name, $time, $location);
        echo "Last Name\tFirst Name\tEmail\tCount\n";
        $str = "";
        while ($row = $query->fetch())
        {
           $str = $str . sprintf("%s\t%s\t%s\t%s\n", $row[1], $row[0], $row[2], $row[3]);
        }

        echo $str;
    }
    catch (Exception $ex)
    {
        echo "Error Ocurred: " . $ex->getMessage();
        return;
    }

?>