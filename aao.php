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
    <div class="search">
        <table class="table">
            <thead class="table-primary">
                <tr>
                    <th scope="col">Operation</th>
                    <th scope="col">Function</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <form method="POST" action="index.php">
                        <input type="hidden" name="page" value="aao_processing">
                        <input type="hidden" name="opt" value="1">
                        <td>Xem danh sách lớp đã được đăng ký bởi một sinh viên ở một học kỳ</td>
                        <td><input class="btn btn-primary" type="submit" value="Go"></td>
                    </form>
                </tr>
                <tr>
                    <form method="POST" action="index.php">
                        <input type="hidden" name="page" value="aao_processing">
                        <input type="hidden" name="opt" value="2">
                        <td>Xem danh sách lớp được phụ trách bởi một giảng viên ở một học kỳ.</td>
                        <td><input class="btn btn-primary" type="submit" value="Go"></td>
                    </form>
                </tr>
                <tr>
                    <form method="POST" action="index.php">
                        <input type="hidden" name="page" value="aao_processing">
                        <input type="hidden" name="opt" value="3">
                        <td>Xem danh sách môn học được đăng ký ở mỗi học kỳ ở mỗi khoa.</td>
                        <td><input class="btn btn-primary" type="submit" value="Go"></td>
                    </form>
                </tr>
                <tr>
                    <form method="POST" action="index.php">
                        <input type="hidden" name="page" value="aao_processing">
                        <input type="hidden" name="opt" value="4">
                        <td>Xem danh sách sinh viên đăng ký ở mỗi lớp ở mỗi học kỳ ở mỗi khoa.</td>
                        <td><input class="btn btn-primary" type="submit" value="Go"></td>
                    </form>
                </tr>
                <tr>
                    <form method="POST" action="index.php">
                        <input type="hidden" name="page" value="aao_processing">
                        <input type="hidden" name="opt" value="5">
                        <td>Xem danh sách giảng viên phụ trách ở mỗi lớp ở mỗi học kỳ ở mỗi khoa.</td>
                        <td><input class="btn btn-primary" type="submit" value="Go"></td>
                    </form>
                </tr>
                <tr>
                    <form method="POST" action="index.php">
                        <input type="hidden" name="page" value="aao_processing">
                        <input type="hidden" name="opt" value="6">
                        <td>Xem các giáo trình được chỉ định cho mỗi môn học ở mỗi học kỳ ở mỗi khoa.</td>
                        <td><input class="btn btn-primary" type="submit" value="Go"></td>
                    </form>
                </tr>
                <tr>
                    <form method="POST" action="index.php">
                        <input type="hidden" name="page" value="aao_processing">
                        <input type="hidden" name="opt" value="7">
                        <td>Xem tổng số môn học được đăng ký ở mỗi học kỳ ở mỗi khoa.</td>
                        <td><input class="btn btn-primary" type="submit" value="Go"></td>
                    </form>
                </tr>
                <tr>
                    <form method="POST" action="index.php">
                        <input type="hidden" name="page" value="aao_processing">
                        <input type="hidden" name="opt" value="8">
                        <td>Xem tổng số lớp được mở ở mỗi học kỳ ở mỗi khoa.</td>
                        <td><input class="btn btn-primary" type="submit" value="Go"></td>
                    </form>
                </tr>
                <tr>
                    <form method="POST" action="index.php">
                        <input type="hidden" name="page" value="aao_processing">
                        <input type="hidden" name="opt" value="9">
                        <td>Xem tổng số sinh viên đăng ký ở mỗi lớp của một môn học ở một học kỳ.</td>
                        <td><input class="btn btn-primary" type="submit" value="Go"></td>
                    </form>
                </tr>
                <tr>
                    <form method="POST" action="index.php">
                        <input type="hidden" name="page" value="aao_processing">
                        <input type="hidden" name="opt" value="10">
                        <td>Xem tổng số sinh viên đăng ký ở mỗi môn học ở một học kỳ.</td>
                        <td><input class="btn btn-primary" type="submit" value="Go"></td>
                    </form>
                </tr>
                <tr>
                    <form method="POST" action="index.php">
                        <input type="hidden" name="page" value="aao_processing">
                        <input type="hidden" name="opt" value="11">
                        <td>Xem tổng số sinh viên đăng ký ở mỗi học kỳ ở mỗi khoa.</td>
                        <td><input class="btn btn-primary" type="submit" value="Go"></td>
                    </form>
                </tr>
        </table>
</body>

</html>