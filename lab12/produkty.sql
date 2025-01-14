-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 09:32 PM
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
(4, 'Podkładka pod myszkę', 'Podkładka pod myszkę', '2025-01-22', '2025-01-28', '2025-01-31', 50.00, 10, 100, 'dostępny', 8, 'mały', 'uploads/podkladka-pod-mysz-i-nadgarstek-fellowes.jpg');

--
-- Indeksy dla zrzutów tabel
--

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
-- AUTO_INCREMENT for table `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produkty`
--
ALTER TABLE `produkty`
  ADD CONSTRAINT `produkty_ibfk_1` FOREIGN KEY (`kategoria`) REFERENCES `kategorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
