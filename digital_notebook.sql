-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Apr 2020 um 08:33
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
-- Datenbank: `digital_notebook`
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
