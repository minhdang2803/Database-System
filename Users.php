<?php
class Users
{
    private $Username;
    private $Password;
    private $FirstName;
    private $LastName;
    private $uuid;
    private $connection;

    public function validate($data)
    {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    public function createConnection($ServerName, $Username, $Password, $dbname)
    {
        $this->connection = new mysqli($ServerName, $Username, $Password, $dbname);
        if ($this->connection->connect_error) {
            die("Connection failed: " . $this->connection->connect_error);
            echo "Connection failed";
        }
    }

    public function __construct()
    {
        $this->Username = "";
        $this->Password = "";
        $this->FirstName = "";
        $this->LastName = "";
        $this->uuid = "";
    }

    public function login($post_method)
    {
        $this->Username = $this->validate($post_method['username']);
        $this->Password = $this->validate($post_method['password']);
        $this->encodedPassword = md5($this->Password);
        $sql = "SELECT * FROM users WHERE username = '$this->Username' AND password = '$this->encodedPassword'";
        $result = $this->connection->query($sql);
        if ($result->num_rows === 1) {
            $row = $result->fetch_assoc();
            $_SESSION['username'] = $row['username'];
            $_SESSION['firstname'] = $row['firstname'];
            $_SESSION['lastname'] = $row['lastname'];
            $_SESSION['id'] = $row['uid'];
            $_SESSION['fullname'] = $row['firstname']." ".$row['lastname'];
            //! Must be changed to the correct path
            $url = "./index.php"; // url to redirect to homepage 
            header("Location: $url");
            exit();
            return true;
        } else {
            //! Must be changed to the correct path
            // url to redirect to login page and print the error message 
            $url = "./index.php?error=Incorrect Username or Password&page=login";
            header("Location: $url");
            exit();
            return false;
        }
    }
    public function register($post_method)
    {
        $this->Username = $this->validate($post_method['username']);
        $this->Password = $this->validate($post_method['password']);
        $this->FirstName = $post_method['firstname'];
        $this->LastName = $post_method['lastname'];
        $this->Phone = $post_method['phone'];
        $this->uuid = uniqid('users_');
        $this->encodedPassword = md5($this->Password);
        $this->Fullname =$this->FirstName." ".$this->LastName;
        $sql = "SELECT * FROM users WHERE username = '$this->Username'";
        $result = mysqli_query($this->connection, $sql);
        if (mysqli_num_rows($result) > 0) // The username already exists
        {
            //! Must be changed to the correct path
            $url = "./index.php?error=Username already exists&page=register";
            header("Location: $url");
            exit();
            return false;
        } else {
            $sql2 = "INSERT INTO users 
            VALUES ('$this->uuid','$this->Fullname','$this->Username','$this->encodedPassword')";
            $result2 = mysqli_query($this->connection, $sql2);
            if ($result2) //Successfully added the user
            {
                //! Must be changed to the correct path
                $url = "./index.php?success=Registration Successful&page=register";
                header("Location: $url");
                exit();
                return true;
            } else // Failed added a user
            {
                //! Must be changed to the correct path
                $url = "./index.php?error=Registration Failed&page=register";
                header("Location: $url");
                exit();
                return false;
            }
        }
    }

    // public function getUUIDbyUsername()
    // {
    //     $sql = "SELECT uuid FROM users WHERE username = '$this->Username'";
    //     $result = $this->connection->query($sql);
    //     if ($result->num_rows > 0) {
    //         $row = $result->fetch_assoc();
    //         return $row['uuid'];
    //     } else {
    //         return "";
    //     }
    // }
    // public function logout($uuid)
    // {
    //     unset($_SESSION["$uuid"]);
    //     session_destroy();
    //     //! Must change after merge code
    //     $url = "./index.php";
    //     header("Location: $url");
    //     $this->connection->close();
    // }
};

?>
