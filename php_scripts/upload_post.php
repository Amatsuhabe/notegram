<pre>
123123
<?php
    require "connection.php";

    session_start();
    
    $upload_dir = "../covers";

    $name = explode(".", $_FILES["cover"]["name"])[0] . time() . "." . explode("/", $_FILES["cover"]["type"])[1];
    move_uploaded_file($_FILES["cover"]["tmp_name"], "$upload_dir/$name");

    $content = trim($_POST["content"]);
    $header = $_POST["header"];
    $user_id = $_SESSION["id"];
    $theme_id = $_POST["theme_id"];
    $difficulty = $_POST["difficulty"];
    $keywords = json_decode($_POST["keywords"]);
    $first_paragraph = $_POST["first_paragraph"];
    $date = date("Y-m-d H:i:s");
    $cover = $name;
    print_r($_POST);
    mysqli_query($connection, "INSERT INTO posts VALUES('null', '$user_id', '$theme_id', '$header', '$content', '$first_paragraph', '$difficulty', '$cover', '$date')");
    
    $post_id = mysqli_insert_id($connection);
    foreach($keywords as $keyword){
        mysqli_query($connection, "INSERT INTO keywords VALUES('null', '$post_id', '$keyword')");
    }
?>
</pre>