-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2022 at 05:28 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `absensi`
--
CREATE DATABASE IF NOT EXISTS `absensi` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `absensi`;

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE IF NOT EXISTS `absensi` (
  `id_absen` int(11) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `waktu` time NOT NULL,
  `keterangan` enum('Masuk','Pulang') NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_absen`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id_absen`, `tgl`, `waktu`, `keterangan`, `id_user`) VALUES
(4, '2019-07-25', '07:21:53', 'Masuk', 6),
(5, '2019-07-26', '09:00:47', 'Masuk', 6),
(6, '2019-07-26', '16:01:03', 'Pulang', 6),
(7, '2019-07-25', '17:01:28', 'Pulang', 6),
(8, '2022-03-14', '13:56:44', 'Masuk', 15),
(9, '2022-03-14', '13:57:56', 'Pulang', 15),
(10, '2022-03-14', '13:58:52', 'Masuk', 7),
(11, '2022-03-14', '13:59:56', 'Pulang', 7),
(12, '2022-03-14', '14:26:00', 'Masuk', 7),
(13, '2022-03-14', '15:17:32', 'Masuk', 16),
(14, '2022-03-14', '15:18:31', 'Pulang', 16),
(15, '2022-03-14', '15:50:36', 'Masuk', 15),
(16, '2022-03-15', '08:28:01', 'Masuk', 15),
(17, '2022-03-15', '08:29:04', 'Pulang', 15),
(18, '2022-03-16', '13:37:02', 'Masuk', 16),
(19, '2022-03-25', '09:04:15', 'Masuk', 15),
(20, '2022-03-25', '09:05:55', 'Pulang', 15),
(21, '2022-03-25', '18:07:43', 'Masuk', 15),
(22, '2022-03-30', '08:27:10', 'Masuk', 15),
(23, '2022-03-30', '08:29:17', 'Masuk', 7),
(24, '2022-03-30', '08:30:18', 'Masuk', 16),
(25, '2022-04-12', '10:19:20', 'Masuk', 15),
(26, '2022-04-13', '09:47:02', 'Masuk', 15),
(27, '2022-04-13', '09:48:02', 'Pulang', 15);

-- --------------------------------------------------------

--
-- Table structure for table `catatan`
--

CREATE TABLE IF NOT EXISTS `catatan` (
  `id_catatan` smallint(3) NOT NULL AUTO_INCREMENT,
  `nama_catatan` varchar(50) NOT NULL,
  PRIMARY KEY (`id_catatan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE IF NOT EXISTS `divisi` (
  `id_divisi` smallint(3) NOT NULL AUTO_INCREMENT,
  `nama_divisi` varchar(50) NOT NULL,
  PRIMARY KEY (`id_divisi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`id_divisi`, `nama_divisi`) VALUES
(1, 'Lantai 1'),
(2, 'Lantai 2'),
(3, 'Lantai 3');

-- --------------------------------------------------------

--
-- Table structure for table `jam`
--

CREATE TABLE IF NOT EXISTS `jam` (
  `id_jam` tinyint(1) NOT NULL AUTO_INCREMENT,
  `start` time NOT NULL,
  `finish` time NOT NULL,
  `keterangan` enum('Masuk','Pulang') NOT NULL,
  PRIMARY KEY (`id_jam`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jam`
--

INSERT INTO `jam` (`id_jam`, `start`, `finish`, `keterangan`) VALUES
(1, '08:00:00', '08:15:00', 'Masuk'),
(2, '16:00:00', '16:15:00', 'Pulang');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id_user` smallint(5) NOT NULL AUTO_INCREMENT,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `foto` varchar(20) DEFAULT 'no-foto.png',
  `divisi` smallint(5) DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(60) NOT NULL,
  `level` enum('Manager','Karyawan') NOT NULL DEFAULT 'Karyawan',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nik`, `nama`, `telp`, `email`, `foto`, `divisi`, `username`, `password`, `level`) VALUES
(1, '', 'Darman, SE.MM', '0812-', 'darman@mail.com', '1647225886.png', NULL, 'darman', '$2y$10$HPwYZ44vFugDl7yMx9Knpe5ougEcZtL8vFRysugOe/uCjXKtk4fta', 'Manager'),
(7, '12345678', 'Herna Novrianti Doloksaribu', '081646368', 'nofri@mail.com', 'no-foto.png', NULL, 'nofri', '$2y$10$4ulCuQkwJE98EkMsBpr45e6sileseBel9Jdr7OY5SSUY12TYh6A0m', 'Karyawan'),
(8, '8931289124891', 'Manager 1', '', '', 'no-foto.png', NULL, 'manager_1', '$2y$10$XtMY01KEOd5I065s8Exs0OcQ373RvRNG1JznORr6TmmBNWnZ3vjjK', 'Manager'),
(9, '1231231238900', 'Manager 2', '', '', 'no-foto.png', NULL, 'manager_2', '$2y$10$iJWUOXDznGEmxo.bqnhtmeFL51jN5130LfDlKg8VROfoEmlgC.cFW', 'Manager'),
(10, '908121310291', 'Manager 3', '', '', 'no-foto.png', NULL, 'manager_3', '$2y$10$uGsLvgl.6ji2iZ7tWkNvPelTwZdLQ6QA81Yawa20wsLairCXqV8BO', 'Manager'),
(11, '123801204012', 'Manager 4', '', '', 'no-foto.png', NULL, 'master_4', '$2y$10$Kot81WNqrho4WlcYI13kT.Y5V2sMg1ZSAXcITrp8cj3dqHpbl4vrS', 'Manager'),
(15, '1810045506010005', 'Nurul', '0812-', 'nurul@gmail.com', 'no-foto.png', 2, 'nurul', '$2y$10$W5hy3KP1mKCC5LxX6n0I9OwXrPJED.Hd5csbAveakGLFOLp5oIo2.', 'Karyawan'),
(16, '123456789', 'clarissa Hastian', '0895-', 'clarissa@gmail.com', 'no-foto.png', 5, 'clarissa', '$2y$10$d9UBAf8PXQjI.Tz.iVnL6.7pFaKLdE3P7AeVHYrDmGyQxwR0XIEqq', 'Karyawan');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
