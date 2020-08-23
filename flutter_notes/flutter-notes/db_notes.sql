-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2020 at 06:07 AM
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
-- Database: `db_notes`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_notes`
--

CREATE TABLE `data_notes` (
  `id` int(12) NOT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_notes`
--

INSERT INTO `data_notes` (`id`, `title`, `description`) VALUES
(11, 'Belajar sambil bermain', 'Flutter with Firebase Udemy is a great place to work for you and your family and your family is very important to us and '),
(12, 'Coba 2', 'Aaaa');

-- --------------------------------------------------------

--
-- Table structure for table `login_flutter`
--

CREATE TABLE `login_flutter` (
  `id_login` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_flutter`
--

INSERT INTO `login_flutter` (`id_login`, `name`, `email`, `pass`) VALUES
(11, '', '', ''),
(9, 'flutter ', 'nugraha.sttb2@gmail.com', 'flutter'),
(12, 'flutter 3', 'nugraha.sttb3@gmail.com', 'flutter'),
(13, 'flutter 4', 'nugraha.sttb4@gmail.com', 'flutter'),
(14, 'flutter 5', 'nugraha.sttb5@gmail.com', 'flutter'),
(8, 'flutter 2', 'nugraha.sttb@gmail.com', 'flutter');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_notes`
--
ALTER TABLE `data_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_flutter`
--
ALTER TABLE `login_flutter`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `id_login` (`id_login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_notes`
--
ALTER TABLE `data_notes`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `login_flutter`
--
ALTER TABLE `login_flutter`
  MODIFY `id_login` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
