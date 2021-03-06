-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 20 Sep 2017 pada 14.19
-- Versi Server: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gaji_bonus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `d_bonus`
--

CREATE TABLE `d_bonus` (
  `id_bonus` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `id_persentase` int(11) NOT NULL,
  `bulan` datetime DEFAULT NULL,
  `jumlah` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `d_bonus`
--

INSERT INTO `d_bonus` (`id_bonus`, `id_karyawan`, `id_persentase`, `bulan`, `jumlah`) VALUES
(1, 1, 5, '2017-09-08 17:49:57', '54944.00'),
(2, 2, 1, '2017-09-08 17:52:13', '274720.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `d_gaji`
--

CREATE TABLE `d_gaji` (
  `id_gaji` int(11) NOT NULL,
  `id_tunjangan` int(11) NOT NULL,
  `id_potongan` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `bulan` datetime DEFAULT NULL,
  `total_gaji` decimal(15,2) DEFAULT NULL,
  `tgl_pengambilan` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `d_karyawan_potongan`
--

CREATE TABLE `d_karyawan_potongan` (
  `id` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `id_potongan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `d_karyawan_potongan`
--

INSERT INTO `d_karyawan_potongan` (`id`, `id_karyawan`, `id_potongan`) VALUES
(7, 1, 1),
(8, 1, 2),
(11, 2, 2),
(20, 3, 1),
(21, 3, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `d_karyawan_tunjangan`
--

CREATE TABLE `d_karyawan_tunjangan` (
  `id` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `id_tunjangan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `d_karyawan_tunjangan`
--

INSERT INTO `d_karyawan_tunjangan` (`id`, `id_karyawan`, `id_tunjangan`) VALUES
(51, 1, 1),
(55, 2, 1),
(56, 2, 2),
(57, 2, 3),
(72, 3, 1),
(73, 3, 2),
(74, 3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `d_pengguna`
--

CREATE TABLE `d_pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nama_pengguna` varchar(255) DEFAULT NULL,
  `id_kategori_pengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `d_pengguna`
--

INSERT INTO `d_pengguna` (`id_pengguna`, `username`, `password`, `nama_pengguna`, `id_kategori_pengguna`) VALUES
(1, 'u_akunting', '3d7e8ee1bd92ac56bdc5ec672fec1447', 'Cipto Tri Raharjo', 1),
(2, 'u_manager', 'fb5e07c4e1969c611ece049cc12edf4a', 'Bagus Priangga', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `d_potongan`
--

CREATE TABLE `d_potongan` (
  `id_d_potongan` int(11) NOT NULL,
  `bulan` date DEFAULT NULL,
  `id_karyawan` int(11) NOT NULL,
  `id_potongan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `d_potongan`
--

INSERT INTO `d_potongan` (`id_d_potongan`, `bulan`, `id_karyawan`, `id_potongan`) VALUES
(1, '2017-09-08', 1, 2),
(2, '2017-09-08', 3, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `d_session`
--

CREATE TABLE `d_session` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `d_session`
--

INSERT INTO `d_session` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('e9a33386a5016de9158a2f563cade2a2349f14d3', '127.0.0.1', 1505050639, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035303535333b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('63b6832b41ce82e232347ed0c5f3bac01cd4eb0b', '127.0.0.1', 1505051824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035313535303b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('489dc969c87840fc7ee3261f73017471b311fd89', '127.0.0.1', 1505052104, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035313839333b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('ea49ded9fd4080451bb09abcde61a17789838169', '127.0.0.1', 1505052360, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035323233313b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('ab1de4ae29a2d0960b6be4cf4f3bd229cf607a45', '127.0.0.1', 1505052959, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035323935303b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('d7e55299630be8264cc0837849e1fcda5555b4de', '127.0.0.1', 1505053686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035333433303b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('88c06e40bbf5efe00e0747479fd825944592b92f', '127.0.0.1', 1505053896, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035333734303b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('1415affe445f0d488df635be07a70717955cc821', '127.0.0.1', 1505054409, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035343131363b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('6e3e48a6904b6a593611e1046eb8c4b5ffc6a011', '127.0.0.1', 1505054681, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035343434323b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('8ea1022400b7354247e967f21fb03d93a4e2286c', '127.0.0.1', 1505055047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035343734383b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('b969a4feedb51d7c09251aa94a5ce51efbb9f275', '127.0.0.1', 1505055385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035353130363b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('1b8319d2da3ba5bf762b4e78951d271184a91753', '127.0.0.1', 1505055772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035353438323b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('a7aaff0e882f6a0f7d5cf9a886ffa7ce5bdc9b67', '127.0.0.1', 1505055824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035353830373b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('564ee45ae07d20f6ebc9923b375b53abbc3e72d4', '127.0.0.1', 1505057468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035373234383b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('bd06384d4865445b337bf2edfa5568e235774742', '127.0.0.1', 1505058363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035383036363b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('73b013a5648304549cabf13f1eaa7755174ea1a5', '127.0.0.1', 1505058682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035383338383b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('2fa1ae84308644f1812afc1ac1641d94ba80e4fb', '127.0.0.1', 1505058863, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035383733343b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('2461ecb83668a1a1a55afcadf76069e8f297bb0a', '127.0.0.1', 1505059368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035393038383b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('b71419441f14e58546ade3569176a2eef77dfb63', '127.0.0.1', 1505059532, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353035393432393b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('23fb8f32f6f1ad0fb463f126293c26c7b48dfd0d', '127.0.0.1', 1505118262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353131373936363b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('c98c8a6e89545230f8d4ff2e7c029d1a85b994a9', '127.0.0.1', 1505118690, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353131383432353b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('e914da479d313c9307b9f6b7047e97c799684b6c', '127.0.0.1', 1505118824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353131383737323b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('1822ee73f485e44b9b19a019c0e1c5e3f77bafd7', '127.0.0.1', 1505119321, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353131393239363b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('52496c80b2996f4bc487fda2c623d573ae90c625', '127.0.0.1', 1505119956, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353131393636303b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('4e90ace8ba068c583326ee1aec279b521e6ad915', '127.0.0.1', 1505120188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353131393936313b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('d0420ea14a91f0f2575cb4e5bca83e3c378fe9c3', '127.0.0.1', 1505120435, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353132303236353b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b737563636573737c733a32333a22426572686173696c206d656e79696d70616e2064617461223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('e11679a3161103448ea33cdf92dabc2b206db7b9', '127.0.0.1', 1505121224, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353132303934363b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('8d3050f4990c76b59fff804b5becd879ee2a7b94', '127.0.0.1', 1505121472, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353132313330303b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('f11cfc5322410fd375d84d3aa344442fda1f7c39', '127.0.0.1', 1505122094, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353132313739343b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('35193925371f078d6de0a49a01a38c45a7ce9890', '127.0.0.1', 1505122347, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353132323039373b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('9c6ff9146678824d1ad2595fc8440e14fb4c238d', '127.0.0.1', 1505122537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353132323433343b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('0ce6a2889c21304ce966e14661bb896a29da7f6f', '127.0.0.1', 1505123400, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353132333130393b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('cfd8099ffc59a7f05f3fded01fb753c968e63f24', '127.0.0.1', 1505123575, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353132333437363b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('74d6a9fd94f339891d6e021e94aa526e18538033', '127.0.0.1', 1505124035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353132333832323b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('4e5b0d351e0361dec3c52d1a1a32e4214cf3cc64', '127.0.0.1', 1505180772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353138303530373b),
('84ee1fad81fd433eaa0fac854f96a26a77ddf5c1', '127.0.0.1', 1505909274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353930393033363b),
('31f5f4d9ac1cdb16d5ec62d284ddc2c7bb16c0de', '127.0.0.1', 1505909703, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353930393437393b);

-- --------------------------------------------------------

--
-- Struktur dari tabel `d_tunjangan`
--

CREATE TABLE `d_tunjangan` (
  `id_d_tunjangan` int(11) NOT NULL,
  `bulan` date DEFAULT NULL,
  `id_tunjangan` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_jabatan`
--

CREATE TABLE `m_jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(45) DEFAULT NULL,
  `gaji_pokok` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `m_jabatan`
--

INSERT INTO `m_jabatan` (`id_jabatan`, `nama_jabatan`, `gaji_pokok`) VALUES
(1, 'Marketing', '1350000.00'),
(2, 'Manager', '3000000.00'),
(4, 'Marketing SPV', '1700000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_karyawan`
--

CREATE TABLE `m_karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `NIK` varchar(45) DEFAULT NULL,
  `nama_karyawan` varchar(255) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `no_telepon` varchar(12) DEFAULT NULL,
  `alamat` text,
  `id_jabatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `m_karyawan`
--

INSERT INTO `m_karyawan` (`id_karyawan`, `NIK`, `nama_karyawan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_jabatan`) VALUES
(1, '12345', 'Arif Budi Prasetyo', 'L', '089777665', 'Alamat', 1),
(2, '12346', 'Wahyu Setyawan', 'L', '08999976555', 'Alamat', 1),
(3, '1265554', 'Jafar Shodiq', 'L', '0867775644', 'Alamat', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_kategori_pengguna`
--

CREATE TABLE `m_kategori_pengguna` (
  `id_kategori_pengguna` int(11) NOT NULL,
  `nama_kategori_pengguna` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `m_kategori_pengguna`
--

INSERT INTO `m_kategori_pengguna` (`id_kategori_pengguna`, `nama_kategori_pengguna`) VALUES
(1, 'Akunting'),
(2, 'Manager');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_kriteria`
--

CREATE TABLE `m_kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `nama_kriteria` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `m_kriteria`
--

INSERT INTO `m_kriteria` (`id_kriteria`, `nama_kriteria`) VALUES
(1, 'Target Nasabah'),
(2, 'Absensi'),
(3, 'Masa Kerja'),
(4, 'Tanggungan'),
(5, 'Orientasi pelayanan'),
(6, 'Integritas'),
(7, 'Disiplin'),
(8, 'Kerjasama '),
(9, 'kepemimpinan'),
(11, 'tes');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_nilai_kriteria`
--

CREATE TABLE `m_nilai_kriteria` (
  `id_nilai_kriteria` int(11) NOT NULL,
  `nama_nilai_kriteria` varchar(255) DEFAULT NULL,
  `nilai_kriteria` varchar(255) DEFAULT NULL,
  `id_kriteria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `m_nilai_kriteria`
--

INSERT INTO `m_nilai_kriteria` (`id_nilai_kriteria`, `nama_nilai_kriteria`, `nilai_kriteria`, `id_kriteria`) VALUES
(1, 'Mendapat nasabah simpan ataupun pinjam >= 20 orang', '100', 1),
(2, 'Mendapat nasabah simpan ataupun pinjam >= 15 orang dan < 20 orang', '80', 1),
(3, 'Mendapat nasabah simpan ataupun pinjam >= 10 orang dan < 15 orang', '60', 1),
(4, 'Mendapat nasabah simpan ataupun pinjam >= 5 orang dan < 10 orang', '40', 1),
(5, 'Mendapat nasabah simpan ataupun pinjam < 5', '20', 1),
(6, 'Karyawan tidak ada absen atau 0', '100', 2),
(7, 'Karyawan ada absen 1', '80', 2),
(8, 'Karyawan ada absen 2', '60', 2),
(9, 'Karyawan ada absen  3', '40', 2),
(10, 'Karyawan ada absen >4', '20', 2),
(11, 'Masa kerja >=4 tahun', '100', 3),
(12, 'Masa kerja >=3 dan <4 tahun', '80', 3),
(13, 'Masa kerja  >=2 dan <3 tahun', '60', 3),
(14, 'Masa kerja >=1 dan <2 tahun', '40', 3),
(15, 'Masa kerja < 1 tahun', '20', 3),
(16, 'Tanggungan karyawan >1 (satu) orang anak', '100', 4),
(17, 'Tanggungan karyawan 1 (satu) orang anak', '60', 4),
(18, 'Tanggungan karyawan tidak ada atau belum menikah', '30', 4),
(19, 'Selalu dapat menyelsaikan tugas pelayanan sebaik-baiknya dengan sikap sopan dan sangat memuaskan baik pelayanan internal maupun eksternal organisasi.', '100', 5),
(20, 'Pada umumnya dapat menyelesaikan tugas pelayanan dengan baik dan sikap sopan serta memuaskan baik pelayanan internal maupun eksternal organisasi.', '80', 5),
(21, 'Adakalanya dapat menyelesaikan tugas pelayanan dengan cukup baik dan sikap cukup sopan serta cukup memuaskan pelayanan internal maupun eksternal organisasi organisasi.', '60', 5),
(22, 'kurang dapat menyelesaikan tugas pelayanan dengan baik dan sikap kurang sopan serta kurang memuaskan pelayanan internal maupun eksternal organisasi organisasi.', '40', 5),
(23, 'Tidak pernah menyelesaikan tugas pelayanan dengan baik dan sikap tidak sopan serta tidak memuaskan pelayanan internal maupun eksternal organisasi organisasi.', '20', 5),
(24, 'Dalam melaksanakan tugas selalu bersifat jujur, ikhlas dan tidak pernah menyalagunakan wewenang serta berani menanggung resiko dari tindakan yang dilakukannya.', '100', 6),
(25, 'Pada umumnya dalam melaksanakan tugas bersifat jujur, ikhlas dan tidak pernah menyalagunakan wewenangnya tetapi berani menanggung resiko dari tindakan yang dilakukannya.', '80', 6),
(26, 'Adakalanya dalam melaksanakan tugas bersifat jujur, ikhlas dan kadang-kadang menyalagunakan wewenangnya serta cukup berani menanggung resiko dari tindakan yang dilakukannya.', '60', 6),
(27, 'Kurang jujur, kurang ikhlas dalam melaksanakan tugas dan sering menyalagunakan wewenang tetapi kurang berani menanggung resiko dari tindakan yang dilakukannya.', '40', 6),
(28, 'Tidak pernah jujur, tidak ikhlas dalam melaksanakan tugas dan selalu menyalagunakan wewenang serta tidak berani menanggung resiko dari tindakan yang dilakukannya', '20', 6),
(29, 'Selalu mentaati peraturan perundang – undangan dan/atau peraturan kedinasan yang berlaku dengan rasa tanggung jawab dan selalu mentaati ketentuan jam kerja.', '100', 7),
(30, 'Pada umumnya mentaati peraturan perundang – undangan dan/atau peraturan kedinasan yang berlaku dengan rasa tanggung jawab dan selalu mentaati ketentuan jam kerja.', '80', 7),
(31, 'adakalanya mentaati peraturan perundang – undangan dan/atau peraturan kedinasan yang berlaku dengan rasa cukup tanggung jawab dan selalu mentaati ketentuan jam kerja', '60', 7),
(32, 'Kurang mentaati peraturan perundang – undangan dan/atau peraturan kedinasan yang berlaku dengan rasa kurang tanggung jawab dan selalu mentaati ketentuan jam kerja.', '40', 7),
(33, 'Tidak pernah mentaati peraturan perundang – undangan dan/atau peraturan kedinasan yang berlaku dengan rasa tidak tanggung jawab dan selalu mentaati ketentuan jam kerja.', '20', 7),
(34, 'selalu mampu bekerjasama dengan rekan kerja serta menghargai dan menerima pendapat orang lain, bersedia menerima keputusan yang diambil secara sah yang telah menjadi keputusan bersama.', '100', 8),
(35, 'Pada umumnya mampu bekerjasama dengan rekan Kerja serta menghargai dan menerima pendapat orang lain, bersedia menerima keputusan yang diambil secara sah yang telah menjadi keputusan bersama.', '80', 8),
(36, 'Adakalanya mampu bekerjasama dengan rekan kerja serta adakalanya menghargai dan menerima pendapat orang lain, kadang-kadang bersedia menerima keputusan yang diambil secara sah yang telah menjadi keputusan bersama.', '60', 8),
(37, 'Kurang mampu bekerjasama dengan rekan kerja serta kurang mampu menghargai dan menerima pendapat orang lain, kurang bersedia menerima keputusan yang diambil secara sah yang telah menjadi keputusan bersama.', '40', 8),
(38, 'Tidak pernah mampu bekerjasama dengan rekan kerja serta tidak menghargai dan menerima pendapat orang lain, tidak bersedia menerima keputusan yang diambil secara sah yang telah menjadi keputusan bersama.', '20', 8),
(39, 'Selalu bertindak tegas dan tidak memihak, kemampuan menggerrakan tim kerja untuk mencapai kinerja yang tinggi, serta mampu mengambil keputusan dengan cepat dan tepat.', '100', 9),
(40, 'Pada umumnya bertindak tegas dan tidak memihak, kemampuan menggerakan tim kerja untuk mencapai kinerja yang tinggi serta mampu mengambil keputusan dengan cepat dan tepat.', '80', 9),
(41, 'Adakalanya bertindak tegas dan tidak memihak, kemampuan menggerakan tim kerja untuk mencapai kinerja yang tinggi, serta adakalanya mampu mengambil keputusan dengan cepat dan tepat.', '60', 9),
(42, 'Kurang bertindak tegas dan tidak memihak, kemampuan menggerrakan tim kerja untuk mencapai kinerja yang tinggi serta kurang mampu mengambil keputusan dengan cepat dan tepat.', '40', 9),
(43, 'Tidak pernah mampu bertindak tegas dan memihak, tidak mampu menggerrakan tim kerja untuk mencapai kinerja yang tinggi serta tidak mampu mengambil keputusan dengan cepat dan tepat.', '20', 9),
(46, 'tes 1', '100', 11),
(47, 'tes2', '50', 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_persentase`
--

CREATE TABLE `m_persentase` (
  `id_persentase` int(11) NOT NULL,
  `nilai` varchar(45) DEFAULT NULL,
  `persentase` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `m_persentase`
--

INSERT INTO `m_persentase` (`id_persentase`, `nilai`, `persentase`) VALUES
(1, '>80', 20),
(2, '>60 dan <=80', 16),
(3, '>40 dan <=60', 12),
(4, '>20 dan <=40', 8),
(5, '<=20', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_potongan`
--

CREATE TABLE `m_potongan` (
  `id_potongan` int(11) NOT NULL,
  `nama_potongan` varchar(45) DEFAULT NULL,
  `nilai_potongan` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `m_potongan`
--

INSERT INTO `m_potongan` (`id_potongan`, `nama_potongan`, `nilai_potongan`) VALUES
(1, 'pph21', '0.00'),
(2, 'Pinjaman', '100000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_tunjangan`
--

CREATE TABLE `m_tunjangan` (
  `id_tunjangan` int(11) NOT NULL,
  `nama_tunjangan` varchar(45) DEFAULT NULL,
  `nilai_tunjangan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `m_tunjangan`
--

INSERT INTO `m_tunjangan` (`id_tunjangan`, `nama_tunjangan`, `nilai_tunjangan`) VALUES
(1, 'Transportasi', '400000'),
(2, 'Makan', '300000'),
(3, 'Komunikasi', '100000'),
(4, 'Test', '100');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `d_bonus`
--
ALTER TABLE `d_bonus`
  ADD PRIMARY KEY (`id_bonus`),
  ADD KEY `fk_d_bonus_m_karyawan1_idx` (`id_karyawan`),
  ADD KEY `fk_d_bonus_m_persentase1_idx` (`id_persentase`);

--
-- Indexes for table `d_gaji`
--
ALTER TABLE `d_gaji`
  ADD PRIMARY KEY (`id_gaji`),
  ADD KEY `fk_d_gaji_m_tunjangan1_idx` (`id_tunjangan`),
  ADD KEY `fk_d_gaji_m_potongan1_idx` (`id_potongan`),
  ADD KEY `fk_d_gaji_m_karyawan1_idx` (`id_karyawan`);

--
-- Indexes for table `d_karyawan_potongan`
--
ALTER TABLE `d_karyawan_potongan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_karyawan_tunjangan`
--
ALTER TABLE `d_karyawan_tunjangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_pengguna`
--
ALTER TABLE `d_pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD KEY `fk_d_pengguna_m_kategori_pengguna1_idx` (`id_kategori_pengguna`);

--
-- Indexes for table `d_potongan`
--
ALTER TABLE `d_potongan`
  ADD PRIMARY KEY (`id_d_potongan`),
  ADD KEY `fk_d_potongan_m_karyawan1_idx` (`id_karyawan`),
  ADD KEY `fk_d_potongan_m_potongan1_idx` (`id_potongan`);

--
-- Indexes for table `d_session`
--
ALTER TABLE `d_session`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `d_tunjangan`
--
ALTER TABLE `d_tunjangan`
  ADD PRIMARY KEY (`id_d_tunjangan`),
  ADD KEY `fk_d_tunjangan_m_tunjangan1_idx` (`id_tunjangan`),
  ADD KEY `fk_d_tunjangan_m_karyawan1_idx` (`id_karyawan`);

--
-- Indexes for table `m_jabatan`
--
ALTER TABLE `m_jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `m_karyawan`
--
ALTER TABLE `m_karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `fk_m_karyawan_m_jabatan_idx` (`id_jabatan`);

--
-- Indexes for table `m_kategori_pengguna`
--
ALTER TABLE `m_kategori_pengguna`
  ADD PRIMARY KEY (`id_kategori_pengguna`);

--
-- Indexes for table `m_kriteria`
--
ALTER TABLE `m_kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `m_nilai_kriteria`
--
ALTER TABLE `m_nilai_kriteria`
  ADD PRIMARY KEY (`id_nilai_kriteria`);

--
-- Indexes for table `m_persentase`
--
ALTER TABLE `m_persentase`
  ADD PRIMARY KEY (`id_persentase`);

--
-- Indexes for table `m_potongan`
--
ALTER TABLE `m_potongan`
  ADD PRIMARY KEY (`id_potongan`);

--
-- Indexes for table `m_tunjangan`
--
ALTER TABLE `m_tunjangan`
  ADD PRIMARY KEY (`id_tunjangan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `d_bonus`
--
ALTER TABLE `d_bonus`
  MODIFY `id_bonus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `d_gaji`
--
ALTER TABLE `d_gaji`
  MODIFY `id_gaji` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `d_karyawan_potongan`
--
ALTER TABLE `d_karyawan_potongan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `d_karyawan_tunjangan`
--
ALTER TABLE `d_karyawan_tunjangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `d_pengguna`
--
ALTER TABLE `d_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `d_potongan`
--
ALTER TABLE `d_potongan`
  MODIFY `id_d_potongan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `d_tunjangan`
--
ALTER TABLE `d_tunjangan`
  MODIFY `id_d_tunjangan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_jabatan`
--
ALTER TABLE `m_jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `m_karyawan`
--
ALTER TABLE `m_karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `m_kategori_pengguna`
--
ALTER TABLE `m_kategori_pengguna`
  MODIFY `id_kategori_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `m_kriteria`
--
ALTER TABLE `m_kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `m_nilai_kriteria`
--
ALTER TABLE `m_nilai_kriteria`
  MODIFY `id_nilai_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `m_persentase`
--
ALTER TABLE `m_persentase`
  MODIFY `id_persentase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `m_potongan`
--
ALTER TABLE `m_potongan`
  MODIFY `id_potongan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `m_tunjangan`
--
ALTER TABLE `m_tunjangan`
  MODIFY `id_tunjangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `d_bonus`
--
ALTER TABLE `d_bonus`
  ADD CONSTRAINT `fk_d_bonus_m_karyawan1` FOREIGN KEY (`id_karyawan`) REFERENCES `m_karyawan` (`id_karyawan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_d_bonus_m_persentase1` FOREIGN KEY (`id_persentase`) REFERENCES `m_persentase` (`id_persentase`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `d_gaji`
--
ALTER TABLE `d_gaji`
  ADD CONSTRAINT `fk_d_gaji_m_karyawan1` FOREIGN KEY (`id_karyawan`) REFERENCES `m_karyawan` (`id_karyawan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_d_gaji_m_potongan1` FOREIGN KEY (`id_potongan`) REFERENCES `m_potongan` (`id_potongan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_d_gaji_m_tunjangan1` FOREIGN KEY (`id_tunjangan`) REFERENCES `m_tunjangan` (`id_tunjangan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `d_pengguna`
--
ALTER TABLE `d_pengguna`
  ADD CONSTRAINT `fk_d_pengguna_m_kategori_pengguna1` FOREIGN KEY (`id_kategori_pengguna`) REFERENCES `m_kategori_pengguna` (`id_kategori_pengguna`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `d_potongan`
--
ALTER TABLE `d_potongan`
  ADD CONSTRAINT `fk_d_potongan_m_karyawan1` FOREIGN KEY (`id_karyawan`) REFERENCES `m_karyawan` (`id_karyawan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_d_potongan_m_potongan1` FOREIGN KEY (`id_potongan`) REFERENCES `m_potongan` (`id_potongan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `d_tunjangan`
--
ALTER TABLE `d_tunjangan`
  ADD CONSTRAINT `fk_d_tunjangan_m_karyawan1` FOREIGN KEY (`id_karyawan`) REFERENCES `m_karyawan` (`id_karyawan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_d_tunjangan_m_tunjangan1` FOREIGN KEY (`id_tunjangan`) REFERENCES `m_tunjangan` (`id_tunjangan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `m_karyawan`
--
ALTER TABLE `m_karyawan`
  ADD CONSTRAINT `fk_m_karyawan_m_jabatan` FOREIGN KEY (`id_jabatan`) REFERENCES `m_jabatan` (`id_jabatan`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
