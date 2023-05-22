-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2023 at 05:05 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sales`
--

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

CREATE TABLE `cabang` (
  `id` int(11) NOT NULL,
  `id_perusahaan` int(11) DEFAULT NULL,
  `nama_cabang` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cabang`
--

INSERT INTO `cabang` (`id`, `id_perusahaan`, `nama_cabang`, `alamat`) VALUES
(1, 1, 'IRONFORG Workshop', 'Jalan Industri 11'),
(2, 2, 'LINKSPACE', 'Jalan Bimasakti 01');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `status` enum('Q&A','Ragu-Ragu','Un-Cover') DEFAULT NULL,
  `metode_ketemu` enum('Ketemu','Chat') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `sales_id`, `nama`, `no_telp`, `alamat`, `status`, `metode_ketemu`) VALUES
(1, 1, 'Rara', '08122233212', 'Jalan A 203', 'Q&A', 'Chat'),
(2, 2, 'Amanda', '08523125712', 'Jalan A 006', 'Ragu-Ragu', 'Chat'),
(3, 3, 'Agung', '083927581942', 'Jalan B 023', 'Un-Cover', 'Ketemu'),
(4, 4, 'Nerza', '08178642884', 'Jalan B 023', 'Un-Cover', 'Ketemu'),
(5, 5, 'Surya', '08184739831', 'Jalan A 013', 'Q&A', 'Ketemu'),
(6, 6, 'Arya', '08589123613', 'Jalan C 002', 'Q&A', 'Chat'),
(7, 7, 'Arya', '08186237492', 'Jalan C 102', 'Un-Cover', 'Chat'),
(8, 8, 'Lord', '08398742983', 'Jalan Z 004', 'Ragu-Ragu', 'Ketemu'),
(9, 3, 'Fuiyoo', '08334637281', 'Jalan D 024', 'Q&A', 'Ketemu'),
(10, 7, 'Sakti', '08185720033', 'Jalan H 054', 'Q&A', 'Chat');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `nip` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`nip`, `nama`, `alamat`) VALUES
(2301, 'Indra', 'Jalan Lilin 01'),
(2302, 'Arya', 'Jalan Kotak 04'),
(2303, 'Bima', 'Jalan Kotak 10'),
(2304, 'Caca', 'Jalan Lilin 02'),
(2305, 'Delta', 'Jalan Suara 06'),
(2306, 'Erik', 'Jalan Suara 02'),
(2307, 'Fery', 'Jalan Lilin 01'),
(2308, 'Putri', 'Jalan Lilin 03');

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE `perusahaan` (
  `id` int(11) NOT NULL,
  `nama_perusahaan` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`id`, `nama_perusahaan`, `alamat`) VALUES
(1, 'PT. Starlink tbk.', 'Jalan Andromeda 26'),
(2, 'PT. DustID tbk.', 'Jalan Everest 62');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id_sales` int(11) NOT NULL,
  `nip_krywn` int(11) DEFAULT NULL,
  `level` enum('1','2','3') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id_sales`, `nip_krywn`, `level`) VALUES
(1, 2301, '1'),
(2, 2302, '1'),
(3, 2303, '2'),
(4, 2304, '2'),
(5, 2305, '3'),
(6, 2306, '3'),
(7, 2307, '1'),
(8, 2308, '3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_perusahaan` (`id_perusahaan`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_id` (`sales_id`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id_sales`),
  ADD KEY `nip_krywn` (`nip_krywn`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cabang`
--
ALTER TABLE `cabang`
  ADD CONSTRAINT `cabang_ibfk_1` FOREIGN KEY (`id_perusahaan`) REFERENCES `perusahaan` (`id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id_sales`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`nip_krywn`) REFERENCES `karyawan` (`nip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
