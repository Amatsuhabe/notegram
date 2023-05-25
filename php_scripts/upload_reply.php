<?php
    session_start();
    
    require "connection.php";

    $user_id = $_SESSION["id"];
    $post_id = $_POST["post_id"];
    $comment_id = $_POST["comment_id"];
    $comment = $_POST["comment"];
    $date = date("Y-m-d H:i:s");
    mysqli_query($connection, "INSERT INTO replies VALUES(null, '$user_id', '$post_id', '$comment_id', '$comment', '$date')");
    echo 1;
?>