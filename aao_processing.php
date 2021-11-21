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
    switch ($_POST['opt']) {
        case 1:
            $sql = "CALL view_classOfStudent()";
            break;
        case 2:
            $sql = "CALL view_classOfLecturer()";
            break;
        case 3:
            $sql = "CALL view_courseInSemByFaculty()";
            break;
        case 4:
            $sql = "CALL view_student_Class_Sem_Faculty()";
            break;
        case 5:
            $sql = "CALL view_Lecturer_Class_Sem_Faculty()";
            break;
        case 6:
            $sql = "CALL view_Textbook_Class_Sem_Faculty()";
            break;
        case 7:
            $sql = "CALL view_numCourse_Sem_Faculty()";
            break;
        case 8:
            $sql = "CALL view_numClass_Sem_Faculty()";
            break;
        case 9:
            $sql = "CALL view_numStudent_Class_Course_Faculty()";
            break;
        case 10:
            $sql = "CALL view_numStudent_Course_Sem()";
            break;
        case 11:
            $sql = "CALL view_numStudent_Sem_Faculty()";
            break;
    }
    $result = mysqli_query($conn, $sql); ?>
    <?php if (mysqli_num_rows($result) > 0) { ?>
        <table class="table table-hover">
            <thead>
                <?php switch ($_POST['opt']) {
                    case 1: ?>
                        <tr>
                            <th scope="col">Student</th>
                            <th scope="col">Class</th>
                            <th scope="col">Course</th>
                        </tr>
                    <?php break;
                    case 2: ?>
                        <tr>
                            <th scope="col">Lecturer</th>
                            <th scope="col">Course</th>
                            <th scope="col">Class</th>
                        </tr>
                    <?php break;
                    case 3: ?>
                        <tr>
                            <th scope="col">Course</th>
                            <th scope="col">Semester</th>
                            <th scope="col">Faculty</th>
                        </tr>
                    <?php break;
                    case 4: ?>
                        <tr>
                            <th scope="col">Student</th>
                            <th scope="col">Course</th>
                            <th scope="col">Class</th>
                            <th scope="col">Semester</th>
                            <th scope="col">Faculty</th>
                        </tr>
                    <?php break;
                    case 5: ?>
                        <tr>
                            <th scope="col">Lecturer</th>
                            <th scope="col">Course</th>
                            <th scope="col">Class</th>
                            <th scope="col">Semester</th>
                            <th scope="col">Faculty</th>
                        </tr>
                    <?php break;
                    case 6: ?>
                        <tr>
                            <th scope="col">Textbook</th>
                            <th scope="col">Course</th>
                            <th scope="col">Semester</th>
                            <th scope="col">Faculty</th>
                        </tr>
                    <?php break;
                    case 7: ?>
                        <tr>
                            <th scope="col">Course Name</th>
                            <th scope="col">Total Course</th>
                            <th scope="col">Semester</th>
                            <th scope="col">Faculty</th>
                        </tr>
                    <?php break;
                    case 8: ?>
                        <tr>
                            <th scope="col">Course Name</th>
                            <th scope="col">Total Class</th>
                            <th scope="col">Semester</th>
                            <th scope="col">Faculty</th>
                        </tr>
                    <?php break;
                    case 9: ?>
                        <tr>
                            <th scope="col">Number Students</th>
                            <th scope="col">Class</th>
                            <th scope="col">Course</th>
                            <th scope="col">Semester</th>
                        </tr>
                    <?php break;
                    case 10: ?>
                        <tr>
                            <th scope="col">Number of students</th>
                            <th scope="col">Course</th>
                            <th scope="col">Semester</th>
                        </tr>
                    <?php break;
                    case 11: ?>
                        <tr>
                            <th scope="col">Number of students</th>
                            <th scope="col">Course Name</th>
                            <th scope="col">Semester</th>
                        </tr>
                <?php break;
                } ?>


            </thead>
            <tbody>
                <?php while ($item = $result->fetch_assoc()) { ?>
                    <?php switch ($_POST['opt']) {
                        case 1: ?>
                            <tr>
                                <td><?php echo $item['Student']; ?></td>
                                <td><?php echo $item['Class']; ?></td>
                                <td><?php echo $item['Course']; ?></td>
                            </tr>
                        <?php break;
                        case 2: ?>
                            <tr>
                                <td><?php echo $item['Lecturer']; ?></td>
                                <td><?php echo $item['Class']; ?></td>
                                <td><?php echo $item['Course']; ?></td>
                            </tr>
                        <?php break;
                        case 3: ?>
                            <tr>
                                <td><?php echo $item['Course']; ?></td>
                                <td><?php echo $item['Semester']; ?></td>
                                <td><?php echo $item['Faculty']; ?></td>
                            </tr>
                        <?php break;
                        case 4: ?>
                            <tr>
                                <td><?php echo $item['Student']; ?></td>
                                <td><?php echo $item['Course']; ?></td>
                                <td><?php echo $item['Class']; ?></td>
                                <td><?php echo $item['Semester']; ?></td>
                                <td><?php echo $item['Faculty']; ?></td>
                            </tr>
                        <?php break;
                        case 5: ?>
                            <tr>
                                <td><?php echo $item['Lecturer']; ?></td>
                                <td><?php echo $item['Course']; ?></td>
                                <td><?php echo $item['Class']; ?></td>
                                <td><?php echo $item['Semester']; ?></td>
                                <td><?php echo $item['Faculty']; ?></td>
                            </tr>
                        <?php break;
                        case 6: ?>
                            <tr>
                                <td><?php echo $item['Textbook']; ?></td>
                                <td><?php echo $item['Course']; ?></td>
                                <td><?php echo $item['Semester']; ?></td>
                                <td><?php echo $item['Faculty']; ?></td>
                            </tr>
                        <?php break;
                        case 7: ?>
                            <tr>
                                <td><?php echo $item['Course Name']; ?></td>
                                <td><?php echo $item['Total Course']; ?></td>
                                <td><?php echo $item['Semester']; ?></td>
                                <td><?php echo $item['Faculty']; ?></td>
                            </tr>
                        <?php break;
                        case 8: ?>
                            <tr>
                                <td><?php echo $item['Course Name']; ?></td>
                                <td><?php echo $item['Total Class']; ?></td>
                                <td><?php echo $item['Semester']; ?></td>
                                <td><?php echo $item['Faculty']; ?></td>
                            </tr>
                        <?php break;
                        case 9: ?>
                            <tr>
                                <td><?php echo $item['Number Students']; ?></td>
                                <td><?php echo $item['Class']; ?></td>
                                <td><?php echo $item['Course']; ?></td>
                                <td><?php echo $item['Semester']; ?></td>
                            </tr>
                        <?php break;
                        case 10: ?>
                            <tr>
                                <td><?php echo $item['Number of students']; ?></td>
                                <td><?php echo $item['Course']; ?></td>
                                <td><?php echo $item['Semester']; ?></td>
                            </tr>
                        <?php break;
                        case 11: ?>
                            <tr>
                                <td><?php echo $item['Number of students']; ?></td>
                                <td><?php echo $item['Course Name']; ?></td>
                                <td><?php echo $item['Semester']; ?></td>
                            </tr>
                    <?php break;
                    } ?>
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