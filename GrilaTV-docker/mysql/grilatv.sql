-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Feb 09, 2020 at 12:41 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grilatv`
--
DROP DATABASE IF EXISTS `grilatv`;
CREATE DATABASE IF NOT EXISTS `grilatv`;
USE `grilatv`;

-- --------------------------------------------------------

--
-- Table structure for table `abonamente`
--

DROP TABLE IF EXISTS `abonamente`;
CREATE TABLE IF NOT EXISTS `abonamente` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Client` int(11) DEFAULT NULL,
  `Oferta` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `Client` (`Client`),
  KEY `Oferta` (`Oferta`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `abonamente`
--

INSERT INTO `abonamente` (`ID`, `Client`, `Oferta`) VALUES
(1, 30513, 4),
(2, 13951, 1),
(3, 82694, 5),
(4, 20856, 4),
(5, 73921, 7),
(6, 20856, 10),
(7, 90846, 9),
(8, 13951, 4),
(9, 99214, 3),
(10, 49453, 6),
(11, 83766, 5),
(12, 90846, 2),
(13, 59833, 10),
(14, 29404, 4),
(15, 22161, 2),
(16, 68389, 7),
(17, 17227, 1),
(18, 29404, 9),
(19, 59833, 3),
(20, 29404, 4),
(21, 95461, 7),
(22, 22161, 5),
(23, 68389, 10),
(24, 59833, 4),
(25, 95461, 1),
(26, 22161, 9),
(27, 17227, 4),
(28, 68389, 10),
(29, 23380, 7),
(30, 17227, 5),
(31, 54244, 3),
(32, 29404, 4),
(33, 30513, 5),
(34, 23380, 1),
(35, 17227, 7);

-- --------------------------------------------------------

--
-- Table structure for table `abonati`
--

DROP TABLE IF EXISTS `abonati`;
CREATE TABLE IF NOT EXISTS `abonati` (
  `Cod_Client` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(40) NOT NULL,
  PRIMARY KEY (`Cod_Client`),
  UNIQUE KEY `Cod_Client` (`Cod_Client`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=99215 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `abonati`
--

INSERT INTO `abonati` (`Cod_Client`, `Email`) VALUES
(63707, 'alida.vintila@gmail.com'),
(59833, 'aradna89@albu.com'),
(82694, 'camil81@hotmail.com'),
(54244, 'cristobal02@cucu.com'),
(22161, 'florian73@hotmail.com'),
(95461, 'kpatrascu@pintea.biz'),
(68389, 'marilena87@yahoo.com'),
(83766, 'maxim.venera@panait.net'),
(99214, 'mircea.stanescu@tataru.org'),
(49453, 'ocrisan@yahoo.com'),
(20856, 'paulina.albu@mihai.biz'),
(10006, 'popovici.emanuel@marian.com'),
(30513, 'robertina90@david.com'),
(23409, 'tignat@duta.com'),
(23380, 'toma.miron@gmail.com'),
(17227, 'traian09@hotmail.com'),
(29404, 'wvoinea@hotmail.com'),
(73921, 'xmarian@filip.com'),
(90846, 'zpanait@martin.info'),
(13951, 'zparaschiv@hotmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `difuzari`
--

DROP TABLE IF EXISTS `difuzari`;
CREATE TABLE IF NOT EXISTS `difuzari` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Emisiune` int(11) NOT NULL,
  `Post` int(11) NOT NULL,
  `Program` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `Emisiune` (`Emisiune`),
  KEY `Post` (`Post`),
  KEY `Program` (`Program`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `difuzari`
--

INSERT INTO `difuzari` (`ID`, `Emisiune`, `Post`, `Program`) VALUES
(1, 1, 1, 5),
(2, 1, 5, 2),
(3, 2, 3, 3),
(4, 3, 2, 4),
(5, 3, 2, 6),
(6, 4, 2, 1),
(7, 4, 3, 4),
(8, 4, 6, 7),
(9, 5, 4, 12),
(10, 7, 4, 14),
(11, 6, 4, 16),
(12, 10, 11, 8),
(13, 11, 7, 16),
(14, 12, 8, 20),
(15, 11, 9, 26),
(16, 13, 10, 12),
(17, 14, 15, 10),
(18, 15, 15, 16),
(19, 16, 16, 12),
(20, 17, 12, 24),
(21, 18, 17, 27),
(22, 19, 17, 12),
(23, 20, 17, 28),
(24, 21, 13, 25),
(25, 22, 20, 16),
(26, 23, 27, 23),
(27, 24, 20, 18),
(28, 25, 66, 21),
(29, 26, 22, 26),
(30, 27, 21, 18),
(31, 28, 21, 14),
(32, 29, 28, 19),
(33, 30, 21, 30),
(34, 31, 27, 17),
(35, 32, 29, 24),
(36, 33, 40, 28),
(37, 34, 26, 14),
(38, 35, 42, 18),
(39, 36, 48, 9),
(40, 37, 34, 10),
(41, 40, 40, 13),
(42, 41, 49, 17),
(43, 42, 50, 19),
(44, 45, 66, 13),
(45, 46, 63, 20),
(46, 47, 62, 25),
(47, 48, 68, 22),
(48, 49, 65, 17),
(49, 50, 68, 9),
(50, 44, 40, 16);

-- --------------------------------------------------------

--
-- Table structure for table `emisiuni`
--

DROP TABLE IF EXISTS `emisiuni`;
CREATE TABLE IF NOT EXISTS `emisiuni` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Denumire` varchar(80) NOT NULL,
  `Descriere` longtext,
  `Tip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `Denumire` (`Denumire`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emisiuni`
--

INSERT INTO `emisiuni` (`ID`, `Denumire`, `Descriere`, `Tip`) VALUES
(1, 'Teleshopping', '', 'shopping'),
(2, 'Aventura urbana', '', ''),
(3, 'Vorbeste lumea', '', 'reality show'),
(4, 'Stirile', '', 'stiri'),
(5, 'Like a star', '', 'monden'),
(6, 'Puterea dragostei', '', 'concurs'),
(7, 'Star matinal', '', 'monden'),
(8, 'Pastila de ras', '', ''),
(9, 'Dragoste si ura', '', ''),
(10, 'Starea natiei', '', 'stiri'),
(11, 'Fotbal', '', 'sport'),
(12, 'Rezumate Handball', '', 'sport'),
(13, 'Regatul salbatic', '', 'documentar'),
(14, 'Destine ca-n filme', '', 'reality show'),
(15, 'Glasul inimii', '', 'reality show'),
(16, 'Baronii', '', ''),
(17, 'Voua', '', 'cultura'),
(18, 'Veterinarul', '', ''),
(19, 'Destine ratacite', '', 'reality show'),
(20, 'Femeia desertului', '', 'drama'),
(21, 'Reporter special', '', 'stiri'),
(22, 'Clipuri', '', ''),
(23, 'Parola: te iubesc', '', 'serial'),
(24, 'In numele fericirii', '', ''),
(25, 'Veterinar in Yukon', '', 'documentar'),
(26, 'Top Designers', '', 'moda'),
(27, 'Fashion Week', '', 'stiri moda'),
(28, 'Fashion Destination', '', ''),
(29, 'Familia cu multe fiice', '', 'rality show'),
(30, 'Rochia perfecta', '', 'moda'),
(31, '90 de zile pana la nunta', '', 'reality show'),
(32, 'Castle', '', 'serial actiune'),
(33, 'Calatorie periculoasa', '', 'serial actiune'),
(34, 'La Bloc', '', 'serial comedie'),
(35, 'Camera de garda', '', 'serial'),
(36, 'Lege si ordine', '', 'serial crima'),
(37, 'Cold Mountain', '', 'aventura'),
(38, 'Compania Orheim', '', 'drama'),
(39, 'Finn', '', 'drama'),
(40, 'Ready Player One', '', 'sci-fi'),
(41, 'Epoca de gheata 4', '', 'animatie'),
(42, 'Herry Potter si Pocalul de Foc', '', 'aventura'),
(43, 'Dragonul de gheata', '', 'aventura'),
(44, 'Cel care scria scrisori', '', ''),
(45, 'Acvarii la comanda', '', 'documentar'),
(46, 'Goana dupa aur', '', 'documentar'),
(47, 'Bogatii din pamant', '', 'documentar'),
(48, 'Mituri si monstrii', '', 'documentar'),
(49, 'Cum se fabrica?', '', 'documentar'),
(50, 'Regele cofetarilor', '', 'documentar');

-- --------------------------------------------------------

--
-- Table structure for table `oferte`
--

DROP TABLE IF EXISTS `oferte`;
CREATE TABLE IF NOT EXISTS `oferte` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Denumire` varchar(80) NOT NULL,
  `Descriere` longtext,
  `Tip` varchar(40) NOT NULL,
  `Valoare` float NOT NULL,
  `Pachet` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`, `Denumire`),
  UNIQUE KEY `ID` (`ID`),
  KEY `Pachet` (`Pachet`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `oferte`
--

INSERT INTO `oferte` (`ID`, `Denumire`, `Descriere`, `Tip`, `Valoare`, `Pachet`) VALUES
(1, 'Filme 1', NULL, 'Film', 24.3, 4),
(2, 'Documentar 1', NULL, 'Documentare', 38.26, 8),
(3, 'Filme AXN', NULL, 'Filme', 33.08, 5),
(4, 'Geographic Channel', NULL, 'Documentare', 8.16, 9),
(5, 'Filme HBO', NULL, 'Filme', 21.35, 7),
(6, 'Descopera', NULL, 'Documentare', 35.3, 10),
(7, 'Stil de viata', NULL, 'Mixt', 20.25, 2),
(8, 'General', NULL, 'Generic', 5.28, 1),
(9, 'Look', NULL, 'Mixt', 35.3, 3),
(10, 'Filme FilmBox', NULL, 'Filme', 25.23, 4),
(11, 'Filme 2', NULL, 'Film', 24.3, 5),
(12, 'Filme 3', NULL, 'Film', 24.3, 6),
(13, 'Filme 4', NULL, 'Film', 24.3, 7),
(14, 'Documentar 2', NULL, 'Documentare', 38.26, 9),
(15, 'Documentar 3', NULL, 'Documentare', 38.26, 10);

-- --------------------------------------------------------

--
-- Table structure for table `pachetetv`
--

DROP TABLE IF EXISTS `pachetetv`;
CREATE TABLE IF NOT EXISTS `pachetetv` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Denumire` varchar(80) NOT NULL,
  `Descriere` longtext,
  `Generic` varchar(30) NOT NULL,
  `Asemanare` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `Denumire` (`Denumire`),
  KEY `Asemanare` (`Asemanare`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pachetetv`
--

INSERT INTO `pachetetv` (`ID`, `Denumire`, `Descriere`, `Generic`, `Asemanare`) VALUES
(1, 'Basic', '', 'Generic', 1),
(2, 'Life Style', '', 'Mixt', 2),
(3, 'Look', '', 'Mixt', 2),
(4, 'Film+', '', 'Filme', 4),
(5, 'AXN', '', 'Filme', 4),
(6, 'FilmBox', '', 'Filme', 4),
(7, 'HBO GO', '', 'Filme', 4),
(8, 'Documentare+', '', 'Documentare', 8),
(9, 'Nat Geo', '', 'Documentare', 8),
(10, 'Discovery', '', 'Documentare', 8);

-- --------------------------------------------------------

--
-- Table structure for table `persoane`
--

DROP TABLE IF EXISTS `persoane`;
CREATE TABLE IF NOT EXISTS `persoane` (
  `Email` varchar(50) NOT NULL,
  `Nume` varchar(40) NOT NULL,
  `Prenume` varchar(40) NOT NULL,
  `Telefon` varchar(10) NOT NULL,
  `Oras` varchar(30) DEFAULT NULL,
  `Judet` varchar(30) DEFAULT NULL,
  `Strada` varchar(50) DEFAULT NULL,
  `Numar` varchar(10) DEFAULT NULL,
  `Bloc` varchar(3) DEFAULT NULL,
  `Scara` varchar(3) DEFAULT NULL,
  `Apartament` int(11) DEFAULT NULL,
  PRIMARY KEY (`Email`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Telefon` (`Telefon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `persoane`
--

INSERT INTO `persoane` (`Email`, `Nume`, `Prenume`, `Oras`, `Judet`, `Strada`, `Numar`, `Bloc`, `Scara`, `Apartament`, `Telefon`) VALUES
('alida.vintila@gmail.com', 'Dumitrescu', 'Ioanina', 'Miercurea Ciuc', 'Harghita', 'P-ta Jiului', '1', '1', 'A', 3, '0341886041'),
('aradna89@albu.com', 'Varga', 'Anton', 'Sangeorz-Bai', 'Bistrita Nasaud', 'B-dul J.J. Rousseanu', '9-7', '', '', 0, '0775680886'),
('camil81@hotmail.com', 'Ciobanu', 'Teodor', 'Satu Mare', 'Ialomita', 'Petrache Poenaru', '5B', '', '', 0, '0775546436'),
('cristobal02@cucu.com', 'Moraru', 'Andra', 'Marghita', 'Salaj', 'Aleea Horea', '233', '99', 'C', 1, '0774428340'),
('florian73@hotmail.com', 'Cristescu', 'Arina', 'Stei', 'Maramures', 'P-ta Jiului', '6-4', '', '', 0, '0366966080'),
('kpatrascu@pintea.biz', 'Lupu', 'Edmond', 'Azuga', 'Prahova', 'B-dul Salcamilor', '2A', '', '', 0, '0276025776'),
('marilena87@yahoo.com', 'Paraschiv', 'Tiberiu', 'Tecuci', 'Galati', 'P-ata Albert Einstein', '3', '', '', 0, '0735574447'),
('maxim.venera@panait.net', 'Bejan', 'Ioanina', 'Titu', 'Caras-Severin', 'Calea Somes', '74', 'C', 'A', 9, '0721731100'),
('mircea.stanescu@tataru.org', 'Tudorache', 'Gina', 'Hunedoara', 'Hunedoara', 'Aleea Mihai Eminescu', '8A', '', '', 0, '0723177754'),
('ocrisan@yahoo.com', 'Nica', 'Florea', 'Baile Olanesti', 'Vailcea', 'Frunzisului', '6', '', '', 0, '0365786980'),
('paulina.albu@mihai.biz', 'Pirvu', 'Razvan', 'Turceni', 'Hunedoara', 'Splaiul Albert Einstein', '608', '', '', 0, '0331690160'),
('popovici.emanuel@marian.com', 'Vaduva', 'Daniela', 'Boldesti-Scaeni', 'Prahova', 'B-dul Crisan', '32', 'C', 'A', 6, '0346061196'),
('robertina90@david.com', 'Benone', 'Marian', 'Salonta', 'Neamt', 'Aleea Florilor', '2A', '', '', 0, '0352909460'),
('tignat@duta.com', 'Olteanu', 'Visarion', 'Videle', 'Bistrita Nasaud', 'P-ta Padis', '204', '', '', 0, '0738677865'),
('toma.miron@gmail.com', 'Ionescu', 'Amanda', 'Dabuleni', 'Botosani', 'P-ta Horea', '3B', 'D', 'D', 9, '0751479331'),
('traian09@hotmail.com', 'Tudorache', 'Andreea', 'Vlahita', 'Bihor', 'P-ta Henri Coanda', '5-3', '', '', 0, '0716219863'),
('wvoinea@hotmail.com', 'Draghici', 'Maria', 'Mihailesti', 'Valcea', 'P-ta Decebal', '02', '', '', 0, '0747859792'),
('xmarian@filip.com', 'Costin', 'Catrinel', 'Sebis', 'Bistrita Nasaud', 'Splaiul Albert Einstein', '0A', '', '', 0, '0256600263'),
('zpanait@martin.info', 'Tataru', 'Decebal', 'Sacueni', 'Arad', 'P-ta Jiului', '552', '', '', 0, '0310946080'),
('zparaschiv@hotmail.com', 'Banica', 'Aurica', 'Curtici', 'Bistrita Nasaud', 'Splaiul Bradutului', '92', 'B', 'A', 4, '0703804981');

-- --------------------------------------------------------

--
-- Table structure for table `posturitv`
--

DROP TABLE IF EXISTS `posturitv`;
CREATE TABLE IF NOT EXISTS `posturitv` (
  `Numar` int(11) NOT NULL AUTO_INCREMENT,
  `Denumire` varchar(60) NOT NULL,
  `Generic` varchar(30) NOT NULL,
  `PachetTV` int(11) NOT NULL,
  PRIMARY KEY (`Numar`),
  UNIQUE KEY `Numar` (`Numar`),
  UNIQUE KEY `Denumire` (`Denumire`),
  KEY `PachetTV` (`PachetTV`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posturitv`
--

INSERT INTO `posturitv` (`Numar`, `Denumire`, `Generic`, `PachetTV`) VALUES
(1, 'TVR 1', 'Generic', 1),
(2, 'Pro TV', 'Generic', 1),
(3, 'Antena 1', 'Generic', 1),
(4, 'Antena Stars', 'Monden', 2),
(5, 'Prima TV', 'Generic', 1),
(6, 'Kanal D', 'Generic', 1),
(7, 'Look Plus', 'Generic', 3),
(8, 'Look Sport', 'Sport', 3),
(9, 'Look Sport 2', 'Sport', 3),
(10, 'TVR 2', 'Cultura', 1),
(11, 'National TV', 'Generic', 1),
(12, 'TVR 3', 'Cultura', 1),
(13, 'Neptun TV', 'Stiri', 1),
(14, 'National 24 Plus', 'Documentare', 1),
(15, 'Pro Gold', 'Monden', 2),
(16, 'Pro 2', 'Seriale', 2),
(17, 'FilmCafe', 'Filme', 4),
(20, 'FineLiving', 'Mixt', 2),
(21, 'Fashion TV', 'Fashion', 2),
(22, 'TLC', 'Mixt', 2),
(23, 'TV Paprika', 'Cooking', 2),
(24, 'Food TV', 'Cooking', 2),
(26, 'Pro Cinema', 'Filme', 1),
(27, 'DIVA Universal', 'Seriale', 4),
(28, 'AXN', 'Filme', 5),
(29, 'AXN White', 'Filme', 5),
(30, 'AXN Black', 'Filme', 5),
(31, 'AMC', 'Filme', 1),
(32, 'TV 1000', 'Filme', 4),
(33, 'FilmBox', 'Filme', 6),
(34, 'Paramount TV', 'Filme', 4),
(36, 'AXN Spin', 'Filme', 5),
(40, 'HBO', 'Filme', 7),
(41, 'HBO 2', 'Filme', 7),
(42, 'HBO 3', 'Filme', 7),
(48, 'FilmBox Extra', 'Filme', 6),
(49, 'FilmBox Family', 'Filme', 6),
(50, 'FilmBox Plus', 'Filme', 6),
(51, 'FilmBox Premium', 'Filme', 6),
(52, 'HBO HD', 'Filme', 7),
(60, 'History', 'Documentare', 8),
(61, 'Nat Geo Wild', 'Documentare', 9),
(62, 'National Geographic', 'Documentare', 9),
(63, 'Discovery', 'Documentare', 10),
(64, 'Investigation Discovery', 'Documentare', 10),
(65, 'Discovery Science', 'Documentare', 10),
(66, 'Animal Planet', 'Documentare', 8),
(67, 'Viasat History', 'Documentare', 8),
(68, 'Viasat', 'Documentare', 8),
(69, 'CBS Reality', 'Documentare', 8);

-- --------------------------------------------------------

--
-- Table structure for table `programe`
--

DROP TABLE IF EXISTS `programe`;
CREATE TABLE IF NOT EXISTS `programe` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Zi` int(11) NOT NULL,
  `Luna` varchar(25) NOT NULL,
  `An` int(11) NOT NULL,
  `Ora_Start` int(11) NOT NULL,
  `Minut_Start` int(11) NOT NULL,
  `Ora_Sfarsit` int(11) NOT NULL,
  `Minut_Sfarsit` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `programe`
--

INSERT INTO `programe` (`ID`, `Zi`, `Luna`, `An`, `Ora_Start`, `Minut_Start`, `Ora_Sfarsit`, `Minut_Sfarsit`) VALUES
(1, 14, '1', 2020, 10, 28, 12, 18),
(2, 24, '2', 2020, 12, 30, 14, 10),
(3, 20, '12', 2020, 13, 25, 14, 15),
(4, 14, '10', 2020, 11, 27, 13, 20),
(5, 14, '9', 2020, 16, 25, 18, 19),
(6, 24, '9', 2020, 14, 35, 16, 27),
(7, 14, '10', 2020, 12, 45, 13, 16),
(8, 6, '2', 2020, 16, 29, 18, 24),
(9, 19, '1', 2020, 18, 30, 20, 18),
(10, 8, '3', 2020, 20, 35, 21, 37),
(11, 11, '3', 2020, 21, 15, 22, 31),
(12, 19, '1', 2020, 16, 29, 18, 42),
(13, 14, '2', 2020, 19, 16, 21, 56),
(14, 13, '1', 2020, 12, 4, 13, 17),
(15, 14, '4', 2020, 14, 6, 16, 21),
(16, 20, '4', 2020, 11, 15, 12, 22),
(17, 21, '12', 2020, 9, 38, 10, 16),
(18, 16, '4', 2020, 6, 27, 7, 19),
(19, 12, '1', 2020, 8, 41, 9, 30),
(20, 21, '1', 2020, 11, 25, 12, 45),
(21, 14, '1', 2020, 7, 28, 9, 37),
(22, 14, '5', 2020, 7, 25, 8, 45),
(23, 19, '5', 2020, 9, 26, 11, 18),
(24, 19, '5', 2020, 12, 25, 13, 29),
(25, 14, '7', 2020, 15, 29, 16, 23),
(26, 14, '7', 2020, 13, 25, 14, 17),
(27, 22, '6', 2020, 17, 16, 19, 27),
(28, 23, '8', 2020, 12, 12, 13, 14),
(29, 14, '6', 2020, 19, 25, 21, 20),
(30, 22, '8', 2020, 20, 14, 22, 24);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abonamente`
--
ALTER TABLE `abonamente`
  ADD CONSTRAINT `abonamente_ibfk_1` FOREIGN KEY (`Client`) REFERENCES `abonati` (`Cod_Client`),
  ADD CONSTRAINT `abonamente_ibfk_2` FOREIGN KEY (`Oferta`) REFERENCES `oferte` (`ID`);

--
-- Constraints for table `abonati`
--
ALTER TABLE `abonati`
  ADD CONSTRAINT `abonati_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `persoane` (`Email`);

--
-- Constraints for table `difuzari`
--
ALTER TABLE `difuzari`
  ADD CONSTRAINT `difuzari_ibfk_1` FOREIGN KEY (`Emisiune`) REFERENCES `emisiuni` (`ID`),
  ADD CONSTRAINT `difuzari_ibfk_2` FOREIGN KEY (`Post`) REFERENCES `posturitv` (`Numar`),
  ADD CONSTRAINT `difuzari_ibfk_3` FOREIGN KEY (`Program`) REFERENCES `programe` (`ID`);

--
-- Constraints for table `oferte`
--
ALTER TABLE `oferte`
  ADD CONSTRAINT `oferte_ibfk_1` FOREIGN KEY (`Pachet`) REFERENCES `pachetetv` (`ID`);

--
-- Constraints for table `pachetetv`
--
ALTER TABLE `pachetetv`
  ADD CONSTRAINT `pachetetv_ibfk_1` FOREIGN KEY (`Asemanare`) REFERENCES `pachetetv` (`ID`);

--
-- Constraints for table `posturitv`
--
ALTER TABLE `posturitv`
  ADD CONSTRAINT `posturitv_ibfk_1` FOREIGN KEY (`PachetTV`) REFERENCES `pachetetv` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
