-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Jul 2024 pada 16.00
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventaris_barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `jenis_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barangkeluar`
--

CREATE TABLE `barangkeluar` (
  `perangkat_daerah` varchar(255) NOT NULL,
  `id_transaksi_keluar` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jenis_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `jml_barang` int(11) NOT NULL,
  `harga_barang` int(11) NOT NULL,
  `untuk` varchar(255) NOT NULL,
  `ket` varchar(255) NOT NULL,
  `Tanggal` date NOT NULL,
  `total_harga_keluar` int(11) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `kode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `barangkeluar`
--

INSERT INTO `barangkeluar` (`perangkat_daerah`, `id_transaksi_keluar`, `id_barang`, `jenis_barang`, `nama_barang`, `jml_barang`, `harga_barang`, `untuk`, `ket`, `Tanggal`, `total_harga_keluar`, `satuan`, `created_at`, `updated_at`, `created_by`, `kode`) VALUES
('KECAMATAN ASTANAANYAR', 20001, 10001, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Pelampung 3/4 Kuningan', 1, 85000, '-', '-', '2023-01-02', 85000, 'Pcs', '2024-06-25 18:33:07', '2024-07-09 13:20:40', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20002, 10002, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Paku 5cm', 2, 10000, '-', '-', '2023-02-14', 20000, 'Kg', '2024-06-25 18:36:18', '2024-06-25 18:36:18', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20003, 10003, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Paku 7cm', 2, 10000, '-', '-', '2023-02-14', 20000, 'Kg', '2024-06-25 18:37:47', '2024-06-25 18:37:47', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20004, 10004, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Talang Air Pvc 4\"', 2, 75000, '-', '-', '2023-02-14', 150000, 'Pcs', '2024-06-25 18:39:04', '2024-06-25 18:39:04', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20005, 10005, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Tutup Talang Pvc 4\"', 4, 5000, '-', '-', '2023-02-14', 20000, 'Pcs', '2024-06-25 18:40:07', '2024-06-25 18:40:07', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20006, 10006, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Corong Talang Pvc 4\"', 2, 7500, '-', '-', '2023-02-14', 15000, 'Pcs', '2024-06-25 18:41:16', '2024-06-25 18:41:16', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20007, 10007, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Ram Kawat Hijau 1.5 cm', 1, 125000, '-', '-', '2023-02-14', 125000, 'Roll', '2024-06-25 18:42:16', '2024-06-25 18:42:16', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20008, 10008, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Amplas Kain 4\"', 1, 270000, '-', '-', '2023-02-14', 270000, 'Roll', '2024-06-25 18:43:14', '2024-06-25 18:43:14', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20009, 10009, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Pylox', 1, 60000, '-', '-', '2023-02-14', 60000, 'Pcs', '2024-06-25 18:44:03', '2024-06-25 18:44:03', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20010, 10010, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Handle', 1, 39000, '-', '-', '2023-02-14', 39000, 'Pcs', '2024-06-25 18:45:20', '2024-06-25 18:45:20', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20011, 10011, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Linggis Besar', 5, 41100, '-', '-', '2023-02-15', 205500, 'Pcs', '2024-06-25 18:46:34', '2024-06-25 18:46:34', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20012, 10012, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Fleksibel 30cm', 1, 25000, '-', '-', '2023-04-10', 25000, 'Pcs', '2024-06-25 18:47:44', '2024-06-25 18:47:44', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20013, 10013, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Kran Wastapel DNDA', 1, 100000, '-', '-', '2023-04-10', 100000, 'Pcs', '2024-06-25 18:48:37', '2024-06-25 18:48:37', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20014, 10014, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Aquaproof', 1, 60000, '-', '-', '2023-05-15', 60000, 'Kg', '2024-06-25 18:50:21', '2024-06-25 18:50:21', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20015, 10015, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Kuas 3\"', 2, 7000, '-', '-', '2023-05-15', 14000, 'Pcs', '2024-06-25 18:51:24', '2024-06-25 18:51:24', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20016, 10016, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Selup', 1, 7500, '-', '-', '2023-05-15', 7500, 'Pcs', '2024-06-25 18:52:20', '2024-06-25 18:52:20', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20017, 10017, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Kunci Inggris', 1, 40000, '-', '-', '2023-05-15', 40000, 'Pcs', '2024-06-25 18:53:17', '2024-06-25 18:53:17', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20018, 10018, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Siku Lubang 4x4', 4, 45000, '-', '-', '2023-05-22', 180000, 'Batang', '2024-06-25 18:54:32', '2024-06-25 18:54:32', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20019, 10019, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'multi 9mm', 1, 120000, '-', '-', '2023-05-22', 120000, 'Lembar', '2024-06-25 18:55:28', '2024-06-25 18:55:28', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20020, 10020, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Besi Siku Lubang', 6, 100000, '-', '-', '2023-05-22', 600000, 'Pcs', '2024-06-25 18:56:29', '2024-06-25 18:56:29', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20021, 10021, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Baud Siku Lubang', 100, 1000, '-', '-', '2023-05-22', 100000, 'Pcs', '2024-06-25 18:57:17', '2024-06-25 18:57:17', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20022, 10022, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Siku Plat Besi Lubang', 16, 2500, '-', '-', '2023-05-22', 40000, 'Pcs', '2024-06-25 18:58:18', '2024-06-25 18:58:18', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20023, 10023, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Karet Besi Siku Lubang', 8, 2500, '-', '-', '2023-05-22', 20000, 'Pcs', '2024-06-25 18:59:08', '2024-06-25 19:02:25', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20024, 10024, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Batu WD', 2, 5000, '-', '-', '2023-05-22', 10000, 'Pcs', '2024-06-25 19:00:05', '2024-06-25 19:03:00', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20025, 10020, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Besi Siku Lubang', 6, 100000, '-', '-', '2023-05-22', 600000, 'Lembar', '2024-06-25 19:00:55', '2024-06-25 19:03:53', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20026, 10025, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Triplek 9mm', 2, 120000, '-', '-', '2023-05-22', 240000, 'Lembar', '2024-06-25 19:04:50', '2024-06-25 19:04:50', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20027, 10026, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Jasa Pembuatan Rak', 1, 300000, '-', '-', '2023-05-22', 300000, 'Set', '2024-06-25 19:05:43', '2024-06-25 19:05:43', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20028, 10027, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Paralon  1/2 Rucika', 2, 23000, '-', '-', '2023-06-16', 46000, 'Batang', '2024-06-25 19:06:37', '2024-06-25 19:06:37', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20029, 10028, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Koni 1/2', 6, 3000, '-', '-', '2023-06-16', 18000, 'Pcs', '2024-06-25 19:07:33', '2024-06-25 19:07:33', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20030, 10029, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Kleman', 1, 10000, '-', '-', '2023-06-16', 10000, 'Bungkus', '2024-06-25 19:08:35', '2024-06-25 19:08:35', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20031, 10030, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Lem Paralon', 1, 15000, '-', '-', '2023-06-16', 15000, 'Pcs', '2024-06-25 19:09:31', '2024-06-25 19:09:31', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20032, 10031, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Body Ses 30mm +Handle', 1, 250000, '-', '-', '2023-06-20', 250000, 'Set', '2024-06-25 19:10:28', '2024-06-25 19:10:28', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20033, 10032, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'HDL Top Grande', 1, 60000, '-', '-', '2023-06-12', 60000, 'Pcs', '2024-06-25 19:11:18', '2024-06-25 19:11:18', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20034, 10037, 'Belanja Bahan-Bahan Kimia', 'Kompos Daun', 10, 29400, '-', '-', '2023-02-28', 294000, 'Buah', '2024-06-25 19:13:40', '2024-06-25 19:13:40', 'pengelola@gmail.com', '5.1.02.01.01.0002'),
('KECAMATAN ASTANAANYAR', 20035, 10038, 'Belanja Bahan-Bahan Kimia', 'Pupuk Kandang', 25, 75000, '-', '-', '2023-02-28', 1875000, 'Karung', '2024-06-25 19:15:12', '2024-06-25 19:16:51', 'pengelola@gmail.com', '5.1.02.01.01.0002'),
('KECAMATAN ASTANAANYAR', 20036, 10039, 'Belanja Bahan-Bahan Kimia', 'Pupuk NPK', 1, 632500, '-', '-', '2023-02-28', 632500, 'Kg', '2024-06-25 19:16:11', '2024-06-25 19:16:11', 'pengelola@gmail.com', '5.1.02.01.01.0002'),
('KECAMATAN ASTANAANYAR', 20037, 10040, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [202 Liter x 2 Unit x3 Bulan]', 35, 13900, 'ASN se-Kecamatan', '-', '2023-01-02', 486500, 'Liter', '2024-06-25 19:21:40', '2024-06-25 19:22:43', 'pengelola@gmail.com', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 20038, 10041, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [33.5 Liter x 20 Unit x3 Bulan]', 124, 13900, 'ASN se-Kecamatan', '-', '2023-01-02', 1720900, 'Liter', '2024-06-25 19:24:04', '2024-06-25 19:24:04', 'pengelola@gmail.com', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 20039, 10042, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamina Dex [195 Literx 1 Unit x3 Bulan]', 600, 16750, 'ASN se-Kecamatan', '-', '2023-03-20', 10050000, 'Liter', '2024-06-25 19:25:33', '2024-06-25 19:25:33', 'pengelola@gmail.com', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 20040, 10043, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [225 Liter x 2Unit x3 Bulan]', 1200, 12800, 'ASN se-Kecamatan', '-', '2023-03-20', 15360000, 'Liter', '2024-06-25 19:26:36', '2024-06-25 19:26:36', 'pengelola@gmail.com', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 20041, 10044, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [37.5 Liter x 20Unit x 3 Bulan]', 2835, 12800, 'ASN se-Kecamatan', '-', '2023-03-20', 36288000, 'Liter', '2024-06-25 19:27:53', '2024-06-25 19:27:53', 'pengelola@gmail.com', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 20042, 10045, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [45 Liter x 9Unit x 3 Bulan]', 2652, 12800, 'ASN se-Kecamatan', '-', '2023-03-20', 33945600, 'Liter', '2024-06-25 19:29:12', '2024-06-25 19:29:12', 'pengelola@gmail.com', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 20043, 10046, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [150 Liter x 7Unit x 3 Bulan]', 1185, 12800, 'ASN se-Kecamatan', '-', '2023-03-20', 15168000, 'Liter', '2024-06-25 19:31:21', '2024-06-25 19:31:21', 'pengelola@gmail.com', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 20044, 10047, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamina Dex [195 Liter x 1Unit x 3 Bulan]', 542, 15400, 'ASN se-Kecamatan', '-', '2023-06-23', 8340000, 'Liter', '2024-06-25 19:32:58', '2024-06-25 19:32:58', 'pengelola@gmail.com', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 20045, 10048, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [225 Liter x 2Unit x 3 Bulan]', 1155, 13300, 'ASN se-Kecamatan', '-', '2023-06-23', 15360000, 'Liter', '2024-06-25 19:34:15', '2024-06-25 19:34:15', 'pengelola@gmail.com', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 20046, 10049, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [37.5 Liter x 20Unit x 3 Bulan]', 2754, 13300, 'ASN se-Kecamatan', '-', '2023-06-23', 36625500, 'Liter', '2024-06-25 19:35:31', '2024-06-25 19:35:31', 'pengelola@gmail.com', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 20047, 10050, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [45 Liter x 9Unit x 3 Bulan]', 2610, 13300, 'ASN se-Kecamatan', '-', '2023-06-23', 34711600, 'Liter', '2024-06-25 19:36:36', '2024-06-25 19:36:36', 'pengelola@gmail.com', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 20048, 10051, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [150 Liter x 7 Unit x 3 Bulan]', 1117, 13300, 'ASN se-Kecamatan', '-', '2023-06-23', 14860500, 'Liter', '2024-06-25 19:37:31', '2024-06-25 19:37:31', 'pengelola@gmail.com', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 20049, 10052, 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit Bayam', 7, 55000, 'Kasi Ekbang', '-', '2023-02-28', 385000, 'Sachet', '2024-06-26 13:20:27', '2024-06-26 13:20:27', 'pengelola@gmail.com', '5.1.02.01.01.0008'),
('KECAMATAN ASTANAANYAR', 20050, 10053, 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit cabe Rawit', 6, 65000, 'Kasi Ekbang', '-', '2023-02-28', 390000, 'Sachet', '2024-06-26 13:21:47', '2024-06-26 13:21:47', 'pengelola@gmail.com', '5.1.02.01.01.0008'),
('KECAMATAN ASTANAANYAR', 20051, 10054, 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit caisim', 6, 35000, 'Kasi Ekbang', '-', '2023-02-28', 210000, 'Sachet', '2024-06-26 13:22:40', '2024-06-26 13:22:40', 'pengelola@gmail.com', '5.1.02.01.01.0008'),
('KECAMATAN ASTANAANYAR', 20052, 10055, 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit Kangkung', 6, 57500, 'Kasi Ekbang', '-', '2023-02-28', 345000, 'Kg', '2024-06-26 13:23:36', '2024-06-26 13:23:36', 'pengelola@gmail.com', '5.1.02.01.01.0008'),
('KECAMATAN ASTANAANYAR', 20053, 10056, 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit pakcoy', 6, 35000, 'Kasi Ekbang', '-', '2023-02-28', 210000, 'Sachet', '2024-06-26 13:24:41', '2024-06-26 13:24:41', 'pengelola@gmail.com', '5.1.02.01.01.0008'),
('KECAMATAN ASTANAANYAR', 20054, 10062, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Spidol', 24, 7500, '-', '-', '2023-01-02', 180000, 'Pcs', '2024-06-26 13:29:58', '2024-06-26 13:29:58', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20055, 10063, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Ekspedisi 100 Lembar', 8, 9000, '-', '-', '2023-01-02', 72000, 'Pcs', '2024-06-26 13:30:54', '2024-06-26 13:30:54', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20056, 10064, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penghapus / Korektor', 8, 6000, '-', '-', '2023-01-02', 48000, 'Pcs', '2024-06-26 13:31:53', '2024-06-26 13:31:53', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20057, 10065, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Box File bindex', 8, 31000, '-', '-', '2023-01-02', 248000, 'Pcs', '2024-06-26 13:32:43', '2024-06-26 13:32:43', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20058, 10066, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Kwitansi', 14, 5000, '-', '-', '2023-01-02', 70000, 'Pcs', '2024-06-26 13:33:43', '2024-06-26 13:33:43', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20059, 10067, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas (Binder Clip)', 10, 6000, '-', '-', '2023-01-02', 60000, 'Pcs', '2024-06-26 13:34:44', '2024-06-26 13:34:44', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20061, 10069, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Isolasi Bening', 1, 8500, '-', '-', '2023-01-02', 8500, 'Pcs', '2024-06-26 13:36:43', '2024-06-26 13:36:43', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20062, 10070, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler Besar', 6, 58500, '-', '-', '2023-01-02', 351000, 'Pcs', '2024-06-26 13:37:46', '2024-06-26 13:37:46', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20063, 10071, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pembolong Kertas Ukuran Besar', 3, 36500, '-', '-', '2023-01-02', 109500, 'Pcs', '2024-06-26 13:40:15', '2024-06-26 13:40:15', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20064, 100262, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map plastik snechelter', 3, 33000, '-', '-', '2023-01-02', 99000, 'Lusin', '2024-06-26 13:41:37', '2024-06-26 13:41:37', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20065, 10073, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Gunting Kertas Sedang', 3, 18000, '-', '-', '2023-01-02', 54000, 'Pcs', '2024-06-26 13:42:42', '2024-06-26 13:42:42', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20066, 10074, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kertas HVS A4 70 Gsm', 5, 52000, '-', '-', '2023-01-02', 260000, 'Rim', '2024-06-26 13:43:50', '2024-06-26 13:54:22', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20067, 10075, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 4, 22000, '-', '-', '2023-01-02', 88000, 'Dus', '2024-06-26 13:44:43', '2024-06-26 13:44:43', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20068, 10076, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 5, 15000, '-', '-', '2023-01-02', 75000, 'Dus', '2024-06-26 13:45:44', '2024-06-26 13:45:44', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20069, 10077, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 3, 30000, '-', '-', '2023-01-02', 90000, 'Lusin', '2024-06-26 13:46:57', '2024-06-26 13:46:57', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20070, 10067, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas (Binder Clip)', 20, 6000, '-', '-', '2023-01-02', 120000, 'Box', '2024-06-26 13:48:06', '2024-06-26 13:48:06', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20071, 10078, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas (Binder Clip)', 8, 12000, '-', '-', '2023-01-02', 96000, 'Box', '2024-06-26 13:49:12', '2024-06-26 13:49:12', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20072, 10079, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'isi staples', 26, 3000, '-', '-', '2023-01-02', 78000, 'Box', '2024-06-26 13:50:32', '2024-06-26 13:50:32', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20073, 10080, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kertas Photo (Glosy isi 100 lbr 230 Gram', 1, 70000, '-', '-', '2023-01-02', 70000, 'Pak', '2024-06-26 13:52:03', '2024-06-26 13:52:03', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20074, 10067, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas (Binder Clip)', 10, 6000, '-', '-', '2023-01-02', 60000, 'Box', '2024-06-26 13:53:20', '2024-06-26 13:53:20', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20075, 10081, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Ordnerd Bantex', 24, 30000, '-', '-', '2023-01-02', 720000, 'Pcs', '2024-06-26 13:56:08', '2024-06-26 13:56:08', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20076, 10082, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler Kecil', 6, 13000, '-', '-', '2023-01-02', 78000, 'Pcs', '2024-06-26 13:57:24', '2024-06-26 13:57:24', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20077, 10083, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kertas HVS F4 70 Gsm', 15, 55000, '-', '-', '2023-01-02', 825000, 'Rim', '2024-06-26 13:58:30', '2024-06-26 13:58:30', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20078, 10084, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 20, 17000, '-', '-', '2023-01-14', 340000, 'Pak', '2024-06-26 13:59:50', '2024-06-26 13:59:50', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20079, 10085, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 10, 21000, '-', '-', '2023-01-14', 210000, 'Pak', '2024-06-26 14:00:52', '2024-06-26 14:00:52', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20080, 10086, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Campus Kiky', 25, 23000, '-', '-', '2023-01-14', 575000, 'Pcs', '2024-06-26 14:01:59', '2024-06-26 14:01:59', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20081, 10087, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Folio', 10, 26000, '-', '-', '2023-01-14', 260000, 'Pcs', '2024-06-26 14:03:03', '2024-06-26 14:03:03', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20082, 10088, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Kwitansi Sinar Dunia 2 Ply', 10, 5500, '-', '-', '2023-01-14', 55000, 'Pcs', '2024-06-26 14:04:05', '2024-06-26 14:04:05', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20083, 10089, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Cutter Kenko L-5000', 10, 15500, '-', '-', '2023-01-14', 155000, 'Pcs', '2024-06-26 14:05:17', '2024-06-26 14:05:17', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20084, 10090, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Isolasi Bening2', 16, 9500, '-', '-', '2023-01-14', 152000, 'Pcs', '2024-06-26 14:06:20', '2024-06-26 14:06:20', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20085, 10091, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Label FOX 121/103', 25, 5000, '-', '-', '2023-01-14', 125000, 'Pad', '2024-06-26 14:07:23', '2024-06-26 14:07:23', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20086, 10092, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Lem UHU Stick Besar', 12, 26000, '-', '-', '2023-01-14', 312000, 'Pcs', '2024-06-26 14:09:12', '2024-06-26 14:09:12', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20087, 10093, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Lem UHU Stick Kecil', 24, 8500, '-', '-', '2023-01-14', 204000, 'Pcs', '2024-06-26 14:10:31', '2024-06-26 14:10:31', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20088, 10094, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map Bussiness F4', 25, 5200, '-', '-', '2023-01-14', 130000, 'Lusin', '2024-06-26 14:11:31', '2024-06-26 14:11:31', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20089, 10072, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map plastik snechelter', 20, 35000, '-', '-', '2023-01-14', 700000, 'Lusin', '2024-06-26 14:12:37', '2024-06-26 14:12:37', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20090, 10095, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Ordnerd Bantex', 36, 35000, '-', '-', '2023-01-14', 1260000, 'Pcs', '2024-06-26 14:13:54', '2024-06-26 14:13:54', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20091, 10096, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 25, 3000, '-', '-', '2023-01-14', 75000, 'Pak', '2024-06-26 14:14:50', '2024-06-26 14:14:50', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20092, 10097, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 20, 6000, '-', '-', '2023-01-14', 120000, 'Pak', '2024-06-26 14:16:08', '2024-06-26 14:16:08', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20093, 10098, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 20, 18500, '-', '-', '2023-01-14', 370000, 'Pak', '2024-06-26 14:17:12', '2024-06-26 14:17:12', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20094, 10099, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 20, 12700, '-', '-', '2023-01-14', 254000, 'Pak', '2024-06-26 14:18:13', '2024-06-26 14:18:13', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20095, 10100, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 653 (Size 34,9 x 47,6 mm)', 10, 6200, '-', '-', '2023-01-14', 62000, 'Pad', '2024-06-26 14:20:42', '2024-06-26 14:20:42', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20096, 10101, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 654 (Size 76 x 76 mm)', 10, 11500, '-', '-', '2023-01-14', 115000, 'Pad', '2024-06-26 14:21:49', '2024-06-26 14:21:49', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20097, 10102, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it  655 (Size 73 x 123 mm)', 10, 17000, '-', '-', '2023-01-14', 170000, 'Pad', '2024-06-26 14:23:35', '2024-06-26 14:23:35', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20098, 10103, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 5, 16600, '-', '-', '2023-01-14', 83000, 'Lusin', '2024-06-26 14:24:48', '2024-06-26 14:24:48', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20099, 10104, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 12, 9000, '-', '-', '2023-01-14', 108000, 'Pcs', '2024-06-26 14:25:40', '2024-06-26 14:25:40', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20100, 10105, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 12, 30000, '-', '-', '2023-01-14', 360000, 'Pcs', '2024-06-26 14:26:36', '2024-06-26 14:26:36', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20101, 10062, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Spidol', 48, 7500, '-', '-', '2023-01-14', 360000, 'Pcs', '2024-06-26 14:27:46', '2024-06-26 14:27:46', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20102, 10106, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler', 20, 57000, '-', '-', '2023-01-14', 1140000, 'Pcs', '2024-06-26 14:28:54', '2024-06-26 14:28:54', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20103, 100107, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler', 5, 14000, '-', '-', '2023-01-14', 70000, 'Pcs', '2024-06-26 14:29:51', '2024-06-26 14:29:51', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20104, 100108, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stop Map Biasa', 10, 26000, '-', '-', '2023-01-14', 260000, 'Pak', '2024-06-26 14:30:52', '2024-06-26 14:30:52', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20105, 100109, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'pajak', 1, 882750, '-', '-', '2023-01-14', 882750, 'Berkas', '2024-06-26 14:32:28', '2024-06-26 14:32:28', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20106, 100110, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Hvs Wama', 1, 56000, '-', '-', '2023-01-13', 56000, 'Rim', '2024-06-26 14:34:49', '2024-06-26 14:34:49', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20107, 100111, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 1, 7000, '-', '-', '2023-01-13', 7000, 'Pcs', '2024-06-26 14:36:22', '2024-06-26 14:36:22', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20108, 100112, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Goodybag Musrenbang', 100, 14000, '-', '-', '2023-02-06', 1400000, 'Pcs', '2024-06-26 14:37:21', '2024-06-26 14:37:21', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20109, 100110, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Hvs Wama', 5, 56000, '-', '-', '2023-03-30', 280000, 'Rim', '2024-06-26 14:38:48', '2024-06-26 14:38:48', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20110, 100113, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'isi Stapler no 10', 20, 4500, '-', '-', '2023-03-30', 90000, 'Pak', '2024-06-26 14:39:39', '2024-06-26 14:39:39', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20111, 100114, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'isi staples', 20, 2500, '-', '-', '2023-03-30', 50000, 'Pak', '2024-06-26 14:40:55', '2024-06-26 14:40:55', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20112, 100115, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Isolasi Bening3', 12, 5000, '-', '-', '2023-03-30', 60000, 'Pcs', '2024-06-26 14:42:00', '2024-06-26 14:42:00', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20113, 100116, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kenko OPP Packing Tape', 12, 12000, '-', '-', '2023-03-30', 144000, 'Pcs', '2024-06-26 14:42:52', '2024-06-26 14:42:52', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20114, 100117, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kertas Sertifikat', 3, 67000, '-', '-', '2023-03-30', 201000, 'Pak', '2024-06-26 14:43:58', '2024-06-26 14:43:58', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20115, 100118, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'kertas stiker', 3, 31000, '-', '-', '2023-03-30', 93000, 'Pak', '2024-06-26 14:44:59', '2024-06-26 14:44:59', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20116, 100119, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Lakban Hitam 2\"', 6, 15000, '-', '-', '2023-03-30', 90000, 'Pcs', '2024-06-26 14:46:38', '2024-06-26 14:46:38', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20117, 100120, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Nachi Tape', 12, 3500, '-', '-', '2023-03-30', 42000, 'Pcs', '2024-06-26 14:47:38', '2024-06-26 14:47:38', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20118, 100121, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penggaris Stainles', 6, 9000, '-', '-', '2023-03-30', 54000, 'Pcs', '2024-06-26 14:48:32', '2024-06-26 14:48:32', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20119, 10096, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 20, 3000, '-', '-', '2023-03-30', 60000, 'Pak', '2024-06-26 14:49:30', '2024-06-26 14:49:30', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20120, 10097, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 20, 6000, '-', '-', '2023-03-30', 120000, 'Pak', '2024-06-26 14:50:20', '2024-06-26 14:50:20', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20121, 10098, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 10, 18500, '-', '-', '2023-03-30', 185000, 'Pak', '2024-06-26 14:51:16', '2024-06-26 14:51:16', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20122, 10099, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 10, 12700, '-', '-', '2023-03-30', 127000, 'Pak', '2024-06-26 14:52:07', '2024-06-26 14:52:07', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20123, 10100, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 653 (Size 34,9 x 47,6 mm)', 10, 6200, '-', '-', '2023-03-30', 62000, 'Pad', '2024-06-26 14:53:03', '2024-06-26 14:53:03', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20124, 10101, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 654 (Size 76 x 76 mm)', 10, 11500, '-', '-', '2023-03-30', 115000, 'Pad', '2024-06-26 14:53:59', '2024-06-26 14:53:59', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20125, 10102, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it  655 (Size 73 x 123 mm)', 10, 17000, '-', '-', '2023-03-30', 170000, 'Pad', '2024-06-26 14:54:53', '2024-06-26 14:54:53', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20126, 10103, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 10, 16600, '-', '-', '2023-03-30', 166000, 'Lusin', '2024-06-26 14:55:44', '2024-06-26 14:55:44', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20127, 10104, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 10, 9000, '-', '-', '2023-03-30', 90000, 'Pcs', '2024-06-26 14:56:35', '2024-06-26 14:56:35', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20128, 10105, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 10, 30000, '-', '-', '2023-03-30', 300000, 'Pcs', '2024-06-26 14:57:30', '2024-06-26 14:57:30', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20129, 100122, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 5, 175000, '-', '-', '2023-03-30', 875000, 'Lusin', '2024-06-26 14:59:02', '2024-06-26 14:59:02', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20130, 100123, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Spare Blade Kenko', 5, 7200, '-', '-', '2023-03-30', 36000, 'Pcs', '2024-06-26 14:59:55', '2024-06-26 14:59:55', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20131, 100124, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Spidol Emas / Perak / Putih', 6, 15500, '-', '-', '2023-03-30', 93000, 'Pcs', '2024-06-26 15:00:49', '2024-06-26 15:00:49', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20132, 100125, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stabilo', 20, 9400, '-', '-', '2023-03-30', 188000, 'Pcs', '2024-06-26 15:01:50', '2024-06-26 15:20:19', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20133, 100107, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler', 10, 14000, '-', '-', '2023-03-30', 140000, 'Pcs', '2024-06-26 15:02:47', '2024-06-26 15:02:47', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20134, 100108, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stop Map Biasa', 20, 26000, '-', '-', '2023-03-30', 520000, 'Pak', '2024-06-26 15:03:50', '2024-06-26 15:03:50', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20135, 100126, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stop Map Buffalo', 5, 78500, '-', '-', '2023-03-30', 392500, 'Pak', '2024-06-26 15:04:38', '2024-06-26 15:04:38', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20136, 100127, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'pajak', 1, 521785, '-', '-', '2023-03-30', 521785, 'Berkas', '2024-06-26 15:05:38', '2024-06-26 15:05:38', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20137, 100128, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Cek', 1, 250000, '-', '-', '2023-05-04', 250000, 'Berkas', '2024-06-26 15:06:47', '2024-06-26 15:06:47', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20138, 100129, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 15, 18870, '-', '-', '2023-05-05', 283050, 'Dus', '2024-06-26 15:08:45', '2024-06-26 15:08:45', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20139, 100130, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 10, 23310, '-', '-', '2023-05-05', 233100, 'Dus', '2024-06-26 15:11:02', '2024-06-26 15:11:02', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20140, 100131, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Kwitansi Sinar Dunia 2 Ply', 25, 6105, '-', '-', '2023-05-05', 152625, 'Pcs', '2024-06-26 15:19:08', '2024-06-26 15:19:08', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20141, 100132, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Hvs Warna', 15, 61605, '-', '-', '2023-05-05', 924075, 'Rim', '2024-06-26 15:22:05', '2024-06-26 15:22:05', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20142, 100133, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kertas Sertifikat', 5, 74370, '-', '-', '2023-05-05', 371850, 'pak', '2024-06-26 15:23:09', '2024-06-26 15:23:09', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20143, 100134, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Lem UHU Stick Besar', 6, 28305, '-', '-', '2023-05-05', 169830, 'Buah', '2024-06-26 15:24:12', '2024-06-26 15:24:12', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20144, 100135, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Lem UHU Stick Kecil', 12, 9435, '-', '-', '2023-05-05', 113220, 'Buah', '2024-06-26 15:25:27', '2024-06-26 15:25:27', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20145, 100136, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map Bussiness F4', 25, 5772, '-', '-', '2023-05-05', 144300, 'Pcs', '2024-06-26 15:26:54', '2024-06-26 15:26:54', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20146, 100137, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map plastik snechelter', 15, 37740, '-', '-', '2023-05-05', 566100, 'Liusin', '2024-06-26 15:27:53', '2024-06-26 15:27:53', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20147, 100138, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Ordnerd Bantex', 12, 38850, '-', '-', '2023-05-05', 466200, 'Pcs', '2024-06-26 15:29:00', '2024-06-26 15:29:00', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20148, 100139, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penggaris Stainles', 10, 9990, '-', '-', '2023-05-05', 99900, 'Pcs', '2024-06-26 15:30:20', '2024-06-26 15:30:20', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20149, 100140, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 0, 3330, '-', '-', '2023-05-05', 0, 'Pcs', '2024-06-26 15:34:10', '2024-06-26 15:34:10', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20150, 100141, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 16, 6660, '-', '-', '2023-05-05', 106560, 'Box', '2024-06-26 15:35:25', '2024-06-26 15:35:25', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20151, 100142, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 5, 20535, '-', '-', '2023-05-05', 102675, 'Box', '2024-06-26 15:36:26', '2024-06-26 15:36:26', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20152, 100143, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 6, 13875, '-', '-', '2023-05-05', 83250, 'Box', '2024-06-26 15:38:33', '2024-06-26 15:38:33', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20153, 100144, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pensil', 2, 35520, '-', '-', '2023-05-05', 71040, 'Lusin', '2024-06-26 15:39:34', '2024-06-26 15:39:34', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20154, 100145, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 653 (Size 34,9 x 47,6 mm)', 5, 6882, '-', '-', '2023-05-05', 34410, 'Pad', '2024-06-26 15:40:24', '2024-06-26 15:40:24', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20155, 100146, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 654 (Size 76 x 76 mm)', 2, 12765, '-', '-', '2023-05-05', 25530, 'Pad', '2024-06-26 15:41:21', '2024-06-26 15:41:21', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20156, 100147, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it  655 (Size 73 x 123 mm)', 2, 18870, '-', '-', '2023-05-05', 37740, 'Pad', '2024-06-26 15:42:36', '2024-06-26 15:42:36', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20157, 100148, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'pulpen', 3, 17760, '-', '-', '2023-05-05', 53280, 'Lusin', '2024-06-26 15:43:54', '2024-06-26 15:43:54', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20158, 100149, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'pulpen', 4, 9990, '-', '-', '2023-05-05', 39960, 'Pcs', '2024-06-26 15:45:04', '2024-06-26 15:45:04', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20159, 100150, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 3, 33300, '-', '-', '2023-05-05', 99900, 'Pcs', '2024-06-26 15:46:17', '2024-06-26 15:46:17', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20160, 100151, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stabilo', 8, 9990, '-', '-', '2023-05-05', 79920, 'Pcs', '2024-06-26 15:47:18', '2024-06-26 15:52:45', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20161, 100152, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler', 0, 63270, '-', '-', '2023-05-05', 0, 'Pcs', '2024-06-26 15:48:20', '2024-06-26 15:48:53', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20162, 100153, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler', 8, 14985, '-', '-', '2023-05-05', 119880, 'Pcs', '2024-06-26 15:50:02', '2024-06-26 15:50:02', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20163, 100154, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stop Map Biasa', 8, 28860, '-', '-', '2023-05-05', 230880, 'Pack', '2024-06-26 15:51:06', '2024-06-26 15:53:21', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20164, 100263, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Kertas HVS A4 70 Gsm', 20, 52170, '-', '-', '2023-01-14', 1043400, 'Rim', '2024-06-26 15:56:12', '2024-06-26 15:56:12', 'pengelola@gmail.com', '5.1.02.01.01.0025'),
('KECAMATAN ASTANAANYAR', 20165, 100264, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Kertas HVS F4 70 Gsm', 130, 61050, '-', '-', '2023-01-14', 7936500, 'Rim', '2024-06-26 15:57:16', '2024-06-26 16:00:20', 'pengelola@gmail.com', '5.1.02.01.01.0025'),
('KECAMATAN ASTANAANYAR', 20166, 100263, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Kertas HVS A4 70 Gsm', 15, 52170, '-', '-', '2023-03-30', 782550, 'Rim', '2024-06-26 15:59:04', '2024-06-26 15:59:04', 'pengelola@gmail.com', '5.1.02.01.01.0025'),
('KECAMATAN ASTANAANYAR', 20167, 100264, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Kertas HVS F4 70 Gsm', 70, 61050, '-', '-', '2023-03-30', 4273500, 'Rim', '2024-06-26 16:01:39', '2024-06-27 14:20:31', 'pengelola@gmail.com', '5.1.02.01.01.0025'),
('KECAMATAN ASTANAANYAR', 20168, 100263, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Kertas HVS A4 70 Gsm', 6, 52170, '-', '-', '2023-05-24', 313020, 'Rim', '2024-06-26 16:02:46', '2024-06-27 14:20:54', 'pengelola@gmail.com', '5.1.02.01.01.0025'),
('KECAMATAN ASTANAANYAR', 20169, 100264, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Kertas HVS F4 70 Gsm', 52, 61050, '-', '-', '2023-05-24', 3174600, 'Rim', '2024-06-26 16:03:44', '2024-06-27 14:21:24', 'pengelola@gmail.com', '5.1.02.01.01.0025'),
('KECAMATAN ASTANAANYAR', 20170, 100265, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Kop Surat Dinas', 20, 63500, '-', '-', '2023-01-02', 1270000, 'Rim', '2024-06-27 15:19:41', '2024-06-27 15:19:41', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20171, 100266, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Dus Arsip', 200, 20000, '-', '-', '2023-01-02', 4000000, 'Buah', '2024-06-27 15:20:53', '2024-06-27 15:20:53', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20172, 100267, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Map Design', 1000, 7770, '-', '-', '2023-01-02', 7770000, 'Lembar', '2024-06-27 15:22:00', '2024-06-27 15:22:00', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20173, 100268, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 218, 500, 'Adum', '-', '2023-01-13', 109000, 'Lembar', '2024-06-27 15:43:08', '2024-06-27 15:43:08', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20174, 100269, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Jilid Soft Cover', 1, 25000, 'Adum', '-', '2023-01-13', 25000, 'Berkas', '2024-06-27 15:46:15', '2024-06-27 15:46:15', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20175, 100270, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan dan jilid LAKIP Tahunan', 1, 240000, 'Adum', '-', '2023-01-27', 240000, 'Berkas', '2024-06-27 15:47:28', '2024-06-27 15:47:28', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20176, 100271, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan dan jilid Laporan Keuangan', 1, 174000, 'Adum', '-', '2023-01-20', 174000, 'Berkas', '2024-06-27 15:48:39', '2024-06-27 15:48:39', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20177, 100272, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Jilid Soft Cover', 1, 14000, 'Adum', '-', '2023-01-20', 14000, 'Berkas', '2024-06-27 15:49:47', '2024-06-27 15:49:47', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20178, 100274, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan dan jilid LAKIP TW 4', 1, 0, 'Adum', '-', '2023-01-10', 0, 'Berkas', '2024-06-27 15:52:01', '2024-06-27 15:52:01', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20179, 100274, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Jilid dan Foto Copy', 1, 117500, 'Adum', '-', '2023-01-17', 117500, 'Berkas', '2024-06-27 15:53:39', '2024-06-27 15:53:39', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20180, 100275, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 184, 250, 'Kasi Ekbang', '-', '2023-02-06', 46000, 'Buku', '2024-06-27 15:55:28', '2024-06-27 15:55:28', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20181, 100276, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Cetak Buku Materi Munsrenbang', 100, 24000, 'Kasi Ekbang', '-', '2023-02-06', 2400000, 'Buku', '2024-06-27 15:56:29', '2024-06-27 15:56:29', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20182, 100277, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk Munsrenbang', 2, 192000, 'Kasi Ekbang', '-', '2023-02-06', 384000, 'Pcs', '2024-06-27 15:58:31', '2024-06-27 15:58:31', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20183, 100278, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'spanduk', 1, 240000, 'Kasi PM', '-', '2023-02-01', 240000, 'Pcs', '2024-06-27 16:00:43', '2024-06-27 16:02:48', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20184, 100279, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 1, 497500, 'Adum', '-', '2023-02-16', 497500, 'Berkas', '2024-06-27 16:02:18', '2024-06-27 16:02:18', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20185, 100280, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Cetak Stiker', 500, 5550, 'Adum', '-', '2023-02-16', 2775000, 'Lembar', '2024-06-27 16:04:16', '2024-06-27 16:04:16', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20186, 100281, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Belanja cetak Map Design', 1500, 7770, 'Adum', '-', '2023-02-16', 11655000, 'Lembar', '2024-06-27 16:05:38', '2024-06-27 16:05:38', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20187, 100282, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Dus Arsip', 200, 22200, 'Adum', '-', '2023-02-16', 4440000, 'Buah', '2024-06-27 16:07:13', '2024-06-27 16:07:13', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20188, 100283, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Amplop', 15, 100455, 'Adum', '-', '2023-02-16', 1506825, 'Dus', '2024-06-27 16:08:46', '2024-06-27 16:08:46', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20189, 100284, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 15, 32000, 'Kasi Ekbang', '-', '2023-02-28', 480000, 'Meter', '2024-06-27 16:10:15', '2024-06-27 16:10:15', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20190, 100125, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 124, 0, 'Kasi Ekbang', '-', '2023-02-28', 0, 'Lembar', '2024-06-27 16:11:43', '2024-06-27 16:11:43', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20191, 100285, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 1, 118750, 'Adum', '-', '2023-03-15', 118750, 'Berkas', '2024-06-27 16:13:02', '2024-06-27 16:13:02', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20192, 100286, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 1, 50000, 'Adum', '-', '2023-03-15', 50000, 'Berkas', '2024-06-27 16:14:07', '2024-06-27 16:14:07', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20193, 100287, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 1, 60000, 'Adum', '-', '2023-02-17', 60000, 'Berkas', '2024-06-27 16:15:07', '2024-06-27 16:15:07', 'pengelola@gmail.com', '5.1.02.01.01.0026');
INSERT INTO `barangkeluar` (`perangkat_daerah`, `id_transaksi_keluar`, `id_barang`, `jenis_barang`, `nama_barang`, `jml_barang`, `harga_barang`, `untuk`, `ket`, `Tanggal`, `total_harga_keluar`, `satuan`, `created_at`, `updated_at`, `created_by`, `kode`) VALUES
('KECAMATAN ASTANAANYAR', 20194, 100288, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 1, 235000, 'Adum', '-', '2023-03-27', 235000, 'Berkas', '2024-06-27 16:16:13', '2024-06-27 16:16:13', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20195, 100289, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk Sertijab', 1, 630000, 'Adum', '-', '2023-03-04', 630000, 'Kegiatan', '2024-06-27 16:17:13', '2024-06-27 16:17:13', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20196, 100290, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan Monev IKI TW 1', 1, 75000, 'Adum', '-', '2023-03-04', 75000, 'Berkas', '2024-06-27 16:20:13', '2024-06-27 16:20:13', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20197, 100291, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan Monev LAKIP TW !', 1, 245000, 'Adum', '-', '2023-03-20', 245000, 'Berkas', '2024-06-27 16:34:06', '2024-06-27 16:34:06', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20198, 100292, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 1, 180000, 'Kasi Pem', '-', '2023-03-16', 180000, 'Pcs', '2024-06-27 16:35:24', '2024-06-27 16:35:24', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20199, 100292, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 1, 180000, 'Kasi PM', '-', '2023-03-07', 180000, 'Pcs', '2024-06-27 16:36:32', '2024-06-27 16:36:32', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20200, 100293, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 1, 163500, 'Adum', '-', '2023-04-12', 163500, 'Berkas', '2024-06-27 16:37:53', '2024-06-27 16:38:56', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20201, 100275, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 720, 250, 'Kasi PM', '-', '2023-04-12', 180000, 'Lembar', '2024-06-27 16:40:26', '2024-06-27 16:40:26', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20202, 100294, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 7, 210000, 'Kasi PM', '-', '2023-04-12', 1470000, 'Kegiatan', '2024-06-27 16:41:32', '2024-06-27 16:41:32', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20203, 100295, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk Rakor dan Haibil', 1, 720000, 'Adum', '-', '2023-05-10', 720000, 'Kegiatan', '2024-06-27 16:42:41', '2024-06-27 16:42:41', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20204, 100296, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk Sosialisasi SPI KPK', 1, 840000, 'Adum', '-', '2023-06-08', 840000, 'Kegiatan', '2024-06-27 16:43:59', '2024-06-27 16:43:59', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20205, 100297, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Banner dan Spanduk', 1, 350000, 'Adum', '-', '2023-05-22', 350000, 'Kegiatan', '2024-06-27 16:44:57', '2024-06-27 16:44:57', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20206, 100298, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan RKA Pergeseran 2 Tahun 2023', 1, 306000, 'Adum', '-', '2023-06-09', 306000, 'Kegiatan', '2024-06-27 16:45:53', '2024-06-27 16:45:53', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20207, 100299, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan DPPA Pergeseran 2 Tahun 2023', 1, 430000, 'Adum', '-', '2023-06-06', 430000, 'Kegiatan', '2024-06-27 16:46:40', '2024-06-27 16:46:40', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20208, 100300, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan LK Audited', 1, 165000, 'Adum', '-', '2023-06-16', 165000, 'Kegiatan', '2024-06-27 16:47:26', '2024-06-27 16:47:26', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20209, 100301, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'X Banner dan Spanduk', 1, 330000, 'Kasi pem', '-', '2023-06-19', 330000, 'Set', '2024-06-27 16:48:18', '2024-06-27 16:54:01', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20210, 100302, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 1, 150000, 'Kasi Kesos', '-', '2023-06-21', 150000, 'Pcs', '2024-06-27 16:49:15', '2024-06-27 16:53:08', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20211, 100303, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 5, 60000, 'Kasi PM', '-', '2023-06-21', 300000, 'Pcs', '2024-06-27 16:50:54', '2024-06-27 16:50:54', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20212, 100304, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Foto Cofy', 1300, 250, 'Kasi PM', '-', '2023-06-16', 325000, 'Lembar', '2024-06-27 16:52:07', '2024-06-27 16:52:07', 'pengelola@gmail.com', '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 20213, 100305, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Benda Pos', 'Materai', 20, 10000, 'Adum', '-', '2023-02-14', 200000, 'Pcs', '2024-06-27 16:55:30', '2024-06-27 16:55:30', 'pengelola@gmail.com', '5.1.02.01.01.0027'),
('KECAMATAN ASTANAANYAR', 20214, 100305, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Benda Pos', 'Materai', 20, 10000, 'Adum', '-', '2023-02-28', 200000, 'Pcs', '2024-06-27 16:56:30', '2024-06-27 16:57:47', 'pengelola@gmail.com', '5.1.02.01.01.0027'),
('KECAMATAN ASTANAANYAR', 20215, 100305, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Benda Pos', 'Materai', 20, 10000, 'Adum', '-', '2023-03-17', 200000, 'Pcs', '2024-06-27 16:57:25', '2024-06-27 16:57:25', 'pengelola@gmail.com', '5.1.02.01.01.0027'),
('KECAMATAN ASTANAANYAR', 20216, 100305, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Benda Pos', 'Materai', 20, 10000, 'Adum', '-', '2023-03-31', 200000, 'Pcs', '2024-06-27 16:58:51', '2024-06-27 16:58:51', 'pengelola@gmail.com', '5.1.02.01.01.0027'),
('KECAMATAN ASTANAANYAR', 20217, 100305, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Benda Pos', 'Materai', 25, 10000, 'Adum', '-', '2023-04-04', 250000, 'Pcs', '2024-06-27 17:00:08', '2024-06-27 17:00:08', 'pengelola@gmail.com', '5.1.02.01.01.0027'),
('KECAMATAN ASTANAANYAR', 20218, 100306, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Tinta brother', 15, 125000, 'Adum', '-', '2023-03-27', 1875000, 'Pcs', '2024-06-27 17:18:06', '2024-06-27 17:18:06', 'pengelola@gmail.com', '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 20219, 100307, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Mouse', 6, 220000, 'Adum', '-', '2023-03-27', 1320000, 'Pcs', '2024-06-27 17:19:05', '2024-06-27 17:39:58', 'pengelola@gmail.com', '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 20220, 100308, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Kabel Hub', 1, 146100, 'Adum', '-', '2023-03-27', 146100, 'Pcs', '2024-06-27 17:39:31', '2024-06-27 17:39:31', 'pengelola@gmail.com', '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 20221, 100309, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Tinta', 6, 127500, 'Adum', '-', '2023-03-03', 765000, 'Pcs', '2024-06-27 17:41:19', '2024-06-27 17:41:19', 'pengelola@gmail.com', '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 20222, 100309, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Tinta', 6, 127500, 'Adum', '-', '2023-03-15', 765000, 'Pcs', '2024-06-27 17:42:43', '2024-06-27 17:42:43', 'pengelola@gmail.com', '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 20223, 100310, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Flash Disk', 5, 12000, 'Adum', '-', '2023-03-03', 60000, 'Pcs', '2024-06-27 17:44:00', '2024-06-27 17:44:00', 'pengelola@gmail.com', '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 20224, 100311, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Tinta Printer HP GT53', 1, 190000, 'Adum', '-', '2023-06-07', 190000, 'Pcs', '2024-06-27 17:44:56', '2024-06-27 17:44:56', 'pengelola@gmail.com', '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 20225, 100312, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Tinta Printer Epson', 1, 170000, 'Adum', '-', '2023-06-07', 170000, 'Pcs', '2024-06-27 17:45:50', '2024-06-27 17:45:50', 'pengelola@gmail.com', '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 20226, 100313, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'SOS PL Sereh B800', 2, 14750, '-', '-', '2023-01-01', 29500, 'Pcs', '2024-06-27 17:47:59', '2024-06-27 17:47:59', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20227, 100314, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Swallow TCB', 4, 16613, '-', '-', '2023-01-02', 66452, 'Pcs', '2024-06-27 17:49:03', '2024-06-28 14:10:57', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20228, 100315, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Cling PK KNGPWP425ml', 1, 8950, '-', '-', '2023-01-01', 8950, 'Pcs', '2024-06-27 17:49:57', '2024-06-27 17:49:57', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20229, 100316, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Porstex', 3, 17750, '-', '-', '2023-01-02', 53250, 'Pcs', '2024-06-27 17:50:49', '2024-06-27 17:50:49', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20230, 100317, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella Mat Orange, Apple, Green', 2, 58250, '-', '-', '2023-01-02', 116500, 'Pcs', '2024-06-27 17:51:39', '2024-06-27 17:51:39', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20231, 100318, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stel1a MAT Caffe', 2, 60950, '-', '-', '2023-01-02', 121900, 'Pcs', '2024-06-27 17:52:34', '2024-06-27 17:52:34', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20232, 100375, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sunlight Lime B750', 4, 38850, '-', '-', '2023-01-02', 155400, 'Pcs', '2024-06-27 17:53:29', '2024-06-27 17:53:29', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20233, 100382, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'stela Met Caffe', 1, 63950, '-', '-', '2023-01-02', 63950, 'Pcs', '2024-06-27 17:54:27', '2024-06-27 17:54:27', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20234, 100319, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'KMT Plas Chamois', 5, 26200, '-', '-', '2023-01-02', 131000, 'Pcs', '2024-06-27 17:55:23', '2024-06-27 17:55:23', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20235, 100320, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella Mat Green', 2, 60638, '-', '-', '2023-01-02', 121276, 'Pcs', '2024-06-27 17:56:18', '2024-06-27 17:56:18', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20236, 100321, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Panci', 1, 35000, '-', '-', '2023-01-17', 35000, 'Pcs', '2024-06-27 17:57:12', '2024-06-27 17:57:12', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20237, 100322, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Katel', 1, 35000, '-', '-', '2023-01-17', 35000, 'Pcs', '2024-06-27 17:58:12', '2024-06-27 17:58:12', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20238, 100323, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Centong Nasi', 1, 20000, '-', '-', '2023-01-17', 20000, 'Pcs', '2024-06-27 17:59:00', '2024-06-27 17:59:00', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20239, 100324, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Centong Sayur', 1, 27000, '-', '-', '2023-01-17', 27000, 'Pcs', '2024-06-27 18:00:46', '2024-06-28 14:18:48', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20240, 100325, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Serok Penggorengan', 1, 20000, '-', '-', '2023-01-17', 20000, 'Pcs', '2024-06-27 18:01:35', '2024-06-27 18:01:35', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20241, 100326, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Scotchbrite ID37', 1, 15900, '-', '-', '2023-02-07', 15900, 'Pcs', '2024-06-27 18:02:31', '2024-06-27 18:02:31', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20243, 100328, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Swallow Deo Orange', 1, 11858, '-', '-', '2023-02-07', 11858, 'Pcs', '2024-06-27 18:04:08', '2024-06-27 18:04:08', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20244, 100314, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Swallow TCB', 5, 16613, '-', '-', '2023-02-07', 83065, 'Pcs', '2024-06-27 18:05:04', '2024-06-27 18:05:04', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20245, 100330, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Dahlia TBC Bouquet 6', 3, 21950, '-', '-', '2023-02-07', 65850, 'Pcs', '2024-06-27 18:05:57', '2024-06-27 18:05:57', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20246, 100331, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Macan Sikat 50S', 2, 13500, '-', '-', '2023-02-07', 27000, 'Pcs', '2024-06-27 18:06:47', '2024-06-27 18:06:47', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20247, 100332, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Swallow Deo Lemon', 1, 13930, '-', '-', '2023-02-07', 13930, 'Pcs', '2024-06-27 18:07:46', '2024-06-27 18:07:46', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20248, 100333, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Lap Piring', 2, 13592, '-', '-', '2023-02-07', 27184, 'Pcs', '2024-06-27 18:08:34', '2024-06-27 18:08:34', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20249, 100315, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Cling PK KNGPWP425ml', 2, 8950, '-', '-', '2023-02-07', 17900, 'Pcs', '2024-06-27 18:09:24', '2024-06-27 18:09:24', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20250, 100334, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Kit Wash and Glow 400ml', 1, 5849, '-', '-', '2023-02-07', 5849, 'Pcs', '2024-06-27 18:10:16', '2024-06-27 18:10:16', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20251, 100335, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'KMT Plass Chamois', 2, 25900, '-', '-', '2023-02-07', 51800, 'Pcs', '2024-06-27 18:11:13', '2024-06-27 18:11:13', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20252, 100336, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Baygon AE Garden 600', 1, 29900, '-', '-', '2023-02-07', 29900, 'Pcs', '2024-06-27 18:12:32', '2024-06-27 18:12:32', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20253, 100337, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Peace PL Sereh 5L', 1, 80300, '-', '-', '2023-02-07', 80300, 'Pcs', '2024-06-27 18:13:20', '2024-06-27 18:13:20', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20254, 100338, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Tessa TP_06 BND 200S', 6, 15040, '-', '-', '2023-02-07', 90240, 'Pcs', '2024-06-27 18:14:20', '2024-06-27 18:14:20', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20255, 100339, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Mitu Wet Lemon BTL', 3, 14300, '-', '-', '2023-02-07', 42900, 'Pcs', '2024-06-27 18:15:18', '2024-06-27 18:15:18', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20256, 100340, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Dahlia TCB 5S', 2, 21950, '-', '-', '2023-02-07', 43900, 'Pcs', '2024-06-27 18:16:36', '2024-06-27 18:16:36', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20257, 100341, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Baygon AE 600', 5, 36450, '-', '-', '2023-02-07', 182250, 'Pcs', '2024-06-27 18:17:39', '2024-06-27 18:17:39', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20258, 100342, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'sunlight Lime B750', 5, 26750, '-', '-', '2023-02-07', 133750, 'Pcs', '2024-06-27 18:18:33', '2024-06-27 18:18:33', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20259, 100343, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Porstex WB Ungu 1lt', 4, 17750, '-', '-', '2023-02-07', 71000, 'Pcs', '2024-06-27 18:19:18', '2024-06-27 18:19:18', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20260, 100335, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'KMT Plass Chamois', 6, 25900, '-', '-', '2023-02-07', 155400, 'Pcs', '2024-06-27 18:20:05', '2024-06-27 18:20:05', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20261, 100345, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Paseo 250s', 5, 9000, '-', '-', '2023-02-07', 45000, 'Pcs', '2024-06-27 18:20:52', '2024-06-27 18:20:52', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20262, 100341, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Baygon AE 600', 6, 36450, '-', '-', '2023-02-07', 218700, 'Pcs', '2024-06-27 18:21:54', '2024-06-27 18:21:54', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20263, 100342, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'sunlight Lime B750', 5, 26750, '-', '-', '2023-02-07', 133750, 'Pcs', '2024-06-27 18:22:50', '2024-06-27 18:22:50', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20264, 100343, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Porstex WB Ungu 1lt', 4, 17750, '-', '-', '2023-02-07', 71000, 'Pcs', '2024-06-27 18:23:44', '2024-06-27 18:23:44', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20265, 100335, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'KMT Plass Chamois', 6, 25900, '-', '-', '2023-02-07', 155400, 'Pcs', '2024-06-27 18:24:40', '2024-06-27 18:24:40', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20266, 100346, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Antis Gel Nipis 5Lt', 1, 349500, '-', '-', '2023-02-07', 349500, 'Galon', '2024-06-27 18:25:35', '2024-06-27 18:25:35', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20267, 100347, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Swallow Deo Orange', 1, 13000, '-', '-', '2023-02-07', 13000, 'Pcs', '2024-06-27 18:26:33', '2024-06-27 18:26:33', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20269, 100349, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sendok Makan', 1, 30000, '-', '-', '2023-02-22', 30000, 'Lusin', '2024-06-27 18:32:50', '2024-06-27 18:32:50', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20270, 100350, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Piring Makan', 1, 125000, '-', '-', '2023-02-17', 125000, 'Lusin', '2024-06-27 18:33:42', '2024-06-27 18:33:42', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20271, 100351, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Gelas Ug Kaca', 1, 35000, '-', '-', '2023-02-17', 35000, 'Pcs', '2024-06-27 18:34:33', '2024-06-27 18:34:33', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20272, 100352, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sapu Ijuk Ikat Besar', 6, 50000, '-', '-', '2023-03-30', 300000, 'Pcs', '2024-06-27 18:35:40', '2024-06-27 18:35:40', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20273, 100353, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sikat Ijuk', 6, 17500, '-', '-', '2023-03-30', 105000, 'Pcs', '2024-06-27 18:36:42', '2024-06-27 18:36:42', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20274, 100380, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sapu Lidi Ikat Besar', 6, 50000, '-', '-', '2023-03-30', 300000, 'Pcs', '2024-06-27 18:37:29', '2024-06-27 18:37:29', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20275, 100355, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Pengki', 6, 45000, '-', '-', '2023-03-30', 270000, 'Pcs', '2024-06-27 18:38:21', '2024-06-27 18:38:21', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20276, 100356, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Gelas', 4, 50000, '-', '-', '2023-03-30', 200000, 'Lusin', '2024-06-27 18:39:08', '2024-06-27 18:39:08', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20277, 100357, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sendok Makan', 4, 20000, '-', '-', '2023-03-30', 80000, 'Lusin', '2024-06-27 18:40:02', '2024-06-27 18:40:02', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20278, 100350, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Piring Makan', 2, 125000, '-', '-', '2023-03-30', 250000, 'Lusin', '2024-06-27 18:41:03', '2024-06-27 18:41:03', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20279, 100358, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Tea Set', 1, 320000, '-', '-', '2023-03-30', 320000, 'Set', '2024-06-27 18:42:01', '2024-06-27 18:42:01', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20280, 100359, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Prakis Keeper 203 LS 4.5L', 1, 30000, '-', '-', '2023-03-06', 30000, 'Pcs', '2024-06-27 18:43:29', '2024-06-27 18:43:29', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20281, 100360, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Prakis Keeper 203 LS 6L', 1, 35000, '-', '-', '2023-03-06', 35000, 'Pcs', '2024-06-27 18:44:25', '2024-06-27 18:44:25', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20282, 100361, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Tessa TP_06 BND 200S', 20, 16500, '-', '-', '2023-04-27', 330000, 'Pcs', '2024-06-27 18:45:32', '2024-06-27 18:45:32', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20283, 100362, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Dahlia TCB Tellow', 2, 21320, '-', '-', '2023-04-27', 42640, 'Pcs', '2024-06-27 18:46:39', '2024-06-27 18:46:39', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20284, 100363, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Lion Star BM50 Ref', 4, 29500, '-', '-', '2023-04-27', 118000, 'Pcs', '2024-06-27 18:47:43', '2024-06-27 18:47:43', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20285, 100364, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Scotceritess 3X4 D30R', 2, 16900, '-', '-', '2023-04-27', 33800, 'Pcs', '2024-06-27 18:48:43', '2024-06-27 18:48:43', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20286, 100319, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'KMT Plas Chamois', 5, 26200, '-', '-', '2023-04-27', 131000, 'Pcs', '2024-06-27 18:49:55', '2024-06-27 18:49:55', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20287, 100366, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'YOA Trash Bag 90x120', 1, 34900, '-', '-', '2023-04-27', 34900, 'Pcs', '2024-06-27 18:50:54', '2024-06-27 18:50:54', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20288, 100367, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Klin Pak KT Smph SD', 3, 32900, '-', '-', '2023-04-27', 98700, 'Pcs', '2024-06-27 18:52:09', '2024-06-27 18:52:09', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20289, 100363, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Peace PL Sereh 5L B1500', 2, 0, '-', '-', '2023-04-27', 0, 'Pcs', '2024-06-27 18:53:03', '2024-06-27 18:53:03', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20290, 100369, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'WPC Kloset FLWR B600', 1, 19755, '-', '-', '2023-04-27', 19755, 'Pcs', '2024-06-27 18:53:53', '2024-06-27 18:53:53', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20291, 100370, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella all Org MP', 2, 41500, '-', '-', '2023-04-27', 83000, 'Pcs', '2024-06-27 18:54:45', '2024-06-27 18:54:45', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20292, 100383, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Glade All Lemon Flower Orange', 3, 13000, '-', '-', '2023-04-27', 39000, 'Pcs', '2024-06-27 18:56:23', '2024-06-27 18:56:23', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20293, 100371, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Clear PK Ori R500', 3, 13900, '-', '-', '2023-04-27', 41700, 'Pcs', '2024-06-27 18:57:11', '2024-06-27 18:57:11', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20294, 100372, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Ktg Kuning P44G', 2, 8450, '-', '-', '2023-04-27', 16900, 'Pcs', '2024-06-27 18:58:06', '2024-06-27 18:58:06', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20295, 100373, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Baygon Peace 600', 6, 46250, '-', '-', '2023-04-27', 277500, 'Pcs', '2024-06-27 18:59:11', '2024-06-27 18:59:11', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20296, 100374, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'SK LT Lavender, Apple B900', 3, 14350, '-', '-', '2023-04-27', 43050, 'Pcs', '2024-06-27 18:59:59', '2024-06-27 18:59:59', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20297, 100375, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sunlight Lime B750', 3, 38850, '-', '-', '2023-04-27', 116550, 'Pcs', '2024-06-27 19:00:48', '2024-06-27 19:00:48', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20298, 100376, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella Mat Spring, Green', 6, 31400, '-', '-', '2023-04-27', 188400, 'Pcs', '2024-06-27 19:02:09', '2024-06-27 19:02:09', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20299, 100368, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Peace PL Sereh 5L B1500', 0, 33450, '-', '-', '2023-04-27', 0, 'Pcs', '2024-06-27 19:03:12', '2024-06-27 19:03:12', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20300, 100378, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Vixal Biru B750', 5, 17750, '-', '-', '2023-04-27', 88750, 'Pcs', '2024-06-27 19:04:46', '2024-06-27 19:04:46', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20301, 100369, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'WPC Kloset FLWR B600', 1, 19755, '-', '-', '2023-04-27', 19755, 'Pcs', '2024-06-27 19:05:41', '2024-06-27 19:05:41', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20302, 100379, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Kursi susun', 200, 355200, '-', '-', '2023-05-05', 71040000, 'Pcs', '2024-06-27 19:06:33', '2024-06-27 19:06:33', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20303, 100380, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sapu Lidi Ikat Besar', 2, 50000, '-', '-', '2023-05-10', 100000, 'Pcs', '2024-06-27 19:07:32', '2024-06-27 19:07:32', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20304, 100381, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Pengki', 2, 50000, '-', '-', '2023-05-10', 100000, 'Pcs', '2024-06-27 19:08:24', '2024-06-27 19:08:24', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20305, 100384, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Baterai AA Alfamart', 4, 24950, 'Kasubag Umpeg', '-', '2023-01-13', 99800, 'Set', '2024-06-28 13:14:21', '2024-06-28 13:14:21', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20306, 100385, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'TL 25W', 2, 92000, 'Kasubag Umpeg', '-', '2023-02-23', 184000, 'Pcs', '2024-06-28 13:16:32', '2024-06-28 14:22:04', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20307, 100386, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Eveready MRKC', 15, 9500, 'Kasubag Umpeg', '-', '2023-02-23', 142500, 'Pcs', '2024-06-28 13:18:05', '2024-06-28 13:18:05', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20308, 100387, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'ENR E92BP4AAA Alkaline Power', 4, 25500, 'Kasubag Umpeg', '-', '2023-02-23', 102000, 'Set', '2024-06-28 13:19:04', '2024-06-28 13:19:04', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20309, 100388, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Tarde Broco', 5, 21300, 'Kasubag Umpeg', '-', '2023-02-23', 106500, 'Pcs', '2024-06-28 13:20:22', '2024-06-28 13:20:22', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20310, 100389, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Senter Eveready Besar + Baterai', 2, 64000, 'Kasubag Umpeg', '-', '2023-03-07', 128000, 'Pcs', '2024-06-28 13:21:25', '2024-06-28 13:21:25', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20311, 100390, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Senter Eveready Kecil + Baterai', 2, 35000, 'Kasubag Umpeg', '-', '2023-03-07', 70000, 'Pcs', '2024-06-28 13:22:31', '2024-06-28 13:22:31', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20313, 100392, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Baterai Kancing ECR 7016', 2, 16000, 'Kasubag Umpeg', '-', '2023-03-27', 32000, 'Pcs', '2024-06-28 13:24:34', '2024-06-28 13:24:34', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20314, 100393, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Alkaline AA 4+3', 5, 37500, 'Kasubag Umpeg', '-', '2023-03-07', 187500, 'Pcs', '2024-06-28 13:25:37', '2024-06-28 13:25:37', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20315, 100394, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Alkaline AAA 4+2', 5, 32190, 'Kasubag Umpeg', '-', '2023-03-07', 160950, 'Pcs', '2024-06-28 13:26:41', '2024-06-28 13:26:41', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20316, 100395, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Busa Mic', 4, 10000, 'Kasubag Umpeg', '-', '2023-03-06', 40000, 'Pcs', '2024-06-28 13:27:54', '2024-06-28 13:27:54', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20317, 100396, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Baterai A2 ABC', 6, 2500, 'Kasubag Umpeg', '-', '2023-03-06', 15000, 'Pcs', '2024-06-28 13:29:03', '2024-06-28 13:29:03', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20318, 100397, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Baterai A3 ABC', 6, 2500, 'Kasubag Umpeg', '-', '2023-03-06', 15000, 'Pcs', '2024-06-28 13:30:02', '2024-06-28 13:30:02', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20319, 100398, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Logitech Wireless Combo Keyboard & Mouse', 1, 292000, 'Kasubag Umpeg', '-', '2023-04-04', 292000, 'Pcs', '2024-06-28 13:30:59', '2024-06-28 13:30:59', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20320, 100399, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'ABC Alkaline', 3, 18900, 'Kasubag Umpeg', '-', '2023-04-27', 56700, 'Pcs', '2024-06-28 13:31:56', '2024-06-28 13:31:56', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20321, 100400, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Lampu Philips Led 4Pcs', 1, 205000, 'Kasubag Umpeg', '-', '2023-05-17', 205000, 'Set', '2024-06-28 13:33:00', '2024-06-28 13:33:00', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20322, 100401, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Tang dan Gegep', 1, 130000, 'Kasubag Umpeg', '-', '2023-05-05', 130000, 'Pcs', '2024-06-28 13:33:49', '2024-06-28 13:33:49', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20323, 100402, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Perbaikan Jaringan Listrik', 1, 565000, 'Kasubag Umpeg', '-', '2023-05-17', 565000, 'Kegiatan', '2024-06-28 13:34:57', '2024-06-28 13:34:57', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20324, 100403, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'MCB', 1, 500000, 'Kasubag Umpeg', '-', '2023-05-17', 500000, 'Set', '2024-06-28 13:35:49', '2024-06-28 13:35:49', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20325, 100404, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Luthfi Service', 1, 722000, 'Kasubag Umpeg', '-', '2023-05-16', 722000, 'Kegiatan', '2024-06-28 13:36:45', '2024-06-28 13:36:45', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 20326, 100405, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Suvenir/Cendera Mata', 'T-Shirt', 95, 99900, 'Pegawai Se-Kecamatan', '-', '2023-04-12', 9490500, 'Pcs', '2024-06-28 13:39:25', '2024-06-28 13:39:25', 'pengelola@gmail.com', '5.1.02.01.01.0035'),
('KECAMATAN ASTANAANYAR', 20330, 100409, 'Belanja Pakaian Dinas Lapangan (PDL)', 'Pakaian Dinas Lapangan', 90, 75000, 'Kasi Ekbang', '-', '2023-04-10', 6750000, 'Pcs', '2024-06-28 13:57:53', '2024-06-28 14:10:14', 'pengelola@gmail.com', '5.1.02.01.01.0064'),
('KECAMATAN ASTANAANYAR', 20331, 100410, 'Belanja Komponen-Komponen Peralatan', 'Kursi susun', 20, 444000, 'Adum', '-', '2023-04-12', 8880000, 'Pcs', '2024-06-28 14:00:29', '2024-06-28 14:25:14', 'pengelola@gmail.com', '5.1.02.01.02.0003'),
('KECAMATAN ASTANAANYAR', 20332, 100407, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat/Bahan untuk Kegiatan Kantor Lainnya', 'Nutrisi AB Mix', 20, 90000, 'Kasi Ekbang', '-', '2023-05-05', 1800000, 'Set', '2024-06-28 14:43:55', '2024-06-28 14:43:55', 'pengelola@gmail.com', '5.1.02.01.01.0036'),
('KECAMATAN ASTANAANYAR', 20333, 100406, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat/Bahan untuk Kegiatan Kantor Lainnya', 'Undangan Musrenbang', 100, 5000, 'Kasi Ekbang', '-', '2023-02-06', 500000, 'Pcs', '2024-06-28 15:39:36', '2024-06-28 15:39:36', 'pengelola@gmail.com', '5.1.02.01.01.0036'),
('KECAMATAN ASTANAANYAR', 20334, 100408, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat/Bahan untuk Kegiatan Kantor Lainnya', 'Pelet Apung', 75, 10000, 'Kasi Ekbang', '-', '2023-05-05', 750000, 'Kg', '2024-06-28 15:40:44', '2024-06-28 15:40:44', 'pengelola@gmail.com', '5.1.02.01.01.0036'),
('KELURAHAN CIBADAK', 20337, 10001, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Pelampung 3/4 Kuningan', 1, 85000, 'Kasi Ekbang', '-', '2024-07-03', 85000, 'Pcs', '2024-07-09 04:15:30', '2024-07-09 04:15:30', 'kelurahan@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 20338, 10068, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Cutter', 8, 15000, '-', '-', '2023-01-02', 120000, 'Pcs', '2024-07-14 15:38:22', '2024-07-14 15:38:22', 'pengelola@gmail.com', '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 20339, 100327, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Scotchbritess3X4D30R', 2, 14900, '-', 'Adum', '2023-02-07', 29800, 'Pcs', '2024-07-14 15:49:33', '2024-07-14 15:49:33', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20340, 100348, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella Pewangi Ruangan', 1, 29000, '-', 'Adum', '2023-02-22', 29000, 'Pcs', '2024-07-14 15:50:59', '2024-07-14 15:50:59', 'pengelola@gmail.com', '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 20341, 100391, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Baterai Eveready Kotak', 7, 13500, '-', 'Kasubag Umpeg', '2023-03-07', 94500, 'Pcs', '2024-07-14 15:57:51', '2024-07-14 15:57:51', 'pengelola@gmail.com', '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 2000342, 10002, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Paku 5cm', 1, 10000, 'Adum', '-', '2024-07-22', 10000, 'Pak', '2024-07-22 03:36:22', '2024-07-22 03:36:22', 'pengelola@gmail.com', '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 2000343, 10003, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Paku 7cm', 1, 10000, 'Kasi PM', '-', '2024-07-22', 10000, 'Berkas', '2024-07-22 03:37:20', '2024-07-22 03:37:20', 'pengelola@gmail.com', '5.1.02.01.01.0001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barangmasuk`
--

CREATE TABLE `barangmasuk` (
  `perangkat_daerah` varchar(255) NOT NULL,
  `id_transaksi_masuk` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jenis_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `jml_barang` int(11) NOT NULL,
  `jml_harga` int(11) NOT NULL,
  `harga_barang` int(11) NOT NULL,
  `jml_barang_awal` int(11) NOT NULL,
  `jml_harga_awal` int(11) NOT NULL,
  `ket` varchar(255) NOT NULL,
  `Tanggal` date NOT NULL,
  `dari` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `nomor_ba_penerimaan` varchar(255) DEFAULT NULL,
  `tanggal_ba_penerimaan` date DEFAULT NULL,
  `nomor_dokumen_faktur` varchar(255) DEFAULT NULL,
  `tanggal_dokumen_faktur` date DEFAULT NULL,
  `kode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `barangmasuk`
--

INSERT INTO `barangmasuk` (`perangkat_daerah`, `id_transaksi_masuk`, `id_barang`, `jenis_barang`, `nama_barang`, `jml_barang`, `jml_harga`, `harga_barang`, `jml_barang_awal`, `jml_harga_awal`, `ket`, `Tanggal`, `dari`, `satuan`, `created_at`, `updated_at`, `created_by`, `nomor_ba_penerimaan`, `tanggal_ba_penerimaan`, `nomor_dokumen_faktur`, `tanggal_dokumen_faktur`, `kode`) VALUES
('KECAMATAN ASTANAANYAR', 300332, 100407, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat/Bahan untuk Kegiatan Kantor Lainnya', 'Nutrisi AB Mix', 20, 1800000, 90000, 0, 0, 'Adum', '2023-05-05', 'GU 4', 'Set', '2024-06-28 15:26:25', '2024-06-30 12:05:03', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0036'),
('KECAMATAN ASTANAANYAR', 3000001, 10001, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Pelampung 3/4 Kuningan', 1, 85000, 85000, 0, 0, 'Adum', '2023-01-02', 'GU 1', 'Pcs', '2024-06-23 11:30:48', '2024-06-23 11:30:48', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000002, 10002, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Paku 5cm', 2, 20000, 10000, 0, 0, 'Adum', '2023-02-14', 'GU 2', 'Kg', '2024-06-23 11:32:01', '2024-06-23 11:32:01', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000003, 10003, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Paku 7cm', 2, 20000, 10000, 0, 0, 'Adum', '2023-02-14', 'GU 2', 'Kg', '2024-06-23 11:33:06', '2024-06-23 11:33:06', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000004, 10004, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Talang Air Pvc 4\"', 2, 150000, 75000, 0, 0, 'Adum', '2023-02-14', 'GU 2', 'Pcs', '2024-06-23 11:34:29', '2024-06-23 11:34:29', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000005, 10005, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Tutup Talang Pvc 4\"', 4, 20000, 5000, 0, 0, 'Adum', '2023-02-14', 'GU 2', 'Pcs', '2024-06-23 11:35:28', '2024-06-23 11:35:28', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000006, 10006, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Corong Talang Pvc 4\"', 2, 15000, 7500, 0, 0, 'Adum', '2023-02-14', 'GU 2', 'Pcs', '2024-06-23 11:36:38', '2024-06-23 11:36:38', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000007, 10007, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Ram Kawat Hijau 1.5 cm', 1, 125000, 125000, 0, 0, 'Adum', '2023-02-14', 'GU 2', 'Roll', '2024-06-23 11:37:51', '2024-06-23 11:37:51', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000008, 10008, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Amplas Kain 4\"', 1, 270000, 270000, 0, 0, 'Adum', '2023-02-14', 'GU 2', 'Roll', '2024-06-23 11:39:11', '2024-06-23 11:41:22', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000009, 10009, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Pylox', 1, 60000, 60000, 0, 0, 'Adum', '2023-02-14', 'GU 2', 'Pcs', '2024-06-23 11:42:31', '2024-06-23 11:42:31', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000010, 10010, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Handle', 1, 39000, 39000, 0, 0, 'Adum', '2023-02-14', 'GU 2', 'Pcs', '2024-06-23 11:43:27', '2024-06-23 11:43:27', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000011, 10011, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Linggis Besar', 5, 205500, 41100, 0, 0, 'Kasi Ekbang', '2023-02-15', 'GU 2', 'Pcs', '2024-06-23 11:44:38', '2024-06-23 11:44:38', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000012, 10012, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Fleksibel 30cm', 1, 25000, 25000, 0, 0, 'Adum', '2023-04-10', 'GU 5', 'Pcs', '2024-06-23 11:45:52', '2024-06-23 11:47:37', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000013, 10013, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Kran Wastapel DNDA', 1, 100000, 100000, 0, 0, 'Adum', '2023-04-10', 'GU 5', 'Pcs', '2024-06-23 11:47:23', '2024-06-23 11:47:23', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000014, 10014, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Aquaproof', 1, 60000, 60000, 0, 0, 'Adum', '2023-05-15', 'GU 5', 'Kg', '2024-06-23 11:48:53', '2024-06-23 11:48:53', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000015, 10015, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Kuas 3\"', 2, 14000, 7000, 0, 0, 'Adum', '2023-05-15', 'GU 5', 'Pcs', '2024-06-23 11:50:03', '2024-06-23 11:51:19', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000016, 10016, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Selup', 1, 7500, 7500, 0, 0, 'Adum', '2023-05-15', 'GU 5', 'Pcs', '2024-06-23 11:50:59', '2024-06-23 11:50:59', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000017, 10017, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Kunci Inggris', 1, 40000, 40000, 0, 0, 'Adum', '2023-05-15', 'GU 5', 'Pcs', '2024-06-23 11:52:44', '2024-06-23 11:52:44', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000018, 10018, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Siku Lubang 4x4', 4, 180000, 45000, 0, 0, 'Adum', '2023-05-22', 'GU 5', 'Batang', '2024-06-23 11:53:49', '2024-06-23 11:53:49', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000019, 10019, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'multi 9mm', 1, 120000, 120000, 0, 0, 'Adum', '2023-05-22', 'GU 5', 'Lembar', '2024-06-23 11:54:59', '2024-06-23 11:56:03', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000020, 10020, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Besi Siku Lubang', 6, 600000, 100000, 0, 0, 'Adum', '2023-05-22', 'GU 5', 'Pcs', '2024-06-23 11:57:19', '2024-06-23 11:57:19', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000021, 10021, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Baud Siku Lubang', 100, 100000, 1000, 0, 0, 'Adum', '2023-05-22', 'GU 5', 'Pcs', '2024-06-23 11:58:15', '2024-06-23 11:58:15', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000022, 10022, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Siku Plat Besi Lubang', 16, 40000, 2500, 0, 0, 'Adum', '2023-05-22', 'GU 5', 'Pcs', '2024-06-23 11:59:19', '2024-06-23 11:59:19', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000023, 10023, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Karet Besi Siku Lubang', 8, 20000, 2500, 0, 0, 'Adum', '2023-05-22', 'GU 5', 'Pcs', '2024-06-23 12:00:32', '2024-06-23 12:00:32', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000024, 10024, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Batu WD', 2, 10000, 5000, 0, 0, 'Adum', '2023-05-22', 'GU 5', 'Pcs', '2024-06-23 12:01:31', '2024-06-23 12:01:31', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000025, 10020, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Besi Siku Lubang', 6, 600000, 100000, 0, 0, 'Adum', '2023-05-22', 'GU 5', 'Pcs', '2024-06-23 12:02:43', '2024-06-23 12:02:43', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000026, 10025, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Triplek 9mm', 2, 240000, 120000, 0, 0, 'Adum', '2023-05-22', 'GU 5', 'Lembar', '2024-06-23 12:03:48', '2024-06-23 12:03:48', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000027, 10026, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Jasa Pembuatan Rak', 1, 300000, 300000, 0, 0, 'Adum', '2023-05-22', 'GU 5', 'Set', '2024-06-23 12:04:52', '2024-06-23 12:04:52', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000028, 10027, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Paralon  1/2 Rucika', 2, 46000, 23000, 0, 0, 'Adum', '2023-06-16', 'GU 5', 'Batang', '2024-06-23 12:05:58', '2024-06-23 12:05:58', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000029, 10028, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Koni 1/2', 6, 18000, 3000, 0, 0, 'Adum', '2023-06-16', 'GU 5', 'Pcs', '2024-06-23 12:06:54', '2024-06-23 12:06:54', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000030, 10029, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Kleman', 1, 10000, 10000, 0, 0, 'Adum', '2023-06-16', 'GU 5', 'Bungkus', '2024-06-23 12:08:03', '2024-06-23 12:08:03', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000031, 10030, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Lem Paralon', 1, 15000, 15000, 0, 0, 'Adum', '2023-06-16', 'GU 5', 'Pcs', '2024-06-23 12:08:58', '2024-06-23 12:08:58', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000032, 0, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Body Ses 30mm +Handle', 1, 250000, 250000, 0, 0, 'Adum', '2023-06-20', 'GU 5', 'Set', '2024-06-23 12:09:49', '2024-06-23 12:09:49', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000033, 10032, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'HDL Top Grande', 1, 60000, 60000, 0, 0, 'Adum', '2023-06-12', 'GU 5', 'Pcs', '2024-06-23 12:11:07', '2024-06-23 12:11:07', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000034, 10037, 'Belanja Bahan-Bahan Kimia', 'Kompos Daun', 10, 294000, 29400, 0, 0, 'Kasi Ekbang', '2023-02-28', 'GU 2', 'Buah', '2024-06-23 14:45:25', '2024-06-23 14:45:25', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0002'),
('KECAMATAN ASTANAANYAR', 3000035, 10038, 'Belanja Bahan-Bahan Kimia', 'Pupuk Kandang', 25, 1875000, 75000, 0, 0, 'Kasi Ekbang', '2023-02-28', 'GU 2', 'Karung', '2024-06-23 14:46:56', '2024-06-23 14:46:56', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0002'),
('KECAMATAN ASTANAANYAR', 3000036, 10039, 'Belanja Bahan-Bahan Kimia', 'Pupuk NPK', 1, 632500, 632500, 0, 0, 'Kasi Ekbang', '2023-02-28', 'GU2', 'Kg', '2024-06-23 14:48:19', '2024-06-23 14:48:19', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0002'),
('KECAMATAN ASTANAANYAR', 3000037, 10040, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [202 Liter x 2 Unit x3 Bulan]', 0, 0, 13900, 35, 486500, 'Sisa Saldo 2022', '2023-01-02', 'Sisa Saldo 2022', 'Liter', '2024-06-23 14:52:27', '2024-06-23 14:52:27', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 3000038, 10041, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [33.5 Liter x 20 Unit x3 Bulan]', 0, 0, 13900, 124, 1720900, 'Sisa Saldo 2022', '2023-01-02', 'Sisa Saldo 2022', 'Liter', '2024-06-23 14:54:38', '2024-06-23 14:54:38', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 3000039, 10042, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamina Dex [195 Literx 1 Unit x3 Bulan]', 600, 10050000, 16750, 0, 0, 'Adum', '2023-03-20', 'LS', 'Liter', '2024-06-23 15:10:27', '2024-06-23 16:42:14', 'pengelola@gmail.com', '001/FTK/CV.GPU/2023', '2023-04-04', '027/055-2.09.02/BASTHP-KEC.ANYAR/2023', '2023-03-20', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 3000040, 10043, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [225 Liter x 2Unit x3 Bulan]', 1200, 15360000, 12800, 0, 0, 'Adum', '2023-03-20', 'LS', 'Liter', '2024-06-23 16:04:23', '2024-06-23 16:41:36', 'pengelola@gmail.com', '001/FTK/CV.GPU/2023', '2023-04-04', '027/055-2.09.02/BASTHP-KEC.ANYAR/2023', '2023-03-20', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 3000041, 10044, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [37.5 Liter x 20Unit x 3 Bulan]', 2835, 36288000, 12800, 0, 0, 'Adum', '2023-03-20', 'LS', 'Liter', '2024-06-23 16:14:29', '2024-06-23 16:29:39', 'pengelola@gmail.com', '001/FTK/CV.GPU/2023', '2023-04-04', '027/055-2.09.02/BASTHP-KEC.ANYAR/2023', '2023-03-20', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 3000042, 10045, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [45 Liter x 9Unit x 3 Bulan]', 2652, 33945600, 12800, 0, 0, 'Adum', '2023-03-20', 'LS', 'Liter', '2024-06-23 16:44:28', '2024-06-23 16:44:28', 'pengelola@gmail.com', '001/FTK/CV.GPU/2023', '2023-04-04', '027/055-2.09.02/BASTHP-KEC.ANYAR/2023', '2023-03-20', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 3000043, 10046, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [150 Liter x 7Unit x 3 Bulan]', 1185, 15168000, 12800, 0, 0, 'Adum', '2023-03-20', 'LS', 'Liter', '2024-06-23 16:48:01', '2024-06-24 14:47:23', 'pengelola@gmail.com', '001/FTK/CV.GPU/2023', '2023-04-04', '027/055-2.09.02/BASTHP-KEC.ANYAR/2023', '2023-03-20', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 3000044, 10047, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamina Dex [195 Liter x 1Unit x 3 Bulan]', 600, 9240000, 15400, 0, 0, 'Adum', '2023-06-23', 'LS', 'Liter', '2024-06-23 16:51:07', '2024-06-23 16:51:07', 'pengelola@gmail.com', '002/FTK/CV.GPU/2023', '2023-06-23', '027/055-2.09.02.2/BASTHP-KEC.ANYAR/2023', '2023-06-23', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 3000045, 10048, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [225 Liter x 2Unit x 3 Bulan]', 1200, 15960000, 13300, 0, 0, 'Adum', '2023-06-23', 'LS', 'Liter', '2024-06-24 08:14:27', '2024-06-24 08:14:27', 'pengelola@gmail.com', '002/FTK/CV.GPU/2023', '2023-06-23', '027/055-2.09.02.2/BASTHP-KEC.ANYAR/2023', '2023-06-23', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 3000046, 10044, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [37.5 Liter x 20Unit x 3 Bulan]', 2835, 37705500, 13300, 0, 0, 'Adum', '2023-06-23', 'LS', 'Liter', '2024-06-24 08:16:03', '2024-06-24 08:21:16', 'pengelola@gmail.com', '002/FTK/CV.GPU/2023', '2023-06-23', '027/055-2.09.02.2/BASTHP-KEC.ANYAR/2023', '2023-06-23', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 3000047, 10045, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [45 Liter x 9Unit x 3 Bulan]', 2652, 35271600, 13300, 0, 0, 'Adum', '2023-06-23', 'LS', 'Liter', '2024-06-24 08:17:48', '2024-06-24 08:19:32', 'pengelola@gmail.com', '002/FTK/CV.GPU/2023', '2023-06-23', '027/055-2.09.02.2/BASTHP-KEC.ANYAR/2023', '2023-06-23', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 3000048, 10051, 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [150 Liter x 7 Unit x 3 Bulan]', 1185, 15760500, 13300, 0, 0, 'Adum', '2023-06-23', 'LS', 'Liter', '2024-06-24 08:22:27', '2024-06-24 15:11:54', 'pengelola@gmail.com', '002/FTK/CV.GPU/2023', '2023-06-23', '027/055-2.09.02.2/BASTHP-KEC.ANYAR/2023', '2023-06-23', '5.1.02.01.01.0004'),
('KECAMATAN ASTANAANYAR', 3000049, 10052, 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit Bayam', 7, 385000, 55000, 0, 0, 'Kasi Ekbang', '2023-02-28', 'GU 2', 'Sachet', '2024-06-24 08:26:13', '2024-06-24 08:26:13', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0008'),
('KECAMATAN ASTANAANYAR', 3000050, 10053, 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit cabe Rawit', 6, 390000, 65000, 0, 0, 'Kasi Ekbang', '2023-02-28', 'GU 2', 'Sachet', '2024-06-24 08:28:34', '2024-06-24 08:28:34', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0008'),
('KECAMATAN ASTANAANYAR', 3000051, 10054, 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit caisim', 6, 210000, 35000, 0, 0, 'Kasi Ekbang', '2023-02-28', 'GU 2', 'Sachet', '2024-06-24 08:29:37', '2024-06-24 08:29:37', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0008'),
('KECAMATAN ASTANAANYAR', 3000052, 10055, 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit Kangkung', 6, 345000, 57500, 0, 0, 'Kasi Ekbang', '2023-02-28', 'GU 2', 'Kg', '2024-06-24 08:30:58', '2024-07-01 11:29:04', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0008'),
('KECAMATAN ASTANAANYAR', 3000053, 10056, 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit pakcoy', 6, 210000, 35000, 0, 0, 'Kasi Ekbang', '2023-02-28', 'GU 2', 'Sachet', '2024-06-24 08:31:56', '2024-07-01 11:28:35', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0008'),
('KECAMATAN ASTANAANYAR', 3000054, 10062, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Spidol', 0, 0, 7500, 24, 180000, 'Saldo Akhir 2022', '2023-01-01', 'Saldo Akhir 2022', 'Pcs', '2024-06-24 08:39:27', '2024-07-05 16:28:13', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000055, 10063, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Ekspedisi 100 Lembar', 0, 0, 9000, 8, 72000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-24 08:40:35', '2024-06-24 08:40:35', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000056, 10064, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penghapus / Korektor', 0, 0, 6000, 8, 48000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-24 08:41:21', '2024-06-24 08:41:21', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000057, 10065, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Box File bindex', 0, 0, 31000, 8, 248000, 'Saldo Akhir 2022', '2023-01-24', 'Saldo Akhir 2022', 'Pcs', '2024-06-24 08:42:21', '2024-06-24 08:42:21', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000058, 10066, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Kwitansi', 0, 0, 5000, 14, 70000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-24 08:43:26', '2024-06-24 08:43:26', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000059, 10067, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas (Binder Clip)', 0, 0, 6000, 10, 60000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Box', '2024-06-24 08:44:40', '2024-06-24 08:44:40', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000061, 10069, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Isolasi Bening', 0, 0, 8500, 1, 8500, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-24 08:46:46', '2024-06-24 08:46:46', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000062, 10070, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler Besar', 0, 0, 58500, 6, 351000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-24 08:47:35', '2024-06-24 08:47:35', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000063, 10071, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pembolong Kertas Ukuran Besar', 0, 0, 36500, 3, 109500, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-24 08:48:27', '2024-06-24 08:48:27', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000064, 100262, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map plastik snechelter', 0, 0, 33000, 3, 99000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Lusin', '2024-06-24 08:49:27', '2024-06-24 11:46:12', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000065, 10073, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Gunting Kertas Sedang', 0, 0, 18000, 3, 54000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-24 08:50:31', '2024-06-24 08:50:31', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000066, 10074, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kertas HVS A4 70 Gsm', 0, 0, 52000, 5, 260000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Rim', '2024-06-24 08:52:03', '2024-06-24 08:52:03', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000067, 10075, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 0, 0, 22000, 4, 88000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Dus', '2024-06-24 08:52:56', '2024-06-24 08:52:56', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000068, 10076, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 0, 0, 15000, 5, 75000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Dus', '2024-06-24 08:53:44', '2024-06-24 15:21:27', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000069, 10077, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 0, 0, 30000, 3, 90000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Lusin', '2024-06-24 08:54:47', '2024-06-24 08:54:47', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000070, 10067, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas (Binder Clip)', 0, 0, 6000, 20, 120000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Box', '2024-06-24 08:56:08', '2024-06-24 08:56:08', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000071, 10067, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas (Binder Clip)', 0, 0, 12000, 8, 96000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Box', '2024-06-24 08:57:10', '2024-06-24 08:57:53', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000072, 10079, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'isi staples', 0, 0, 3000, 26, 78000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Box', '2024-06-24 08:58:42', '2024-06-24 08:58:42', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000073, 10080, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kertas Photo (Glosy isi 100 lbr 230 Gram', 0, 0, 70000, 1, 70000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pak', '2024-06-24 09:00:00', '2024-06-24 09:00:00', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000074, 10067, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas (Binder Clip)', 0, 0, 6000, 10, 60000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Box', '2024-06-24 09:01:12', '2024-06-24 09:01:12', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000075, 10081, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Ordnerd Bantex', 0, 0, 30000, 24, 720000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-24 09:02:02', '2024-06-24 09:02:02', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000076, 10082, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler Kecil', 0, 0, 13000, 6, 78000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-24 09:02:50', '2024-06-24 09:02:50', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000077, 10083, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kertas HVS F4 70 Gsm', 0, 0, 55000, 15, 825000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Rim', '2024-06-24 09:03:56', '2024-06-24 09:03:56', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000078, 10084, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 20, 340000, 17000, 0, 0, 'Adum', '2023-01-02', 'GU 1', 'Pak', '2024-06-24 09:05:47', '2024-06-24 10:31:18', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000079, 10085, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 10, 210000, 21000, 0, 0, 'Adum', '2023-01-02', 'GU 1', 'Pak', '2024-06-24 09:07:51', '2024-06-24 10:22:06', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000080, 10086, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Campus Kiky', 25, 575000, 23000, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pcs', '2024-06-24 09:10:31', '2024-06-24 09:10:31', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000081, 10087, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Folio', 10, 260000, 26000, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pcs', '2024-06-24 09:11:51', '2024-06-24 09:11:51', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000082, 10088, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Kwitansi Sinar Dunia 2 Ply', 10, 55000, 5500, 0, 0, 'Adum', '2023-01-02', 'GU 1', 'Pcs', '2024-06-24 09:13:14', '2024-06-24 09:13:14', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000083, 10089, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Cutter Kenko L-5000', 10, 155000, 15500, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pcs', '2024-06-24 09:13:59', '2024-06-24 09:13:59', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000084, 10090, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Isolasi Bening2', 16, 152000, 9500, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pcs', '2024-06-24 10:20:49', '2024-06-24 10:20:49', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000085, 10091, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Label FOX 121/103', 25, 125000, 5000, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pad', '2024-06-24 11:27:48', '2024-06-24 11:27:48', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000086, 10092, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Lem UHU Stick Besar', 12, 312000, 26000, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pcs', '2024-06-24 11:29:28', '2024-06-24 11:29:28', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000087, 10093, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Lem UHU Stick Kecil', 24, 204000, 8500, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pcs', '2024-06-24 11:30:33', '2024-06-24 11:30:33', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000088, 10094, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map Bussiness F4', 25, 130000, 5200, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Lusin', '2024-06-24 11:31:46', '2024-06-24 11:31:46', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000089, 10072, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map plastik snechelter', 20, 700000, 35000, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Lusin', '2024-06-24 11:36:24', '2024-06-24 11:36:24', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000090, 10095, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Ordnerd Bantex', 36, 1260000, 35000, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pcs', '2024-06-24 11:47:59', '2024-06-24 11:47:59', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000091, 10096, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 25, 75000, 3000, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pak', '2024-06-24 11:49:51', '2024-06-24 11:49:51', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000092, 10097, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 20, 120000, 6000, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pak', '2024-06-24 11:50:55', '2024-06-24 11:50:55', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000093, 10098, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 20, 370000, 18500, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pak', '2024-06-24 11:51:56', '2024-06-24 11:51:56', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000094, 10099, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 20, 254000, 12700, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pak', '2024-06-24 11:52:48', '2024-06-24 11:52:48', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000095, 10100, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 653 (Size 34,9 x 47,6 mm)', 10, 62000, 6200, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pad', '2024-06-24 11:55:15', '2024-06-24 11:55:15', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000096, 10101, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 654 (Size 76 x 76 mm)', 10, 115000, 11500, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pad', '2024-06-24 11:56:27', '2024-06-24 11:56:27', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000097, 10102, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it  655 (Size 73 x 123 mm)', 10, 170000, 17000, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pad', '2024-06-24 11:57:39', '2024-06-24 11:57:39', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000098, 10103, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 5, 83000, 16600, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Lusin', '2024-06-24 11:59:25', '2024-06-24 11:59:25', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000099, 10104, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 12, 108000, 9000, 0, 0, 'Adum', '2023-01-24', 'GU 1', 'Pcs', '2024-06-24 12:00:38', '2024-06-24 12:00:38', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000100, 10105, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 12, 360000, 30000, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pcs', '2024-06-24 12:01:54', '2024-06-24 12:01:54', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000101, 10062, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Spidol', 48, 360000, 7500, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pcs', '2024-06-24 12:05:50', '2024-06-24 12:05:50', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000102, 10106, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler', 20, 1140000, 57000, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pcs', '2024-06-24 12:07:31', '2024-06-24 12:07:31', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000103, 100107, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler', 5, 70000, 14000, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pcs', '2024-06-24 12:08:42', '2024-06-24 12:08:42', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000104, 100108, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stop Map Biasa', 10, 260000, 26000, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pak', '2024-06-24 12:10:00', '2024-06-24 12:10:00', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000105, 100109, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'pajak', 1, 882750, 882750, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Berkas', '2024-06-24 12:11:01', '2024-06-24 12:11:01', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000106, 100110, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Hvs Wama', 1, 56000, 56000, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Rim', '2024-06-24 12:12:11', '2024-06-24 12:12:11', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000107, 100111, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 1, 7000, 7000, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Pcs', '2024-06-24 12:13:24', '2024-06-24 12:13:24', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000108, 100112, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Goodybag Musrenbang', 100, 1400000, 14000, 0, 0, 'Kasi Ekbang', '2023-02-06', 'GU 1', 'Pcs', '2024-06-24 12:14:34', '2024-06-24 12:14:34', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000109, 100110, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Hvs Wama', 5, 280000, 56000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Rim', '2024-06-24 12:15:59', '2024-06-24 12:19:23', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000110, 100113, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'isi Stapler no 10', 20, 90000, 4500, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pak', '2024-06-24 12:18:25', '2024-06-24 12:18:25', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000111, 100114, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'isi staples', 20, 50000, 2500, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pak', '2024-06-24 12:20:38', '2024-06-24 12:20:38', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000112, 100115, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Isolasi Bening3', 12, 60000, 5000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pcs', '2024-06-24 12:21:58', '2024-06-24 12:21:58', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000113, 100116, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kenko OPP Packing Tape', 12, 144000, 12000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pcs', '2024-06-24 12:23:14', '2024-06-24 12:23:14', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000114, 100117, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kertas Sertifikat', 3, 201000, 67000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pak', '2024-06-24 12:24:37', '2024-06-24 12:24:37', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000115, 100118, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'kertas stiker', 3, 93000, 31000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pak', '2024-06-24 12:26:02', '2024-06-24 12:26:02', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000116, 100119, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Lakban Hitam 2\"', 6, 90000, 15000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pcs', '2024-06-24 12:27:08', '2024-06-24 12:27:08', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000117, 100120, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Nachi Tape', 12, 42000, 3500, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pcs', '2024-06-24 12:28:18', '2024-06-24 12:28:18', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000118, 100121, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penggaris Stainles', 6, 54000, 9000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pcs', '2024-06-24 12:30:22', '2024-06-24 12:30:22', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000119, 10096, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 20, 60000, 3000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pak', '2024-06-24 12:31:31', '2024-06-24 12:31:31', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000120, 10097, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 20, 120000, 6000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pak', '2024-06-24 12:32:40', '2024-06-24 12:33:22', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000121, 10098, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 10, 185000, 18500, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pak', '2024-06-24 12:34:23', '2024-06-24 12:34:23', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000122, 10099, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 10, 127000, 12700, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pak', '2024-06-24 12:35:43', '2024-06-24 12:35:43', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000123, 10100, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 653 (Size 34,9 x 47,6 mm)', 10, 62000, 6200, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pad', '2024-06-24 12:36:51', '2024-06-24 12:36:51', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000124, 10101, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 654 (Size 76 x 76 mm)', 10, 115000, 11500, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pad', '2024-06-24 12:37:48', '2024-06-24 12:37:48', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000125, 10102, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it  655 (Size 73 x 123 mm)', 10, 170000, 17000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pad', '2024-06-24 12:38:43', '2024-06-24 12:38:43', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000126, 10103, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 10, 166000, 16600, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Lusin', '2024-06-24 12:39:53', '2024-06-24 12:39:53', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000127, 10104, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 10, 90000, 9000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pcs', '2024-06-24 12:41:18', '2024-06-24 12:41:18', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000128, 10105, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 10, 300000, 30000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pcs', '2024-06-24 12:42:24', '2024-06-24 12:42:24', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000129, 100122, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 5, 875000, 175000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Lusin', '2024-06-24 12:43:31', '2024-06-24 12:43:31', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000130, 100123, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Spare Blade Kenko', 5, 36000, 7200, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pcs', '2024-06-24 12:44:43', '2024-06-24 12:44:43', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000131, 100124, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Spidol Emas / Perak / Putih', 6, 93000, 15500, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pcs', '2024-06-24 12:45:41', '2024-06-24 12:45:41', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000132, 100125, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stabilo', 20, 188000, 9400, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pcs', '2024-06-24 12:46:56', '2024-06-24 12:46:56', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000133, 100107, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler', 10, 140000, 14000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pcs', '2024-06-24 12:47:58', '2024-06-24 12:47:58', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000134, 100108, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stop Map Biasa', 20, 520000, 26000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pak', '2024-06-24 12:49:16', '2024-06-24 12:49:41', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000135, 100126, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stop Map Buffalo', 5, 392500, 78500, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pak', '2024-06-24 12:50:48', '2024-06-24 12:50:48', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000136, 100127, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'pajak', 1, 521785, 521785, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Berkas', '2024-06-24 12:52:03', '2024-06-24 12:52:03', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000137, 100128, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Cek', 1, 250000, 250000, 0, 0, 'Adum', '2023-05-04', 'GU 4', 'Buku', '2024-06-24 13:10:44', '2024-06-24 13:10:44', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000138, 100129, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 20, 377400, 18870, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Dus', '2024-06-24 13:12:07', '2024-06-24 13:12:07', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000139, 100130, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 10, 233100, 23310, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Dus', '2024-06-24 13:13:17', '2024-06-24 13:13:17', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000140, 100131, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Kwitansi Sinar Dunia 2 Ply', 25, 152625, 6105, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Pcs', '2024-06-24 13:14:36', '2024-06-24 13:14:36', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000141, 100132, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Hvs Warna', 15, 924075, 61605, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Rim', '2024-06-24 13:17:57', '2024-06-24 13:17:57', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000142, 100133, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kertas Sertifikat', 5, 371850, 74370, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'pack', '2024-06-24 13:19:16', '2024-06-24 13:19:16', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000143, 100134, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Lem UHU Stick Besar', 12, 339660, 28305, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'buah', '2024-06-24 13:20:40', '2024-06-24 13:20:40', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000144, 100135, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Lem UHU Stick Kecil', 12, 113220, 9435, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'buah', '2024-06-24 13:21:37', '2024-06-24 13:21:37', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000145, 100136, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map Bussiness F4', 25, 144300, 5772, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Pcs', '2024-06-24 13:23:21', '2024-06-24 13:23:21', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000146, 100137, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map plastik snechelter', 20, 754800, 37740, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Lusin', '2024-06-24 13:24:26', '2024-06-24 13:24:26', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000147, 100138, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Ordnerd Bantex', 24, 932400, 38850, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Pcs', '2024-06-24 13:25:38', '2024-06-24 13:25:38', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000148, 100139, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penggaris Stainles', 10, 99900, 9990, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Pcs', '2024-06-24 13:26:37', '2024-06-24 13:26:37', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000149, 100140, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 20, 66600, 3330, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Box', '2024-06-24 13:27:59', '2024-06-24 13:27:59', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000150, 100141, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 20, 133200, 6660, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Box', '2024-06-24 13:29:51', '2024-06-24 13:29:51', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000151, 100142, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 10, 205350, 20535, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Box', '2024-06-24 13:31:47', '2024-06-24 13:31:47', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000152, 100143, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 10, 138750, 13875, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Box', '2024-06-24 13:32:58', '2024-06-24 13:32:58', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000153, 100144, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pensil', 2, 71040, 35520, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Lusin', '2024-06-24 13:34:09', '2024-06-24 13:34:09', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000154, 100145, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 653 (Size 34,9 x 47,6 mm)', 5, 34410, 6882, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Pad', '2024-06-24 13:35:15', '2024-06-24 13:35:15', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000155, 100146, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 654 (Size 76 x 76 mm)', 5, 63825, 12765, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Pad', '2024-06-24 13:36:12', '2024-06-24 13:36:12', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000156, 100147, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it  655 (Size 73 x 123 mm)', 5, 94350, 18870, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Pad', '2024-06-24 13:37:12', '2024-06-24 13:37:12', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000157, 100148, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'pulpen', 5, 88800, 17760, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Lusin', '2024-06-24 13:38:48', '2024-06-24 13:38:48', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000158, 100149, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'pulpen', 5, 49950, 9990, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Pcs', '2024-06-24 13:40:02', '2024-06-24 13:49:00', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000159, 100150, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 5, 166500, 33300, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Pcs', '2024-06-24 13:41:54', '2024-06-24 13:49:45', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000160, 100151, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stabilo', 20, 199800, 9990, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Pcs', '2024-06-24 13:43:16', '2024-06-24 13:50:20', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000161, 100152, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler', 6, 379620, 63270, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Pcs', '2024-06-24 13:44:26', '2024-06-24 13:50:59', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000162, 100153, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler', 20, 299700, 14985, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Pcs', '2024-06-24 13:45:40', '2024-06-24 13:52:17', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000163, 100154, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stop Map Biasa', 10, 288600, 28860, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Pack', '2024-06-24 13:53:12', '2024-06-24 13:53:12', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024');
INSERT INTO `barangmasuk` (`perangkat_daerah`, `id_transaksi_masuk`, `id_barang`, `jenis_barang`, `nama_barang`, `jml_barang`, `jml_harga`, `harga_barang`, `jml_barang_awal`, `jml_harga_awal`, `ket`, `Tanggal`, `dari`, `satuan`, `created_at`, `updated_at`, `created_by`, `nomor_ba_penerimaan`, `tanggal_ba_penerimaan`, `nomor_dokumen_faktur`, `tanggal_dokumen_faktur`, `kode`) VALUES
('KECAMATAN ASTANAANYAR', 3000164, 100263, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Kertas HVS A4 70 Gsm', 20, 1043400, 52170, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Rim', '2024-06-25 11:13:14', '2024-06-25 11:13:14', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0025'),
('KECAMATAN ASTANAANYAR', 3000165, 100264, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Kertas HVS F4 70 Gsm', 130, 7936500, 61050, 0, 0, 'Adum', '2023-01-14', 'GU 1', 'Rim', '2024-06-25 11:14:35', '2024-06-25 11:14:35', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0025'),
('KECAMATAN ASTANAANYAR', 3000166, 100263, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Kertas HVS A4 70 Gsm', 15, 782550, 52170, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Rim', '2024-06-25 11:16:00', '2024-06-25 11:22:31', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0025'),
('KECAMATAN ASTANAANYAR', 3000167, 100264, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Kertas HVS F4 70 Gsm', 70, 4273500, 61050, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Rim', '2024-06-25 11:17:28', '2024-06-25 11:22:05', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0025'),
('KECAMATAN ASTANAANYAR', 3000168, 100263, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Kertas HVS A4 70 Gsm', 10, 521700, 52170, 0, 0, 'Adum', '2023-05-24', 'GU 5', 'Rim', '2024-06-25 11:18:41', '2024-06-25 11:21:14', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0025'),
('KECAMATAN ASTANAANYAR', 3000169, 100264, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Kertas HVS F4 70 Gsm', 65, 3968250, 61050, 0, 0, 'Adum', '2023-05-24', 'GU 5', 'Rim', '2024-06-25 11:20:40', '2024-06-25 11:21:40', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0025'),
('KECAMATAN ASTANAANYAR', 3000170, 100265, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Kop Surat Dinas', 0, 0, 63500, 20, 1270000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Rim', '2024-06-25 11:27:18', '2024-06-25 11:27:18', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000171, 100266, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Dus Arsip', 0, 0, 20000, 200, 4000000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Buah', '2024-06-25 11:28:39', '2024-06-25 11:28:39', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000172, 100267, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Map Design', 0, 0, 7770, 1000, 7770000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Lembar', '2024-06-25 11:30:00', '2024-06-25 11:30:00', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000173, 100268, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 218, 109000, 500, 0, 0, 'Adum', '2023-01-13', 'GU 1', 'Lembar', '2024-06-25 11:31:26', '2024-06-25 11:31:26', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000174, 100269, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Jilid Soft Cover', 1, 25000, 25000, 0, 0, 'Adum', '2023-01-13', 'GU 1', 'Berkas', '2024-06-25 11:33:00', '2024-06-25 11:33:00', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000175, 100270, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan dan jilid LAKIP Tahunan', 1, 240000, 240000, 0, 0, 'Adum', '2023-01-27', 'GU 1', 'Berkas', '2024-06-25 11:34:20', '2024-06-25 11:34:20', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000176, 100271, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan dan jilid Laporan Keuangan', 1, 174000, 174000, 0, 0, 'Adum', '2023-01-20', 'GU 1', 'Berkas', '2024-06-25 11:36:02', '2024-06-25 11:36:02', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000177, 100272, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Jilid Soft Cover', 1, 14000, 14000, 0, 0, 'Adum', '2023-01-20', 'GU 1', 'Berkas', '2024-06-25 11:37:40', '2024-06-25 11:37:40', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000178, 100273, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan dan jilid LAKIP TW 4', 1, 152250, 152250, 0, 0, 'Adum', '2023-01-10', 'GU 1', 'Berkas', '2024-06-25 11:38:49', '2024-06-25 11:38:49', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000179, 100274, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Jilid dan Foto Copy', 1, 117500, 117500, 0, 0, 'Adum', '2023-01-17', 'GU 1', 'Berkas', '2024-06-25 11:39:53', '2024-06-25 11:39:53', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000180, 100275, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 184, 46000, 250, 0, 0, 'Kasi Ekbang', '2023-02-06', 'GU 1', 'Buku', '2024-06-25 11:41:36', '2024-06-25 11:41:36', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000181, 100276, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Cetak Buku Materi Munsrenbang', 100, 2400000, 24000, 0, 0, 'Kasi Ekbang', '2023-02-06', 'GU 1', 'Buku', '2024-06-25 11:43:02', '2024-06-25 11:43:02', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000182, 100277, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk Munsrenbang', 2, 384000, 192000, 0, 0, 'Kasi Ekbang', '2023-02-06', 'GU 1', 'Pcs', '2024-06-25 11:44:32', '2024-06-25 11:44:32', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000183, 100278, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'spanduk', 1, 240000, 240000, 0, 0, 'Kasi PM', '2023-02-01', 'GU 1', 'Pcs', '2024-06-25 11:46:01', '2024-06-25 11:46:01', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000184, 100279, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 1, 497500, 497500, 0, 0, 'Adum', '2023-02-16', 'GU 2', 'Berkas', '2024-06-25 11:47:39', '2024-06-25 11:47:39', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000185, 100280, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Cetak Stiker', 500, 2775000, 5550, 0, 0, 'Adum', '2023-02-16', 'GU 2', 'Lembar', '2024-06-25 11:49:15', '2024-06-25 11:49:15', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000186, 100281, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Belanja cetak Map Design', 2000, 15540000, 7770, 0, 0, 'Adum', '2023-02-16', 'GU 2', 'Lembar', '2024-06-25 11:50:32', '2024-06-27 14:26:03', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000187, 100282, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Dus Arsip', 300, 6660000, 22200, 0, 0, 'Adum', '2023-02-16', 'GU 2', 'Buah', '2024-06-25 11:51:55', '2024-06-25 11:51:55', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000188, 100283, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Amplop', 20, 2009100, 100455, 0, 0, 'Adum', '2023-02-16', 'GU 2', 'Dus', '2024-06-25 11:53:23', '2024-06-25 11:53:23', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000189, 100284, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 15, 480000, 32000, 0, 0, 'Kasi Ekbang', '2023-02-28', 'GU 2', 'Meter', '2024-06-25 11:55:30', '2024-06-25 11:55:30', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000190, 100275, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 124, 31000, 250, 0, 0, 'Kasi Ekbang', '2023-02-28', 'GU 2', 'Lembar', '2024-06-25 11:56:48', '2024-06-25 11:56:48', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000191, 100285, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 1, 118750, 118750, 0, 0, 'Adum', '2023-03-15', 'GU 3', 'Berkas', '2024-06-25 12:00:15', '2024-06-25 12:00:15', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000192, 100286, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 1, 50000, 50000, 0, 0, 'Adum', '2023-03-15', 'GU 3', 'Berkas', '2024-06-25 12:01:26', '2024-06-25 12:01:26', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000193, 100287, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 1, 60000, 60000, 0, 0, 'Adum', '2023-02-17', 'GU 3', 'Berkas', '2024-06-25 12:03:01', '2024-06-25 12:03:01', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000194, 100288, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 1, 235000, 235000, 0, 0, 'Adum', '2023-03-27', 'GU 3', 'Berkas', '2024-06-25 12:04:26', '2024-06-25 12:04:26', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000195, 100289, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk Sertijab', 1, 630000, 630000, 0, 0, 'Adum', '2023-03-04', 'GU 3', 'Kegiatan', '2024-06-25 12:06:27', '2024-06-25 12:06:27', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000196, 100290, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan Monev IKI TW 1', 1, 75000, 75000, 0, 0, 'Adum', '2023-03-04', 'GU 3', 'Berkas', '2024-06-25 12:08:11', '2024-06-25 12:08:11', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000197, 100291, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan Monev LAKIP TW !', 1, 245000, 245000, 0, 0, 'Adum', '2023-03-20', 'GU 3', 'Berkas', '2024-06-25 12:09:27', '2024-06-25 12:09:27', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000198, 100292, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 1, 180000, 180000, 0, 0, 'Kasi Pem', '2023-03-16', 'GU 3', 'Pcs', '2024-06-25 12:11:02', '2024-06-25 12:11:02', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000199, 100292, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 1, 180000, 180000, 0, 0, 'Kasi PM', '2023-03-07', 'GU 3', 'Pcs', '2024-06-25 12:12:17', '2024-06-25 12:12:17', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000200, 100293, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 1, 163500, 163500, 0, 0, 'Adum', '2023-04-12', 'GU 4', 'Berkas', '2024-06-25 12:14:09', '2024-06-25 12:14:09', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000201, 100275, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 720, 180000, 250, 0, 0, 'Kasi PM', '2023-04-12', 'GU 4', 'Lembar', '2024-06-25 12:16:09', '2024-06-25 12:16:09', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000202, 100294, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 7, 1470000, 210000, 0, 0, 'Kasi PM', '2023-04-12', 'GU 4', 'Kegiatan', '2024-06-25 12:17:44', '2024-06-25 12:17:44', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000203, 100295, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk Rakor dan Haibil', 1, 720000, 720000, 0, 0, 'Adum', '2023-05-10', 'GU 5', 'Kegiatan', '2024-06-25 12:19:11', '2024-06-25 12:19:11', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000204, 100296, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk Sosialisasi SPI KPK', 1, 840000, 840000, 0, 0, 'Adum', '2023-06-09', 'GU 5', 'Kegiatan', '2024-06-25 12:20:38', '2024-06-25 12:20:38', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000205, 100297, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Banner dan Spanduk', 1, 350000, 350000, 0, 0, 'Adum', '2023-05-22', 'GU 5', 'Kegiatan', '2024-06-25 12:21:58', '2024-06-25 12:21:58', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000206, 100298, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan RKA Pergeseran 2 Tahun 2023', 1, 306000, 306000, 0, 0, 'Adum', '2023-06-09', 'GU 5', 'Kegiatan', '2024-06-25 12:23:05', '2024-06-25 12:23:05', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000207, 100299, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan DPPA Pergeseran 2 Tahun 2023', 1, 430000, 430000, 0, 0, 'Adum', '2023-06-06', 'GU 5', 'Kegiatan', '2024-06-25 12:23:57', '2024-06-25 12:23:57', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000208, 100300, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan LK Audited', 1, 165000, 165000, 0, 0, 'Adum', '2023-06-16', 'GU 5', 'Kegiatan', '2024-06-25 12:25:04', '2024-06-25 12:25:04', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000209, 100301, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'X Banner dan Spanduk', 1, 330000, 330000, 0, 0, 'Kasi Pem', '2023-06-19', 'GU 5', 'Set', '2024-06-25 12:26:27', '2024-06-25 12:26:27', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000210, 100302, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 1, 150000, 150000, 0, 0, 'Kasi Kesos', '2023-06-21', 'GU 5', 'Pcs', '2024-06-25 12:27:58', '2024-06-25 12:27:58', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000211, 100303, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 5, 300000, 60000, 0, 0, 'Kasi PM', '2023-05-05', 'GU 5', 'Pcs', '2024-06-25 12:29:15', '2024-06-25 12:29:15', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000212, 100304, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Foto Cofy', 1300, 325000, 250, 0, 0, 'Kasi PM', '2023-06-16', 'GU 5', 'Lembar', '2024-06-25 12:31:01', '2024-06-25 12:31:01', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0026'),
('KECAMATAN ASTANAANYAR', 3000213, 100305, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Benda Pos', 'Materai', 20, 200000, 10000, 0, 0, 'Adum', '2023-02-14', 'GU 1', 'Pcs', '2024-06-25 12:32:59', '2024-06-25 12:32:59', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0027'),
('KECAMATAN ASTANAANYAR', 3000214, 100305, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Benda Pos', 'Materai', 20, 200000, 10000, 0, 0, 'Adum', '2023-02-26', 'GU 2', 'Pcs', '2024-06-25 12:34:05', '2024-06-25 12:34:05', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0027'),
('KECAMATAN ASTANAANYAR', 3000215, 100305, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Benda Pos', 'Materai', 20, 200000, 10000, 0, 0, 'Adum', '2023-03-17', 'GU 3', 'Pcs', '2024-06-25 12:35:03', '2024-06-27 14:32:14', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0027'),
('KECAMATAN ASTANAANYAR', 3000216, 100305, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Benda Pos', 'Materai', 20, 200000, 10000, 0, 0, 'Adum', '2023-03-31', 'GU 3', 'Pcs', '2024-06-25 12:35:51', '2024-06-25 12:35:51', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0027'),
('KECAMATAN ASTANAANYAR', 3000217, 100305, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Benda Pos', 'Materai', 25, 250000, 10000, 0, 0, 'Adum', '2023-04-04', 'GU 4', 'Pcs', '2024-06-25 12:36:45', '2024-06-27 14:33:48', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0027'),
('KECAMATAN ASTANAANYAR', 3000218, 100306, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Tinta brother', 15, 1875000, 125000, 0, 0, 'Adum', '2023-03-27', 'GU 3', 'Pcs', '2024-06-25 12:39:15', '2024-06-25 12:39:15', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 3000219, 100307, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Mouse', 6, 1320000, 220000, 0, 0, 'Adum', '2023-03-27', 'GU 3', 'Pcs', '2024-06-25 12:40:32', '2024-06-25 12:40:32', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 3000220, 100308, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Kabel Hub', 1, 146100, 146100, 0, 0, 'Adum', '2023-03-27', 'GU 3', 'Pcs', '2024-06-25 12:41:52', '2024-06-25 12:41:52', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 3000221, 100309, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Tinta', 6, 765000, 127500, 0, 0, 'Adum', '2023-03-03', 'GU 3', 'Pcs', '2024-06-25 12:43:16', '2024-06-25 12:43:16', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 3000222, 100309, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Tinta', 6, 765000, 127500, 0, 0, 'Adum', '2023-03-15', 'GU 3', 'Pcs', '2024-06-25 12:44:51', '2024-06-25 12:44:51', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 3000223, 100310, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Flash Disk', 5, 60000, 12000, 0, 0, 'Adum', '2023-03-03', 'GU 3', 'Pcs', '2024-06-25 12:46:01', '2024-06-25 12:46:01', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 3000224, 100311, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Tinta Printer HP GT53', 1, 190000, 190000, 0, 0, 'Adum', '2023-06-07', 'GU 5', 'Pcs', '2024-06-25 12:47:33', '2024-06-25 12:47:33', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 3000225, 100312, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Tinta Printer Epson', 1, 170000, 170000, 0, 0, 'Adum', '2023-06-07', 'GU 5', 'Pcs', '2024-06-25 12:48:48', '2024-06-25 12:48:48', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0029'),
('KECAMATAN ASTANAANYAR', 3000226, 100313, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'SOS PL Sereh B800', 0, 0, 14750, 2, 29500, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-25 12:50:43', '2024-06-25 13:09:53', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000227, 100314, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Swallow TCB', 0, 0, 16613, 4, 66452, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-28 14:15:18', '2024-06-28 14:15:18', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000228, 100315, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Cling PK KNGPWP425ml', 0, 0, 8950, 1, 8950, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-25 12:53:08', '2024-06-25 13:08:58', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000229, 100316, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Porstex', 0, 0, 17750, 3, 53250, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-25 12:54:05', '2024-06-25 13:08:35', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000230, 100317, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella Mat Orange, Apple, Green', 0, 0, 58250, 2, 116500, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-25 12:55:11', '2024-06-25 13:08:12', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000231, 100318, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stel1a MAT Caffe', 0, 0, 60950, 2, 121900, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-25 12:58:32', '2024-06-25 13:07:23', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000232, 100375, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sunlight Lime B750', 0, 0, 38850, 4, 155400, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-25 12:59:35', '2024-06-25 13:06:53', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000233, 100382, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'stela Met Caffe', 0, 0, 63950, 1, 63950, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-25 13:01:40', '2024-06-25 13:06:31', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000234, 100319, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'KMT Plas Chamois', 0, 0, 26200, 5, 131000, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-25 13:02:55', '2024-06-25 13:06:06', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000235, 100320, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella Mat Green', 0, 0, 60638, 2, 121276, 'Saldo Akhir 2022', '2023-01-02', 'Saldo Akhir 2022', 'Pcs', '2024-06-25 13:03:55', '2024-06-25 13:05:43', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000236, 100321, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Panci', 1, 35000, 35000, 0, 0, 'Adum', '2023-01-17', 'GU 1', 'Pcs', '2024-06-25 13:05:16', '2024-06-25 13:05:16', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000237, 100322, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Katel', 1, 35000, 35000, 0, 0, 'Adum', '2023-01-17', 'GU 1', 'Pcs', '2024-06-25 13:11:09', '2024-06-25 13:11:09', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000238, 100323, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Centong Nasi', 1, 20000, 20000, 0, 0, 'Adum', '2023-01-17', 'GU 1', 'Pcs', '2024-06-25 13:12:05', '2024-06-25 13:12:05', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000239, 100324, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Centong Sayur', 1, 27000, 27000, 0, 0, 'Adum', '2023-01-17', 'GU 1', 'Pcs', '2024-06-25 13:13:11', '2024-06-25 13:13:11', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000240, 100325, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Serok Penggorengan', 1, 20000, 20000, 0, 0, 'Adum', '2023-01-17', 'GU 1', 'Pcs', '2024-06-25 13:17:56', '2024-06-25 13:17:56', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000241, 100326, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Scotchbrite ID37', 1, 15900, 15900, 0, 0, 'Adum', '2023-01-17', 'GU 1', 'Pcs', '2024-06-25 13:19:01', '2024-06-25 13:19:01', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000242, 100327, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Scotchbritess3X4D30R', 2, 29800, 14900, 0, 0, 'Adum', '2024-02-07', 'GU 1', 'Pcs', '2024-06-25 13:20:19', '2024-06-25 13:21:10', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000243, 100328, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Swallow Deo Orange', 1, 11858, 11858, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:22:28', '2024-06-25 13:22:28', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000244, 100329, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Swallow TBC', 5, 83065, 16613, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:23:56', '2024-06-25 13:23:56', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000245, 100330, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Dahlia TBC Bouquet 6', 3, 65850, 21950, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:25:06', '2024-06-25 13:25:06', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000246, 100331, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Macan Sikat 50S', 2, 27000, 13500, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:26:18', '2024-06-25 13:26:18', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000247, 100332, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Swallow Deo Lemon', 1, 13930, 13930, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:27:37', '2024-06-25 13:27:37', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000248, 100333, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Lap Piring', 2, 27184, 13592, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:29:40', '2024-06-25 13:29:40', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000249, 100315, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Cling PK KNGPWP425ml', 2, 17900, 8950, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:31:04', '2024-06-25 13:31:04', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000250, 100334, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Kit Wash and Glow 400ml', 1, 5849, 5849, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:32:20', '2024-06-25 13:34:14', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000251, 100335, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'KMT Plass Chamois', 2, 51800, 25900, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:33:54', '2024-06-25 13:33:54', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000252, 100336, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Baygon AE Garden 600', 1, 29900, 29900, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:36:01', '2024-06-25 13:36:01', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000253, 100337, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Peace PL Sereh 5L', 1, 80300, 80300, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:37:23', '2024-06-25 13:37:23', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000254, 100338, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Tessa TP_06 BND 200S', 6, 90240, 15040, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:38:43', '2024-06-25 13:38:43', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000255, 100339, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Mitu Wet Lemon BTL', 3, 42900, 14300, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:40:08', '2024-06-25 13:40:08', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000256, 100340, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Dahlia TCB 5S', 2, 43900, 21950, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:41:18', '2024-06-25 13:41:18', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000257, 100341, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Baygon AE 600', 5, 182250, 36450, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:42:27', '2024-06-25 13:42:27', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000258, 100342, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'sunlight Lime B750', 5, 133750, 26750, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:43:46', '2024-06-25 13:43:46', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000259, 100343, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Porstex WB Ungu 1lt', 4, 71000, 17750, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:50:24', '2024-06-25 13:50:24', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000260, 100335, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'KMT Plass Chamois', 6, 155400, 25900, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:51:55', '2024-06-25 13:51:55', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000261, 100345, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Paseo 250s', 5, 45000, 9000, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:52:49', '2024-06-25 13:52:49', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000262, 100341, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Baygon AE 600', 6, 218700, 36450, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:53:48', '2024-06-25 13:53:48', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000263, 100342, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'sunlight Lime B750', 5, 133750, 26750, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:54:50', '2024-06-25 13:54:50', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000264, 100343, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Porstex WB Ungu 1lt', 4, 71000, 17750, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:56:02', '2024-06-25 13:56:02', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000265, 100335, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'KMT Plass Chamois', 6, 155400, 25900, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:57:07', '2024-06-25 13:57:07', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000266, 100346, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Antis Gel Nipis 5Lt', 1, 349500, 349500, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Galon', '2024-06-25 13:58:11', '2024-06-25 13:58:11', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000267, 100347, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Swallow Deo Orange', 1, 13000, 13000, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-06-25 13:59:24', '2024-06-25 13:59:24', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000268, 100348, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella Pewangi Ruangan', 1, 29000, 29000, 0, 0, 'Adum', '2024-02-22', 'GU 2', 'Pcs', '2024-06-25 14:00:20', '2024-06-25 14:05:18', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000269, 100349, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sendok Makan', 1, 30000, 30000, 0, 0, 'Adum', '2023-02-22', 'GU 2', 'Lusin', '2024-06-25 14:01:15', '2024-06-25 14:05:49', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000270, 100350, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Piring Makan', 1, 125000, 125000, 0, 0, 'Adum', '2023-02-07', 'GU 2', 'Lusin', '2024-06-25 14:02:01', '2024-06-25 14:06:04', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000271, 100351, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Gelas Ug Kaca', 1, 35000, 35000, 0, 0, 'Adum', '2023-02-07', 'GU 2', 'Pcs', '2024-06-25 14:02:59', '2024-06-25 14:06:18', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000272, 100352, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sapu Ijuk Ikat Besar', 6, 300000, 50000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pcs', '2024-06-25 14:04:36', '2024-06-25 14:04:36', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000273, 100353, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sikat Ijuk', 6, 105000, 17500, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pcs', '2024-06-25 14:07:33', '2024-06-25 14:07:33', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000274, 100354, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sapu Lidi Besar', 6, 270000, 45000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pcs', '2024-06-25 14:08:49', '2024-06-25 14:08:49', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000275, 100355, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Pengki', 6, 270000, 45000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Pcs', '2024-06-25 14:09:50', '2024-06-25 14:09:50', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000276, 100356, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Gelas', 4, 200000, 50000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Lusin', '2024-06-25 14:10:50', '2024-06-25 14:10:50', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000277, 100357, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sendok Makan', 4, 80000, 20000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Lusin', '2024-06-25 14:11:58', '2024-06-25 14:11:58', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000278, 100350, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Piring Makan', 2, 250000, 125000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Lusin', '2024-06-25 14:12:59', '2024-06-25 14:12:59', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000279, 100358, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Tea Set', 1, 320000, 320000, 0, 0, 'Adum', '2023-03-30', 'GU 3', 'Set', '2024-06-25 14:14:06', '2024-06-25 14:14:06', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000280, 100359, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Prakis Keeper 203 LS 4.5L', 1, 30000, 30000, 0, 0, 'Adum', '2023-03-06', 'GU 4', 'Pcs', '2024-06-25 14:15:08', '2024-06-25 14:16:31', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000281, 100360, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Prakis Keeper 203 LS 6L', 1, 35000, 35000, 0, 0, 'Adum', '2023-03-06', 'GU 4', 'Pcs', '2024-06-25 14:16:09', '2024-06-25 14:16:09', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000282, 100361, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Tessa TP_06 BND 200S', 20, 330000, 16500, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:17:33', '2024-06-25 14:17:33', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000283, 100362, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Dahlia TCB Tellow', 5, 106600, 21320, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:18:51', '2024-06-25 14:18:51', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000284, 100363, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Lion Star BM50 Ref', 4, 118000, 29500, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:19:46', '2024-06-25 14:19:46', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000285, 100364, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Scotceritess 3X4 D30R', 3, 50700, 16900, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:20:55', '2024-06-25 14:20:55', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000286, 100319, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'KMT Plas Chamois', 6, 157200, 26200, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:22:01', '2024-06-25 14:22:01', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000287, 100366, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'YOA Trash Bag 90x120', 2, 69800, 34900, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:22:51', '2024-06-25 14:22:51', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000288, 100367, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Klin Pak KT Smph SD', 3, 98700, 32900, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:23:55', '2024-06-25 14:23:55', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000289, 100368, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Peace PL Sereh 5L B1500', 2, 66900, 33450, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:25:01', '2024-06-25 14:25:01', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000290, 100369, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'WPC Kloset FLWR B600', 1, 19755, 19755, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:25:57', '2024-06-25 14:25:57', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000291, 100370, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella all Org MP', 2, 83000, 41500, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:26:51', '2024-06-25 14:26:51', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000292, 100383, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Glade All Lemon Flower Orange', 6, 78000, 13000, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:29:36', '2024-06-25 14:29:36', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000293, 100371, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Clear PK Ori R500', 3, 41700, 13900, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:30:31', '2024-06-25 14:30:31', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000294, 100372, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Ktg Kuning P44G', 2, 16900, 8450, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:31:41', '2024-06-25 14:31:41', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000295, 100373, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Baygon Peace 600', 6, 277500, 46250, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:32:51', '2024-06-25 14:32:51', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000296, 100374, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'SK LT Lavender, Apple B900', 3, 43050, 14350, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:38:59', '2024-06-25 14:38:59', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000297, 100375, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sunlight Lime B750', 3, 116550, 38850, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:40:06', '2024-06-25 14:40:06', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000298, 100376, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella Mat Spring, Green', 6, 188400, 31400, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:41:00', '2024-06-25 14:41:00', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000299, 100368, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Peace PL Sereh 5L B1500', 3, 100350, 33450, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:42:04', '2024-06-25 14:42:04', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000300, 100378, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Vixal Biru B750', 6, 106500, 17750, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:43:02', '2024-06-25 14:43:02', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000301, 100369, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'WPC Kloset FLWR B600', 3, 59265, 19755, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 14:43:52', '2024-06-25 14:43:52', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000302, 100379, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Kursi susun', 200, 71040000, 355200, 0, 0, 'Adum', '2023-05-05', 'GU 4', 'Pcs', '2024-06-25 14:45:14', '2024-06-25 14:45:14', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000303, 100380, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sapu Lidi Ikat Besar', 2, 100000, 50000, 0, 0, 'Adum', '2023-05-10', 'GU 5', 'Pcs', '2024-06-25 14:46:16', '2024-06-25 14:47:22', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000304, 100381, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Pengki', 2, 100000, 50000, 0, 0, 'Adum', '2023-05-10', 'GU 5', 'Pcs', '2024-06-25 14:47:09', '2024-06-25 14:47:09', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000305, 100384, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Baterai AA Alfamart', 4, 99800, 24950, 0, 0, 'Adum', '2023-01-13', 'GU 1', 'Set', '2024-06-25 17:29:38', '2024-06-25 17:29:38', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000306, 100385, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'TL 25W', 2, 184000, 92000, 0, 0, 'Adum', '2023-02-23', 'GU 2', 'Pcs', '2024-06-25 17:30:54', '2024-06-25 17:30:54', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000307, 100386, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Eveready MRKC', 15, 142500, 9500, 0, 0, 'Adum', '2023-02-23', 'GU 2', 'Pcs', '2024-06-25 17:32:05', '2024-06-25 17:32:05', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000308, 100387, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'ENR E92BP4AAA Alkaline Power', 4, 102000, 25500, 0, 0, 'Adum', '2023-02-23', 'GU 2', 'Set', '2024-06-25 17:33:23', '2024-06-25 17:33:23', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000309, 100388, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Tarde Broco', 5, 106500, 21300, 0, 0, 'Adum', '2023-02-23', 'GU 2', 'Pcs', '2024-06-25 17:34:32', '2024-06-25 17:34:32', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000310, 100389, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Senter Eveready Besar + Baterai', 2, 128000, 64000, 0, 0, 'Adum', '2023-03-07', 'GU 3', 'Pcs', '2024-06-25 17:35:56', '2024-06-25 17:38:27', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000311, 100390, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Senter Eveready Kecil + Baterai', 2, 70000, 35000, 0, 0, 'Adum', '2023-03-07', 'GU 3', 'Pcs', '2024-06-25 17:36:52', '2024-06-25 17:38:43', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000313, 100392, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Baterai Kancing ECR 7016', 2, 32000, 16000, 0, 0, 'Adum', '2023-03-07', 'GU 3', 'Pcs', '2024-06-25 17:40:02', '2024-06-25 17:40:02', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000314, 100393, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Alkaline AA 4+3', 5, 187500, 37500, 0, 0, 'Adum', '2023-03-07', 'GU 3', 'Pcs', '2024-06-25 17:41:15', '2024-06-25 17:41:15', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000315, 100394, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Alkaline AAA 4+2', 5, 160950, 32190, 0, 0, 'Adum', '2023-03-07', 'GU 3', 'Pcs', '2024-06-25 17:42:15', '2024-06-30 13:12:48', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000316, 100395, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Busa Mic', 4, 40000, 10000, 0, 0, 'Adum', '2023-03-06', 'GU 3', 'Pcs', '2024-06-25 17:43:22', '2024-06-30 13:12:23', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000317, 100396, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Baterai A2 ABC', 6, 15000, 2500, 0, 0, 'Adum', '2023-03-06', 'GU 3', 'Pcs', '2024-06-25 17:44:32', '2024-06-30 13:11:55', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000318, 100397, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Baterai A3 ABC', 6, 15000, 2500, 0, 0, 'Adum', '2023-03-06', 'GU 3', 'Pcs', '2024-06-25 17:45:27', '2024-06-30 13:11:21', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000319, 100398, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Logitech Wireless Combo Keyboard & Mouse', 1, 292000, 292000, 0, 0, 'Adum', '2023-04-04', 'GU 4', 'Pcs', '2024-06-25 17:46:31', '2024-06-30 13:10:51', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000320, 100399, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'ABC Alkaline', 3, 56700, 18900, 0, 0, 'Adum', '2023-04-27', 'GU 4', 'Pcs', '2024-06-25 17:47:31', '2024-06-30 13:10:21', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000321, 100400, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Lampu Philips Led 4Pcs', 1, 205000, 205000, 0, 0, 'Adum', '2023-05-17', 'GU 5', 'Set', '2024-06-25 17:48:41', '2024-06-30 12:13:34', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000322, 100401, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Tang dan Gegep', 1, 130000, 130000, 0, 0, 'Adum', '2023-05-05', 'GU 5', 'Pcs', '2024-06-25 17:50:20', '2024-06-30 12:13:00', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000323, 100402, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Perbaikan Jaringan Listrik', 1, 565000, 565000, 0, 0, 'Adum', '2023-05-17', 'GU 5', 'Kegiatan', '2024-06-25 17:51:39', '2024-06-30 12:12:37', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000324, 100403, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'MCB', 1, 500000, 500000, 0, 0, 'Adum', '2023-05-17', 'GU 5', 'Set', '2024-06-25 17:53:12', '2024-06-30 12:12:14', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000325, 100404, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Luthfi Service', 1, 722000, 722000, 0, 0, 'Adum', '2023-05-16', 'GU 5', 'Kegiatan', '2024-06-25 17:54:09', '2024-06-30 12:11:45', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0031'),
('KECAMATAN ASTANAANYAR', 3000326, 100405, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Suvenir/Cendera Mata', 'T-Shirt', 95, 9490500, 99900, 0, 0, 'Adum', '2023-04-12', 'LS', 'Pcs', '2024-06-25 17:58:15', '2024-06-30 12:11:22', 'pengelola@gmail.com', '001/FTK/PT.WAA/2023', '2023-04-14', '027/055-2.06.02/BASTHP-KEC.ANYAR/2023', '2023-04-12', '5.1.02.01.01.0035'),
('KECAMATAN ASTANAANYAR', 3000327, 100406, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat/Bahan untuk Kegiatan Kantor Lainnya', 'Undangan Musrenbang', 100, 500000, 5000, 0, 0, '-', '2023-02-06', 'GU 1', 'Pcs', '2024-06-25 18:00:16', '2024-06-30 12:11:01', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0036'),
('KECAMATAN ASTANAANYAR', 3000329, 100408, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat/Bahan untuk Kegiatan Kantor Lainnya', 'Pelet Apung', 75, 750000, 10000, 0, 0, 'Adum', '2023-05-05', 'GU 4', 'Kg', '2024-06-25 18:03:16', '2024-06-30 12:10:21', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0036'),
('KECAMATAN ASTANAANYAR', 3000330, 100409, 'Belanja Pakaian Dinas Lapangan (PDL)', 'Pakaian Dinas Lapangan', 90, 6750000, 75000, 0, 0, 'Kasi Ekbang', '2023-04-10', 'GU 4', 'Pcs', '2024-06-25 18:05:45', '2024-06-30 12:09:47', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0064');
INSERT INTO `barangmasuk` (`perangkat_daerah`, `id_transaksi_masuk`, `id_barang`, `jenis_barang`, `nama_barang`, `jml_barang`, `jml_harga`, `harga_barang`, `jml_barang_awal`, `jml_harga_awal`, `ket`, `Tanggal`, `dari`, `satuan`, `created_at`, `updated_at`, `created_by`, `nomor_ba_penerimaan`, `tanggal_ba_penerimaan`, `nomor_dokumen_faktur`, `tanggal_dokumen_faktur`, `kode`) VALUES
('KECAMATAN ASTANAANYAR', 3000331, 100410, 'Belanja Komponen-Komponen Peralatan', 'Kursi susun', 20, 8880000, 444000, 0, 0, 'Adum', '2023-04-12', 'LS', 'Pcs', '2024-06-25 18:07:26', '2024-06-30 12:07:32', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.02.0003'),
('KELURAHAN CIBADAK', 3000333, 10001, 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Pelampung 3/4 Kuningan', 1, 85000, 85000, 0, 0, 'Adum', '2024-07-03', 'GU 4', 'pcs', '2024-07-09 04:32:36', '2024-07-09 04:32:36', 'kelurahan@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0001'),
('KECAMATAN ASTANAANYAR', 3000335, 100327, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Scotchbritess3X4D30R', 2, 29800, 14900, 0, 0, 'Adum', '2023-02-07', 'GU 1', 'Pcs', '2024-07-14 15:52:32', '2024-07-14 15:52:32', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KECAMATAN ASTANAANYAR', 3000336, 100348, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella Pewangi Ruangan', 1, 29000, 29000, 0, 0, 'Adum', '2023-02-22', 'GU 2', 'Pcs', '2024-07-14 15:53:40', '2024-07-14 15:53:40', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0030'),
('KELURAHAN CIBADAK', 3000338, 100201, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'HVS maxbire F4 70', 2, 90000, 45000, 0, 0, '-', '2023-01-01', 'GU 1', 'Pcs', '2024-07-16 14:22:57', '2024-07-16 14:22:57', 'kelurahan@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KELURAHAN CIBADAK', 3000339, 100156, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Belanja ATK Kel Cibadak (Gunt \"KK\" SC-7187\"', 2, 25000, 12500, 0, 0, '-', '2023-01-16', 'GU 1', 'Pcs', '2024-07-16 14:24:11', '2024-07-16 14:25:34', 'kelurahan@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KELURAHAN CIBADAK', 3000340, 100157, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Belanja ATK Kel Cibadak (Gelp yoeker YK-975)', 1, 13500, 13500, 0, 0, '-', '2023-01-16', 'GU 1', 'Pcs', '2024-07-16 14:25:14', '2024-07-16 14:25:14', 'kelurahan@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024'),
('KECAMATAN ASTANAANYAR', 3000341, 10068, 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Cutter', 1, 15000, 15000, 8, 120000, '-', '2023-01-01', 'Saldo Akhir 2022', 'Pcs', '2024-07-20 15:18:52', '2024-07-20 15:18:52', 'pengelola@gmail.com', NULL, NULL, NULL, NULL, '5.1.02.01.01.0024');

-- --------------------------------------------------------

--
-- Struktur dari tabel `databarang`
--

CREATE TABLE `databarang` (
  `id_barang` int(11) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `jenis_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `databarang`
--

INSERT INTO `databarang` (`id_barang`, `kode`, `jenis_barang`, `nama_barang`, `harga`, `created_at`, `updated_at`) VALUES
(10001, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Pelampung 3/4 Kuningan', 85000, '2024-06-19 08:04:10', '2024-06-19 08:04:10'),
(10002, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Paku 5cm', 10000, '2024-06-19 08:05:13', '2024-06-19 08:05:13'),
(10003, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Paku 7cm', 10000, '2024-06-19 08:05:42', '2024-06-19 08:05:42'),
(10004, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Talang Air Pvc 4\"', 75000, '2024-06-19 08:06:28', '2024-06-19 08:07:27'),
(10005, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Tutup Talang Pvc 4\"', 5000, '2024-06-19 08:07:12', '2024-06-19 08:07:12'),
(10006, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Corong Talang Pvc 4\"', 7500, '2024-06-19 08:09:49', '2024-06-19 08:09:49'),
(10007, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Ram Kawat Hijau 1.5 cm', 125000, '2024-06-19 08:11:40', '2024-06-19 08:11:40'),
(10008, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Amplas Kain 4\"', 270000, '2024-06-19 08:12:29', '2024-06-23 11:39:51'),
(10009, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Pylox', 60000, '2024-06-19 08:13:08', '2024-06-19 08:13:08'),
(10010, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Handle', 39000, '2024-06-19 08:13:36', '2024-06-19 08:13:36'),
(10011, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Linggis Besar', 41100, '2024-06-19 08:14:19', '2024-06-19 08:14:19'),
(10012, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Fleksibel 30cm', 25000, '2024-06-19 08:15:04', '2024-06-19 08:15:04'),
(10013, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Kran Wastapel DNDA', 100000, '2024-06-19 08:15:44', '2024-06-19 08:15:44'),
(10014, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Aquaproof', 60000, '2024-06-19 08:16:20', '2024-06-19 08:16:20'),
(10015, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Kuas 3\"', 7000, '2024-06-19 08:16:53', '2024-06-19 08:16:53'),
(10016, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Selup', 7500, '2024-06-19 08:18:20', '2024-06-19 08:18:20'),
(10017, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Kunci Inggris', 40000, '2024-06-19 08:20:58', '2024-06-19 08:20:58'),
(10018, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Siku Lubang 4x4', 45000, '2024-06-19 08:21:40', '2024-06-19 08:21:40'),
(10019, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'multi 9mm', 120000, '2024-06-19 08:22:47', '2024-06-23 11:55:39'),
(10020, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Besi Siku Lubang', 100000, '2024-06-19 08:23:31', '2024-06-19 08:23:31'),
(10021, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Baud Siku Lubang', 1000, '2024-06-19 08:24:09', '2024-06-19 08:24:23'),
(10022, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Siku Plat Besi Lubang', 2500, '2024-06-19 08:25:01', '2024-06-19 08:25:01'),
(10023, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Karet Besi Siku Lubang', 2500, '2024-06-19 08:25:43', '2024-06-19 08:25:43'),
(10024, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Batu WD', 5000, '2024-06-19 08:26:18', '2024-06-19 08:26:18'),
(10025, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Triplek 9mm', 120000, '2024-06-19 08:27:16', '2024-06-19 08:27:16'),
(10026, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Jasa Pembuatan Rak', 300000, '2024-06-19 08:27:51', '2024-06-19 08:27:51'),
(10027, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Paralon  1/2 Rucika', 23000, '2024-06-19 08:28:59', '2024-06-19 08:28:59'),
(10028, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Koni 1/2', 3000, '2024-06-19 08:29:28', '2024-06-19 08:29:28'),
(10029, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Kleman', 10000, '2024-06-19 08:29:52', '2024-06-19 08:29:52'),
(10030, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Lem Paralon', 15000, '2024-06-19 08:30:17', '2024-06-19 08:30:17'),
(10031, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Body Ses 30mm +Handle', 250000, '2024-06-19 08:30:57', '2024-06-19 08:30:57'),
(10032, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'HDL Top Grande', 60000, '2024-06-19 08:31:37', '2024-06-19 08:31:37'),
(10033, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Pembuatan Pintu Gerbang  RW 04-05-07', 129881100, '2024-06-19 08:34:20', '2024-06-19 08:34:20'),
(10034, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'BELANJA BAHAN RABAT BETON RW.03 TAHAP 1', 8500000, '2024-06-19 08:35:30', '2024-06-19 08:35:30'),
(10035, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'BELANJA BAHAN RABAT BETON RW.03 TAHAP 2', 6402000, '2024-06-19 08:36:22', '2024-06-19 08:36:22'),
(10036, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Gudang Recycable', 5850000, '2024-06-19 08:37:08', '2024-06-19 08:37:08'),
(10037, '5.1.02.01.01.0002', 'Belanja Bahan-Bahan Kimia', 'Kompos Daun', 29400, '2024-06-19 08:38:39', '2024-06-19 08:38:39'),
(10038, '5.1.02.01.01.0002', 'Belanja Bahan-Bahan Kimia', 'Pupuk Kandang', 75000, '2024-06-19 08:39:10', '2024-06-19 08:39:10'),
(10039, '5.1.02.01.01.0002', 'Belanja Bahan-Bahan Kimia', 'Pupuk NPK', 632500, '2024-06-19 08:39:48', '2024-06-19 08:39:48'),
(10040, '5.1.02.01.01.0004', 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [202 Liter x 2 Unit x3 Bulan]', 13900, '2024-06-19 09:41:52', '2024-06-19 09:41:52'),
(10041, '5.1.02.01.01.0004', 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [33.5 Liter x 20 Unit x3 Bulan]', 13900, '2024-06-19 09:42:35', '2024-06-19 09:42:35'),
(10042, '5.1.02.01.01.0004', 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamina Dex [195 Literx 1 Unit x3 Bulan]', 16750, '2024-06-19 09:43:50', '2024-06-19 09:43:50'),
(10043, '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Pertamax [225 Liter x 2Unit x3 Bulan]', 12800, '2024-06-19 09:44:37', '2024-06-19 09:44:37'),
(10044, '5.1.02.01.01.0004', 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [37.5 Liter x 20Unit x 3 Bulan]', 12800, '2024-06-19 09:45:28', '2024-06-19 09:45:28'),
(10045, '5.1.02.01.01.0004', 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [45 Liter x 9Unit x 3 Bulan]', 12800, '2024-06-19 09:45:56', '2024-06-19 09:45:56'),
(10046, '5.1.02.01.01.0004', 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [150 Liter x 7Unit x 3 Bulan]', 12800, '2024-06-19 09:46:25', '2024-06-19 09:46:25'),
(10047, '5.1.02.01.01.0004', 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamina Dex [195 Liter x 1Unit x 3 Bulan]', 15400, '2024-06-19 09:47:12', '2024-06-19 09:47:12'),
(10048, '5.1.02.01.01.0004', 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [225 Liter x 2Unit x 3 Bulan]', 13300, '2024-06-19 09:47:57', '2024-06-19 09:47:57'),
(10049, '5.1.02.01.01.0004', 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [37.5 Liter x 20Unit x 3 Bulan]', 13300, '2024-06-19 09:48:30', '2024-06-19 09:48:30'),
(10050, '5.1.02.01.01.0004', 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [45 Liter x 9Unit x 3 Bulan]', 13300, '2024-06-19 09:48:57', '2024-06-19 09:48:57'),
(10051, '5.1.02.01.01.0004', 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Pertamax [150 Liter x 7 Unit x 3 Bulan]', 13300, '2024-06-19 09:49:26', '2024-06-19 09:49:26'),
(10052, '5.1.02.01.01.0008', 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit Bayam', 55000, '2024-06-19 09:50:40', '2024-06-19 09:50:40'),
(10053, '5.1.02.01.01.0008', 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit cabe Rawit', 65000, '2024-06-19 09:51:14', '2024-06-24 08:27:39'),
(10054, '5.1.02.01.01.0008', 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit caisim', 35000, '2024-06-19 09:51:48', '2024-06-19 09:51:48'),
(10055, '5.1.02.01.01.0008', 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit Kangkung', 57500, '2024-06-19 09:52:30', '2024-06-19 09:52:30'),
(10056, '5.1.02.01.01.0008', 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit pakcoy', 35000, '2024-06-19 09:53:00', '2024-06-19 09:53:00'),
(10057, '5.1.02.01.01.0008', 'Belanja Bahan-Bahan/Bibit Tanaman', 'Bibit Tanaman', 15000, '2024-06-19 09:54:11', '2024-06-19 09:54:11'),
(10058, '5.1.02.01.01.0008', 'Belanja Bahan-Bahan/Bibit Tanaman', 'Pupuk Kandang', 75000, '2024-06-19 09:54:44', '2024-06-19 09:54:44'),
(10059, '5.1.02.01.01.0008', 'Belanja Bahan-Bahan/Bibit Tanaman', 'Sekam', 80000, '2024-06-19 09:55:08', '2024-06-19 09:55:08'),
(10060, '5.1.02.01.01.0008', 'Belanja Bahan-Bahan/Bibit Tanaman', 'Tanah gembur Lembang', 193600, '2024-06-19 09:56:06', '2024-06-19 09:56:06'),
(10061, '5.1.02.01.01.0010', 'Belanja Bahan-Isi Tabung Gas', 'ISI TABUNG GAS 3 KG', 17000, '2024-06-19 09:57:26', '2024-06-19 09:57:26'),
(10062, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Spidol', 7500, '2024-06-19 09:58:56', '2024-06-19 09:58:56'),
(10063, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Ekspedisi 100 Lembar', 9000, '2024-06-19 09:59:38', '2024-06-19 09:59:38'),
(10064, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penghapus / Korektor', 6000, '2024-06-19 10:00:17', '2024-06-19 10:00:17'),
(10065, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Box File bindex', 31000, '2024-06-19 10:00:57', '2024-06-19 10:00:57'),
(10066, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Kwitansi', 5000, '2024-06-19 10:01:29', '2024-06-19 10:01:29'),
(10067, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas (Binder Clip)', 6000, '2024-06-19 10:02:10', '2024-06-19 10:02:10'),
(10068, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Cutter', 15000, '2024-06-19 10:02:44', '2024-06-19 10:02:44'),
(10069, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Isolasi Bening', 8500, '2024-06-19 10:03:40', '2024-06-19 10:03:40'),
(10070, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler Besar', 58500, '2024-06-19 10:04:23', '2024-06-19 10:04:23'),
(10071, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pembolong Kertas Ukuran Besar', 36500, '2024-06-19 10:05:08', '2024-06-19 10:05:08'),
(10072, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map plastik snechelter', 35000, '2024-06-19 10:05:58', '2024-06-24 11:34:17'),
(10073, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Gunting Kertas Sedang', 18000, '2024-06-19 10:06:54', '2024-06-19 10:06:54'),
(10074, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kertas HVS A4 70 Gsm', 52000, '2024-06-19 10:07:37', '2024-06-19 10:07:37'),
(10075, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 22000, '2024-06-19 10:08:44', '2024-06-19 10:08:44'),
(10076, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 15000, '2024-06-19 10:09:23', '2024-06-19 10:09:23'),
(10077, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 30000, '2024-06-19 10:10:01', '2024-06-19 10:10:01'),
(10078, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas (Binder Clip)', 12000, '2024-06-19 10:11:10', '2024-06-19 10:11:10'),
(10079, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'isi staples', 3000, '2024-06-19 10:11:53', '2024-06-19 10:11:53'),
(10080, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kertas Photo (Glosy isi 100 lbr 230 Gram', 70000, '2024-06-19 10:13:49', '2024-06-19 10:13:49'),
(10081, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Ordnerd Bantex', 30000, '2024-06-19 10:14:41', '2024-06-19 10:14:41'),
(10082, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler Kecil', 13000, '2024-06-19 10:15:14', '2024-06-19 10:15:14'),
(10083, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kertas HVS F4 70 Gsm', 55000, '2024-06-19 10:15:54', '2024-06-19 10:15:54'),
(10084, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 17000, '2024-06-19 10:16:46', '2024-06-19 10:16:46'),
(10085, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 21000, '2024-06-19 10:17:19', '2024-06-19 10:17:19'),
(10086, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Campus Kiky', 23000, '2024-06-19 10:18:34', '2024-06-19 10:18:34'),
(10087, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Folio', 26000, '2024-06-19 10:19:25', '2024-06-19 10:19:25'),
(10088, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Kwitansi Sinar Dunia 2 Ply', 5500, '2024-06-19 10:20:11', '2024-06-19 10:20:11'),
(10089, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Cutter Kenko L-5000', 15500, '2024-06-19 10:21:00', '2024-06-19 10:21:00'),
(10090, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Isolasi Bening2', 9500, '2024-06-19 10:22:53', '2024-06-24 10:06:28'),
(10091, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Label FOX 121/103', 5000, '2024-06-19 10:23:53', '2024-06-19 10:23:53'),
(10092, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Lem UHU Stick Besar', 26000, '2024-06-19 10:24:35', '2024-06-19 10:24:35'),
(10093, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Lem UHU Stick Kecil', 8500, '2024-06-19 10:25:20', '2024-06-19 10:25:20'),
(10094, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map Bussiness F4', 5200, '2024-06-19 10:26:03', '2024-06-19 10:26:03'),
(10095, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Ordnerd Bantex', 35000, '2024-06-19 10:27:56', '2024-06-19 10:27:56'),
(10096, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 3000, '2024-06-19 10:29:34', '2024-06-19 10:29:34'),
(10097, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 6000, '2024-06-19 10:30:05', '2024-06-19 10:30:05'),
(10098, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 18500, '2024-06-19 10:30:47', '2024-06-19 10:30:47'),
(10099, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 12700, '2024-06-19 10:31:12', '2024-06-19 10:31:12'),
(10100, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 653 (Size 34,9 x 47,6 mm)', 6200, '2024-06-19 10:32:36', '2024-06-19 10:38:18'),
(10101, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 654 (Size 76 x 76 mm)', 11500, '2024-06-19 10:34:19', '2024-06-19 10:35:23'),
(10102, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it  655 (Size 73 x 123 mm)', 17000, '2024-06-19 10:35:01', '2024-06-19 10:35:01'),
(10103, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 16600, '2024-06-19 10:37:03', '2024-06-19 10:37:03'),
(10104, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 9000, '2024-06-19 10:37:53', '2024-06-19 10:37:53'),
(10105, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 30000, '2024-06-19 10:38:46', '2024-06-19 10:38:46'),
(10106, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler', 57000, '2024-06-19 10:42:45', '2024-06-19 10:42:45'),
(100107, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler', 14000, '2024-06-19 10:44:01', '2024-06-19 10:44:01'),
(100108, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stop Map Biasa', 26000, '2024-06-19 11:42:53', '2024-06-19 11:42:53'),
(100109, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'pajak', 882750, '2024-06-19 11:44:03', '2024-06-19 11:44:03'),
(100110, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Hvs Wama', 56000, '2024-06-19 11:44:46', '2024-06-19 12:18:29'),
(100111, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 7000, '2024-06-19 11:46:18', '2024-06-19 11:46:18'),
(100112, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Goodybag Musrenbang', 14000, '2024-06-19 11:50:16', '2024-06-19 11:50:16'),
(100113, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'isi Stapler no 10', 4500, '2024-06-19 11:51:18', '2024-06-19 11:51:18'),
(100114, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'isi staples', 2500, '2024-06-19 11:52:20', '2024-06-19 11:52:20'),
(100115, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Isolasi Bening3', 5000, '2024-06-19 11:53:31', '2024-06-24 10:06:49'),
(100116, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kenko OPP Packing Tape', 12000, '2024-06-19 11:55:13', '2024-06-19 11:55:13'),
(100117, '5.1.02.01.01.0025', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kertas Sertifikat', 67000, '2024-06-19 11:56:04', '2024-06-19 12:06:27'),
(100118, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'kertas stiker', 31000, '2024-06-19 11:56:36', '2024-06-19 11:56:36'),
(100119, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Lakban Hitam 2\"', 15000, '2024-06-19 11:57:18', '2024-06-19 11:57:18'),
(100120, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Nachi Tape', 3500, '2024-06-19 11:59:18', '2024-06-19 11:59:18'),
(100121, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penggaris Stainles', 9000, '2024-06-19 12:00:21', '2024-06-19 12:00:21'),
(100122, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 175000, '2024-06-19 12:02:01', '2024-06-19 12:02:01'),
(100123, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Spare Blade Kenko', 7200, '2024-06-19 12:03:17', '2024-06-19 12:03:17'),
(100124, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Spidol Emas / Perak / Putih', 15500, '2024-06-19 12:07:22', '2024-06-19 12:07:22'),
(100125, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stabilo', 9400, '2024-06-19 12:07:57', '2024-06-19 12:07:57'),
(100126, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stop Map Buffalo', 78500, '2024-06-19 12:09:19', '2024-06-19 12:09:19'),
(100127, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'pajak', 521785, '2024-06-19 12:10:09', '2024-06-19 12:10:09'),
(100128, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Cek', 250000, '2024-06-19 12:11:06', '2024-06-19 12:11:06'),
(100129, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 18870, '2024-06-19 12:11:44', '2024-06-19 12:11:44'),
(100130, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Amplop', 23310, '2024-06-19 12:15:32', '2024-06-19 12:15:32'),
(100131, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Kwitansi Sinar Dunia 2 Ply', 6105, '2024-06-19 12:16:43', '2024-06-19 12:16:43'),
(100132, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Hvs Warna', 61605, '2024-06-19 12:17:56', '2024-06-24 13:16:37'),
(100133, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kertas Sertifikat', 74370, '2024-06-19 12:19:35', '2024-06-19 12:19:35'),
(100134, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Lem UHU Stick Besar', 28305, '2024-06-19 12:20:42', '2024-06-19 12:20:42'),
(100135, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Lem UHU Stick Kecil', 9435, '2024-06-19 12:21:13', '2024-06-19 12:21:13'),
(100136, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map Bussiness F4', 5772, '2024-06-19 12:22:41', '2024-06-19 12:22:41'),
(100137, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map plastik snechelter', 37740, '2024-06-19 12:23:20', '2024-06-19 12:23:20'),
(100138, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Ordnerd Bantex', 38850, '2024-06-19 12:24:33', '2024-06-19 12:24:33'),
(100139, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penggaris Stainles', 9990, '2024-06-19 12:25:07', '2024-06-19 12:25:07'),
(100140, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 3330, '2024-06-19 12:26:15', '2024-06-19 12:26:15'),
(100141, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 6660, '2024-06-19 12:27:02', '2024-06-19 12:27:02'),
(100142, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 20535, '2024-06-19 12:27:40', '2024-06-19 12:27:40'),
(100143, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penjepit Kertas', 13875, '2024-06-19 12:28:28', '2024-06-19 12:28:28'),
(100144, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pensil', 35520, '2024-06-19 12:29:00', '2024-06-19 12:29:19'),
(100145, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 653 (Size 34,9 x 47,6 mm)', 6882, '2024-06-19 12:32:38', '2024-06-19 12:32:38'),
(100146, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it 654 (Size 76 x 76 mm)', 12765, '2024-06-19 12:33:21', '2024-06-19 12:33:21'),
(100147, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Post-it  655 (Size 73 x 123 mm)', 18870, '2024-06-19 12:34:06', '2024-06-19 12:34:06'),
(100148, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'pulpen', 17760, '2024-06-19 12:34:52', '2024-06-19 12:34:52'),
(100149, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'pulpen', 9990, '2024-06-19 12:35:28', '2024-06-19 12:35:28'),
(100150, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen', 33300, '2024-06-19 12:35:58', '2024-06-19 12:35:58'),
(100151, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stabilo', 9990, '2024-06-19 12:36:24', '2024-06-19 12:36:24'),
(100152, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler', 63270, '2024-06-19 12:37:26', '2024-06-19 12:37:26'),
(100153, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stapler', 14985, '2024-06-19 12:37:56', '2024-06-19 12:37:56'),
(100154, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stop Map Biasa', 28860, '2024-06-19 12:38:34', '2024-06-19 12:38:34'),
(100155, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'HVS Maxibrite F4 70', 45000, '2024-06-19 12:40:52', '2024-06-19 12:40:52'),
(100156, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Belanja ATK Kel Cibadak (Gunt \"KK\" SC-7187\"', 12500, '2024-06-19 12:42:23', '2024-06-19 12:42:23'),
(100157, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Belanja ATK Kel Cibadak (Gelp yoeker YK-975)', 13500, '2024-06-19 12:44:19', '2024-06-19 12:44:19'),
(100158, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Tinta Brother BT 5000 Cyan/T300', 95000, '2024-06-19 12:45:09', '2024-06-19 12:45:09'),
(100159, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Tinta Brother BT 5000 MGT/T300', 95000, '2024-06-19 12:45:49', '2024-06-19 12:45:49'),
(100160, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Tinta Brother BT 5000 YLW/T300', 95000, '2024-06-19 12:46:20', '2024-06-19 12:46:20'),
(100161, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Tinta Brother BT 5000 BLK/T300', 95000, '2024-06-19 12:46:42', '2024-06-19 12:46:42'),
(100162, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Hvs Bola 70 Gr F4', 48000, '2024-06-19 12:47:20', '2024-06-19 12:47:20'),
(100163, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'GELP Arline EGB-5570 Black', 9500, '2024-06-19 12:48:21', '2024-06-19 12:48:21'),
(100164, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map Batik KRTS Bambu MB 01', 3000, '2024-06-19 12:49:29', '2024-06-19 12:49:29'),
(100165, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map Batik KRTS TBL STM BTA', 3500, '2024-06-19 12:50:17', '2024-06-19 12:50:17'),
(100166, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Hvs Bola 70 Gr A4', 43000, '2024-06-19 12:51:12', '2024-06-19 12:51:12'),
(100167, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'BP Arline Ak-8410 HT 1.0', 4000, '2024-06-19 12:52:05', '2024-06-19 12:52:05'),
(100168, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'BP Pilot BPTP H-B-M Ecer', 2000, '2024-06-19 12:52:50', '2024-06-19 12:52:50'),
(100169, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'HVS IK Copy PPR 70 F4', 44500, '2024-06-19 12:53:47', '2024-06-19 12:53:47'),
(100170, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'SSD Buildoser 128 GB', 155000, '2024-06-19 12:55:10', '2024-06-19 12:55:10'),
(100171, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map biola / MX nomor 4 pink', 1500, '2024-06-19 12:55:50', '2024-06-19 12:55:50'),
(100172, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Penstand JK PSGP-350-B(HT)', 6000, '2024-06-19 12:57:02', '2024-06-19 12:57:02'),
(100173, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'GELP Tizo TG -352 softfuto HT', 2500, '2024-06-19 12:58:04', '2024-06-19 12:58:04'),
(100174, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'GELP Tizo TG -340 1.0GR', 5000, '2024-06-19 12:58:56', '2024-06-19 12:58:56'),
(100175, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'HVS Sidu 80gram A4', 48000, '2024-06-19 12:59:39', '2024-06-19 12:59:39'),
(100176, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Klip JK no 5 jumbo', 5000, '2024-06-19 13:00:19', '2024-06-19 13:00:19'),
(100177, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Foam KK (10.5mm) 5y', 4000, '2024-06-19 13:01:10', '2024-06-19 13:01:10'),
(100178, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'OPP 2 X 80 Y goll THJ', 7500, '2024-06-19 13:01:57', '2024-06-19 13:01:57'),
(100179, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Setip joyko 526 B20', 1650, '2024-06-19 13:02:50', '2024-06-19 13:02:50'),
(100180, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'GELP Tizo TG -340 1.0 BR', 3500, '2024-06-19 13:03:56', '2024-06-19 13:03:56'),
(100181, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Memo Stik JK MMS - 65 7P', 5500, '2024-06-19 13:04:38', '2024-06-19 13:04:38'),
(100182, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Bin klip JK 200 LS', 9500, '2024-06-19 13:05:33', '2024-06-19 13:05:33'),
(100183, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Gelp JK GP320 R 0.5', 2500, '2024-06-19 13:06:32', '2024-06-19 13:06:32'),
(100184, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Corpen JK Cfp 236', 1800, '2024-06-19 13:09:29', '2024-06-19 13:09:29'),
(100185, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Orlee dbill 10 s hitam', 13500, '2024-06-19 13:10:31', '2024-06-19 13:10:31'),
(100186, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Orlee dbill 10 s putih', 13500, '2024-06-19 13:10:52', '2024-06-19 13:10:52'),
(100187, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Sle JK B-23 PLT F12', 2250, '2024-06-19 13:11:53', '2024-06-19 13:11:53'),
(100188, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stik NT wash black pink', 5000, '2024-06-19 13:12:32', '2024-06-19 13:12:32'),
(100189, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Idx Memo JK IM 625 PAD x 20s', 8500, '2024-06-19 13:13:49', '2024-06-19 13:13:49'),
(100190, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Bak KK no 1 (PL)', 9000, '2024-06-19 13:15:17', '2024-06-19 13:15:17'),
(100191, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'PSL macs prem CHUBS 2B (LS)', 20000, '2024-06-19 13:16:01', '2024-06-19 13:16:01'),
(100192, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'GUNT GND HI-basic 60', 9500, '2024-06-19 13:26:56', '2024-06-19 13:26:56'),
(100193, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'DT nachi 12mm', 2500, '2024-06-19 13:27:32', '2024-06-19 13:27:32'),
(100194, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stap ZRM HD-10', 8500, '2024-06-19 13:28:08', '2024-06-19 13:28:08'),
(100195, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stepler JK-15 white', 11500, '2024-06-19 13:28:53', '2024-06-19 13:28:53'),
(100196, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Bind klip JK 105 LS', 2500, '2024-06-19 13:29:35', '2024-06-19 13:29:35'),
(100197, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Glep artline 5B 5570 Blue', 9500, '2024-06-19 13:30:20', '2024-06-19 13:30:20'),
(100198, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map biola / MX nomor 11 putih', 1250, '2024-06-19 13:31:08', '2024-06-19 13:31:08'),
(100199, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Stp map KRTN per pack', 24000, '2024-06-19 13:32:41', '2024-06-19 13:32:41'),
(100200, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'HVS maxbire F4 70', 44500, '2024-06-19 13:34:17', '2024-06-19 13:34:17'),
(100201, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'HVS maxbire F4 70', 45000, '2024-06-19 13:34:39', '2024-06-19 13:34:39'),
(100202, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Join SSD 128GB', 160000, '2024-06-19 13:35:16', '2024-06-19 13:35:16'),
(100203, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Caddy cash 12,7mm', 50000, '2024-06-19 13:35:54', '2024-06-19 13:35:54'),
(100204, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map Batik KRTS sika F4 AC-18', 2500, '2024-06-19 13:37:21', '2024-06-19 13:37:21'),
(100205, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'USB UFD V-178W 16GB', 85000, '2024-06-19 13:38:21', '2024-06-19 13:38:21'),
(100206, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Cloth tape JK 1-qr (36MM)', 9500, '2024-06-19 13:39:42', '2024-06-19 13:39:42'),
(100207, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Cal casio MX-128K hijau', 80000, '2024-06-19 13:44:01', '2024-06-19 13:44:01'),
(100208, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Tinta Epson 16-64 cyan', 85000, '2024-06-19 13:44:50', '2024-06-19 13:44:50'),
(100209, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Tinta Epson 16-64 yellow', 85000, '2024-06-19 13:45:36', '2024-06-19 13:45:36'),
(100210, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Tinta Epson 16-64 black', 85000, '2024-06-19 13:46:00', '2024-06-19 13:46:00'),
(100211, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Tinta Epson 16-64 magenta', 85000, '2024-06-19 13:47:18', '2024-06-19 13:47:18'),
(100212, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'HDD Eksternal case 2.5 inc usb 30 RX 7', 55000, '2024-06-19 13:53:05', '2024-06-19 13:53:05'),
(100213, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'SSD RX 7 128GB garansi resmi', 128000, '2024-06-19 13:53:57', '2024-06-19 13:53:57'),
(100214, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'HDD caddy aluminium slim & sata to sata sintetis 9,5mm', 13000, '2024-06-19 13:55:01', '2024-06-19 13:55:01'),
(100215, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kabel hdmi 5 meter', 39000, '2024-06-19 13:55:52', '2024-06-19 13:55:52'),
(100216, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Titan Brother 60', 115000, '2024-06-19 13:56:28', '2024-06-19 13:56:28'),
(100217, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Seminar kit-godiebak pilpem, tumbler, notebook, stiker', 50000, '2024-06-19 13:57:26', '2024-06-19 13:57:26'),
(100218, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Charger Laptop', 65000, '2024-06-19 13:58:27', '2024-06-19 13:58:27'),
(100219, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'HVS F4', 65000, '2024-06-19 13:59:15', '2024-06-19 13:59:15'),
(100220, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen Standar', 25000, '2024-06-19 13:59:49', '2024-06-19 13:59:49'),
(100221, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Pulpen tiso', 70000, '2024-06-19 14:00:26', '2024-06-19 14:00:26'),
(100222, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'HVS maxi brite F4 70', 44500, '2024-06-19 14:22:36', '2024-06-19 14:22:36'),
(100223, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Nota 5x2 PIY 33 gorila', 2500, '2024-06-19 14:23:27', '2024-06-19 14:23:27'),
(100224, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Gelp \"JK\" GP-320 R 0', 2500, '2024-06-19 14:24:17', '2024-06-19 14:24:17'),
(100225, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'PVC ELEKTRIK', 7500, '2024-06-19 14:25:16', '2024-06-19 14:25:16'),
(100226, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'CAL \"JK\"CC-13', 38000, '2024-06-19 14:25:56', '2024-06-19 14:25:56'),
(100227, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'B NOTE RING \"KK\" A5RN', 12000, '2024-06-19 14:26:33', '2024-06-19 14:26:33'),
(100228, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'GUNT KK SC7187', 12500, '2024-06-19 14:27:12', '2024-06-19 14:27:12'),
(100229, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'ISI KATER', 5000, '2024-06-19 14:28:02', '2024-06-19 14:28:02'),
(100230, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'BATU AA2', 7500, '2024-06-19 14:28:46', '2024-06-19 14:28:46'),
(100231, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'HVS F4', 50000, '2024-06-19 14:45:24', '2024-06-19 14:45:24'),
(100232, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'pulpen', 20000, '2024-06-19 14:46:15', '2024-06-19 14:46:15'),
(100233, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'spidol', 20000, '2024-06-19 14:47:05', '2024-06-19 14:47:05'),
(100234, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Kabel HDMI', 150000, '2024-06-19 14:47:57', '2024-06-19 14:47:57'),
(100235, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Tinta brother', 100000, '2024-06-19 14:48:53', '2024-06-19 14:48:53'),
(100236, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Buku Folio', 15000, '2024-06-19 14:50:44', '2024-06-19 14:50:44'),
(100237, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Tinta EPSON', 75000, '2024-06-19 14:52:05', '2024-06-19 14:52:05'),
(100238, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map', 75000, '2024-06-19 14:52:42', '2024-06-19 14:52:42'),
(100239, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'HVS A4', 47500, '2024-06-19 14:53:24', '2024-06-19 14:53:24'),
(100240, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'HVS F4', 60000, '2024-06-19 14:54:09', '2024-06-19 14:54:09'),
(100241, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'HVS A4', 57000, '2024-06-19 14:54:44', '2024-06-19 14:54:44'),
(100242, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'PULPEN', 36000, '2024-06-19 14:55:19', '2024-06-19 14:55:19'),
(100243, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'PENSIL', 36000, '2024-06-19 14:57:46', '2024-06-19 14:57:46'),
(100244, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Binder Clip 607', 48000, '2024-06-19 14:59:03', '2024-06-19 14:59:03'),
(100245, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Binder Clip 111', 72000, '2024-06-19 14:59:37', '2024-06-19 14:59:37'),
(100246, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Paper Cup', 45000, '2024-06-19 15:00:06', '2024-06-19 15:00:06'),
(100247, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Ballpoint', 55000, '2024-06-19 15:01:30', '2024-06-19 15:01:30'),
(100248, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Binder Clip 155', 90000, '2024-06-19 15:02:09', '2024-06-19 15:02:09'),
(100249, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'TINTA BROTHER (HITAM KUNING BIRU)', 139000, '2024-06-19 15:04:00', '2024-06-19 15:04:00'),
(100250, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'MAP DOCUMENT CASE F4', 52000, '2024-06-19 15:04:33', '2024-06-19 15:04:33'),
(100251, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'MAP PLASTIK KANCING', 7000, '2024-06-19 15:05:10', '2024-06-19 15:05:10'),
(100252, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'PERFORATOR JOYKO', 33000, '2024-06-19 15:05:55', '2024-06-19 15:05:55'),
(100253, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'BUKU FOLIO 100 LEMBAR', 24000, '2024-06-19 15:06:39', '2024-06-19 15:06:39'),
(100254, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'TINTA BROTHER WARNA BIRU', 83500, '2024-06-19 15:07:48', '2024-06-19 15:07:48'),
(100255, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'TINTA BROTHER WARNA MERAH', 82500, '2024-06-19 15:08:47', '2024-06-19 15:08:47'),
(100256, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'TINTA BROTHER WARNA KUNING', 98500, '2024-06-19 15:09:18', '2024-06-19 15:09:18'),
(100257, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'TINTA BROTHER WARNA HITAM', 83000, '2024-06-19 15:09:50', '2024-06-19 15:09:50'),
(100258, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'TINTA EPSON WARNA HITAM', 81000, '2024-06-19 15:10:26', '2024-06-19 15:10:26'),
(100259, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Ballpoint GELL Biru', 52000, '2024-06-19 15:11:15', '2024-06-19 15:11:15'),
(100260, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'TINTA EPSON WARNA (MERAH, BIRU, KUNING)', 84500, '2024-06-19 15:13:06', '2024-06-19 15:13:06'),
(100261, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'LEMBAR PENGANTAR SURAT', 30000, '2024-06-19 15:14:35', '2024-06-19 15:14:35'),
(100262, '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Map plastik snechelter', 33000, '2024-06-24 11:43:17', '2024-06-24 11:43:17'),
(100263, '5.1.02.01.01.0025', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Kertas HVS A4 70 Gsm', 52170, '2024-06-25 07:57:29', '2024-06-25 07:57:29'),
(100264, '5.1.02.01.01.0025', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Kertas HVS F4 70 Gsm', 61050, '2024-06-25 07:58:21', '2024-06-25 07:58:21'),
(100265, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Kop Surat Dinas', 63500, '2024-06-25 08:00:31', '2024-06-25 08:00:31'),
(100266, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Dus Arsip', 20000, '2024-06-25 08:01:27', '2024-06-25 08:01:27'),
(100267, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Map Design', 7770, '2024-06-25 08:02:20', '2024-06-25 08:02:20'),
(100268, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 500, '2024-06-25 08:03:01', '2024-06-25 08:03:33'),
(100269, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Jilid Soft Cover', 25000, '2024-06-25 08:04:23', '2024-06-25 08:04:23'),
(100270, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan dan jilid LAKIP Tahunan', 240000, '2024-06-25 08:05:37', '2024-06-25 08:05:37'),
(100271, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan dan jilid Laporan Keuangan', 174000, '2024-06-25 08:06:30', '2024-06-25 08:06:30'),
(100272, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Jilid Soft Cover', 14000, '2024-06-25 08:07:36', '2024-06-25 08:07:36'),
(100273, '5.1.02.01.01.0025', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Penggandaan dan jilid LAKIP TW 4', 152250, '2024-06-25 08:08:26', '2024-06-25 08:08:26'),
(100274, '5.1.02.01.01.0025', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Jilid dan Foto Copy', 117500, '2024-06-25 08:09:10', '2024-06-25 08:09:10'),
(100275, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 250, '2024-06-25 08:09:36', '2024-06-25 08:09:36'),
(100276, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Cetak Buku Materi Munsrenbang', 24000, '2024-06-25 08:10:27', '2024-06-25 08:10:27'),
(100277, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk Munsrenbang', 192000, '2024-06-25 08:11:06', '2024-06-25 08:11:06'),
(100278, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'spanduk', 240000, '2024-06-25 08:11:40', '2024-06-25 08:11:40'),
(100279, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 497500, '2024-06-25 08:12:19', '2024-06-25 08:12:19'),
(100280, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Cetak Stiker', 5550, '2024-06-25 08:12:50', '2024-06-25 08:12:50'),
(100281, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Belanja cetak Map Design', 7770, '2024-06-25 08:13:23', '2024-06-25 08:13:23'),
(100282, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Dus Arsip', 22200, '2024-06-25 08:13:56', '2024-06-25 08:13:56'),
(100283, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Amplop', 100455, '2024-06-25 08:14:38', '2024-06-25 08:14:38'),
(100284, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 32000, '2024-06-25 08:15:07', '2024-06-25 08:15:07'),
(100285, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 118750, '2024-06-25 08:16:04', '2024-06-25 11:58:41'),
(100286, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 50000, '2024-06-25 08:16:43', '2024-06-25 08:16:43'),
(100287, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 60000, '2024-06-25 08:17:10', '2024-06-25 08:17:10'),
(100288, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 235000, '2024-06-25 08:17:36', '2024-06-25 08:17:36'),
(100289, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk Sertijab', 630000, '2024-06-25 08:18:15', '2024-06-25 08:18:15'),
(100290, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan Monev IKI TW 1', 75000, '2024-06-25 08:18:51', '2024-06-25 08:18:51'),
(100291, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan Monev LAKIP TW !', 245000, '2024-06-25 08:19:35', '2024-06-25 08:19:35'),
(100292, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 180000, '2024-06-25 08:20:11', '2024-06-25 08:20:11'),
(100293, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan', 163500, '2024-06-25 08:20:54', '2024-06-25 08:20:54'),
(100294, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 210000, '2024-06-25 08:21:46', '2024-06-25 08:21:46'),
(100295, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk Rakor dan Haibil', 720000, '2024-06-25 08:22:23', '2024-06-25 08:22:23'),
(100296, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk Sosialisasi SPI KPK', 840000, '2024-06-25 08:23:12', '2024-06-25 08:23:12'),
(100297, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Banner dan Spanduk', 350000, '2024-06-25 08:23:47', '2024-06-25 08:23:47'),
(100298, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan RKA Pergeseran 2 Tahun 2023', 306000, '2024-06-25 08:25:04', '2024-06-25 08:25:04'),
(100299, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan DPPA Pergeseran 2 Tahun 2023', 430000, '2024-06-25 08:25:38', '2024-06-25 08:25:38'),
(100300, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Penggandaan LK Audited', 165000, '2024-06-25 08:26:13', '2024-06-25 08:26:13'),
(100301, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'X Banner dan Spanduk', 330000, '2024-06-25 08:26:49', '2024-06-25 08:26:49'),
(100302, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 150000, '2024-06-25 08:27:28', '2024-06-25 08:27:28'),
(100303, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Spanduk', 60000, '2024-06-25 08:27:56', '2024-06-25 08:27:56'),
(100304, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Foto Cofy', 250, '2024-06-25 08:28:24', '2024-06-25 08:28:24'),
(100305, '5.1.02.01.01.0027', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Benda Pos', 'Materai', 10000, '2024-06-25 08:29:11', '2024-06-25 08:29:11'),
(100306, '5.1.02.01.01.0029', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Tinta brother', 125000, '2024-06-25 08:33:20', '2024-06-25 08:33:20'),
(100307, '5.1.02.01.01.0029', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Mouse', 220000, '2024-06-25 08:33:59', '2024-06-25 08:33:59');
INSERT INTO `databarang` (`id_barang`, `kode`, `jenis_barang`, `nama_barang`, `harga`, `created_at`, `updated_at`) VALUES
(100308, '5.1.02.01.01.0029', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Kabel Hub', 146100, '2024-06-25 08:34:30', '2024-06-25 08:34:30'),
(100309, '5.1.02.01.01.0029', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Tinta', 127500, '2024-06-25 08:35:01', '2024-06-25 08:35:01'),
(100310, '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Flash Disk', 12000, '2024-06-25 08:35:29', '2024-06-25 08:35:29'),
(100311, '5.1.02.01.01.0029', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Tinta Printer HP GT53', 190000, '2024-06-25 08:36:18', '2024-06-25 08:36:18'),
(100312, '5.1.02.01.01.0029', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Tinta Printer Epson', 170000, '2024-06-25 08:36:52', '2024-06-25 08:36:52'),
(100313, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'SOS PL Sereh B800', 14750, '2024-06-25 08:38:52', '2024-06-25 08:38:52'),
(100314, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Swallow TCB', 16613, '2024-06-25 08:39:25', '2024-06-25 08:39:25'),
(100315, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Cling PK KNGPWP425ml', 8950, '2024-06-25 08:40:18', '2024-06-25 08:40:18'),
(100316, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Porstex', 17750, '2024-06-25 08:40:50', '2024-06-25 08:40:50'),
(100317, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella Mat Orange, Apple, Green', 58250, '2024-06-25 08:41:43', '2024-06-25 08:41:43'),
(100318, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stel1a MAT Caffe', 60950, '2024-06-25 08:42:24', '2024-06-25 12:57:18'),
(100319, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'KMT Plas Chamois', 26200, '2024-06-25 08:43:16', '2024-06-25 08:43:16'),
(100320, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella Mat Green', 60638, '2024-06-25 08:44:03', '2024-06-25 08:44:03'),
(100321, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Panci', 35000, '2024-06-25 08:44:31', '2024-06-25 08:44:31'),
(100322, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Katel', 35000, '2024-06-25 08:44:57', '2024-06-25 08:44:57'),
(100323, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Centong Nasi', 20000, '2024-06-25 08:45:23', '2024-06-25 08:45:23'),
(100324, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Centong Sayur', 27000, '2024-06-25 08:45:50', '2024-06-25 08:45:50'),
(100325, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Serok Penggorengan', 20000, '2024-06-25 08:46:19', '2024-06-25 08:46:19'),
(100326, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Scotchbrite ID37', 15900, '2024-06-25 08:47:00', '2024-06-25 08:47:00'),
(100327, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Scotchbritess3X4D30R', 14900, '2024-06-25 08:47:55', '2024-06-25 08:47:55'),
(100328, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Swallow Deo Orange', 11858, '2024-06-25 08:48:44', '2024-06-25 08:48:44'),
(100329, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Swallow TBC', 16613, '2024-06-25 08:49:14', '2024-06-25 08:49:14'),
(100330, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Dahlia TBC Bouquet 6', 21950, '2024-06-25 08:49:48', '2024-06-25 08:49:48'),
(100331, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Macan Sikat 50S', 13500, '2024-06-25 08:50:17', '2024-06-25 08:50:17'),
(100332, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Swallow Deo Lemon', 13930, '2024-06-25 08:50:51', '2024-06-25 08:50:51'),
(100333, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Lap Piring', 13592, '2024-06-25 08:51:29', '2024-06-25 08:51:29'),
(100334, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Kit Wash and Glow 400ml', 5849, '2024-06-25 08:52:27', '2024-06-25 08:52:27'),
(100335, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'KMT Plass Chamois', 25900, '2024-06-25 08:53:25', '2024-06-25 08:53:25'),
(100336, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Baygon AE Garden 600', 29900, '2024-06-25 08:54:50', '2024-06-25 08:54:50'),
(100337, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Peace PL Sereh 5L', 80300, '2024-06-25 08:56:04', '2024-06-25 08:56:04'),
(100338, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Tessa TP_06 BND 200S', 15040, '2024-06-25 08:56:59', '2024-06-25 08:56:59'),
(100339, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Mitu Wet Lemon BTL', 14300, '2024-06-25 08:57:33', '2024-06-25 08:57:33'),
(100340, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Dahlia TCB 5S', 21950, '2024-06-25 08:58:16', '2024-06-25 08:58:16'),
(100341, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Baygon AE 600', 36450, '2024-06-25 08:59:06', '2024-06-25 08:59:06'),
(100342, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'sunlight Lime B750', 26750, '2024-06-25 08:59:46', '2024-06-25 08:59:46'),
(100343, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Porstex WB Ungu 1lt', 17750, '2024-06-25 09:00:52', '2024-06-25 09:00:52'),
(100345, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Paseo 250s', 9000, '2024-06-25 09:02:18', '2024-06-25 09:02:18'),
(100346, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Antis Gel Nipis 5Lt', 349500, '2024-06-25 09:05:30', '2024-06-25 09:05:30'),
(100347, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Swallow Deo Orange', 13000, '2024-06-25 09:06:46', '2024-06-25 09:06:46'),
(100348, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella Pewangi Ruangan', 29000, '2024-06-25 09:07:28', '2024-06-25 09:07:28'),
(100349, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sendok Makan', 30000, '2024-06-25 09:07:57', '2024-06-25 09:07:57'),
(100350, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Piring Makan', 125000, '2024-06-25 09:08:25', '2024-06-25 09:08:25'),
(100351, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Gelas Ug Kaca', 35000, '2024-06-25 09:09:03', '2024-06-25 09:09:03'),
(100352, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sapu Ijuk Ikat Besar', 50000, '2024-06-25 09:09:42', '2024-06-25 09:09:42'),
(100353, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sikat Ijuk', 17500, '2024-06-25 09:10:15', '2024-06-25 09:10:15'),
(100354, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sapu Lidi Besar', 45000, '2024-06-25 09:10:45', '2024-06-25 09:10:45'),
(100355, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Pengki', 45000, '2024-06-25 09:11:08', '2024-06-25 09:11:08'),
(100356, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Gelas', 50000, '2024-06-25 09:11:33', '2024-06-25 09:11:33'),
(100357, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sendok Makan', 20000, '2024-06-25 09:12:00', '2024-06-25 09:12:00'),
(100358, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Tea Set', 320000, '2024-06-25 09:12:45', '2024-06-25 09:12:45'),
(100359, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Prakis Keeper 203 LS 4.5L', 30000, '2024-06-25 09:13:25', '2024-06-25 09:13:25'),
(100360, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Prakis Keeper 203 LS 6L', 35000, '2024-06-25 09:13:57', '2024-06-25 09:13:57'),
(100361, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Tessa TP_06 BND 200S', 16500, '2024-06-25 09:16:27', '2024-06-25 09:16:27'),
(100362, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Dahlia TCB Tellow', 21320, '2024-06-25 09:17:15', '2024-06-25 09:17:15'),
(100363, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Lion Star BM50 Ref', 29500, '2024-06-25 09:17:58', '2024-06-25 09:17:58'),
(100364, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Scotceritess 3X4 D30R', 16900, '2024-06-25 09:19:19', '2024-06-25 09:19:19'),
(100365, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'KMT Plas Chamois', 26200, '2024-06-25 09:20:28', '2024-06-25 09:20:28'),
(100366, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'YOA Trash Bag 90x120', 34900, '2024-06-25 09:21:17', '2024-06-25 09:21:17'),
(100367, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Klin Pak KT Smph SD', 32900, '2024-06-25 09:21:55', '2024-06-25 09:21:55'),
(100368, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Peace PL Sereh 5L B1500', 33450, '2024-06-25 09:22:31', '2024-06-25 09:22:31'),
(100369, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'WPC Kloset FLWR B600', 19755, '2024-06-25 09:23:15', '2024-06-25 09:23:15'),
(100370, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella all Org MP', 41500, '2024-06-25 09:23:45', '2024-06-25 09:23:45'),
(100371, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Clear PK Ori R500', 13900, '2024-06-25 09:24:18', '2024-06-25 09:24:18'),
(100372, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Ktg Kuning P44G', 8450, '2024-06-25 09:25:14', '2024-06-25 09:25:14'),
(100373, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Baygon Peace 600', 46250, '2024-06-25 09:26:00', '2024-06-25 09:26:00'),
(100374, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'SK LT Lavender, Apple B900', 14350, '2024-06-25 09:26:40', '2024-06-25 09:26:40'),
(100375, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sunlight Lime B750', 38850, '2024-06-25 09:27:21', '2024-06-25 09:27:21'),
(100376, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Stella Mat Spring, Green', 31400, '2024-06-25 09:28:26', '2024-06-25 09:28:26'),
(100377, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Peace PL Sereh 5L B1500', 33450, '2024-06-25 09:28:53', '2024-06-25 09:28:53'),
(100378, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Vixal Biru B750', 17750, '2024-06-25 09:29:32', '2024-06-25 09:29:32'),
(100379, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Kursi susun', 355200, '2024-06-25 09:30:16', '2024-06-25 09:30:16'),
(100380, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Sapu Lidi Ikat Besar', 50000, '2024-06-25 09:31:13', '2024-06-25 09:31:13'),
(100381, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Pengki', 50000, '2024-06-25 09:31:39', '2024-06-25 09:31:39'),
(100382, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'stela Met Caffe', 63950, '2024-06-25 13:00:33', '2024-06-25 13:00:33'),
(100383, '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Glade All Lemon Flower Orange', 13000, '2024-06-25 14:28:25', '2024-06-25 14:28:25'),
(100384, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Baterai AA Alfamart', 24950, '2024-06-25 17:06:26', '2024-06-25 17:06:26'),
(100385, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'TL 25W', 92000, '2024-06-25 17:07:03', '2024-06-25 17:07:03'),
(100386, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Eveready MRKC', 9500, '2024-06-25 17:07:59', '2024-06-25 17:07:59'),
(100387, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'ENR E92BP4AAA Alkaline Power', 25500, '2024-06-25 17:08:44', '2024-06-25 17:08:44'),
(100388, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Tarde Broco', 21300, '2024-06-25 17:09:16', '2024-06-25 17:10:21'),
(100389, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Senter Eveready Besar + Baterai', 64000, '2024-06-25 17:10:05', '2024-06-25 17:10:05'),
(100390, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Senter Eveready Kecil + Baterai', 35000, '2024-06-25 17:10:53', '2024-06-25 17:10:53'),
(100391, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Baterai Eveready Kotak', 13500, '2024-06-25 17:11:24', '2024-06-25 17:11:24'),
(100392, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Baterai Kancing ECR 7016', 16000, '2024-06-25 17:12:06', '2024-06-25 17:12:06'),
(100393, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Alkaline AA 4+3', 37500, '2024-06-25 17:12:43', '2024-06-25 17:12:43'),
(100394, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Alkaline AAA 4+2', 32190, '2024-06-25 17:13:15', '2024-06-25 17:13:15'),
(100395, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Busa Mic', 10000, '2024-06-25 17:13:46', '2024-06-25 17:13:46'),
(100396, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Baterai A2 ABC', 2500, '2024-06-25 17:14:30', '2024-06-25 17:14:30'),
(100397, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Baterai A3 ABC', 2500, '2024-06-25 17:15:12', '2024-06-25 17:15:12'),
(100398, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Logitech Wireless Combo Keyboard & Mouse', 292000, '2024-06-25 17:16:01', '2024-06-25 17:16:01'),
(100399, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'ABC Alkaline', 18900, '2024-06-25 17:16:40', '2024-06-25 17:16:40'),
(100400, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Lampu Philips Led 4Pcs', 205000, '2024-06-25 17:17:22', '2024-06-25 17:17:22'),
(100401, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Tang dan Gegep', 130000, '2024-06-25 17:17:53', '2024-06-25 17:17:53'),
(100402, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Perbaikan Jaringan Listrik', 565000, '2024-06-25 17:18:28', '2024-06-25 17:18:28'),
(100403, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'MCB', 500000, '2024-06-25 17:18:57', '2024-06-25 17:18:57'),
(100404, '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Luthfi Service', 722000, '2024-06-25 17:19:26', '2024-06-25 17:19:26'),
(100405, '5.1.02.01.01.0035', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Suvenir/Cendera Mata', 'T-Shirt', 99900, '2024-06-25 17:21:26', '2024-06-25 17:21:26'),
(100406, '5.1.02.01.01.0036', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat/Bahan untuk Kegiatan Kantor Lainnya', 'Undangan Musrenbang', 5000, '2024-06-25 17:22:38', '2024-06-25 17:22:38'),
(100407, '5.1.02.01.01.0036', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat/Bahan untuk Kegiatan Kantor Lainnya', 'Nutrisi AB Mix', 90000, '2024-06-25 17:23:58', '2024-06-25 17:23:58'),
(100408, '5.1.02.01.01.0036', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat/Bahan untuk Kegiatan Kantor Lainnya', 'Pelet Apung', 10000, '2024-06-25 17:24:24', '2024-06-25 17:24:24'),
(100409, '5.1.02.01.01.0064', 'Belanja Pakaian Dinas Lapangan (PDL)', 'Pakaian Dinas Lapangan', 75000, '2024-06-25 17:26:25', '2024-06-25 17:26:25'),
(100410, '5.1.02.01.02.0003', 'Belanja Komponen-Komponen Peralatan', 'Kursi susun', 444000, '2024-06-25 17:27:23', '2024-06-25 17:27:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenisbarang`
--

CREATE TABLE `jenisbarang` (
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode` varchar(255) NOT NULL,
  `jenis_barang` varchar(255) NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `id_tipe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jenisbarang`
--

INSERT INTO `jenisbarang` (`created_at`, `updated_at`, `kode`, `jenis_barang`, `tipe`, `id_tipe`) VALUES
('2024-04-30 06:48:53', '2024-04-30 06:48:53', '5.1.02.01.01.0001', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 'Belanja Barang Pakai Habis', '5.1.02.01.01  '),
('2024-04-30 06:51:48', '2024-04-30 06:51:48', '5.1.02.01.01.0002', 'Belanja Bahan-Bahan Kimia', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 06:53:58', '2024-04-30 06:53:58', '5.1.02.01.01.0004', 'Belanja Bahan-Bahan Bakar dan Pelumas', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 06:55:15', '2024-04-30 06:55:15', '5.1.02.01.01.0005', 'Belanja Bahan-Bahan Baku', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 06:57:39', '2024-04-30 06:57:39', '5.1.02.01.01.0006', 'Belanja Bahan-Bahan Kimia Nuklir', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 06:59:10', '2024-04-30 06:59:10', '5.1.02.01.01.0007', 'Belanja Bahan-Barang dalam Proses', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:00:37', '2024-04-30 07:00:37', '5.1.02.01.01.0008', 'Belanja Bahan-Bahan/Bibit Tanaman', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:03:24', '2024-04-30 07:03:24', '5.1.02.01.01.0009', 'Belanja Bahan-Isi Tabung Pemadam Kebakaran', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:03:52', '2024-04-30 07:03:52', '5.1.02.01.01.0010', 'Belanja Bahan-Isi Tabung Gas', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:06:52', '2024-04-30 07:06:52', '5.1.02.01.01.0011', 'Belanja Bahan-Bahan/Bibit Ternak/Bibit Ikan', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:07:43', '2024-04-30 07:07:43', '5.1.02.01.01.0012', 'Belanja Bahan-Bahan Lainnya', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:09:43', '2024-04-30 07:09:43', '5.1.02.01.01.0013', 'Belanja Suku Cadang-Suku Cadang Alat Angkutan', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:10:42', '2024-04-30 07:10:42', '5.1.02.01.01.0014', 'Belanja Suku Cadang-Suku Cadang Alat Besar', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:12:42', '2024-04-30 07:12:42', '5.1.02.01.01.0015', 'Belanja Suku Cadang-Suku Cadang Alat Kedokteran', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:13:53', '2024-04-30 07:13:53', '5.1.02.01.01.0016', 'Belanja Suku Cadang-Suku Cadang Alat Laboratorium', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:15:53', '2024-04-30 07:15:53', '5.1.02.01.01.0017', 'Belanja Suku Cadang-Suku Cadang Alat Pemancar', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:16:46', '2024-04-30 07:16:46', '5.1.02.01.01.0018', 'Belanja Suku Cadang-Suku Cadang Alat Studio dan Komunikasi', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:17:30', '2024-04-30 07:17:30', '5.1.02.01.01.0019', 'Belanja Suku Cadang-Suku Cadang Alat Pertanian', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:17:55', '2024-04-30 07:17:55', '5.1.02.01.01.0020', 'Belanja Suku Cadang-Suku Cadang Alat Bengkel', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:19:20', '2024-04-30 07:19:20', '5.1.02.01.01.0022', 'Belanja Suku Cadang-Persediaan dari Belanja Bantuan Sosial', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:20:46', '2024-04-30 07:20:46', '5.1.02.01.01.0023', 'Belanja Suku Cadang-Suku Cadang Lainnya', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:24:52', '2024-04-30 07:24:52', '5.1.02.01.01.0024', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Tulis Kantor', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:26:52', '2024-04-30 07:26:52', '5.1.02.01.01.0025', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kertas dan Cover', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:29:04', '2024-04-30 07:29:04', '5.1.02.01.01.0026', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Cetak', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:30:04', '2024-04-30 07:30:04', '5.1.02.01.01.0027', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Benda Pos', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:32:24', '2024-04-30 07:32:24', '5.1.02.01.01.0028', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Persediaan Dokumen/Administrasi Tender', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:33:24', '2024-04-30 07:33:24', '5.1.02.01.01.0029', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Bahan Komputer', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:35:54', '2024-04-30 07:35:54', '5.1.02.01.01.0030', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perabot Kantor', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:37:54', '2024-04-30 07:37:54', '5.1.02.01.01.0031', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat Listrik', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:39:15', '2024-04-30 07:39:15', '5.1.02.01.01.0032', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perlengkapan Dinas', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:40:15', '2024-04-30 07:40:15', '5.1.02.01.01.0033', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Kaporlap dan Perlengkapan Satwa', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:42:22', '2024-04-30 07:42:22', '5.1.02.01.01.0034', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Perlengkapan Pendukung Olahraga', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:43:22', '2024-04-30 07:43:22', '5.1.02.01.01.0035', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Suvenir/Cendera Mata', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:44:49', '2024-04-30 07:44:49', '5.1.02.01.01.0036', 'Belanja Alat/Bahan untuk Kegiatan Kantor- Alat/Bahan untuk Kegiatan Kantor Lainnya', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:45:49', '2024-04-30 07:45:49', '5.1.02.01.01.0037', 'Belanja Obat-Obatan-Obat', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:47:11', '2024-04-30 07:47:11', '5.1.02.01.01.0038', 'Belanja Obat-Obatan-Obat-Obatan Lainnya', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:48:11', '2024-04-30 07:48:11', '5.1.02.01.01.0039', 'Belanja Barang untuk Dijual/Diserahkan kepada Masyarakat', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:49:30', '2024-04-30 07:49:30', '5.1.02.01.01.0040', 'Belanja Barang untuk Dijual/Diserahkan kepada Pihak Ketiga/Pihak Lain', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:50:18', '2024-04-30 07:50:18', '5.1.02.01.01.0041', 'Belanja Persediaan untuk Tujuan Strategis/Berjaga-jaga-Persediaan untuk Tujuan Strategis/Berjaga-jaga', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:52:26', '2024-04-30 07:52:26', '5.1.02.01.01.0042', 'Belanja Persediaan untuk Tujuan Strategis/Berjaga-jaga-Persediaan untuk Tujuan Strategis/Berjaga-jaga Lainnya', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:53:26', '2024-04-30 07:53:26', '5.1.02.01.01.0043', 'Belanja Natura dan Pakan-Natura', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:55:29', '2024-04-30 07:55:29', '5.1.02.01.01.0044', 'Belanja Natura dan Pakan-Pakan', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:56:29', '2024-04-30 07:56:29', '5.1.02.01.01.0045', 'Belanja Natura dan Pakan-Natura dan Pakan Lainnya', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:57:48', '2024-04-30 07:57:48', '5.1.02.01.01.0046', 'Belanja Persediaan Penelitian-Persediaan Penelitian Biologi', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 07:59:48', '2024-04-30 07:59:48', '5.1.02.01.01.0047', 'Belanja Persediaan Penelitian-Persediaan Penelitian Biologi Lainnya', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:00:00', '2024-04-30 08:00:00', '5.1.02.01.01.0048', 'Belanja Persediaan Penelitian-Persediaan Penelitian Teknologi', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:02:00', '2024-04-30 08:02:00', '5.1.02.01.01.0049', 'Belanja Persediaan Penelitian-Persediaan Penelitian Lainnya', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:02:35', '2024-04-30 08:02:35', '5.1.02.01.01.0050', 'Belanja Persediaan Dalam Proses-Persediaan Dalam Proses', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:04:35', '2024-04-30 08:04:35', '5.1.02.01.01.0051', 'Belanja Persediaan Dalam Proses-Persediaan Dalam Proses Lainnya', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:05:13', '2024-04-30 08:05:13', '5.1.02.01.01.0052', 'Belanja Makanan dan Minuman Rapat', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:06:13', '2024-04-30 08:06:13', '5.1.02.01.01.0053', 'Belanja Makanan dan Minuman Jamuan Tamu', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:24:04', '2024-04-30 08:24:04', '5.1.02.01.01.0054', 'Belanja Penambah Daya Tahan Tubuh', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:25:04', '2024-04-30 08:25:04', '5.1.02.01.01.0055', 'Belanja Makanan dan Minuman pada Fasilitas Pelayanan Urusan Pendidikan', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:26:27', '2024-04-30 08:26:27', '5.1.02.01.01.0056', 'Belanja Makanan dan Minuman pada Fasilitas Pelayanan Urusan Kesehatan', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:27:27', '2024-04-30 08:27:27', '5.1.02.01.01.0057', 'Belanja Makanan dan Minuman pada Fasilitas Pelayanan Urusan Sosial', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:28:39', '2024-04-30 08:28:39', '5.1.02.01.01.0058', 'Belanja Makanan dan Minuman Aktivitas Lapangan', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:29:39', '2024-04-30 08:29:39', '5.1.02.01.01.0059', 'Belanja Pakaian Dinas KDH dan WKDH', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:31:22', '2024-04-30 08:31:22', '5.1.02.01.01.0060', 'Belanja Pakaian Dinas dan Atribut Pimpinan dan Anggota DPRD', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:32:22', '2024-04-30 08:32:22', '5.1.02.01.01.0061', 'Belanja Pakaian Sipil Harian (PSH)', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:33:30', '2024-04-30 08:33:30', '5.1.02.01.01.0062', 'Belanja Pakaian Sipil Lengkap (PSL)', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:34:30', '2024-04-30 08:34:30', '5.1.02.01.01.0063', 'Belanja Pakaian Dinas Harian (PDH)', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:35:46', '2024-04-30 08:35:46', '5.1.02.01.01.0064', 'Belanja Pakaian Dinas Lapangan (PDL)', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:36:46', '2024-04-30 08:36:46', '5.1.02.01.01.0065', 'Belanja Pakaian Sipil Resmi (PSR)', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:37:42', '2024-04-30 08:37:42', '5.1.02.01.01.0066', 'Belanja Pakaian Dinas Upacara (PDU)', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:38:42', '2024-04-30 08:38:42', '5.1.02.01.01.0067', 'Belanja Pakaian Penyelamatan', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:39:54', '2024-04-30 08:39:54', '5.1.02.01.01.0068', 'Belanja Pakaian Siaga', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:40:54', '2024-04-30 08:40:54', '5.1.02.01.01.0069', 'Belanja Pakaian Teknik', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:41:47', '2024-04-30 08:41:47', '5.1.02.01.01.0070', 'Belanja Pakaian Pelatihan Kerja', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:42:47', '2024-04-30 08:42:47', '5.1.02.01.01.0071', 'Belanja Pakaian Kerja Laboratorium', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:43:53', '2024-04-30 08:43:53', '5.1.02.01.01.0072', 'Belanja Pakaian Kerja Bengkel', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:44:53', '2024-04-30 08:44:53', '5.1.02.01.01.0073', 'Belanja Pakaian KORPRI', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:47:29', '2024-04-30 08:47:29', '5.1.02.01.01.0074', 'Belanja Pakaian Adat Daerah', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:48:29', '2024-04-30 08:48:29', '5.1.02.01.01.0075', 'Belanja Pakaian Batik Tradisional', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:49:31', '2024-04-30 08:49:31', '5.1.02.01.01.0076', 'Belanja Pakaian Olahraga', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:50:06', '2024-04-30 08:50:06', '5.1.02.01.01.0077', 'Belanja Pakaian Paskibraka', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 08:52:06', '2024-04-30 08:52:06', '5.1.02.01.01.0078', 'Belanja Pakaian Jas/Safari', 'Belanja Barang Pakai Habis', '5.1.02.01.01'),
('2024-04-30 09:07:52', '2024-04-30 09:07:52', '5.1.02.01.02.0001', 'Belanja Komponen-Komponen Jembatan Baja', 'Belanja Barang Tak Habis Pakai', '5.1.02.01.02'),
('2024-04-30 09:09:52', '2024-04-30 09:09:52', '5.1.02.01.02.0002', 'Belanja Komponen-Komponen Jembatan Pratekan', 'Belanja Barang Tak Habis Pakai', '5.1.02.01.02'),
('2024-04-30 09:10:42', '2024-04-30 09:10:42', '5.1.02.01.02.0003', 'Belanja Komponen-Komponen Peralatan', 'Belanja Barang Tak Habis Pakai', '5.1.02.01.02'),
('2024-04-30 09:11:42', '2024-04-30 09:11:42', '5.1.02.01.02.0004', 'Belanja Komponen-Komponen Rambu- Rambu', 'Belanja Barang Tak Habis Pakai', '5.1.02.01.02'),
('2024-04-30 09:13:42', '2024-04-30 09:13:42', '5.1.02.01.02.0005', 'Belanja Komponen-Attachment', 'Belanja Barang Tak Habis Pakai', '5.1.02.01.02'),
('2024-04-30 09:14:59', '2024-04-30 09:14:59', '5.1.02.01.02.0006', 'Belanja Komponen-Komponen Lainnya', 'Belanja Barang Tak Habis Pakai', '5.1.02.01.02'),
('2024-04-30 09:15:59', '2024-04-30 09:15:59', '5.1.02.01.02.0007', 'Belanja Pipa-Pipa Air Besi Tuang (DCI)', 'Belanja Barang Tak Habis Pakai', '5.1.02.01.02'),
('2024-04-30 09:16:10', '2024-04-30 09:16:10', '5.1.02.01.02.0008', 'Belanja Pipa-Pipa Asbes Semen (ACP)', 'Belanja Barang Tak Habis Pakai', '5.1.02.01.02'),
('2024-04-30 09:17:10', '2024-04-30 09:17:10', '5.1.02.01.02.0009', 'Belanja Pipa-Pipa Baja', 'Belanja Barang Tak Habis Pakai', '5.1.02.01.02'),
('2024-04-30 09:18:10', '2024-04-30 09:18:10', '5.1.02.01.02.0010', 'Belanja Pipa-Pipa Beton Pratekan', 'Belanja Barang Tak Habis Pakai', '5.1.02.01.02'),
('2024-04-30 09:21:16', '2024-04-30 09:21:16', '5.1.02.01.02.0011', 'Belanja Pipa-Pipa Fiber Glass', 'Belanja Barang Tak Habis Pakai', '5.1.02.01.02'),
('2024-04-30 09:22:00', '2024-04-30 09:22:00', '5.1.02.01.02.0012', 'Belanja Pipa-Pipa Plastik PVC (UPVC)', 'Belanja Barang Tak Habis Pakai', '5.1.02.01.02'),
('2024-04-30 09:22:12', '2024-04-30 09:22:12', '5.1.02.01.02.0013', 'Belanja Pipa-Pipa Lainnya', 'Belanja Barang Tak Habis Pakai', '5.1.02.01.02'),
('2024-04-30 09:25:07', '2024-04-30 09:25:07', '5.1.02.01.03.0001', 'Belanja Komponen Bekas dan Pipa Bekas- Komponen Bekas', 'Belanja Barang Bekas Dipakai', '5.1.02.01.03'),
('2024-04-30 09:26:07', '2024-04-30 09:26:07', '5.1.02.01.03.0002', 'Belanja Komponen Bekas dan Pipa Bekas- Pipa Bekas', 'Belanja Barang Bekas Dipakai', '5.1.02.01.03'),
('2024-04-30 09:27:07', '2024-04-30 09:27:07', '5.1.02.01.03.0003', 'Belanja Komponen Bekas dan Pipa Bekas- Komponen Bekas dan Pipa Bekas Lainnya', 'Belanja Barang Bekas Dipakai', '5.1.02.01.03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_02_24_055711_create_barangs_table', 1),
(7, '2024_02_24_061320_create_databarangs_table', 1),
(8, '2024_03_01_113046_create_barangkeluars_table', 2),
(9, '2024_03_03_053117_create_users_table', 3),
(10, '2024_03_08_102828_create_barangkeluars_table', 4),
(11, '2024_03_08_214253_create_barangkeluars_table', 5),
(12, '2024_03_12_162108_create_barangmasuks_table', 6),
(13, '2024_03_12_170919_create_barangmasuks_table', 7),
(14, '2024_03_14_134917_create_permission_tables', 8),
(15, '2024_03_17_141924_create_users_table', 9),
(16, '2024_03_21_190437_create_surats_table', 10),
(17, '2024_03_23_141515_create_pengajuans_table', 11),
(18, '2024_03_23_220711_create_pengajuan_barangs_table', 12),
(19, '2024_03_23_223034_make_status_nullable_in_pengajuan_barangs_table', 13),
(20, '2024_03_26_151315_add_timestamps_to_databarang_table', 14),
(21, '2024_03_28_144633_create_surats_table', 15),
(22, '2024_04_02_213047_add_timestamps_to_barangkeluar_table', 15),
(23, '2024_04_02_214841_add_timestamps_to_barangmasuk_table', 16),
(24, '2024_04_02_221959_add_harga_to_databarang_table', 17),
(25, '2024_04_02_231837_create_barangkeluars_table', 18),
(26, '2024_04_20_160035_create_barangmasuks_table', 19),
(27, '2024_04_20_161210_create_barangmasuks_table', 20),
(28, '2024_04_22_233011_create_surats_table', 21),
(29, '2024_04_23_203123_create_surats_table', 22),
(30, '2024_04_29_215635_create_jenisbarangs_table', 23),
(31, '2024_04_29_221342_create_jenisbarangs_table', 24),
(32, '2024_04_30_134428_create_jenisbarangs_table', 25),
(33, '2024_05_08_153150_add_created_by_to_barangmasuk_table', 26),
(34, '2024_05_08_154553_change_created_by_nullable_in_barangmasuk_table', 27),
(35, '2024_05_08_154848_change_created_by_nullable_in_barangmasuk_table', 28),
(36, '2024_05_08_210023_add_created_by_to_barangkeluar_table', 29),
(37, '2024_05_10_192014_create_pengajuan_barangs_table', 30),
(38, '2024_06_02_211627_create_surats_table', 31),
(39, '2024_06_03_183424_create_ttd_surats_table', 32),
(40, '2024_06_03_190202_create_surat_ttds_table', 33),
(41, '2024_06_03_203830_create_ttd_surats_table', 34),
(42, '2024_06_23_222202_add_columns_to_barangmasuk_table', 35),
(43, '2024_06_30_175301_add_kode_to_barangmasuk', 36),
(44, '2024_07_02_134555_add_kode_to_barangkeluar_table', 37);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan`
--

CREATE TABLE `pengajuan` (
  `id_pengajuan` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `jml_barang` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_barang`
--

CREATE TABLE `pengajuan_barang` (
  `id_pengajuan` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `jml_barang` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengajuan_barang`
--

INSERT INTO `pengajuan_barang` (`id_pengajuan`, `created_at`, `updated_at`, `nama`, `jabatan`, `nama_barang`, `jml_barang`, `status`, `created_by`) VALUES
(10001, '2024-05-10 12:49:37', '2024-05-18 13:59:23', 'Didi', 'pengguna', 'Paku 5cm', '5', 'Ditolak', 'pengguna@gmail.com'),
(10002, '2024-05-10 14:09:01', '2024-05-18 13:21:10', 'mimin', 'pengguna', 'Paku 5cm', '5', 'Diterima', 'mimin@gmail.com'),
(10003, '2024-05-28 07:46:25', '2024-06-07 04:08:56', 'Didi', 'pengguna', 'Kompos Daun', '2', 'Diterima', 'pengguna@gmail.com'),
(10004, '2024-06-07 04:32:05', '2024-06-07 04:32:05', 'Didi', 'pengguna', 'Paku 5cm', '2', NULL, 'pengguna@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat`
--

CREATE TABLE `surat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `no_surat` varchar(255) DEFAULT NULL,
  `persediaan` varchar(255) NOT NULL,
  `nilai` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `semester` varchar(255) NOT NULL,
  `unit_kerja` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `surat`
--

INSERT INTO `surat` (`id`, `created_at`, `updated_at`, `no_surat`, `persediaan`, `nilai`, `tanggal`, `semester`, `unit_kerja`) VALUES
(5, '2024-06-03 15:10:05', '2024-06-09 19:33:43', 'Nomor: TU.04/1585-BKAD/XII/2023 Tanggal 10 Juli 2023', 'Belanja Suku Cadang-Suku Cadang Alat Pertanian', 100000, '2024-06-03', '1', 'KELURAHAN CIBADAK'),
(18, '2024-06-13 03:33:34', '2024-06-13 03:33:34', 'TU.04/1585-BKAD/XII/2023 Tanggal 10 Juli 2024', 'Belanja Bahan-Bahan Baku', 500000, '2024-06-13', '2', 'KECAMATAN ASTANAANYAR'),
(19, '2024-07-14 16:00:46', '2024-07-14 16:00:46', 'TU.04/1585-BKAD/XII/2023 Tanggal 10 Juli 2024', 'Belanja Bahan-Bahan Bangunan dan Konstruksi', 50000, '2024-07-14', '1', 'KELURAHAN KARASAK');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ttd_surat`
--

CREATE TABLE `ttd_surat` (
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_kerja` varchar(255) NOT NULL,
  `nip1` bigint(20) NOT NULL,
  `nama1` varchar(255) NOT NULL,
  `jabatan1` varchar(255) NOT NULL,
  `nip2` bigint(20) NOT NULL,
  `nama2` varchar(255) NOT NULL,
  `jabatan2` varchar(255) NOT NULL,
  `nip3` bigint(20) DEFAULT NULL,
  `nama3` varchar(255) DEFAULT NULL,
  `jabatan3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ttd_surat`
--

INSERT INTO `ttd_surat` (`created_at`, `updated_at`, `unit_kerja`, `nip1`, `nama1`, `jabatan1`, `nip2`, `nama2`, `jabatan2`, `nip3`, `nama3`, `jabatan3`) VALUES
('2024-06-03 13:43:07', '2024-07-15 17:53:34', 'KECAMATAN ASTANAANYAR', 197306292008011002, 'THOMAS BAYU AJI, S.IP', 'Pejabat Penatausahaan Pengguna Barang', 198812122020121009, 'HAMIDIN NURFALAH, S.IP', 'Pengurus Barang Pengguna', 196809041990061001, 'Drs. H.Amin Jarkasih, M.M', 'Pengguna Barang'),
('2024-06-03 15:05:58', '2024-07-02 17:35:11', 'KELURAHAN CIBADAK', 197304162009011003, 'Dadan Suhendra, ST.,MM', 'Kuasa Pengguna Barang', 196606051988032015, 'An An Sumarni', 'Pengurus Barang Pengguna', NULL, NULL, NULL),
('2024-07-02 16:18:35', '2024-07-02 16:18:35', 'KELURAHAN KARANGANYAR', 197202142008011003, 'ATIM SUPRIATIM, S.Pd', 'Kuasa Pengguna Barang', 197906052010011003, 'JAMARI, SE', 'Pengurus Barang Pennguna', NULL, NULL, NULL),
('2024-07-02 16:20:56', '2024-07-02 16:20:56', 'KELURAHAN KARASAK', 196508101996011002, 'AHMAD SOPIAN, S.Pd', 'Kuasa Pengguna Barang', 197603012009011005, 'YOGA ASMARA', 'Pengurus Barang Pennguna', NULL, NULL, NULL),
('2024-07-02 16:23:25', '2024-07-02 16:23:25', 'KELURAHAN NYENGSERET', 197907232000032002, 'YANTI, SE', 'Kuasa Pengguna Barang', 196608122007012022, 'DEDEH KOMARIAH, S.E', 'Pengurus Barang Pennguna', NULL, NULL, NULL),
('2024-07-02 16:28:47', '2024-07-02 16:28:47', 'KELURAHAN PANJUNAN', 1919681012200604100, 'H.IYA SUNARYA, S.IP,.M.Si', 'Kuasa Pengguna Barang', 196508281997021001, 'OHAN', 'Pengurus Barang Pennguna', NULL, NULL, NULL),
('2024-06-12 14:25:50', '2024-06-12 14:55:40', 'KELURAHAN PELINDUNG HEWAN', 198007072009011008, 'HENDRA YULIANTO, SE', 'Kuasa Pengguna Barang', 197906052010011003, 'JAMARI, SE', 'Pengurus Barang Pennguna', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nip` int(11) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('pengelola_barang','ketua','kelurahan','pengguna') NOT NULL DEFAULT 'pengelola_barang',
  `remember_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `nip`, `jabatan`, `email_verified_at`, `password`, `role`, `remember_token`) VALUES
(3, 'ikanurmalika22@gmail.com', 'Rahmat', 1123546, 'kelurahan', NULL, '$2y$12$IrChEhhWSKGTAAzt/DZ6Du9/b.ghEXY7oKuhYunAMtt.MVKNhiODq', 'kelurahan', NULL),
(4, 'pengguna@gmail.com', 'wiwit', 1123546, 'pengguna', NULL, '$2y$12$c.hV5xRYMs0SEFBoobsexuWqmlEjbPxGiunBCa09KuRddcNjDLhiu', 'pengguna', NULL),
(17, 'ketua@gmail.com', 'ketua', 1226436, 'ketua', NULL, '$2y$12$PPLS4Uz0INGlK2XT.a1vBeEg/5W0hwwUTKCviESU4E7YQ969TV7wC', 'ketua', NULL),
(32, 'pengelola2@gmail.com', 'pengelola', 1234, 'pengelola', NULL, '$2y$12$XM4m6D28O.Iq/C.9CxRVROD/5qJGF0gP7skRi7fQcYljpcFzoVuQ6', 'pengelola_barang', NULL),
(33, 'pengelola@gmail.com', 'hamid', 1234560908, 'pengelola', NULL, '$2y$12$T4zYdVi58blRXQvARgHRUeCF6nEzrNas5A/dWJyKDgcyTcAcngBBi', 'pengelola_barang', NULL),
(37, 'panjunan@gmail.com', 'panjunan', 12345, 'kelurahan', NULL, '$2y$12$O7NkGFy5.kSMQp/c9M6G7.PQ9RPnlw/t0ThFfZvmZxafSotPun/ze', 'kelurahan', NULL),
(38, 'karasak@gmail.com', 'karasak', 125678578, 'kelurahan', NULL, '$2y$12$rPSY4r8MdFVnaTPorQyTpO7MjRzyjYFOgsVRsmZBTB7/12hs08oha', 'kelurahan', NULL),
(40, 'pelindunghewan@gmail.com', 'pelindunghewan', 123456, 'kelurahan', NULL, '$2y$12$NNkesuPG3/etayZ5z0rRwuX4f7DmvMYEj7eFe0aOrM2I6BpC22TIS', 'kelurahan', NULL),
(41, 'caringin@gmail.com', 'caringin', 1234567, 'kelurahan', NULL, '$2y$12$6RrhkkBQiNYHEVidpQmAAu3ZwZxwcGEdSvCqQh2xuO579vUHwetqu', 'kelurahan', NULL),
(43, 'cibadak@gmail.com', 'cibadak', 0, 'kelurahan', NULL, '$2y$12$1kY952XODhq0T1NSOCu3H.eKLa8dm5zKDlKP2.GsiX02v9HuEyyPW', 'kelurahan', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD UNIQUE KEY `barang_id_barang_unique` (`id_barang`);

--
-- Indeks untuk tabel `barangkeluar`
--
ALTER TABLE `barangkeluar`
  ADD UNIQUE KEY `barangkeluar_id_transaksi_keluar_unique` (`id_transaksi_keluar`);

--
-- Indeks untuk tabel `barangmasuk`
--
ALTER TABLE `barangmasuk`
  ADD UNIQUE KEY `barangmasuk_id_transaksi_masuk_unique` (`id_transaksi_masuk`);

--
-- Indeks untuk tabel `databarang`
--
ALTER TABLE `databarang`
  ADD UNIQUE KEY `databarang_id_barang_unique` (`id_barang`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jenisbarang`
--
ALTER TABLE `jenisbarang`
  ADD UNIQUE KEY `jenisbarang_kode_unique` (`kode`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD UNIQUE KEY `pengajuan_id_pengajuan_unique` (`id_pengajuan`);

--
-- Indeks untuk tabel `pengajuan_barang`
--
ALTER TABLE `pengajuan_barang`
  ADD UNIQUE KEY `pengajuan_barang_id_pengajuan_unique` (`id_pengajuan`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ttd_surat`
--
ALTER TABLE `ttd_surat`
  ADD UNIQUE KEY `ttd_surat_unit_kerja_unique` (`unit_kerja`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `surat`
--
ALTER TABLE `surat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
