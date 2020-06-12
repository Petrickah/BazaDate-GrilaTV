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
-- ----------------------------------------------
--
-- Table structure for table `persoane`
--
DROP TABLE IF EXISTS `adrese`;
CREATE TABLE IF NOT EXISTS `adrese` (
    `ID` INT NOT NULL UNIQUE AUTO_INCREMENT,
    `Oras` varchar(30) NOT NULL,
    `Judet` varchar(30) NOT NULL,
    `Strada` varchar(50) NOT  NULL,
    `Numar` varchar(10) NOT NULL,
    `Bloc` varchar(3) DEFAULT NULL,
    `Scara` varchar(3) DEFAULT NULL,
    `Apartament` int(11) DEFAULT NULL,
    PRIMARY KEY(`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
DROP TABLE IF EXISTS `persoane`;
CREATE TABLE IF NOT EXISTS `persoane` (
    `Email` varchar(50) UNIQUE NOT NULL,
    `Nume` varchar(40) NOT NULL,
    `Prenume` varchar(40) NOT NULL,
    `Telefon` varchar(10) UNIQUE NOT NULL,
    `Adresa` INT NOT NULL,
    PRIMARY KEY (`Email`),
    FOREIGN KEY (`Adresa`) REFERENCES `adrese` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Dumping data for table `persoane`
--
INSERT INTO `adrese` (`ID`, `Oras`, `Judet`, `Strada`, `Numar`, `Bloc`, `Scara`, `Apartament`) VALUES 
(1, 'Miercurea Ciuc', 'Harghita', 'P-ta Jiului', '1', '1', 'A', 3),
(2, 'Sangeorz-Bai', 'Bistrita Nasaud', 'B-dul J.J. Rousseanu', '9-7', '', '', 0),
(3, 'Satu Mare', 'Ialomita', 'Petrache Poenaru', '5B', '', '', 0),
(4, 'Marghita', 'Salaj', 'Aleea Horea', '233', '99', 'C', 1),
(5, 'Stei', 'Maramures', 'P-ta Jiului', '6-4', '', '', 0),
(6, 'Azuga', 'Prahova', 'B-dul Salcamilor', '2A', '', '', 0),
(7, 'Tecuci', 'Galati', 'P-ata Albert Einstein', '3', '', '', 0),
(8, 'Titu', 'Caras-Severin', 'Calea Somes', '74', 'C', 'A', 9),
(9, 'Hunedoara', 'Hunedoara', 'Aleea Mihai Eminescu', '8A', '', '', 0),
(10, 'Baile Olanesti', 'Vailcea', 'Frunzisului', '6', '', '', 0),
(11, 'Turceni', 'Hunedoara', 'Splaiul Albert Einstein', '608', '', '', 0),
(12, 'Boldesti-Scaeni', 'Prahova', 'B-dul Crisan', '32', 'C', 'A', 6),
(13, 'Salonta', 'Neamt', 'Aleea Florilor', '2A', '', '', 0),
(14, 'Videle', 'Bistrita Nasaud', 'P-ta Padis', '204', '', '', 0),
(15, 'Dabuleni', 'Botosani', 'P-ta Horea', '3B', 'D', 'D', 9),
(16, 'Vlahita', 'Bihor', 'P-ta Henri Coanda', '5-3', '', '', 0),
(17, 'Mihailesti', 'Valcea', 'P-ta Decebal', '02', '', '', 0),
(18, 'Sebis', 'Bistrita Nasaud', 'Splaiul Albert Einstein', '0A', '', '', 0),
(19, 'Sacueni', 'Arad', 'P-ta Jiului', '552', '', '', 0),
(20, 'Curtici', 'Bistrita Nasaud', 'Splaiul Bradutului', '92', 'B', 'A', 4);
INSERT INTO `persoane` (`Email`, `Nume`, `Prenume`, `Telefon`, `Adresa`) VALUES
('alida.vintila@gmail.com', 'Dumitrescu', 'Ioanina', '0341886041', 1),
('aradna89@albu.com', 'Varga', 'Anton', '0775680886', 2),
('camil81@hotmail.com', 'Ciobanu', 'Teodor', '0775546436', 3),
('cristobal02@cucu.com', 'Moraru', 'Andra', '0774428340', 4),
('florian73@hotmail.com', 'Cristescu', 'Arina', '0366966080', 5),
('kpatrascu@pintea.biz', 'Lupu', 'Edmond', '0276025776', 6),
('marilena87@yahoo.com', 'Paraschiv', 'Tiberiu', '0735574447', 7),
('maxim.venera@panait.net', 'Bejan', 'Ioanina', '0721731100', 8),
('mircea.stanescu@tataru.org', 'Tudorache', 'Gina', '0723177754', 9),
('ocrisan@yahoo.com', 'Nica', 'Florea', '0365786980', 10),
('paulina.albu@mihai.biz', 'Pirvu', 'Razvan', '0331690160', 11),
('popovici.emanuel@marian.com', 'Vaduva', 'Daniela', '0346061196', 12),
('robertina90@david.com', 'Benone', 'Marian', '0352909460', 13),
('tignat@duta.com', 'Olteanu', 'Visarion', '0738677865', 14),
('toma.miron@gmail.com', 'Ionescu', 'Amanda', '0751479331', 15),
('traian09@hotmail.com', 'Tudorache', 'Andreea', '0716219863', 16),
('wvoinea@hotmail.com', 'Draghici', 'Maria', '0747859792', 17),
('xmarian@filip.com', 'Costin', 'Catrinel', '0256600263', 18),
('zpanait@martin.info', 'Tataru', 'Decebal', '0310946080', 19),
('zparaschiv@hotmail.com', 'Banica', 'Aurica', '0703804981', 20);
-- ----------------------------------------------
--
-- Table structure for table `abonati`
--
DROP TABLE IF EXISTS `abonati`;
CREATE TABLE IF NOT EXISTS `abonati` (
    `Cod_Client` int(11) NOT NULL UNIQUE,
    `Email` varchar(40) NOT NULL,
    PRIMARY KEY (`Cod_Client`),
    FOREIGN KEY (`Email`) REFERENCES `persoane` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
-- ----------------------------------------------
--
-- Table structure for table `pachetetv`
--
DROP TABLE IF EXISTS `pachetetv`;
CREATE TABLE IF NOT EXISTS `pachetetv` (
  `Denumire` varchar(80) NOT NULL UNIQUE,
  `Descriere` longtext,
  `Generic` varchar(30) NOT NULL,
  PRIMARY KEY (`Denumire`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
--
-- Dumping data for table `pachetetv`
--
INSERT INTO `pachetetv` (`Denumire`, `Descriere`, `Generic`) VALUES
('Basic', '', 'Generic'),
('Life Style', '', 'Mixt'),
('Look', '', 'Mixt'),
('Film+', '', 'Filme'),
('AXN', '', 'Filme'),
('FilmBox', '', 'Filme'),
('HBO GO', '', 'Filme'),
('Documentare+', '', 'Documentare'),
('Nat Geo', '', 'Documentare'),
('Discovery', '', 'Documentare');
-- ----------------------------------------------
--
-- Table structure for table `oferte`
--
DROP TABLE IF EXISTS `tipuri`;
CREATE TABLE IF NOT EXISTS `tipuri` (
  `Tip` varchar(40) NOT NULL,
  `Pachet` varchar(80) UNIQUE NOT NULL,
  `Valoare` float NOT NULL,
  PRIMARY KEY (`Tip`, `Pachet`),
  FOREIGN KEY (`Pachet`) REFERENCES `pachetetv` (`Denumire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `oferte`;
CREATE TABLE IF NOT EXISTS `oferte` (
  `Denumire` varchar(80) NOT NULL UNIQUE,
  `Descriere` longtext,
  `Tip` varchar(40) NOT NULL,
  `Pachet` varchar(80) NOT NULL,
  PRIMARY KEY (`Denumire`),
  FOREIGN KEY (`Tip`) REFERENCES `tipuri` (`Tip`),
  FOREIGN KEY (`Pachet`) REFERENCES `tipuri` (`Pachet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Dumping data for table `oferte`
--
INSERT INTO `tipuri` (`Tip`, `Valoare`, `Pachet`) VALUES
('Film', 24.3, 'Film+'),
('Film', 33.08, 'AXN'),
('Film', 21.35, 'HBO GO'),
('Film', 24.3, 'FilmBox'),
('Documentar', 38.26, 'Documentare+'),
('Documentar', 8.16, 'Nat Geo'),
('Documentar', 35.3, 'Discovery'),
('Mixt', 20.25, 'Life Style'),
('Mixt', 35.3, 'Look'),
('Generic', 5.28, 'Basic')
;
INSERT INTO `oferte` (`Denumire`, `Descriere`, `Tip`, `Pachet`) VALUES
('Filme 1', NULL, 'Film', 'Film+'),
('Documentar 1', NULL, 'Documentar', 'Documentare+'),
('Filme AXN', NULL, 'Film', 'AXN'),
('Geographic Channel', NULL, 'Documentar', 'Nat Geo'),
('Filme HBO', NULL, 'Film', 'HBO GO'),
('Descopera', NULL, 'Documentar', 'Discovery'),
('Stil de viata', NULL, 'Mixt', 'Life Style'),
('General', NULL, 'Generic', 'Basic'),
('Look', NULL, 'Mixt', 'Look'),
('Filme FilmBox', NULL, 'Film', 'Film+'),
('Filme 2', NULL, 'Film', 'AXN'),
('Filme 3', NULL, 'Film', 'FilmBox'),
('Filme 4', NULL, 'Film', 'HBO GO'),
('Documentar 2', NULL, 'Documentar', 'Nat Geo'),
('Documentar 3', NULL, 'Documentar', 'Discovery');
-- ----------------------------------
--
-- Table structure for table `abonamente`
--
DROP TABLE IF EXISTS `abonamente`;
CREATE TABLE IF NOT EXISTS `abonamente` (
    `ID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
    `Client` int(11) DEFAULT NULL,
    `Oferta` varchar(80) NOT NULL,
    PRIMARY KEY (`ID`),
    FOREIGN KEY (`Client`) REFERENCES `abonati` (`Cod_Client`),
    FOREIGN KEY (`Oferta`) REFERENCES `oferte` (`Denumire`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
--
-- Dumping data for table `abonamente`
--
INSERT INTO `abonamente` (`ID`, `Client`, `Oferta`) VALUES
(1, 30513, 'Geographic Channel'),
(2, 13951, 'Filme 1'),
(3, 82694, 'Filme HBO'),
(4, 20856, 'Geographic Channel'),
(5, 73921, 'Stil de viata'),
(6, 20856, 'Filme FilmBox'),
(7, 90846, 'Look'),
(8, 13951, 'Geographic Channel'),
(9, 99214, 'Filme AXN'),
(10, 49453, 'Descopera'),
(11, 83766, 'Filme HBO'),
(12, 90846, 'Documentar 1'),
(13, 59833, 'Filme FilmBox'),
(14, 29404, 'Geographic Channel'),
(15, 22161, 'Documentar 1'),
(16, 68389, 'Stil de viata'),
(17, 17227, 'Filme 1'),
(18, 29404, 'Look'),
(19, 59833, 'Filme AXN'),
(20, 29404, 'Geographic Channel'),
(21, 95461, 'Stil de viata'),
(22, 22161, 'Filme HBO'),
(23, 68389, 'Filme FilmBox'),
(24, 59833, 'Geographic Channel'),
(25, 95461, 'Filme 1'),
(26, 22161, 'Look'),
(27, 17227, 'Geographic Channel'),
(28, 68389, 'Filme FilmBox'),
(29, 23380, 'Stil de viata'),
(30, 17227, 'Filme HBO'),
(31, 54244, 'Filme AXN'),
(32, 29404, 'Geographic Channel'),
(33, 30513, 'Filme HBO'),
(34, 23380, 'Filme 1'),
(35, 17227, 'Stil de viata');
-- --------------------------------------------------------
--
-- Table structure for table `posturitv`
--
DROP TABLE IF EXISTS `posturitv`;
CREATE TABLE IF NOT EXISTS `posturitv` (
  `Numar` int(11) NOT NULL UNIQUE,
  `Denumire` varchar(60) NOT NULL UNIQUE,
  `Generic` varchar(30) NOT NULL,
  `PachetTV` varchar(80) NOT NULL,
  PRIMARY KEY (`Numar`),
  FOREIGN KEY (`PachetTV`) REFERENCES `pachetetv` (`Denumire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Dumping data for table `posturitv`
--
INSERT INTO `posturitv` (`Numar`, `Denumire`, `Generic`, `PachetTV`) VALUES
(1, 'TVR 1', 'Generic', 'Basic'),
(2, 'Pro TV', 'Generic', 'Basic'),
(3, 'Antena 1', 'Generic', 'Basic'),
(4, 'Antena Stars', 'Monden', 'Life Style'),
(5, 'Prima TV', 'Generic', 'Basic'),
(6, 'Kanal D', 'Generic', 'Basic'),
(7, 'Look Plus', 'Generic', 'Look'),
(8, 'Look Sport', 'Sport', 'Look'),
(9, 'Look Sport 2', 'Sport', 'Look'),
(10, 'TVR 2', 'Cultura', 'Basic'),
(11, 'National TV', 'Generic', 'Basic'),
(12, 'TVR 3', 'Cultura', 'Basic'),
(13, 'Neptun TV', 'Stiri', 'Basic'),
(14, 'National 24 Plus', 'Documentare', 'Basic'),
(15, 'Pro Gold', 'Monden', 'Life Style'),
(16, 'Pro 2', 'Seriale', 'Life Style'),
(17, 'FilmCafe', 'Filme', 'Film+'),
(20, 'FineLiving', 'Mixt', 'Life Style'),
(21, 'Fashion TV', 'Fashion', 'Life Style'),
(22, 'TLC', 'Mixt', 'Life Style'),
(23, 'TV Paprika', 'Cooking', 'Life Style'),
(24, 'Food TV', 'Cooking', 'Life Style'),
(26, 'Pro Cinema', 'Filme', 'Basic'),
(27, 'DIVA Universal', 'Seriale', 'Film+'),
(28, 'AXN', 'Filme', 'AXN'),
(29, 'AXN White', 'Filme', 'AXN'),
(30, 'AXN Black', 'Filme', 'AXN'),
(31, 'AMC', 'Filme', 'Basic'),
(32, 'TV 1000', 'Filme', 'Film+'),
(33, 'FilmBox', 'Filme', 'FilmBox'),
(34, 'Paramount TV', 'Filme', 'Film+'),
(36, 'AXN Spin', 'Filme', 'AXN'),
(40, 'HBO', 'Filme', 'HBO GO'),
(41, 'HBO 2', 'Filme', 'HBO GO'),
(42, 'HBO 3', 'Filme', 'HBO GO'),
(48, 'FilmBox Extra', 'Filme', 'FilmBox'),
(49, 'FilmBox Family', 'Filme', 'FilmBox'),
(50, 'FilmBox Plus', 'Filme', 'FilmBox'),
(51, 'FilmBox Premium', 'Filme', 'FilmBox'),
(52, 'HBO HD', 'Filme', 'HBO GO'),
(60, 'History', 'Documentare', 'Documentare+'),
(61, 'Nat Geo Wild', 'Documentare', 'Nat Geo'),
(62, 'National Geographic', 'Documentare', 'Nat Geo'),
(63, 'Discovery', 'Documentare', 'Discovery'),
(64, 'Investigation Discovery', 'Documentare', 'Discovery'),
(65, 'Discovery Science', 'Documentare', 'Discovery'),
(66, 'Animal Planet', 'Documentare', 'Documentare+'),
(67, 'Viasat History', 'Documentare', 'Documentare+'),
(68, 'Viasat', 'Documentare', 'Documentare+'),
(69, 'CBS Reality', 'Documentare', 'Documentare+');
-- --------------------------------------------------------
--
-- Table structure for table `emisiuni`
--
DROP TABLE IF EXISTS `emisiuni`;
CREATE TABLE IF NOT EXISTS `emisiuni` (
  `ID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
  `Denumire` varchar(80) UNIQUE NOT NULL,
  `Descriere` longtext,
  `Tip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
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
-- Table structure for table `programe`
--
DROP TABLE IF EXISTS `dati`;
CREATE TABLE IF NOT EXISTS `dati` (
    `ID` int NOT NULL UNIQUE AUTO_INCREMENT,
    `Zi` int NOT NULL,
    `Luna` int NOT NULL,
    `An` int NOT NULL,
    PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
DROP TABLE IF EXISTS `programe`;
CREATE TABLE IF NOT EXISTS `programe` (
  `ID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
  `Data` int NOT NULL,
  `Ora_Start` int(11) NOT NULL,
  `Minut_Start` int(11) NOT NULL,
  `Ora_Sfarsit` int(11) NOT NULL,
  `Minut_Sfarsit` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Data`) REFERENCES `dati`(`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
--
-- Dumping data for table `programe`
--
INSERT INTO `dati` (`ID`, `Zi`, `Luna`, `An`) VALUES
(1, 14, 1, 2020),
(2, 24, 2, 2020),
(3, 20, 12, 2020),
(4, 14, 10, 2020),
(5, 14, 9, 2020),
(6, 24, 9, 2020),
(7, 6, 2, 2020),
(8, 19, 1, 2020),
(9, 8, 3, 2020),
(10, 11, 3, 2020),
(11, 14, 2, 2020),
(12, 13, 1, 2020),
(13, 14, 4, 2020),
(14, 20, 4, 2020),
(15, 21, 12, 2020),
(16, 16, 4, 2020),
(17, 12, 1, 2020),
(18, 21, 1, 2020),
(19, 14, 5, 2020),
(20, 19, 5, 2020),
(21, 14, 7, 2020),
(22, 22, 6, 2020),
(23, 23, 8, 2020),
(24, 14, 6, 2020), 
(25, 22, 8, 2020);
INSERT INTO `programe` (`ID`, `Data`, `Ora_Start`, `Minut_Start`, `Ora_Sfarsit`, `Minut_Sfarsit`) VALUES
(1, 1, 10, 28, 12, 18),
(2, 2, 12, 30, 14, 10),
(3, 3, 13, 25, 14, 15),
(4, 4, 11, 27, 13, 20),
(5, 5, 16, 25, 18, 19),
(6, 6, 14, 35, 16, 27),
(7, 4, 12, 45, 13, 16),
(8, 7, 16, 29, 18, 24),
(9, 8, 18, 30, 20, 18),
(10, 9, 20, 35, 21, 37),
(11, 10, 21, 15, 22, 31),
(12, 8, 16, 29, 18, 42),
(13, 11, 19, 16, 21, 56),
(14, 12, 12, 4, 13, 17),
(15, 13, 14, 6, 16, 21),
(16, 14, 11, 15, 12, 22),
(17, 15, 9, 38, 10, 16),
(18, 16, 6, 27, 7, 19),
(19, 17, 8, 41, 9, 30),
(20, 18, 11, 25, 12, 45),
(21, 1, 7, 28, 9, 37),
(22, 19, 7, 25, 8, 45),
(23, 20, 9, 26, 11, 18),
(24, 20, 12, 25, 13, 29),
(25, 21, 15, 29, 16, 23),
(26, 21, 13, 25, 14, 17),
(27, 22, 17, 16, 19, 27),
(28, 23, 12, 12, 13, 14),
(29, 24, 19, 25, 21, 20),
(30, 25, 20, 14, 22, 24);
-- --------------------------------------------------------
--
-- Table structure for table `difuzari`
--
DROP TABLE IF EXISTS `difuzari`;
CREATE TABLE IF NOT EXISTS `difuzari` (
  `ID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
  `Emisiune` int(11) NOT NULL,
  `Post` int(11) NOT NULL,
  `Program` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Emisiune`) REFERENCES `emisiuni`(`ID`),
  FOREIGN KEY (`Post`) REFERENCES `posturitv`(`Numar`),
  FOREIGN KEY (`Program`) REFERENCES `programe`(`ID`)
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
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;