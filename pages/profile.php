<?php
    require "../php_scripts/connection.php";
    
    $user_id = $_GET["id"];

    $user = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM users WHERE id = '{$user_id}'"));
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $user["username"]?></title>
    <link rel="stylesheet" href="../main.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/profile.css">
</head>
<body>
    <?php 
        if (!isset($user)){
            include "404.php"; 
            die();
        }
        include "header.php";
    ?>
    

    <div class="profile-wrapper">
        <div class="profile-cover"></div>
        <div class="profile-container">
            <div class="user-data-container">
                <div class="user-avatar">
                    <img src="/notegram/avatars/<?php echo $user["avatar"]?>" alt="">
                </div>
                <div class="user-data">
                    <div class="username"><?php echo $user["username"]?></div>
                    <!-- <div class="user-email"><?php echo $user["email"]?></div> -->
                </div>
            </div>
        </div>
    </div>
    <div class="posts-wrapper">
            <?php 
                $posts = mysqli_fetch_all(mysqli_query($connection, "SELECT posts.id as id, users.id as user_id, first_paragraph, theme_id, cover, header, avatar, username, create_date FROM posts INNER JOIN users ON posts.user_id = users.id WHERE users.id = '$user_id'"), MYSQLI_ASSOC);
                foreach($posts as $post){
                    include "post_element.php";
                }
            ?>
        </div>
</body>
</html>