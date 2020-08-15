-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2020 at 07:14 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kamus`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_kamus`
--

CREATE TABLE `tb_kamus` (
  `kata` varchar(100) NOT NULL,
  `terjemahan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kamus`
--

INSERT INTO `tb_kamus` (`kata`, `terjemahan`) VALUES
('Ambil', 'Candak (halus), bawa (sedang), cokot (kasar)'),
('Apa', 'Kulan (halus), naon (kasar)'),
('Dimana', 'Palih mana (halus), di mana (sedang)'),
('Istri', 'Bojo (halus), istri (sedang), pamajikan (kasar)'),
('Makan', 'Tuang (halus), Neda (sedang), dahar (kasar)'),
('Masuk', 'Lebet (halus), asup (kasar)'),
('Meninggal', 'Ngantunkeun (halus), pupus (sedang). modar (kasar)'),
('Pergi', 'Angkat (lemes), mios (sedang), indit (kasar)'),
('Sampai', 'Sumping (halus), Dongkap (sedang), datang (kasar)'),
('Tahu', 'Terang (halus), apal (sedang), nyaho (kasar)'),
('Tidak tahu', 'Duka (halus), teuing (sedang), teu nyaho (kasar)');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_kamus`
--
ALTER TABLE `tb_kamus`
  ADD PRIMARY KEY (`kata`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
