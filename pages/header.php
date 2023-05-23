<?php 
    session_start();

    $currentPage = substr($_SERVER["SCRIPT_NAME"],strrpos($_SERVER["SCRIPT_NAME"],"/")+1);

    if (!isset($_SESSION["username"]) && $currentPage != "login.php" && $currentPage != "register.php")
        header("Location: /notegram/pages/login.php");
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
            Stwórz nowy post
        </a>
        <div class="auth-wrapper">
            <img class="user-avatar" src="/notegram/avatars/default_male.jfif"></img>
            
            <div class="menu-wrapper hidden">
                <div class="user-data-wrapper">
                    <img class="user-avatar" src="/notegram/avatars/default_male.jfif"></img>

                    <div class="user-data">
                        <div class="username"><?php echo $_SESSION["username"]; ?></div>
                        <div class="email"><?php echo $_SESSION["email"] ?></div>
                    </div>
                </div>
                <div class="menu">
                    <a href="/notegram/pages/profile.php?id=<?php echo $_SESSION["id"];?>" class="menu-item">
                        Profil
                    </a>

                    <div class="menu-item">
                        Motyw ciemny
                    </div>

                    <div class="menu-item">
                        Ustawienia
                    </div>

                    <a href="/notegram/php_scripts/logout.php" class="menu-item">
                        Wylogować się
                    </a>
                </div>
            </div>
        </div>
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
        <script src="/notegram/scripts/header.js"></script>
</header>