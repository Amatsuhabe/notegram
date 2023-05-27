<?php
    require "connection.php";

    $password = mysqli_query($connection, "SELECT username FROM users WHERE password = '{$_POST["password"]}'");
    $user;
    $message = "";
    $isAvailable = false;

    if ($password->num_rows == 0)
        $isAvailable = true;
    else{
        $user = mysqli_fetch_assoc($password)["username"];
        $message = "Hasło jest zajęte przez \"$user\"";
    }

    echo json_encode([
        "isAvailable" => $isAvailable,
        "message" => $message
    ]);
?>