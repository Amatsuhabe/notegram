<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notegram</title>
    <link rel="stylesheet" href="main.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>

    <?php
        require "php_scripts/connection.php";
        require "pages/header.php";
    ?>
    <div class="main-content">
        <div class="posts-wrapper">
            <?php 
                $posts = mysqli_fetch_all(mysqli_query($connection, "SELECT posts.id as id, users.id as user_id, first_paragraph, theme_id, cover, header, avatar, username, create_date FROM posts INNER JOIN users ON posts.user_id = users.id"), MYSQLI_ASSOC);
                foreach($posts as $post){
                    include "pages/post_element.php";

                    // v.1
                    // echo "
                    //     <a href='pages/post.php?id={$post["id"]}'>
                    //         <div class='post-wrapper'>
                    //             <div class='post-cover'>
                    //                 <img src='/notegram/covers/{$post["cover"]}'/>
                    //             </div> 
                    //             <div class='post-container'>
                    //                 <div class='post-header' title='{$post["header"]}'>{$post["header"]}</div>
                    //                 <div class='keywords-wrapper'>";
                    //                 $keywords = mysqli_fetch_all(mysqli_query($connection, "SELECT * FROM keywords WHERE post_id = '{$post["id"]}'"), MYSQLI_ASSOC);
                    //                 foreach($keywords as $keyword)
                    //                     echo "<div class='keyword-item'>#{$keyword["keyword"]}</div>";    
                    //             echo "
                    //                 </div>
                    //                 <div class='user-wrapper'>
                    //                     <div class='user-avatar'>
                    //                         <img src='/notegram/avatars/{$post["avatar"]}'>
                    //                     </div>
                    //                     <div class='username-date-wrapper'>
                    //                         <div class='username'>{$post["username"]}</div>
                    //                         <div class='post-date'>{$time_format}</div></div>
                    //                 </div>
                    //             </div>
                    //         </div>
                    //     </a>
                    // ";
                }
            ?>
        </div>
    </div>
    <script src="main.js"></script>
</body>
</html>