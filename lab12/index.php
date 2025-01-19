<?php
session_start(); // Rozpoczęcie sesji

// Sprawdzenie, czy zmienna sesyjna "is_logged" jest ustawiona; jeśli nie, przypisanie wartości 0 (niezalogowany)
if (!isset($_SESSION["is_logged"])) {
    $_SESSION["is_logged"] = 0; 
}

// Ustawienie raportowania błędów 
error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING); 

// Pobranie wartości z $_GET 
$idp = isset($_GET['idp']) ? htmlspecialchars($_GET['idp'], ENT_QUOTES, 'UTF-8') : '';

// Przypisanie wartości do zmiennej `$strona` na podstawie wartości `$idp`
if($_GET['idp'] == '') $strona = '1';
if($_GET['idp'] == 'glowna') $strona = '1';
if($_GET['idp'] == 'peryferia') $strona = '2';
if($_GET['idp'] == 'podzespoly') $strona = '3';
if($_GET['idp'] == 'systemy') $strona = '4';
if($_GET['idp'] == 'filmy') $strona = '5';
if($_GET['idp'] == 'kontakt_php') $strona = '6';
if($_GET['idp'] == 'javascript') $strona = '7';
if($_GET['idp'] == 'admin') $strona = '8';
if($_GET['idp'] == 'sklep') $strona = '9';



// Dołączanie plików konfiguracji i obsługi stron
include('cfg.php'); 
include('showpage.php');
include('./admin/admin.php');
include('contact2.php'); //contact - wersja standarowa, contact2 - wersja korzystająca z PHPmailer
include('sklep_admin.php');
include('sklep_klient.php');
include('koszyk.php');


?>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Language" content="pl" />
<meta name="Author" content="Mateusz Kruszewski" />
<meta name="description" content="komputer moją pasją" />
<title>Komputer moją pasją</title>
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/style3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.google.com/speed/libraries?hl=pl#jquery"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<script src="js/formularze.js"></script>



</head>
<body>
<!-- nagłówek -->
  <nav>
    
    <input type="checkbox" id="check">

    
    <label for="check" class="checkbutton">
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
        <li><a class="active" href="index.php?idp=kontakt_php">Kontakt</a></li>
        <li><a class="active" href="index.php?idp=javascript">JS & JQuery</a></li>
        <li><a class="active" href="index.php?idp=admin">Panel</a></li>
        <li><a class="active" href="index.php?idp=sklep">Sklep</a></li>
    </ul>
  </nav>
  <div class="container">

        <?php
        $zarzadzaj = new ZarzadzajKategoriami($link);
        $zarzadzaj2 = new ZarzadzajProduktami($link);
        $sklep = new Sklep($link);
        $kontakt = new Kontakt();
        $admin = new Admin($link);

        // Obsługa logiki dla panelu administratora
        if ($idp == 'admin') {
            echo $admin->FormularzLogowania(); // Wyświetlenie formularza logowania
            $admin->PrzetwarzanieFormularza(); // Obsługa przesłanych danych logowania

            // Jeśli użytkownik jest zalogowany
            if ($_SESSION["is_logged"] == 1) {
                echo PokazPodstrone($strona); // Wyświetlenie wybranej podstrony
                if (isset($_GET['action']) && $_GET['action'] == 'list') {
                    $admin->ListaPodstron(); // Wyświetlenie listy podstron
                }
                elseif (isset($_GET['action']) && $_GET['action'] == 'add') {
                    echo $admin->FormularzPodstrony(); // Formularz do dodania nowej podstrony
                }
                if (isset($_GET['action']) && strpos($_GET['action'], 'edit') === 0) {
                    // Obsługa edycji podstrony
                    echo $admin->FormularzPodstrony($_GET['action']); // Wyświetlenie formularza do edycji podstrony
                }
                elseif (isset($_GET['action']) && $_GET['action'] == 'category_list') {
                    $zarzadzaj->PokazKategorie(); // Wyświetlenie listy kategorii
                }
                elseif (isset($_GET['action']) && $_GET['action'] == 'category_add') {
                    $zarzadzaj->FormularzKategorie(); // Formularz do dodania nowej kategorii
                }
                elseif (isset($_GET['action']) && $_GET['action'] == 'product_list') {
                    $zarzadzaj2->PokazProdukty(); // Wyświetlenie listy produktów
                }
                elseif (isset($_GET['action']) && $_GET['action'] == 'product_add') {
                    $zarzadzaj2->FormularzProdukty(); // Formularz do dodania nowego produktu
                }
            }
            // Przetwarzanie edycji i dodawania podstron
            $admin->PrzetwarzajPodstrone();

            // Przetwarzanie edycji kategorii i produktów
            $zarzadzaj->PrzetwarzajKategorie();
            $zarzadzaj2->PrzetwarzajProdukty();
        } 


        elseif ($idp == 'sklep') {
            $koszyk = new Koszyk($link);  // Inicjalizacja obiektu Koszyk
            $sklep-> pokazPrzyciskiLogowaniaRejestracji(); // Wyświetlenie przycisków logowania i rejestracji dla klienta sklepu
            if (isset($_POST['koszyk'])) {
                $koszyk->pokazKoszyk($klient_id); // Wyświetlenie zawartości koszyka
            }

            elseif (isset($_POST['usun_produkt'])) {
                $koszyk_id = (int)$_POST['koszyk_id'];
                $koszyk->usunZKoszyka($koszyk_id); // Usunięcie produktu z koszyka
                $koszyk->pokazKoszyk($klient_id); // Ponowne wyświetlenie koszyka po usunięciu
                echo "Produkt usunięty z koszyka!";
            }

            elseif (isset($_POST['zmien_ilosc'])) {
                $koszyk_id = (int)$_POST['koszyk_id'];
                $nowa_ilosc = (int)$_POST['nowa_ilosc'];
                $koszyk->zmienIlosc($koszyk_id, $nowa_ilosc); // Zmiana ilości produktu w koszyku
                $koszyk->pokazKoszyk($klient_id); // Ponowne wyświetlenie koszyka po zmianie ilości
                echo "Ilość produktu zmieniona!";
            }

            elseif (isset($_GET['kategoria'])) {
                $kategoria_id = intval($_GET['kategoria']);
            
                // Wyświetl podkategorie dla wybranej kategorii
                echo '<h2>Podkategorie:</h2>';
                $sklep->PokazKategorie($kategoria_id);
            
                // Wyświetl produkty z tej kategorii
                echo '<h2>Produkty:</h2>';
                echo '<div class="produkty-container">';
                $sklep->PokazProduktyPoKategori($kategoria_id);
                echo '</div>';
            } else {
                // Wyświetl główne kategorie, jeśli nie wybrano żadnej
                echo '<h2>Kategorie główne:</h2>';
                $sklep->PokazKategorie();
            }
            $klient_id = $_SESSION['klient_id'];

        }

        else {
            // Wyświetlenie wybranej podstrony, jeśli nie jest to panel administratora lub sklep
            echo PokazPodstrone($strona);
        }

        // Obsługa dodawania produktu do koszyka
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (isset($_POST['produkt_id'])) {
                $produkt_id = (int)$_POST['produkt_id'];
                if ($klient_id != null) {
                    
                    $koszyk->dodajDoKoszyka($klient_id, $produkt_id); // Dodanie produktu do koszyka dla zalogowanego klienta
                    echo "Produkt dodany do koszyka!";
                }
                else {
                    echo "Nie zalogowano";
                }

            }
        }

		// Obsługa logiki dla strony "Kontakt PHP"
		if($_GET['idp'] == 'kontakt_php')
		{
	 	// Formularz przypomnienia hasła
		echo($kontakt->PokazPrzypomnienieHasla());
		if (isset($_POST['password_submit'])) {
			$email = htmlspecialchars($_POST['email']);
			$kontakt->PrzypomnijHaslo($email); // Funkcja do przypominania hasła
		}
		elseif (isset($_POST['contact_submit']))
		{
			$email = htmlspecialchars($_POST['email']);
			$kontakt->WyslijMailaKontakt($email); // Funkcja wysyłająca wiadomość kontaktową
		}
		else
		{
			echo($kontakt->PokazKontakt()); // Wyświetlenie standardowego formularza kontaktowego
		}
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