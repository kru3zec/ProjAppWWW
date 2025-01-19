-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sty 19, 2025 at 06:03 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moja_strona`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorie`
--

CREATE TABLE `kategorie` (
  `id` int(11) NOT NULL,
  `matka` int(11) NOT NULL DEFAULT 0,
  `nazwa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategorie`
--

INSERT INTO `kategorie` (`id`, `matka`, `nazwa`) VALUES
(1, 0, 'Elektronika'),
(2, 1, 'Komputery'),
(3, 1, 'Monitory'),
(4, 2, 'Laptopy'),
(5, 4, 'Chromebooki'),
(6, 3, '24 cale'),
(7, 3, '27 cali'),
(8, 0, 'Akcesoria komputerowe'),
(9, 1, 'Smartfony');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `haslo` varchar(255) NOT NULL,
  `imie` varchar(100) DEFAULT NULL,
  `nazwisko` varchar(100) DEFAULT NULL,
  `data_rejestracji` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`id`, `email`, `haslo`, `imie`, `nazwisko`, `data_rejestracji`) VALUES
(1, 'kamilex987@gmail.com', '$2y$10$7VGgcv2STkaKpscAC8lsi.Fcn205AhWpWgy7s293lzpIeRITAfg9K', 'Kamil', 'L', '2024-12-24 17:18:41'),
(2, 'test@gmail.com', '$2y$10$QxqIxdA0.sBdmMHQCbMraOqeXyvK9NjTdIrVhfn4vkGVk7fLHc6fC', 'Test', 'Testowy', '2024-12-24 17:19:55'),
(3, 'mtszkruszewski@gmail.com', '$2y$10$9oTnkc8UIXNb4xaSBMFIaO5KtlKvWSFU24OFb1bkguskPqgb6DOEK', '123', 'xyz', '2025-01-02 21:18:54'),
(4, 'kruchu33@gmail.com', '$2y$10$jNFGMyMUL8vCe5LEL65TSOzuREBTE0aiKuc8pkYUZabLiTPUdRa0a', 'mateusz', 'kruchu', '2025-01-16 15:11:22');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `koszyki`
--

CREATE TABLE `koszyki` (
  `id` int(11) NOT NULL,
  `klient_id` int(11) NOT NULL,
  `produkt_id` int(11) NOT NULL,
  `ilosc` int(11) DEFAULT 1,
  `data_dodania` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `koszyki`
--

INSERT INTO `koszyki` (`id`, `klient_id`, `produkt_id`, `ilosc`, `data_dodania`) VALUES
(1, 1, 6, 2, '2024-12-24 17:18:55'),
(2, 1, 5, 1, '2024-12-24 17:18:57'),
(3, 1, 1, 1, '2024-12-24 17:18:58'),
(4, 1, 2, 1, '2024-12-24 17:19:00'),
(5, 1, 4, 2, '2024-12-24 17:19:07'),
(6, 2, 3, 1, '2024-12-24 17:20:12'),
(7, 2, 7, 1, '2024-12-24 17:20:18'),
(8, 1, 9, 1, '2024-12-25 16:36:03'),
(9, 1, 10, 3, '2024-12-25 18:39:22'),
(11, 1, 13, 1, '2024-12-26 16:15:30'),
(14, 4, 1, 1, '2025-01-16 15:37:53'),
(15, 4, 16, 1, '2025-01-16 15:38:03'),
(16, 4, 9, 1, '2025-01-16 15:38:10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `page_list`
--

CREATE TABLE `page_list` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_content` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `alias` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `page_list`
--

INSERT INTO `page_list` (`id`, `page_title`, `page_content`, `status`, `alias`) VALUES
(1, 'glowna', '        <main>\r\n			<article>\r\n				<header class=\"artheader\">\r\n					<h1><span style=\"color:#3F84E5\">Rodzaje komputerów</span></h1>\r\n				</header>\r\n				<section>\r\n					<header class=\"subheader\">\r\n						<h2>Komputer stacjonarny</h2>\r\n					</header>\r\n					<img style=\"float: left; margin: 6px;\" src=\"img/komputer1.png\" width=\"300\" height=\"200\" />\r\n						<span>\r\n                            <strong>Komputer stacjonarny</strong>, potocznie <em>desktop</em> – rodzaj komputera osobistego, który zwykle jest na stałe umiejscowiony przy biurku, <u>głównie ze względu na swoje <b>gabaryty i ciężar</b></u>. \r\n						</span>\r\n						<br><br>\r\n                        Składa się z co najmniej trzech zasadniczych elementów: jednostki systemowej, monitora i klawiatury.\r\n						<br><br>\r\n                        Niegdyś istniał podział na komputery <strong>biurowe</strong> i <strong>domowe</strong>, w którym domowe miały zazwyczaj mniejszą moc obliczeniową, ale za to więcej możliwości multimedialnych. Obecnie jednak ten podział zanikł, gdyż multimedialność jest już standardem w komputerach PC, a gry komputerowe – czyli jedno z popularnych zastosowań komputerów domowych – często wymagają dla wykorzystania pełni ich możliwości naprawdę mocnych maszyn, podczas gdy do typowych prac biurowych wystarczają znacznie tańsze zestawy w podstawowej konfiguracji.\r\n\r\n						<br>\r\n                        <br>\r\n                        <br>	\r\n                        <br>\r\n                        <br>\r\n                        <br>\r\n				</section>\r\n				\r\n				<section>\r\n					<header class=\"subheader\">\r\n						<h2>Laptop</h2>\r\n					</header>\r\n					\r\n					<img style=\"float: left; margin: 6px;\" src=\"img/laptop1.jpg\" width=\"300\" height=\"200\" />	\r\n											\r\n                    <strong>Laptop</strong> (z ang. lap - kolana, podołek + top - wierzch), <strong>notebook</strong> (z ang. <i>notebook, notatnik, zeszyt</i>) – rodzaj przenośnego komputera osobistego.\r\n                    <br /> </br />\r\n                    Do podtypów laptopów można zaliczyć ultrabooki i netbooki. Urządzeniami mniejszymi od laptopów są tablety i smartfony, które również są przenośnymi komputerami, choć nie są zgodne z IBM PC.\r\n                    <br /> </br />\r\n                    Pierwszym, jeszcze wizjonerskim urządzeniem z tej kategorii, był DYNABOOK. Jego projekt stworzył Alan Kay w laboratoriach Xerox Parc. \r\n                    <br /> </br />\r\n                    Szacuje się, że nawet dziś, w I dekadzie XXI wieku, jesteśmy zbyt ograniczeni technologicznie, by udało nam się skonstruować taki sprzęt. \r\n                    <br /> </br />\r\n                    Pierwszymi wyprodukowanymi przodkami laptopów były komputery przenośne, np. Osborne 1, Atari STacy czy Macintosh Portable. Z powodu zastosowania w nich akumulatorów kwasowo-ołowiowych komputery te ważyły od 9 do 14 kg.\r\n                    <br /> </br />\r\n                    <i>W 2004 roku 70% sprzedanych komputerów <span style=\"color:darkred\"><u>nie były</u></span> notebookami.</i>\r\n					\r\n				</section>\r\n\r\n                <header class=\"subheader\">\r\n                    <h2>Netbook</h2>\r\n                </header>\r\n                <section>\r\n                    <img style=\"float: left; margin: 6px;\" src=\"img/netbook1.jpg\" width=\"300\" height=\"200\" />\r\n\r\n<strong>Netbook</strong> – mały, przenośny komputer osobisty, zazwyczaj tańszy, lżejszy i mniej wydajny od tradycyjnego laptopa, przeznaczony do przeglądania Internetu, wideorozmów, aplikacji online oraz prac biurowych w podróży.\r\n<br /> </br />\r\nNetbooki posiadają zwykle systemy Linux, Windows Mobile, Windows XP lub Windows 7 oraz <b><u>energooszczędne procesory</u></b> Intel Celeron M ULV, Intel Atom, VIA C7, VIA Nano lub AMD Athlon Neo. Netbooki pracują zwykle na kartach Intel z rodziny GMA. Późniejsze modele posiadają również nVidia ION. \r\n<br /> </br />\r\nMają też niewielki, najwyżej 12,1-calowy ekran, dysk typu SSD lub tradycyjny dysk twardy oraz zmniejszoną klawiaturę. Zazwyczaj nie posiadają napędów optycznych, posiadają za to porty USB, czytniki kart pamięci, Wi-Fi oraz Bluetooth.\r\n                </section>\r\n                <br>\r\n                <br>\r\n                <br>\r\n                <br>\r\n                <br>\r\n                <br>\r\n\r\n                <header class=\"subheader\">\r\n                    <h2>Palmtop</h2>\r\n                </header>\r\n                <section>\r\n                    <img style=\"float: left; margin: 6px;\" src=\"img/palmtop1.png\" width=\"300\" height=\"250\" />\r\n\r\n<strong>Palmtop</strong> (komputer podręczny, ang. <i>personal digital assistant</i>, PDA) – zminiaturyzowany komputer mieszczący się w dłoni lub kieszeni. Wyposażony w miniaturową klawiaturę fizyczną, albo wyświetlaną na ekranie lub w oprogramowanie do rozpoznawania pisma ręcznego.\r\n<br /> </br />\r\nWe wczesnych latach XXI wieku palmtopy stopniowo zostały <u><b>prawie całkowicie wyparte przez smartfony, które oferowały podobne funkcje</b></u>.\r\n<br /> </br />\r\nPalmtopy mają wiele funkcji, między innymi kalendarz, terminarz, kalkulator, notatnik (także notatki odręczne), książkę adresową; ponadto umożliwiają czytanie e-booków, przechowywanie i przeglądanie zdjęć oraz filmów, edycję tekstów, współpracę z urządzeniami GPS, odtwarzanie muzyki, obsługę Internetu (WWW, e-mail, komunikatory internetowe, telnet, SSH). Niektóre z nich posiadają wbudowany moduł GSM, dyktafon, cyfrowy aparat fotograficzny oraz kamerę.\r\n<br /> </br />\r\nŁączność z innymi urządzeniami zapewniają palmtopom: porty podczerwieni (IrDA), Bluetooth oraz Wi-Fi. Do synchronizacji z komputerem stacjonarnym (celem zabezpieczenia przed utratą danych) oraz do instalowania programów, najczęściej wykorzystywane jest łącze szeregowe (np. USB) lub Bluetooth.\r\n<br /> </br />\r\nNajpopularniejsze palmtopy to urządzenia pracujące pod kontrolą systemów operacyjnych <span style=\"color:darkblue\">Windows Mobile</span> (zwane Pocket PC), <span style=\"color:darkslategray\">Palm OS</span> i <span style=\"color:darkcyan\">Nokia Internet Tablet OS</span>. Można też spotkać MDA (<i>mobile digital assistant</i>).\r\n<br /> </br />\r\n</div>\r\n                </section>\r\n	\r\n			</article>\r\n	\r\n	\r\n		</main>', 1, 'glowna'),
(2, 'peryferia', '<main>\r\n            <article>\r\n                <header class=\"artheader\">\r\n                    <h1><span style=\"color:#773344\">Urządzenia peryferyjne</span></h1>\r\n                </header>\r\n                <section>\r\n                    <header class=\"subheader\">\r\n                        <h2>Klawiatura</h2>\r\n                    </header>\r\n                    <img style=\"float: left; margin: 6px;\" src=\"../img/klawiatura.jpg\" width=\"300\" height=\"200\" />\r\n                        <span>\r\n                            <strong >Klawiatura komputerowa</strong> – uporządkowany zestaw klawiszy służący do ręcznego sterowania urządzeniem lub ręcznego wprowadzania danych. W zależności od spełnianej funkcji klawiatura zawiera różnego rodzaju klawisze – alfabetyczne, numeryczne, znaków specjalnych, funkcji specjalnych, o znaczeniu definiowanym przez użytkownika.\r\n                        </span>\r\n                        <br><br>\r\n                        Klawiatury występują w najróżniejszych urządzeniach domowych – klawiszowych instrumentach muzycznych, kalkulatorach, telefonach, tokenach; w szczególności jest to jeden z podzespołów wejściowych komputera. Aktualnie używane modele klawiatur komputerowych mają około 100 klawiszy. \r\n                        <br><br>\r\n                        Coraz częściej w klawiatury komputerowe wbudowuje się dodatkowe elementy sterujące (gładzik, dodatkowe przyciski, pokrętła, suwaki i inne), kontrolne (diody LED) i inne (np. czytnik kart pamięci, porty USB, gniazda do zestawu słuchawkowego) – najczęściej do obsługi multimediów.\r\n        \r\n                        <br>\r\n                        <br>\r\n                        <br>	\r\n                        <br>\r\n                        <br>\r\n                        <br>\r\n                </section>\r\n                \r\n                <section>\r\n                    <header class=\"subheader\">\r\n                        <h2>Monitor</h2>\r\n                    </header>\r\n                    \r\n                    <img style=\"float: left; margin: 6px;\" src=\"../img/monitor.jpg\" width=\"300\" height=\"200\" />	\r\n                                            \r\n                    <strong>Monitor komputerowy</strong> – ogólna nazwa jednego z urządzeń wyjścia do bezpośredniej komunikacji użytkownika z komputerem. Zadaniem monitora jest <u>natychmiastowa wizualizacja wyników działania programów uruchomionych na komputerze</u>.\r\n                    <br /> </br />\r\n                    Obecnie używane monitory to ekrany komputerowe, obsługiwane przez komputer zwykle za pośrednictwem karty graficznej, która jest elementem komputera bądź może być wbudowana w sam monitor.\r\n                    <br /> </br />\r\n                    Od momentu zagoszczenia komputerów w domach, jako komputery domowe, do ich obsługi używane były monitory CRT, ewentualnie zwykłe telewizory oparte na tej samej technologii. \r\n        Od około 2005 roku rynek monitorów został zdominowany przez monitory LCD, które nie wytwarzają tak intensywnego pola elektromagnetycznego i zajmują wielokrotnie mniej miejsca na biurkach. W najtańszych modelach sygnał jest jednak nadal przesyłany analogowo przez złącze D-Sub. \r\n        Bardziej bogato wyposażone modele posiadają gniazda cyfrowe, takie jak DVI, HDMI lub DisplayPort, pozwalające uzyskać znacznie lepszą jakość obrazu i wyższe rozdzielczości.\r\n                    \r\n                </section>\r\n                <br>\r\n                <br>\r\n                <br>\r\n                <br>\r\n                <br>\r\n                <header class=\"subheader\">\r\n                    <h2>Mysz</h2>\r\n                </header>\r\n                <section>\r\n                    <img style=\"float: left; margin: 6px;\" src=\"../img/mysz.JPG\" width=\"300\" height=\"200\" />\r\n        \r\n                    <strong>Mysz komputerowa</strong>, <strong><i>myszka</i></strong> – urządzenie wskazujące używane podczas pracy z interfejsem graficznym systemu komputerowego. \r\n                    Mysz umożliwia poruszanie kursorem po ekranie monitora poprzez przesuwanie jej po powierzchni płaskiej. Mysz odczytuje zmianę swojego położenia względem podłoża i wysyła ją w formie danych cyfrowych do komputera, który dokonuje odpowiedniej zmiany położenia kursora na ekranie. \r\n                    Najczęściej wyposażona jest w dwa przyciski i kółko do przewijania ekranu, które może również pełnić rolę trzeciego przycisku.\r\n        <br /> </br />\r\n                </section>\r\n                <br>\r\n                <br>\r\n                <br>\r\n                <br>\r\n                <br>\r\n                <br>\r\n                <br>\r\n                <br>\r\n        \r\n                <header class=\"subheader\">\r\n                    <h2>Drukarka</h2>\r\n                </header>\r\n                <section>\r\n                    <img style=\"float: left; margin: 6px;\" src=\"../img/drukarka.jpg\" width=\"300\" height=\"250\" />\r\n        \r\n                    <strong>Drukarka</strong> – urządzenie współpracujące z komputerem oraz innymi urządzeniami, służące do przenoszenia danego tekstu czy obrazu na różne nośniki druku (papier, folia, płótno itp.). Niektóre drukarki potrafią pracować bez komputera, np. drukować zdjęcia wykonane cyfrowym aparatem fotograficznym (po podłączeniu go do drukarki lub po włożeniu karty pamięci z zapisanymi zdjęciami do wbudowanego w drukarkę slotu). \r\n                    Obecnie produkowane są także urządzenia wielofunkcyjne, które są połączeniem drukarki, kserokopiarki, skanera, czy też faksu.\r\n                   \r\n        </div>\r\n                </section>\r\n        \r\n            </article>\r\n        \r\n        \r\n        </main>\r\n\r\n', 1, 'peryferia'),
(3, 'podzespoly', '  <main>\r\n            <article>\r\n                <header class=\"artheader\">\r\n                    <h1><span style=\"color:#387780\">Podzespoły komputera</span></h1>\r\n                </header>\r\n                <section>\r\n                    <header class=\"subheader\">\r\n                        <h2>Procesor</h2>\r\n                    </header>\r\n                    <img style=\"float: left; margin: 6px;\" src=\"../img/procesor.jpg\" width=\"300\" height=\"200\" />\r\n                        <span>\r\n                            <strong>Procesor</strong> (ang. central processing unit, CPU) – sekwencyjne urządzenie cyfrowe, które pobiera dane z pamięci operacyjnej lub strumienia danych, interpretuje je i wykonuje jako rozkazy, zwracając dane do pamięci lub wyjściowego strumienia danych. Termin ten w zawężonym znaczeniu jest używany w odniesieniu do jednostki centralnej (CPU) systemu, ale odnosi się również do innych elementów przetwarzających dane zwanych koprocesorami, takich jak jednostki do obliczeń na liczbach zmiennopozycyjnych, przetwarzania grafiki (GPU).\r\n                        </span>\r\n                        <br><br>\r\n                        Technika wykonywania procesorów zmienia się wraz z rozwojem elektroniki. Pierwotnie procesory były konstruowane przy użyciu wielu lamp próżniowych, później wielu pojedynczych tranzystorów, które zastępowano układami scalonymi małej skali integracji. W latach 70. XX wieku skonstruowano procesory składające się z jednego lub kilku układów scalonych wielkiej skali integracji określane jako mikroprocesory. Od lat 80. XX wieku niemal wszystkie procesory wykonuje się jako monolityczne układy scalone.\r\n                        <br><br>\r\n                        \r\n                        \r\n                        \r\n                </section>\r\n                <br><br><br><br><br><br><br>\r\n                <section>\r\n                    <header class=\"subheader\">\r\n                        <h2>Plyta główna</h2>\r\n                    </header>\r\n                    \r\n                    <img style=\"float: left; margin: 6px;\" src=\"../img/motherboard.png\" width=\"300\" height=\"200\" />	\r\n                                            \r\n                    <strong>Płyta główna</strong> (ang. motherboard, mainboard) – obwód drukowany urządzenia elektronicznego, na którym montuje się najważniejsze elementy, umożliwiając komunikację wszystkim pozostałym komponentom i modułom.\r\n                    <br /> </br />\r\n                    W niektórych konstrukcjach także gniazda do innych urządzeń zewnętrznych, do których sprzęt znajduje się na płycie głównej (port szeregowy, port równoległy, USB).\r\n        <br><br>\r\n        Koncepcję zbudowania komputera osobistego wyposażonego tylko w minimum potrzebnych urządzeń zmontowanych na jednej płycie drukowanej oraz gniazd, do których podłącza się dodatkowe urządzenia, zapoczątkowała firma IBM, wprowadzając komputer osobisty, zwany też PC.\r\n                    \r\n                </section>\r\n                <br><br><br><br><br><br>\r\n                <header class=\"subheader\">\r\n                    <h2>Pamięc masowa</h2>\r\n                </header>\r\n                <section>\r\n                    <img style=\"float: left; margin: 6px;\" src=\"../img/dysktwardy.jpg\" width=\"300\" height=\"200\" />\r\n                    \r\n                    <strong>Pamięć masowa</strong> (ang. mass storage) – pamięć trwała, która umożliwia przechowywanie dużych ilości danych przez długi czas. W odróżnieniu od pamięci operacyjnej, nie pozwala na adresowanie pojedynczych bajtów, a jej czas dostępu przez procesor jest wielokrotnie dłuższy. \r\n                    <br />\r\n                    Urządzenia pamięci masowej należą do tzw. urządzeń blokowych.\r\n                    <br />\r\n                    <br />\r\n                    Biorąc pod uwagę rodzaj zastosowanego nośnika danych można wyróżnić następujące rodzaje pamięci masowej:\r\n                    <br />\r\n                    \r\n                        <li>Nośnik magnetyczny (dysk HDD, dyskietka)</li>\r\n                        <li>Dysk optyczny (CD, CD-ROM, DVD-ROM)</li>\r\n                        <li>Pamięć półprzewodnikowa (dysk SSD, karta pamięci, pamięc wbudowana typu flash)</li>\r\n                    <br />\r\n                </section>\r\n                <br><br><br><br><br>\r\n                \r\n                \r\n        \r\n                <header class=\"subheader\">\r\n                    <h2>Karta graficzna</h2>\r\n                </header>\r\n                <section>\r\n                    <img style=\"float: left; margin: 6px;\" src=\"../img/gpu.jpg\" width=\"300\" height=\"250\" />\r\n        \r\n                    <strong>Karta graficzna</strong> – w węższym rozumieniu karta rozszerzeń komputera która przetwarza dane graficzne, adaptując je na sygnał odpowiedni do wyświetlenia przez monitor lub inne urządzenie wyjściowe. W szerszym znaczeniu obejmuje każdy układ zawierający procesor graficzny (GPU), niezależnie od tego, czy jest to karta rozszerzeń, zintegrowana część płyty głównej, procesora, specjalistyczny moduł przeznaczony do zastosowań naukowych, karty w sieciach neuronowych czy karty do kopania kryptowalut.\r\n                    <br />\r\n                    <br />\r\n                    <br />\r\n                    <br />\r\n                    <br />\r\n                    <br />\r\n                    <br />\r\n        </div>\r\n                </section>\r\n        \r\n            </article>\r\n </main>\r\n\r\n', 1, 'podzespoly'),
(4, 'systemy', ' <main>\r\n            <article>\r\n                <header class=\"artheader\">\r\n                    <h1><span style=\"color:#4D4861\">Systemy operacyjne</h1>\r\n                </header>\r\n                <section>\r\n                    <header class=\"subheader\">\r\n                        <h2>Windows</h2>\r\n                    </header>\r\n                    <img style=\"float: left; margin: 6px;\" src=\"../img/Windows.png\" width=\"300\" height=\"200\" />\r\n                        <span>\r\n                            <strong>Microsoft Windows</strong> – rodzina systemów operacyjnych stworzonych przez firmę Microsoft. Systemy rodziny Windows działają na telefonach, smartfonach, serwerach, systemach wbudowanych oraz na komputerach osobistych, z którymi są najczęściej kojarzone.\r\n            <br />            \r\n            <br />\r\n        Prezentację pierwszego graficznego środowiska pracy z rodziny Windows firmy Microsoft przeprowadzono w listopadzie 1984. Wówczas była to jedynie graficzna nakładka na system operacyjny MS-DOS, powstała w odpowiedzi na rosnącą popularność graficznych interfejsów użytkownika, takich jakie prezentowały na przykład komputery Macintosh. Nakładka, a później system operacyjny Windows po pewnym czasie zdominowała światowy rynek komputerów osobistych. \r\n        <br />\r\n        <br />\r\n        Pierwszym stabilnym wydaniem był Windows 1.01. Windows 1.00 był wersją beta, nigdy nie wydaną.\r\n        <br />\r\n        <br />\r\n        <br />\r\n                </section>\r\n                <br><br><br><br>\r\n                <section>\r\n                    <header class=\"subheader\">\r\n                        <h2>macOS</h2>\r\n                    </header>\r\n                    \r\n                    <img style=\"float: left; margin: 6px;\" src=\"../img/macos.png\" width=\"300\" height=\"200\" />	\r\n                                            \r\n                    <strong>macOS</strong> (dawniej OS X, a także Mac OS) – rodzina uniksowych systemów operacyjnych produkowanych i rozprowadzanych przez Apple Inc. Dostępny oficjalnie jedynie dla komputerów Macintosh, instalowany fabrycznie na nich od 2002 roku. 13 czerwca 2016 roku na WWDC została ogłoszona zmiana nazwy na macOS w związku z potrzebą unifikacji nazw używanych przez Apple dla swoich systemów operacyjnych (iOS, watchOS, tvOS).\r\n        <br />\r\n        <br />\r\n        macOS jest zbudowany na podstawie dawnego systemu NeXTStep z drugiej połowy lat 80., wykupionym przez Apple wraz z producentem tegoż systemu NeXT w 1996 r. Jest on następcą systemu Mac OS 9, wydanego w 1999 r. i ostatniej wersji „klasycznego” Mac OS, który był głównym systemem komputerów Macintosh od 1984 roku.\r\n        <br />\r\n        <br />\r\n        macOS oryginalnie działał jedynie na Macach o architekturze PowerPC. W 2006 wydano pierwszą wersję dla nowych Maców o architekturze x86 – Mac OS X 10.4. W 2005 roku wydano pierwszą wersję w pełni zgodną z Single UNIX Specification w wersji trzeciej – Mac OS X 10.5, działający zarówno na Macach PowerPC i x86 z pomocą technologii zwanej Universal binary, czyli formatu plików wykonywalnych działających na obu architekturach. 10.6 Snow Leopard to ostatnia wersja, która obsługuje programy dla procesorów PowerPC przy użyciu narzędzia Rosetta. Mac OS X 10.7 przestaje również obsługiwać komputery o architekturze 32-bitowej, ograniczając się do procesorów 64-bitowych.\r\n        <br />\r\n        <br />\r\n        Pierwszą opublikowaną wersją systemu był Mac OS X Server 1.0 z 1999 roku i Cheetah (wersja desktopowa) wydany 24 marca 2001 roku. Poszczególne wydania, do wydania 10.8 były nazywane nazwami pochodzącymi od wielkich kotów, np. OS X 10.8 nosi nazwę handlową Mountain Lion, czyli puma płowa. Obecnie nazwy systemów macOS pochodzą od parków krajobrazowych w Kalifornii, np. macOS Sierra. \r\n        <br>\r\n        Wersja serwerowa, OS X Server technicznie nie różniła się wiele od OS X – posiadała jedynie wiele wbudowanych aplikacji serwerowych. Obecnie, czyli od wersji Lion nie ma już możliwości zakupu OS X Server osobno – jest on dostępny jako pakiet aplikacji do macOS, a także ładowany do wersji serwerowych Maców Mini oraz Pro.\r\n        <br />\r\n        <br />\r\n        iOS, system firmy Apple działający na urządzeniach przenośnych iPhone, iPod Touch, oraz Apple TV drugiej i trzeciej generacji został stworzony w oparciu o macOS, z którym to dzieli jądro i wiele mechanizmów działania, jednak aplikacje dla macOS są tworzone za pomocą Cocoa, a dla iOS za pomocą Cocoa Touch dostosowanego do ekranów dotykowych.\r\n        <br />\r\n        <br />\r\n                </section>\r\n        \r\n                <header class=\"subheader\">\r\n                    <h2>Linux</h2>\r\n                </header>\r\n                <section>\r\n                    <img style=\"float: left; margin: 6px;\" src=\"../img/Ubuntu.png\" width=\"300\" height=\"200\" />\r\n        \r\n                    <strong>Linux</strong>  – rodzina uniksopodobnych systemów operacyjnych opartych na jądrze Linux. Linux jest jednym z przykładów wolnego i otwartego oprogramowania (FLOSS): jego kod źródłowy może być dowolnie wykorzystywany, modyfikowany i rozpowszechniany. \r\n        <br />\r\n        <br />\r\n        Od kwietnia 2017 roku Android (z zaadaptowanym jądrem Linuxa) oficjalnie jest najpopularniejszym systemem operacyjnym na świecie.\r\n        <br />\r\n        <br />\r\n        Pierwsza wersja jądra Linux została udostępniona publicznie 17 września 1991 dla architektury komputera PC, wykorzystującego mikroprocesor o architekturze IA-32. Do jądra dołączono narzędzia systemowe zwane też „Development Kit” oraz biblioteki z projektu GNU, aby otrzymać nadający się do użytku system operacyjny. Z tego powodu powstała też alternatywna nazwa kompletnego systemu: GNU/Linux. Jest udostępniany w formie dystrybucji Linuksa, składających się z jądra (niekiedy zmodyfikowanego w stosunku do oficjalnej wersji) i zestawu pakietów oprogramowania dobranego do różnorodnych wymagań. Dystrybucje zawierają głównie oprogramowanie na licencjach FLOSS, jednak najczęściej zawierają też lub pozwalają na doinstalowanie pewnej liczby programów na licencjach własnościowych.\r\n        <br />\r\n        <br />\r\n        Jednym z zastosowań Linuksa są środowiska serwerowe, dla których komercyjne wsparcie oferują firmy komputerowe, jak IBM, Oracle, Dell, Microsoft, Hewlett-Packard, Red Hat i Novell. Linux instalowany jest na różnorodnym sprzęcie komputerowym, np. komputerach biurkowych, superkomputerach i systemach wbudowanych, jak telefony komórkowe, routery oraz telewizory (np. LG, Samsung).\r\n        <br />\r\n        <br />\r\n                </section>\r\n                <br>\r\n                <br>\r\n        \r\n                <header class=\"subheader\">\r\n                    <h2>Android</h2>\r\n                </header>\r\n                <section>\r\n                    <img style=\"float: left; margin: 6px;\" src=\"../img/Android.png\" width=\"250\" height=\"400\" />\r\n        \r\n                    <strong>Android</strong> – system operacyjny z jądrem bazującym na Linuksie dla urządzeń mobilnych takich jak telefony komórkowe, smartfony, tablety (tablety PC) i netbooki. W 2013 roku był najpopularniejszym systemem mobilnym na świecie.\r\n        <br />\r\n        <br />\r\n        Główna część systemu jest otwartym oraz wolnym oprogramowaniem. Projekt ten nazywany jest Android Open Source Project (AOSP). W skład projektu wchodzą jądro oraz niektóre inne komponenty, które zaadaptowano do Androida. Opublikowane zostały one na licencji Apache 2.0 oraz GNU GPL (samo jądro Linux). Android nie zawiera natomiast kodu pochodzącego z projektu GNU. Cecha ta odróżnia Androida od wielu innych istniejących obecnie dystrybucji Linuksa. Początkowo był rozwijany przez firmę Android Inc. (kupioną później przez Google), następnie przeszedł pod skrzydła Open Handset Alliance.\r\n        <br />\r\n        <br />\r\n        Android zrzesza przy sobie dużą społeczność deweloperów piszących aplikacje, które poszerzają funkcjonalność urządzeń. W sierpniu 2014 było dla tego systemu dostępnych ponad 1,3 miliona aplikacji w Google Play (wcześniej Android Market).\r\n        <br />\r\n        <br />\r\n        Według danych serwisu StatCounter z kwietnia 2017 roku Android miał największe udziały na rynku systemów operacyjnych.\r\n        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />\r\n                </section>\r\n            </div>\r\n            </article>\r\n\r\n </main>\r\n\r\n', 1, 'systemy'),
(5, 'filmy', '<main>\r\n    <section>\r\n        <h1>Kurs html</h1>\r\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/k2IydkL3EOs?si=M72uithppYy4iQKy\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>\r\n<br>\r\n<h1>Kurs javascript</h1>\r\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/OcwON22ctYc?si=JoQj4lh8khkmbvW3\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>\r\n<br>\r\n<h1>Kurs php</h1>\r\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tD0Q5QwoQJI?si=JK3h4nZYMMCFLd2t\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>\r\n</section>\r\n\r\n</main>', 1, 'filmy'),
(6, 'kontakt_php', '', 1, 'kontakt'),
(7, 'javascript', '<script src=\"../js/kolorujtlo.js\" type=\"text/javascript\"></script>\r\n<script src=\"../js/liczenie.js\" type=\"text/javascript\"></script>\r\n<script src=\"../js/timedate.js\" type=\"text/javascript\"></script>\r\n<body onload=\"startclock()\"></body>\r\n\r\n\r\n            <div id=\"data\">  </div> \r\n            <br>\r\n            <div id=\"zegarek\"> </div>\r\n            \r\n\r\n        \r\n\r\n        <main>\r\n            <article>\r\n                <header class=\"artheader\">\r\n<h1>Test skyptów</h1>\r\n</header>\r\n\r\n\r\n<h2>JQuery test</h2>\r\n<div id=\"animacjaTestowa1\" class=\"test-block\">Kliknij, a się powiększę</div>\r\n\r\n    <div id=\"animacjaTestowa2\" class=\"test-block\">Najedź kursorem, a się powiększę</div>\r\n    \r\n    <div id=\"animacjaTestowa3\" class=\"test-block\">Klikaj, abym urósł</div>\r\n\r\n\r\n    <div id=\"content\">\r\n\r\n\r\n\r\n<header>\r\n    <h2>Zmiana kolorów</h2>\r\n</header>\r\n\r\n\r\n\r\n<form method=\"post\" name=\"background\">\r\n    <input type=\"button\" id=\"button\" value=\"żółty\" onclick=\"changeBackground(\'#FFF000\')\">\r\n    <br>\r\n    <br>\r\n    <input type=\"button\" id=\"button\" value=\"czarny\" onclick=\"changeBackground(\'#000000\')\">\r\n    <br>\r\n    <br>\r\n    <input type=\"button\" id=\"button\" value=\"biały\" onclick=\"changeBackground(\'#FFFFFF\')\">\r\n    <br>\r\n    <br>\r\n    <input type=\"button\" id=\"button\" value=\"zielony\" onclick=\"changeBackground(\'#00FF00\')\">\r\n    <br>\r\n    <br>\r\n    <input type=\"button\" id=\"button\" value=\"niebieski\" onclick=\"changeBackground(\'#0000FF\')\">\r\n    <br>\r\n    <br>\r\n    <input type=\"button\" id=\"button\" value=\"pomarańczowy\" onclick=\"changeBackground(\'#FFF800\')\">\r\n    <br>\r\n    <br>\r\n    <input type=\"button\" id=\"button\" value=\"szary\" onclick=\"changeBackground(\'#c0c0c0\')\">\r\n    <br>\r\n    <br>\r\n    <input type=\"button\" id=\"button\" value=\"czerwony\" onclick=\"changeBackground(\'#FF0000\')\">\r\n    <br>\r\n    <br>\r\n    <input type=\"button\" id=\"button\" value=\"Domyślny\" onclick=\"changeBackground(\'#303030\')\">\r\n    <br>\r\n    \r\n    </form>\r\n    <br>\r\n\r\n    \r\n    <script>\r\n\r\n\r\n        $(\"#animacjaTestowa1\").on(\"click\", function(){\r\n            $(this).animate({\r\n                width: \"500px\",\r\n                opacity: 0.4,\r\n                fontSize: \"3em\",\r\n                borderWidth: \"10px\"\r\n            }, 1500);\r\n        });\r\n    \r\n    \r\n        $(\"#animacjaTestowa2\").on(\"mouseover\", function(){\r\n            $(this).animate({\r\n                width: 300\r\n            }, 800);\r\n        }).on(\"mouseout\", function(){\r\n            $(this).animate({\r\n                width: 200\r\n            }, 800);\r\n        });\r\n    \r\n        $(\"#animacjaTestowa3\").on(\"click\", function() {\r\n            if (!$(this).is(\":animated\")) {\r\n                $(this).animate({\r\n                    width: \"+=50\",\r\n                    height: \"+=10\",\r\n                    opacity: \"+=0.1\"\r\n                }, {\r\n                    duration: 3000\r\n                });\r\n            }\r\n        });\r\n    </script>\r\n<br>\r\n\r\n\r\n<h1>Przelicznik miar</h1>\r\n<b>Długości</b>\r\n<br>\r\n<br>\r\n<div class=\"form-group\">\r\n    milimetr [mm] <input class=\"miary-dlugosci\" onkeyup=\"licz(this)\" id=\"miara1\" base=\"1\"><br><br>\r\n    centymetr [cm] <input class=\"miary-dlugosci\" onkeyup=\"licz(this)\" id=\"miara2\" base=\"10\"><br><br>\r\n    decymetr [dm] <input class=\"miary-dlugosci\" onkeyup=\"licz(this)\" id=\"miara3\" base=\"100\"><br><br>\r\n    metr [m] <input class=\"miary-dlugosci\" onkeyup=\"licz(this)\" id=\"miara4\" base=\"1000\"><br><br>\r\n    kilometr [km] <input class=\"miary-dlugosci\" onkeyup=\"licz(this)\" id=\"miara5\" base=\"1000000\"><br><br>\r\n</div>\r\n<div class=\"form-group\">\r\n<b>Wagi</b>\r\n<br>\r\n<br>\r\n    miligram [mg] <input class=\"form-control\" id=\"miara6\" type=\"text\" onkeyup=\"licz(this)\" base=\"1\"><br><br>\r\n    gram [g] <input class=\"form-control\" id=\"miara7\" type=\"text\" onkeyup=\"licz(this)\" base=\"1000\"><br><br>\r\n    dekagram [dg] <input class=\"form-control\" id=\"miara8\" type=\"text\" onkeyup=\"licz(this)\" base=\"10000\"><br><br>\r\n    kilogram [kg] <input class=\"form-control\" id=\"miara9\" type=\"text\" onkeyup=\"licz(this)\" base=\"1000000\"><br><br>\r\n    tona [T] <input class=\"form-control\" id=\"g9\" type=\"miara10\" onkeyup=\"licz(this)\" base=\"1000000000\"><br><br>\r\n\r\n</article>\r\n\r\n</main>\r\n', 1, 'javascript'),
(8, 'admin', '<div class=\"adminnav\">\r\n    \r\n    <input type=\"checkbox\" id=\"check\">\r\n\r\n    \r\n    <label for=\"check\" class=\"checkbtn\">\r\n      \r\n    </label>\r\n\r\n<ul>Panel administratora</ul>\r\n\r\n    <ul>\r\n        <li><a class=\"active\" href=\"index.php?idp=admin&action=list\">Lista podstron</a></li>\r\n        <li><a class=\"active\" href=\"index.php?idp=admin&action=add\">Dodaj nową podstronę</a></li>\r\n        <li><a class=\"active\" href=\"index.php?idp=admin&action=category_list\">Lista kategorii</a></li>\r\n        <li><a class=\"active\" href=\"index.php?idp=admin&action=category_add\">Dodaj nową kategorię</a></li>\r\n        <li><a class=\"active\" href=\"index.php?idp=admin&action=product_list\">Lista produktów</a></li>\r\n        <li><a class=\"active\" href=\"index.php?idp=admin&action=product_add\">Dodaj nowy produkt</a></li>\r\n        <li><a class=\"active\" href=\"index.php?idp=admin&action=logout\">Wyloguj</a></li>\r\n    </ul>\r\n  </div>', 1, 'admin'),
(9, 'sklep', '', 1, 'sklep');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `id` int(11) NOT NULL,
  `tytul` varchar(255) NOT NULL,
  `opis` text NOT NULL,
  `data_utworzenia` date NOT NULL,
  `data_modyfikacji` date NOT NULL,
  `data_wygasniecia` date NOT NULL,
  `cena_netto` decimal(10,2) NOT NULL,
  `podatek_vat` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `kategoria` int(11) NOT NULL,
  `gabaryt` varchar(50) NOT NULL,
  `zdjecie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produkty`
--

INSERT INTO `produkty` (`id`, `tytul`, `opis`, `data_utworzenia`, `data_modyfikacji`, `data_wygasniecia`, `cena_netto`, `podatek_vat`, `ilosc`, `status`, `kategoria`, `gabaryt`, `zdjecie`) VALUES
(1, 'Lenovo Legion 5', 'Laptop firmy Lenovo', '2024-12-15', '2024-12-15', '2025-01-29', 4000.00, 700, 10, 'dostępny', 4, 'średni', 'uploads/laptop-lenovo-legion-5.png'),
(2, 'Acer Chromebook Plus 515', 'Chromebook marki Acer', '2024-12-15', '2024-12-15', '2025-01-26', 1699.00, 400, 30, 'dostępny', 5, 'średni', 'uploads/chromebook.jpg'),
(3, 'LG UltraGear 24GN65R-B', 'Monitor firmy LG', '2024-12-15', '2024-12-15', '2025-01-16', 599.00, 150, 5, 'dostępny', 6, 'duży', 'uploads/p-lg-24gn60r-b.webp'),
(4, 'Podkładka pod myszkę', 'Podkładka pod myszkę', '2024-12-29', '2024-12-29', '2025-01-31', 50.00, 10, 100, 'dostępny', 8, 'mały', 'uploads/podkladka-pod-mysz-i-nadgarstek-fellowes.jpg'),
(5, 'Laptop ASUS ROG Strix G16', 'laptop ASUS ROG Strix G16', '2025-01-03', '2025-01-04', '2025-02-18', 5000.00, 800, 15, 'dostępny', 4, 'sredni', 'uploads/Laptop-ASUS-ROG-Strix-G16-G614JV-N3134-1.jpg'),
(6, 'Komputer LENOVO Legion T5', '26IRX9 i7-14650HX 32GB RAM 1TB SSD GeForce RTX4060Ti DLSS 3 Wi-Fi Windows 11 Home', '2025-01-06', '2025-01-07', '2025-02-27', 5999.00, 1400, 5, 'dostępny', 2, 'sredni', 'uploads/lenovo-legion-t5-26irb8-intel-core-i5-14400f-32-gb-1tb-ssd-w11h.webp'),
(7, 'Monitor SAMSUNG Odyssey G5', 'LS27CG552EUXEN 27&quot; 2560x1440px 165Hz 1 ms [MPRT] Curved', '2025-01-30', '2025-01-31', '2025-02-19', 699.00, 160, 3, 'dostępny', 7, 'sredni', 'uploads/Monitor-SAMSUNG-Odyssey-G5-LS27CG552EUXEN-01.jpg'),
(8, 'Smartfon SAMSUNG Galaxy S24 Ultra', '5G 12/256GB 6.8&amp;amp;amp;quot; 120Hz Czarny SM-S928', '2024-12-26', '2024-12-26', '2025-02-21', 4999.00, 1150, 25, 'dostępny', 9, 'mały', 'uploads/Smartfon-SAMSUNG-Galaxy-S24-Ultra-Czarny-logotyp.jpg'),
(9, 'Mysz LOGITECH G502 Hero', 'Typ myszy: Optyczna\r\nRozdzielczość: 25600 dpi\r\nKomunikacja z komputerem: Przewodowa\r\nInterfejs: USB\r\nDla graczy: Tak\r\nKolor: Czarny', '2024-12-25', '2024-12-25', '2025-02-28', 179.00, 40, 8, 'dostępny', 8, 'mały', 'uploads/Mysz-LOGITECH-G502-Hero-1.jpg'),
(10, 'Klawiatura MAD DOG GK910K', 'Typ klawiatury: Mechaniczna\r\nKomunikacja z komputerem: Przewodowa\r\nInterfejs: USB\r\nDla graczy: Tak\r\nPodświetlenie: Tak\r\nKolor: Czarny', '2024-12-25', '2024-12-25', '2025-03-12', 199.00, 35, 30, 'dostępny', 8, 'mały', 'uploads/Klawiatura-MAD-DOG-GK910K-Gateron-Red-Czarny-1.jpg'),
(11, 'Smartfon ONEPLUS 12', '12/256GB 5G 6.82&quot; 120Hz Czarny', '2024-12-26', '2024-12-26', '2025-02-20', 2999.00, 690, 5, 'dostępny', 9, 'mały', 'uploads/Smartfon-ONEPLUS-12-5G-Czarny-tyl-front.jpg'),
(12, 'LENOVO IdeaPad Slim 3', 'Chromebook Chrome 14M868 14&quot; MT520 8GB RAM 128GB eMMC Chrome OS', '2024-12-26', '2024-12-26', '2025-02-15', 699.00, 160, 3, 'dostępny', 5, 'średni', 'uploads/Laptop-LENOVO-IdeaPad-Slim-3-01-front.jpg'),
(13, 'Monitor SAMSUNG 24', 'LS24C366EAUXEN 24&amp;quot; 1920x1080px 4 ms [GTG] Curved', '2024-12-26', '2024-12-26', '2025-02-22', 349.00, 100, 7, 'dostępny', 6, 'średni', 'uploads/Monitor-SAMSUNG-LS24C366EAUXEN-front.jpg'),
(14, 'Lenovo Y700-17', 'i5-6300HQ/8GB/1000 GTX960M 1080p', '2025-01-16', '2025-01-16', '2025-01-31', 3465.00, 100, 10, 'dostępny', 4, 'średni', 'uploads/Y700.jpg'),
(15, 'Apple iPhone 15', '5G 128GB 6.1&quot; Czarny', '2024-12-06', '2024-12-06', '2025-03-31', 3319.00, 100, 50, 'dostępny', 9, 'mały', 'uploads/iphone-15-128gb-czarny.jpg'),
(16, 'MSI G27CQ4', 'Monitor 27&amp;quot; 2560x1440px 170Hz 1 ms [MPRT] Curved', '2024-12-19', '2024-12-19', '2025-02-28', 699.00, 100, 4, 'dostępny', 7, 'duży', 'uploads/Monitor-MSI.jpg');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `koszyki`
--
ALTER TABLE `koszyki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `klient_id` (`klient_id`),
  ADD KEY `produkt_id` (`produkt_id`);

--
-- Indeksy dla tabeli `page_list`
--
ALTER TABLE `page_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Indeksy dla tabeli `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategoria` (`kategoria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `koszyki`
--
ALTER TABLE `koszyki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `page_list`
--
ALTER TABLE `page_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `koszyki`
--
ALTER TABLE `koszyki`
  ADD CONSTRAINT `koszyki_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `klienci` (`id`),
  ADD CONSTRAINT `koszyki_ibfk_2` FOREIGN KEY (`produkt_id`) REFERENCES `produkty` (`id`);

--
-- Constraints for table `produkty`
--
ALTER TABLE `produkty`
  ADD CONSTRAINT `produkty_ibfk_1` FOREIGN KEY (`kategoria`) REFERENCES `kategorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
