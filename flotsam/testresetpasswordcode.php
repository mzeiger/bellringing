<?php   // testresetpasswordcode.php

    $email = $_POST["forgotPasswordEmailInput"];
    $cd = $_POST["changePasswordIdCode"];


require_once 'inc/db_connect.php';

 try
  {
    $sql = "select * from ringers where email = ? and forgot_pwd_code = ?";

    $query = $dbh->prepare($sql);
    $query->execute(array($email, $cd));
    $row = $query->fetch();
    if ($query->rowCount() != 1)
    {
      echo "Invalid";    // The word "Email" must come first to signal bad email
      return;
    }
    else
    {
        echo "Valid";
        return;
    }
  }
  catch (Exception $ex)
  {
        echo $ex->getMessage();
        return;
  }


?>