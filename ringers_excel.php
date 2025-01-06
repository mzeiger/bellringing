<?php

require_once 'inc/db_connect.php';

 try
  {
    $sql = "select lname, fname, email, phone from ringers ";
    $sql .= "where id in (select ringer from schedule) order by lname, fname";

      $query = $dbh->prepare($sql);

    $query->execute();
   // $roster = $query->fetchAll(PDO::FETCH_ASSOC) ;
    $x = "";
    $colCount = $query->columnCount();
    for ($i = 0; $i < $colCount; $i++) {
        $col = $query->getColumnMeta($i);
        $x  .=  $col['name'] . "\t";
    }
    $x .= "\r\n";

   while ($roster = $query->fetch())    {

        for ($i = 0; $i < $colCount; $i++) {
            $x .= $roster[$i] . "\t";
        }
        $x .= "\r\n";
   }
   header('Content-Type: application/force-download');
   header('Content-disposition: attachment; filename=ringers_excel.xls');
   // Fix for crappy IE bug in download.
   header("Pragma: ");
   header("Cache-Control: ");
   echo $x;

  }
  catch (Exception $ex)
  {
        $msg = $ex->getMessage();
        echo $msg;
        return;
  }

?>