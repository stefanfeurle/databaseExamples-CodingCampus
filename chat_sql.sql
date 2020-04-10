-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Apr 2020 um 12:45
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
-- Datenbank: `chat`
--

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
(11, 'stefan.wasserle', '2020-04-10 10:27:12', 'Hallo Marc! Wir wünschen dir und deiner Familie frohe Ostern! Danke für deine Unterstützung', 0, 'marc.unterhuber');

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
(7, 'marc.unterhuber', '2020-04-10 10:26:11', 'Hallo Marc! Wir wünschen dir und deiner Familie frohe Ostern! Danke für deine Unterstützung', 'stefan.wasserle');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `sent_message`
--
ALTER TABLE `sent_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
