DROP DATABASE IF EXISTS GrilaTV;
CREATE DATABASE GrilaTV;
USE GrilaTV;

DROP TABLE IF EXISTS `Persoane`;
CREATE TABLE `Persoane` (
    `Email` VARCHAR(50) NOT NULL UNIQUE PRIMARY KEY,
    `Nume` VARCHAR(40) NOT NULL,
    `Prenume` VARCHAR(40) NOT NULL,
    `Strada` VARCHAR(50) NOT NULL,
    `Numar` INT NOT NULL,
    `Bloc` INT,
    `Scara` VARCHAR(3),
    `Apartament` INT,
    `Telefon` VARCHAR(10) UNIQUE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `Abonati` ;
CREATE TABLE `Abonati` (
    `Cod_Client` INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    `Email` VARCHAR(40) NOT NULL UNIQUE,
    `Abonamente` INT,
    `Factura` FLOAT,

    FOREIGN KEY (`Email`) REFERENCES `Persoane`(`Email`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `Oferte`;
CREATE TABLE `Oferte` (
    `ID` INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    `Denumire` VARCHAR(80) NOT NULL UNIQUE,
    `Descriere` LONGTEXT,
    `Tip` VARCHAR(40) NOT NULL,
    `Valoare` FLOAT NOT NULL,
    `Posturi` INT NOT NULL
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `Abonamente`;
CREATE TABLE `Abonamente` (
    `ID` INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    `Denumire` VARCHAR(80) NOT NULL UNIQUE,
    `Descriere` LONGTEXT,
    `Client` INT,
    `Oferta` INT NOT NULL,
    `Valoare` FLOAT NOT NULL,

    FOREIGN KEY (`Client`) REFERENCES `Abonati`(`Cod_Client`),
    FOREIGN KEY (`Oferta`) REFERENCES `Oferte`(`ID`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `PacheteTV`;
CREATE TABLE `PacheteTV` (
    `ID` INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    `Denumire` VARCHAR(80) NOT NULL UNIQUE,
    `Descriere` LONGTEXT,
    `Generic` VARCHAR(30) NOT NULL,
    `Asemanare` INT,
    
    FOREIGN KEY (`Asemanare`) REFERENCES `PacheteTV`(`ID`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `PosturiTV`;
CREATE TABLE `PosturiTV` (
    `Numar` INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    `Denumire` VARCHAR(60) NOT NULL UNIQUE,
    `Generic` VARCHAR(30) NOT NULL,
    `PachetTV` INT NOT NULL,

    FOREIGN KEY (`PachetTV`) REFERENCES `PacheteTV`(`ID`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `Emisiuni`;
CREATE TABLE `Emisiuni` (
    `ID` INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    `Denumire` VARCHAR(80) NOT NULL UNIQUE,
    `Descriere` LONGTEXT,
    `Tip` VARCHAR(50)

) ENGINE=InnoDB;

DROP TABLE IF EXISTS `Programe`;
CREATE TABLE `Programe` (
    `ID` INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    `Zi` INT NOT NULL,
    `Luna` VARCHAR(25) NOT NULL,
    `An` INT NOT NULL,
    `Ora_Start` INT NOT NULL,
    `Minut_Start` INT NOT NULL,
    `Ora_Sfarsit` INT NOT NULL,
    `Minut_Sfarsit` INT NOT NULL
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `Difuzari`;
CREATE TABLE `Difuzari` (
    `ID` INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    `Emisiune` INT NOT NULL,
    `Post` INT NOT NULL,
    `Program` INT NOT NULL,

    FOREIGN KEY (`Emisiune`) REFERENCES `Emisiuni`(`ID`),
    FOREIGN KEY (`Post`) REFERENCES `PosturiTV`(`Numar`),
    FOREIGN KEY (`Program`) REFERENCES `Programe`(`ID`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `Opinii`;
CREATE TABLE `Opinii` (
    `ID` INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    `PachetTV` INT NOT NULL,
    `Titlu` VARCHAR(60) NOT NULL UNIQUE,
    `Comentariu` MEDIUMTEXT,
    `Rating` INT NOT NULL,
    `Abonat` INT,

    FOREIGN KEY (`PachetTV`) REFERENCES `PacheteTV`(`ID`),
    FOREIGN KEY (`Abonat`) REFERENCES `Abonati`(`Cod_Client`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `Recomandari`;
CREATE TABLE `Recomandari` (
    `ID` INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    `Abonat` INT NOT NULL,
    `PachetTV` INT,
    `Opinie` INT NOT NULL UNIQUE,

    FOREIGN KEY (`Abonat`) REFERENCES `Abonati`(`Cod_Client`),
    FOREIGN KEY (`PachetTV`) REFERENCES `PacheteTV`(`ID`),
    FOREIGN KEY (`Opinie`) REFERENCES `Opinii`(`ID`)
) ENGINE=InnoDB;