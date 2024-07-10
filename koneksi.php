<?php
$username = "root";
$password = "";
$database = "jago3";

try {
    $pdo = new PDO("mysql:host=localhost;dbname=$database", $username, $password);
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

 
} catch (PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
  
}
?>

