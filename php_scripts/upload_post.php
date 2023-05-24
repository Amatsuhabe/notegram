<pre>
123123
<?php
    require "connection.php";

    session_start();
    
    
    $upload_dir = "../covers";
    $name = explode(".", $_FILES["cover"]["name"])[0] . time() . "." . explode("/", $_FILES["cover"]["type"])[1];
    move_uploaded_file($_FILES["cover"]["tmp_name"], "$upload_dir/$name");
    print_r($name);
    echo "\n";
    print_r($_FILES);
    echo "\n";
    $content = trim($_POST['content']);
    $header = $_POST['header'];
    $user_id = $_SESSION['id'];
    $difficulty = $_POST['difficulty'];
    $keywords = $_POST['keywords'];
    $date = date("Y-m-d H:i:s");
    $cover = $name;
    print_r($_POST);
    mysqli_query($connection, "INSERT INTO posts VALUES('null', '$user_id', '$header', '$content', '$difficulty', '$cover', '$date')")
?>
</pre>