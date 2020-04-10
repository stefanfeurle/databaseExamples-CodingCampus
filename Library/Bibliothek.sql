-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Apr 2020 um 15:37
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `library`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `biography` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`id`, `name`, `biography`) VALUES
(1, 'Eva Völler', NULL),
(2, 'Melody Beattie', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `parking_space_number` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `first_year_of_issue` year(4) NOT NULL,
  `publishing_company` varchar(100) NOT NULL,
  `author id` int(11) NOT NULL,
  `category id` int(11) NOT NULL,
  `company_book_number_library` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book`
--

INSERT INTO `book` (`parking_space_number`, `title`, `first_year_of_issue`, `publishing_company`, `author id`, `category id`, `company_book_number_library`) VALUES
(1, 'Kein Schwein ruft mich an', 2000, 'Edition Nova GmbH\r\nDornhalde 17\r\n73635 Rudersberg', 1, 5, ' ATU 65177168'),
(2, 'Mehr Kraft zum Loslassen', 2005, 'Wilhelm Heyne Verlag, München', 2, 8, ' ATU 65177168');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Krimi', NULL),
(2, 'Thriller', NULL),
(3, 'Fachliteratur', NULL),
(4, 'Sachbuch', NULL),
(5, 'Roman', NULL),
(6, 'Thriller', NULL),
(7, 'Gegenwartsliteratur', NULL),
(8, 'Ratgeber', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `library`
--

CREATE TABLE `library` (
  `company_book_number` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link_website` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `adress` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `library`
--

INSERT INTO `library` (`company_book_number`, `name`, `link_website`, `email`, `phone_number`, `adress`) VALUES
(' ATU 65177168', 'AK-Bibliothek Meiningen', 'https://ak-meiningen.webopac.at/search', 'bibliothek.meiningen@ak-vorarlberg.at', '05522 306 4510', 'Herrengasse 11111, 6812 Meiningen');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`parking_space_number`),
  ADD KEY `author id` (`author id`),
  ADD KEY `category id` (`category id`),
  ADD KEY `company_book_number_library` (`company_book_number_library`);

--
-- Indizes für die Tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`company_book_number`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `book`
--
ALTER TABLE `book`
  MODIFY `parking_space_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`author id`) REFERENCES `author` (`id`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`category id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`company_book_number_library`) REFERENCES `library` (`company_book_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
