    <?php
    include "config.php";
    if (isset($_POST['textfield'])) {
        $value = $_POST['textfield'];
        $query = "SELECT * FROM products WHERE price = '$value'";
    }
    echo "<br>";
    echo "<br>";
    echo "<br>";
    echo "<br>";
    echo "<br>";
    $result = $conn->query($query);
    if ($result->num_rows > 0) {
        // output data of each row
        while ($row = $result->fetch_assoc()) {
            echo "id: " . $row["product_id"] . " - Name: " . $row["product_name"] . " - Price: " . $row["price"] . "<br>";
        }
    } else {
        echo "0 results";
    }

    ?>