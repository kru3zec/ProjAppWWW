<!-- index.php -->

<?php
error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);

$idp = isset($_GET['idp']) ? htmlspecialchars($_GET['idp'], ENT_QUOTES, 'UTF-8') : '';

if($_GET['idp'] == 'glowna') $strona = '1';
if($_GET['idp'] == 'peryferia') $strona = '2';
if($_GET['idp'] == 'podzespoly') $strona = '3';
if($_GET['idp'] == 'systemy') $strona = '4';
if($_GET['idp'] == 'filmy') $strona = '5';
if($_GET['idp'] == 'kontakt') $strona = '6';
if($_GET['idp'] == 'javascript') $strona = '7';
if($_GET['idp'] == 'admin') $strona = '8';

include('cfg.php');
include('showpage.php');
include('./admin/admin.php');
include('contact.php');
include('sklep.php')

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
<!-- nagłówek -->
  <nav>
    
    <input type="checkbox" id="check">

    
    <label for="check" class="checkbtn">
      <i class="fas fa-bars"></i>
    </label>

    <label class="logo">Komputer moją pasją</label>

<!-- wybór strony -->
    <ul>
        <li><a class="active" href="index.php?idp=glowna">Rodzaje komputerów</a></li>
        <li><a class="active" href="index.php?idp=peryferia">Peryferia</a></li>
        <li><a class="active" href="index.php?idp=podzespoly">Podzespoły PC</a></li>
        <li><a class="active" href="index.php?idp=systemy">Systemy</a></li>
        <li><a class="active" href="index.php?idp=filmy">Filmy</a></li>
        <li><a class="active" href="index.php?idp=kontakt">Kontakt</a></li>
        <li><a class="active" href="index.php?idp=javascript">JS & JQuery</a></li>
        <li><a class="active" href="index.php?idp=admin">Panel</a></li>
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
        echo "The file $file exists";
    }
}



/* Jeśli została wybrana zakładka Panel, ma zostać wyświetlony ekran logowania, po wypełnieniu danych 
następuje weryfikacja loginu. Następnie mają zostać wyświetlone przyciski do wyświetlenia podstron lub dodania
nowej podstrony */

$zarzadzaj  = new ZarzadzajKategoriami($link);
$zarzadzaj2 = new ZarzadzajProduktami($link);
$sklep = new Sklep($link);
if($_GET['idp'] == 'admin')
			{
				echo(FormularzLogowania());
				PrzetwarzanieFormularza();
				if ($_SESSION["is_logged"] == 1)
				{
					include('./html/admin.html');
					if($_GET['action'] == 'list')
					{
						ListaPodstron();
					}
					if($_GET['action'] == 'add')
					{
						echo(DodajNowaPodstrone());
					}
          if($_GET['action'] == 'category_list')
          {
            $zarzadzaj->PokazKategorie();
          }
          if($_GET['action'] == 'category_add')
          {
            $zarzadzaj->DodajKategorie();
          }
          if($_GET['action'] == 'product_list')
          {
            $zarzadzaj2->PokazProdukty();
          }
          if($_GET['action'] == 'product_add')
          {
            $zarzadzaj2->DodajProdukty();
          }
          if($_GET['action'] == 'shop')
          {
            $sklep->PokazKategorie();
          }


				}
				
				PrzetwarzajEdycje();
				PrzetwarzajDodanie();
        $zarzadzaj->PrzetwarzajEdycjeKategorii();
        if (isset($_POST['edit_product_submit'])) {
            $zarzadzaj2->PrzetwarzajEdycjeProduktow();
        }
    } else {
        // Wyświetlenie wybranej podstrony, jeśli nie jest to panel administratora
        echo PokazPodstrone($strona);
    }

    if (isset($_GET['kategoria'])) {
        $kategoria_id = (int) $_GET['kategoria'];
        $sklep->PokazProduktyPoKategori($kategoria_id);
    }

      

  ?>

<!-- przycisk do przerzucenia na górę strony -->

<a href="" title="Do góry!" id="scroll-to-top"><img src="img/up-arrow.png" width="100" height="100" alt="strzałka do góry" /></a>
</div>

    <!-- stopka -->
<footer>
  &copy; <i>2024 Mateusz Kruszewski wersja 1.8</i><br>
</footer>
    
    <?php
$nr_indeksu='169324';
$nrGrupy='ISI 2';
echo 'Mateusz Kruszewski '.$nr_indeksu.' grupa '.$nrGrupy.' <br/> <br/>';
    ?>

</body>
</html>