<?php 
    require "../php_scripts/connection.php";
                
    $post_id = $_GET['id'];

    $query = mysqli_query($connection, "SELECT header, content FROM posts WHERE id = '$post_id'");

    if ($query->num_rows == 0){
        include "404.php";
        die();
    }

    session_start();
    
    if (!isset($_SESSION['id']))
        header("Location: /notegram/pages/login.php");

    $user = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM users WHERE id={$_SESSION["id"]}"));
    $post = mysqli_fetch_assoc($query);
    
    session_write_close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/post.css">
    <link rel="stylesheet" href="../css/header.css">
    <title><?php echo $post["header"]; ?></title>
</head>
<body>
    <!-- print_r($author); -->
    <?php
        include "header.php";
    ?>
    <div class="post-wrapper">
        <div class="post">
        <?php 
            print_r($post['content']);
        ?>
        </div>
        <div class="comments-wrapper">
            <div class="comments-container">
                <?php 
                    $comments = mysqli_query($connection, "SELECT comments.id as id, avatar, content, username, create_date  FROM comments INNER JOIN users ON comments.user_id = users.id WHERE post_id = '$post_id'");
                ?>
                
                <div class="comments-header">
                    Komentarze <span><?php echo $comments->num_rows?></span> 
                </div>
                <div class="comment-field-wrapper">
                    <div class="comment-field-container">
                        <div class="user-avatar">
                            <img src="<?php echo "/notegram/avatars/{$user['avatar']}"?>" alt="">
                        </div>
                        <textarea name="" class="comment-field" id="" rows="2"></textarea>
                    </div>
                    <div class="publicate-btn btn" disabled>Opublikować</div>
                </div>
                <?php
                    
                    displayComments($comments);
                    function displayComments($comments, $parentID = null, $depth = 0){
                        global $connection, $post_id;
                        $query = "";

                        if ($parentID == null) 
                            $query = "parent_comment_id IS null";
                        else 
                            $query = "parent_comment_id = '$parentID'";

                        $comments = mysqli_fetch_all(mysqli_query($connection, "SELECT comments.id as id, avatar, content, username, create_date FROM comments INNER JOIN users ON comments.user_id = users.id WHERE post_id = '$post_id' and $query"), MYSQLI_ASSOC);
                        
                        foreach($comments as $comment){
                            $likes = mysqli_fetch_all(mysqli_query($connection, "SELECT * FROM comment_likes WHERE comment_id = '{$comment["id"]}'"));

                            $isLiked = mysqli_query($connection, "SELECT * FROM comment_likes WHERE user_id = '{$_SESSION["id"]}' and post_id = '$post_id' and comment_id = '{$comment["id"]}'")->num_rows != 0;

                            $time_difference = time() - strtotime($comment["create_date"]);
                            include "../php_scripts/check_date.php";
                            echo "
                            <div class='comment-wrapper' style='margin-left:". $depth * 48 ."px'>
                                <input type='hidden' value={$comment["id"]}>
                                <div class='comment-container'>
                                    <div class='author-avatar user-avatar'>
                                        <img src='/notegram/avatars/{$comment["avatar"]}' alt=''>
                                    </div>
                                    <div class='comment-content'>
                                        <div class='author-wrapper'>
                                            <div class='author-comment'>{$comment["username"]}</div>
                                            <div class='comment-date'>{$time_format}</div>
                                        </div>
                                        <div class='comment-message'>
                                            {$comment["content"]}
                                        </div>
                                        <div class='comment-btn-wrapper'>
                                            <div class='reply-btn btn'>Odpowiedzieć</div>
                                            <div class='like-btn btn'>
                                                <svg "; if ($isLiked) echo "class='liked'"; echo " width='24' height='20' viewBox='0 0 24 20' xmlns='http://www.w3.org/2000/svg'>
                                                    <path d='M1.99709 3.95387C5.99825 -1.39587 10.3328 1.72481 12 3.95387C13.6672 1.72482 18.0017 -1.39586 22.0029 3.95387C26.0041 9.3036 17.0015 16.2137 12 19C6.99854 16.2137 -2.00407 9.30361 1.99709 3.95387Z' fill='rgba(189, 205, 214, 1)' stroke='transparent'/>
                                                </svg>".
                                                count($likes)
                                            ."</div>
                                        </div>
                                    </div>
                                </div>
                                <div class='replies-wrapper'>";
                                     
                                    displayComments($comments, $comment["id"], 1);
                                echo 
                                "
                                </div>
                            </div>
                            ";
                        };
                    };
                ?>
            </div>
        </div>
    </div>
    <script src="../scripts/post.js"></script>
</body>
</html>