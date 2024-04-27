-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 27, 2024 at 03:41 PM
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
-- Database: `DB_POST_SIB6`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `jenis_produk`
--

CREATE TABLE `jenis_produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `jenis_produk`
--

INSERT INTO `jenis_produk` (`id`, `nama`) VALUES
(1, 'elektroniks'),
(2, 'furniture'),
(3, 'makanan'),
(4, 'minuman'),
(5, 'komputer'),
(6, 'Makanan Ringan'),
(7, 'Minuman soda'),
(8, 'Makanan Berat'),
(11, 'makanan ringan');

-- --------------------------------------------------------

--
-- Table structure for table `kartu`
--

CREATE TABLE `kartu` (
  `id` int(11) NOT NULL,
  `kode` varchar(6) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `iuran` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kartu`
--

INSERT INTO `kartu` (`id`, `kode`, `nama`, `diskon`, `iuran`) VALUES
(1, 'GOLD', 'Gold Utama', 0.05, 150000),
(2, 'PLAT', 'Platinum Jaya', 0.1, 150000),
(3, 'SLV', 'Silver', 0.025, 50000),
(4, 'NO', 'Non Member', 0, 0),
(7, 'PGU', 'Perunggu', 0.5, 2000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `lihat_vendor`
-- (See below for the actual view)
--
CREATE TABLE `lihat_vendor` (
`nomor` varchar(4)
,`nama` varchar(40)
,`kota` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `role` enum('admin','manager','staff') NOT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `fullname`, `username`, `password`, `role`, `foto`) VALUES
(1, 'Siti', 'siti', 'siti', 'staff', 'siti.jpg'),
(2, 'Test', 'test', 'test', 'staff', 'test.jpg'),
(3, 'Admin', 'admin', '967a9f8fa757dfb5fdda6e5e08579869fb9b2ae3', 'admin', 'admin.jpg'),
(4, 'Staff', 'staff', 'ae186d20e1a1b46737a98ef69fc0896ba7cca385', 'staff', 'staff.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_11_03_014141_create_staff_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `jk` char(1) NOT NULL,
  `tmp_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `kartu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `kode`, `nama`, `jk`, `tmp_lahir`, `tgl_lahir`, `email`, `kartu_id`) VALUES
(1, 'C001', 'Agung Sedayu Group', 'L', 'Solo', '2010-01-01', 'sedayu@gmail.com', 1),
(2, 'C002', 'Pandan Wangi', 'P', 'Yogyakarta', '1950-01-01', 'wangi@gmail.com', 2),
(3, 'C003', 'Sekar Mirah', 'P', 'Kediri', '1983-02-20', 'mirah@yahoo.com', 1),
(4, 'C004', 'Swandaru Geni', 'L', 'Kediri', '1981-01-04', 'swandaru@yahoo.com', 4),
(5, 'C005', 'Pradabashu', 'L', 'Pati', '1985-04-02', 'prada85@gmail.com', 2),
(6, 'C006', 'Gayatri Dwi', 'P', 'Jakarta', '1987-11-28', 'gaya87@gmail.com', 1),
(7, 'C007', 'Dewi Gyat', 'P', 'Jakarta', '1988-12-01', 'giyat@gmail.com', 1),
(8, 'C008', 'Andre Haru', 'L', 'Surabaya', '1990-07-15', 'andre.haru@gmail.com', 4),
(9, 'C009', 'Ahmad Hasan', 'L', 'Surabaya', '1992-10-15', 'ahasan@gmail.com', 4),
(10, 'C010', 'Cassanndra', 'P', 'Belfast', '1990-11-20', 'casa90@gmail.com', 1),
(11, 'K0010', 'Andi Wijaya', 'L', 'Tangerang', '2023-11-07', 'andi@gmail.com', 2),
(12, 'K0011', 'Ira', 'P', 'Jakarta', '2023-11-07', 'ira@gmail.com', 4);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `nokuitansi` varchar(10) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jumlah` double DEFAULT NULL,
  `ke` int(11) DEFAULT NULL,
  `pesanan_id` int(11) NOT NULL,
  `status_pembayaran` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `nokuitansi`, `tanggal`, `jumlah`, `ke`, `pesanan_id`, `status_pembayaran`) VALUES
(1, 'MD001', '0000-00-00', 30000, 1, 11, 'Lunas'),
(2, 'MD002', '2023-10-10', 30000, 2, 11, 'Lunas'),
(3, 'MD003', '2023-10-10', 30000, 1, 11, 'Lunas'),
(4, 'MD004', '2023-10-10', 15000, 1, 2, ''),
(5, 'MD005', '2023-10-10', 18000, 2, 2, 'Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(11) NOT NULL,
  `tanggal` varchar(45) DEFAULT NULL,
  `nomor` varchar(10) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `tanggal`, `nomor`, `produk_id`, `jumlah`, `harga`, `vendor_id`) VALUES
(1, '2019-10-10', 'P001', 1, 2, 3500000, 1),
(2, '2019-11-20', 'P002', 2, 5, 5500000, 2),
(3, '2019-12-12', 'P003', 2, 5, 5400000, 1),
(4, '2020-01-20', 'P004', 7, 200, 1800, 3),
(5, '2020-01-20', 'P005', 5, 100, 2300, 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pembelian_produk_vendor`
-- (See below for the actual view)
--
CREATE TABLE `pembelian_produk_vendor` (
`id` int(11)
,`tanggal` varchar(45)
,`nomor` varchar(10)
,`jumlah` int(11)
,`harga` double
,`nama` varchar(45)
,`nama_vendor` varchar(40)
,`kontak` varchar(40)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `penjualan_produk`
-- (See below for the actual view)
--
CREATE TABLE `penjualan_produk` (
`id` int(11)
,`total` double
,`nama_pelanggan` varchar(45)
,`kode_produk` varchar(10)
,`nama_produk` varchar(45)
,`jenis_produk` varchar(45)
,`qty` int(11)
,`harga_jual` double
);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 9, 'token', 'f3aa341b43ce08e885ede4e6131a2c6c929045d90c244e30a479bdff6e88a7ba', '[\"*\"]', '2023-12-07 19:17:52', NULL, '2023-12-07 19:16:55', '2023-12-07 19:17:52'),
(2, 'App\\Models\\User', 7, 'token', 'eb93b37bfd01e688d57efc50bd7b93e1ee1de2cc2c2a2487ad3fcda006c13ce8', '[\"*\"]', '2023-12-10 20:36:42', NULL, '2023-12-10 20:36:04', '2023-12-10 20:36:42'),
(3, 'App\\Models\\User', 7, 'token', '3d50a4f50c3564ba98b07c42f699277e2c811875b40949e30c7237b3fa42a598', '[\"*\"]', NULL, NULL, '2023-12-10 22:36:55', '2023-12-10 22:36:55'),
(4, 'App\\Models\\User', 7, 'token', 'f0bd20b0ed18a2925352b324f29a3810eaa5884c8c3a1a5621c7f18eeb1ba4e7', '[\"*\"]', '2023-12-10 22:44:54', NULL, '2023-12-10 22:42:55', '2023-12-10 22:44:54'),
(5, 'App\\Models\\User', 1, 'token', '39053abd3fe0d98710bb64b03669adc182667896e6542edc04e014424bf94b0e', '[\"*\"]', NULL, NULL, '2023-12-20 18:11:12', '2023-12-20 18:11:12');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `pelanggan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `tanggal`, `total`, `pelanggan_id`) VALUES
(1, '2015-11-04', 9720000, 1),
(2, '2015-11-04', 17500, 3),
(3, '2015-11-04', 0, 6),
(4, '2015-11-04', 0, 7),
(5, '2015-11-04', 0, 10),
(6, '2015-11-04', 0, 2),
(7, '2015-11-04', 0, 5),
(8, '2015-11-04', 0, 4),
(9, '2015-11-04', 0, 8),
(10, '2015-11-04', 0, 9),
(11, '2015-11-04', 30000, 9);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_items`
--

CREATE TABLE `pesanan_items` (
  `id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `pesanan_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pesanan_items`
--

INSERT INTO `pesanan_items` (`id`, `produk_id`, `pesanan_id`, `qty`, `harga`) VALUES
(1, 1, 1, 1, 5040000),
(2, 3, 1, 1, 4680000),
(3, 5, 2, 5, 3500),
(6, 5, 3, 10, 3500),
(7, 1, 3, 1, 5040000),
(9, 5, 5, 10, 3500),
(10, 5, 6, 20, 3500);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pesanan_pelanggan_kartu`
-- (See below for the actual view)
--
CREATE TABLE `pesanan_pelanggan_kartu` (
`id` int(11)
,`tanggal` date
,`total` double
,`kode` varchar(10)
,`nama` varchar(45)
,`nama_kartu` varchar(45)
,`diskon` double
);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `harga_beli` double NOT NULL,
  `harga_jual` double NOT NULL,
  `stok` int(11) NOT NULL,
  `min_stok` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `jenis_produk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `kode`, `nama`, `harga_beli`, `harga_jual`, `stok`, `min_stok`, `foto`, `deskripsi`, `jenis_produk_id`) VALUES
(1, 'TV01', 'Televisi 21 inchs', 3500000, 50500000, 5, 2, '', NULL, 1),
(2, 'TV02', 'Televisi 40 inch', 5500000, 7440000, 4, 2, NULL, NULL, 1),
(3, 'K001', 'Kulkas 2 pintu', 3500000, 4680000, 6, 2, '', NULL, 1),
(4, 'M001', 'Meja Makan', 500000, 600000, 4, 3, NULL, NULL, 2),
(5, 'TK01', 'Teh Kotak', 3000, 3500, 6, 10, 'foto-5.png', NULL, 4),
(6, 'PC01', 'PC Desktop HP', 7000000, 9984000, 9, 2, NULL, NULL, 5),
(7, 'TB01', 'Teh Botol', 2000, 2500, 53, 10, 'foto-7.jpg', NULL, 4),
(8, 'AC01', 'Notebook Acer S', 8000000, 11232000, 7, 2, NULL, NULL, 5),
(9, 'LN01', 'Notebook Lenovo', 9000000, 12480000, 9, 2, NULL, NULL, 5),
(11, 'L005', 'Laptop Lenovo', 13000000, 16000000, 5, 2, '', NULL, 1),
(15, 'L112', 'Kopi', 20000, 30000, 10, 15, 'foto-15.png', 'Luwak White Coffee merupakan bubuk biji kopi luwak yang dikombinasikan dengan gurihnya krimer serta manisnya gula. Keharuman kopi serta rasa manisnya yang pas juga membuat popularitas Luwak White Coffee melejit.', 4),
(16, 'L113', 'Teh Sosro 2', 10000, 15000, 10, 12, '.png', NULL, 1),
(18, 'L0015', 'Laptop Asus', 3000000, 5000000, 10, 20, 'foto-65542ffa66604.jpg', NULL, 1),
(19, 'TV0115', 'Televisi 22 inc`', 3500000, 50500000, 5, 2, NULL, NULL, 1),
(20, 'TV0116', 'Televisi 23 inc', 3500000, 50500000, 5, 2, NULL, NULL, 1),
(21, 'TV0117', 'Televisi 24 inc', 3500000, 50500000, 5, 2, NULL, NULL, 1),
(22, 'TV0118', 'Televisi 25 inc', 3500000, 50500000, 5, 2, NULL, NULL, 1),
(24, 'TV0120', 'Televisi 27 inc', 3500000, 50500000, 5, 2, NULL, NULL, 1),
(25, 'TV0121', 'Televisi 28 inc', 3500000, 50500000, 5, 2, NULL, NULL, 1),
(26, 'TV0122', 'Televisi 29 inc', 3500000, 50500000, 5, 2, NULL, NULL, 1),
(27, 'THP001', 'Teh Pucuk', 4000, 5000, 10, 2, 'pucuk.jpg', 'Teh pucuk adalah', 4),
(28, 'THP002', 'Teh Pucuk2', 4000, 5000, 10, 2, 'pucuk.jpg', 'Teh pucuk adalah', 4),
(29, 'hp001', 'samsung', 5000000, 6000000, 30, 5, 'samsung.jpg', 'barang baru datang', 1),
(30, 'hp002', 'vivo', 4000000, 5000000, 30, 5, 'vivo.jpg', 'barang baru datang', 1),
(31, 'hp003', 'infinix', 2000000, 3000000, 30, 5, 'infinix.jpg', 'barang baru datang', 1),
(32, 'hp004', 'samsung duos', 5000000, 6000000, 40, 5, 'samsung.jpg', 'barang baru datang', 1),
(33, 'hp005', 'vivo', 4000000, 5000000, 30, 5, 'vivo.jpg', 'barang baru datang', 1),
(34, 'hp006', 'infinix', 2000000, 3000000, 30, 5, 'infinix.jpg', 'barang baru datang', 1),
(35, 'hp02', 'samsung', 5000000, 6000000, 30, 5, 'samsung,jpg', 'barang baru datang', 1),
(36, 'hp04', 'infinix', 2000000, 3000000, 30, 5, 'infinix,jpg', 'barang baru datang', 1),
(37, 'hp303', 'vivo', 4000000, 5000000, 30, 5, 'vivo,jpg', 'barang baru datang', 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nip` char(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `role` enum('admin','manager','staff','pelanggan') NOT NULL DEFAULT 'pelanggan',
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `foto`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$b17tDHyYBc7.6b7hx.Nu9uXW6DBPH/DU8QIgvzrKpMs98pRo9apiG', NULL, 'admin', NULL, '2023-11-22 18:56:50', '2023-11-22 18:56:50'),
(2, 'manager', 'manager@gmail.com', NULL, '$2y$10$pyR12F61/cj5YwYHzy8VvOC7OtjTmL/YsRdCkY5QqHuor1aIHDLLy', NULL, 'manager', NULL, '2023-11-26 19:02:58', '2023-11-26 19:02:58'),
(3, 'Pelanggan', 'pelanggan@gmail.com', NULL, '$2y$10$CUIG1jWkBQuJV6ufY6L2cuTArsphJt0yTLB/TTM3OlReo1v/pRkxS', NULL, 'pelanggan', NULL, '2023-11-26 19:03:41', '2023-11-26 19:03:41'),
(4, 'Staff1', 'staff1@gmail.com', NULL, '$2y$10$8e0vIo8ZMTrmv8iI3SUHhOKSGxwFpBt7IDtuSpX2IhZbc7DqH7oDK', NULL, 'manager', 'gCdOXXYV5FPhAWtTqO4vJAyfU9icPJhsfE68h9Qf.jpg.jpg', '2023-11-26 20:48:29', '2023-11-29 21:13:55'),
(5, 'Pelanggan2', 'pelanggan2@gmail.com', NULL, '$2y$10$8i8YZlXfYrwQdChuF/zLZeEIpGE.peA0uwwn7pHaOBeYYwn9lE8ye', NULL, 'pelanggan', NULL, '2023-11-26 21:04:46', '2023-11-26 21:04:46'),
(6, 'Pelanggan 3', 'pelanggan3@gmail.com', NULL, '$2y$10$fjkT4wW5ddzwyzWH2dmeG.t/12WuyHQNih.kzKb1HTn4bmafdQ5xu', NULL, 'pelanggan', NULL, '2023-11-26 21:18:15', '2023-11-26 21:18:15'),
(7, 'Pelanggan 4', 'pelanggan4@gmail.com', NULL, '$2y$10$y3JSDB3qjBWWfBsFGnQ37.RpBUAFFBELXqmE9CvT319NfSHS9eX86', NULL, 'staff', NULL, '2023-11-27 21:25:17', '2023-11-27 21:25:17'),
(9, 'pelanggan5', 'pelanggan5@gmail.com', NULL, '$2y$10$uGBXu5BiJZsiIH8NDA8Fw.o9hdlLcF6ry0jFA1Fjs8W1BnQZ8jf0K', NULL, 'pelanggan', NULL, '2023-12-07 18:59:56', '2023-12-07 18:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `nomor` varchar(4) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `kota` varchar(30) DEFAULT NULL,
  `kontak` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id`, `nomor`, `nama`, `kota`, `kontak`) VALUES
(1, 'V001', 'PT Guna Samudra', 'Surabaya', 'Ali Nurdin'),
(2, 'V002', 'PT Pondok C9', 'Depok', 'Putri Ramadhani'),
(3, 'V003', 'CV Jaya Raya Semesta', 'Jakarta', 'Dwi Rahayu'),
(4, 'V004', 'PT Lekulo X', 'Kebumen', 'Mbambang G'),
(5, 'V005', 'PT IT Prima', 'Jakarta', 'David W');

-- --------------------------------------------------------

--
-- Structure for view `lihat_vendor`
--
DROP TABLE IF EXISTS `lihat_vendor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lihat_vendor`  AS SELECT `vendor`.`nomor` AS `nomor`, `vendor`.`nama` AS `nama`, `vendor`.`kota` AS `kota` FROM `vendor` ;

-- --------------------------------------------------------

--
-- Structure for view `pembelian_produk_vendor`
--
DROP TABLE IF EXISTS `pembelian_produk_vendor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pembelian_produk_vendor`  AS SELECT `p`.`id` AS `id`, `p`.`tanggal` AS `tanggal`, `p`.`nomor` AS `nomor`, `p`.`jumlah` AS `jumlah`, `p`.`harga` AS `harga`, `pr`.`nama` AS `nama`, `v`.`nama` AS `nama_vendor`, `v`.`kontak` AS `kontak` FROM ((`pembelian` `p` join `produk` `pr` on(`p`.`produk_id` = `pr`.`id`)) join `vendor` `v` on(`p`.`vendor_id` = `v`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `penjualan_produk`
--
DROP TABLE IF EXISTS `penjualan_produk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `penjualan_produk`  AS SELECT `pesanan`.`id` AS `id`, `pesanan`.`total` AS `total`, `pelanggan`.`nama` AS `nama_pelanggan`, `produk`.`kode` AS `kode_produk`, `produk`.`nama` AS `nama_produk`, `jenis_produk`.`nama` AS `jenis_produk`, `pesanan_items`.`qty` AS `qty`, `pesanan_items`.`harga` AS `harga_jual` FROM ((((`pesanan` join `pelanggan` on(`pesanan`.`pelanggan_id` = `pelanggan`.`id`)) join `pesanan_items` on(`pesanan`.`id` = `pesanan_items`.`pesanan_id`)) join `produk` on(`pesanan_items`.`produk_id` = `produk`.`id`)) join `jenis_produk` on(`produk`.`jenis_produk_id` = `jenis_produk`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pesanan_pelanggan_kartu`
--
DROP TABLE IF EXISTS `pesanan_pelanggan_kartu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pesanan_pelanggan_kartu`  AS SELECT `pesanan`.`id` AS `id`, `pesanan`.`tanggal` AS `tanggal`, `pesanan`.`total` AS `total`, `pelanggan`.`kode` AS `kode`, `pelanggan`.`nama` AS `nama`, `kartu`.`nama` AS `nama_kartu`, `kartu`.`diskon` AS `diskon` FROM ((`pesanan` join `pelanggan` on(`pesanan`.`pelanggan_id` = `pelanggan`.`id`)) join `kartu` on(`pelanggan`.`kartu_id` = `kartu`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jenis_produk`
--
ALTER TABLE `jenis_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kartu`
--
ALTER TABLE `kartu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_UNIQUE` (`kode`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`),
  ADD KEY `fk_pelanggan_kartu1_idx` (`kartu_id`),
  ADD KEY `idx_nama_pelanggan` (`nama`),
  ADD KEY `idx_tgllahir_pelanggan` (`tgl_lahir`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nokuitansi_UNIQUE` (`nokuitansi`),
  ADD KEY `fk_pembayaran_pesanan1_idx` (`pesanan_id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor_UNIQUE` (`nomor`),
  ADD KEY `produk_id` (`produk_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pesanan_customer_idx` (`pelanggan_id`);

--
-- Indexes for table `pesanan_items`
--
ALTER TABLE `pesanan_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pesanan_items_pesanan1_idx` (`pesanan_id`),
  ADD KEY `fk_pesanan_items_produk1_idx` (`produk_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_UNIQUE` (`kode`),
  ADD KEY `fk_produk_jenis_produk1_idx` (`jenis_produk_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_nip_unique` (`nip`),
  ADD UNIQUE KEY `staff_email_unique` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor` (`nomor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_produk`
--
ALTER TABLE `jenis_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kartu`
--
ALTER TABLE `kartu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pesanan_items`
--
ALTER TABLE `pesanan_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `fk_pelanggan_kartu1` FOREIGN KEY (`kartu_id`) REFERENCES `kartu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_pembayaran_pesanan1` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`),
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`);

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `fk_pesanan_customer` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pesanan_items`
--
ALTER TABLE `pesanan_items`
  ADD CONSTRAINT `fk_pesanan_items_pesanan1` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pesanan_items_produk1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `fk_produk_jenis_produk1` FOREIGN KEY (`jenis_produk_id`) REFERENCES `jenis_produk` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
