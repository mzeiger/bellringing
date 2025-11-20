<?php   // dopasswordreset.php - checks time and then resets password and database fields pertaining to "forgot password
        //                       if time is within 5 minutes of forgot_pwd_time

require_once "inc/password.php";
require_once 'inc/db_connect.php';

    $email = $_POST["forgotPasswordEmailInput"];
    $cd  = $_POST["changePasswordIdCode"];
    $newPwd = $_POST["newPassword"];
    $hashedPwd = password_hash($newPwd, PASSWORD_BCRYPT);

 try
  {
    // first extract forgot_pwd_time  and see if it's within 5 minutes of current time
    $sql = "select forgot_pwd_time from ringers where email = ? and forgot_pwd_code = ?";
    $query = $dbh->prepare($sql);
    $query->execute(array($email, $cd));
    if ($query->rowcount() == 1)
    {
        $row = $query->fetch();
        $forgot_pwd_time = new DateTime($row["forgot_pwd_time"]);
        $current_time = new DateTime();
        if (  abs(($forgot_pwd_time->getTimestamp() - $current_time->getTimestamp())/60) > 5.5  )
        {
            echo "Password code has expired. Try again!";
            return;
        }
        else
        {
            $sql = "update ringers set password = ?, forgot_pwd_code = null, forgot_pwd_time = null where email = ? and forgot_pwd_code = ?";
            $query = $dbh->prepare($sql);
            $query->execute(array($hashedPwd, $email, $cd));
            echo "Password updated";
            return;
        }
    }
    else
    {
        echo "An unknown error has occured";
        return;
    }
  }
  catch (Exception $ex)
  {
      echo $ex->getMessage();
      return;
  }

?>