<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404</title>
    <link rel="stylesheet" href="/notegram/css/header.css">
</head>
<body>
    <?php 
        include "header.php";
    ?>
    <style>
        .error-wrapper{
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .error-code{
            font-size: 48px;
            font-weight: 400;
        }
    </style>
    <div class="error-wrapper">
        <div class="error-code">404</div>
        <div class="error-message">Strona nie znaleziona</div>
    </div>
</body>
</html>