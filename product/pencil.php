<!-- PHP CODE to Create DB, Select Tuples and DELETE Tuples  -->
<?php
echo "<br>";
echo "<br>";
echo "<br>";
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mydb";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
//Adding some record
echo "INSERT INTO products (product_id, product_name, price)
VALUES <br>(1, 'Pentel QNR Graphgear', 14.22),<br>
        (2, 'Pentel 2B', 11.22),<br>
        (3, 'Pentel HB', 10.22)<br>
";

$sql = "INSERT INTO products (product_id, product_name, price)
VALUES (1, 'Pentel QNR Graphgear', 14.22) ,
(2, 'Pentel 2B', 11.22),
(3, 'Pentel HB', 10.22)
";
if ($conn->query($sql) === TRUE) {
    echo "- New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
echo "<br><br>";

//Selecting some record
echo "SELECT * FROM products";
echo "<br>";

$sql = "SELECT * FROM products";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "id: " . $row["product_id"] . " - Name: " . $row["product_name"] . " - Price: " . $row["price"] . "<br>";
    }
} else {
    echo "0 results";
}

//Delete all records
echo "<br>";
echo "DELETE FROM products";
echo "<br>";
$sql = "DELETE FROM products WHERE product_id BETWEEN 1 AND 3";
$result = $conn->query($sql);
if ($conn->query($sql) === TRUE) {
    echo "- Record deleted successfully";
} else {
    echo "Error deleting record: " . $conn->error;
}

// $sql = "DROP DATABASE products";
$conn->close();
?>