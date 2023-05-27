<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notegram</title>
    <link rel="stylesheet" href="../css/register.css">
    <link rel="stylesheet" href="../css/header.css">

</head>

<body>
    <?php
        require "./header.php";
        if (isset($_SESSION["username"]))
            header("Location: /notegram/index.php");
    ?>
    <div class="main-content">
        <form class="registration-wrapper" method="POST">
            <div class="registration-title">Stworzyć nowe konto</div>

            <div class="input-wrapper">
                <div class="input-container">
                    <input type="text" name="name" placeholder="Imię" id="name">
                    <input type="text" name="surname" placeholder="Nazwisko" id="surname">
                </div>

                <div class="input-container">
                    <div class="input-check-wrapper" data-error="Hasło jest zajęte">
                        <input type="password" name="password" id="password" class="" placeholder="Hasło">
                    </div>

                    <input type="password" id="confirm" placeholder="Potwierdzenie hasła">
                </div>

                <div class="input-container">
                    <div class="input-check-wrapper" data-error="">
                        <input type="text" name="username" id="username" class="" placeholder="Nazwa użytkownika">
                    </div>

                    <div class="input-check-wrapper" data-error="">
                        <input type="text" name="email" id="email" placeholder="Adres mailowy">
                    </div>
                </div>
            </div>

            <select class="gender-choose" name="gender" id="">
                <option value="male">Mężczyzna</option>
                <option value="female">Kobieta</option>
            </select>

            <!-- <div class="persist-wrapper">
                <input type="checkbox" name="persist" id="persist">
                <label for="persist">Zostać zalogowanym</label>
            </div> -->

            <button class="submit-btn">Zarejestrować się</button>

            <div class="recommendation">Już masz konto? <a href="login.php">Zaloguj się</a></div>
        </form>
    </div>
    <script src="../scripts/register.js"></script>
</body>

</html>