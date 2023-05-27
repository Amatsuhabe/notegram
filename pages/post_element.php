<?php 
    $keywords = mysqli_fetch_all(mysqli_query($connection, "SELECT * FROM keywords WHERE post_id = '{$post["id"]}'"), MYSQLI_ASSOC);
                    
    $likes = mysqli_query($connection, "SELECT * FROM post_likes WHERE post_id = '{$post["id"]}'");
    $comments = mysqli_query($connection, "SELECT * FROM comments WHERE post_id = '{$post["id"]}'");
    
    $theme = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM themes WHERE id = '{$post["theme_id"]}'"));

    $time_difference = time() - strtotime($post["create_date"]);
    include "{$_SERVER["DOCUMENT_ROOT"]}/notegram/php_scripts/check_date.php";
    
    echo 
    "
        <div class='post-wrapper' tabindex='0'>
            <div class='user-wrapper'>
                <div class='user-avatar'>
                    <img src='/notegram/avatars/{$post["avatar"]}'>
                </div>
                <div class='user-date-wrapper'>
                    <a class='username' href='/notegram/pages/profile.php?id={$post["user_id"]}'>{$post["username"]}</a>
                    <div class='post-date'>$time_format</div>
                    <div class='post-theme'>{$theme["theme"]}</div>
                </div>
            </div>
            <a href='/notegram/pages/post.php?id={$post["id"]}' class='title'>{$post["header"]}</a>
            <div class='keywords-wrapper'>";
                foreach($keywords as $keyword)
                    echo "<div class='keyword-item'>{$keyword["keyword"]}</div>";
        echo
        "   </div>
            <div class='cover-wrapper'>
                <img src='/notegram/covers/{$post["cover"]}' alt='' class='cover'>
            </div>
            <div class='first-paragraph'>
                {$post["first_paragraph"]}
            </div>
            <a href='/notegram/pages/post.php?id={$post["id"]}' class='read-btn'>Czytać dalej</a>
            <div class='reaction-wrapper'>
                <div class='comments-wrapper'>
                    <img src='/notegram/imgs/comment.svg' alt=''>"
                    . $comments->num_rows."
                </div>
            </div>
        </div>
    ";
?>

<!-- <div class='likes-wrapper'>
    <img src='/notegram/imgs/like.svg' alt=''>"
    . $likes->num_rows ."
</div> -->