<?php 
    $upload_dir = "../users_imgs";
    $name = explode(".", $_FILES["image"]["name"])[0] . time() . "." . explode("/", $_FILES["image"]["type"])[1];
    move_uploaded_file($_FILES["image"]["tmp_name"], "$upload_dir/$name");
    echo $name;
?>