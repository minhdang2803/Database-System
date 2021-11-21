<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/Icon/themify-icons.css">
    <script defer src="./validator.js"></script>
    <title>The Band</title>
</head>

<body>

    <div id="App">
        <?php
        include 'header.php';
        if (isset($_POST['page'])) {
            $page = $_POST['page'];
        } else if (isset($_GET['page'])) {
            $page = $_GET['page'];
        } else {
            $page =  "home";
        }
        switch ($page) {
            case "home":
                include "slider.php";
                include "content.php";
                break;

            case "login": {
                    include("login.php");
                    break;
                }
            case "register":
                include("register.php");
                break;

            case "product":
                include("product.php");
                break;

            case "logout":
                include "./logout.php";
                break;

            case "search":
                include "./search.php";
                break;

            case "search_processing":
                include "./search_processing.php";
                break;

            case "aao":
                include "./aao.php";
                break;

            case "faculty":
                include "./faculty.php";
                break;

            case "lecturer":
                include "./lecturer.php";
                break;

            case "student":
                include "./student.php";
                break;
            case "aao_processing":
                include "./aao_processing.php";
                break;
        }
        include 'footer.php';
        ?>
    </div>
    <!-- End App -->
</body>
<!-- end Body -->

</html>
<!-- End HTML -->