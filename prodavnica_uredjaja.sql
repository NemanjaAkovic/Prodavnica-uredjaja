-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2023 at 08:07 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prodavnica_uredjaja`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategorija_proizvoda`
--

CREATE TABLE `kategorija_proizvoda` (
  `ID` decimal(10,0) NOT NULL,
  `Naziv` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategorija_proizvoda`
--

INSERT INTO `kategorija_proizvoda` (`ID`, `Naziv`) VALUES
('1', 'Mobilni telefoni'),
('2', 'PC i laptop racunari'),
('3', 'Pametni satovi');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `ID` int(11) NOT NULL,
  `Ime_i_prezime` varchar(30) NOT NULL,
  `Adresa` varchar(30) NOT NULL,
  `Broj_telefona` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `porudzbina`
--

CREATE TABLE `porudzbina` (
  `ID` int(11) NOT NULL,
  `Datum_i_vrijeme` varchar(20) DEFAULT NULL,
  `ID_korisnika` int(11) NOT NULL,
  `ID_uredjaja` decimal(10,0) NOT NULL,
  `Nacin_placanja` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uredjaji`
--

CREATE TABLE `uredjaji` (
  `ID` decimal(10,0) NOT NULL,
  `Marka` varchar(10) NOT NULL,
  `Model` varchar(20) NOT NULL,
  `Cijena` decimal(6,2) NOT NULL,
  `Kategorija_id` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uredjaji`
--

INSERT INTO `uredjaji` (`ID`, `Marka`, `Model`, `Cijena`, `Kategorija_id`) VALUES
('1', 'iPhone', '13 Pro', '1150.00', '1'),
('2', 'Samsung', 'Galaxy Z Fold3', '1180.00', '1'),
('3', 'Realme', 'C11', '100.00', '1'),
('4', 'Xiaomi', 'Mi 10T Pro', '449.00', '1'),
('5', 'Infinix', 'Smart 5', '109.00', '1'),
('6', 'Oppo', 'A15S', '150.00', '1'),
('7', 'Samsung', 'Galaxy A13', '165.00', '1'),
('8', 'ZTE', 'Blade V30', '184.00', '1'),
('9', 'Pin Pin', 'Net1/122Q1', '192.40', '2'),
('10', 'MC Base', 'Business Celeron', '239.00', '2'),
('11', 'Ewe', 'RAC20861', '266.20', '2'),
('12', 'CT Compute', 'WBP 10100/1/250 11P', '565.70', '2'),
('13', 'Lenovo', '82H8000YWYA', '319.40', '2'),
('14', 'Asus', 'X515EA-BQ311', '539.10', '2'),
('15', 'IdeaPad', 'GAMING3', '829.80', '2'),
('16', 'Macbook', 'Pro 13.3 Apple', '1570.35', '2'),
('17', 'Apple', 'Series 7', '430.00', '3'),
('18', 'Huawei', 'G2 Pro', '180.00', '3'),
('19', 'M40', 'Call sport', '78.94', '3'),
('20', 'Xiaomi', 'Mi', '116.67', '3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategorija_proizvoda`
--
ALTER TABLE `kategorija_proizvoda`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `porudzbina`
--
ALTER TABLE `porudzbina`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_korisnika` (`ID_korisnika`),
  ADD KEY `ID_uredjaja` (`ID_uredjaja`);

--
-- Indexes for table `uredjaji`
--
ALTER TABLE `uredjaji`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Kategorija_id` (`Kategorija_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `porudzbina`
--
ALTER TABLE `porudzbina`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `porudzbina`
--
ALTER TABLE `porudzbina`
  ADD CONSTRAINT `porudzbina_ibfk_1` FOREIGN KEY (`ID_korisnika`) REFERENCES `korisnik` (`ID`),
  ADD CONSTRAINT `porudzbina_ibfk_2` FOREIGN KEY (`ID_uredjaja`) REFERENCES `uredjaji` (`ID`);

--
-- Constraints for table `uredjaji`
--
ALTER TABLE `uredjaji`
  ADD CONSTRAINT `uredjaji_ibfk_1` FOREIGN KEY (`Kategorija_id`) REFERENCES `kategorija_proizvoda` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
