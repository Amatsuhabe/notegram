<?php 
    require "connection.php";
    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = mysqli_query($connection, "SELECT * FROM users WHERE username = '$username'");

    if ($query->num_rows > 0){
        $result = mysqli_fetch_assoc($query);
        if ($password == $result["password"]){
            session_start();
            $_SESSION["username"] = $username;
            $_SESSION["email"] = $result["email"];
            $_SESSION["id"] = $result["id"];
        }
        else{
            echo (json_encode([
                "error" => "password",
                "context" => 'Hasło jest nieprawidłowe. Prawidłowe hasło to "' . $result["password"] . '"' 
            ]));
            return 0;
        }
    }
    else{
        echo (json_encode([
            "error" => "login",
            "context" => "Nie ma użytkownika z taką nazwą"
        ]));
        return 0;
    }
    echo true;
?>