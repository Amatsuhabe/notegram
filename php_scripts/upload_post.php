<?php
    require "connection.php";

    session_start();

    $content = trim($_POST['content']);
    $header = $_POST['header'];
    $user_id = $_SESSION['id'];
    $date = date("Y-m-d");

    mysqli_query($connection, "INSERT INTO posts VALUES('null', '$user_id', '$header', '$content', '0', '0', '$date')")
?>