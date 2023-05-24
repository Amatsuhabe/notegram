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
        <?php 
            $query = mysqli_query($connection, "SELECT * FROM posts INNER JOIN users ON posts.user_id = users.id");
            $posts = mysqli_fecth_all($query);

            foreach($posts as $post){
                echo "
                    <div class='post-wrapper'>
                        <div class='post-cover'>
                            <img src='/notegram/covers/{$post["cover"]}/>
                        </div> 
                        <div class='post-container'>
                            <div class='user-wrapper'>
                                {$post["username"]}
                            </div>
                        </div>
                    </div>
                ";
            }
        ?>
    </div>
    <script src="main.js"></script>
    <script src="scripts/header.js"></script>
</body>
</html>