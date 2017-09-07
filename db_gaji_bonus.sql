-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 07 Sep 2017 pada 13.27
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
(1, 3, 1, '2017-08-31 10:46:50', '347520.00'),
(2, 1, 1, '2017-08-31 10:47:50', '347520.00'),
(3, 2, 2, '2017-08-31 10:50:06', '278016.00'),
(5, 2, 1, '2017-09-05 15:30:16', '347520.00');

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
('fe8283780d91a55846594ab54418225506eadeff', '127.0.0.1', 1504154966, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343135343639393b),
('cac7c939be1d17ea23f1364a713cb5b66af52166', '127.0.0.1', 1504155283, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343135353033333b),
('92eb6df2b824a31ce0b9cb382770f9ebd57433e7', '127.0.0.1', 1504155615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343135353333383b),
('183dde9bc4424e8bec9435acda4f9b1b1221abb0', '127.0.0.1', 1504155969, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343135353637353b),
('ac56a85c06dd455713a7dc77a3596307655b907c', '127.0.0.1', 1504155990, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343135353939303b737563636573737c733a37383a22426572686173696c206d656e67686974756e6720626f6e75732e20556e74756b206d656968617420686173696c2c2073696c61686b616e20746172696b206b652062616769616e2062617761682e223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('0cb15e2496157ff49d19d24e45484456e3bb0f94', '127.0.0.1', 1504166057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343136363035353b),
('db4e5edbffd9ac510a70a5ba34aea48979d651fa', '127.0.0.1', 1504166783, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343136363532393b),
('1fac4e8bb46c0b6a7c2932140b8369d0d301f8f7', '127.0.0.1', 1504167155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343136363835353b),
('bc574ec43dabd6f2b4295b3cc609446f3b96a9e1', '127.0.0.1', 1504167206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343136373136303b),
('ebbeed65478c824600af28c763f2a9f340143f16', '127.0.0.1', 1504167704, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343136373436353b),
('8bc9ce4e03aa28e8a07e595a0036a2a54ad1d270', '127.0.0.1', 1504168086, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343136373832373b),
('90a8edd49902bae7c4024dad1cee0599ac9b365f', '127.0.0.1', 1504168518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343136383236393b),
('f9b745e66af25ff6ecffbfb74711e1fd44559a14', '127.0.0.1', 1504168875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343136383539393b737563636573737c733a37383a22426572686173696c206d656e67686974756e6720626f6e75732e20556e74756b206d656968617420686173696c2c2073696c61686b616e20746172696b206b652062616769616e2062617761682e223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226e6577223b7d),
('566403cd866a0a204da48d852469e1babcc41f58', '127.0.0.1', 1504169210, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343136383932353b),
('6139f144707757227ea464fd23ecf36f054a16bd', '127.0.0.1', 1504169512, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343136393233373b),
('8d2523c3b32d967d94a6fedbac9be26640b7381c', '127.0.0.1', 1504170051, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343136393736303b),
('4536da2cc61eb29e1372cd989da43e74db6bc181', '127.0.0.1', 1504170288, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343137303038353b),
('35ae21d92efd21f750672e58b0b325b5fb22eb4b', '127.0.0.1', 1504171002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343137303835363b),
('b8d0d312c8f71c40fe1aaaf4264bdf728f9cfec7', '127.0.0.1', 1504171668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343137313432333b),
('71a99c3d2b40f5aa3673270f26643bde0ecfb51c', '127.0.0.1', 1504171952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343137313934343b),
('88223cf6e6b534d4e73bda74d69caedf79b8387e', '127.0.0.1', 1504614211, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343631333936353b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('b647b38beb9f2ece933132e81c1dd4fdc32335a2', '127.0.0.1', 1504614331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343631343331313b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('760288f3d7c2cc064970eb577d33fe1023065e38', '127.0.0.1', 1504614671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343631343637313b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('7d4432c17f1dcdd3b5484aed5b55b3aea4937426', '127.0.0.1', 1504615705, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343631353432323b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('f9278d486102004e9577be18259828891da2434e', '127.0.0.1', 1504616623, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343631363435353b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('7e8c02dd5aa8f3cd8e1061cab17473135d9b4340', '127.0.0.1', 1504617088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343631363830343b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('647b0f038a5f7ee47e1528ab59d475aa0af51fe4', '127.0.0.1', 1504617461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343631373136393b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('c264cecd7f708452f967d0b0c82a2e0a85ac9fea', '127.0.0.1', 1504617762, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343631373437313b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('47c3a82ba54bf3bce297d3d16d800c90e7e02ff9', '127.0.0.1', 1504618009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343631373830303b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b737563636573737c733a37383a22426572686173696c206d656e67686974756e6720626f6e75732e20556e74756b206d656968617420686173696c2c2073696c61686b616e20746172696b206b652062616769616e2062617761682e223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226e6577223b7d),
('e8540c0f0c684e171e6783c08a474fa106d7aed2', '127.0.0.1', 1504618272, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343631383132323b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('108fe21304f2775927d9063df2813d731bd169c2', '127.0.0.1', 1504620269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343632303035313b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('740f269ad5eb9f120570b8491c4cd181220e650d', '127.0.0.1', 1504620616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343632303538333b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('ac33365b7c5bbca75f58195021a9ebcad09db243', '127.0.0.1', 1504621204, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343632303931323b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('e91abd160e71178d50cfa740bb307d26d24e7ab2', '127.0.0.1', 1504621436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343632313232353b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('bc43f862c64222abcc7dc588329888d7d3eb83cf', '127.0.0.1', 1504623032, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343632323830393b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('ae02eda70f71a46b34ddc4c94889267b6a24e9b2', '127.0.0.1', 1504623488, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343632333138383b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('d055f5786eedb8e89371ee06416a5f3563985974', '127.0.0.1', 1504623726, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343632333534383b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('65ab2a801ab5d6528b822fe433654d8b185a3c04', '127.0.0.1', 1504624008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343632333939303b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('7e06c8bdbc67de8828e3319ad3d10e6d3dbf1653', '127.0.0.1', 1504624415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343632343431353b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('672d489c47f21b3c410ac4d0d5ffae3591decf6c', '127.0.0.1', 1504627237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343632373233373b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('cdf833ca1e4b89c431a55be4fa5e1b7faf8f94e3', '127.0.0.1', 1504700348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303039343b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('d26684fc047c9d69fe00d2f3bf475b49c2268f9f', '127.0.0.1', 1504700556, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303436393b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('410cfb11dbdd1536f1e5a7173da416028d7f3bab', '127.0.0.1', 1504701378, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730313337383b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('61d3b1e083467e4482d4c53da1f45402ec5dab0c', '127.0.0.1', 1504702353, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730323035333b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('73bb48c2f6ff81097605e0dea5382047c4ed7ac2', '127.0.0.1', 1504702665, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730323336383b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('48c340dd5ba37b91018905e1fb4400b0e3c47a44', '127.0.0.1', 1504702869, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730323638343b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('8f2b872eaf578debd1dca409aecaad9bef8aaf36', '127.0.0.1', 1504703266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730323938383b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('d8025823ac44da7013be5fc58fb5797bbbbc03bd', '127.0.0.1', 1504703494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730333330383b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('b059557a50dd5f6d24f9c5a51c534ea084337375', '127.0.0.1', 1504703917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730333632383b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('472047eff5891c5d0247befd06093153d3687390', '127.0.0.1', 1504704225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730333934313b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b737563636573737c733a32373a22426572686173696c206d656e67696e7075746b616e20646174612e223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('87158c1ed0cec899263f9aeef8dee58ff780590c', '127.0.0.1', 1504704613, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730343331353b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('a52a09a64decb327a1644c84e26af536ee187daf', '127.0.0.1', 1504704707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730343634363b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('eb84db01448ad3a382e339a1ad479bdc4f77bc30', '127.0.0.1', 1504705323, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730353039313b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('5b44f88640e2df1845cb67a0f911be228f7cedd5', '192.168.23.1', 1504705878, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730353837383b),
('4a5948bce139aa93d8dd7e4707a5111d7223a6ae', '127.0.0.1', 1504706494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730363439343b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('a0564ec60a64233972d982c7d9660829b1129a28', '127.0.0.1', 1504753728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735333436383b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('f9206b373a69b9daa07aa8f694dca4f220230aad', '127.0.0.1', 1504753882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735333737333b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('0894715eddeb7aa41becfc66ab4a32bf2efd2c60', '127.0.0.1', 1504754707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735343433303b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('2480af7abe48938d68f321643a3f6c9ebc11c1df', '127.0.0.1', 1504754931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735343838353b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('acad0c46f52fe29a69777100d7bd3fcc4285e6c4', '127.0.0.1', 1504755537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735353234363b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('3bda83eecdff8617878f31aeb9dab0f46adc981c', '127.0.0.1', 1504755835, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735353534393b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('ed5e3a2e7063e169b61fecdfcdc2ce6e05026323', '127.0.0.1', 1504756095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735353933353b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('d5c42a1e7357339775abe95735d4cdb218879cd7', '127.0.0.1', 1504756884, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735363730303b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('0114b446abfc98cb30fde157b0d021b51237287f', '127.0.0.1', 1504780538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343738303236313b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('3c7928e75ea80eb77ff572f3d9249d7f56e5d190', '127.0.0.1', 1504780684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343738303539373b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('295ef77eadddc3878b2ea7268357e4b188c99793', '127.0.0.1', 1504781347, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343738313033393b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('98adbb901f35d88ae97baf8808fc60c680d96181', '127.0.0.1', 1504781434, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343738313431313b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('09d09f28c21d1162243043e59ad20404aa166d28', '127.0.0.1', 1504782231, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343738313939303b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('400e3ad157e3e39236ffcc4ea309ac012741066d', '127.0.0.1', 1504782855, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343738323335333b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('c235c466f0606433bcd5063ee9a4275d01b66c82', '127.0.0.1', 1504783149, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343738323836313b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('ac9a28c3c11c574ff333de2214a1bcb94cab6e20', '127.0.0.1', 1504783480, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343738333139383b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('a3d1576b39f04879f8a471919cd52e587db3d1f4', '127.0.0.1', 1504783636, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343738333535393b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b737563636573737c733a32343a22426572686173696c206d656e79696d70616e20646174612e223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d);

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
(2, 'Manager', '3000000.00');

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
(9, 'kepemimpinan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_nilai_kriteria`
--

CREATE TABLE `m_nilai_kriteria` (
  `id_nilai_kriteria` int(11) NOT NULL,
  `nama_nilai_kriteria` varchar(255) DEFAULT NULL,
  `nilai_kriteria` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `m_nilai_kriteria`
--

INSERT INTO `m_nilai_kriteria` (`id_nilai_kriteria`, `nama_nilai_kriteria`, `nilai_kriteria`) VALUES
(1, 'Mendapat nasabah simpan ataupun pinjam >= 20 orang', '100'),
(2, 'Mendapat nasabah simpan ataupun pinjam >= 15 orang dan < 20 orang', '80'),
(3, 'Mendapat nasabah simpan ataupun pinjam >= 10 orang dan < 15 orang', '60'),
(4, 'Mendapat nasabah simpan ataupun pinjam >= 5 orang dan < 10 orang', '40'),
(5, 'Mendapat nasabah simpan ataupun pinjam < 5', '20'),
(6, 'Karyawan tidak ada absen atau 0', '100'),
(7, 'Karyawan ada absen 1', '80'),
(8, 'Karyawan ada absen 2', '60'),
(9, 'Karyawan ada absen  3', '40'),
(10, 'Karyawan ada absen >4', '20'),
(11, 'Masa kerja >=4 tahun', '100'),
(12, 'Masa kerja >=3 dan <4 tahun', '80'),
(13, 'Masa kerja  >=2 dan <3 tahun', '60'),
(14, 'Masa kerja >=1 dan <2 tahun', '40'),
(15, 'Masa kerja < 1 tahun', '20'),
(16, 'Tanggungan karyawan >1 (satu) orang anak', '100'),
(17, 'Tanggungan karyawan 1 (satu) orang anak', '60'),
(18, 'Tanggungan karyawan tidak ada atau belum menikah', '30'),
(19, 'Selalu dapat menyelsaikan tugas pelayanan sebaik-baiknya dengan sikap sopan dan sangat memuaskan baik pelayanan internal maupun eksternal organisasi.', '100'),
(20, 'Pada umumnya dapat menyelesaikan tugas pelayanan dengan baik dan sikap sopan serta memuaskan baik pelayanan internal maupun eksternal organisasi.', '80'),
(21, 'Adakalanya dapat menyelesaikan tugas pelayanan dengan cukup baik dan sikap cukup sopan serta cukup memuaskan pelayanan internal maupun eksternal organisasi organisasi.', '60'),
(22, 'kurang dapat menyelesaikan tugas pelayanan dengan baik dan sikap kurang sopan serta kurang memuaskan pelayanan internal maupun eksternal organisasi organisasi.', '40'),
(23, 'Tidak pernah menyelesaikan tugas pelayanan dengan baik dan sikap tidak sopan serta tidak memuaskan pelayanan internal maupun eksternal organisasi organisasi.', '20'),
(24, 'Dalam melaksanakan tugas selalu bersifat jujur, ikhlas dan tidak pernah menyalagunakan wewenang serta berani menanggung resiko dari tindakan yang dilakukannya.', '100'),
(25, 'Pada umumnya dalam melaksanakan tugas bersifat jujur, ikhlas dan tidak pernah menyalagunakan wewenangnya tetapi berani menanggung resiko dari tindakan yang dilakukannya.', '80'),
(26, 'Adakalanya dalam melaksanakan tugas bersifat jujur, ikhlas dan kadang-kadang menyalagunakan wewenangnya serta cukup berani menanggung resiko dari tindakan yang dilakukannya.', '60'),
(27, 'Kurang jujur, kurang ikhlas dalam melaksanakan tugas dan sering menyalagunakan wewenang tetapi kurang berani menanggung resiko dari tindakan yang dilakukannya.', '40'),
(28, 'Tidak pernah jujur, tidak ikhlas dalam melaksanakan tugas dan selalu menyalagunakan wewenang serta tidak berani menanggung resiko dari tindakan yang dilakukannya', '20'),
(29, 'Selalu mentaati peraturan perundang – undangan dan/atau peraturan kedinasan yang berlaku dengan rasa tanggung jawab dan selalu mentaati ketentuan jam kerja.', '100'),
(30, 'Pada umumnya mentaati peraturan perundang – undangan dan/atau peraturan kedinasan yang berlaku dengan rasa tanggung jawab dan selalu mentaati ketentuan jam kerja.', '80'),
(31, 'adakalanya mentaati peraturan perundang – undangan dan/atau peraturan kedinasan yang berlaku dengan rasa cukup tanggung jawab dan selalu mentaati ketentuan jam kerja', '60'),
(32, 'Kurang mentaati peraturan perundang – undangan dan/atau peraturan kedinasan yang berlaku dengan rasa kurang tanggung jawab dan selalu mentaati ketentuan jam kerja.', '40'),
(33, 'Tidak pernah mentaati peraturan perundang – undangan dan/atau peraturan kedinasan yang berlaku dengan rasa tidak tanggung jawab dan selalu mentaati ketentuan jam kerja.', '20'),
(34, 'selalu mampu bekerjasama dengan rekan kerja serta menghargai dan menerima pendapat orang lain, bersedia menerima keputusan yang diambil secara sah yang telah menjadi keputusan bersama.', '100'),
(35, 'Pada umumnya mampu bekerjasama dengan rekan Kerja serta menghargai dan menerima pendapat orang lain, bersedia menerima keputusan yang diambil secara sah yang telah menjadi keputusan bersama.', '80'),
(36, 'Adakalanya mampu bekerjasama dengan rekan kerja serta adakalanya menghargai dan menerima pendapat orang lain, kadang-kadang bersedia menerima keputusan yang diambil secara sah yang telah menjadi keputusan bersama.', '60'),
(37, 'Kurang mampu bekerjasama dengan rekan kerja serta kurang mampu menghargai dan menerima pendapat orang lain, kurang bersedia menerima keputusan yang diambil secara sah yang telah menjadi keputusan bersama.', '40'),
(38, 'Tidak pernah mampu bekerjasama dengan rekan kerja serta tidak menghargai dan menerima pendapat orang lain, tidak bersedia menerima keputusan yang diambil secara sah yang telah menjadi keputusan bersama.', '20'),
(39, 'Selalu bertindak tegas dan tidak memihak, kemampuan menggerrakan tim kerja untuk mencapai kinerja yang tinggi, serta mampu mengambil keputusan dengan cepat dan tepat.', '100'),
(40, 'Pada umumnya bertindak tegas dan tidak memihak, kemampuan menggerakan tim kerja untuk mencapai kinerja yang tinggi serta mampu mengambil keputusan dengan cepat dan tepat.', '80'),
(41, 'Adakalanya bertindak tegas dan tidak memihak, kemampuan menggerakan tim kerja untuk mencapai kinerja yang tinggi, serta adakalanya mampu mengambil keputusan dengan cepat dan tepat.', '60'),
(42, 'Kurang bertindak tegas dan tidak memihak, kemampuan menggerrakan tim kerja untuk mencapai kinerja yang tinggi serta kurang mampu mengambil keputusan dengan cepat dan tepat.', '40'),
(43, 'Tidak pernah mampu bertindak tegas dan memihak, tidak mampu menggerrakan tim kerja untuk mencapai kinerja yang tinggi serta tidak mampu mengambil keputusan dengan cepat dan tepat.', '20');

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
-- Struktur dari tabel `m_trans_kriteria_nilai`
--

CREATE TABLE `m_trans_kriteria_nilai` (
  `id_trans_kriteria_nilai` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `id_nilai_kriteria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `m_trans_kriteria_nilai`
--

INSERT INTO `m_trans_kriteria_nilai` (`id_trans_kriteria_nilai`, `id_kriteria`, `id_nilai_kriteria`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
(9, 2, 9),
(10, 2, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 3, 15),
(16, 4, 16),
(17, 4, 17),
(18, 4, 18),
(19, 5, 19),
(20, 5, 20),
(21, 5, 21),
(22, 5, 22),
(23, 5, 23),
(24, 6, 24),
(25, 6, 25),
(26, 6, 26),
(27, 6, 27),
(28, 6, 28),
(29, 7, 29),
(30, 7, 30),
(31, 7, 31),
(32, 7, 32),
(33, 7, 33),
(34, 8, 34),
(35, 8, 35),
(36, 8, 36),
(37, 8, 37),
(38, 8, 38),
(39, 9, 39),
(40, 9, 40),
(41, 9, 41),
(42, 9, 42),
(43, 9, 43);

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
(3, 'Komunikasi', '100000');

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
-- Indexes for table `d_pengguna`
--
ALTER TABLE `d_pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD KEY `fk_d_pengguna_m_kategori_pengguna1_idx` (`id_kategori_pengguna`);

--
-- Indexes for table `d_session`
--
ALTER TABLE `d_session`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

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
-- Indexes for table `m_trans_kriteria_nilai`
--
ALTER TABLE `m_trans_kriteria_nilai`
  ADD PRIMARY KEY (`id_trans_kriteria_nilai`),
  ADD KEY `fk_m_trans_kriteria_nilai_m_kriteria1_idx` (`id_kriteria`),
  ADD KEY `fk_m_trans_kriteria_nilai_m_nilai_kriteria1_idx` (`id_nilai_kriteria`);

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
  MODIFY `id_bonus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `d_gaji`
--
ALTER TABLE `d_gaji`
  MODIFY `id_gaji` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `d_pengguna`
--
ALTER TABLE `d_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `m_jabatan`
--
ALTER TABLE `m_jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `m_nilai_kriteria`
--
ALTER TABLE `m_nilai_kriteria`
  MODIFY `id_nilai_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
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
-- AUTO_INCREMENT for table `m_trans_kriteria_nilai`
--
ALTER TABLE `m_trans_kriteria_nilai`
  MODIFY `id_trans_kriteria_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `m_tunjangan`
--
ALTER TABLE `m_tunjangan`
  MODIFY `id_tunjangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
-- Ketidakleluasaan untuk tabel `m_karyawan`
--
ALTER TABLE `m_karyawan`
  ADD CONSTRAINT `fk_m_karyawan_m_jabatan` FOREIGN KEY (`id_jabatan`) REFERENCES `m_jabatan` (`id_jabatan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `m_trans_kriteria_nilai`
--
ALTER TABLE `m_trans_kriteria_nilai`
  ADD CONSTRAINT `fk_m_trans_kriteria_nilai_m_kriteria1` FOREIGN KEY (`id_kriteria`) REFERENCES `m_kriteria` (`id_kriteria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_m_trans_kriteria_nilai_m_nilai_kriteria1` FOREIGN KEY (`id_nilai_kriteria`) REFERENCES `m_nilai_kriteria` (`id_nilai_kriteria`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
