<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notegram</title>
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="../css/header.css">
</head>
<body>
    <?php
        require "./header.php";
        if (isset($_SESSION['username']))
            header("Location: /notegram/index.php");
    ?>

    <div class="main-content">
        <form class="login-wrapper">
            <div class="login-title">Wejść do systemu</div>

            <input type="text" name="username" placeholder="Nazwa użytkownika" id="username">
            <input type="password" name="password" placeholder="Hasło" id="password">

            <button class="submit-btn">Zalogować się</button>
            
            <div class="recommendation">Nie masz konta? <a href="register.php">Załóż go teraz</a></div>

            <div class="error-field"></div>
        </form>
    </div>
    <script src="../scripts/login.js"></script>
</body>
