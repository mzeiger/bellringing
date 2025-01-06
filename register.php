<?php //register.php for BellRinging project

require_once "inc/password.php";
require_once 'inc/db_connect.php';

  $fname = ucfirst(rtrim(ltrim($_POST["fname"])));
  $lname = ucfirst(rtrim(ltrim($_POST["lname"])));
  $email = strtolower(rtrim(ltrim($_POST["email"])));
  $pwd = rtrim(ltrim($_POST["pwd"]));
  $hashed_pwd = password_hash($pwd, PASSWORD_DEFAULT);
  $phone = rtrim(ltrim($_POST["phone"]));

 try
  {
    $sql = "insert into ringers (fname, lname, email, password, phone) values (?, ?, ?, ?, ?)";

    $query = $dbh->prepare($sql);
    $query->execute(array($fname, $lname, $email, $hashed_pwd, $phone));
  }
  catch (Exception $ex)
  {
        echo "Email address <em><u>" . $email . "</u></em> is in use";
        return;
  }
      echo "Registration suceeded";
      return;
?>


