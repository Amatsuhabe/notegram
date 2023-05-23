<?php 
    require "connection.php";

    $username = $_POST['username'];

    $user = mysqli_query($connection, "SELECT * FROM users WHERE username = '$username'");

    if ($user->num_rows == 0){
        $password = $_POST['password'];
        $name = $_POST['name'];
        $surname = $_POST['surname'];
        $email = $_POST['email'];
        $gender = $_POST['gender'];

        if ($gender == "male")
            $avatar = "avatars/default_male.jfif";
        else
            $avatar = "avatars/default_female.jfif";

        mysqli_query($connection, "INSERT INTO users(username, password, name, surname, email, gender, avatar) VALUES('$username', '$password', '$name', '$surname', '$email', '$gender', '$avatar')");

        session_start();

        $result = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM users WHERE username = '$username'"));

        $_SESSION["username"] = $username;
        $_SESSION["id"] = $result['id'];
        $_SESSION["email"] = $result['email'];
    }
    else
        print_r("username");
?>