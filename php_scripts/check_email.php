<?php 
    require "connection.php";

    $email = mysqli_query($connection, "SELECT * FROM users WHERE email = '{$_POST["email"]}'");

    $isAvailable = false;
    $message = "";

    if ($email->num_rows == 0)
        $isAvailable = true;
    else
        $message = "Email jest zajęty";
        
    echo json_encode([
        "isAvailable" => $isAvailable,
        "message" => $message
    ]);
?>