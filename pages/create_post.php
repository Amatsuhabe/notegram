<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/editor.css">
    <link rel="stylesheet" href="../css/header.css">
</head>
<body>
    <?php 
        require "header.php";
    ?>

    <div class="post-wrapper">
        <div class="editor-container">
            <div class="editor-menu">
                <div class="editor-menu-item" data-create="header">Nagłówek</div>
                <div class="editor-menu-item" data-create="table">Tabela</div>
                <div class="editor-menu-item" data-create="image">Zdjęcie</div>
                <div class="editor-menu-item" data-create="ul">Lista</div>
                <div class="editor-menu-item" data-create="ol">Lista numerowana</div>
                <div class="editor-menu-item" data-create="hr">Rozdzielać</div>
            </div>
            <div class="post" contenteditable="true">
                <div class="post-header is-empty" contenteditable="true" data-empty="Nagłówek"></div>
                
                <div class="paragraph is-empty" data-empty='Wpisz "/", aby otworzyć menu'></div>
            </div>
            <div class="editor-footer">
                <div class="publicate-btn btn" disabled>Opublikować</div>
                <div class="publication-settings-wrapper">
                    <div class="settings-btn btn">Ustawienia publikacji</div>
                    <div class="publication-settings hidden">
                        <div class="cover-wrapper">
                            <input type="file" style="display: none" name="">
                            <div class="cover is-empty" data-empty="Dodać okładkę *">
                                <img src="" alt="">
                            </div>
                            <div class="clear-btn"></div>
                        </div>
                        <div class="inputs-wrapper">
                            <div class="selects-wrapper">
                                <div class="theme-wrapper input-wrapper">
                                    <label for="theme">Temat publikacji</label>
                                    <select type="text" name="" id="theme" class="theme-choose">
                                        <?php 
                                            require "../php_scripts/connection.php";
                                            $themes = mysqli_fetch_all(mysqli_query($connection, "SELECT * FROM themes"));
                                            print_r($themes);
                                            foreach($themes as $theme){
                                                $name = $theme[1];
                                                $id = $theme[0];
                                                echo "<option value='$id'>$name</option>";

                                            }
                                        ?>
                                    </select>
                                </div>
                                <div class="difficult-wrapper input-wrapper">
                                    <label for="difficult">Poziom trudności</label>
                                    <select name="difficult" id="difficult">
                                        <option value="Nie wybrany">Nie wybrany</option>
                                        <option value="Łatwy">Łatwy</option>
                                        <option value="Średni">Średni</option>
                                        <option value="Trudny">Trudny</option>
                                    </select>
                                </div>
                            </div>
                            <div class="key-words input-wrapper">
                                <label for="key">Słowa kluczowe <span class="star-require">*</span></label>
                                <div class="key-input-wrapper">
                                    <input type="text" name="" class="key-input" placeholder="Wpisz od 1 do 10 słów kluczowych, rozdzielając przecinkiem">
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>
            </div>
        </div>
    </div>
    <script src="../scripts/editor.js"></script>
</body>
</html>