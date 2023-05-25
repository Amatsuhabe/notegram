<?php
    require "connection.php";
    session_start();

    $comment = $_POST["comment"];
    $post_id = $_POST["post_id"];
    $user_id = $_SESSION["id"];
    $date = date("Y-m-d H:i:s");

    mysqli_query($connection, "INSERT INTO comments VALUES(null, '$user_id', '$post_id', 0, '$comment', '$date')");

    echo 1;
?>