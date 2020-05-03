-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Mai 2020 um 23:22
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
