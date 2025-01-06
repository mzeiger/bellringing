<?php

if (count($argv) < 2) {
    die("No password was specified\n");}
$plainTextPwd = $argv[1];
$hashed_pwd = password_hash($plainTextPwd, PASSWORD_DEFAULT);
echo $hashed_pwd;

?>