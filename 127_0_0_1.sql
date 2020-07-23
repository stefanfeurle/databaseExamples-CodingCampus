-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 23. Jul 2020 um 09:38
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
-- Datenbank: `car_trade`
--
CREATE DATABASE IF NOT EXISTS `car_trade` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `car_trade`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `id` int(11) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `features` varchar(250) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `color` varchar(50) NOT NULL,
  `serial_number` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `sold` tinyint(1) NOT NULL,
  `engine_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`id`, `brand`, `model`, `features`, `year`, `color`, `serial_number`, `price`, `sold`, `engine_id`) VALUES
(7, 'VW', 'Tiguan', 'RLine', 2019, 'Black', 'X1234', 50000, 0, NULL),
(8, 'VW', 'Tiguan', 'RLine', 2019, 'Black', 'X1234', 50000, 0, 2),
(9, 'VW', 'Tiguan', 'RLine', 2018, 'Black', 'X1235', 46000, 0, NULL),
(10, 'VW', 'Tiguan', 'RLine', 2017, 'Black', 'X1236', 40000, 0, NULL),
(11, 'VW', 'Tiguan', 'RLine', 2020, 'Grey', 'X1237', 56000, 0, NULL),
(12, 'VW', 'Tiguan', 'RLine', 2019, 'Grey', 'X1238', 50000, 0, NULL),
(13, 'VW', 'Tiguan', 'RLine', 2018, 'Gres', 'X1239', 46000, 0, NULL),
(14, 'VW', 'Tiguan', 'RLine', 2017, 'White', 'X1240', 40000, 0, NULL),
(15, 'VW', 'Tiguan', 'RLine', 2020, 'White', 'X1241', 56000, 0, NULL),
(16, 'VW', 'Tiguan', 'RLine', 2019, 'White', 'X1242', 50000, 0, NULL),
(17, 'VW', 'Tiguan', 'RLine', 2018, 'Black', 'X1243', 46000, 0, NULL),
(18, 'VW', 'Tiguan', 'RLine', 2017, 'Black', 'X1244', 40000, 0, NULL),
(19, 'VW', 'Tiguan', 'RLine', 2020, 'Black', 'X1245', 56000, 0, NULL),
(20, 'VW', 'Tiguan', 'RLine', 2019, 'Grey', 'X1246', 50000, 0, NULL),
(21, 'VW', 'Tiguan', 'RLine', 2018, 'Grey', 'X1247', 46000, 0, NULL),
(22, 'VW', 'Tiguan', '', 2017, 'Gres', 'X1248', 34000, 0, NULL),
(23, 'VW', 'Tiguan', '', 2020, 'White', 'X1249', 48000, 0, NULL),
(24, 'VW', 'Tiguan', '', 2019, 'White', 'X1250', 42000, 0, NULL),
(25, 'VW', 'Tiguan', '', 2018, 'White', 'X1251', 38000, 0, NULL),
(26, 'VW', 'Tiguan', '', 2017, 'Black', 'X1252', 34000, 0, NULL),
(27, 'VW', 'Tiguan', '', 2020, 'Black', 'X1253', 48000, 0, NULL),
(28, 'VW', 'Tiguan', '', 2019, 'Black', 'X1254', 42000, 0, NULL),
(29, 'VW', 'Tiguan', '', 2018, 'Grey', 'X1255', 38000, 0, NULL),
(30, 'VW', 'Tiguan', '', 2017, 'Grey', 'X1256', 34000, 0, NULL),
(31, 'VW', 'Tiguan', '', 2020, 'Gres', 'X1257', 48000, 0, NULL),
(32, 'VW', 'Tiguan', '', 2019, 'White', 'X1258', 42000, 0, NULL),
(33, 'VW', 'Tiguan', '', 2018, 'White', 'X1259', 38000, 0, NULL),
(34, 'VW', 'Tiguan', '', 2017, 'White', 'X1260', 34000, 0, NULL),
(35, 'VW', 'Tiguan', '', 2020, 'Black', 'X1261', 48000, 0, NULL),
(36, 'VW', 'Tiguan', '', 2019, 'Black', 'X1262', 42000, 0, NULL),
(37, 'VW', 'Tiguan', '', 2019, 'Black', 'X1262', 42000, 0, NULL),
(38, 'VW', 'Golf', '', 2019, 'Black', 'X2262', 36000, 0, NULL),
(39, 'VW', 'Golf', '', 2020, 'Black', 'X2263', 40000, 0, NULL),
(40, 'VW', 'Golf', '', 2018, 'Black', 'X2264', 30000, 0, NULL),
(41, 'VW', 'Golf', '', 2017, 'Black', 'X2265', 24000, 0, 1),
(42, 'VW', 'Golf', '', 2019, 'Grey', 'X2266', 36000, 0, NULL),
(43, 'VW', 'Golf', '', 2019, 'White', 'X2267', 36000, 0, NULL),
(44, 'VW', 'Golf', '', 2019, 'Red', 'X2268', 36000, 0, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `engine`
--

CREATE TABLE `engine` (
  `id` int(11) NOT NULL,
  `horsepower` int(11) DEFAULT NULL,
  `fuel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `engine`
--

INSERT INTO `engine` (`id`, `horsepower`, `fuel`) VALUES
(1, 150, 'Benzin'),
(2, 140, 'Diesel');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `engine_id` (`engine_id`),
  ADD KEY `ix_engine_id` (`engine_id`);

--
-- Indizes für die Tabelle `engine`
--
ALTER TABLE `engine`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `car`
--
ALTER TABLE `car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT für Tabelle `engine`
--
ALTER TABLE `engine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`engine_id`) REFERENCES `engine` (`id`);
--
-- Datenbank: `chat`
--
CREATE DATABASE IF NOT EXISTS `chat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `chat`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `received_message`
--

CREATE TABLE `received_message` (
  `id` int(11) NOT NULL,
  `sender` varchar(60) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `message` text NOT NULL,
  `is_unread` tinyint(1) NOT NULL,
  `user_user_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `received_message`
--

INSERT INTO `received_message` (`id`, `sender`, `creation_date`, `message`, `is_unread`, `user_user_name`) VALUES
(5, 'iris.wasserle', '2020-04-09 12:03:37', 'Hallo Schatz!', 0, 'stefan.wasserle'),
(6, 'stefan.wasserle', '2020-04-09 13:49:53', 'rn', 0, 'iris.wasserle'),
(7, 'stefan.wasserle', '2020-04-09 13:49:53', 'Frohe Ostern!', 0, 'iris.wasserle'),
(8, 'iris.wasserle', '2020-04-09 13:53:34', 'Viel Spass mit den Eiern!!', 0, 'iris.wasserle'),
(9, 'marc.unterhuber', '2020-04-10 07:29:43', 'hallo', 0, 'marc.unterhuber'),
(10, 'marc.unterhuber', '2020-04-10 10:23:49', 'hello', 0, 'stefan.wasserle'),
(11, 'stefan.wasserle', '2020-04-10 10:27:12', 'Hallo Marc! Wir wünschen dir und deiner Familie frohe Ostern! Danke für deine Unterstützung', 0, 'marc.unterhuber'),
(12, 'stefan.wasserle', '2020-04-16 15:32:49', 'hallo alte', 1, 'iris.wasserle');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sent_message`
--

CREATE TABLE `sent_message` (
  `id` int(11) NOT NULL,
  `receiver` varchar(60) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `message` text NOT NULL,
  `user_user_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `sent_message`
--

INSERT INTO `sent_message` (`id`, `receiver`, `creation_date`, `message`, `user_user_name`) VALUES
(1, 'stefan.wasserle', '2020-04-09 11:53:06', 'Hallo Schatz!', 'iris.wasserle'),
(2, 'iris.wasserle', '2020-04-09 12:44:55', 'rn', 'stefan.wasserle'),
(3, 'iris.wasserle', '2020-04-09 13:39:41', 'Frohe Ostern!', 'stefan.wasserle'),
(4, 'iris.wasserle', '2020-04-09 13:51:29', 'Viel Spass mit den Eiern!!', 'iris.wasserle'),
(5, 'marc.unterhuber', '2020-04-10 07:29:38', 'hallo', 'marc.unterhuber'),
(6, 'stefan.wasserle', '2020-04-10 08:50:52', 'hello', 'marc.unterhuber'),
(7, 'marc.unterhuber', '2020-04-10 10:26:11', 'Hallo Marc! Wir wünschen dir und deiner Familie frohe Ostern! Danke für deine Unterstützung', 'stefan.wasserle'),
(8, 'iris.wasserle', '2020-04-16 15:32:50', 'hallo alte', 'stefan.wasserle');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `user_name` varchar(60) NOT NULL,
  `password` varchar(50) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`user_name`, `password`, `first_name`, `last_name`, `email`, `creation_date`) VALUES
('iris.wasserle', 'iris', 'Iris', 'Wasserle', 'iris.wasserle@gmail.com', '2020-04-09 10:20:09'),
('marc.unterhuber', 'stefan4ever', 'marc', 'unterhuber', 'marc.unterhuber@wasserle.com', '2020-04-10 07:29:06'),
('stefan.wasserle', 'fun', 'Stefan', 'Wasserle', 'stefan.wasserle@gmail.com', '2020-04-08 13:00:03');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `received_message`
--
ALTER TABLE `received_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_user_name` (`user_user_name`);

--
-- Indizes für die Tabelle `sent_message`
--
ALTER TABLE `sent_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_user_name` (`user_user_name`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_name`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `received_message`
--
ALTER TABLE `received_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `sent_message`
--
ALTER TABLE `sent_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `received_message`
--
ALTER TABLE `received_message`
  ADD CONSTRAINT `received_message_ibfk_1` FOREIGN KEY (`user_user_name`) REFERENCES `user` (`user_name`);

--
-- Constraints der Tabelle `sent_message`
--
ALTER TABLE `sent_message`
  ADD CONSTRAINT `sent_message_ibfk_1` FOREIGN KEY (`user_user_name`) REFERENCES `user` (`user_name`);
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
(1, 1, 1, 0, 10, 7),
(1, 1, 1, 1, 18, 6),
(2, 1, 2, 1, 9, NULL),
(2, 1, 2, 0, 10, 7),
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
(6, 'louis.tries', '2020-04-20 06:59:59', 1),
(7, 'louis.tries', '2020-04-23 11:39:55', 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
--
-- Datenbank: `courses`
--
CREATE DATABASE IF NOT EXISTS `courses` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `courses`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `course_number` varchar(250) NOT NULL,
  `start_date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `course`
--

INSERT INTO `course` (`id`, `title`, `course_number`, `start_date_time`) VALUES
(1, 'ccAssement', 'CC456123', '2020-08-31 20:15:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(250) NOT NULL,
  `geb_date` date NOT NULL,
  `sv_nr` int(11) DEFAULT NULL,
  `account_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `person`
--

INSERT INTO `person` (`id`, `firstname`, `lastname`, `gender`, `geb_date`, `sv_nr`, `account_number`) VALUES
(1, 'stefan', 'wasserle', 'Mann', '1976-08-31', NULL, NULL),
(2, 'marc', 'unterhuber', 'Mann', '1992-07-14', NULL, NULL),
(3, 'didi', 'bergler', 'Mann', '1986-05-30', NULL, NULL),
(4, 'veri', 'mallmann', 'Frau', '1983-06-10', NULL, NULL),
(5, 'Louis', 'Tries', 'Mann', '1976-08-31', 344513, NULL),
(6, 'Veri', 'Mallmann', 'Frau', '1980-06-21', 455624, NULL);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Datenbank: `dcv`
--
CREATE DATABASE IF NOT EXISTS `dcv` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dcv`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `absence`
--

CREATE TABLE `absence` (
  `id` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `participant_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `units` int(11) DEFAULT NULL,
  `excused` tinyint(1) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  `reminder_id` int(11) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `absence`
--

INSERT INTO `absence` (`id`, `start`, `end`, `participant_id`, `course_id`, `units`, `excused`, `document_id`, `completed`, `reminder_id`, `comment`) VALUES
(1, '2020-07-10 11:03:41', NULL, 5, 1, 20, 1, NULL, 1, NULL, 'erster Eintrag'),
(2, '2020-07-22 11:07:33', NULL, 6, 3, 202, 0, 2, 0, NULL, 'Krank'),
(4, '2012-04-23 18:25:43', NULL, 1, 1, 4, 0, NULL, 1, NULL, 'Sick'),
(5, '2012-04-23 18:25:43', NULL, 1, 1, 4, 0, NULL, 1, NULL, 'Sick'),
(6, '2012-04-23 18:25:43', NULL, 1, 1, 4, 0, NULL, 1, NULL, 'Sick'),
(7, '2012-04-23 18:25:43', NULL, 1, 1, 4, 0, NULL, 1, NULL, 'Sick'),
(8, '2012-04-23 18:25:43', NULL, 1, 1, 4, 0, NULL, 1, NULL, 'Sick'),
(9, '2012-04-23 18:25:43', NULL, 1, 1, 4, 0, NULL, 1, NULL, 'Sick'),
(10, '2012-04-23 18:25:43', NULL, 1, 1, 4, 0, NULL, 1, NULL, 'Sick'),
(11, '2012-04-23 18:25:43', NULL, 1, 1, 4, 0, NULL, 1, NULL, 'Sick'),
(12, '2012-04-23 18:25:43', NULL, 1, 1, 4, 0, NULL, 1, NULL, 'Sick'),
(13, '2012-04-23 18:25:43', NULL, 1, 1, 4, 0, NULL, 1, NULL, 'Sick'),
(14, '2012-04-23 18:25:43', NULL, 1, 1, 4, 0, NULL, 1, NULL, 'Sick'),
(15, '2012-04-23 18:25:43', NULL, 51, 1, 4, 0, NULL, 1, NULL, 'Sick'),
(16, '2012-04-23 18:25:43', NULL, 52, 1, 4, 0, NULL, 1, NULL, 'Sick');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `street` varchar(200) DEFAULT NULL,
  `place` varchar(200) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `created@` datetime NOT NULL,
  `modified@` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `address`
--

INSERT INTO `address` (`id`, `street`, `place`, `zip`, `country`, `created@`, `modified@`) VALUES
(1, 'Hansastr 53', 'Bregenz', 7777, 'Austria', '2020-07-02 13:22:24', '2020-07-02 13:26:48'),
(4, 'Hansa str 53', 'Bregenz', 6870, 'Austria', '2020-07-03 10:32:37', '2020-07-03 10:32:37'),
(5, 'siemensstraße 77', 'Bregenz', 6800, 'Austria', '2020-07-06 13:49:12', '2020-07-06 13:49:12'),
(6, 'josef hutter str 77', 'Bregenz', 6800, 'Austria', '2020-07-06 13:49:12', '2020-07-06 13:49:12'),
(7, 'josef hutter str 70', 'Bregenz', 6800, 'Austria', '2020-07-06 13:49:12', '2020-07-06 13:49:12'),
(13, 'Valdunastraße 5', 'Rankweil', 6580, 'Austria', '2020-07-09 14:52:32', NULL),
(14, 'RüdigerStr 5', 'Lochau', 6850, 'Austria', '2020-07-10 09:29:18', '2020-07-10 09:29:19'),
(15, 'Hermanstr 5', 'Lochau', 6850, 'Austria', '2020-07-10 10:08:08', '2020-07-10 10:08:08'),
(16, 'Hermanstr 5', 'Klaus', 6850, 'Austria', '2020-07-10 10:09:06', '2020-07-10 10:09:06'),
(29, 'aaaa 1', NULL, 9562, NULL, '0001-01-01 00:00:00', NULL),
(30, 'Gänsleweg 53', 'Bregenz', 6800, 'Austria', '2020-07-02 13:22:24', '2020-07-02 13:26:48'),
(31, 'Färbergasse 15', 'Dornbirn', 6850, 'Dornbirn', '2020-07-14 10:08:58', NULL),
(32, 'Gässele 4', 'Feldkirch', 6800, 'Austria', '2020-07-14 11:25:59', NULL),
(35, 'MehrWeg 53', 'Bregenz', 6800, 'Austria', '2020-07-14 14:23:39', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `addressperson`
--

CREATE TABLE `addressperson` (
  `id` int(11) NOT NULL,
  `addressId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `contact_type` varchar(200) DEFAULT NULL,
  `billing_address` tinyint(4) NOT NULL,
  `created@` datetime DEFAULT NULL,
  `modified@` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `addressperson`
--

INSERT INTO `addressperson` (`id`, `addressId`, `personId`, `contact_type`, `billing_address`, `created@`, `modified@`) VALUES
(1, 1, 1, '1', 1, NULL, NULL),
(9, 14, 1, '1', 1, NULL, NULL),
(10, 15, 1, '0', 0, NULL, NULL),
(11, 16, 1, '0', 0, NULL, NULL),
(16, 29, 78, NULL, 0, NULL, NULL),
(25, 30, 89, '1', 1, NULL, NULL),
(26, 35, 90, '1', 1, '2020-07-14 14:23:39', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `adresslocation`
--

CREATE TABLE `adresslocation` (
  `id` int(11) NOT NULL,
  `adressId` int(11) NOT NULL,
  `locationId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `adresslocation`
--

INSERT INTO `adresslocation` (`id`, `adressId`, `locationId`) VALUES
(2, 1, 3),
(3, 1, 4),
(4, 13, 5),
(5, 31, 6),
(6, 32, 8),
(7, 32, 9),
(8, 32, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `isbn` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book`
--

INSERT INTO `book` (`id`, `isbn`, `title`, `location_id`, `person_id`, `quantity`) VALUES
(212, '11', 'TestBuch', 4, NULL, 15);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `classrooms`
--

CREATE TABLE `classrooms` (
  `id` int(11) NOT NULL,
  `room` varchar(100) NOT NULL,
  `facility_id` int(50) DEFAULT NULL,
  `course_id` int(50) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `classrooms`
--

INSERT INTO `classrooms` (`id`, `room`, `facility_id`, `course_id`, `image`, `description`, `title`, `subtitle`) VALUES
(3, 'room 5', 1, 1, 'asfafd', 'asfsaf', 'asfasf', 'afsasf'),
(4, 'Lager', 1, 1, NULL, NULL, NULL, NULL),
(5, 'Valduna Rankweil für erfahrene Entwickler', 1, 1, '', '', NULL, NULL),
(6, 'Room 1', 5, 1, 'C// desktop / image.png', 'Den Großteil unserer Kurse führen wir in eigenen Räumlichkeiten durch. An unserem Standort in Dornbirn verfügen wir über optimale Rahmenbedingungen mit technisch ausgereifter Ausstattung.', 'Campus Dornbirn', 'Im Rhomberg Areal in Dornbirn'),
(8, 'Seminarraum 2', 6, 13, 'bild', 'Hier stehen uns drei Seminarräume zur Verfügung. Die Tiefgarage beim Busplatz in Feldkirch verfügt über eine Vielzahl an Parkplätzen. Wenn Sie Ihr Parkticket bei der Info-Zentrale der Arbeiterkammer entwerten lassen, wer-den Ihnen drei Stunden Ihrer Parkzeit gut geschrieben.', 'Seminarraum II', 'Im AK-Gebäude in Feldkirch'),
(9, 'Seminarraum 1', 6, 11, 'no Image', 'Die Bushaltestellen Busplatz bzw. Katzenturm sind 4 Minuten zu Fuß von den Kursräumen des BFI der AK Vorarlberg entfernt, vom Bahnhof Feldkirch sind es ca. 14 Minuten.', 'Seminarraum I', 'Im AK-Gebäude in Feldkirch'),
(10, 'Seminarraum 3', 6, 3, 'no image', 'Der Kursraum befinden sich direkt gegenüber des Busbahnhofes in Feldkirch und ist mit nur 3 Gehminuten rasch erreichbar.', 'Seminarraum III', 'Im AK-Gebäude in Feldkirch');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `comment_value` text NOT NULL,
  `value_date` date NOT NULL,
  `created@` datetime NOT NULL,
  `modified@` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `comment`
--

INSERT INTO `comment` (`id`, `person_id`, `comment_value`, `value_date`, `created@`, `modified@`) VALUES
(4, 1, 'TEST comment', '2020-07-07', '2020-07-07 13:51:38', NULL),
(7, 1, 'Probiera', '2020-07-08', '2020-07-08 10:35:00', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `communication`
--

CREATE TABLE `communication` (
  `id` int(11) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `person_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `reminder_id` int(11) DEFAULT NULL,
  `created@` datetime NOT NULL,
  `modified@` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `communication`
--

INSERT INTO `communication` (`id`, `channel`, `person_id`, `date`, `comment`, `document_id`, `reminder_id`, `created@`, `modified@`) VALUES
(1, 'Email', 1, '2020-07-02 13:42:55', 'Testkonversation', 7, NULL, '2020-07-02 13:42:55', NULL),
(2, 'Email', 5, '2020-07-09 11:23:02', NULL, 2, NULL, '2020-07-09 11:23:02', '2020-07-09 11:23:02'),
(3, 'Email', 5, '2020-07-09 11:31:45', NULL, NULL, NULL, '2020-07-09 11:31:45', '2020-07-09 11:31:45'),
(4, 'Email', 5, '2020-07-09 11:44:36', NULL, 22, NULL, '2020-07-09 11:44:44', '2020-07-09 11:44:44'),
(5, 'Email', 5, '2020-07-09 11:45:54', NULL, 23, NULL, '2020-07-09 11:45:54', '2020-07-09 11:45:54'),
(7, 'Email', 3, '2020-07-09 11:57:06', NULL, 25, NULL, '2020-07-09 11:57:06', '2020-07-09 11:57:06'),
(8, 'Email', 5, '2020-07-09 11:57:06', NULL, 26, NULL, '2020-07-09 11:57:06', '2020-07-09 11:57:06'),
(10, 'Email', 1, '2020-07-09 13:33:57', NULL, 28, NULL, '2020-07-09 13:33:57', '2020-07-09 13:33:57'),
(11, 'Email', 2, '2020-07-09 13:33:57', NULL, 29, NULL, '2020-07-09 13:33:57', '2020-07-09 13:33:57'),
(12, 'Email', 4, '2020-07-09 13:33:57', NULL, 30, NULL, '2020-07-09 13:33:57', '2020-07-09 13:33:57'),
(13, 'Email', 1, '2020-07-09 14:34:10', NULL, 31, NULL, '2020-07-09 14:34:10', '2020-07-09 14:34:10'),
(14, 'Email', 5, '2020-07-09 14:35:29', NULL, 32, NULL, '2020-07-09 14:35:29', '2020-07-09 14:35:29'),
(15, 'Email', 2, '2020-07-09 14:36:07', NULL, 33, NULL, '2020-07-09 14:36:07', '2020-07-09 14:36:07'),
(16, 'Email', 4, '2020-07-09 14:36:12', NULL, 34, NULL, '2020-07-09 14:36:12', '2020-07-09 14:36:12'),
(17, 'Email', 5, '2020-07-09 14:38:50', NULL, 35, NULL, '2020-07-09 14:38:50', '2020-07-09 14:38:50'),
(18, 'Email', 5, '2020-07-09 14:53:22', NULL, NULL, NULL, '2020-07-09 14:53:22', '2020-07-09 14:53:22'),
(19, 'Email', 5, '2020-07-09 16:11:58', NULL, 37, NULL, '2020-07-09 16:11:58', '2020-07-09 16:11:58'),
(20, 'Email', 2, '2020-07-09 16:12:06', NULL, 38, NULL, '2020-07-09 16:12:06', '2020-07-09 16:12:06'),
(21, 'Email', 5, '2020-07-09 16:14:34', NULL, 39, NULL, '2020-07-09 16:14:34', '2020-07-09 16:14:34'),
(22, 'Email', 2, '2020-07-09 16:14:40', NULL, 40, NULL, '2020-07-09 16:14:40', '2020-07-09 16:14:40'),
(23, 'Email', 4, '2020-07-09 16:14:46', NULL, 41, NULL, '2020-07-09 16:14:46', '2020-07-09 16:14:46'),
(24, 'Email', 5, '2020-07-10 09:03:52', NULL, 42, NULL, '2020-07-10 09:03:52', '2020-07-10 09:03:52'),
(25, 'Email', 2, '2020-07-10 09:03:52', NULL, 43, NULL, '2020-07-10 09:03:52', '2020-07-10 09:03:52'),
(26, 'Email', 4, '2020-07-10 09:03:52', NULL, 44, NULL, '2020-07-10 09:03:52', '2020-07-10 09:03:52'),
(27, 'Email', 5, '2020-07-10 09:07:48', NULL, 45, NULL, '2020-07-10 09:07:48', '2020-07-10 09:07:48'),
(28, 'Email', 2, '2020-07-10 09:07:48', NULL, 46, NULL, '2020-07-10 09:07:48', '2020-07-10 09:07:48'),
(29, 'Email', 4, '2020-07-10 09:07:48', NULL, 47, NULL, '2020-07-10 09:07:48', '2020-07-10 09:07:48'),
(30, 'Email', 5, '2020-07-10 09:31:45', NULL, 48, NULL, '2020-07-10 09:31:45', '2020-07-10 09:31:45'),
(31, 'Email', 2, '2020-07-10 09:31:46', NULL, 49, NULL, '2020-07-10 09:31:46', '2020-07-10 09:31:46'),
(32, 'Email', 4, '2020-07-10 09:31:46', NULL, 50, NULL, '2020-07-10 09:31:46', '2020-07-10 09:31:46'),
(33, 'Email', 5, '2020-07-10 09:33:09', NULL, 51, NULL, '2020-07-10 09:33:09', '2020-07-10 09:33:09'),
(34, 'Email', 2, '2020-07-10 09:33:09', NULL, 52, NULL, '2020-07-10 09:33:09', '2020-07-10 09:33:09'),
(35, 'Email', 4, '2020-07-10 09:33:09', NULL, 53, NULL, '2020-07-10 09:33:09', '2020-07-10 09:33:09'),
(37, 'Email', 5, '2020-07-10 09:48:07', 'Sende Rechnung zum zweiten Mal', 55, NULL, '2020-07-10 09:48:07', '2020-07-10 09:48:07'),
(38, 'Email', 2, '2020-07-10 09:58:20', 'Sende Rechnung zum zweiten Mal', 56, NULL, '2020-07-10 09:58:20', '2020-07-10 09:58:20'),
(39, 'Email', 5, '2020-07-10 10:02:14', NULL, 57, NULL, '2020-07-10 10:02:14', '2020-07-10 10:02:14'),
(40, 'Email', 5, '2020-07-10 10:02:27', NULL, 58, NULL, '2020-07-10 10:02:27', '2020-07-10 10:02:27'),
(41, 'Email', 2, '2020-07-10 10:02:27', NULL, NULL, NULL, '2020-07-10 10:02:27', '2020-07-10 10:02:27'),
(42, 'Email', 4, '2020-07-10 10:02:27', NULL, NULL, NULL, '2020-07-10 10:02:27', '2020-07-10 10:02:27'),
(43, 'Email', 2, '2020-07-10 13:14:35', 'Sende Rechnung zum zweiten Mal', 61, NULL, '2020-07-10 13:14:35', '2020-07-10 13:14:35'),
(44, 'Email', 5, '2020-07-13 08:42:04', NULL, 62, NULL, '2020-07-13 08:42:04', '2020-07-13 08:42:04'),
(45, 'Email', 5, '2020-07-13 09:10:52', NULL, 63, NULL, '2020-07-13 09:10:52', '2020-07-13 09:10:52'),
(46, 'Email', 5, '2020-07-13 09:11:32', NULL, 64, NULL, '2020-07-13 09:11:32', '2020-07-13 09:11:32'),
(47, 'Email', 5, '2020-07-13 09:15:58', NULL, 65, NULL, '2020-07-13 09:15:58', '2020-07-13 09:15:58'),
(48, 'Email', 5, '2020-07-13 09:18:02', NULL, 66, NULL, '2020-07-13 09:18:02', '2020-07-13 09:18:02'),
(49, 'Email', 5, '2020-07-13 09:21:07', NULL, 67, NULL, '2020-07-13 09:21:07', '2020-07-13 09:21:07'),
(50, 'Email', 5, '2020-07-13 09:25:46', NULL, 68, NULL, '2020-07-13 09:25:46', '2020-07-13 09:25:46'),
(51, 'Email', 5, '2020-07-13 09:27:02', NULL, 69, NULL, '2020-07-13 09:27:02', '2020-07-13 09:27:02'),
(52, 'Email', 5, '2020-07-13 10:08:34', NULL, 70, NULL, '2020-07-13 10:08:34', '2020-07-13 10:08:34'),
(53, 'Email', 5, '2020-07-13 10:14:16', NULL, 71, NULL, '2020-07-13 10:14:16', '2020-07-13 10:14:16'),
(54, 'Email', 2, '2020-07-13 10:14:16', NULL, 72, NULL, '2020-07-13 10:14:16', '2020-07-13 10:14:16'),
(55, 'Email', 4, '2020-07-13 10:14:16', NULL, 73, NULL, '2020-07-13 10:14:16', '2020-07-13 10:14:16'),
(60, 'Email', 5, '2020-07-13 11:01:17', NULL, 78, NULL, '2020-07-13 11:01:17', '2020-07-13 11:01:17'),
(61, 'Email', 2, '2020-07-13 11:01:17', NULL, 79, NULL, '2020-07-13 11:01:17', '2020-07-13 11:01:17'),
(62, 'Email', 4, '2020-07-13 11:01:17', NULL, 80, NULL, '2020-07-13 11:01:17', '2020-07-13 11:01:17'),
(63, 'Email', 4, '2020-07-13 11:07:48', NULL, 81, NULL, '2020-07-13 11:07:48', '2020-07-13 11:07:48'),
(64, 'Email', 4, '2020-07-13 11:09:00', 'immer noch keine Rückmeldung', 82, NULL, '2020-07-13 11:09:00', '2020-07-13 11:28:31'),
(65, 'Email', 15, '2020-07-13 11:29:39', NULL, 83, NULL, '2020-07-13 11:29:39', '2020-07-13 11:29:39'),
(66, 'Email', 15, '2020-07-13 11:31:34', NULL, 84, NULL, '2020-07-13 11:31:34', '2020-07-13 11:31:34'),
(67, 'Email', 19, '2020-07-13 11:36:10', NULL, 85, NULL, '2020-07-13 11:36:10', '2020-07-13 11:36:10'),
(68, 'Email', 2, '2020-07-14 08:25:32', 'Letzte Mahnung', 90, NULL, '2020-07-14 08:25:32', '2020-07-14 08:25:32'),
(69, 'Email', 52, '2020-07-14 08:28:35', 'Letzte Mahnung', 91, NULL, '2020-07-14 08:28:35', '2020-07-14 08:28:35'),
(70, 'Email', 52, '2020-07-14 08:38:57', NULL, 92, NULL, '2020-07-14 08:38:57', '2020-07-14 08:38:57'),
(71, 'Email', 52, '2020-07-14 08:40:45', NULL, 93, NULL, '2020-07-14 08:40:45', '2020-07-14 08:40:45'),
(72, 'PhoneCall', 5, '2020-07-14 00:00:00', 'kurze Rückmeldung Fehlzeiten', NULL, NULL, '2020-07-14 09:11:23', '2020-07-14 09:11:23'),
(73, 'PhoneCall', 5, '2020-07-14 00:00:00', 'mündliche Zusage', NULL, NULL, '2020-07-14 09:15:55', '2020-07-14 09:15:55'),
(74, 'PhoneCall', 5, '2020-07-14 00:00:00', 'an offene Rechnung erinnert', NULL, NULL, '2020-07-14 09:21:18', '2020-07-14 09:21:18'),
(75, 'Email', 52, '2020-07-14 13:32:04', NULL, 94, NULL, '2020-07-14 13:32:15', '2020-07-14 13:32:15'),
(76, 'Email', 52, '2020-07-14 13:34:20', NULL, 95, NULL, '2020-07-14 13:34:28', '2020-07-14 13:34:28'),
(77, 'Email', 52, '2020-07-14 13:37:20', NULL, 96, NULL, '2020-07-14 13:37:20', '2020-07-14 13:37:20'),
(78, 'Email', 52, '2020-07-14 13:43:18', NULL, 97, NULL, '2020-07-14 13:43:18', '2020-07-14 13:43:18'),
(79, 'Email', 52, '2020-07-14 13:43:49', NULL, 98, NULL, '2020-07-14 13:43:49', '2020-07-14 13:43:49'),
(80, 'Email', 52, '2020-07-14 13:48:29', NULL, 99, NULL, '2020-07-14 13:48:29', '2020-07-14 13:48:29'),
(81, 'Email', 52, '2020-07-14 14:20:48', NULL, 100, NULL, '2020-07-14 14:20:48', '2020-07-14 14:20:48'),
(82, 'Email', 52, '2020-07-14 15:03:19', NULL, 101, NULL, '2020-07-14 15:03:19', '2020-07-14 15:03:19'),
(83, 'Email', 52, '2020-07-14 15:10:54', NULL, 102, NULL, '2020-07-14 15:10:54', '2020-07-14 15:10:54'),
(84, 'Email', 52, '2020-07-14 15:25:40', NULL, 103, NULL, '2020-07-14 15:25:40', '2020-07-14 15:25:40'),
(85, 'Email', 52, '2020-07-14 15:26:53', NULL, 104, NULL, '2020-07-14 15:26:53', '2020-07-14 15:26:53'),
(86, 'Email', 52, '2020-07-14 15:41:34', NULL, 105, NULL, '2020-07-14 15:41:34', '2020-07-14 15:41:34');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `communication_class`
--

CREATE TABLE `communication_class` (
  `id` int(11) NOT NULL,
  `communication_id` int(11) NOT NULL,
  `class` varchar(200) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `communication_class`
--

INSERT INTO `communication_class` (`id`, `communication_id`, `class`, `class_id`) VALUES
(1, 1, 'person', 7),
(2, 1, 'course', 1),
(3, 2, 'Course', 2),
(4, 3, 'Course', 3),
(5, 4, 'Course', 3),
(6, 5, 'Course', 3),
(8, 7, 'Course', 3),
(9, 8, 'Course', 3),
(11, 10, 'Course', 2),
(12, 11, 'Course', 2),
(13, 12, 'Course', 2),
(14, 13, 'Course', 2),
(15, 14, 'Course', 2),
(16, 15, 'Course', 2),
(17, 16, 'Course', 2),
(18, 17, 'Course', 2),
(19, 18, 'Course', 2),
(20, 19, 'Course', 2),
(21, 20, 'Course', 2),
(22, 21, 'Course', 2),
(23, 22, 'Course', 2),
(24, 23, 'Course', 2),
(25, 24, 'Course', 2),
(26, 25, 'Course', 2),
(27, 26, 'Course', 2),
(28, 27, 'Course', 2),
(29, 28, 'Course', 2),
(30, 29, 'Course', 2),
(31, 30, 'Course', 2),
(32, 31, 'Course', 2),
(33, 32, 'Course', 2),
(34, 33, 'Course', 2),
(35, 34, 'Course', 2),
(36, 35, 'Course', 2),
(38, 37, 'Course', 3),
(39, 38, 'Course', 3),
(40, 39, 'Course', 2),
(41, 40, 'Course', 2),
(42, 41, 'Course', 2),
(43, 42, 'Course', 2),
(44, 43, 'Course', 3),
(45, 44, 'Course', 2),
(46, 45, 'Course', 2),
(47, 46, 'Course', 2),
(48, 47, 'Course', 2),
(49, 48, 'Course', 2),
(50, 49, 'Course', 2),
(51, 50, 'Course', 2),
(52, 51, 'Course', 2),
(53, 52, 'Course', 2),
(54, 53, 'Course', 2),
(55, 54, 'Course', 2),
(56, 55, 'Course', 2),
(61, 60, 'Course', 2),
(62, 61, 'Course', 2),
(63, 62, 'Course', 2),
(64, 63, 'Course', 2),
(65, 64, 'Course', 2),
(66, 65, 'Course', 2),
(67, 66, 'Course', 2),
(68, 67, 'Course', 2),
(69, 68, 'Course', 3),
(70, 69, 'Course', 3),
(71, 70, 'Course', 2),
(72, 71, 'Course', 2),
(73, 74, 'Course', 12);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `art_of_communication` varchar(200) NOT NULL,
  `contact_value` varchar(200) NOT NULL,
  `contact_type` varchar(200) NOT NULL,
  `main_contact` tinyint(4) NOT NULL,
  `created@` datetime NOT NULL,
  `modified@` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `contact`
--

INSERT INTO `contact` (`id`, `person_id`, `art_of_communication`, `contact_value`, `contact_type`, `main_contact`, `created@`, `modified@`) VALUES
(1, 1, '0', '0550572455', '0', 0, '2020-07-07 13:42:31', NULL),
(2, 1, '1', 'Email@email.com', '0', 0, '2020-07-07 13:42:31', '2020-07-08 10:29:00'),
(4, 57, '1', 'herbert.gstoerte@hotmail.com', '0', 0, '2020-07-08 10:45:16', NULL),
(5, 58, '0', '0664548362', '0', 0, '2020-07-08 10:45:52', NULL),
(7, 52, '1', 'Martinus_Burtscher@yahoo.de', '1', 1, '2020-07-13 10:12:19', '2020-07-13 10:12:19'),
(13, 78, '0', '0699516845', '0', 0, '0001-01-01 00:00:00', NULL),
(22, 89, '1', 'b.test@hotmail.com', '1', 0, '2020-07-14 13:53:48', NULL),
(23, 89, '0', '0664421326', '1', 0, '2020-07-14 13:53:48', NULL),
(24, 90, '0', '0650650044', '1', 0, '2020-07-14 14:23:39', NULL),
(25, 90, '1', 't.test5401254@hotmail.com', '1', 0, '2020-07-14 14:23:39', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `topic` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `unit_estimation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `content`
--

INSERT INTO `content` (`id`, `topic`, `description`, `unit_estimation`) VALUES
(1, 'JavaTest', 'Wir lernen Java', 60),
(2, 'C#Test', 'Wir lernen C#', 80),
(3, 'Webtechnologien', 'Überblick über Webtechnologien', 10),
(4, 'Kaffeekochen', 'Bester Kaffee', 80),
(5, 'Bildschirm einschalten', 'Wie schaltet man einen Bildschirm ein', 1),
(8, 'Neuer Test', 'das ist ein Test', 5),
(9, 'Neuer Test', 'das ist ein Test', 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `course_number` varchar(15) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(250) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  `participant_max` int(11) DEFAULT NULL,
  `participant_min` int(11) DEFAULT NULL,
  `created@` datetime NOT NULL,
  `modified@` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `course`
--

INSERT INTO `course` (`id`, `title`, `course_number`, `description`, `category`, `start`, `end`, `unit`, `price`, `classroom_id`, `participant_max`, `participant_min`, `created@`, `modified@`) VALUES
(1, 'Superkurs', '20A80B', 'Hier ist alles super!', 'CodingCampus', '2020-07-09 13:38:53', '2020-07-30 13:38:53', 160, 99999, 3, 20, 5, '2020-07-02 13:38:53', NULL),
(3, 'Test Course', '231511', 'test', 'DigitalMarketingAcademy', '2020-07-06 15:41:19', '2020-07-31 15:41:27', 5, 566, 3, 0, 0, '2020-07-02 00:00:00', NULL),
(6, 'test', '12131', 'das darf nicht null sein ', 'DigitalSchool', '2019-07-24 15:41:23', '2019-08-28 15:41:31', 180, 1000, 3, 0, 0, '2020-07-06 12:09:49', NULL),
(11, 'Testno1', '234GHB', 'supertest', 'CodingCampus', '2021-04-01 09:00:00', '2021-04-25 09:00:00', 60, 500.99, 3, 20, 5, '2020-07-08 13:31:05', '2020-07-08 13:31:05'),
(12, 'TEst2', '694GHB', 'bester test', 'CodingCampus', '2021-08-01 09:00:00', '2021-09-25 09:00:00', 80, 1500.99, 3, 20, 5, '2020-07-09 15:05:55', '2020-07-09 15:05:55'),
(13, 'Testno2', '234GHB', 'supertest', 'CodingCampus', '2021-04-01 09:00:00', '2021-04-25 09:00:00', 60, 500.99, 3, 20, 5, '2020-07-13 13:17:36', '2020-07-13 13:17:36');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course_category`
--

CREATE TABLE `course_category` (
  `id` int(11) NOT NULL,
  `category` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `course_category`
--

INSERT INTO `course_category` (`id`, `category`) VALUES
(1, 'Coding Campus'),
(2, 'Digital Marketing Academy'),
(3, 'E Learning Diploma'),
(4, 'Digital School'),
(5, 'Skills Initiative'),
(6, 'Digital Masterclass'),
(7, 'Digital Studies'),
(8, 'Digital Business');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course_content`
--

CREATE TABLE `course_content` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `units` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `course_content`
--

INSERT INTO `course_content` (`id`, `course_id`, `content_id`, `units`) VALUES
(1, 1, 2, 90),
(2, 1, 1, 60),
(3, 11, 1, 20),
(4, 11, 3, 50),
(5, 11, 4, 80),
(6, 12, 1, 0),
(7, 12, 3, 0),
(8, 12, 4, 0),
(9, 13, 1, 20);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course_participants`
--

CREATE TABLE `course_participants` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `completed` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `course_participants`
--

INSERT INTO `course_participants` (`id`, `course_id`, `participant_id`, `completed`) VALUES
(1, 1, 1, 1),
(2, 3, 1, 0),
(3, 1, 15, 0),
(4, 1, 15, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course_subvention`
--

CREATE TABLE `course_subvention` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `subvention_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `course_subvention`
--

INSERT INTO `course_subvention` (`id`, `course_id`, `subvention_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course_trainer`
--

CREATE TABLE `course_trainer` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `course_trainer`
--

INSERT INTO `course_trainer` (`id`, `course_id`, `trainer_id`) VALUES
(1, 1, 5),
(2, 1, 52),
(3, 3, 3),
(4, 6, 1),
(6, 11, 1),
(7, 11, 2),
(8, 12, 1),
(9, 12, 2),
(10, 13, 1),
(11, 13, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `display`
--

CREATE TABLE `display` (
  `id` int(11) NOT NULL,
  `serial_number` varchar(50) DEFAULT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `display`
--

INSERT INTO `display` (`id`, `serial_number`, `make`, `model`, `location_id`) VALUES
(29, '', 'Lenovo', 'ThinkVision', 8),
(30, 'KLM-932', 'BenQ Beamer', 'LightUp36', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `name` varchar(100) NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `reminder_id` int(11) DEFAULT NULL,
  `created@` datetime NOT NULL,
  `modified@` datetime DEFAULT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `documents`
--

INSERT INTO `documents` (`id`, `url`, `name`, `comment`, `reminder_id`, `created@`, `modified@`, `type`) VALUES
(2, 'tesPaht3', 'anmeldung', NULL, NULL, '2020-07-03 10:33:39', NULL, 'Other'),
(3, 'hghg', 'gfgf', 'gfgf', NULL, '0000-00-00 00:00:00', NULL, ''),
(4, 'path', 'Dok2', 'Dies ist ein Dokument', NULL, '2020-07-07 09:28:30', '2020-07-07 09:28:30', 'Invitation'),
(5, 'path', 'Dok2', 'Dies ist ein Dokument', NULL, '2020-07-07 09:31:33', '2020-07-07 09:31:33', 'Invitation'),
(6, 'path', 'Dok2', 'Dies ist ein Dokument', NULL, '2020-07-07 09:36:31', '2020-07-07 09:36:31', 'Invitation'),
(7, 'path', 'Dok2', 'Dies ist ein Dokument', NULL, '2020-07-07 09:47:28', '2020-07-07 09:47:28', 'Invitation'),
(8, 'path', 'Dok2', 'Dies ist ein Dokument', NULL, '2020-07-07 09:47:44', '2020-07-07 09:47:44', 'Invitation'),
(9, 'path', 'Dok2', 'Dies ist ein Dokument', NULL, '2020-07-07 09:52:17', '2020-07-07 09:52:17', 'Invitation'),
(10, 'path', 'Dok2', 'Dies ist ein Dokument', NULL, '2020-07-07 09:59:19', '2020-07-07 09:59:19', 'Invitation'),
(11, 'path', 'Dok2', 'Dies ist ein Dokument', NULL, '2020-07-07 10:31:14', '2020-07-07 10:31:14', 'Invitation'),
(22, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Invitation\\Invitation_Huber_132387614128362663.pdf', 'Invitation_Huber_132387614128362663.pdf', 'Document created from Template', NULL, '2020-07-09 11:43:59', '2020-07-09 11:43:59', 'Invitation'),
(23, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Invitation\\Invitation_Huber_132387615546456706.pdf', 'Invitation_Huber_132387615546456706.pdf', 'Document created from Template', NULL, '2020-07-09 11:45:54', '2020-07-09 11:45:54', 'Invitation'),
(24, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Invitation\\Invitation_Johnson_132387622259415158.pdf', 'Invitation_Johnson_132387622259415158.pdf', 'Document created from Template', NULL, '2020-07-09 11:57:05', '2020-07-09 11:57:05', 'Invitation'),
(25, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Invitation\\Invitation_hubi_132387622263026332.pdf', 'Invitation_hubi_132387622263026332.pdf', 'Document created from Template', NULL, '2020-07-09 11:57:06', '2020-07-09 11:57:06', 'Invitation'),
(26, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Invitation\\Invitation_Haha_132387622263903789.pdf', 'Invitation_Haha_132387622263903789.pdf', 'Document created from Template', NULL, '2020-07-09 11:57:06', '2020-07-09 11:57:06', 'Invitation'),
(28, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_ Person_132387680368845664.pdf', 'Diploma_ Person_132387680368845664.pdf', 'Document created from Template', NULL, '2020-07-09 13:33:56', '2020-07-09 13:33:56', 'Diploma'),
(29, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Nachname_132387680372667744.pdf', 'Diploma_Nachname_132387680372667744.pdf', 'Document created from Template', NULL, '2020-07-09 13:33:57', '2020-07-09 13:33:57', 'Diploma'),
(30, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Huhu_132387680373803969.pdf', 'Diploma_Huhu_132387680373803969.pdf', 'Document created from Template', NULL, '2020-07-09 13:33:57', '2020-07-09 13:33:57', 'Diploma'),
(31, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_ Person_132387716502621528.pdf', 'Diploma_ Person_132387716502621528.pdf', 'Document created from Template', NULL, '2020-07-09 14:34:10', '2020-07-09 14:34:10', 'Diploma'),
(32, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132387717288678155.pdf', 'Diploma_Haha_132387717288678155.pdf', 'Document created from Template', NULL, '2020-07-09 14:35:28', '2020-07-09 14:35:28', 'Diploma'),
(33, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Nachname_132387717670384148.pdf', 'Diploma_Nachname_132387717670384148.pdf', 'Document created from Template', NULL, '2020-07-09 14:36:07', '2020-07-09 14:36:07', 'Diploma'),
(34, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Huhu_132387717723731538.pdf', 'Diploma_Huhu_132387717723731538.pdf', 'Document created from Template', NULL, '2020-07-09 14:36:12', '2020-07-09 14:36:12', 'Diploma'),
(35, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132387719301373820.pdf', 'Diploma_Haha_132387719301373820.pdf', 'Document created from Template', NULL, '2020-07-09 14:38:50', '2020-07-09 14:38:50', 'Diploma'),
(37, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132387775180316718.pdf', 'Diploma_Haha_132387775180316718.pdf', 'Document created from Template', NULL, '2020-07-09 16:11:58', '2020-07-09 16:11:58', 'Diploma'),
(38, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Nachname_132387775262005935.pdf', 'Diploma_Nachname_132387775262005935.pdf', 'Document created from Template', NULL, '2020-07-09 16:12:06', '2020-07-09 16:12:06', 'Diploma'),
(39, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132387776746821590.pdf', 'Diploma_Haha_132387776746821590.pdf', 'Document created from Template', NULL, '2020-07-09 16:14:34', '2020-07-09 16:14:34', 'Diploma'),
(40, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Nachname_132387776808346297.pdf', 'Diploma_Nachname_132387776808346297.pdf', 'Document created from Template', NULL, '2020-07-09 16:14:40', '2020-07-09 16:14:40', 'Diploma'),
(41, '\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Huhu_132387776868325799.pdf', 'Diploma_Huhu_132387776868325799.pdf', 'Document created from Template', NULL, '2020-07-09 16:14:46', '2020-07-09 16:14:46', 'Diploma'),
(42, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132388382315658854.pdf', 'Diploma_Haha_132388382315658854.pdf', 'Document created from Template', NULL, '2020-07-10 09:03:51', '2020-07-10 09:03:51', 'Diploma'),
(43, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Nachname_132388382321452651.pdf', 'Diploma_Nachname_132388382321452651.pdf', 'Document created from Template', NULL, '2020-07-10 09:03:52', '2020-07-10 09:03:52', 'Diploma'),
(44, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Huhu_132388382323034084.pdf', 'Diploma_Huhu_132388382323034084.pdf', 'Document created from Template', NULL, '2020-07-10 09:03:52', '2020-07-10 09:03:52', 'Diploma'),
(45, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132388384680974457.pdf', 'Diploma_Haha_132388384680974457.pdf', 'Document created from Template', NULL, '2020-07-10 09:07:48', '2020-07-10 09:07:48', 'Diploma'),
(46, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Nachname_132388384684989788.pdf', 'Diploma_Nachname_132388384684989788.pdf', 'Document created from Template', NULL, '2020-07-10 09:07:48', '2020-07-10 09:07:48', 'Diploma'),
(47, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Huhu_132388384686367326.pdf', 'Diploma_Huhu_132388384686367326.pdf', 'Document created from Template', NULL, '2020-07-10 09:07:48', '2020-07-10 09:07:48', 'Diploma'),
(48, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132388399043178451.pdf', 'Diploma_Haha_132388399043178451.pdf', 'Document created from Template', NULL, '2020-07-10 09:31:45', '2020-07-10 09:31:45', 'Diploma'),
(49, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Nachname_132388399059925327.pdf', 'Diploma_Nachname_132388399059925327.pdf', 'Document created from Template', NULL, '2020-07-10 09:31:46', '2020-07-10 09:31:46', 'Diploma'),
(50, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Huhu_132388399061017198.pdf', 'Diploma_Huhu_132388399061017198.pdf', 'Document created from Template', NULL, '2020-07-10 09:31:46', '2020-07-10 09:31:46', 'Diploma'),
(51, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132388399883617546.pdf', 'Diploma_Haha_132388399883617546.pdf', 'Document created from Template', NULL, '2020-07-10 09:33:09', '2020-07-10 09:33:09', 'Diploma'),
(52, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Nachname_132388399897573452.pdf', 'Diploma_Nachname_132388399897573452.pdf', 'Document created from Template', NULL, '2020-07-10 09:33:09', '2020-07-10 09:33:09', 'Diploma'),
(53, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Huhu_132388399898930846.pdf', 'Diploma_Huhu_132388399898930846.pdf', 'Document created from Template', NULL, '2020-07-10 09:33:09', '2020-07-10 09:33:09', 'Diploma'),
(54, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Johnson_132388408850874314.pdf', 'Diploma_Johnson_132388408850874314.pdf', 'Document created from Template', NULL, '2020-07-10 09:48:06', '2020-07-10 09:48:06', 'Diploma'),
(55, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132388408875256851.pdf', 'Diploma_Haha_132388408875256851.pdf', 'Document created from Template', NULL, '2020-07-10 09:48:07', '2020-07-10 09:48:07', 'Diploma'),
(56, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Nachname_132388414987285355.pdf', 'Diploma_Nachname_132388414987285355.pdf', 'Document created from Template', NULL, '2020-07-10 09:58:20', '2020-07-10 09:58:20', 'Diploma'),
(57, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132388417331451156.pdf', 'Diploma_Haha_132388417331451156.pdf', 'Document created from Template', NULL, '2020-07-10 10:02:13', '2020-07-10 10:02:13', 'Diploma'),
(58, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132388417462465467.pdf', 'Diploma_Haha_132388417462465467.pdf', 'Document created from Template', NULL, '2020-07-10 10:02:27', '2020-07-10 10:02:27', 'Diploma'),
(61, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Nachname_132388532743873499.pdf', 'Diploma_Nachname_132388532743873499.pdf', 'Document created from Template', NULL, '2020-07-10 13:14:35', '2020-07-10 13:14:35', 'Diploma'),
(62, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132390961237274104.pdf', 'Diploma_Haha_132390961237274104.pdf', 'Document created from Template', NULL, '2020-07-13 08:42:04', '2020-07-13 08:42:04', 'Diploma'),
(63, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132390978515233959.pdf', 'Diploma_Haha_132390978515233959.pdf', 'Document created from Template', NULL, '2020-07-13 09:10:52', '2020-07-13 09:10:52', 'Diploma'),
(64, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132390978912393846.pdf', 'Diploma_Haha_132390978912393846.pdf', 'Document created from Template', NULL, '2020-07-13 09:11:31', '2020-07-13 09:11:31', 'Diploma'),
(65, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132390981581287019.pdf', 'Diploma_Haha_132390981581287019.pdf', 'Document created from Template', NULL, '2020-07-13 09:15:58', '2020-07-13 09:15:58', 'Diploma'),
(66, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132390982814708748.pdf', 'Diploma_Haha_132390982814708748.pdf', 'Document created from Template', NULL, '2020-07-13 09:18:02', '2020-07-13 09:18:02', 'Diploma'),
(67, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132390984663514739.pdf', 'Diploma_Haha_132390984663514739.pdf', 'Document created from Template', NULL, '2020-07-13 09:21:07', '2020-07-13 09:21:07', 'Diploma'),
(68, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132390987454231689.pdf', 'Diploma_Haha_132390987454231689.pdf', 'Document created from Template', NULL, '2020-07-13 09:25:46', '2020-07-13 09:25:46', 'Diploma'),
(69, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132390988214177471.pdf', 'Diploma_Haha_132390988214177471.pdf', 'Document created from Template', NULL, '2020-07-13 09:27:02', '2020-07-13 09:27:02', 'Diploma'),
(70, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132391013139931089.pdf', 'Diploma_Haha_132391013139931089.pdf', 'Document created from Template', NULL, '2020-07-13 10:08:34', '2020-07-13 10:08:34', 'Diploma'),
(71, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132391016534919904.pdf', 'Diploma_Haha_132391016534919904.pdf', 'Document created from Template', NULL, '2020-07-13 10:14:16', '2020-07-13 10:14:16', 'Diploma'),
(72, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Nachname_132391016564935484.pdf', 'Diploma_Nachname_132391016564935484.pdf', 'Document created from Template', NULL, '2020-07-13 10:14:16', '2020-07-13 10:14:16', 'Diploma'),
(73, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Huhu_132391016566288036.pdf', 'Diploma_Huhu_132391016566288036.pdf', 'Document created from Template', NULL, '2020-07-13 10:14:16', '2020-07-13 10:14:16', 'Diploma'),
(74, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132391016779730933.pdf', 'Diploma_Haha_132391016779730933.pdf', 'Document created from Template', NULL, '2020-07-13 10:15:02', '2020-07-13 10:15:02', 'Diploma'),
(75, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Nachname_132391017041143333.pdf', 'Diploma_Nachname_132391017041143333.pdf', 'Document created from Template', NULL, '2020-07-13 10:15:08', '2020-07-13 10:15:08', 'Diploma'),
(76, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Huhu_132391017104373449.pdf', 'Diploma_Huhu_132391017104373449.pdf', 'Document created from Template', NULL, '2020-07-13 10:15:16', '2020-07-13 10:15:16', 'Diploma'),
(77, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Nachname_132391039221806406.pdf', 'Diploma_Nachname_132391039221806406.pdf', 'Document created from Template', NULL, '2020-07-13 10:52:02', '2020-07-13 10:52:02', 'Diploma'),
(78, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Haha_132391044760218781.pdf', 'Diploma_Haha_132391044760218781.pdf', 'Document created from Template', NULL, '2020-07-13 11:01:16', '2020-07-13 11:01:16', 'Diploma'),
(79, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Nachname_132391044771802622.pdf', 'Diploma_Nachname_132391044771802622.pdf', 'Document created from Template', NULL, '2020-07-13 11:01:17', '2020-07-13 11:01:17', 'Diploma'),
(80, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Huhu_132391044773196430.pdf', 'Diploma_Huhu_132391044773196430.pdf', 'Document created from Template', NULL, '2020-07-13 11:01:17', '2020-07-13 11:01:17', 'Diploma'),
(81, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Huhu_132391048416687647.pdf', 'Diploma_Huhu_132391048416687647.pdf', 'Document created from Template', NULL, '2020-07-13 11:07:48', '2020-07-13 11:07:48', 'Diploma'),
(82, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Huhu_132391049370206233.pdf', 'Diploma_Huhu_132391049370206233.pdf', 'Document created from Template', NULL, '2020-07-13 11:09:00', '2020-07-13 11:09:00', 'Diploma'),
(83, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Günter_132391061790381088.pdf', 'Diploma_Günter_132391061790381088.pdf', 'Document created from Template', NULL, '2020-07-13 11:29:39', '2020-07-13 11:29:39', 'Diploma'),
(84, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Günter_132391062877953948.pdf', 'Diploma_Günter_132391062877953948.pdf', 'Document created from Template', NULL, '2020-07-13 11:31:34', '2020-07-13 11:31:34', 'Diploma'),
(85, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Habe_132391065697688562.pdf', 'Diploma_Habe_132391065697688562.pdf', 'Document created from Template', NULL, '2020-07-13 11:36:10', '2020-07-13 11:36:10', 'Diploma'),
(87, 'path', 'Dok2', 'Dies ist ein Dokument', NULL, '2020-07-13 13:06:37', '2020-07-13 13:06:37', 'Invitation'),
(88, 'path', 'Dok2', 'Dies ist ein Dokument', NULL, '2020-07-13 13:07:10', '2020-07-13 13:07:10', 'Invitation'),
(89, 'path', 'Dok2', 'Dies ist ein Dokument', NULL, '2020-07-13 13:07:40', '2020-07-13 13:07:40', 'Invitation'),
(90, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Nachname_132391815286440552.pdf', 'Diploma_Nachname_132391815286440552.pdf', 'Document created from Template', NULL, '2020-07-14 08:25:32', '2020-07-14 08:25:32', 'Diploma'),
(91, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Burtscher_132391817154451686.pdf', 'Diploma_Burtscher_132391817154451686.pdf', 'Document created from Template', NULL, '2020-07-14 08:28:35', '2020-07-14 08:28:35', 'Diploma'),
(92, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Burtscher_132391823262820304.pdf', 'Diploma_Burtscher_132391823262820304.pdf', 'Document created from Template', NULL, '2020-07-14 08:38:57', '2020-07-14 08:38:57', 'Diploma'),
(93, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Burtscher_132391824408683010.pdf', 'Diploma_Burtscher_132391824408683010.pdf', 'Document created from Template', NULL, '2020-07-14 08:40:45', '2020-07-14 08:40:45', 'Diploma'),
(94, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Burtscher_132391999220126366.pdf', 'Diploma_Burtscher_132391999220126366.pdf', 'Document created from Template', NULL, '2020-07-14 13:32:03', '2020-07-14 13:32:03', 'Diploma'),
(95, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Burtscher_132392000604115130.pdf', 'Diploma_Burtscher_132392000604115130.pdf', 'Document created from Template', NULL, '2020-07-14 13:34:20', '2020-07-14 13:34:20', 'Diploma'),
(96, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Burtscher_132392002403181525.pdf', 'Diploma_Burtscher_132392002403181525.pdf', 'Document created from Template', NULL, '2020-07-14 13:37:20', '2020-07-14 13:37:20', 'Diploma'),
(97, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Burtscher_132392002684643947.pdf', 'Diploma_Burtscher_132392002684643947.pdf', 'Document created from Template', NULL, '2020-07-14 13:43:18', '2020-07-14 13:43:18', 'Diploma'),
(98, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Burtscher_132392006181496373.pdf', 'Diploma_Burtscher_132392006181496373.pdf', 'Document created from Template', NULL, '2020-07-14 13:43:49', '2020-07-14 13:43:49', 'Diploma'),
(99, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Burtscher_132392008884715832.pdf', 'Diploma_Burtscher_132392008884715832.pdf', 'Document created from Template', NULL, '2020-07-14 13:48:29', '2020-07-14 13:48:29', 'Diploma'),
(100, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Burtscher_132392028386266640.pdf', 'Diploma_Burtscher_132392028386266640.pdf', 'Document created from Template', NULL, '2020-07-14 14:20:48', '2020-07-14 14:20:48', 'Diploma'),
(101, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Burtscher_132392053240355011.pdf', 'Diploma_Burtscher_132392053240355011.pdf', 'Document created from Template', NULL, '2020-07-14 15:03:18', '2020-07-14 15:03:18', 'Diploma'),
(102, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Burtscher_132392056774488979.pdf', 'Diploma_Burtscher_132392056774488979.pdf', 'Document created from Template', NULL, '2020-07-14 15:10:54', '2020-07-14 15:10:54', 'Diploma'),
(103, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Burtscher_132392058720591070.pdf', 'Diploma_Burtscher_132392058720591070.pdf', 'Document created from Template', NULL, '2020-07-14 15:25:40', '2020-07-14 15:25:40', 'Diploma'),
(104, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Burtscher_132392067465339856.pdf', 'Diploma_Burtscher_132392067465339856.pdf', 'Document created from Template', NULL, '2020-07-14 15:26:53', '2020-07-14 15:26:53', 'Diploma'),
(105, '\\\\LAPTOP-HM9V9LIQ\\courseRest\\Documents\\Diploma\\Diploma_Burtscher_132392076543938992.pdf', 'Diploma_Burtscher_132392076543938992.pdf', 'Document created from Template', NULL, '2020-07-14 15:41:34', '2020-07-14 15:41:34', 'Diploma');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `document_class`
--

CREATE TABLE `document_class` (
  `id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `class` varchar(200) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `document_class`
--

INSERT INTO `document_class` (`id`, `doc_id`, `class`, `class_id`) VALUES
(3, 2, 'Person', 1),
(10, 4, 'Course', 6),
(11, 5, 'Course', 6),
(14, 6, 'Course', 6),
(15, 6, 'Person', 6),
(16, 7, 'Course', 1),
(17, 7, 'Person', 6),
(18, 8, 'Course', 1),
(19, 8, 'Person', 6),
(22, 9, 'Course', 1),
(23, 9, 'Person', 6),
(24, 10, 'Course', 1),
(25, 10, 'Person', 6),
(26, 11, 'Course', 1),
(27, 11, 'Person', 6),
(34, 22, 'Course', 3),
(35, 22, 'Person', 5),
(36, 23, 'Course', 3),
(37, 23, 'Person', 5),
(38, 24, 'Course', 3),
(39, 24, 'Person', 7),
(40, 25, 'Person', 3),
(41, 25, 'Course', 3),
(42, 26, 'Person', 5),
(43, 26, 'Course', 3),
(46, 28, 'Course', 2),
(47, 28, 'Person', 1),
(48, 29, 'Person', 2),
(49, 29, 'Course', 2),
(50, 30, 'Person', 4),
(51, 30, 'Course', 2),
(52, 31, 'Course', 2),
(53, 31, 'Person', 1),
(54, 32, 'Course', 2),
(55, 32, 'Person', 5),
(56, 33, 'Person', 2),
(57, 33, 'Course', 2),
(58, 34, 'Person', 4),
(59, 34, 'Course', 2),
(60, 35, 'Course', 2),
(61, 35, 'Person', 5),
(64, 37, 'Course', 2),
(65, 37, 'Person', 5),
(66, 38, 'Person', 2),
(67, 38, 'Course', 2),
(68, 39, 'Course', 2),
(69, 39, 'Person', 5),
(70, 40, 'Person', 2),
(71, 40, 'Course', 2),
(72, 41, 'Person', 4),
(73, 41, 'Course', 2),
(74, 42, 'Course', 2),
(75, 42, 'Person', 5),
(76, 43, 'Person', 2),
(77, 43, 'Course', 2),
(78, 44, 'Person', 4),
(79, 44, 'Course', 2),
(80, 45, 'Course', 2),
(81, 45, 'Person', 5),
(82, 46, 'Person', 2),
(83, 46, 'Course', 2),
(84, 47, 'Person', 4),
(85, 47, 'Course', 2),
(86, 48, 'Course', 2),
(87, 48, 'Person', 5),
(88, 49, 'Person', 2),
(89, 49, 'Course', 2),
(90, 50, 'Person', 4),
(91, 50, 'Course', 2),
(92, 51, 'Course', 2),
(93, 51, 'Person', 5),
(94, 52, 'Person', 2),
(95, 52, 'Course', 2),
(96, 53, 'Person', 4),
(97, 53, 'Course', 2),
(98, 54, 'Course', 3),
(99, 54, 'Person', 7),
(100, 55, 'Person', 5),
(101, 55, 'Course', 3),
(102, 56, 'Course', 3),
(103, 56, 'Person', 2),
(104, 57, 'Course', 2),
(105, 57, 'Person', 5),
(106, 58, 'Course', 2),
(107, 58, 'Person', 5),
(112, 61, 'Course', 3),
(113, 61, 'Person', 2),
(114, 62, 'Course', 2),
(115, 62, 'Person', 5),
(116, 63, 'Course', 2),
(117, 63, 'Person', 5),
(118, 64, 'Course', 2),
(119, 64, 'Person', 5),
(120, 65, 'Course', 2),
(121, 65, 'Person', 5),
(122, 66, 'Course', 2),
(123, 66, 'Person', 5),
(124, 67, 'Course', 2),
(125, 67, 'Person', 5),
(126, 68, 'Course', 2),
(127, 68, 'Person', 5),
(128, 69, 'Course', 2),
(129, 69, 'Person', 5),
(130, 70, 'Course', 2),
(131, 70, 'Person', 5),
(132, 71, 'Course', 2),
(133, 71, 'Person', 5),
(134, 72, 'Person', 2),
(135, 72, 'Course', 2),
(136, 73, 'Person', 4),
(137, 73, 'Course', 2),
(138, 74, 'Course', 2),
(139, 74, 'Person', 5),
(140, 75, 'Person', 2),
(141, 75, 'Course', 2),
(142, 76, 'Person', 4),
(143, 76, 'Course', 2),
(144, 77, 'Course', 3),
(145, 77, 'Person', 2),
(146, 78, 'Course', 2),
(147, 78, 'Person', 5),
(148, 79, 'Person', 2),
(149, 79, 'Course', 2),
(150, 80, 'Person', 4),
(151, 80, 'Course', 2),
(152, 81, 'Course', 2),
(153, 81, 'Person', 4),
(154, 82, 'Course', 2),
(155, 82, 'Person', 4),
(156, 83, 'Course', 2),
(157, 83, 'Person', 15),
(158, 84, 'Course', 2),
(159, 84, 'Person', 15),
(160, 85, 'Course', 2),
(161, 85, 'Person', 19),
(164, 87, 'Course', 3),
(165, 88, 'Person', 5),
(166, 89, 'Course', 3),
(167, 89, 'Person', 5),
(168, 90, 'Course', 3),
(169, 90, 'Person', 2),
(170, 91, 'Course', 3),
(171, 91, 'Person', 52),
(172, 92, 'Course', 2),
(173, 92, 'Person', 52),
(174, 93, 'Course', 2),
(175, 93, 'Person', 52),
(176, 94, 'Person', 52),
(177, 95, 'Person', 52),
(178, 96, 'Person', 52),
(179, 97, 'Person', 52),
(180, 98, 'Person', 52),
(181, 99, 'Person', 52),
(182, 100, 'Person', 52),
(183, 101, 'Person', 52),
(184, 102, 'Person', 52),
(185, 103, 'Person', 52),
(186, 104, 'Person', 52),
(187, 105, 'Person', 52);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `email_template`
--

CREATE TABLE `email_template` (
  `id` int(11) NOT NULL,
  `document_type` varchar(100) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `email_template`
--

INSERT INTO `email_template` (`id`, `document_type`, `text`) VALUES
(1, 'Invitation', 'C:\\DcvDokumente'),
(2, 'RegistrationConfirmation\r\n', 'C:\\DcvDokumente'),
(3, 'Bill', 'C:\\DcvDokumente'),
(4, 'Dun', 'C:\\DcvDokumente'),
(5, 'Diploma', 'C:\\DcvDokumente'),
(6, 'Information', 'C:\\DcvDokumente'),
(7, 'Note', 'C:\\DcvDokumente'),
(8, 'Other', 'C:\\DcvDokumente');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `make` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `equipment`
--

INSERT INTO `equipment` (`id`, `type`, `make`, `model`, `person_id`, `location_id`, `quantity`) VALUES
(10, 'Stift', 'Edding', 'Painter Black', 1, NULL, 23),
(35, 'Keyboard', 'Lenovo', 'Tipsit V3', 64, NULL, 25),
(39, 'Kopfhörer', 'Sony', 'ABC', 19, NULL, 1),
(46, 'Kugelschreiber Weiß', 'Bic', 'Schreibtgeil', NULL, 8, 200);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `facility`
--

CREATE TABLE `facility` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `facility`
--

INSERT INTO `facility` (`id`, `name`, `phone_number`) VALUES
(1, 'halloTest', '5841'),
(3, 'Test2', '8445455'),
(4, 'YesWeCan', '8445455'),
(5, 'Metzler Rainer (vplus GmbH)', '+43 664 8511 614'),
(6, 'Hausverwaltung 2', '+43 1235-123422');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `furniture`
--

CREATE TABLE `furniture` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `quantity` int(10) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `furniture`
--

INSERT INTO `furniture` (`id`, `type`, `quantity`, `location_id`) VALUES
(56, 'Stuhl', 1, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `notebook`
--

CREATE TABLE `notebook` (
  `id` int(11) NOT NULL,
  `serial_number` varchar(50) NOT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `notebook`
--

INSERT INTO `notebook` (`id`, `serial_number`, `make`, `model`, `location_id`, `person_id`) VALUES
(251, 'KDKE-7220', 'Lenovo', 'ThinkPad', NULL, 4),
(252, 'KDKE-7264', 'Lenovo', 'ThinkPad', 6, NULL),
(253, 'KDKE-561', 'Lenovo', 'ThinkPad', NULL, 5),
(254, 'KDKE-6698', 'Lenovo', 'ThinkPad', 3, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `name1` varchar(200) DEFAULT NULL,
  `name2` varchar(200) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `sv_nr` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `gender` varchar(200) DEFAULT NULL,
  `busy` varchar(200) DEFAULT NULL,
  `busy_by` varchar(200) DEFAULT NULL,
  `picture` text DEFAULT NULL,
  `function` varchar(200) DEFAULT NULL,
  `aktiv` tinyint(4) NOT NULL,
  `deleted_inaktiv` tinyint(4) NOT NULL,
  `newsletter_flag` tinyint(4) NOT NULL,
  `created@` datetime NOT NULL,
  `modified@` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `person`
--

INSERT INTO `person` (`id`, `name1`, `name2`, `title`, `sv_nr`, `date`, `gender`, `busy`, `busy_by`, `picture`, `function`, `aktiv`, `deleted_inaktiv`, `newsletter_flag`, `created@`, `modified@`) VALUES
(1, ' Test', ' Person', ' ', 123456, '1995-05-01', NULL, NULL, 'Hans Ruedi Sueli AG Ochsen-Hinterbüxli', NULL, '0', 1, 0, 0, '0001-01-01 00:00:00', '2020-07-08 14:22:22'),
(2, 'Vorname', 'Nachname', 'Doktor', 123456790, NULL, NULL, NULL, NULL, NULL, '3', 1, 1, 1, '2020-07-02 13:42:33', '2020-07-09 11:28:08'),
(3, 'hihi', 'hubi', 'Depp', 4500020415, NULL, NULL, NULL, NULL, NULL, '3', 1, 1, 1, '2020-07-02 13:42:33', NULL),
(4, 'Hans', 'Huhu', NULL, 1321321, NULL, NULL, NULL, NULL, NULL, '3', 1, 1, 1, '2020-07-02 13:42:33', NULL),
(5, 'Hugo', 'Haha', 'ING.', 1321321, NULL, NULL, NULL, NULL, NULL, '1', 1, 1, 1, '2020-07-02 13:42:33', NULL),
(6, 'Dieter', 'Hoho', 'DIpl.ING', 1321321, NULL, NULL, NULL, NULL, NULL, '2', 1, 1, 1, '2020-07-02 13:42:33', NULL),
(10, 'Ikke', 'Nichts', NULL, 0, '0001-01-01', NULL, NULL, NULL, NULL, '3', 1, 0, 1, '2020-07-03 09:40:23', '2020-07-03 09:40:23'),
(12, 'Habe', 'Dabe', NULL, 0, '0001-01-01', NULL, NULL, NULL, NULL, '3', 1, 0, 1, '2020-07-03 11:20:39', '2020-07-03 11:20:39'),
(15, 'Hans', 'Günter', 'Professor', NULL, NULL, 'Männlich', NULL, NULL, NULL, '3', 0, 0, 0, '0001-01-01 00:00:00', NULL),
(18, 'Hans', 'Aben', 'Professor', NULL, NULL, NULL, NULL, NULL, NULL, '3', 0, 0, 0, '0001-01-01 00:00:00', NULL),
(19, 'Dabe', 'Habe', 'Dubeda', NULL, NULL, NULL, NULL, NULL, NULL, '3', 0, 0, 0, '0001-01-01 00:00:00', NULL),
(20, 'CreateSecond', 'Lastname', NULL, 0, '0001-01-01', NULL, NULL, NULL, NULL, '3', 1, 0, 1, '2020-07-06 09:17:14', '2020-07-06 09:17:14'),
(47, NULL, 'test6578', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-07 13:58:13', NULL),
(48, 'Herbet', 'Gstörte', NULL, NULL, '1998-05-03', 'männliche', NULL, NULL, NULL, '3', 1, 0, 0, '2020-07-07 14:27:21', NULL),
(49, 'Güni', 'Trotz', NULL, NULL, '2001-06-05', 'männliche', NULL, NULL, NULL, '3', 1, 0, 0, '2020-07-07 14:27:21', NULL),
(50, 'Kerstin', 'Heile', NULL, NULL, '1994-02-20', 'weiblich', NULL, NULL, NULL, '3', 1, 0, 0, '2020-07-07 14:27:21', NULL),
(51, 'martin', 'burtscher', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0001-01-01 00:00:00', NULL),
(52, 'Martin', 'Burtscher', 'Dr.', 2943, '1976-03-26', 'Männlich', NULL, NULL, NULL, '0', 1, 0, 0, '0001-01-01 00:00:00', NULL),
(57, 'Herbet', 'Gstoerte', NULL, NULL, '1998-05-03', 'männliche', NULL, NULL, NULL, NULL, 1, 0, 0, '2020-07-08 10:45:12', NULL),
(58, 'Güni', 'Troetz', NULL, NULL, '2001-06-05', 'männliche', NULL, NULL, NULL, NULL, 1, 0, 0, '2020-07-08 10:45:30', NULL),
(59, 'Kerstin', 'Hoeile', NULL, NULL, '1994-02-20', 'weiblich', NULL, NULL, NULL, NULL, 1, 0, 0, '2020-07-08 10:45:57', NULL),
(60, 'Hörbet', 'Gotte', NULL, NULL, '1998-05-03', 'männliche', NULL, NULL, NULL, NULL, 1, 0, 0, '2020-07-08 13:46:09', NULL),
(61, 'Gäni', 'Trtz', NULL, NULL, '2001-06-05', 'männliche', NULL, NULL, NULL, NULL, 1, 0, 0, '2020-07-08 13:46:10', NULL),
(62, 'Karstin', 'Hile', NULL, NULL, '1994-02-20', 'weiblich', NULL, NULL, NULL, NULL, 1, 0, 0, '2020-07-08 13:46:10', NULL),
(63, 'Nico', 'P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0000-00-00 00:00:00', NULL),
(64, 'Freddie', 'Krüger', NULL, 2786240995, '1900-05-01', 'männlich', NULL, NULL, NULL, NULL, 1, 0, 0, '2020-07-09 13:46:55', '2020-07-09 13:46:55'),
(65, 'Martin', 'Burtscher', 'Prof.Dr.Dr.', 2245, '2019-10-02', 'male', 'very', NULL, NULL, NULL, 0, 0, 1, '0000-00-00 00:00:00', NULL),
(66, 'Martin', 'Burtscher', NULL, 2943, '1976-03-26', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0000-00-00 00:00:00', NULL),
(67, 'Hans', 'Heile', NULL, NULL, '1992-06-25', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0001-01-01 00:00:00', NULL),
(78, 'San', 'Hile', NULL, NULL, '1988-08-14', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0001-01-01 00:00:00', NULL),
(79, 'Hilde', 'Bauer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, '2020-07-13 14:34:16', '2020-07-13 14:34:16'),
(80, 'Trudi', 'Bauer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, '2020-07-13 14:39:56', '2020-07-13 14:39:56'),
(89, 'Björn', 'Trolli', NULL, NULL, '1990-05-06', NULL, NULL, NULL, NULL, NULL, 1, 0, 1, '2020-07-14 13:53:48', '2020-07-14 13:53:48'),
(90, 'Trill', 'Trolli', NULL, NULL, '1993-05-06', NULL, NULL, NULL, NULL, NULL, 1, 0, 1, '2020-07-14 14:23:39', '2020-07-14 14:23:39');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subvention`
--

CREATE TABLE `subvention` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `percentage` double DEFAULT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `subvention`
--

INSERT INTO `subvention` (`id`, `name`, `percentage`, `amount`) VALUES
(1, 'MegaSubvention', 90, NULL);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `absence`
--
ALTER TABLE `absence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participant_id` (`participant_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `document_id` (`document_id`);

--
-- Indizes für die Tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `addressperson`
--
ALTER TABLE `addressperson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addressId` (`addressId`),
  ADD KEY `personId` (`personId`);

--
-- Indizes für die Tabelle `adresslocation`
--
ALTER TABLE `adresslocation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lo_id` (`locationId`),
  ADD KEY `ad_ID` (`adressId`);

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `book_ibfk_2` (`person_id`);

--
-- Indizes für die Tabelle `classrooms`
--
ALTER TABLE `classrooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facility_id` (`facility_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indizes für die Tabelle `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_id` (`person_id`);

--
-- Indizes für die Tabelle `communication`
--
ALTER TABLE `communication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_id` (`document_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indizes für die Tabelle `communication_class`
--
ALTER TABLE `communication_class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `communication_id` (`communication_id`);

--
-- Indizes für die Tabelle `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `master_id` (`person_id`);

--
-- Indizes für die Tabelle `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classroom_id` (`classroom_id`);

--
-- Indizes für die Tabelle `course_category`
--
ALTER TABLE `course_category`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `course_content`
--
ALTER TABLE `course_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `content_id` (`content_id`);

--
-- Indizes für die Tabelle `course_participants`
--
ALTER TABLE `course_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `participant_id` (`participant_id`);

--
-- Indizes für die Tabelle `course_subvention`
--
ALTER TABLE `course_subvention`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `subvention_id` (`subvention_id`);

--
-- Indizes für die Tabelle `course_trainer`
--
ALTER TABLE `course_trainer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- Indizes für die Tabelle `display`
--
ALTER TABLE `display`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indizes für die Tabelle `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `document_class`
--
ALTER TABLE `document_class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doc_id` (`doc_id`);

--
-- Indizes für die Tabelle `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `equipment_ibfk_2` (`person_id`);

--
-- Indizes für die Tabelle `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `furniture`
--
ALTER TABLE `furniture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indizes für die Tabelle `notebook`
--
ALTER TABLE `notebook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indizes für die Tabelle `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `subvention`
--
ALTER TABLE `subvention`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `absence`
--
ALTER TABLE `absence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT für Tabelle `addressperson`
--
ALTER TABLE `addressperson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT für Tabelle `adresslocation`
--
ALTER TABLE `adresslocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT für Tabelle `classrooms`
--
ALTER TABLE `classrooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `communication`
--
ALTER TABLE `communication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT für Tabelle `communication_class`
--
ALTER TABLE `communication_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT für Tabelle `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT für Tabelle `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `course_category`
--
ALTER TABLE `course_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `course_content`
--
ALTER TABLE `course_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `course_participants`
--
ALTER TABLE `course_participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `course_subvention`
--
ALTER TABLE `course_subvention`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `course_trainer`
--
ALTER TABLE `course_trainer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `display`
--
ALTER TABLE `display`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT für Tabelle `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT für Tabelle `document_class`
--
ALTER TABLE `document_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT für Tabelle `email_template`
--
ALTER TABLE `email_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT für Tabelle `facility`
--
ALTER TABLE `facility`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `furniture`
--
ALTER TABLE `furniture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT für Tabelle `notebook`
--
ALTER TABLE `notebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT für Tabelle `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT für Tabelle `subvention`
--
ALTER TABLE `subvention`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `absence_ibfk_1` FOREIGN KEY (`participant_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `absence_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `absence_ibfk_3` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`);

--
-- Constraints der Tabelle `addressperson`
--
ALTER TABLE `addressperson`
  ADD CONSTRAINT `addressId` FOREIGN KEY (`addressId`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personId` FOREIGN KEY (`personId`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `adresslocation`
--
ALTER TABLE `adresslocation`
  ADD CONSTRAINT `ad_Id` FOREIGN KEY (`adressId`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `lo_id` FOREIGN KEY (`locationId`) REFERENCES `classrooms` (`id`);

--
-- Constraints der Tabelle `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `classrooms` (`id`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Constraints der Tabelle `classrooms`
--
ALTER TABLE `classrooms`
  ADD CONSTRAINT `classrooms_ibfk_1` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`id`),
  ADD CONSTRAINT `classrooms_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

--
-- Constraints der Tabelle `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `m_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `communication`
--
ALTER TABLE `communication`
  ADD CONSTRAINT `communication_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  ADD CONSTRAINT `communication_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `communication_class`
--
ALTER TABLE `communication_class`
  ADD CONSTRAINT `communication_class_ibfk_1` FOREIGN KEY (`communication_id`) REFERENCES `communication` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `master_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`);

--
-- Constraints der Tabelle `course_content`
--
ALTER TABLE `course_content`
  ADD CONSTRAINT `course_content_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `course_content_ibfk_2` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`);

--
-- Constraints der Tabelle `course_participants`
--
ALTER TABLE `course_participants`
  ADD CONSTRAINT `course_participants_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `course_participants_ibfk_2` FOREIGN KEY (`participant_id`) REFERENCES `person` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `course_subvention`
--
ALTER TABLE `course_subvention`
  ADD CONSTRAINT `course_subvention_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `course_subvention_ibfk_2` FOREIGN KEY (`subvention_id`) REFERENCES `subvention` (`id`);

--
-- Constraints der Tabelle `course_trainer`
--
ALTER TABLE `course_trainer`
  ADD CONSTRAINT `course_trainer_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `course_trainer_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `person` (`id`);

--
-- Constraints der Tabelle `display`
--
ALTER TABLE `display`
  ADD CONSTRAINT `display_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `classrooms` (`id`);

--
-- Constraints der Tabelle `document_class`
--
ALTER TABLE `document_class`
  ADD CONSTRAINT `document_class_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `classrooms` (`id`),
  ADD CONSTRAINT `equipment_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Constraints der Tabelle `furniture`
--
ALTER TABLE `furniture`
  ADD CONSTRAINT `furniture_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `classrooms` (`id`);

--
-- Constraints der Tabelle `notebook`
--
ALTER TABLE `notebook`
  ADD CONSTRAINT `notebook_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `notebook_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `classrooms` (`id`);
--
-- Datenbank: `digital_notebook`
--
CREATE DATABASE IF NOT EXISTS `digital_notebook` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `digital_notebook`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `notebook`
--

CREATE TABLE `notebook` (
  `id` int(11) NOT NULL,
  `topic` varchar(50) NOT NULL,
  `model` varchar(100) NOT NULL,
  `note` text NOT NULL,
  `link_operation_manual` varchar(300) DEFAULT NULL,
  `date_of_purchase` date NOT NULL,
  `warranty_period` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `notebook`
--

INSERT INTO `notebook` (`id`, `topic`, `model`, `note`, `link_operation_manual`, `date_of_purchase`, `warranty_period`) VALUES
(1, 'Fernseher', 'SAMSUNG Fernseher RU7170 (2019) 43 Zoll UHD HDR Smart TV', 'Gerätetyp: 4K UHD Smart TV \r\nHerstellergarantie: 2 Jahr/e Sichtb. \r\nBildschirmdiagonale: 108 cm (43 Zoll) \r\nBildqualität: UHD 4K \r\nEmpfangsarten: DVB-T2 (H.264), DVB-T2 (H.265), DVB-C, DVB-S2 \r\nAnschlüsse: 3x HDMI, 2x USB, LAN, Component In (Y/Pb/Pr), \r\nComposite In (AV), Digital-Audioausgang (optisch), 1x CI+ \r\nAbmessungen mit Standfuß (B/H/T): 970.2 mm / 636.3 mm / 210.3 mm', 'https://images-eu.ssl-images-amazon.com/images/I/A1FpG7azMvS.pdf', '2020-02-16', 2),
(3, 'Kühlschrank', 'BAUKNECHT Vollraumkühlschrank, 167 cm hoch, 59,5 cm breit', 'Leistung und Verbrauch:\r\nMarke: Bauknecht\r\nTyp: KR 17G4 A2+ WS\r\nEnergieeffizienzklasse: A++\r\n(A +++ = sehr geringer Energiebedarf - D= sehr hoher Energiebedarf)\r\nJährlicher Energieverbrauch in kWh/Jahr: 110\r\nArt des Lagerfaches und Inhalt: Kühlteil: 318 Liter\r\nKlimaklasse: +10/+43 (SN-T)\r\nLuftschallemission in dB(A) re1pW: 38\r\nKühlteil:\r\nNutzinhalt Kühlteil (Liter): 318\r\n6 Ablagen aus Sicherheitsglas, davon 5 höhenverstellbar\r\n1 Obst- und Gemüseschublade\r\n4 Türetageren\r\nWeitere Vorteile:\r\nOptischer und akustischer Temperaturalarm\r\nSuperkühlfunktion - 5-mal schnellere Temperaturwiederherstellung\r\nUrlaubs-Spar-Funktion stellt das Kühlteil auf 12 °C ein\r\nFlüsterleise mit 38 dB\r\nWeitere Daten:\r\nFarbe: weiss\r\nFarbe Seitenteile: weiss\r\nWasserspender: nein\r\nFestwasseranschluss nötig: nein\r\nTüranschlag wechselbar: ja\r\nKlimaklasse: +10/+43 (SN-T)\r\nGerätemasse H/B/T (cm): 167/59,5/64,5\r\nAnschlusswerte (V / A / kW): 220-240 V/10 A/0,1 k\r\n', 'https://empiriecom.a.bigcontent.io/v1/static/16582851', '2020-04-01', 3),
(7, 'Tiefkühlschrank', 'Liebherr GNP2313 Comfort NoFrost', 'Art:Stand\nEnergieeffizienz: A++\nNutzinhalt Gefrierteil (in Liter):185 l\nBetriebslautstärke:42 dB\nEnergieverbrauch/Jahr:206 kWh\nAusstattung:Temperatur-Digital-Anzeige, Abtauautomatik, NoFrost, Türanschlag wechselbar\nBreite (mm):600\nHöhe (mm):1447\nTiefe (mm):630', 'https://d25jbgvg9kmxad.cloudfront.net/catalogue/sckakfpbzcktywfp/HAU_BA_B2B_708198604_de_2020-02-06-00-37-39.pdf', '2020-03-25', 2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `notebook`
--
ALTER TABLE `notebook`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `notebook`
--
ALTER TABLE `notebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Datenbank: `gastronomy`
--
CREATE DATABASE IF NOT EXISTS `gastronomy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gastronomy`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivery`
--

CREATE TABLE `delivery` (
  `post_code` int(11) NOT NULL,
  `town` varchar(50) NOT NULL,
  `minimum_order_value` double NOT NULL,
  `price` double NOT NULL,
  `discount_order_value` double DEFAULT NULL,
  `discount_price` double DEFAULT NULL,
  `company_book_number_restaurant` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `delivery`
--

INSERT INTO `delivery` (`post_code`, `town`, `minimum_order_value`, `price`, `discount_order_value`, `discount_price`, `company_book_number_restaurant`) VALUES
(6840, 'Götzis', 15, 2, NULL, NULL, 'ATU68423028'),
(6841, 'Mäder', 15, 4, 40, 2.5, 'ATU68423028'),
(6842, 'Koblach', 15, 4, NULL, NULL, 'ATU68423028'),
(6844, 'Altach', 15, 4, 40, 2, 'ATU68423028');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double DEFAULT NULL,
  `is_removable` tinyint(1) NOT NULL,
  `is_addable` tinyint(1) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `ingredient`
--

INSERT INTO `ingredient` (`id`, `name`, `price`, `is_removable`, `is_addable`, `menu_id`) VALUES
(3, 'French-Dressing', NULL, 0, 1, 3),
(4, 'Haus-Dressing', NULL, 0, 1, 3),
(5, 'kein Dressing', NULL, 0, 1, 3),
(7, 'Karotten', NULL, 1, 0, 3),
(8, 'Kräuter-Dressing', NULL, 1, 0, 3),
(9, 'Knoblauch', NULL, 0, 0, 4),
(10, 'Olivenöl', NULL, 0, 0, 4),
(11, 'Zwiebel', 0.8, 0, 1, 2),
(12, 'Knoblauch', 0.8, 0, 1, 2),
(13, 'Mozzarella', 0.8, 0, 1, 2),
(14, 'Paprika', 0.8, 0, 1, 2),
(15, 'Tomaten', 0.8, 0, 1, 2),
(16, 'Gorgonzola', 0.8, 0, 1, 2),
(17, 'Salami', 0.8, 0, 1, 2),
(18, 'Oliven', 0.8, 0, 1, 2),
(19, 'Sardellen', 0.8, 0, 1, 2),
(20, 'Champignions', 0.8, 0, 1, 2),
(21, 'Pfefferoni', 0.8, 0, 1, 2),
(22, 'Schinken', 0.8, 0, 1, 2),
(23, 'Thunfisch', 0.8, 0, 1, 2),
(24, 'Kapern', 0.8, 0, 1, 2),
(25, 'Artischocken', 0.8, 0, 1, 2),
(26, 'Carpaccio', 1.8, 0, 1, 2),
(27, 'Rucola', 0.8, 0, 1, 2),
(28, 'Parmesan', 0.8, 0, 1, 2),
(29, 'Spinat', 0.8, 0, 1, 2),
(30, 'Ei', 0.8, 0, 1, 2),
(31, 'Mais', 0.8, 0, 1, 2),
(32, 'Muscheln', 1.8, 0, 1, 2),
(33, 'Ananas', 0.8, 0, 1, 2),
(34, 'Speck', 0.8, 0, 1, 2),
(35, 'Pilze', 0.8, 0, 1, 2),
(70, 'Kroketten statt Pommes frites möglich', 0, 0, 0, 8),
(71, 'Pommes frites', 0, 1, 0, 8),
(72, 'Schweinefleisch', 0, 1, 0, 8),
(73, 'Kroketten (statt Pommes)', 0, 0, 1, 8),
(74, 'Kroketten', 2.5, 0, 1, 8),
(75, 'Sauce Tartar', 0.5, 0, 1, 8),
(76, 'Zwiebelsauce', 0.5, 0, 1, 8),
(77, 'Pommes frites', 2.3, 0, 1, 9),
(78, 'Senf', 0.3, 0, 1, 9),
(79, 'Ketchup', 0.3, 0, 1, 9),
(80, 'Zwiebelsauce', 0.5, 0, 1, 9),
(83, 'ohne Schweinefleisch möglich', 0, 0, 0, 8),
(85, 'Kräuterdressing', 0, 1, 0, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kind_of_menu`
--

CREATE TABLE `kind_of_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `has_same_addable_ingredient` tinyint(1) NOT NULL,
  `company_book_number_restaurant` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kind_of_menu`
--

INSERT INTO `kind_of_menu` (`id`, `name`, `description`, `has_same_addable_ingredient`, `company_book_number_restaurant`) VALUES
(4, 'Pizzas', 'Alle Pizzas (32 cm) werden mit Tomatensauce, Mozzarella und Oregano zubereitet!', 1, 'ATU68423028'),
(5, 'Pasta Spezialitäten', '', 0, 'ATU68423028'),
(8, 'Salate', 'Alle Salate werden mit Kräuterdressing zubereitet.', 1, 'ATU68423028'),
(10, 'Getränke', '', 0, 'ATU68423028'),
(13, 'Empfehlungen des Hauses', '', 0, 'ATU68423028');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `price` double NOT NULL,
  `kind_of_menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `menu`
--

INSERT INTO `menu` (`id`, `name`, `description`, `price`, `kind_of_menu_id`) VALUES
(1, 'Pizza Margherita', '', 7.5, 4),
(2, 'Pizza Salami', 'mit Rindersalami', 8.9, 4),
(3, 'Insalata Mista', '', 5.1, 8),
(4, 'Spaghetti Aglio e Oglio', 'scharf', 8.8, 5),
(5, 'Coca Cola ( 0,5 l )', 'enthält Coffein', 2.5, 10),
(6, 'Fanta ( 0,5 l )', '', 2.5, 10),
(7, 'Mezzo Mix ( 0,5 l )', '', 2.5, 10),
(8, 'Grillteller', 'mit Schweinefleisch, Putenfleisch, Rindfleisch und Pommes frites', 9.5, 13),
(9, 'Rote Wurst', 'mit Brot', 3.9, 13),
(10, 'Insalata Pomodore', 'Tomatensalat', 4.6, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `restaurant`
--

CREATE TABLE `restaurant` (
  `company_book_number` varchar(50) NOT NULL,
  `kind_of_restaurant` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `homepage` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) NOT NULL,
  `post_code` int(11) NOT NULL,
  `town` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `house_number` int(11) NOT NULL,
  `password` varchar(50) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `restaurant`
--

INSERT INTO `restaurant` (`company_book_number`, `kind_of_restaurant`, `name`, `email`, `homepage`, `phone_number`, `post_code`, `town`, `street`, `house_number`, `password`, `creation_date`) VALUES
('ATU68423028', 'Restaurant', 'Casa Antica', 'casa@antica.com', 'www.casa_antica.at', '+43 676 85201709', 6840, 'Götzis', 'Flughafenallee ', 15, 'casa', '2020-04-29 12:25:09');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`post_code`),
  ADD KEY `company_book_number_restaurant` (`company_book_number_restaurant`);

--
-- Indizes für die Tabelle `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indizes für die Tabelle `kind_of_menu`
--
ALTER TABLE `kind_of_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_book_number_restaurant` (`company_book_number_restaurant`);

--
-- Indizes für die Tabelle `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kind_of_menu_id` (`kind_of_menu_id`);

--
-- Indizes für die Tabelle `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`company_book_number`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT für Tabelle `kind_of_menu`
--
ALTER TABLE `kind_of_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`company_book_number_restaurant`) REFERENCES `restaurant` (`company_book_number`);

--
-- Constraints der Tabelle `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`);

--
-- Constraints der Tabelle `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`kind_of_menu_id`) REFERENCES `kind_of_menu` (`id`);
--
-- Datenbank: `insta feed`
--
CREATE DATABASE IF NOT EXISTS `insta feed` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `insta feed`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `post`
--

CREATE TABLE `post` (
  `id` int(33) NOT NULL,
  `created by` varchar(30) NOT NULL,
  `url` varchar(300) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes_count` int(100) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `user_bio` text NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `post`
--
ALTER TABLE `post`
  MODIFY `id` int(33) NOT NULL AUTO_INCREMENT;
--
-- Datenbank: `library`
--
CREATE DATABASE IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `library`;

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
-- Tabellenstruktur für Tabelle `book_lending`
--

CREATE TABLE `book_lending` (
  `id` int(11) NOT NULL,
  `parking_space_number_book` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `employee_social_insurance_number` varchar(50) NOT NULL,
  `loan_date` datetime NOT NULL,
  `return_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book_lending`
--

INSERT INTO `book_lending` (`id`, `parking_space_number_book`, `customer_id`, `employee_social_insurance_number`, `loan_date`, `return_date`) VALUES
(1, 1, 6, '2847 310387', '2020-04-07 00:00:00', '2020-04-21'),
(2, 2, 5, '6543 121290', '2020-04-02 08:50:12', '2020-04-16');

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
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `company_book_number_library` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`id`, `name`, `phone_number`, `email`, `address`, `company_book_number_library`) VALUES
(5, 'Michelle Wasserle', '0664 1234567', 'michelle.wasserle@gmail.com', 'Frauengasse 31, \r\n6812 Meiningen', ' ATU 65177168'),
(6, 'Iris Wasserle', '0699 2345678', 'iris.wasserle@gmail.com', 'Frauengasse 31a\r\n6812 Meiningen', ' ATU 65177168');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `social_insurance_number` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `biography` varchar(500) DEFAULT NULL,
  `company_book_number_library` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`social_insurance_number`, `name`, `biography`, `company_book_number_library`) VALUES
('2847 310387', 'Veridana Mallmann', NULL, ' ATU 65177168'),
('6543 121290', 'Petra Biedermann', NULL, ' ATU 65177168');

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
-- Indizes für die Tabelle `book_lending`
--
ALTER TABLE `book_lending`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parking_space_number_book` (`parking_space_number_book`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_social_insurance_number` (`employee_social_insurance_number`);

--
-- Indizes für die Tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_book_number_library` (`company_book_number_library`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`social_insurance_number`),
  ADD KEY `company_book_number_library` (`company_book_number_library`);

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
-- AUTO_INCREMENT für Tabelle `book_lending`
--
ALTER TABLE `book_lending`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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

--
-- Constraints der Tabelle `book_lending`
--
ALTER TABLE `book_lending`
  ADD CONSTRAINT `book_lending_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `book_lending_ibfk_2` FOREIGN KEY (`parking_space_number_book`) REFERENCES `book` (`parking_space_number`),
  ADD CONSTRAINT `book_lending_ibfk_3` FOREIGN KEY (`employee_social_insurance_number`) REFERENCES `employee` (`social_insurance_number`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`company_book_number_library`) REFERENCES `library` (`company_book_number`);

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`company_book_number_library`) REFERENCES `library` (`company_book_number`);
--
-- Datenbank: `personadmin`
--
CREATE DATABASE IF NOT EXISTS `personadmin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `personadmin`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `absence`
--

CREATE TABLE `absence` (
  `id` int(11) NOT NULL,
  `start` date NOT NULL,
  `end` date DEFAULT NULL,
  `participant_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `units` int(11) DEFAULT NULL,
  `excused` tinyint(1) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  `reminder_id` int(11) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `street` varchar(200) DEFAULT NULL,
  `place` varchar(200) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `contact_type` varchar(200) DEFAULT NULL,
  `billing_address` tinyint(4) DEFAULT NULL,
  `created@` datetime NOT NULL,
  `modify@` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `addressperson`
--

CREATE TABLE `addressperson` (
  `id` int(11) NOT NULL,
  `addressId` int(11) NOT NULL,
  `personId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `adresslocation`
--

CREATE TABLE `adresslocation` (
  `id` int(11) NOT NULL,
  `adressId` int(11) NOT NULL,
  `locationId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `adresslocation`
--

INSERT INTO `adresslocation` (`id`, `adressId`, `locationId`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `isbn` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `classrooms`
--

CREATE TABLE `classrooms` (
  `id` int(11) NOT NULL,
  `room` varchar(100) NOT NULL,
  `facility_id` int(50) DEFAULT NULL,
  `course_id` int(50) DEFAULT NULL,
  `material_id` int(50) DEFAULT NULL,
  `image` blob DEFAULT NULL,
  `description` text DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `classrooms`
--

INSERT INTO `classrooms` (`id`, `room`, `facility_id`, `course_id`, `material_id`, `image`, `description`, `title`, `subtitle`) VALUES
(3, 'room 5', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `comment_value` text NOT NULL,
  `value_date` date NOT NULL,
  `created@` datetime NOT NULL,
  `modify@` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `communication`
--

CREATE TABLE `communication` (
  `id` int(11) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `person_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `reminder_id` int(11) DEFAULT NULL,
  `created@` datetime NOT NULL,
  `modified@` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `communication_class`
--

CREATE TABLE `communication_class` (
  `id` int(11) NOT NULL,
  `communication_id` int(11) NOT NULL,
  `class` varchar(200) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `art_of_communication` varchar(200) NOT NULL,
  `contact_value` varchar(200) NOT NULL,
  `contact_type` varchar(200) NOT NULL,
  `main_contact` tinyint(4) NOT NULL,
  `created@` datetime NOT NULL,
  `modify@` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `topic` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `unit_estimation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `course_number` varchar(15) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  `participant_max` int(11) DEFAULT NULL,
  `participant_min` int(11) DEFAULT NULL,
  `created@` datetime NOT NULL,
  `modified@` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course_content`
--

CREATE TABLE `course_content` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `units` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course_participants`
--

CREATE TABLE `course_participants` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course_subvention`
--

CREATE TABLE `course_subvention` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `subvention_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course_trainer`
--

CREATE TABLE `course_trainer` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `display`
--

CREATE TABLE `display` (
  `id` int(11) NOT NULL,
  `serial_number` varchar(50) NOT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `name` varchar(100) NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `reminder_id` int(11) DEFAULT NULL,
  `created@` datetime NOT NULL,
  `modified@` datetime DEFAULT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `document_class`
--

CREATE TABLE `document_class` (
  `id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `class` varchar(200) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `email_template`
--

CREATE TABLE `email_template` (
  `id` int(11) NOT NULL,
  `document_type` varchar(100) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `facility`
--

CREATE TABLE `facility` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `furniture`
--

CREATE TABLE `furniture` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `quantity` int(10) NOT NULL,
  `location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `headphones`
--

CREATE TABLE `headphones` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `maus_keyboard`
--

CREATE TABLE `maus_keyboard` (
  `id` int(11) NOT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `locartion` varchar(50) NOT NULL,
  `qauntity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `notebook`
--

CREATE TABLE `notebook` (
  `id` int(11) NOT NULL,
  `serial_number` varchar(50) NOT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `notebook`
--

INSERT INTO `notebook` (`id`, `serial_number`, `make`, `model`, `location_id`, `person_id`) VALUES
(6, 'testserial1', 'Test', 'testtest', NULL, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `name1` varchar(200) NOT NULL,
  `name2` varchar(200) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `sv_nr` int(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `gender` varchar(200) DEFAULT NULL,
  `busy` varchar(200) DEFAULT NULL,
  `busy_by` varchar(200) DEFAULT NULL,
  `picture` text DEFAULT NULL,
  `function` varchar(200) NOT NULL,
  `aktiv` tinyint(4) NOT NULL,
  `deleted_inaktiv` tinyint(4) NOT NULL,
  `newsletter_flag` tinyint(4) NOT NULL,
  `created@` datetime NOT NULL,
  `modify@` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `person`
--

INSERT INTO `person` (`id`, `name1`, `name2`, `title`, `sv_nr`, `date`, `gender`, `busy`, `busy_by`, `picture`, `function`, `aktiv`, `deleted_inaktiv`, `newsletter_flag`, `created@`, `modify@`) VALUES
(1, 'My', 'Lastname', NULL, 0, '0001-01-01', NULL, NULL, NULL, NULL, '2', 1, 0, 1, '0001-01-01 00:00:00', '0001-01-01 00:00:00'),
(2, 'louis', 'tries', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', 1, 0, 0, '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reminder`
--

CREATE TABLE `reminder` (
  `id` int(11) NOT NULL,
  `task` text NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `has_done` tinyint(1) NOT NULL,
  `task_person_id` int(11) NOT NULL,
  `creation_person_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `reminder`
--

INSERT INTO `reminder` (`id`, `task`, `datetime`, `has_done`, `task_person_id`, `creation_person_id`, `creation_date`) VALUES
(1, 'looking forward', '2020-07-17 15:00:21', 1, 2, 2, '2020-07-15 15:01:44'),
(8, 'ölbrenner', '2020-07-17 11:30:30', 0, 2, 1, '2020-07-17 11:26:53'),
(11, 'hallo ihr alle, hallo, haoloooalfkasödf kdfajödflkjasölkdf f jaökdlfj aös aöfdjasdkf  aösdfjaskdfaösadlökfjöas kdakasöd f askdfaösdfj asdfaöskdjfkals dfaaös dfjkasf jaasödf jas', '2020-07-20 13:31:36', 0, 2, 1, '2020-07-19 13:33:47'),
(13, 'holz fällen', NULL, 0, 2, 1, '2020-07-19 13:44:29'),
(15, 'rasen mähen', '2021-07-19 15:06:26', 0, 1, 2, '2020-07-19 15:07:27'),
(16, 'Kühe melken', '2020-07-20 15:13:07', 1, 1, 2, '2020-07-19 15:14:29'),
(20, 'Feierabend', '2020-07-19 17:43:55', 0, 1, 1, '2020-07-19 17:41:17'),
(21, 'Leberkäse holen', '2020-07-20 09:13:43', 0, 1, 1, '2020-07-20 09:08:39'),
(22, 'Holz spalten', '2020-07-20 13:25:37', 0, 2, 1, '2020-07-20 13:20:03'),
(24, 'looking forward', '2020-07-21 11:35:38', 0, 2, 2, '2020-07-21 11:31:25'),
(27, 'looking forward', '2020-07-25 15:00:21', 0, 2, 2, '2020-07-21 13:11:58'),
(33, 'Kurs Ende', NULL, 0, 2, 1, '2020-07-22 10:30:14'),
(34, 'Wäsche bügeln', NULL, 0, 2, 1, '2020-07-22 14:58:46'),
(36, 'Ofen anheizen', '2020-07-22 20:44:31', 0, 2, 1, '2020-07-22 20:44:08');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subvention`
--

CREATE TABLE `subvention` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `percentage` double DEFAULT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `absence`
--
ALTER TABLE `absence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participant_id` (`participant_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `document_id` (`document_id`);

--
-- Indizes für die Tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `addressperson`
--
ALTER TABLE `addressperson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addressId` (`addressId`),
  ADD KEY `personId` (`personId`);

--
-- Indizes für die Tabelle `adresslocation`
--
ALTER TABLE `adresslocation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lo_id` (`locationId`),
  ADD KEY `ad_ID` (`adressId`);

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `classrooms`
--
ALTER TABLE `classrooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facility_id` (`facility_id`);

--
-- Indizes für die Tabelle `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_id` (`person_id`);

--
-- Indizes für die Tabelle `communication`
--
ALTER TABLE `communication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_id` (`document_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indizes für die Tabelle `communication_class`
--
ALTER TABLE `communication_class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `communication_id` (`communication_id`);

--
-- Indizes für die Tabelle `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `master_id` (`person_id`);

--
-- Indizes für die Tabelle `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classroom_id` (`classroom_id`);

--
-- Indizes für die Tabelle `course_content`
--
ALTER TABLE `course_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `content_id` (`content_id`);

--
-- Indizes für die Tabelle `course_participants`
--
ALTER TABLE `course_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `participant_id` (`participant_id`);

--
-- Indizes für die Tabelle `course_subvention`
--
ALTER TABLE `course_subvention`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `subvention_id` (`subvention_id`);

--
-- Indizes für die Tabelle `course_trainer`
--
ALTER TABLE `course_trainer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- Indizes für die Tabelle `display`
--
ALTER TABLE `display`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `document_class`
--
ALTER TABLE `document_class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doc_id` (`doc_id`);

--
-- Indizes für die Tabelle `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `furniture`
--
ALTER TABLE `furniture`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `headphones`
--
ALTER TABLE `headphones`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `maus_keyboard`
--
ALTER TABLE `maus_keyboard`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `notebook`
--
ALTER TABLE `notebook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indizes für die Tabelle `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `reminder`
--
ALTER TABLE `reminder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creation_person_id` (`creation_person_id`),
  ADD KEY `task_person_id` (`task_person_id`);

--
-- Indizes für die Tabelle `subvention`
--
ALTER TABLE `subvention`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `absence`
--
ALTER TABLE `absence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `addressperson`
--
ALTER TABLE `addressperson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `adresslocation`
--
ALTER TABLE `adresslocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `classrooms`
--
ALTER TABLE `classrooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `communication`
--
ALTER TABLE `communication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `communication_class`
--
ALTER TABLE `communication_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `course_content`
--
ALTER TABLE `course_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `course_participants`
--
ALTER TABLE `course_participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `course_subvention`
--
ALTER TABLE `course_subvention`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `course_trainer`
--
ALTER TABLE `course_trainer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `display`
--
ALTER TABLE `display`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `document_class`
--
ALTER TABLE `document_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `email_template`
--
ALTER TABLE `email_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `furniture`
--
ALTER TABLE `furniture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `headphones`
--
ALTER TABLE `headphones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `maus_keyboard`
--
ALTER TABLE `maus_keyboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `notebook`
--
ALTER TABLE `notebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `reminder`
--
ALTER TABLE `reminder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT für Tabelle `subvention`
--
ALTER TABLE `subvention`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `absence_ibfk_1` FOREIGN KEY (`participant_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `absence_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `absence_ibfk_3` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`);

--
-- Constraints der Tabelle `addressperson`
--
ALTER TABLE `addressperson`
  ADD CONSTRAINT `addressId` FOREIGN KEY (`addressId`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `personId` FOREIGN KEY (`personId`) REFERENCES `person` (`id`);

--
-- Constraints der Tabelle `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `m_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Constraints der Tabelle `communication`
--
ALTER TABLE `communication`
  ADD CONSTRAINT `communication_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  ADD CONSTRAINT `communication_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Constraints der Tabelle `communication_class`
--
ALTER TABLE `communication_class`
  ADD CONSTRAINT `communication_class_ibfk_1` FOREIGN KEY (`communication_id`) REFERENCES `communication` (`id`);

--
-- Constraints der Tabelle `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `master_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Constraints der Tabelle `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`);

--
-- Constraints der Tabelle `course_content`
--
ALTER TABLE `course_content`
  ADD CONSTRAINT `course_content_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `course_content_ibfk_2` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`);

--
-- Constraints der Tabelle `course_participants`
--
ALTER TABLE `course_participants`
  ADD CONSTRAINT `course_participants_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `course_participants_ibfk_2` FOREIGN KEY (`participant_id`) REFERENCES `person` (`id`);

--
-- Constraints der Tabelle `course_subvention`
--
ALTER TABLE `course_subvention`
  ADD CONSTRAINT `course_subvention_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `course_subvention_ibfk_2` FOREIGN KEY (`subvention_id`) REFERENCES `subvention` (`id`);

--
-- Constraints der Tabelle `course_trainer`
--
ALTER TABLE `course_trainer`
  ADD CONSTRAINT `course_trainer_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `course_trainer_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `person` (`id`);

--
-- Constraints der Tabelle `document_class`
--
ALTER TABLE `document_class`
  ADD CONSTRAINT `document_class_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `documents` (`id`);

--
-- Constraints der Tabelle `notebook`
--
ALTER TABLE `notebook`
  ADD CONSTRAINT `notebook_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Constraints der Tabelle `reminder`
--
ALTER TABLE `reminder`
  ADD CONSTRAINT `reminder_ibfk_1` FOREIGN KEY (`creation_person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `reminder_ibfk_2` FOREIGN KEY (`task_person_id`) REFERENCES `person` (`id`);
--
-- Datenbank: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Daten für Tabelle `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Daten für Tabelle `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"courses\",\"table\":\"person\"},{\"db\":\"personadmin\",\"table\":\"reminder\"},{\"db\":\"personadmin\",\"table\":\"person\"},{\"db\":\"dcv\",\"table\":\"person\"},{\"db\":\"insta feed\",\"table\":\"post\"},{\"db\":\"personadmin\",\"table\":\"addressperson\"},{\"db\":\"personadmin\",\"table\":\"address\"},{\"db\":\"personadmin\",\"table\":\"master_file\"},{\"db\":\"personadmin\",\"table\":\"contact\"},{\"db\":\"personadmin\",\"table\":\"comment\"}]');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

--
-- Daten für Tabelle `pma__relation`
--

INSERT INTO `pma__relation` (`master_db`, `master_table`, `master_field`, `foreign_db`, `foreign_table`, `foreign_field`) VALUES
('insta feed', 'post', 'created by', 'insta feed', 'user', 'username'),
('insta feed', 'user', 'username', 'insta feed', 'user', 'username');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Daten für Tabelle `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('chat', 'received_message', 'sender'),
('chat', 'sent_message', 'receiver'),
('cinema', 'customer', 'first_name'),
('cinema', 'hall', 'name'),
('cinema', 'movie', 'title'),
('cinema', 'ticket_order', 'customer_username'),
('gastronomy', 'delivery', 'town'),
('gastronomy', 'ingredient', 'name'),
('gastronomy', 'kind_of_menu', 'name'),
('gastronomy', 'menu', 'name'),
('library', 'book', 'company_book_number_library'),
('library', 'book_lending', 'employee_social_insurance_number'),
('library', 'customer', 'name'),
('library', 'employee', 'name'),
('library', 'library', 'company_book_number'),
('personadmin', 'reminder', 'task');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Daten für Tabelle `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'car_trade', 'car', '{\"sorted_col\":\"`car`.`price`  DESC\"}', '2020-04-02 08:19:56');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Daten für Tabelle `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-07-23 07:38:24', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"de\"}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indizes für die Tabelle `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indizes für die Tabelle `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indizes für die Tabelle `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indizes für die Tabelle `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indizes für die Tabelle `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indizes für die Tabelle `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indizes für die Tabelle `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indizes für die Tabelle `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indizes für die Tabelle `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indizes für die Tabelle `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indizes für die Tabelle `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indizes für die Tabelle `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indizes für die Tabelle `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indizes für die Tabelle `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indizes für die Tabelle `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indizes für die Tabelle `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indizes für die Tabelle `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Datenbank: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Datenbank: `warehouse`
--
CREATE DATABASE IF NOT EXISTS `warehouse` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `warehouse`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `article_name` varchar(100) NOT NULL,
  `rack_number` int(11) NOT NULL,
  `buying_price` double NOT NULL,
  `selling_price` double NOT NULL,
  `amount` int(11) NOT NULL,
  `deliverer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `warehouse`
--

INSERT INTO `warehouse` (`id`, `article_name`, `rack_number`, `buying_price`, `selling_price`, `amount`, `deliverer_id`) VALUES
(1, 'Nike Sneaker', 13, 26.41, 39.99, 22, 8),
(2, 'Regenschirm BayWa', 2, 29.12, 45.99, 2, 12),
(3, 'Regenschirm DCV', 4, 14.58, 19.99, 17, 12),
(4, 'Microsoft Tastatur', 17, 58.17, 84.95, 4, 2),
(5, 'Jacke Mammut', 17, 142.25, 199.99, 80, 7),
(6, 'Canon Druckerpatronen XL', 5, 32.56, 69.99, 4, 9),
(7, 'Canon Druckerpatronen', 5, 31.22, 45.99, 200, 9),
(8, 'Socken Gr. 38 - 41', 4, 8.21, 12.99, 15, 3),
(9, 'Fahrradhelm No Name', 4, 19.23, 28.99, 6, 3),
(10, 'Schlittschuhe CCM\"', 16, 48.67, 65.99, 9, 2),
(11, 'Adidas Schuhe', 5, 35.24, 49.99, 1, 2),
(12, 'Fitness Uhr', 17, 84.51, 129.99, 5, 5),
(13, 'Fitness Uhr II', 17, 99.02, 149.99, 2, 5),
(14, 'Lenovo Tablet', 14, 140, 219.95, 4, 4),
(15, 'HP Tablet\"', 14, 202.24, 299.95, 0, 3),
(16, 'Bildschirm Asus VS228NE', 17, 53.99, 87.9, 11, 6),
(17, 'Bildschirm ACER KA220HQbid', 17, 64.99, 99.99, 7, 6),
(18, 'Bildschirm Samsung C24F396FHU', 17, 79.99, 149.95, 9, 6);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Datenbank: `woerterbuch`
--
CREATE DATABASE IF NOT EXISTS `woerterbuch` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `woerterbuch`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `languagelinking`
--

CREATE TABLE `languagelinking` (
  `id` int(11) NOT NULL,
  `word1_id` int(11) NOT NULL,
  `word2_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `languagelinking`
--

INSERT INTO `languagelinking` (`id`, `word1_id`, `word2_id`) VALUES
(8, 70, 71),
(9, 70, 72),
(10, 71, 72),
(11, 73, 74),
(12, 73, 75),
(13, 74, 75),
(14, 76, 77),
(15, 76, 78),
(16, 77, 78),
(17, 79, 80),
(18, 79, 81),
(19, 80, 81),
(20, 82, 83),
(21, 82, 84),
(22, 83, 84),
(23, 85, 86),
(24, 85, 87),
(25, 86, 87),
(26, 88, 89),
(27, 88, 90),
(28, 89, 90),
(29, 91, 92),
(30, 91, 93),
(31, 92, 93),
(32, 94, 95);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `word`
--

CREATE TABLE `word` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `language` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `word`
--

INSERT INTO `word` (`id`, `name`, `language`) VALUES
(70, 'hallo', 'DE'),
(71, 'hello', 'EN'),
(72, 'hej', 'SW'),
(73, 'morgen', 'DE'),
(74, 'morning', 'EN'),
(75, 'morgon', 'SW'),
(76, 'Fleisch', 'DE'),
(77, 'meat', 'EN'),
(78, 'kött', 'SW'),
(79, 'Vater', 'DE'),
(80, 'father', 'EN'),
(81, 'far', 'SW'),
(82, 'Papa', 'DE'),
(83, 'dad', 'EN'),
(84, 'far', 'SW'),
(85, 'Abend', 'DE'),
(86, 'evening', 'EN'),
(87, 'eve', 'SW'),
(88, 'Mutter', 'DE'),
(89, 'mother', 'EN'),
(90, 'mor', 'SW'),
(91, 'Eltern', 'DE'),
(92, 'parents', 'EN'),
(93, 'föräldrar', 'SW'),
(94, 'result', 'EN'),
(95, 'Ergebnis', 'DE');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `languagelinking`
--
ALTER TABLE `languagelinking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `word1_id` (`word1_id`),
  ADD KEY `word2_id` (`word2_id`);

--
-- Indizes für die Tabelle `word`
--
ALTER TABLE `word`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `languagelinking`
--
ALTER TABLE `languagelinking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT für Tabelle `word`
--
ALTER TABLE `word`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `languagelinking`
--
ALTER TABLE `languagelinking`
  ADD CONSTRAINT `languagelinking_ibfk_1` FOREIGN KEY (`word1_id`) REFERENCES `word` (`id`),
  ADD CONSTRAINT `languagelinking_ibfk_2` FOREIGN KEY (`word2_id`) REFERENCES `word` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
