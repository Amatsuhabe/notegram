<?php 
    require "connection.php";
    $username = $_POST['username'];

    $query = mysqli_query($connection, "SELECT * FROM users WHERE username='$username'");


    echo json_encode(["isAvailable" => $query->num_rows == 0]);
?>