<?php  // forgotpassword.php - sets the password reset code and expire time and returns code in email. Does not actuall reset passward.
       // Actual reset occurs in dopasswordreset.php

   $email = $_POST["forgotPasswordEmailInput"];

require_once 'inc/db_connect.php';

 try
  {

    $sql = "select * from ringers where email = ?";
    $query = $dbh->prepare($sql);
   // $query->execute(array($email, $hashed_pwd));
    $query->execute(array($email));
    $row = $query->fetch();
    if ($query->rowCount() != 1)
    {
      echo "Email not found";    // The word "Email" must come first to signal bad email
      return;
    }
    else
    {
        echo "";
        flush();
        $forgot_pwd_code = mt_rand(10000000001, 99999999999);
        $currentTime = new DateTime();

        $sql2 = "update ringers set forgot_pwd_code = ?, forgot_pwd_time = ? where email = ?";
        $query2 = $dbh->prepare($sql2);
        $query2->execute(array($forgot_pwd_code, $currentTime->format('Y-m-d H:i:s'), $email));

        $to = $email;
        $subject = sprintf("Bell ringing password reset");
        $header = "From:noreply-bellringing@monumenthillkiwanis.org \r\n";
        $header .= "MIME-Version: 1.0\r\n";
        $header .= "Content-type: text/html\r\n";
        $msg = sprintf("<h3>Your password reset code is </h3><h1>%s</strong></h1>", $forgot_pwd_code);
        $msg .= "<br/>Copy this code and paste it into the open dialog in the Bellringing site.";
        $msg .= "<br/><h3>This code will expire in 5 minutes</h3>";
        $msg .= "<br/><br/><i>Please do not reply to this email. It has been sent from an unmonitored mailbox</i>";
        $retval = mail ($to,$subject,$msg,$header);
    }

  }
  catch (Exception $ex)
  {
        //echo '<p style="color:red">Email address <em><u>' . $email . "</u></em> is in use";
        echo $ex->getMessage();
        return;
  }
?>