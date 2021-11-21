<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Document</title>
    <style>
        .table {
            margin-top: 92px;
            margin-left: auto;
            margin-right: auto;
            width: 50%;
        }
    </style>
</head>

<body>
    <?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "teaching_system";
    $conn = new mysqli($servername, $username, $password, $dbname);
    ?>
    <?php
    $choice = $_POST['id'];
    switch($choice)
    {
        case "":
            $sql = "SELECT * FROM `Student`";
            break;
        default:
            $sql = "SELECT * FROM `Student` AS s WHERE s.`id` = $choice;";
    }
    $result = mysqli_query($conn, $sql); ?>
    <?php if (mysqli_num_rows($result) > 0) { ?>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">Student ID</th>
                    <th scope="col">Grade</th>
                    <th scope="col">Name</th>
                    <th scope="col">Status ID</th>
                    <th scope="col">Credits</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Faculty</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($item = $result->fetch_assoc()) { ?>
                    <tr>
                        <td><?php echo $item['id']; ?></td>
                        <td><?php echo $item['grade']; ?></td>
                        <td><?php echo $item['name']; ?></td>
                        <td><?php echo $item['status']; ?></td>
                        <td><?php echo $item['no_credit']; ?></td>
                        <td><?php echo $item['phone']; ?></td>
                        <td><?php echo $item['faculty_name']; ?></td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    <?php } else { ?>
        <div style="text-align: center; padding: 50px;">
            <a class='btn btn-primary' style="font-size: 3rem;" href="./home">No Student</a>
        </div>
    <?php } ?>
</body>

</html>