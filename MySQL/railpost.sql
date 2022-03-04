-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql.omicsuab.org
-- Generation Time: Mar 04, 2022 at 03:09 AM
-- Server version: 8.0.28-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `legolactics_cargoconnect`
--
CREATE DATABASE IF NOT EXISTS `legolactics_cargoconnect` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `legolactics_cargoconnect`;

-- --------------------------------------------------------

--
-- Table structure for table `paquets`
--

CREATE TABLE `paquets` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `pes` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `volum` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `cost` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `origen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `destinacio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `data_enviament` datetime NOT NULL,
  `data_recepcio` datetime NOT NULL,
  `estat` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tipus` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paquets`
--

INSERT INTO `paquets` (`id`, `pes`, `volum`, `cost`, `origen`, `destinacio`, `data_enviament`, `data_recepcio`, `estat`, `tipus`) VALUES
('hXYMg6vcZr', '45', '24', '4.68', 'Llinars del Vallès', 'Granollers', '2022-01-04 02:20:55', '2022-02-26 03:43:57', '2', 'local'),
('T4kGDcXEcp', '67', '49', '9.94', 'Llinars del Vallès', 'Sant Celoni', '2022-01-05 07:15:59', '2022-02-24 11:27:45', '5', 'local'),
('th4eD3uuOL', '128', '62', '4.99', 'Llinars del Vallès', 'Cardedeu', '2022-02-03 10:41:13', '2022-03-03 01:49:48', 'Recollit', 'local'),
('vJif02DQb', '349', '89', '8.92', 'Llinars del Vallès', 'Barcelona', '2022-02-17 09:29:21', '0000-00-00 00:00:00', '1', 'local'),
('KDYLdyLylo', '22', '56', '7.11', 'Llinars del Vallès', 'Granollers', '2022-02-25 09:11:21', '0000-00-00 00:00:00', 'En trànsit', 'local'),
('qXv3vb6D7M', '253', '56', '6.56', 'Llinars del Vallès', 'Barcelona', '2022-02-25 10:01:56', '0000-00-00 00:00:00', 'En trànsit', 'local'),
('NaMilTfvdd', '286', '48', '15.32', 'Llinars del Vallès', 'Cardedeu', '2022-02-26 01:42:51', '0000-00-00 00:00:00', 'En trànsit', 'local'),
('GF3SzoTYJ8', '134', '72', '17.08', '', 'Granollers', '2022-02-26 03:39:27', '0000-00-00 00:00:00', 'En trànsit', 'local'),
('aDvdZe42DS', '0', '0', '0', '', 'Granollers', '2022-02-26 03:54:41', '0000-00-00 00:00:00', 'En trànsit', 'local'),
('mNKB72fTZ', '0', '80', '16', 'Llinars del Vallès', 'Granollers', '2022-03-03 01:29:22', '0000-00-00 00:00:00', 'En trànsit', 'local'),
('ZzM1fE7C3X', '0', '30', '6', 'Llinars del Vallès', 'Granollers', '2022-03-03 01:58:50', '0000-00-00 00:00:00', 'En trànsit', 'local');

-- --------------------------------------------------------

--
-- Table structure for table `usuaris`
--

CREATE TABLE `usuaris` (
  `telefon` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `correu_e` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `contrasenya` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nom` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuaris`
--

INSERT INTO `usuaris` (`telefon`, `correu_e`, `contrasenya`, `nom`) VALUES
('649427334 ', 'sonia.casillas.viladerrams@gmail.com ', 'hola', 'Sònia '),
('644634430', 'roger.villaret@gmail.com', 'tesla', 'Roger'),
('637896717', 'danirenau98@gmail.com', '2222', 'Dani'),
('722206449', 'noravanandel@gmail.com', 'nora', 'Nora'),
('000000000', 'info@railpost.com', 'granollers', 'RailPost Granollers');

-- --------------------------------------------------------

--
-- Table structure for table `usuaris_paquets`
--

CREATE TABLE `usuaris_paquets` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `emisor` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `receptor` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuaris_paquets`
--

INSERT INTO `usuaris_paquets` (`id`, `emisor`, `receptor`) VALUES
('hXYMg6vcZr', '649427334', '606369326'),
('T4kGDcXEcp', '649427334', '699159314'),
('th4eD3uuOL', '649427334', '699159314'),
('vJif02DQb', '649427334', '696000708'),
('KDYLdyLylo', '649427334', '637896717'),
('qXv3vb6D7M', '649427334', '722206449'),
('NaMilTfvdd', '649427334', '699159314'),
('GF3SzoTYJ8', '649427334', '691534980'),
('aDvdZe42DS', '649427334', '696000708'),
('mNKB72fTZ', '722206449', '644634430'),
('ZzM1fE7C3X', '649427334', '644634430');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
