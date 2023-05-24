<?php 
    require "../php_scripts/connection.php";
        
    $post_id = $_GET['id'];

    $query = mysqli_query($connection, "SELECT username, name, surname, avatar, header, content FROM posts INNER JOIN users ON users.id = posts.user_id WHERE posts.id = '$post_id'");

    if ($query->num_rows == 0)
        header("Location: /notegram");

    $result = mysqli_fetch_assoc($query);
    
    // $user_id = $result['user_id'];

    // $author = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM users WHERE id = '$user_id'"))["name"];
    // print_r($author)
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/post.css">
    <link rel="stylesheet" href="../css/header.css">
    <title><?php echo $result["header"]; ?></title>
</head>
<body>
    <!-- print_r($author); -->
    <?php include "header.php"; ?>
    <div class="post-wrapper">
        <div class="post">
        <?php 
            print_r($result['content']);
        ?>
        </div>
        <div class="comments-wrapper">
            <div class="comments-container">
                <?php 
                    $comments = mysqli_query($connection, "SELECT avatar, content, username, create_date  FROM comments INNER JOIN users ON comments.user_id = users.id WHERE post_id = '$post_id'");
                ?>
                
                <div class="comments-header">
                    Komentarze <span><?php echo $comments->num_rows?></span> 
                </div>
                <div class="comment-field-wrapper">
                    <div class="comment-field-container">
                        <div class="user-avatar">
                            <img src="<?php echo "/notegram/avatars/{$result['avatar']}"?>" alt="">
                        </div>
                        <textarea name="" class="comment-field" id="" rows="2"></textarea>
                    </div>
                    <div class="publicate-btn btn" disabled>Opublikować</div>
                </div>
                <?php
                    foreach($comments as $comment){
                        $time_difference = time() - strtotime($comment["create_date"]);
                        include "../php_scripts/check_date.php";
                        echo "
                        <div class='comment-wrapper'>
                            <div class='author-avatar user-avatar'>
                                <img src='/notegram/avatars/{$comment["avatar"]}' alt=''>
                            </div>
                            <div class='comment-container'>
                                <div class='author-wrapper'>
                                    <div class='author-comment'>{$comment["username"]}</div>
                                    <div class='comment-date'>{$time_format}</div>
                                </div>
                                <div class='comment-message'>
                                    {$comment["content"]}
                                </div>
                                <div class='comment-btn-wrapper'>
                                    <div class='reply-btn btn'>Odpowiedzieć</div>
                                    <div class='like-btn btn'>Like</div>
                                </div>
                            </div>
                        </div>
                        ";
                    };
                ?>
            </div>
        </div>
    </div>
    <script src="../scripts/post.js"></script>
</body>
</html>