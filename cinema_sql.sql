-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 20. Apr 2020 um 09:07
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
-- Datenbank: `cinema`
--
CREATE DATABASE IF NOT EXISTS `cinema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cinema`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cinema_screening`
--

CREATE TABLE `cinema_screening` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `hall_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `cinema_screening`
--

INSERT INTO `cinema_screening` (`id`, `date`, `start_time`, `hall_id`, `movie_id`) VALUES
(1, '2020-05-01', '19:00:00', 1, 1),
(2, '2020-05-01', '22:00:00', 3, 1),
(3, '2020-05-01', '16:00:00', 1, 2),
(4, '2020-05-01', '19:00:00', 4, 2),
(5, '2020-05-01', '15:00:00', 1, 3),
(6, '2020-05-01', '16:30:00', 2, 3),
(7, '2020-05-01', '18:00:00', 2, 3),
(8, '2020-05-01', '22:00:00', 1, 4),
(9, '2020-05-01', '19:00:00', 5, 5),
(10, '2020-05-01', '20:30:00', 5, 5),
(11, '2020-05-01', '22:00:00', 5, 5),
(12, '2020-05-01', '19:00:00', 2, 6),
(13, '2020-05-01', '22:00:00', 4, 6),
(14, '2020-05-01', '15:00:00', 3, 7),
(15, '2020-05-01', '17:00:00', 3, 7),
(16, '2020-05-01', '16:00:00', 4, 8),
(17, '2020-05-01', '22:00:00', 2, 9),
(18, '2020-05-01', '16:00:00', 5, 10),
(19, '2020-05-01', '19:00:00', 3, 10),
(20, '2020-05-02', '19:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `username` varchar(60) NOT NULL,
  `password` varchar(50) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`username`, `password`, `first_name`, `last_name`, `email`, `phone_number`, `creation_date`) VALUES
('louis.tries', 'louis', 'Louis', 'Tries', 'louis.tries@gmail.com', '+43 676 7039385', '2020-04-11 11:15:50'),
('veri.mallmann', 'veri', 'Veri', 'Mallmann', 'veri.mallmann@gmail.com', '+43 676 2734344', '2020-04-16 14:07:21');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hall`
--

CREATE TABLE `hall` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rows_of_seats` int(4) NOT NULL,
  `seats_per_row` int(4) NOT NULL,
  `company_book_number_cinema` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `hall`
--

INSERT INTO `hall` (`id`, `name`, `rows_of_seats`, `seats_per_row`, `company_book_number_cinema`) VALUES
(1, 'Micky Maus', 5, 8, 'ATU 73199168'),
(2, 'Donald Duck', 5, 8, 'ATU 73199168'),
(3, 'Pluto', 5, 8, 'ATU 73199168'),
(4, 'Minnie Maus', 5, 8, 'ATU 73199168'),
(5, 'Daisy Duck', 5, 8, 'ATU 73199168');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `movie`
--

CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `age_limit` int(11) NOT NULL,
  `company_book_number_cinema` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `movie`
--

INSERT INTO `movie` (`id`, `title`, `description`, `duration`, `age_limit`, `company_book_number_cinema`) VALUES
(1, 'Ein verborgenes Leben', 'Biopic', 153, 10, 'ATU 73199168'),
(2, 'Le Parc', 'Ballett', 100, 8, 'ATU 73199168'),
(3, 'Trolls World Tour', 'Animation / Trick', 30, 4, 'ATU 73199168'),
(4, 'Hatsukoi (First Love)', 'Komödie / Krimi', 108, 16, 'ATU 73199168'),
(5, 'Black Widow', 'Abenteuer / Action / Science Fiction', 68, 14, 'ATU 73199168'),
(6, 'The Gentlemen', 'Action / Krimi', 143, 12, 'ATU 73199168'),
(7, 'Scooby!', 'Abenteuer / Animation Trick / Komödie', 78, 6, 'ATU 73199168'),
(8, 'Fast & Furios 9', 'Action', 105, 8, 'ATU 73199168'),
(9, 'Saw: Spiral', 'Horror', 98, 16, 'ATU 73199168'),
(10, 'Top Gun: Maverick', 'Action / Drama / Kriegsfilm', 143, 10, 'ATU 73199168');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `my_cinema`
--

CREATE TABLE `my_cinema` (
  `company_book_number` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `e-mail` varchar(100) NOT NULL,
  `homepage` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `my_cinema`
--

INSERT INTO `my_cinema` (`company_book_number`, `name`, `address`, `phone_number`, `e-mail`, `homepage`) VALUES
('ATU 73199168', 'Güfel OpenAirCinema Meiningen', 'Frauengasse 222\r\n6812 Meiningen', '+ 43 5522 86820', 'info@openair-cinema-meiningen.at', 'www.openair-cinema-meiningen.at');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `seats`
--

CREATE TABLE `seats` (
  `id` int(11) NOT NULL,
  `row_number` int(11) NOT NULL,
  `seat_per_row` int(11) NOT NULL,
  `is_free` tinyint(1) NOT NULL,
  `cinema_screening_id` int(11) NOT NULL,
  `ticket_order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `seats`
--

INSERT INTO `seats` (`id`, `row_number`, `seat_per_row`, `is_free`, `cinema_screening_id`, `ticket_order_id`) VALUES
(1, 1, 1, 1, 9, NULL),
(1, 1, 1, 1, 10, NULL),
(1, 1, 1, 1, 18, 6),
(2, 1, 2, 1, 9, NULL),
(2, 1, 2, 1, 10, NULL),
(2, 1, 2, 1, 18, NULL),
(3, 1, 3, 1, 9, NULL),
(3, 1, 3, 1, 10, NULL),
(3, 1, 3, 1, 18, NULL),
(4, 1, 4, 1, 9, NULL),
(4, 1, 4, 1, 10, NULL),
(4, 1, 4, 1, 18, NULL),
(5, 1, 5, 1, 9, NULL),
(5, 1, 5, 1, 10, NULL),
(5, 1, 5, 1, 18, NULL),
(6, 1, 6, 1, 9, NULL),
(6, 1, 6, 1, 10, NULL),
(6, 1, 6, 1, 18, NULL),
(7, 1, 7, 1, 9, NULL),
(7, 1, 7, 1, 10, NULL),
(7, 1, 7, 1, 18, NULL),
(8, 1, 8, 1, 9, NULL),
(8, 1, 8, 1, 10, NULL),
(8, 1, 8, 1, 18, NULL),
(9, 2, 1, 1, 9, NULL),
(9, 2, 1, 1, 10, NULL),
(9, 2, 1, 1, 18, NULL),
(10, 2, 2, 1, 9, NULL),
(10, 2, 2, 1, 10, NULL),
(10, 2, 2, 1, 18, NULL),
(11, 2, 3, 1, 9, NULL),
(11, 2, 3, 1, 10, NULL),
(11, 2, 3, 1, 18, NULL),
(12, 2, 4, 1, 9, NULL),
(12, 2, 4, 1, 10, NULL),
(12, 2, 4, 1, 18, NULL),
(13, 2, 5, 1, 9, NULL),
(13, 2, 5, 1, 10, NULL),
(13, 2, 5, 1, 18, NULL),
(14, 2, 6, 1, 9, NULL),
(14, 2, 6, 1, 10, NULL),
(14, 2, 6, 1, 18, NULL),
(15, 2, 7, 1, 9, NULL),
(15, 2, 7, 1, 10, NULL),
(15, 2, 7, 1, 18, NULL),
(16, 2, 8, 1, 9, NULL),
(16, 2, 8, 1, 10, NULL),
(16, 2, 8, 1, 18, NULL),
(17, 3, 1, 1, 9, NULL),
(17, 3, 1, 1, 10, NULL),
(17, 3, 1, 1, 18, NULL),
(18, 3, 2, 1, 9, NULL),
(18, 3, 2, 1, 10, NULL),
(18, 3, 2, 1, 18, NULL),
(19, 3, 3, 1, 9, NULL),
(19, 3, 3, 1, 10, NULL),
(19, 3, 3, 1, 18, NULL),
(20, 3, 4, 1, 9, NULL),
(20, 3, 4, 1, 10, NULL),
(20, 3, 4, 1, 18, NULL),
(21, 3, 5, 1, 9, NULL),
(21, 3, 5, 1, 10, NULL),
(21, 3, 5, 1, 18, NULL),
(22, 3, 6, 1, 9, NULL),
(22, 3, 6, 1, 10, NULL),
(22, 3, 6, 1, 18, NULL),
(23, 3, 7, 1, 9, NULL),
(23, 3, 7, 1, 10, NULL),
(23, 3, 7, 1, 18, NULL),
(24, 3, 8, 1, 9, NULL),
(24, 3, 8, 1, 10, NULL),
(24, 3, 8, 1, 18, NULL),
(25, 4, 1, 1, 9, NULL),
(25, 4, 1, 1, 10, NULL),
(25, 4, 1, 1, 18, NULL),
(26, 4, 2, 1, 9, NULL),
(26, 4, 2, 1, 10, NULL),
(26, 4, 2, 1, 18, NULL),
(27, 4, 3, 1, 9, NULL),
(27, 4, 3, 1, 10, NULL),
(27, 4, 3, 1, 18, NULL),
(28, 4, 4, 1, 9, NULL),
(28, 4, 4, 1, 10, NULL),
(28, 4, 4, 1, 18, NULL),
(29, 4, 5, 1, 9, NULL),
(29, 4, 5, 1, 10, NULL),
(29, 4, 5, 1, 18, NULL),
(30, 4, 6, 1, 9, NULL),
(30, 4, 6, 1, 10, NULL),
(30, 4, 6, 1, 18, NULL),
(31, 4, 7, 1, 9, NULL),
(31, 4, 7, 1, 10, NULL),
(31, 4, 7, 1, 18, NULL),
(32, 4, 8, 1, 9, NULL),
(32, 4, 8, 1, 10, NULL),
(32, 4, 8, 1, 18, NULL),
(33, 5, 1, 1, 9, NULL),
(33, 5, 1, 1, 10, NULL),
(33, 5, 1, 1, 18, NULL),
(34, 5, 2, 1, 9, NULL),
(34, 5, 2, 1, 10, NULL),
(34, 5, 2, 1, 18, NULL),
(35, 5, 3, 0, 9, 4),
(35, 5, 3, 0, 10, 5),
(35, 5, 3, 1, 18, NULL),
(36, 5, 4, 0, 9, 4),
(36, 5, 4, 0, 10, 5),
(36, 5, 4, 1, 18, NULL),
(37, 5, 5, 0, 9, 4),
(37, 5, 5, 1, 10, NULL),
(37, 5, 5, 1, 18, NULL),
(38, 5, 6, 0, 9, 4),
(38, 5, 6, 1, 10, NULL),
(38, 5, 6, 1, 18, NULL),
(39, 5, 7, 1, 9, NULL),
(39, 5, 7, 1, 10, NULL),
(39, 5, 7, 1, 18, NULL),
(40, 5, 8, 1, 9, NULL),
(40, 5, 8, 1, 10, NULL),
(40, 5, 8, 1, 18, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ticket_order`
--

CREATE TABLE `ticket_order` (
  `id` int(11) NOT NULL,
  `customer_username` varchar(60) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_cancelled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `ticket_order`
--

INSERT INTO `ticket_order` (`id`, `customer_username`, `creation_date`, `is_cancelled`) VALUES
(3, 'louis.tries', '2020-04-16 12:35:35', 1),
(4, 'louis.tries', '2020-04-16 13:11:19', 0),
(5, 'veri.mallmann', '2020-04-16 16:09:49', 0),
(6, 'louis.tries', '2020-04-20 06:59:59', 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `cinema_screening`
--
ALTER TABLE `cinema_screening`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hall id` (`hall_id`),
  ADD KEY `movie id` (`movie_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`username`);

--
-- Indizes für die Tabelle `hall`
--
ALTER TABLE `hall`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_book_number_cinema` (`company_book_number_cinema`);

--
-- Indizes für die Tabelle `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_book_number_cinema` (`company_book_number_cinema`);

--
-- Indizes für die Tabelle `my_cinema`
--
ALTER TABLE `my_cinema`
  ADD PRIMARY KEY (`company_book_number`);

--
-- Indizes für die Tabelle `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`,`cinema_screening_id`),
  ADD KEY `cinema_screening_id` (`cinema_screening_id`),
  ADD KEY `ticket_order_id` (`ticket_order_id`);

--
-- Indizes für die Tabelle `ticket_order`
--
ALTER TABLE `ticket_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_username` (`customer_username`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `cinema_screening`
--
ALTER TABLE `cinema_screening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT für Tabelle `hall`
--
ALTER TABLE `hall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `ticket_order`
--
ALTER TABLE `ticket_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `cinema_screening`
--
ALTER TABLE `cinema_screening`
  ADD CONSTRAINT `cinema_screening_ibfk_1` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`id`),
  ADD CONSTRAINT `cinema_screening_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);

--
-- Constraints der Tabelle `hall`
--
ALTER TABLE `hall`
  ADD CONSTRAINT `hall_ibfk_1` FOREIGN KEY (`company_book_number_cinema`) REFERENCES `my_cinema` (`company_book_number`);

--
-- Constraints der Tabelle `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`company_book_number_cinema`) REFERENCES `my_cinema` (`company_book_number`);

--
-- Constraints der Tabelle `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_2` FOREIGN KEY (`cinema_screening_id`) REFERENCES `cinema_screening` (`id`),
  ADD CONSTRAINT `seats_ibfk_3` FOREIGN KEY (`ticket_order_id`) REFERENCES `ticket_order` (`id`);

--
-- Constraints der Tabelle `ticket_order`
--
ALTER TABLE `ticket_order`
  ADD CONSTRAINT `ticket_order_ibfk_3` FOREIGN KEY (`customer_username`) REFERENCES `customer` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
