-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2025 at 03:45 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `poli` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `poli`) VALUES
(1, 'Dr. Salsa', 'Poli Umum'),
(2, 'Dr. Budi', 'Poli Gigi'),
(4, 'Dr. Endang', 'Poli Kejiwaan'),
(5, 'Dr. Pratama', 'Poli Kecantikan'),
(6, 'Dr. Arsyad', 'Spesialis Penyakit Dalam');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `poli` varchar(100) DEFAULT NULL,
  `dokter` varchar(100) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` enum('menunggu','diterima','ditolak') DEFAULT 'menunggu',
  `tgl_lahir` date DEFAULT NULL,
  `alamat` text,
  `telepon` varchar(20) DEFAULT NULL,
  `keluhan` text,
  `jam` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pendaftaran`
--

INSERT INTO `pendaftaran` (`id`, `user_id`, `nama`, `poli`, `dokter`, `tanggal`, `status`, `tgl_lahir`, `alamat`, `telepon`, `keluhan`, `jam`) VALUES
(8, 2, 'Destiana', 'Poli Umum', 'Dr. Salsa', '2025-06-21', 'diterima', '2000-06-19', 'tangerang 1', '1234567855', 'pusing', '13:50:00'),
(9, 3, 'Endi', 'Poli Gigi', 'Dr. Budi', '2025-06-09', 'ditolak', '2003-09-09', 'Pasar kemis', '1234567890', 'gigi berlubang', '16:11:00'),
(11, 1, 'Lia', 'Poli Anak', 'Dr. Lestari', '2025-06-13', 'menunggu', '2020-12-04', 'Pasar Anyar', '1234567855', 'Demam, pilek, pusing', '19:00:00'),
(12, 16, 'endiafrian', 'Poli Umum', 'Dr. Salsa', '2025-06-17', 'diterima', '2005-04-17', 'pasarkemis tangerang', '08829006677', 'pusing tak de money', '16:30:00'),
(13, 17, 'Wiartono', 'Poli Kejiwaan', 'Dr. Endang', '2025-06-19', 'menunggu', '2000-01-29', 'Gading Serpong', '088986865775', 'Derpesii', '12:40:00'),
(14, 18, 'Mujiati', 'Poli Kecantikan', 'Dr. Pratama', '2025-06-21', 'diterima', '1990-08-18', 'Bsd City', '08653214689', 'Kulit Kusam', '14:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `role` enum('admin','pasien') NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama`, `role`, `created_at`) VALUES
(4, 'admin', '$2y$10$fco5zgoMP3GbzFNvKmln9uOVzgjAhugRbs8dw1DEZcuRjd6EJ4Y.y', 'Admin', 'admin', '2025-06-07 01:41:39'),
(16, 'endiaf', '$2y$10$sgKv4A/hszkbWVuiP/Mz/OWhCSSz5A21.5hHKNkfn2O1JVy8BuX7y', 'endiafrian', 'pasien', '2025-06-17 08:28:56'),
(17, 'wirtono', '$2y$10$eXYq5YBq5/tDB69n2jPl2..MBMJvzESLQWMs4B8PNf.o1SoR9B8p2', 'Wiartono', 'pasien', '2025-06-17 08:36:43'),
(18, 'mujia', '$2y$10$pRuzPE6y1PsZPyW3bz5tnuNFUxczhxzrTweKsIlPhlHSoe392Nz6W', 'Mujiati', 'pasien', '2025-06-17 08:41:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
