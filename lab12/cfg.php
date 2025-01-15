<?php
// utwórz nową sesję i zmienne środowiskowe
session_start();
    $dbhost= 'localhost';
    $dbuser= 'root';
    $dbpass = '';
    $baza = 'moja_strona';
    $login = 'admin';
    $pass = 'admin';
    $email_pass= 'Kam!paw2';

    $link = mysqli_connect($dbhost,$dbuser,$dbpass);
    if (!$link) echo '<b>przerwane połączenie </b>';
    if(!mysqli_select_db($link, $baza)) echo 'nie wybrano bazy';
?>