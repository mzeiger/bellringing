<?php

// PDO documentation: http://www.phpro.org/tutorials/Introduction-to-PHP-PDO.html

// If needed to be fixed first run: "composer require vlucas/phpdotenv" (no quotes)

try {
    require_once 'vendor/autoload.php';

    $dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
    $dotenv->load();

    $databaseName = $_ENV['DB_DATABASE_NAME'];
    $userName = $_ENV['DB_DATABASE_USER_NAME'];
    $pwd = $_ENV['DB_DATABASE_PASSWORD'];
    $connectionString = sprintf('mysql:host=localhost;dbname=%s', $databaseName);

    $dbh = new PDO($connectionString, $userName, $pwd);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo $e->getMessage();
}

?>