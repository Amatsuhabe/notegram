<?php 
    require "../php_scripts/connection.php";
        
    $post_id = $_GET['id'];

    $result = mysqli_fetch_assoc(mysqli_query($connection, "SELECT * FROM posts WHERE id = '$post_id'"));

    $user_id = $result['user_id'];

    $author = mysqli_fetch_assoc(mysqli_query($connection, "SELECT name FROM users WHERE id = '$user_id'"))["name"];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/post.css">
    <title><?php echo $result["header"]; ?></title>
</head>
<body>
    print_r($author);
    <div class="post">
    <?php 
        
        print_r($result['content']);
    ?>
    </div>
</body>
</html>