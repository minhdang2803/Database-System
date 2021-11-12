<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mydb";
// Create connection
$conn = new mysqli($servername, $username, $password);
// Check connection
// if ($conn->connect_error) {
//     die("Connection failed: " . $conn->connect_error);
// }
//Create database
$sql = "CREATE DATABASE IF NOT EXISTS mydb";
$conn->query($sql);
$conn = new mysqli($servername, $username, $password,$dbname);
$sql = "USE mydb";
// sql to create table
$sql = " CREATE TABLE IF NOT EXISTS users (
`id` VARCHAR(250) NOT NULL ,
`name` VARCHAR(250) NOT NULL,
`username` VARCHAR(250) NOT NULL UNIQUE PRIMARY KEY,
`password` VARCHAR(250) NOT NULL
)";

$conn->query($sql);


$sql_2 = "CREATE TABLE IF NOT EXISTS products (
`product_id` INT(11) UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
`product_name` VARCHAR(30) NOT NULL,
`price` FLOAT NOT NULL
)";

$conn->query($sql_2);
?>
