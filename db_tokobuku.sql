-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2021 at 04:02 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tokobuku`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `kode` char(7) DEFAULT NULL,
  `judul` varchar(50) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `stok` smallint(6) DEFAULT NULL,
  `penerbit` varchar(30) DEFAULT NULL,
  `harga_beli` double DEFAULT NULL,
  `harga_jual` double DEFAULT NULL,
  `id_penulis` int(11) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `kode`, `judul`, `tahun`, `stok`, `penerbit`, `harga_beli`, `harga_jual`, `id_penulis`, `id_kategori`) VALUES
(1, 'BAHJEU', 'Konseling di Sekolah', 2020, 200, 'Mediainti Grup', 49000, 52000, 1, 1),
(2, 'SGGGDY', 'Psikologi Tubuh', 2018, 340, 'Mediainti Grup', 65000, 72000, 1, 1),
(3, 'DGSFFD', 'Detektif Conan 96', 2019, 500, 'Jiwamedia Publisher', 30000, 37000, 2, 2),
(4, 'IWYYRU', 'Bono-chan 02', 2020, 200, 'Arsidati Media', 45000, 52000, 3, 2),
(6, 'UDHYF', 'Psikologi Gerakan', 2020, 200, 'Graha Pustaka', 60000, 69000, 3, 1),
(15, 'HHDUS', 'IPA Terpadu Kelas XI', 2018, 200, 'Media Peduli', 30000, 50000, 2, 4),
(17, 'OIDUY', 'Pemrograman PHP Dasar', 2020, 220, 'Elixir Media Comp.', 84000, 90000, 2, 5),
(18, 'HUDIE', 'Belajar Pemrograman Java', 2020, 220, 'Mulia Indah Publisher', 67000, 77000, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(40) DEFAULT NULL,
  `kode_rak` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `kode_rak`) VALUES
(1, 'Psikologi', 'Lt.1/1'),
(2, 'Komik', 'Lt.1/2'),
(4, 'Sains', 'Lt.2/1'),
(5, 'Komputer & Teknologi', 'Lt.2/2'),
(6, 'Sejarah', 'Lt.2/4'),
(7, 'Ilmu Sosial', 'Lt.3/04'),
(8, 'Astronomi', 'Lt.02/07');

-- --------------------------------------------------------

--
-- Table structure for table `penulis`
--

CREATE TABLE `penulis` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penulis`
--

INSERT INTO `penulis` (`id`, `nama`, `gender`, `alamat`, `no_telp`) VALUES
(1, 'Dede Rahmat', 'L', 'Sleman, Yogyakarta', '0822857647567'),
(2, 'Farhan Husein', 'L', 'Semarang, Jawa Tengah', '0274657764664'),
(3, 'Feri Jamil', 'L', 'Jakarta Barat', '0836477566477'),
(4, 'Yosia Ramadani', 'P', 'Serang, Banten', '0824774667875'),
(5, 'Tuti Rahmawati', 'P', 'Bekasi, Jawa Barat', '0827366647756'),
(6, 'Bagus Trianurdin', 'P', 'Indramayum, Jawa Barat', '0822785764775'),
(7, 'Aji Pratama', 'P', 'Sragen, Jawa Tengah', '08347563774');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_penulis` (`id_penulis`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penulis`
--
ALTER TABLE `penulis`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `penulis`
--
ALTER TABLE `penulis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_penulis`) REFERENCES `penulis` (`id`),
  ADD CONSTRAINT `buku_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
