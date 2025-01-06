
<?php
	header( "Content-Type: application/vnd.ms-excel" );
	header( "Content-disposition: attachment; filename=BellRingingSchedule.cvs" );

	// print your data here. note the following:
	// - cells/columns are separated by tabs ("\t")
	// - rows are separated by newlines ("\n")

	// for example:
	echo 'First Name' . "," . 'Last Name' . "," . 'Phone' . "\n";
	echo 'John' . "," . 'Doe' . "," . '555-5555' . "\n";
?>
