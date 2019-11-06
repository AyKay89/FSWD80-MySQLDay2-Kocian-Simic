-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Nov 2019 um 13:37
-- Server-Version: 10.4.8-MariaDB
-- PHP-Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `auctionhouse`
--
CREATE DATABASE IF NOT EXISTS `auctionhouse` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `auctionhouse`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auctionhouse`
--

CREATE TABLE `auctionhouse` (
  `auctionhouse_ID` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL,
  `fk_customer_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `auctionhouse`
--

INSERT INTO `auctionhouse` (`auctionhouse_ID`, `name`, `address`, `fk_customer_ID`) VALUES
(13, 'DaWay', 'Burggasse 13', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bid`
--

CREATE TABLE `bid` (
  `bid_ID` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `auction_datetime` datetime DEFAULT NULL,
  `fk_sets_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `bid`
--

INSERT INTO `bid` (`bid_ID`, `amount`, `auction_datetime`, `fk_sets_ID`) VALUES
(83, 434, '2019-08-13 12:00:53', 25);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `emailadress` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_ID`, `password`, `first_name`, `last_name`, `emailadress`) VALUES
(1, '1bis5', 'Cookie', 'Jar', 'cookie.jar@gmail.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product`
--

CREATE TABLE `product` (
  `product_ID` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `description` varchar(55) DEFAULT NULL,
  `photo` varchar(55) DEFAULT NULL,
  `fk_sets_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sets`
--

CREATE TABLE `sets` (
  `sets_ID` int(11) NOT NULL,
  `start_price` int(11) DEFAULT NULL,
  `highest_bid` int(11) DEFAULT NULL,
  `remaining_auction_time` date DEFAULT NULL,
  `fk_auctionhouse_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sets`
--

INSERT INTO `sets` (`sets_ID`, `start_price`, `highest_bid`, `remaining_auction_time`, `fk_auctionhouse_ID`) VALUES
(25, 200, 30000, '2019-08-13', 13);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `auctionhouse`
--
ALTER TABLE `auctionhouse`
  ADD PRIMARY KEY (`auctionhouse_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`);

--
-- Indizes für die Tabelle `bid`
--
ALTER TABLE `bid`
  ADD PRIMARY KEY (`bid_ID`),
  ADD KEY `fk_sets_ID` (`fk_sets_ID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indizes für die Tabelle `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_ID`),
  ADD KEY `fk_sets_ID` (`fk_sets_ID`);

--
-- Indizes für die Tabelle `sets`
--
ALTER TABLE `sets`
  ADD PRIMARY KEY (`sets_ID`),
  ADD KEY `fk_auctionhouse_ID` (`fk_auctionhouse_ID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `auctionhouse`
--
ALTER TABLE `auctionhouse`
  ADD CONSTRAINT `auctionhouse_ibfk_1` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`);

--
-- Constraints der Tabelle `bid`
--
ALTER TABLE `bid`
  ADD CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`fk_sets_ID`) REFERENCES `sets` (`sets_ID`);

--
-- Constraints der Tabelle `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`fk_sets_ID`) REFERENCES `sets` (`sets_ID`);

--
-- Constraints der Tabelle `sets`
--
ALTER TABLE `sets`
  ADD CONSTRAINT `sets_ibfk_1` FOREIGN KEY (`fk_auctionhouse_ID`) REFERENCES `auctionhouse` (`auctionhouse_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
