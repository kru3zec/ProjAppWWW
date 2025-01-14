<?php
include("cfg.php");

/*
 Obsługuje wyświetlanie i przetwarzanie formularza kontaktowego z wykorzystaniem biblioteki PHPMailer.
 Funkcjonalności:
 - Wyświetlanie formularza
 - Wysyłanie wiadomości email za pomocą SMTP)`
 - Przypomnienie hasła
 - Obsługa błędów (walidacja danych wejściowych)
 */

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php'; 

class Kontakt
{
// Zwraca HTML dla formularza kontaktowego
public function PokazKontakt()
{
    $wynik = '
    <div class="Kontakt">
     <h2 class="heading">Kontakt:</h2>
      <div class="kontakt">
       <form method="post" name="ContactForm" enctype="multipart/form-data" action="'.$_SERVER['REQUEST_URI'].'">
            <input type="text" name="temat" id="temat" class="formField" placeholder="Podaj temat"> 
            <br>
            <input type="text" name="email" id="email" class="formField" placeholder="Wpisz adres email"> 
            <br>
            <textarea style="width: 800px; height: 200px;" id="message" name="tresc" placeholder="Treść wiadomości"></textarea>
            <br>
            <input type="submit" name="contact_submit" class="kontakt" value="Wyślij">
       </form>
      </div>
    </div>
    ';

    return $wynik;
}

// Przetwarza formularz i wysyła wiadomość email.
public function WyslijMailaKontakt($odbiorca)
{
    global $email_pass; // Globalna zmienna przechowująca hasło e-mail

    // Sprawdzanie, czy wszystkie pola formularza są wypełnione
    if (empty($_POST['temat']) || empty($_POST['tresc']) || empty($_POST['email'])) {
        echo '[nie_wypelniles_pola]';
        echo PokazKontakt(); // Ponownie wyświetla formularz z komunikatem
    } else {
        $mail = new PHPMailer(true); // Tworzenie instancji PHPMailer
        try {
            $mail->isSMTP();
            $mail->Host = 'smtp.wp.pl';  
            $mail->SMTPAuth = true;
            $mail->Username = 'kamil.pawww@wp.pl'; 
            $mail->Password = $email_pass;  
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
            $mail->Port = 465;  

            $mail->setFrom('kamil.pawww@wp.pl', 'Formularz kontaktowy');
            $mail->addAddress($odbiorca); // Adres odbiorcy

            // Treść wiadomości
            $mail->isHTML(true); 
            $mail->Subject = htmlspecialchars($_POST['temat']); // Usunięcie znaków specjalnych
            $mail->Body    = htmlspecialchars($_POST['tresc']); // Usunięcie znaków specjalnych
            $mail->AltBody = htmlspecialchars(strip_tags($_POST['tresc'])); // Usunięcie znaków specjalnych


            $mail->send();
            echo '[Wiadomosc Wyslana]';
        } catch (Exception $e) {
            echo "Wiadomość nie mogła zostać wysłana. Błąd: {$mail->ErrorInfo}";
        }
    }
}

// Przypomina hasło użytkownikowi poprzez email.
public function PrzypomnijHaslo($odbiorca)
{
    // Globalne zmienne przechowujące hasło i dane logowania
    global $pass;
    global $email_pass;

    // Sprawdzenie, czy hasło jest ustawione
    if (empty($pass)) {
        echo '[brak_hasla]';  // Wyświetlenie komunikatu o braku hasła
        return; // Zakończenie działania funkcji
    }


    $mail = new PHPMailer(true); // Tworzenie instancji PHPMailer
    try {

        $mail->isSMTP();
        $mail->Host = 'smtp.wp.pl';  
        $mail->SMTPAuth = true;
        $mail->Username = 'kamil.pawww@wp.pl'; 
        $mail->Password =  $email_pass;  
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS; 
        $mail->Port = 465; 

        // Ustawienia wiadomości e-mail
        $mail->setFrom('kamil.pawww@wp.pl', 'Formularz przypomnienia hasla');
        $mail->addAddress($odbiorca);  // Adres odbiorcy

        // Treść wiadomości
        $mail->isHTML(true); 
        $mail->Subject = "Przypomnienie hasla";
        $mail->Body    = "Twoje hasło to: ".$pass;
        $mail->AltBody = "Twoje hasło to: ".$pass; 

        // Wysyłanie wiadomości
        $mail->send();
        echo '[Haslo wyslane]';
    } catch (Exception $e) {
        echo "Wiadomość nie mogła zostać wysłana. Błąd: {$mail->ErrorInfo}";
    }
}

// Funkcja zwracająca formularz przypomnienia hasła
public function PokazPrzypomnienieHasla()
{
    $wynik = '<h2 class="heading">Przypomnij haslo:</h2> 
    <form method="post" name="PasswordForm" enctype="multipart/form-data" action="'.$_SERVER['REQUEST_URI'].'">
		<input type="text" name="email" id="email" class="formField" placeholder="Wpisz adres email"> 
		<br>
		<input type="submit" name="password_submit" class="remind_password" value="Przypomnij haslo">
	   </form>
    ';

    return $wynik;
}

}
?>
 