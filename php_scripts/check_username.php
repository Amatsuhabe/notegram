<?php
    require "connection.php";
    
    $password = mysqli_query($connection, "SELECT * FROM users where username = '{$_POST["username"]}'");

    $isAvailable = false;
    $message = "";

    if ($password->num_rows == 0)
        $isAvailable = true;
    else
        $message = "Nazwa użytkownika jest zajęta";

    echo json_encode([
        "isAvailable" => $isAvailable,
        "message" => $message
    ]);
?>