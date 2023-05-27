<?php
    require "connection.php";

    session_start();
    $user_id = $_SESSION["id"];
    $comment_id = $_POST["comment_id"];
    $post_id = $_POST["post_id"];

    $like = mysqli_query($connection, "SELECT * FROM comment_likes WHERE user_id = '$user_id' and comment_id = '$comment_id' and post_id = '$post_id'");

    if ($like->num_rows == 0)
        mysqli_query($connection, "INSERT INTO comment_likes VALUES(null, '$user_id', '$post_id', '$comment_id')");
    else
        mysqli_query($connection, "DELETE FROM comment_likes WHERE user_id = '$user_id' and comment_id = '$comment_id' and post_id = '$post_id'");
    
?>