-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 08 Sep 2017 pada 18.02
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
('cac728d37bfffbf9fb65a3a308a7dc4f9d78c23e', '127.0.0.1', 1504877145, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343837373133363b),
('e42f4971b574008da1a46ae8cdb1240de6bb1616', '127.0.0.1', 1504877971, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343837373734313b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('d799114e72130aca4d08e5cb67b6a86633535df5', '127.0.0.1', 1504878330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343837383234323b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('44cefaeae4c58aeb29338d7ed1c1476824959d84', '127.0.0.1', 1504878868, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343837383634383b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b737563636573737c733a32373a22426572686173696c206d656e67696e7075746b616e20646174612e223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('63140c95474e31507ea6bf52838c3dc601317d6d', '127.0.0.1', 1504879380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343837393136343b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('526ce77058dae8fca0b765a442fcb1ca545bee8c', '127.0.0.1', 1504879984, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343837393733303b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('8648a0e153132cb474119d27ba4c13c39cf7087e', '127.0.0.1', 1504880134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838303133343b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('45e7e20a922f9513546720aa489e0049f929eb53', '192.168.100.16', 1504880581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838303238393b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('cc490ed5a6e40f5c40ffa5d81b95533aba746fc2', '127.0.0.1', 1504880519, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838303531393b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('ab8721f2daa6baa149726cd055d44ecde8b730d0', '192.168.100.15', 1504880811, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838303533383b),
('0a34afdebfa5084cad3b1d09f96a7e895d982b8a', '192.168.100.16', 1504880606, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838303630363b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('a4a6dba5d5becc153765651d4a3238ac7a622026', '192.168.100.15', 1504881164, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838303836323b),
('1644beebde6b34c1e141fb0af4bc516ebebdb2df', '192.168.100.15', 1504881604, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838313331353b737563636573737c733a32343a22426572686173696c206d656e79696d70616e20646174612e223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('cb4b0605b9411f222688323c11524eb08b54ff42', '192.168.100.15', 1504882718, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838323533323b),
('7cd222009b4181027e54bccb6bc18386a0235863', '192.168.100.15', 1504883090, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838333033303b),
('1795deade52e2a463a39dbf023fd4d2d5058ce51', '192.168.100.15', 1504883756, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838333437363b),
('99485613d96f2ce2273f1ce3f176a1ab3578830f', '192.168.100.15', 1504883866, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838333739383b),
('45494f23dec351fed89e557df7c434592e8804bc', '192.168.100.15', 1504884570, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838343237383b),
('49a105775f2818b6f160456d786c948bf6acf64c', '192.168.100.15', 1504884882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838343539353b),
('0debd8c4a678caab0263f2c8c37750756d0240e0', '192.168.100.15', 1504885155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838343930363b),
('ab070a4f21bed9701ca85ac965b137de058ae8f3', '192.168.100.15', 1504885514, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838353238323b),
('6e7eaf6353f5061796230d39736508fa022da798', '192.168.100.16', 1504885797, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838353531383b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b),
('f901906120fa8a4b16ed043ed2884b4ea367ef1b', '192.168.100.15', 1504885780, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838353637393b),
('fc8e5ed4aff140a6c14f024474db332239af9765', '192.168.100.16', 1504885990, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343838353933333b757365726e616d657c733a31303a22755f616b756e74696e67223b6c6576656c7c733a313a2231223b6e616d617c733a31373a22436970746f205472692052616861726a6f223b7369676e7c623a313b737563636573737c733a37383a22426572686173696c206d656e67686974756e6720626f6e75732e20556e74756b206d656968617420686173696c2c2073696c61686b616e20746172696b206b652062616769616e2062617761682e223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226e6577223b7d);

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
  MODIFY `id_gaji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
