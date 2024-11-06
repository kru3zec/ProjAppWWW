<?php
error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);

if($_GET['idp'] == '') $strona = 'html/glowna.html';
if($_GET['idp'] == '2') $strona = 'html/peryferia.html';
if($_GET['idp'] == '3') $strona = 'html/podzespoly.html';
if($_GET['idp'] == '4') $strona = 'html/systemy.html';
if($_GET['idp'] == '5') $strona = 'html/filmy.html';
if($_GET['idp'] == '6') $strona = 'html/kontakt.html';
if($_GET['idp'] == '7') $strona = 'html/color_test.html';

?>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Language" content="pl" />
<meta name="Author" content="Mateusz Kruszewski" />
<meta name="description" content="komputer moją pasją" />
<title>Komputer moją pasją</title>
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.google.com/speed/libraries?hl=pl#jquery"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

</head>

<body>

    
  <nav>
    
    <input type="checkbox" id="check">

    
    <label for="check" class="checkbtn">
      <i class="fas fa-bars"></i>
    </label>


    <label class="logo">Komputer moją pasją</label>

    
    <ul>
        <li><a class="active" href="index.php?idp=">Rodzaje komputerów</a></li>
        <li><a class="active" href="index.php?idp=2">Peryferia</a></li>
        <li><a class="active" href="index.php?idp=3">Podzespoły PC</a></li>
        <li><a class="active" href="index.php?idp=4">Systemy</a></li>
        <li><a class="active" href="index.php?idp=5">Filmy</a></li>
        <li><a class="active" href="index.php?idp=6">Kontakt</a></li>
        <li><a class="active" href="index.php?idp=7">JS & JQuery</a></li>
    </ul>
  </nav>
  <div class="container">
  <?php

    $files = [
        "html/glowna.html",
        "html/peryferia.html",
        "html/podzespoly.html",
        "html/systemy.html",
        "html/kontakt.html",
        "html/color_test.html",
        "html/filmy.html"
    ];

foreach($files as $file)
{
    if(file_exists($file) == false)
    {
        echo "The filr $file exists";
    }
}

include($strona);

  ?>


<a href="" title="Do góry!" id="scroll-to-top"><img src="img/up-arrow.png" width="100" height="100" alt="strzałka do góry" /></a>
</div>

<footer>
			
            &copy; <i>2024 Mateusz Kruszewski wersja 1.4</i>
            <br>
            
		</footer>
    


    <?php
$nr_indeksu='169324';
$nrGrupy='ISI 2';
echo 'Mateusz Kruszewski '.$nr_indeksu.' grupa '.$nrGrupy.' <br/> <br/>';
    ?>

</body>
</html>