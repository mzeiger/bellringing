<?php

require_once "password.php";

$pwd = $_GET["pwd"];
$pwd = "x";
$hashed_password = password_hash($pwd, PASSWORD_BCRYPT);
echo "Hashed password = " . $hashed_password . "<br/>";

if (password_verify($pwd, $hashed_password))
   echo $pwd . " Password verified!<br/>";
else
   echo $pwd . " not verified<br/>";


$pwd = "y";
if (password_verify($pwd, $hashed_password))
   echo "$pwd Password verified!<br/>";
else
   echo "$pwd not verified<br/>";

?>
