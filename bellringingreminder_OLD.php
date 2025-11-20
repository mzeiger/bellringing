<?php // bellringingreminder.php
// cron job run every day at 6:00 AM to send email to those scheduled for that day
    $dt = new DateTime();
    $dt1 = $dt->format('Y-m-d');
    $dt2 = $dt->format('l, F j, Y'); // Formatted as Wednesday, February 11, 2015
    require_once 'inc/db_connect.php';
    $sql = "select distinct ringer from v_schedule where dt = ? order by ringer";
    try
    {
        $query = $dbh->prepare($sql);
        $query->execute(array($dt1));
        $dailyRingerIds = $query->fetchAll();
        $sql = "select * from v_schedule where dt = ? and ringer = ?";
        $query2 = $dbh->prepare($sql);
        foreach ($dailyRingerIds as $dr)
        {
            $query2->execute(array($dt1, $dr["ringer"]));
            $schedules = $query2->fetchAll();
            sendEmails($schedules, $dt2);
        }

        echo "Bell Ringing Reminder has run successfully on " . $dt2;
    }
    catch (Exception $ex)
    {
        echo "Error Ocurred: " . $ex->getMessage();
        return;
    }

    function sendEmails($schedules, $dt2)
    {
        $msg = "";
        $firstTime = true;
        $i = 1;
        foreach ($schedules as $sch)
        {
            if ($firstTime)
            {
                $msg = sprintf("<h3>Hi %s,<br/><br/>\r\n\r\nOn %s you are scheduled for bell ringing as follows:</h3><ol>\r\n", $sch["fname"], $dt2);
                $firstTime = false;
            }
            $msg .= sprintf("<li><h4>%s at %s</li></h4>\r\n", $sch['location_name'], $sch['interval']);
        }
        $msg .= "</ol>";
        $msg .= "<h2>Thank you for your participation in this important event</h2>.";
        $msg .= "<br/><br/><i>This is an unmonitored mailbox. Please do not reply to this message.</i>";
        $to = $sch["email"];
        $subject = sprintf("Bell ringing schedule for %s", $dt2);
        $header = "From:noreply-bellringing@monumenthillkiwanis.org \r\n";
        $header .= "MIME-Version: 1.0\r\n";
        $header .= "Content-type: text/html\r\n";
        $retval = mail($to, $subject, $msg, $header);
        // echo sprintf("Retval = %s<br/>To = %s<br/>Subject = %s<br/>Msg: %s<br/><br/>", $retval, $to, $subject, $msg);
    }

?>