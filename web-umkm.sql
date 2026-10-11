-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Okt 2026 pada 11.48
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web-umkm`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nama_menu` varchar(150) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `nama_menu`, `harga`) VALUES
(1, 'Kacang', 25000),
(2, 'Coklat', 25000),
(3, 'Oreo', 25000),
(4, 'Milo', 25000),
(5, 'Durian', 28000),
(6, 'Vanilla', 28000),
(7, 'Keju', 28000),
(8, 'Greentea', 28000),
(9, 'Coklat Kacang', 30000),
(10, 'Coklat Oreo', 30000),
(11, 'Coklat Milo', 30000),
(12, 'Coklat Durian', 30000),
(13, 'Coklat Vanilla', 30000),
(14, 'Coklat Keju', 30000),
(15, 'Coklat Greentea', 30000),
(16, 'Special Daging', 20000),
(17, 'Special Daging + Jamur', 25000),
(18, 'Special Daging + Sosis', 25000),
(19, 'Special Daging + Kornet', 25000),
(20, 'Istimewa Daging', 30000),
(21, 'Istimewa Daging + Jamur', 35000),
(22, 'Istimewa Daging + Sosis', 35000),
(23, 'Istimewa Daging + Kornet', 35000),
(24, 'Istimewa Daging + Jamur Sosis', 40000),
(25, 'Istimewa Daging + Jamur Kornet', 40000),
(26, 'Super Daging', 40000),
(27, 'Super Daging + Jamur', 45000),
(28, 'Super Daging + Sosis', 45000),
(29, 'Super Daging + Kornet', 45000),
(30, 'Super Daging + Jamur Sosis', 50000),
(31, 'Super Daging + Jamur Kornet', 50000),
(32, 'Jumbo Daging', 50000),
(33, 'Jumbo Daging + Jamur', 55000),
(34, 'Jumbo Daging + Sosis', 55000),
(35, 'Jumbo Daging + Kornet', 55000),
(36, 'Jumbo Daging + Jamur Sosis', 60000),
(37, 'Jumbo Daging + Jamur Kornet', 60000),
(38, 'Choco Maltine', 33000),
(39, 'Silverqueen', 38000),
(40, 'Durian Oreo', 30000),
(41, 'Durian Milo', 30000),
(42, 'Durian Keju', 30000),
(43, 'Durian Coklat Kacang', 33000),
(44, 'Durian Keju Coklat', 33000),
(45, 'Durian Keju Oreo', 33000),
(46, 'Durian Keju Kacang', 33000),
(47, 'Greentea Kacang', 30000),
(48, 'Greentea Milo', 30000),
(49, 'Greentea Coklat Kacang', 33000),
(50, 'Greentea Keju Coklat', 33000),
(51, 'Greentea Keju Oreo', 33000),
(52, 'Greentea Keju Kacang', 33000),
(53, 'Oreo Milo', 30000),
(54, 'Keju Kacang', 30000),
(55, 'Keju Milo', 30000),
(56, 'Keju Oreo', 30000),
(57, 'Keju Greentea', 30000),
(58, 'Keju Coklat Milo', 33000),
(59, 'Keju Kacang Coklat', 33000),
(60, 'Keju Oreo Milo', 33000),
(61, 'Keju Coklat Oreo', 33000),
(62, 'Vanilla Keju', 30000),
(63, 'Vanilla Coklat', 30000),
(64, 'Vanilla Milo', 30000),
(65, 'Vanilla Oreo', 30000),
(66, 'Vanilla Coklat Kacang', 33000),
(67, 'Vanilla Coklat Oreo', 33000),
(68, 'Vanilla Keju Coklat', 33000),
(69, 'Vanilla Keju Oreo', 33000),
(70, 'Vanilla Keju Kacang', 33000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `status` varchar(30) DEFAULT 'Diproses',
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama`, `total`, `status`, `tanggal`) VALUES
(10, 'sisi imot', 30000, 'Selesai', '2026-10-07 16:04:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `pelanggan_id` int(11) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `pelanggan_id`, `nama_menu`, `harga`, `jumlah`, `subtotal`) VALUES
(11, 10, 'Kacang - Brownies', 30000, 1, 30000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_menu` (`nama_menu`),
  ADD UNIQUE KEY `unique_nama_menu` (`nama_menu`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelanggan_id` (`pelanggan_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
