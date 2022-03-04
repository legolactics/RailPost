-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: myhost
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

-- --------------------------------------------------------

--
-- Table structure for table `usuaris_paquets`
--

CREATE TABLE `usuaris_paquets` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `emisor` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `receptor` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
