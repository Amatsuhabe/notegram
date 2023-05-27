<?php 
    session_start();

    $currentPage = substr($_SERVER["SCRIPT_NAME"],strrpos($_SERVER["SCRIPT_NAME"],"/")+1);

    if (!isset($_SESSION["username"]) && $currentPage != "login.php" && $currentPage != "register.php")
        header("Location: /notegram/pages/login.php");
    else if (isset($_SESSION["username"])){
        if (!isset($connection))
            require "{$_SERVER["DOCUMENT_ROOT"]}/notegram/php_scripts/connection.php";
        
        $sessionUser = mysqli_fetch_assoc(mysqli_query($connection, "SELECT avatar, username, email, name, surname FROM users WHERE id = {$_SESSION['id']}"));
    }
?>

<header class="document-header">
    <a class="logo-wrapper" href="/notegram">
        <img class="logo-img" src="/notegram/imgs/logo.png"></img>
        <div class="logo-name">Notegram</div>
    </a>

    <?php
        if (isset($_SESSION["username"])):
    ?>
        <a href="/notegram/pages/create_post.php" class="create-post-btn btn">
            <div class="create-post-cross"></div>
            Stwórz nowy post
        </a>
        <div class="auth-wrapper">
            <div class="user-avatar">
                <img src="/notegram/avatars/<?php echo $sessionUser["avatar"] ?>"></img>
            </div>
            
            <div class="menu-wrapper hidden">
                <div class="user-data-wrapper">
                    <div class="user-avatar">
                        <img src="/notegram/avatars/<?php echo $sessionUser["avatar"] ?>"></img>
                    </div>
                    <div class="user-data">
                        <div class="username"><?php echo $_SESSION["username"]; ?></div>
                        <div class="email"><?php echo $sessionUser["email"] ?></div>
                    </div>
                </div>
                <div class="menu">
                    <a href="/notegram/pages/profile.php?id=<?php echo $_SESSION["id"];?>" class="menu-item">
                        Profil
                    </a>

                    <div class="menu-item">
                        Ustawienia
                    </div>

                    <a href="/notegram/php_scripts/logout.php" class="menu-item">
                        Wylogować się
                    </a>
                </div>
            </div>
        </div>
        <script src="/notegram/scripts/header.js"></script>
    <?php else:?>
        <div class="auth-wrapper">
            <a class="login-btn btn" href="/notegram/pages/login.php">
                Zalogować się
            </a>
            <a class="register-btn btn" href="/notegram/pages/register.php">
                Zarejestrować się
            </a>
        </div>
    <?php endif;?>
        
</header>