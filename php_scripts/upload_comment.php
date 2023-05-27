<?php
    require "connection.php";
    session_start();

    $comment = $_POST["comment"];
    $post_id = $_POST["post_id"];
    $user_id = $_SESSION["id"];
    $comment_id = $_POST["comment_id"];

    $date = date("Y-m-d H:i:s");
    print_r($_POST);

    mysqli_query($connection, "INSERT INTO comments VALUES(null, '$user_id', '$post_id', $comment_id, '$comment', '$date')");

    echo 1;
?>