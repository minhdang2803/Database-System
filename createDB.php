<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "teaching_system";

$conn = new mysqli($servername, $username, $password,$dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$sql = "USE $dbname";
// sql to create table
$sql = " CREATE TABLE IF NOT EXISTS users (
`id` VARCHAR(250) NOT NULL ,
`name` VARCHAR(250) NOT NULL,
`username` VARCHAR(250) NOT NULL UNIQUE PRIMARY KEY,
`password` VARCHAR(250) NOT NULL
)";

$conn->query($sql);
?>
