<?php 
    require "connection.php";

    $username = $_POST['username'];

    $user = mysqli_query($connection, "SELECT * FROM users WHERE username = '$username'");

    $errors = [];

    $email = $_POST['email'];
    $checkEmail = mysqli_query($connection, "SELECT * FROM users WHERE email = '$email'");

    if ($checkEmail->num_rows > 0)
            array_push($errors, "email");

    if ($user->num_rows == 0){
        if (count($errors) == 0){
            $password = $_POST['password'];
            $name = $_POST['name'];
            $surname = $_POST['surname'];
            $gender = $_POST['gender'];
            
            if ($gender == "male")
            $avatar = "default_male.jfif";
            else
                $avatar = "default_female.jfif";

            mysqli_query($connection, "INSERT INTO users(username, password, name, surname, email, gender, avatar) VALUES('$username', '$password', '$name', '$surname', '$email', '$gender', '$avatar')");

            session_start();

            $result = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM users WHERE username = '$username'"));

            $_SESSION["username"] = $username;
            $_SESSION["id"] = $result['id'];
            header("Location: /notegram/");
        }
    }
    else{
        array_push($errors, "username");
    }


    echo (json_encode($errors));
?>