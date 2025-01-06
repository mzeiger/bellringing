<?php

      $date1 = $_GET["date1"];
      $date2 = $_GET["date2"];


      echo $date1 . "<br/>" . $date2 . "<br/>";

      $d1 = new DateTime($date1);
      //$d2 = new DateTime($date2);
      $d2 = new DateTime();
      echo $d1->format("m-d-Y h:i:s") . "<br/>" . $d2->format("m-d-Y h:i:s") . "<br/>";
      //$interval = $d1->diff($d2);
/*      echo $interval->y . " years "  . $interval->m . " months "  .
           $interval->d . " days " . $interval->h . " hours "  .
           $interval->i . " minutes "  . $interval->s . " seconds ";*/
           echo $d1->getTimestamp() . " - " . $d2->getTimestamp() . "<br/>";
           echo ($d1->getTimestamp() - $d2->getTimestamp())/60;
?>