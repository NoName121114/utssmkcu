-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 15, 2022 at 08:55 PM
-- Server version: 10.3.36-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smkcukng_uts`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(10) NOT NULL,
  `id_mapel` int(10) NOT NULL,
  `sesi` varchar(10) NOT NULL,
  `ruang` varchar(20) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `ikut` varchar(10) DEFAULT NULL,
  `susulan` varchar(10) DEFAULT NULL,
  `no_susulan` text DEFAULT NULL,
  `mulai` varchar(10) DEFAULT NULL,
  `selesai` varchar(10) DEFAULT NULL,
  `nama_proktor` varchar(50) DEFAULT NULL,
  `nip_proktor` varchar(50) DEFAULT NULL,
  `nama_pengawas` varchar(50) DEFAULT NULL,
  `nip_pengawas` varchar(50) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `tgl_ujian` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `file_pendukung`
--

CREATE TABLE `file_pendukung` (
  `id_file` int(11) NOT NULL,
  `id_mapel` int(11) DEFAULT 0,
  `nama_file` varchar(50) DEFAULT NULL,
  `status_file` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `file_pendukung`
--

INSERT INTO `file_pendukung` (`id_file`, `id_mapel`, `nama_file`, `status_file`) VALUES
(356, 1, '16632117598.png', NULL),
(357, 1, '16632117594.png', NULL),
(358, 1, '16632117598.png', NULL),
(359, 1, '16632117591.png', NULL),
(360, 1, '166321175912.png', NULL),
(361, 1, '166321175911.png', NULL),
(362, 1, '16632117599.png', NULL),
(363, 1, '16632117595.png', NULL),
(364, 1, '16632117592.png', NULL),
(365, 1, '166321175913.png', NULL),
(366, 1, '166321175910.png', NULL),
(367, 1, '16632117597.png', NULL),
(368, 1, '16632117596.png', NULL),
(369, 1, '16632117593.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jawaban`
--

CREATE TABLE `jawaban` (
  `id_jawaban` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `jawaban` char(1) DEFAULT NULL,
  `jawabx` char(1) DEFAULT NULL,
  `jenis` int(1) NOT NULL,
  `esai` text DEFAULT NULL,
  `nilai_esai` int(5) NOT NULL DEFAULT 0,
  `ragu` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_tugas`
--

CREATE TABLE `jawaban_tugas` (
  `id_jawaban` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `id_tugas` int(11) DEFAULT NULL,
  `jawaban` longtext DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_dikerjakan` datetime DEFAULT NULL,
  `tgl_update` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nilai` varchar(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` varchar(30) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama`, `status`) VALUES
('PTS', 'Penilaian Tengah Semester', 'aktif'),
('USBK', 'Ujian Sekolah', 'tidak');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `jurusan_id` varchar(25) NOT NULL,
  `nama_jurusan_sp` varchar(100) DEFAULT NULL,
  `kurikulum` varchar(120) DEFAULT NULL,
  `jurusan_sp_id` varchar(50) DEFAULT NULL,
  `kurikulum_id` varchar(20) DEFAULT NULL,
  `sekolah_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` varchar(11) NOT NULL,
  `level` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  `semester_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `level`, `nama`, `rombongan_belajar_id`, `semester_id`) VALUES
('XBDP', 'X', 'XBDP', NULL, NULL),
('XIBDP', 'XI', 'XIBDP', NULL, NULL),
('XIIBDP', 'XII', 'XIIBDP', NULL, NULL),
('XIITKJA', 'XII', 'XIITKJA', NULL, NULL),
('XIITKJB', 'XII', 'XIITKJB', NULL, NULL),
('XIITKROA', 'XII', 'XIITKROA', NULL, NULL),
('XIITKROB', 'XII', 'XIITKROB', NULL, NULL),
('XITKJA', 'XI', 'XITKJA', NULL, NULL),
('XITKJB', 'XI', 'XITKJB', NULL, NULL),
('XITKRO', 'XI', 'XITKRO', NULL, NULL),
('XTKJ', 'X', 'XTKJ', NULL, NULL),
('XTKRO', 'X', 'XTKRO', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `kode_level` varchar(5) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`kode_level`, `keterangan`, `rombongan_belajar_id`) VALUES
('X', 'X', NULL),
('XI', 'XI', NULL),
('XII', 'XII', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `text` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int(11) NOT NULL,
  `kode` varchar(255) NOT NULL DEFAULT '0',
  `idpk` varchar(255) NOT NULL,
  `idguru` varchar(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jml_soal` int(5) NOT NULL,
  `jml_esai` int(5) NOT NULL DEFAULT 0,
  `tampil_pg` int(5) NOT NULL,
  `tampil_esai` int(5) NOT NULL DEFAULT 0,
  `bobot_pg` int(5) NOT NULL,
  `bobot_esai` int(5) NOT NULL DEFAULT 0,
  `level` varchar(5) NOT NULL,
  `opsi` int(1) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(2) NOT NULL,
  `kkm` int(3) DEFAULT NULL,
  `soal_agama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `kode`, `idpk`, `idguru`, `nama`, `jml_soal`, `jml_esai`, `tampil_pg`, `tampil_esai`, `bobot_pg`, `bobot_esai`, `level`, `opsi`, `kelas`, `date`, `status`, `kkm`, `soal_agama`) VALUES
(1, 'tess', 'a:1:{i:0;s:3:\"BDP\";}', '285', 'tes', 20, 0, 20, 0, 100, 0, 'X', 5, 'a:1:{i:0;s:4:\"XBDP\";}', '2022-09-15 03:15:35', '1', 75, '');

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `kode_mapel` varchar(20) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL,
  `mata_pelajaran_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`kode_mapel`, `nama_mapel`, `mata_pelajaran_id`) VALUES
('tes', 'tes mapel', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id_materi` int(255) NOT NULL,
  `id_guru` int(255) NOT NULL DEFAULT 0,
  `kelas` text NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `materi` longtext DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_mulai` datetime NOT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `tgl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`id_materi`, `id_guru`, `kelas`, `mapel`, `judul`, `materi`, `file`, `tgl_mulai`, `youtube`, `tgl`, `status`) VALUES
(12, 1, 'a:1:{i:0;s:5:\"semua\";}', 'COVID', 'COVID SUDAH USAI', '<p>CONTOH MATERI</p>', NULL, '2020-07-05 21:00:00', 'https://www.youtube.com/watch?v=0-mwwfaSD44', '2020-07-05 14:10:16', NULL),
(13, 1, 'a:1:{i:0;s:5:\"semua\";}', 'COVID', 'CONTOH LAGI', '<p><iframe src=\"https://www.youtube.com/embed/0-mwwfaSD44\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></p>\r\n<p><a href=\"https://www.youtube.com/watch?v=0-mwwfaSD44\" target=\"_blank\" rel=\"noopener\">TONTON VIDEO</a></p>', NULL, '2020-07-05 21:00:00', '', '2020-07-05 14:14:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `kode_ujian` varchar(30) NOT NULL,
  `ujian_mulai` varchar(20) NOT NULL,
  `ujian_berlangsung` varchar(20) DEFAULT NULL,
  `ujian_selesai` varchar(20) DEFAULT NULL,
  `jml_benar` int(10) DEFAULT NULL,
  `jml_salah` int(10) DEFAULT NULL,
  `nilai_esai` varchar(10) DEFAULT NULL,
  `skor` varchar(10) DEFAULT NULL,
  `total` varchar(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `hasil` int(2) NOT NULL,
  `jawaban` text DEFAULT NULL,
  `jawaban_esai` longtext DEFAULT NULL,
  `nilai_esai2` text DEFAULT NULL,
  `online` int(1) NOT NULL DEFAULT 0,
  `id_soal` longtext DEFAULT NULL,
  `id_opsi` longtext DEFAULT NULL,
  `id_esai` text DEFAULT NULL,
  `blok` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengawas`
--

CREATE TABLE `pengawas` (
  `id_pengawas` int(11) NOT NULL,
  `nip` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `no_ktp` varchar(16) DEFAULT NULL,
  `tempat_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat_jalan` varchar(255) DEFAULT NULL,
  `rt_rw` varchar(8) DEFAULT NULL,
  `dusun` varchar(50) DEFAULT NULL,
  `kelurahan` varchar(50) DEFAULT NULL,
  `kecamatan` varchar(30) DEFAULT NULL,
  `kode_pos` int(6) DEFAULT NULL,
  `nuptk` varchar(20) DEFAULT NULL,
  `bidang_studi` varchar(50) DEFAULT NULL,
  `jenis_ptk` varchar(50) DEFAULT NULL,
  `tgs_tambahan` varchar(50) DEFAULT NULL,
  `status_pegawai` varchar(50) DEFAULT NULL,
  `status_aktif` varchar(20) DEFAULT NULL,
  `status_nikah` varchar(20) DEFAULT NULL,
  `sumber_gaji` varchar(30) DEFAULT NULL,
  `ahli_lab` varchar(10) DEFAULT NULL,
  `nama_ibu` varchar(40) DEFAULT NULL,
  `nama_suami` varchar(50) DEFAULT NULL,
  `nik_suami` varchar(20) DEFAULT NULL,
  `pekerjaan` varchar(20) DEFAULT NULL,
  `tmt` date DEFAULT NULL,
  `keahlian_isyarat` varchar(10) DEFAULT NULL,
  `kewarganegaraan` varchar(10) DEFAULT NULL,
  `npwp` varchar(16) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `ptk_id` varchar(50) DEFAULT NULL,
  `password2` text DEFAULT NULL,
  `ruang` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pengawas`
--

INSERT INTO `pengawas` (`id_pengawas`, `nip`, `nama`, `jabatan`, `username`, `password`, `level`, `no_ktp`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `no_hp`, `email`, `alamat_jalan`, `rt_rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `nuptk`, `bidang_studi`, `jenis_ptk`, `tgs_tambahan`, `status_pegawai`, `status_aktif`, `status_nikah`, `sumber_gaji`, `ahli_lab`, `nama_ibu`, `nama_suami`, `nik_suami`, `pekerjaan`, `tmt`, `keahlian_isyarat`, `kewarganegaraan`, `npwp`, `foto`, `ptk_id`, `password2`, `ruang`) VALUES
(1, '-', 'administrator', '', 'NoName', '$2y$10$.83D.h5Srgk09Y3bnwDZAO.EYuIvA99rAtOxqFp8022ivugzgUPZy', 'admin', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', NULL, NULL, NULL),
(273, '-', 'PAJAR SIDIK NURFAKHRI', NULL, 'pajar', '$2y$10$QFJSTIMfE0kYtDOm/k3z7enCO2HhNHxVu1m12Kclc.rLF177OisYq', 'pengawas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ONLINE'),
(285, '-', 'Guru 1', 'XITKJB', 'guru1', '$2y$10$jmRcXx0JdjG.J4OWq1TBc.B.i2lhppgrCec/kxw9JX0R1ASk25Rly', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(286, '-', 'Guru 2', 'XITKJA', 'guru2', '$2y$10$0BtQqWtvXEKAY2UijsYUB.LUJ4kz9Zn8T3E.VK6xY9WLV6yPs98em', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(287, '-', 'Guru 3', '', 'guru3', '$2y$10$f58rpPrb06LZdr7NiMnAtO0U3GvdU15J2dg0tCHKdDlIVXLDXL/ge', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(288, '-', 'Guru 4', '', 'guru4', '$2y$10$Rmo9jP.7e0i9eSLt53GK4ezYQhCuUheAufbk8mjZLefWDIk8V3Wwm', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(289, '-', 'Guru 5', '', 'guru5', '$2y$10$PwKmHsEu77/eODIy4Ta.3.23k8vZU4DVcdfldXAdWxJD2j7Rlx0dq', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(290, '-', 'Guru 6', '', 'guru6', '$2y$10$HPCoPBP5NxU2xqsLNuLaZeBbA.Q9HGz3AJvuF.kqV3PM5/NhXZ2/G', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(291, '-', 'Guru 7', '', 'guru7', '$2y$10$ECrPTYWnrTEB5kK4pH754eXdo1YdJgiviiQPlzCWlAltXopVHYKQe', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(292, '-', 'Guru 8', '', 'guru8', '$2y$10$owmt55rXG2SzLs/qpRpC6u3TlvOgYmT/Mk5ZrYWKnm1qzMCzG7eIG', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(293, '-', 'Guru 9', '', 'guru9', '$2y$10$569u8uwY9qEpw1m6IPZQc.Hu7vHaQ/5eOI0oCtRB11nd9soEH65Q2', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(294, '-', 'Guru 10', '', 'guru10', '$2y$10$i8dAzg2GUqtnNr3QFa/G7.mOcGFeLBBMtVffVseDPjPh5P48Zu3K6', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id_pengumuman` int(5) NOT NULL,
  `type` varchar(30) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `user` int(3) NOT NULL,
  `text` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pk`
--

CREATE TABLE `pk` (
  `id_pk` varchar(10) NOT NULL,
  `program_keahlian` varchar(50) NOT NULL,
  `jurusan_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pk`
--

INSERT INTO `pk` (`id_pk`, `program_keahlian`, `jurusan_id`) VALUES
('BDP', 'BDP', NULL),
('TKJ', 'TKJ', NULL),
('TKRO', 'TKRO', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `referensi_jurusan`
--

CREATE TABLE `referensi_jurusan` (
  `jurusan_id` varchar(10) NOT NULL,
  `nama_jurusan` varchar(100) DEFAULT NULL,
  `untuk_sma` int(1) NOT NULL,
  `untuk_smk` int(1) NOT NULL,
  `jenjang_pendidikan_id` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `kode_ruang` varchar(10) NOT NULL,
  `keterangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`kode_ruang`, `keterangan`) VALUES
('R1', 'R1');

-- --------------------------------------------------------

--
-- Table structure for table `savsoft_options`
--

CREATE TABLE `savsoft_options` (
  `oid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `q_option` text NOT NULL,
  `q_option_match` varchar(1000) DEFAULT NULL,
  `score` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `savsoft_qbank`
--

CREATE TABLE `savsoft_qbank` (
  `qid` int(11) NOT NULL,
  `question_type` varchar(100) NOT NULL DEFAULT 'Multiple Choice Single Answer',
  `question` text NOT NULL,
  `description` text NOT NULL,
  `cid` int(11) NOT NULL,
  `lid` int(11) NOT NULL,
  `no_time_served` int(11) NOT NULL DEFAULT 0,
  `no_time_corrected` int(11) NOT NULL DEFAULT 0,
  `no_time_incorrected` int(11) NOT NULL DEFAULT 0,
  `no_time_unattempted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `semester_id` varchar(5) NOT NULL,
  `tahun_ajaran_id` varchar(4) NOT NULL,
  `nama_semester` varchar(50) NOT NULL,
  `semester` int(1) NOT NULL,
  `periode_aktif` enum('1','0') NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `server`
--

CREATE TABLE `server` (
  `kode_server` varchar(20) NOT NULL,
  `nama_server` varchar(30) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `server`
--

INSERT INTO `server` (`kode_server`, `nama_server`, `status`) VALUES
('ONLINE', 'ONLINE', 'aktif'),
('SR01', 'SR01', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `sesi`
--

CREATE TABLE `sesi` (
  `kode_sesi` varchar(10) NOT NULL,
  `nama_sesi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sesi`
--

INSERT INTO `sesi` (`kode_sesi`, `nama_sesi`) VALUES
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5'),
('6', '6'),
('7', '7'),
('8', '8'),
('9', '9');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `session_time` varchar(10) NOT NULL,
  `session_hash` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(11) NOT NULL,
  `aplikasi` varchar(100) DEFAULT NULL,
  `kode_sekolah` varchar(10) DEFAULT NULL,
  `sekolah` varchar(50) DEFAULT NULL,
  `jenjang` varchar(5) DEFAULT NULL,
  `kepsek` varchar(50) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kecamatan` varchar(50) DEFAULT NULL,
  `kota` varchar(30) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `header` text DEFAULT NULL,
  `header_kartu` text DEFAULT NULL,
  `nama_ujian` text DEFAULT NULL,
  `versi` varchar(10) DEFAULT NULL,
  `ip_server` varchar(100) DEFAULT NULL,
  `waktu` varchar(50) DEFAULT NULL,
  `server` varchar(50) DEFAULT NULL,
  `id_server` varchar(50) DEFAULT NULL,
  `url_host` varchar(50) DEFAULT NULL,
  `token_api` varchar(50) DEFAULT NULL,
  `sekolah_id` varchar(50) DEFAULT NULL,
  `npsn` varchar(10) DEFAULT NULL,
  `db_versi` varchar(10) DEFAULT NULL,
  `bc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id_setting`, `aplikasi`, `kode_sekolah`, `sekolah`, `jenjang`, `kepsek`, `nip`, `alamat`, `kecamatan`, `kota`, `telp`, `fax`, `web`, `email`, `logo`, `header`, `header_kartu`, `nama_ujian`, `versi`, `ip_server`, `waktu`, `server`, `id_server`, `url_host`, `token_api`, `sekolah_id`, `npsn`, `db_versi`, `bc`) VALUES
(1, 'CBTSMKCU | Powered by TKJ', 'K0248', 'SMK CENDIKIA UTAMA', 'SMK', 'Muhana, S.Pd.I', '-', 'Jl. Raya Langseb - Bendungan 45574', 'Lebakwangi', 'Kuningan', '000000000', '0000000', 'smkcu-kng.sch.id', 'admin@smkcu-kng.sch.id', 'dist/img/logo44.png', '', 'KARTU PESERTA PTS\nSMK CENDIKIA UTAMA', 'Penilaian Tengah Semester', '2.9', 'http://192.168.0.200/candycbt', 'Asia/Jakarta', 'pusat', 'SR01', 'http://pts.smkhsagung.sch.id/', 'HO3FIrBYcFUMp0', '8cce47df-aae7-4274-83cb-5af3093eab56', '69787351', '2.9.2', 'dist/img/bc.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sinkron`
--

CREATE TABLE `sinkron` (
  `nama_data` varchar(50) NOT NULL,
  `data` varchar(50) DEFAULT NULL,
  `jumlah` varchar(50) DEFAULT NULL,
  `tanggal` varchar(50) DEFAULT NULL,
  `status_sinkron` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sinkron`
--

INSERT INTO `sinkron` (`nama_data`, `data`, `jumlah`, `tanggal`, `status_sinkron`) VALUES
('DATA1', 'siswa', '821', '2020-09-13 21:23:08', 1),
('DATA2', 'bank soal', '45', '2020-09-13 21:23:08', 1),
('DATA3', 'soal', '1183', '2020-09-13 21:23:08', 1),
('DATA4', 'jadwal', '7', '2020-09-13 21:23:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `id_kelas` varchar(11) DEFAULT NULL,
  `idpk` varchar(10) DEFAULT NULL,
  `nis` varchar(30) DEFAULT NULL,
  `no_peserta` varchar(30) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `level` varchar(5) DEFAULT NULL,
  `ruang` varchar(10) DEFAULT NULL,
  `sesi` int(2) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(30) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `kebutuhan_khusus` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `rt` varchar(5) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `dusun` varchar(100) DEFAULT NULL,
  `kelurahan` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kode_pos` int(10) DEFAULT NULL,
  `jenis_tinggal` varchar(100) DEFAULT NULL,
  `alat_transportasi` varchar(100) DEFAULT NULL,
  `hp` varchar(15) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `skhun` int(11) DEFAULT NULL,
  `no_kps` varchar(50) DEFAULT NULL,
  `nama_ayah` varchar(150) DEFAULT NULL,
  `tahun_lahir_ayah` int(4) DEFAULT NULL,
  `pendidikan_ayah` varchar(50) DEFAULT NULL,
  `pekerjaan_ayah` varchar(100) DEFAULT NULL,
  `penghasilan_ayah` varchar(100) DEFAULT NULL,
  `nohp_ayah` varchar(15) DEFAULT NULL,
  `nama_ibu` varchar(150) DEFAULT NULL,
  `tahun_lahir_ibu` int(4) DEFAULT NULL,
  `pendidikan_ibu` varchar(50) DEFAULT NULL,
  `pekerjaan_ibu` varchar(100) DEFAULT NULL,
  `penghasilan_ibu` varchar(100) DEFAULT NULL,
  `nohp_ibu` int(15) DEFAULT NULL,
  `nama_wali` varchar(150) DEFAULT NULL,
  `tahun_lahir_wali` int(4) DEFAULT NULL,
  `pendidikan_wali` varchar(50) DEFAULT NULL,
  `pekerjaan_wali` varchar(100) DEFAULT NULL,
  `penghasilan_wali` varchar(50) DEFAULT NULL,
  `angkatan` int(5) DEFAULT NULL,
  `nisn` varchar(50) DEFAULT NULL,
  `peserta_didik_id` varchar(50) DEFAULT NULL,
  `semester_id` varchar(10) DEFAULT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'aktif',
  `online` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `id_kelas`, `idpk`, `nis`, `no_peserta`, `nama`, `level`, `ruang`, `sesi`, `username`, `password`, `foto`, `server`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `agama`, `kebutuhan_khusus`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `jenis_tinggal`, `alat_transportasi`, `hp`, `email`, `skhun`, `no_kps`, `nama_ayah`, `tahun_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `nohp_ayah`, `nama_ibu`, `tahun_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `nohp_ibu`, `nama_wali`, `tahun_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `penghasilan_wali`, `angkatan`, `nisn`, `peserta_didik_id`, `semester_id`, `rombongan_belajar_id`, `status`, `online`) VALUES
(1, 'XBDP', 'BDP', '151610041', '12-248-001-8', 'Adelia ', 'X', 'R1', 1, 't8NdfP', 't8NdfP', 'siswa.png', 'SR01', NULL, NULL, NULL, 'kristen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '08986204405', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 1),
(2, 'XBDP', 'BDP', '151610043', '12-248-002-7', 'Devi Sri Maharani', 'X', 'R1', 1, 'bhDkPP', 'bhDkPP', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(3, 'XBDP', 'BDP', '151610044', '12-248-003-6', 'Elsa Junior', 'X', 'R1', 1, 'UZGhjF', 'UZGhjF', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(4, 'XBDP', 'BDP', '151610045', '12-248-004-5', 'Evita Yuliana', 'X', 'R1', 1, 'MQ4qHt', 'MQ4qHt', '', 'SR01', NULL, NULL, NULL, 'kristen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(5, 'XBDP', 'BDP', '151610047', '12-248-005-4', 'Haryanti', 'X', 'R1', 1, 'yqyhZQ', 'yqyhZQ', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(6, 'XBDP', 'BDP', '151610048', '12-248-006-3', 'Heni Titisari A', 'X', 'R1', 1, 'srTHay', 'srTHay', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(7, 'XBDP', 'BDP', '151610049', '12-248-007-2', 'Hesia Maheswari', 'X', 'R1', 1, 'crvLCf', 'crvLCf', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(8, 'XBDP', 'BDP', '151610042', '12-248-008-9', 'Karisma Wulandari', 'X', 'R1', 1, 'ZVfSvF', 'ZVfSvF', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(9, 'XBDP', 'BDP', '151610050', '12-248-009-8', 'Linda Oktaviana', 'X', 'R1', 1, 'RVZ7A5', 'RVZ7A6', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(10, 'XBDP', 'BDP', '151610051', '12-248-010-7', 'Livi Aliviah', 'X', 'R1', 1, '9mZa6m', '9mZa6m', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(11, 'XBDP', 'BDP', '151610052', '12-248-011-6', 'Mala Rosmala', 'X', 'R1', 1, '5P8LWp', '5P8LWp', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(12, 'XBDP', 'BDP', '151610053', '12-248-012-5', 'Nabila Putri Zahra', 'X', 'R1', 1, 'btfyuN', 'btfyuN', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(13, 'XBDP', 'BDP', '151610055', '12-248-013-4', 'Ninis Khaerunisa', 'X', 'R1', 1, 'q6ExwS', 'q6ExwS', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(14, 'XBDP', 'BDP', '151610054', '12-248-014-3', 'Novita', 'X', 'R1', 1, 'DSa7jc', 'DSa7jc', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(15, 'XBDP', 'BDP', '151610057', '12-248-015-2', 'Prida Maulida Tri Kurniasih', 'X', 'R1', 1, 'Mhhhfe', 'Mhhhfe', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(16, 'XBDP', 'BDP', '151610062', '12-248-016-9', 'Rani Prihatini', 'X', 'R1', 1, 'vQ4KnK', 'vQ4KnK', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(17, 'XBDP', 'BDP', '151610058', '12-248-017-8', 'Rani Ratna Sari', 'X', 'R1', 1, 'Dygwx4', 'Dygwx5', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(18, 'XBDP', 'BDP', '151610063', '12-248-018-7', 'Riva Nur \'Asiah', 'X', 'R1', 1, 'z79PLP', 'z79PLP', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(19, 'XBDP', 'BDP', '151610065', '12-248-019-6', 'Salsa Putri Selpiani', 'X', 'R1', 1, 'anUkR8', 'anUkR9', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(20, 'XBDP', 'BDP', '151610066', '12-248-020-5', 'Wiar Revalina Kouva', 'X', 'R1', 1, 'JRnp24', 'JRnp25', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(21, 'XBDP', 'BDP', '151610059', '12-248-021-4', 'Wulandari Nurcantika', 'X', 'R1', 1, 'eLrNcN', 'eLrNcN', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(22, 'XTKJ', 'TKJ', '151610067', '12-248-022-3', 'Abdul Aziz', 'X', 'R1', 2, 'eGkvsj', 'eGkvsj', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(23, 'XTKJ', 'TKJ', '151610068', '12-248-023-2', 'Ajeng Desvitasari', 'X', 'R1', 2, 'qvvXYa', 'qvvXYa', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(24, 'XTKJ', 'TKJ', '151610070', '12-248-024-9', 'Anisa Ayu Cahyani', 'X', 'R1', 2, '3nM5S9', '3nM5S10', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(25, 'XTKJ', 'TKJ', '151610069', '12-248-025-8', 'Aril Nazril Irham', 'X', 'R1', 2, 'guVTye', 'guVTye', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(26, 'XTKJ', 'TKJ', '151610072', '12-248-026-7', 'Cahya Akmal', 'X', 'R1', 2, 'fsK5UW', 'fsK5UW', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(27, 'XTKJ', 'TKJ', '151610073', '12-248-027-6', 'Dadan Ramdani', 'X', 'R1', 2, 'd2ZV36', 'd2ZV37', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(28, 'XTKJ', 'TKJ', '151610074', '12-248-028-5', 'Dani Ropali', 'X', 'R1', 2, 'MM3RuY', 'MM3RuY', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(29, 'XTKJ', 'TKJ', '151610075', '12-248-029-4', 'Darwini', 'X', 'R1', 2, 'UskvkE', 'UskvkE', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(30, 'XTKJ', 'TKJ', '151610076', '12-248-030-3', 'Deni Ariyanto', 'X', 'R1', 2, '3sPKRW', '3sPKRW', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(31, 'XTKJ', 'TKJ', '151610077', '12-248-031-2', 'Elsa Apriliani', 'X', 'R1', 2, 'AfLeKF', 'AfLeKF', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(32, 'XTKJ', 'TKJ', '151610078', '12-248-032-9', 'Fauzi Hidayat', 'X', 'R1', 2, 'k3FRFN', 'k3FRFN', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(33, 'XTKJ', 'TKJ', '151610079', '12-248-033-8', 'Fawwaz Raffay I.', 'X', 'R1', 2, 'QBfYB8', 'QBfYB9', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(34, 'XTKJ', 'TKJ', '151610081', '12-248-034-7', 'Fazri Al-parizi', 'X', 'R1', 2, '6gBYmm', '6gBYmm', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(35, 'XTKJ', 'TKJ', '151610083', '12-248-035-6', 'Ghefira Adliya', 'X', 'R1', 2, '86ZyWv', '86ZyWv', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(36, 'XTKJ', 'TKJ', '151610084', '12-248-036-5', 'Muhamad Ridwan', 'X', 'R1', 2, 'ULXaGA', 'ULXaGA', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(37, 'XTKJ', 'TKJ', '151610085', '12-248-037-4', 'Nazwa Davadillah', 'X', 'R1', 2, 'zSXNn3', 'zSXNn4', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(38, 'XTKJ', 'TKJ', '151610086', '12-248-038-3', 'Nizar Afrian', 'X', 'R1', 2, 'GxxhGW', 'GxxhGW', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(39, 'XTKJ', 'TKJ', '151610089', '12-248-039-2', 'Pinkan Sri Astuti', 'X', 'R1', 2, 'gdfABS', 'gdfABS', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(40, 'XTKJ', 'TKJ', '151610090', '12-248-040-9', 'Rado Adlipin', 'X', 'R1', 2, 'b2D28K', 'b2D28K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(41, 'XTKJ', 'TKJ', '151610091', '12-248-041-8', 'Rindo Faisal', 'X', 'R1', 2, '7cKAvf', '7cKAvf', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(42, 'XTKJ', 'TKJ', '151610092', '12-248-042-7', 'Rizal Nuralip Pratama', 'X', 'R1', 2, 'twGQxc', 'twGQxc', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(43, 'XTKJ', 'TKJ', '151610093', '12-248-043-6', 'Siti Laela Badriah', 'X', 'R1', 2, 'a62F8n', 'a62F8n', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(44, 'XTKJ', 'TKJ', '151610094', '12-248-044-5', 'Taupik Ismail', 'X', 'R1', 2, 'pJzL9j', 'pJzL9j', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(45, 'XTKRO', 'TKRO', '151610096', '12-248-045-4', 'Achmad Sufyaan', 'X', 'R1', 3, '5fTLNE', '5fTLNE', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(46, 'XTKRO', 'TKRO', '151610099', '12-248-046-3', 'Ade Andriansyah', 'X', 'R1', 3, 'f9MeSy', 'f9MeSy', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(47, 'XTKRO', 'TKRO', '151610100', '12-248-047-2', 'Adhi Ardiansyah P.', 'X', 'R1', 3, 'xkJEwX', 'xkJEwX', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(48, 'XTKRO', 'TKRO', '151610101', '12-248-048-9', 'Alan Dahlan', 'X', 'R1', 3, 'As932y', 'As932y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(49, 'XTKRO', 'TKRO', '151610102', '12-248-049-8', 'Andre', 'X', 'R1', 3, 'nN2V3U', 'nN2V3U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(50, 'XTKRO', 'TKRO', '151610103', '12-248-050-7', 'Aprian Yunarno', 'X', 'R1', 3, 'uPwPDW', 'uPwPDW', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(51, 'XTKRO', 'TKRO', '151610104', '12-248-051-6', 'Darno', 'X', 'R1', 3, 'KudsXs', 'KudsXs', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(52, 'XTKRO', 'TKRO', '151610128', '12-248-052-5', 'Diki ', 'X', 'R1', 3, 'qxY3Fk', 'qxY3Fk', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(53, 'XTKRO', 'TKRO', '151610106', '12-248-053-4', 'Diki Setiana', 'X', 'R1', 3, 'WhqmMX', 'WhqmMX', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(54, 'XTKRO', 'TKRO', '151610107', '12-248-054-3', 'Dio Rizki Ramdani', 'X', 'R1', 3, 'CXR8Jn', 'CXR8Jn', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(55, 'XTKRO', 'TKRO', '151610109', '12-248-055-2', 'Epi Nopia', 'X', 'R1', 3, 'yZtYb5', 'yZtYb6', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(56, 'XTKRO', 'TKRO', '151610108', '12-248-056-9', 'Fadli Khaerudin', 'X', 'R1', 3, 'jvjZzr', 'jvjZzr', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(57, 'XTKRO', 'TKRO', '151610110', '12-248-057-8', 'Fadli Kurniawan', 'X', 'R1', 3, 'zR2AmM', 'zR2AmM', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(58, 'XTKRO', 'TKRO', '151610111', '12-248-058-7', 'Faizal Nugraha', 'X', 'R1', 3, '7ZAE2w', '7ZAE2w', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(59, 'XTKRO', 'TKRO', '151610112', '12-248-059-6', 'Fajar Setiawan', 'X', 'R1', 3, 'pvvrwF', 'pvvrwF', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(60, 'XTKRO', 'TKRO', '151610113', '12-248-060-5', 'Fatra Rizky H', 'X', 'R1', 3, 'PZuuYZ', 'PZuuYZ', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(61, 'XTKRO', 'TKRO', '151610114', '12-248-061-4', 'Fikri Aulia Rahman', 'X', 'R1', 3, 'zVgTzJ', 'zVgTzJ', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(62, 'XTKRO', 'TKRO', '151610115', '12-248-062-3', 'Firdaus Setiawan', 'X', 'R1', 3, 'YGdAVK', 'YGdAVK', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(63, 'XTKRO', 'TKRO', '151610117', '12-248-063-2', 'Ifdal Badriah H.', 'X', 'R1', 3, 'fgYGa6', 'fgYGa7', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(64, 'XTKRO', 'TKRO', '151610118', '12-248-064-9', 'Ilham Ramdani', 'X', 'R1', 3, 'vc6RrZ', 'vc6RrZ', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(65, 'XTKRO', 'TKRO', '151610119', '12-248-065-8', 'Irsyad Pratama', 'X', 'R1', 3, 'ghxxyb', 'ghxxyb', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(66, 'XTKRO', 'TKRO', '151610123', '12-248-066-7', 'Iwa Nugraha', 'X', 'R1', 3, 'mSsHnv', 'mSsHnv', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(67, 'XTKRO', 'TKRO', '151610124', '12-248-067-6', 'Jaka Lesmana', 'X', 'R1', 3, 'BKdTgZ', 'BKdTgZ', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(68, 'XTKRO', 'TKRO', '151610125', '12-248-068-5', 'Jana Apriana', 'X', 'R1', 3, 'P9awjD', 'P9awjD', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(69, 'XTKRO', 'TKRO', '151610126', '12-248-069-4', 'Khoirul Anwar', 'X', 'R1', 3, 'u6natL', 'u6natL', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(70, 'XTKRO', 'TKRO', '151610127', '12-248-070-3', 'Maman Sulaeman', 'X', 'R1', 3, 'AYp4zU', 'AYp4zU', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(71, 'XTKRO', 'TKRO', '151610129', '12-248-071-2', 'Muhamad Ardiansyah', 'X', 'R1', 3, '2RVWcQ', '2RVWcQ', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(72, 'XTKRO', 'TKRO', '151610168', '12-248-072-9', 'Muhamad Farhan Nashrudin', 'X', 'R1', 3, 'NPsb9N', 'NPsb9N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(73, 'XTKRO', 'TKRO', '151610130', '12-248-073-8', 'Muhamad Holil jalalludin', 'X', 'R1', 3, 'rxf8uJ', 'rxf8uJ', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(74, 'XTKRO', 'TKRO', '151610132', '12-248-074-7', 'Muhamad Nandar Irfani', 'X', 'R1', 3, 'Fpjeb4', 'Fpjeb5', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(75, 'XTKRO', 'TKRO', '151610133', '12-248-075-6', 'Muhamad Rafi J.', 'X', 'R1', 3, '98EyrK', '98EyrK', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(76, 'XTKRO', 'TKRO', '151610169', '12-248-076-5', 'Muhammad Rizki', 'X', 'R1', 3, 'jB6bE8', 'jB6bE9', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(77, 'XTKRO', 'TKRO', '151610134', '12-248-077-4', 'Rifki Anjani', 'X', 'R1', 3, 'Kqa2LD', 'Kqa2LD', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(78, 'XTKRO', 'TKRO', '151610135', '12-248-078-3', 'Riko Fazryan', 'X', 'R1', 3, 'jJHhaG', 'jJHhaG', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(79, 'XTKRO', 'TKRO', '151610120', '12-248-079-2', 'Sendi', 'X', 'R1', 3, '7xyMan', '7xyMan', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(80, 'XTKRO', 'TKRO', '151610136', '12-248-080-9', 'Wildan Pratama', 'X', 'R1', 3, 'YA2aE7', 'YA2aE8', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(81, 'XTKRO', 'TKRO', '151610166', '12-248-081-8', 'Zaqi Al-Pahrizi', 'X', 'R1', 3, 'ZgfF95', 'ZgfF96', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(82, 'XIBDP', 'BDP', '151610172', '12-248-082-7', 'Anggita Chintia M', 'XI', 'R1', 4, 'CUr4jW', 'CUr4jW', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(83, 'XIBDP', 'BDP', '151610138', '12-248-083-6', 'Cantika', 'XI', 'R1', 4, 'h56ts7', 'h56ts8', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(84, 'XIBDP', 'BDP', '151610121', '12-248-084-5', 'Devi Damayanti', 'XI', 'R1', 4, 'S7GU9Z', 'S7GU9Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(85, 'XIBDP', 'BDP', '151610139', '12-248-085-4', 'Dewi Sri Julianti', 'XI', 'R1', 4, 'eRECQa', 'eRECQa', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(86, 'XIBDP', 'BDP', '151610140', '12-248-086-3', 'Konita Lutpiyah', 'XI', 'R1', 4, 'Pd4TNh', 'Pd4TNh', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(87, 'XIBDP', 'BDP', '151610001', '12-248-087-2', 'Nabillah Nurfajriah', 'XI', 'R1', 4, 'ZG3G4R', 'ZG3G4R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(88, 'XIBDP', 'BDP', '151610002', '12-248-088-9', 'Nani Mulyani', 'XI', 'R1', 4, 'VgU2Rn', 'VgU2Rn', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(89, 'XIBDP', 'BDP', '151610003', '12-248-089-8', 'Nia Agustin', 'XI', 'R1', 4, 'wxPkDF', 'wxPkDF', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(90, 'XIBDP', 'BDP', '151610004', '12-248-090-7', 'Pebrianti Endah Pratiwi', 'XI', 'R1', 4, 'jCruxt', 'jCruxt', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(91, 'XIBDP', 'BDP', '151610005', '12-248-091-6', 'Resa Mulyati', 'XI', 'R1', 4, 'xznaD3', 'xznaD4', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(92, 'XIBDP', 'BDP', '151610006', '12-248-092-5', 'Revi Revianti', 'XI', 'R1', 4, 'NvFUmg', 'NvFUmg', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(93, 'XIBDP', 'BDP', '151610007', '12-248-093-4', 'Rima Mulyani', 'XI', 'R1', 4, 'MLzUM9', 'MLzUM10', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(94, 'XIBDP', 'BDP', '151610008', '12-248-094-3', 'Rofiatunnisa', 'XI', 'R1', 4, 'Wz4aPC', 'Wz4aPC', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(95, 'XIBDP', 'BDP', '151610009', '12-248-095-2', 'Siti Nurhasanah', 'XI', 'R1', 4, '7KvzVx', '7KvzVx', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(96, 'XIBDP', 'BDP', '151610010', '12-248-096-9', 'Yulia Agustin', 'XI', 'R1', 4, 'qyZ5n5', 'qyZ5n6', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(97, 'XIBDP', 'BDP', '151610011', '12-248-097-8', 'Rita', 'XI', 'R1', 4, 'dURnwH', 'dURnwH', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(98, 'XIBDP', 'BDP', '151610012', '12-248-098-7', 'Desi Anastasigar', 'XI', 'R1', 4, 'um5YDs', 'um5YDs', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(99, 'XITKJA', 'TKJ', '151610013', '12-248-099-6', 'Abdul Rahman Ali', 'XI', 'R1', 5, 'GPgkbM', 'GPgkbM', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(100, 'XITKJA', 'TKJ', '151610014', '12-248-100-5', 'Ade Mutia Kamila', 'XI', 'R1', 5, 'ZBSved', 'ZBSved', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(101, 'XITKJA', 'TKJ', '151610015', '12-248-101-4', 'Adit Maulana', 'XI', 'R1', 5, 'AFKEZy', 'AFKEZy', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(102, 'XITKJA', 'TKJ', '151610016', '12-248-102-3', 'Dea Pujia Sari', 'XI', 'R1', 5, 'Twg2SE', 'Twg2SE', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(103, 'XITKJA', 'TKJ', '151610018', '12-248-103-2', 'Della Afrilliani', 'XI', 'R1', 5, 'yvSzTF', 'yvSzTF', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(104, 'XITKJA', 'TKJ', '151610019', '12-248-104-9', 'Dwi Rukdiyah Sabila', 'XI', 'R1', 5, 'dSdjfn', 'dSdjfn', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(105, 'XITKJA', 'TKJ', '151610020', '12-248-105-8', 'Eris Syabani', 'XI', 'R1', 5, 'rwfK9P', 'rwfK9P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(106, 'XITKJA', 'TKJ', '151610021', '12-248-106-7', 'Ibnaty Salsabila Lirabiha', 'XI', 'R1', 5, 'kRAVXd', 'kRAVXd', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(107, 'XITKJA', 'TKJ', '151610022', '12-248-107-6', 'Idris Nurfadilah', 'XI', 'R1', 5, 'KaswvE', 'KaswvE', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(108, 'XITKJA', 'TKJ', '151610023', '12-248-108-5', 'Ismaya Rahmawati', 'XI', 'R1', 5, 'z37JLB', 'z37JLB', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(109, 'XITKJA', 'TKJ', '151610024', '12-248-109-4', 'M. Dzaki Rhomadon', 'XI', 'R1', 5, '8R5Apy', '8R5Apy', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(110, 'XITKJA', 'TKJ', '151610025', '12-248-110-3', 'Maya Damayanti', 'XI', 'R1', 5, 'WamL4x', 'WamL4x', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(111, 'XITKJA', 'TKJ', '151610026', '12-248-111-2', 'Muhamad Bayu F', 'XI', 'R1', 5, 'EZDpnv', 'EZDpnv', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(112, 'XITKJA', 'TKJ', '151610027', '12-248-112-9', 'Ovi Ropiah', 'XI', 'R1', 5, 'GYuZkS', 'GYuZkS', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(113, 'XITKJA', 'TKJ', '151610028', '12-248-113-8', 'Ramdani', 'XI', 'R1', 5, 'YbZGgc', 'YbZGgc', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(114, 'XITKJA', 'TKJ', '151610029', '12-248-114-7', 'Reza Maulana Firdaus', 'XI', 'R1', 5, 'hESqj7', 'hESqj8', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(115, 'XITKJA', 'TKJ', '151610030', '12-248-115-6', 'Rika Aulia', 'XI', 'R1', 5, 'yHT5cL', 'yHT5cL', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(116, 'XITKJA', 'TKJ', '151610031', '12-248-116-5', 'Rina Karsinah', 'XI', 'R1', 5, 'frdf4y', 'frdf4y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(117, 'XITKJA', 'TKJ', '151610032', '12-248-117-4', 'Rindiani Nur Azizah', 'XI', 'R1', 5, 'DbYxgA', 'DbYxgA', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(118, 'XITKJA', 'TKJ', '151610033', '12-248-118-3', 'Roswati', 'XI', 'R1', 5, 'XJ7FQa', 'XJ7FQa', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(119, 'XITKJA', 'TKJ', '151610034', '12-248-119-2', 'Sholahudin Al Ayubi', 'XI', 'R1', 5, 'X238BX', 'X238BX', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(120, 'XITKJA', 'TKJ', '151610035', '12-248-120-9', 'Siska Novia', 'XI', 'R1', 5, 'ZJWRsV', 'ZJWRsV', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(121, 'XITKJA', 'TKJ', '151610036', '12-248-121-8', 'Suci Sri Fatmawati', 'XI', 'R1', 5, 'xGdBdA', 'xGdBdA', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(122, 'XITKJA', 'TKJ', '151610037', '12-248-122-7', 'Wiwin Kuswinati', 'XI', 'R1', 5, '4jRCD8', '4jRCD9', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(123, 'XITKJB', 'TKJ', '151610038', '12-248-123-6', 'Aam  Amaliyah', 'XI', 'R1', 6, 'yvRcrq', 'yvRcrq', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(124, 'XITKJB', 'TKJ', '151610039', '12-248-124-5', 'Abhi Raihan M.A', 'XI', 'R1', 6, 'NnEjX8', 'NnEjX9', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(125, 'XITKJB', 'TKJ', '151610040', '12-248-125-4', 'Aditya Zulfikri', 'XI', 'R1', 6, '4camPr', '4camPr', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(126, 'XITKJB', 'TKJ', '151610041', '12-248-121-9', 'Ahmad Ripa\'i', 'XI', 'R1', 6, 'NLaWHR', 'NLaWHR', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(127, 'XITKJB', 'TKJ', '151610042', '12-248-122-8', 'Bangbang Irawan', 'XI', 'R1', 6, '5f63w2', '5f63w3', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(128, 'XITKJB', 'TKJ', '151610043', '12-248-123-7', 'Daryanto ', 'XI', 'R1', 6, 'RnDFx5', 'RnDFx6', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(129, 'XITKJB', 'TKJ', '151610044', '12-248-124-6', 'Dhea Nur Awaliyah', 'XI', 'R1', 6, 'qzyJng', 'qzyJng', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(130, 'XITKJB', 'TKJ', '151610045', '12-248-125-5', 'Dino Haryawan', 'XI', 'R1', 6, 'QkfkTp', 'QkfkTp', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(131, 'XITKJB', 'TKJ', '151610046', '12-248-121-10', 'Gita Aulia Putri', 'XI', 'R1', 6, 'uRP3YL', 'uRP3YL', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(132, 'XITKJB', 'TKJ', '151610047', '12-248-122-9', 'Hani Wiyani', 'XI', 'R1', 6, 'nQYk8q', 'nQYk8q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(133, 'XITKJB', 'TKJ', '151610048', '12-248-123-8', 'Ipah Latipah', 'XI', 'R1', 6, 'MmTjUF', 'MmTjUF', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(134, 'XITKJB', 'TKJ', '151610049', '12-248-124-7', 'Julianti Silvi Ani', 'XI', 'R1', 6, 'SjLxJA', 'SjLxJA', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0);
INSERT INTO `siswa` (`id_siswa`, `id_kelas`, `idpk`, `nis`, `no_peserta`, `nama`, `level`, `ruang`, `sesi`, `username`, `password`, `foto`, `server`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `agama`, `kebutuhan_khusus`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `jenis_tinggal`, `alat_transportasi`, `hp`, `email`, `skhun`, `no_kps`, `nama_ayah`, `tahun_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `nohp_ayah`, `nama_ibu`, `tahun_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `nohp_ibu`, `nama_wali`, `tahun_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `penghasilan_wali`, `angkatan`, `nisn`, `peserta_didik_id`, `semester_id`, `rombongan_belajar_id`, `status`, `online`) VALUES
(135, 'XITKJB', 'TKJ', '151610050', '12-248-125-6', 'Melisa', 'XI', 'R1', 6, 'VMYHpp', 'VMYHpp', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(136, 'XITKJB', 'TKJ', '151610051', '12-248-121-11', 'Neti Nurlita', 'XI', 'R1', 6, 'yn8ATY', 'yn8ATY', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(137, 'XITKJB', 'TKJ', '151610052', '12-248-122-10', 'Nida Siti Nur', 'XI', 'R1', 6, 'LpBST2', 'LpBST3', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(138, 'XITKJB', 'TKJ', '151610053', '12-248-123-9', 'Novi Alya Rismaya', 'XI', 'R1', 6, 'S8EZYM', 'S8EZYM', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(139, 'XITKJB', 'TKJ', '151610054', '12-248-124-8', 'Raihan Pratama', 'XI', 'R1', 6, 'SnCHHL', 'SnCHHL', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(140, 'XITKJB', 'TKJ', '151610055', '12-248-125-7', 'Rendi Rivaldi', 'XI', 'R1', 6, 'tGxsnw', 'tGxsnw', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(141, 'XITKJB', 'TKJ', '151610056', '12-248-121-12', 'Rico Perdiansyah', 'XI', 'R1', 6, 'Zp8TrL', 'Zp8TrL', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(142, 'XITKJB', 'TKJ', '151610057', '12-248-122-11', 'Siti Roulan Fadilah', 'XI', 'R1', 6, 'qGQdCJ', 'qGQdCJ', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(143, 'XITKJB', 'TKJ', '151610058', '12-248-123-10', 'Susi Suprihatin', 'XI', 'R1', 6, 'QJGPHZ', 'QJGPHZ', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(144, 'XITKJB', 'TKJ', '151610059', '12-248-124-9', 'Vera Ramadhan', 'XI', 'R1', 6, 'm8nUDa', 'm8nUDa', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(145, 'XITKJB', 'TKJ', '151610060', '12-248-125-8', 'Vina Novitasari', 'XI', 'R1', 6, '6xaj9Z', '6xaj9Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(146, 'XITKJB', 'TKJ', '151610061', '12-248-121-13', 'Widiana Oktavia', 'XI', 'R1', 6, 'ezjz2F', 'ezjz2F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(147, 'XITKJB', 'TKJ', '151610062', '12-248-122-12', 'Wiwit  Novitasari', 'XI', 'R1', 6, 'Yyu4jb', 'Yyu4jb', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(148, 'XITKRO', 'TKRO', '151610063', '12-248-123-11', 'Amelia', 'XI', 'R1', 7, 'bAXset', 'bAXset', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(149, 'XITKRO', 'TKRO', '151610064', '12-248-124-10', 'Anindia Safitri', 'XI', 'R1', 7, 'cQRDWP', 'cQRDWP', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(150, 'XITKRO', 'TKRO', '151610065', '12-248-125-9', 'Ari Saputra', 'XI', 'R1', 7, 'YWAqUU', 'YWAqUU', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(151, 'XITKRO', 'TKRO', '151610066', '12-248-121-14', 'Arip Maulana', 'XI', 'R1', 7, 'WZJ2js', 'WZJ2js', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(152, 'XITKRO', 'TKRO', '151610067', '12-248-122-13', 'Cahya Wiiningsih', 'XI', 'R1', 7, 'qq6Cpm', 'qq6Cpm', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(153, 'XITKRO', 'TKRO', '151610068', '12-248-123-12', 'Dapid Selamet', 'XI', 'R1', 7, '8jhxym', '8jhxym', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(154, 'XITKRO', 'TKRO', '151610069', '12-248-124-11', 'Didin Misbahuddin', 'XI', 'R1', 7, 'b7t8Xr', 'b7t8Xr', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(155, 'XITKRO', 'TKRO', '151610070', '12-248-125-10', 'Diki Aditia', 'XI', 'R1', 7, 'Vapx3k', 'Vapx3k', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(156, 'XITKRO', 'TKRO', '151610071', '12-248-121-15', 'Diky Juliansyah', 'XI', 'R1', 7, '5ujnzd', '5ujnzd', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(157, 'XITKRO', 'TKRO', '151610072', '12-248-122-14', 'Indra Saputra', 'XI', 'R1', 7, 'QfT9Fm', 'QfT9Fm', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(158, 'XITKRO', 'TKRO', '151610073', '12-248-123-13', 'Latip Maulana', 'XI', 'R1', 7, 'MYkw7U', 'MYkw7U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(159, 'XITKRO', 'TKRO', '151610074', '12-248-124-12', 'M Adit Setia P', 'XI', 'R1', 7, 'ETenAA', 'ETenAA', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(160, 'XITKRO', 'TKRO', '151610075', '12-248-125-11', 'M Ridwan', 'XI', 'R1', 7, 'hRvN4D', 'hRvN4D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(161, 'XITKRO', 'TKRO', '151610076', '12-248-121-16', 'M Rifa Gymnastiar', 'XI', 'R1', 7, 'C3xjG7', 'C3xjG8', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(162, 'XITKRO', 'TKRO', '151610077', '12-248-122-15', 'Mardiasnyah', 'XI', 'R1', 7, 'rSBkum', 'rSBkum', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(163, 'XITKRO', 'TKRO', '151610078', '12-248-123-14', 'Mohamad Ilyas', 'XI', 'R1', 7, '98BPQ7', '98BPQ8', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(164, 'XITKRO', 'TKRO', '151610079', '12-248-124-13', 'Nuroji', 'XI', 'R1', 7, 'yNxxBF', 'yNxxBF', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(165, 'XITKRO', 'TKRO', '151610080', '12-248-125-12', 'Rahma Sri Trisna Asih', 'XI', 'R1', 7, 'fMZZhF', 'fMZZhF', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(166, 'XITKRO', 'TKRO', '151610081', '12-248-121-17', 'Ridho Saputra', 'XI', 'R1', 7, 'JasAE7', 'JasAE8', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(167, 'XITKRO', 'TKRO', '151610082', '12-248-122-16', 'Ridwan Nurkhoik', 'XI', 'R1', 7, 'DX9mpD', 'DX9mpD', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(168, 'XITKRO', 'TKRO', '151610083', '12-248-123-15', 'Selvi Angraeni', 'XI', 'R1', 7, 'eRw4FG', 'eRw4FG', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(169, 'XITKRO', 'TKRO', '151610084', '12-248-124-14', 'Sely Eldawati', 'XI', 'R1', 7, '4hBAnE', '4hBAnE', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(170, 'XITKRO', 'TKRO', '151610085', '12-248-125-13', 'Sendi Permana', 'XI', 'R1', 7, 'n84zXW', 'n84zXW', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(171, 'XITKRO', 'TKRO', '151610086', '12-248-121-18', 'Shifa Agustina', 'XI', 'R1', 7, 'J2AhyR', 'J2AhyR', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(172, 'XITKRO', 'TKRO', '151610087', '12-248-122-17', 'Dimas Albar Warsito', 'XI', 'R1', 7, 'KewZY2', 'KewZY3', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(173, 'XITKRO', 'TKRO', '151610088', '12-248-123-16', 'Irvan Nashrudin', 'XI', 'R1', 7, 'EeLQWP', 'EeLQWP', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(174, 'XIIBDP', 'BDP', '151610089', '12-248-124-15', 'Amelia Al Zahra', 'XII', 'R1', 8, 'B67ecP', 'B67ecP', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(175, 'XIIBDP', 'BDP', '151610090', '12-248-125-14', 'Anggi Apriyani', 'XII', 'R1', 8, 'eUCcNL', 'eUCcNL', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(176, 'XIIBDP', 'BDP', '151610091', '12-248-121-19', 'Anggi Setiawati', 'XII', 'R1', 8, 'LvZmTR', 'LvZmTR', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(177, 'XIIBDP', 'BDP', '151610092', '12-248-122-18', 'Arum Sabrina', 'XII', 'R1', 8, 'cWKTF2', 'cWKTF3', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(178, 'XIIBDP', 'BDP', '151610093', '12-248-123-17', 'Della Octavia', 'XII', 'R1', 8, 'gzZn5W', 'gzZn5W', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(179, 'XIIBDP', 'BDP', '151610094', '12-248-124-16', 'Dwi Chika Berliana', 'XII', 'R1', 8, 'xfJKya', 'xfJKya', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(180, 'XIIBDP', 'BDP', '151610095', '12-248-125-15', 'Fera Hayaci', 'XII', 'R1', 8, 'Q2ePam', 'Q2ePam', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(181, 'XIIBDP', 'BDP', '151610096', '12-248-121-20', 'Imas Siti Shopiyah', 'XII', 'R1', 8, 'aAG3c6', 'aAG3c7', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(182, 'XIIBDP', 'BDP', '151610097', '12-248-122-19', 'Nindhy Aulia Cendayani', 'XII', 'R1', 8, 'R9G7L8', 'R9G7L9', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(183, 'XIIBDP', 'BDP', '151610098', '12-248-123-18', 'Nisya Nurpadillah', 'XII', 'R1', 8, 'vfYRt9', 'vfYRt10', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(184, 'XIIBDP', 'BDP', '151610099', '12-248-124-17', 'Novi Alpionita', 'XII', 'R1', 8, 'bjf9xC', 'bjf9xC', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(185, 'XIIBDP', 'BDP', '151610100', '12-248-125-16', 'Novia Ramadhanti', 'XII', 'R1', 8, 'FNVkBx', 'FNVkBx', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(186, 'XIIBDP', 'BDP', '151610101', '12-248-121-21', 'Nur Aisyah', 'XII', 'R1', 8, 'FLZwbV', 'FLZwbV', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(187, 'XIIBDP', 'BDP', '151610102', '12-248-122-20', 'Nur Fadilah', 'XII', 'R1', 8, 'WUwtPf', 'WUwtPf', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(188, 'XIIBDP', 'BDP', '151610103', '12-248-123-19', 'Rahma Auliya', 'XII', 'R1', 8, 'NVkxNr', 'NVkxNr', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(189, 'XIIBDP', 'BDP', '151610104', '12-248-124-18', 'Sri Nurhayati ', 'XII', 'R1', 8, '7fdxV5', '7fdxV6', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(190, 'XIIBDP', 'BDP', '151610105', '12-248-125-17', 'Yeni Oktapiani', 'XII', 'R1', 8, 'SdxjpF', 'SdxjpF', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(191, 'XIITKJA', 'TKJ', '151610106', '12-248-121-22', 'Aang Purnama', 'XII', 'R1', 9, 'EYcEvG', 'EYcEvG', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(192, 'XIITKJA', 'TKJ', '151610107', '12-248-122-21', 'Alfa Rizi', 'XII', 'R1', 9, 'PdTryj', 'PdTryj', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(193, 'XIITKJA', 'TKJ', '151610108', '12-248-123-20', 'Anis Septiyani', 'XII', 'R1', 9, 'n4EZgU', 'n4EZgU', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(194, 'XIITKJA', 'TKJ', '151610109', '12-248-124-19', 'Difki Lesmana', 'XII', 'R1', 9, 'fD6fDB', 'fD6fDB', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(195, 'XIITKJA', 'TKJ', '151610110', '12-248-125-18', 'Dini Rahmadhani', 'XII', 'R1', 9, '65VRTt', '65VRTt', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(196, 'XIITKJA', 'TKJ', '151610111', '12-248-121-23', 'Ekti Nadia', 'XII', 'R1', 9, '2KT5Ad', '2KT5Ad', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(197, 'XIITKJA', 'TKJ', '151610112', '12-248-122-22', 'Ira Rismayanti', 'XII', 'R1', 9, 'RaZS3s', 'RaZS3s', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(198, 'XIITKJA', 'TKJ', '151610113', '12-248-123-21', 'Mochamad Bilal Aditiya', 'XII', 'R1', 9, 'L9Rkp5', 'L9Rkp6', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(199, 'XIITKJA', 'TKJ', '151610114', '12-248-124-20', 'Nisa Rohmawati', 'XII', 'R1', 9, 'n3QZam', 'n3QZam', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(200, 'XIITKJA', 'TKJ', '151610115', '12-248-125-19', 'Nisa Uswatun Hasanah', 'XII', 'R1', 9, 'wRMmfj', 'wRMmfj', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(201, 'XIITKJA', 'TKJ', '151610116', '12-248-121-24', 'Nur Paujiana', 'XII', 'R1', 9, 'mn48qa', 'mn48qa', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(202, 'XIITKJA', 'TKJ', '151610117', '12-248-122-23', 'Patna Saputri', 'XII', 'R1', 9, 'JYjs2u', 'JYjs2u', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(203, 'XIITKJA', 'TKJ', '151610118', '12-248-123-22', 'Rendy Mahardika Perdana', 'XII', 'R1', 9, 'xZZH2v', 'xZZH2v', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(204, 'XIITKJA', 'TKJ', '151610119', '12-248-124-21', 'Salma Indrayani', 'XII', 'R1', 9, '9Xs8Zu', '9Xs8Zu', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(205, 'XIITKJA', 'TKJ', '151610120', '12-248-125-20', 'Selma Nurhalimah', 'XII', 'R1', 9, 'fRExAn', 'fRExAn', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(206, 'XIITKJA', 'TKJ', '151610121', '12-248-121-25', 'Selvi Candra Winata', 'XII', 'R1', 9, 'hGEEhn', 'hGEEhn', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(207, 'XIITKJA', 'TKJ', '151610122', '12-248-122-24', 'Serli ', 'XII', 'R1', 9, 'dV6yUk', 'dV6yUk', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(208, 'XIITKJA', 'TKJ', '151610123', '12-248-121-24', 'Suci Wulandari', 'XII', 'R1', 9, 'dTBQbX', 'dTBQbX', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(209, 'XIITKJA', 'TKJ', '151610124', '12-248-122-23', 'Surya Akbar Nugraha', 'XII', 'R1', 9, 'gKd92T', 'gKd92T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(210, 'XIITKJA', 'TKJ', '151610125', '12-248-123-22', 'Tita Nurcahya', 'XII', 'R1', 9, 'r9P24H', 'r9P24H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(211, 'XIITKJA', 'TKJ', '151610126', '12-248-124-21', 'Yoga Permana', 'XII', 'R1', 9, '339j6e', '339j6e', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(212, 'XIITKJA', 'TKJ', '151610127', '12-248-125-20', 'Tegar Samudra Darussalam', 'XII', 'R1', 9, 'cxYLvY', 'cxYLvY', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(213, 'XIITKJA', 'TKJ', '151610128', '12-248-121-25', 'Zaenal Faturahman', 'XII', 'R1', 9, 'uwtpUp', 'uwtpUp', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(214, 'XIITKJB', 'TKJ', '151610129', '12-248-122-24', 'Aditia Wahyu Pratama', 'XII', 'R1', 8, 'EPZYZf', 'EPZYZf', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(215, 'XIITKJB', 'TKJ', '151610130', '12-248-123-23', 'Alfiyah Nur Rosyidah', 'XII', 'R1', 8, '7AnKm7', '7AnKm8', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(216, 'XIITKJB', 'TKJ', '151610131', '12-248-124-22', 'Ayu Septiani', 'XII', 'R1', 8, 'Y63d3P', 'Y63d3P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(217, 'XIITKJB', 'TKJ', '151610132', '12-248-125-21', 'Eci Cahayati Puji Lestari', 'XII', 'R1', 8, 'EvqWDz', 'EvqWDz', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(218, 'XIITKJB', 'TKJ', '151610133', '12-248-121-26', 'Elan Subakti', 'XII', 'R1', 8, 'tLVcSv', 'tLVcSv', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(219, 'XIITKJB', 'TKJ', '151610134', '12-248-122-25', 'Elin Halimatussa\'diyah', 'XII', 'R1', 8, 'Q6zXG7', 'Q6zXG8', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(220, 'XIITKJB', 'TKJ', '151610135', '12-248-121-25', 'Ernawati', 'XII', 'R1', 8, 'ngBdWL', 'ngBdWL', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(221, 'XIITKJB', 'TKJ', '151610136', '12-248-122-24', 'Hafidz Harrist Nugraha', 'XII', 'R1', 8, '8Lbfu5', '8Lbfu6', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(222, 'XIITKJB', 'TKJ', '151610137', '12-248-123-23', 'Iip Hidayatullah ', 'XII', 'R1', 8, 'Nm3gwc', 'Nm3gwc', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(223, 'XIITKJB', 'TKJ', '151610138', '12-248-124-22', 'Indra Lesmana', 'XII', 'R1', 8, '3njcXy', '3njcXy', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(224, 'XIITKJB', 'TKJ', '151610139', '12-248-125-21', 'Jubaedi Alfarisi ', 'XII', 'R1', 8, 'VszPWe', 'VszPWe', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(225, 'XIITKJB', 'TKJ', '151610140', '12-248-121-26', 'Karizki Ikhsanudin', 'XII', 'R1', 8, 'YtyZuV', 'YtyZuV', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(226, 'XIITKJB', 'TKJ', '151610141', '12-248-122-25', 'Lussi Setiawati', 'XII', 'R1', 8, 'wufa3k', 'wufa3k', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(227, 'XIITKJB', 'TKJ', '151610142', '12-248-123-24', 'Mochamad Adithya R', 'XII', 'R1', 8, 'BKWZ8T', 'BKWZ8T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(228, 'XIITKJB', 'TKJ', '151610143', '12-248-124-23', 'Putri Wulandari', 'XII', 'R1', 8, 'jDWs8C', 'jDWs8C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(229, 'XIITKJB', 'TKJ', '151610144', '12-248-125-22', 'Ramdhani', 'XII', 'R1', 8, 'pxa4xT', 'pxa4xT', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(230, 'XIITKJB', 'TKJ', '151610145', '12-248-121-27', 'Ridwan Saputra', 'XII', 'R1', 8, 'LNAqnC', 'LNAqnC', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(231, 'XIITKJB', 'TKJ', '151610146', '12-248-122-26', 'Rika Amelia', 'XII', 'R1', 8, 'ddemyr', 'ddemyr', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(232, 'XIITKJB', 'TKJ', '151610147', '12-248-121-26', 'Rizka Siti Damayanti', 'XII', 'R1', 8, 'aMVvsY', 'aMVvsY', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(233, 'XIITKJB', 'TKJ', '151610148', '12-248-122-25', 'Salsa Nabila', 'XII', 'R1', 8, 't3jaB7', 't3jaB8', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(234, 'XIITKJB', 'TKJ', '151610149', '12-248-123-24', 'Sekar Galuh', 'XII', 'R1', 8, 'GDnyDv', 'GDnyDv', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(235, 'XIITKJB', 'TKJ', '151610150', '12-248-124-23', 'Sopiyatul Hasanah', 'XII', 'R1', 8, 'rDGnZK', 'rDGnZK', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(236, 'XIITKJB', 'TKJ', '151610151', '12-248-125-22', 'Wulan Sondari', 'XII', 'R1', 8, 'H4MNDT', 'H4MNDT', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(237, 'XIITKJB', 'TKJ', '151610152', '12-248-121-27', 'Yosifa Aditya', 'XII', 'R1', 8, 'asgKdv', 'asgKdv', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(238, 'XIITKROA', 'TKRO', '151610153', '12-248-122-26', 'Abi Prasetya', 'XII', 'R1', 4, 'ZKVnYh', 'ZKVnYh', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(239, 'XIITKROA', 'TKRO', '151610154', '12-248-123-25', 'Ading Hidayat', 'XII', 'R1', 4, 'CgSmU7', 'CgSmU8', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(240, 'XIITKROA', 'TKRO', '151610155', '12-248-124-24', 'Afrizal Nurdiana Putra', 'XII', 'R1', 4, '3XFJ9H', '3XFJ9H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(241, 'XIITKROA', 'TKRO', '151610156', '12-248-125-23', 'Ahmad Dwi Ilyasa', 'XII', 'R1', 4, 'DLjFWM', 'DLjFWM', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(242, 'XIITKROA', 'TKRO', '151610157', '12-248-121-28', 'Al Fatah Hilalludin', 'XII', 'R1', 4, 'BmAeMk', 'BmAeMk', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(243, 'XIITKROA', 'TKRO', '151610158', '12-248-122-27', 'Ardiansyah', 'XII', 'R1', 4, 'Y8njvr', 'Y8njvr', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(244, 'XIITKROA', 'TKRO', '151610159', '12-248-121-27', 'Ari Aryawan', 'XII', 'R1', 4, 'kgnZXA', 'kgnZXA', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(245, 'XIITKROA', 'TKRO', '151610160', '12-248-122-26', 'Asep Muhamad Nurdin', 'XII', 'R1', 4, '5u9LBW', '5u9LBW', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(246, 'XIITKROA', 'TKRO', '151610161', '12-248-123-25', 'Dandi Suganda', 'XII', 'R1', 4, '4Jn93N', '4Jn93N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(247, 'XIITKROA', 'TKRO', '151610162', '12-248-124-24', 'Diky Hermawan', 'XII', 'R1', 4, 'SYnVWe', 'SYnVWe', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(248, 'XIITKROA', 'TKRO', '151610163', '12-248-125-23', 'Fadli Maulana', 'XII', 'R1', 4, 'aKZST7', 'aKZST8', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(249, 'XIITKROA', 'TKRO', '151610164', '12-248-121-28', 'Ifan Abdilah', 'XII', 'R1', 4, 'bUSRUB', 'bUSRUB', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(250, 'XIITKROA', 'TKRO', '151610165', '12-248-122-27', 'Jajang Nurjaman', 'XII', 'R1', 4, 'rQdQsa', 'rQdQsa', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(251, 'XIITKROA', 'TKRO', '151610166', '12-248-123-26', 'Keiysa Naila Putri', 'XII', 'R1', 4, 'KJpEUn', 'KJpEUn', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(252, 'XIITKROA', 'TKRO', '151610167', '12-248-124-25', 'Muhamad Dwi Ramdani', 'XII', 'R1', 4, '65j2MT', '65j2MT', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(253, 'XIITKROA', 'TKRO', '151610168', '12-248-125-24', 'Muhamad Ridho Fauzian', 'XII', 'R1', 4, 'WU6S37', 'WU6S38', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(254, 'XIITKROA', 'TKRO', '151610169', '12-248-121-29', 'Muhammad Kris Andrean', 'XII', 'R1', 4, 'pUgtjU', 'pUgtjU', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(255, 'XIITKROA', 'TKRO', '151610170', '12-248-122-28', 'Noval Ramadhan', 'XII', 'R1', 4, 'd4MACz', 'd4MACz', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(256, 'XIITKROA', 'TKRO', '151610171', '12-248-121-28', 'Reza Firmansyah', 'XII', 'R1', 4, 'tqmssA', 'tqmssA', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(257, 'XIITKROA', 'TKRO', '151610172', '12-248-122-27', 'Rio Saputra', 'XII', 'R1', 4, 'mEyvRS', 'mEyvRS', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(258, 'XIITKROA', 'TKRO', '151610173', '12-248-123-26', 'Rizky Saputra', 'XII', 'R1', 4, '6LgyzH', '6LgyzH', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(259, 'XIITKROA', 'TKRO', '151610174', '12-248-124-25', 'Saeful', 'XII', 'R1', 4, 'Jw9muG', 'Jw9muG', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(260, 'XIITKROA', 'TKRO', '151610175', '12-248-125-24', 'Sopi Lestari', 'XII', 'R1', 4, 'rCetCB', 'rCetCB', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(261, 'XIITKROA', 'TKRO', '151610176', '12-248-121-29', 'Wahyu', 'XII', 'R1', 4, 'XrhAuu', 'XrhAuu', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(262, 'XIITKROB', 'TKRO', '151610177', '12-248-122-28', 'Amarudin', 'XII', 'R1', 1, 'kEeZRL', 'kEeZRL', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(263, 'XIITKROB', 'TKRO', '151610178', '12-248-123-27', 'Anggi Priatna', 'XII', 'R1', 1, 'kCDLeq', 'kCDLeq', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(264, 'XIITKROB', 'TKRO', '151610179', '12-248-124-26', 'Apip Piganda', 'XII', 'R1', 1, 'um6Gg5', 'um6Gg6', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(265, 'XIITKROB', 'TKRO', '151610180', '12-248-125-25', 'David', 'XII', 'R1', 1, 'kwEKZa', 'kwEKZa', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(266, 'XIITKROB', 'TKRO', '151610181', '12-248-121-30', 'Dikky Suhendar', 'XII', 'R1', 1, 'vWYmKT', 'vWYmKT', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0);
INSERT INTO `siswa` (`id_siswa`, `id_kelas`, `idpk`, `nis`, `no_peserta`, `nama`, `level`, `ruang`, `sesi`, `username`, `password`, `foto`, `server`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `agama`, `kebutuhan_khusus`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `jenis_tinggal`, `alat_transportasi`, `hp`, `email`, `skhun`, `no_kps`, `nama_ayah`, `tahun_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `nohp_ayah`, `nama_ibu`, `tahun_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `nohp_ibu`, `nama_wali`, `tahun_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `penghasilan_wali`, `angkatan`, `nisn`, `peserta_didik_id`, `semester_id`, `rombongan_belajar_id`, `status`, `online`) VALUES
(267, 'XIITKROB', 'TKRO', '151610182', '12-248-122-29', 'Hasim', 'XII', 'R1', 1, 'QtyV92', 'QtyV93', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(268, 'XIITKROB', 'TKRO', '151610183', '12-248-121-29', 'Hetdi Nuralam', 'XII', 'R1', 1, 'FmsxAa', 'FmsxAa', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(269, 'XIITKROB', 'TKRO', '151610184', '12-248-122-28', 'Indra', 'XII', 'R1', 1, 'HEALg5', 'HEALg6', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(270, 'XIITKROB', 'TKRO', '151610185', '12-248-123-27', 'Mohamad Farhan Zein', 'XII', 'R1', 1, 'urgNXH', 'urgNXH', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(271, 'XIITKROB', 'TKRO', '151610186', '12-248-124-26', 'Muhamad Mazen', 'XII', 'R1', 1, 'anYf7k', 'anYf7k', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(272, 'XIITKROB', 'TKRO', '151610187', '12-248-125-25', 'Mulyadi', 'XII', 'R1', 1, 'k9c8Lt', 'k9c8Lt', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(273, 'XIITKROB', 'TKRO', '151610188', '12-248-121-30', 'Nehru Jagat Palaguna', 'XII', 'R1', 1, 'BNuBaW', 'BNuBaW', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(274, 'XIITKROB', 'TKRO', '151610189', '12-248-122-29', 'Ririn Rabani', 'XII', 'R1', 1, 'qw4eq6', 'qw4eq7', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(275, 'XIITKROB', 'TKRO', '151610190', '12-248-123-28', 'Riyan Juliansyah', 'XII', 'R1', 1, 'RKKkVe', 'RKKkVe', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(276, 'XIITKROB', 'TKRO', '151610191', '12-248-124-27', 'Rizki Maulana', 'XII', 'R1', 1, 'h7tK9U', 'h7tK9U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(277, 'XIITKROB', 'TKRO', '151610192', '12-248-125-26', 'Samsul Anwar', 'XII', 'R1', 1, 'pdP6Q3', 'pdP6Q4', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(278, 'XIITKROB', 'TKRO', '151610193', '12-248-121-31', 'Sandi Kurniawan', 'XII', 'R1', 1, 'SsrnQc', 'SsrnQc', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(279, 'XIITKROB', 'TKRO', '151610194', '12-248-122-30', 'Wawat Nurcahya', 'XII', 'R1', 1, 'aSzWzd', 'aSzWzd', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(280, 'XIITKROB', 'TKRO', '151610195', '12-248-121-30', 'Yogi Rahman Febrianto', 'XII', 'R1', 1, 'Xx7664', 'Xx7665', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0);

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id_soal` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `nomor` int(5) DEFAULT NULL,
  `soal` longtext DEFAULT NULL,
  `jenis` int(1) DEFAULT NULL,
  `pilA` longtext DEFAULT NULL,
  `pilB` longtext DEFAULT NULL,
  `pilC` longtext DEFAULT NULL,
  `pilD` longtext DEFAULT NULL,
  `pilE` longtext DEFAULT NULL,
  `jawaban` varchar(1) DEFAULT NULL,
  `file` mediumtext DEFAULT NULL,
  `file1` mediumtext DEFAULT NULL,
  `fileA` mediumtext DEFAULT NULL,
  `fileB` mediumtext DEFAULT NULL,
  `fileC` mediumtext DEFAULT NULL,
  `fileD` mediumtext DEFAULT NULL,
  `fileE` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id_soal`, `id_mapel`, `nomor`, `soal`, `jenis`, `pilA`, `pilB`, `pilC`, `pilD`, `pilE`, `jawaban`, `file`, `file1`, `fileA`, `fileB`, `fileC`, `fileD`, `fileE`) VALUES
(1, 1, 1, ' Untuk mengatasi masalah sampah plastik, pemerintah telah menerapkan undang-undang yang berisi pengaturan penggunaan plastik. Salah satu pengaturan tersebut adalah pengenaan cukai kemasan plastik.  Diharapkan dengan pengaturan tersebut penggunaan kemasan plastik dapat berkurang. <br>Makna istilah <i>cukai</i> pada paragraf  tersebut adalah&hellip; .', 1, '&amp;amp;nbsp;', '&amp;amp;nbsp;', ' Pajak', ' Denda', ' Barang', 'C', NULL, '', '16632117598.png', '16632117594.png', '', '', ''),
(2, 1, 2, ' Cermati teks berita berikut! <br>Ide pokok teks tersebut adalah ....', 1, ' perkembangan media yang mempengaruhi cara mengonsumsi makanan', ' fungsi buku menu masakan dalam kehidupan masyarakat', ' peranan instagram dalam bidang kuliner bagi masyarakat saat ini', ' peranan media televisi dalam bidang kuliner Indonesia', ' pengaruh media sosial dalam bidang kuliner pada masa lalu', 'A', NULL, '16632117598.png', '', '', '', '', ''),
(3, 1, 3, ' Penelitian dua desa di kawasan Gunung Kendeng Pati Jawa Tengah, menemukan 32 jenis capung, 55 jenis kupu-kupu dan 64 jenis burung. Identifikasi jenis satwa ini membuktikan keanekaragaman hayati di kawasan Kendeng masih baik. Aneka capung dan kupu-kupu mengidentifikasikan jernihnya mata air dan aliran sungai di Kendeng. Temuan aneka burung menunjukkan harmoni kekayaan keanekaragaman hayati masih terjaga. <br>Simpulan paragraf tersebut adalah&hellip; .', 1, ' Jenis-jenis serangga seperti capung dan kupu-kupu masih dapat hidup di daerah pegunungan di sekitar  Kendeng Utara.', ' Identifikasi jenis burung menunjukkan bahwa masyarakat di kawasan Pegunungan Kendeng suka berburu hewan liar.', ' Penemuan jenis-jenis capung, kupu-kupu dan burung menunjukkan bahwa keanekaragaman hayati di Pegunungan Kendeng masih terjaga.', ' Hamoni kekayaan keanekaragaman hayati di kawasan Pegunugan Kendeng sudah mulai rusak  dan hanya menyisakan aneka jenis burung.', ' Penelitian di desa kawasan Pegunungan Kendeng Pati Jawa Tengah telah berhasil mengidentifikasi tingkat kejernihan air di desa tersebut.', 'C', NULL, '', '', '', '', '', ''),
(4, 1, 4, ' (1) Salah satu penyebab terjadinya unjuk rasa karena ketidakpercayaan terhadap pelaksanaan berbagai aturan. (2)Para pengunjuk rasa tidak menemukan pelampiasan atas ketidakpastian yang dirasakannya. (3) Tekanan amarah yang tidak menemukan celah untuk keluar akhirnya menjadi amuk masa. (4) Hal-hal tersebut mengakibatkan berbagai unjuk rasa sering berujung pada anarkisme massa jika aspirasi mereka tidak tersalurkan. (5) Mereka ingin reaksi mereka diperhatikan. <br>Kalimat yang tidak menunjukkan hubungan sebab akibat adalah kalimat nomor .... ', 1, ' (1) &amp;amp; (3)', ' (2) &amp;amp; (3)', ' (3) &amp;amp; (4)', ' (2) &amp;amp; (5)', ' (1) &amp;amp; (5)', 'C', NULL, '', '', '', '', '', ''),
(5, 1, 5, ' Buah tomat merupakan buah yang sarat khasiat. Buah tomat dapat mencegah penyakit  kekurangan vitamin. Di samping itu juga mencegah kanker prostat,kanker usus besar, dan kanker paru-paru. Hasil penelitian menunjukkan tomat dapat mengobati gangguan pencernaan, diare, kolera, dan serangan empedu. Selain kaya manfaat, tomat juga lezat disantap. Bahkan sebagai sesuatu diracik menjadi makanan yang mampu membius para penikmatnya. Di Perancis tomat disebut apel cinta. Jika ingin sehat dan  bebas dari kanker cobalah rutin mengonsumsi &ldquo;Si apel cinta&rdquo;. <br>Ringkasan yang tepat dari bacaan tersebut di atas adalah&hellip; .', 1, ' Tomat adalah buah yang berkhasiat dan lezat untuk disantap.', ' Buah tomat atau apel cinta dapat mencegah penyakit kanker.', ' Buah tomat sarat khasiat, kaya manfaat bagi penderita penyakit.', ' Buah tomat selain mencegah dan mengobati berbagai penyakit, juga lezat', ' Buah tomat kaya vitamin, kaya manfaat, juga lezat sebagai bumbu masakan dan minuman.', 'D', NULL, '', '', '', '', '', ''),
(6, 1, 6, ' Sebagian produk industri dalam negeri khususnya barang kebutuhan sehari-hari kurang laku di pasaran. Sebagian masyarakat lebih menyukai produk dari luar negeri karena mereka beranggapan kualitasnya lebih baik. <br>Tanggapan yang logis terhadap pendapat tersebut di atas adalah&hellip; .', 1, ' Jumlah barang-barang yang dijual perlu dikurangi karena barang-barang tersebut tidak laku di pasaran dalam negeri.', ' Barang kebutuhan sehari-hari perlu diproduksi lebih banyak dengan kualitas lebih baik sehingga kita tidak perlu impor.', ' Pemerintah harus melakukan berbagai upaya untuk meningkatkan kapasitas produksi perusahaan dalam negeri.', ' Produksi dalam negeri harus dijual lebih murah karena dengan harga lebih murah, barang akan cepat laku.', ' Peran pemerintah untuk membantu meningkatkan kualitas dan mempromosikan produk dalam negeri sangat dinantikan.', 'E', NULL, '', '', '', '', '', ''),
(7, 1, 7, ' Bacalah teks berikut!<br>Maksud kalimat nomor (2) dalam teks tersebut adalah ...', 1, ' Guru merupakan faktor penentu berhasil tidaknya pelaksanaan kurikulum dan sistem penilaian.', ' Guru merupakan pelaksana kurikulum dan sistem penilaian dalam kegiatan pembelajaran.', ' Pelaksanaan kurikulum dan sistem penilaian di lapangan melibatkan guru.', ' Kerjasama antarguru dalam melaksanakan kurikulum dan sistem penilaian sangat diharapkan.', ' Kurikulum dan sistem penilaian merupakan program pemerintah yang harus dilaksanakan oleh guru.', 'D', NULL, '16632117591.png', '', '', '', '', ''),
(8, 1, 8, ' Cermati kalimat kompleks berikut!<br>Inti kalimat kompleks tersebut adalah &hellip;', 1, ' Soekarno dan Hatta memproklamasikan kemerdekaan Indonesia.', ' Soekarno dan Hatta memproklamasikan pada 17 Agustus 1945.', ' Soekarno dan Hatta setelah Jepang takluk memproklamasikan kemerdekaan.', ' Pada 17 Agustus 1945 Jepang takluk kepada sekutu.', ' Kemerdekaan Indonesia pada 17 Agustus 1945 setelah Jepang takluk.', 'E', NULL, '166321175912.png', '', '', '', '', ''),
(9, 1, 9, ' Bacalah kutipan cerpen Kecap Nomor Satu di Sekeliling Bayi karya Budi Dharma berikut dengan saksama! <br>&ldquo;Anak saya yang seudah jadi dokter  ada tiga. Satu yang tertua, jadi kepala rumah sakit di Medan. Dia sangat disenangi  oleh anak buahnya. Dua, jadi dokter militer di Semarang. Dia masih muda tapi pangkatnya sudah Mayor. Tiga, bertugas di Biak. Seandainya anak saya di sini, pasti bayi Pak Su ini sudah dapat ditolong anak saya nomor tiga. Anak saya itu terkenal pandai dan dermawan.&rdquo; <br>&ldquo;O, jadi putra Pak Danu jadi dokter di Biak? Kalau begitu pasti kenal dengan anak saya. Anak saya jadi Kepala Jawatan Imigrasi di sana. Dia terkenal. Setiap penduduk pasti kenal dia, anak saya yang otaknya cemerlang itu.&rdquo; Sahut Pak Kumis di pojok. <br>Lagi,banyak orang duduk di situ mengangguk-angguk. <br>Penggambaran tokoh pada kutipan cerpen tersebut dilakukan melalui&hellip;', 1, ' Gambaran fisik tokoh', ' Dialog antar tokoh', ' Dialog tokoh lain', ' Pemikiran tokoh', ' Perbuatan tokoh', 'B', NULL, '', '', '', '', '', ''),
(10, 1, 10, ' Bacalah kutipan cerpen Hadiah dari Rantau karya Ismet Fananyberikut! <br>Tapi bagi masyarakat Kotapanjang, semua minat akademik dan sosiopolitik itu tidak penting. Persetan dengan teori ini dan itu. Peduli amat dengan pendapat si anu perihal makna merantau. Bagi mereka, merantau punya arti penting: harga dan status anak muda yang baru pulang dari rantau melonjak di pasaran jodoh. Maka tidaklah mencengangkan bila sejak kepulangannya dari Amerika Serikat belum sebulan berselang, Samsir menjadi buah bibir warga desa. Setiap keluarga yang punya anak gadis yang sudah patut kawin  membicarakan kemungkinan doktor keluaran Harvard itu menjadi mantu mereka. <br>Nilai budaya yang terdapat pada kutipan cerpen tersebut adalah&hellip;', 1, ' Bersekolah di luar negeri', ' Tidak tertarik dengan minat akademis', ' Merantau untuk meningkatkan status sosial', ' Menjadikan seorang doktor menjadi menantu', ' Menjadi buah bibir sepuulang dari merantau', 'C', NULL, '', '', '', '', '', ''),
(11, 1, 11, ' Bacalah kutipan cerpen berikut!<br>Ringkasan yang sesuai dengan kutipan tersebut adalah ....', 1, ' Pesan ayah kepada anaknya agar membaca nasihatnya tentang perubahan dunia yang akan dialami anaknya.', ' Tulisan seorang ayah untuk anaknya agar mau membaca nasihatnya yang ditulis pada zaman yang berbeda.', ' Seorang ayah berpesan pada anaknya agar senantiasa mengingat nasihatnya karena dunia akan berubah.', ' Cinta seorang ayah kepada anaknya ditunjukkan dengan memberi nasihat kalau dunia anaknya itu akan berubah.', ' Nasihat ayah kepada anaknya ditulis saat anaknya belum bisa membaca dan kemungkinan perubahan dunia yang terjadi saat anak itu bisa membaca nasihatnya.', 'D', NULL, '166321175911.png', '', '', '', '', ''),
(12, 1, 12, '    Buntut <br>Lek Parto kaget. Buntut sepuluh ekor sapinya lenyap tanpa diketahui sebabnya. Darah mengucur dari pangkal-pangkal buntut di pantat sapi-sapi perahnya. Saking kagetnya, ember yang dia cangking untuk menampung susu sapi perahnya jatuh terguling ke tanah. Ia mengamati pantat demi pantat sapinya. Semuanya menunjukkan ytanda-tanda seperti baru saja dipotong buntutnya dengan pisau tajam. <br>&ldquo;Wong edan! Tega-teganya nyolong semua buntut sapiku,&rdquo; gumam Lek Parto sambil berjongkok di belakang pantat seekor sapi dan memelototi pangkal buntutnya. Ia kemudian memeriksa sekeliling kandang. Ia menemukan banyak tetesan darah di tanah. Jejak darah itu menuju pintu dapur rumahnya. &ldquo;Mbokne! Sini sebentar!&rdquo; Ia langsung memanggil istrinya. Ia langsung curiga, jangan-jangan istrinya yang hobi makan sop buntut itu yang menyikat semua buntut sapinya. <br>Tanpa ba bi bu, istrinya yang dikenal penurut, langsung datang. Di tangannya tergenggam sebilah pisau berlumur darah segar. Lek Parto langsung menghardiknya. <br>&ldquo;Mbokne! Kamu ini waras apa tidak, toh? Masak buntut sapi dipotongi semua!&rdquo; <br>&ldquo;Buntut sapi apa, Pakne?&rdquo; <br>&ldquo;Jangan pura-pura tidak tahu, Mbokne! Ini yang motong buntut-buntut sapiku kamu, toh? Kamu bikin sop buntut, ya?&rdquo; <br>Aspek budaya yang muncul pada cerpen Buntut karya Ahmadun Yossi Herfanda tersebut adalah&hellip;', 1, ' Budaya berternak', ' Budaya tolong menolong', ' Budaya Jawa', ' Budaya lokal', ' Budaya sosial', 'C', NULL, '', '', '', '', '', ''),
(13, 1, 13, ' Bacalah penggalan teks ulasan berikut! <br>Secara garis besar, Coca adalah film keluarga. Film itu membawa pesan yang begitu menyentuh, tentang sebuah ikatan keluarga yang kuat, nilai-nilai dalam tradisi, serta penghormatan pada budaya leluhur. <br>Kutipan teks ulasan film tersebut berisi tentang ...', 1, ' keunggulan film', ' kelemahan film', ' sinopsis', ' identitas film', ' tokoh dalam film', 'A', NULL, '', '', '', '', '', ''),
(14, 1, 14, ' Cermati teks eksposisi berikut! <br>Kalimat keempat kutipan cerpen tersebut bermajas ....', 1, ' klimaks', ' antiklimaks', ' hiperbola', ' asosiasi', ' personifikasi', 'D', NULL, '16632117599.png', '', '', '', '', ''),
(15, 1, 15, '  Bacalah kedua penggalan novel berikut!', 1, ' A', ' B', ' C', ' D', ' E', 'A', NULL, '16632117595.png', '', '', '', '', ''),
(16, 1, 16, ' Bacalah kutipan cerpen berikut! <br>(1) Ada kesempatan orang menoleh ke kanan kiri. (2) Yang berjalan kaki dan berhenti di dekat mobil, dan yang di dalam mobil pun memperoleh kesempatan untuk menengok ke kanan kiri. &ldquo;Lihat, ini aku, orang penting, naik sedan mengkilap, tidak seperti kamu berjalan kaki.&rdquo; (3) Orang yang di dalam andong melirik ke sebelah, kepada orang yang menuntun sepeda, dan yang bersepeda memandang kepada penumpang, becak yang disebelahnya ada perasaan ganjil yang tiba-tiba melintas kilat dalam hati mereka. (4) Laki-laki lain melirik kepada perempuan cantik yang  kebetulan terhenti di dekatnya. (5) Gadis itu kemalu-maluan dan lalu mengundurkan sepedanya, mencari kawannya yang terhenti di belakangnya. <br>(Palang Pintu Jalan Malioboro: Muhamad Dimyati). <br>Bukti watak salah satu tokoh yang sombong terdapat pada kalimat nomor ....', 1, '  (1)', '  (2)', ' (3)', ' (4)', ' (5)', 'B', NULL, '', '', '', '', '', ''),
(17, 1, 17, ' Cermati teks berikut! <br>Melalui pengasapan ikan dapat disimpan lebih lama dan rasanyapun masih enak. Sejak itulah cara pengawetan ikan dengan pengasapan panas berkembang. Praktik-praktik pengawatan perikanan dengan ikan sudah banyak dilakukan secara komersial terutama di daerah Sulawesi Utara, Ambon, Aceh, dan Jawa Timur..... padahal bila ikan asap ini dikembangkan, prospeknya akan menjadi lebih. <br>Kalimat yang tepat untuk melengkapi rumpang dalam teks di atas adalah &hellip;', 1, ' Tetapi produksi ikan asap belum terkenal', ' Produksi ikan asap belum banyak dikenal ', ' Tetapi ikan asap masih di jual di dalam wilayah', ' Masalahnya sekarang adalah konsumen di Indonesia belum semuanya mengenal ikan asap', ' Masalahnya produksi ikan asap belum berkembang', 'D', NULL, '', '', '', '', '', ''),
(18, 1, 18, '   Di dalam satu batang rokok terdapat kandungan berbagai racun yang dapat membahayakan tubuh manusia. Salah satu racun yang berbahaya adalah tar dan nikotin. Bagi perokok pemula, mereka akan mengalami gangguan batuk, mual, dan sedikit pening. Dalam kurun waktu tertentu, perokok berat bisa mengalami gangguan kesehatan yang cukup serius., antara lain penyempitan pembuluh darah, terkena penyakit kanker, dan lain-lain. Perokok pasif justru merupakan korban yang paling berbahaya karena mereka langsung menghirup asap rokok para perokok aktif. <br>Simpulan yang tepat untuk mengakhiri paragraf tersebut adalah..', 1, ' Jadi, tar dan nikotin merupakan racun yang membahayakan tubuh manusia.', ' Oleh karena itu, gangguan-gangguan yang diderita para perokok akibat racun tar sangat berbahaya.', ' Maka dari itu, perokok pasif lebih berbahaya karena langsung menghirup asap dari perokok aktif.', ' Dengan demikian, kandungan racun dalam rokok menyebabkan gangguan kesehatan bagi perokok aktif dan pasif.', ' Oleh sebab itu, perokok aktif dan pasif sama-sama berbahaya.', 'D', NULL, '', '', '', '', '', ''),
(19, 1, 19, '  Pahami Prosedur membatik berikut! <br>(1) Buatlah desain batik di atas kain mori <br>(2) Lukislah desain yang sudah dibuat dengan lilin, menggunakan canting <br>(3) Celuplah kain tersebut pada warna tertentu <br>(4) Setelah dicelupkan, kain tersebut dijemur dan dikeringkan <br>(5) Setelah kering, lakukan kembali proses pembatikan kedua, yaitu untuk menutup bagian yang akan tetap dipertahankan pada pewarnaan pertama. <br>(6)... <br>(7) Proses terakhir adalah mencuci kain batik dan diangin-anginkan hingga kering. <br>Kalimat yang tepat untuk melengkapi teks prosedur di atas adalah...', 1, ' Tunggulah kain batik hingga benar-benar kering dan tidak terlihat luntur', ' Celup kembali setelah proses pembatikan kedua hingga benar-benar menutup seluruh warna', ' Selanjutnya adalah nglorot yaitu kain yang telah berubah warna direbus untuk menghilangkan lapisan lilin', ' Setelah lapisan lilin hilang, kain batik siap digunakan ', ' Lakukan pengecekan apakah kain batik sudah berubah warna setelah pembatikan kedua', 'D', NULL, '', '', '', '', '', ''),
(20, 1, 20, ' (1) Di pinggir kali, tampak pula tumpukan sampah yang umumnya berupa kantong plastik  dan botol plastik bekas. <br>       (2) Kali kecil di depan rumah temanku terlihat sangat kotor. <br>       (3) Kotoran-kotoran itu terlihat menghambat lajunya air mengalir atau membuat air tergenang. <br>       (4) Warna airnya hitam pekat dan berminyak <br>Urutan yang tepat kalimat-kalimat di atas agar menjadi cerita yang padu adalah...', 1, ' 3-1-2-4', ' 2-4-1-3', ' 1-2-3-4', ' 4-1-2-3', ' 1-4-3-2', 'B', NULL, '', '', '', '', '', ''),
(21, 1, 21, ' Guncangan politik pada tahun ini diperkirakan tidak akan terlalu besar sehingga tidak akan mengganggu kondisi perekonomian secara umum. Di bawah ini kalimat yang semakna dengan kalimat tersebut adalah...', 1, ' Pada tahun ini goncangan politik diperkirakan tidak akan terlalu besar sehingga tidak akan mengganggu kondisi perekonomian secara umum.', ' Sehingga tidak akan mengganggu kondisi perekonomian secara umum pada tahun ini karena goncangan politik diperkirakan tidak akan terlalu besar', ' Perkiraan goncangan politik  pada tahun ini yang sangat besar menyebabkan kondisi perekonomian secara umum terganggu', ' Terganggunya kondisi perekonomian  secara umum disebabkan karena prediksi goncangan politik pada tahun ini tidak akan terlalu besar.', ' Diperkirakan pada tahun ini goncangan politik tidak akan terlalu besar sehingga akan mempengaruhi kondisi perekonomian  secara umum.', 'A', NULL, '', '', '', '', '', ''),
(22, 1, 22, ' Bacalah teks berikut!<br>Kata bentukan yang tepat untuk melengkapi teks tersebut adalah ....', 1, ' membentuk, pembentukan', ' dibentuk, membentuk', ' terbentuk, dibentuk', ' pembentukan, terbentuk', ' membentuk, dibentuk', 'C', NULL, '16632117592.png', '', '', '', '', ''),
(23, 1, 23, ' Bacalah kalimat berikut! <br>Kata yang tepat untuk melengkapi kalimat berikut adalah ....', 1, ' efektivitas', '  produktivitas', ' aktivitas', ' keefektifan', ' aktivis ', 'A', NULL, '166321175913.png', '', '', '', '', ''),
(24, 1, 24, ' Penjelasan yang tepat untuk jalur yang harus dilalui jika hendak ke bank adalah ....', 1, ' Dari rumah menyusuri Jalan Hasan Basri, melewati perempatan, lurus, di sebelah kanan jalan ada masjid', ' Dari rumah menyusuri Jalan Hasan Basri, ketika di perempatan belok kiri ke Jalan Suaka, di sebelah kiri jalan ada gereja', ' Dari rumah menyusuri Jalan Hasan Basri, lurus saja melewati perempatan dan pertigaan, mall terletak di sebelah kanan jalan', ' Dari rumah menyusuri Jalan Hasan belok kiri melewati jalan Ahmad Yani, menyeberang ke kanan.', ' Dari rumah menyusuri jalan Marga, ke Jalan Suaka, kemudian ke Hasan Basri, dan terakhir Jalan A. Yani', 'D', NULL, '166321175910.png', '', '', '', '', ''),
(25, 1, 25, ' Bacalah kutipan teks berikut ini! <br>Ilmu pengetahuan semakin melaju tanpa titik henti. Pusaran gelobalisasi juga memberikan tantangan kepada manusia untuk merespon segala perubahan secara cepat dan tepat. Perubahan akan selesai ketika paradigma berhenti. Bidang pendidikan yang berperan sebagai wadah sekaligus sebagai agen perubahan menjadi sebuah keniscayaan untuk terus mengembangkan dan memperkuat kekuatannya dalam menyokong kehidupan manusia. <br>Kata tidak baku dalam teks tersebuat adalah ....', 1, ' gelobalisasi, paradigma', ' gelobalisasi, wadah', ' gelobalisasi, merespon', ' gelobalisasi, tantangan', ' gelobalisasi, pusaran', 'C', NULL, '', '', '', '', '', ''),
(26, 1, 26, ' Bacalah kutipan teks berikut ini! <br>Bungkil kacang tanah adalah ampas dari kacang tanah yang telah diambil minyaknya dengan proses pemerasan mekanis atau proses ekstraksi. Dari kedua bahan substrat tersebut berupa limbah, kandungan gizinya masih cukup tinggi agar dapat dimanfaatkan oleh manusia. <br>Konjungsi antar kalimat yang tepat untuk mengganti kata bercetak miring dalam paragraf tersebut adalah ....', 1, ' sebab, karena', ' karena, sebab', ' walaupun, untuk', ' namun, sehingga', ' karena, supaya', 'C', NULL, '', '', '', '', '', ''),
(27, 1, 27, ' Bacalah kutipan teks berikut ini! <br>(1) Mengenakan alas kaki saat menapak tak lagi asal ada dan membebek pada model yang sedang digandrungi. (2) Roh dari sepasang sepatu atau sendal justru pada kenyamanan sehingga pemakai tak jemu untuk menapaki meski jauh. (3) Alas kaki pun menjadi kebutuhan untuk banyak berbagai aktivitas dari bangun tidur hingga tidur lagi. (4) Untuk itu, tanpa sepatu yang nyaman justru akan menimbulkan masalah. (5) Pegal atau sakit saat melangkah adalah salah satunya. <br>Kalimat tidak efektif dalam paragraf tersebut ditandai dengan nomor ....', 1, ' (1)', ' (2)', ' (3)', ' (4)', ' (5)', 'C', NULL, '', '', '', '', '', ''),
(28, 1, 28, ' Bacalah kutipan teks berikut ini! <br>Kalimat-kalimat berikut yang menggunakan istilah yang tepat adalah ....', 1, ' Masalah psikologi korban bencana perlu mendapat perhatian selain persoalan materi.', ' Saat terjadi bencana, masalah psikis menjadi bagian yang tidak bisa diabaikan.', ' Bencana alam dapat menimbulkan gangguan jiwa bagi para korban.', ' Mental seseorang dapat saja terganggu saat mereka jadi korban bencana alam.', ' Psikologi seorang korban bencana alam bergantung bagaimana menyikapinya.', 'B', NULL, '', '', '', '', '', ''),
(29, 1, 29, ' Semua anggota kelompok dalam kegiatan perkemahan itu segera membuat tabunan yang menandai berakhirnya seluruh acara. <br>Kata tabunan bersinonim dengan...', 1, ' Tenda', ' Dapur umum', ' Tempat sampah', ' Api unggun', ' Kesan pesan', 'D', NULL, '', '', '', '', '', ''),
(30, 1, 30, ' Bacalah kutipan teks berikut ini! <br>Kerasnya upaya kami dalam menjuangkan nasib para buruh akhirnya sedikit membuahkan hasil yang signifikan. <br>Agar kalimat di atas menjadi efektif, maka perbaikan yang dilakukan adalah ....', 1, ' Kerasnya, seharusnya sekerasnya', ' Menjuangkan, seharusnya memperjuangkan', ' Akhirnya, seharusnya akhiri', ' Sedikit, seharusnya sesidikit mungkin', ' Membuahkan, seharusnya membuahi', 'B', NULL, '', '', '', '', '', ''),
(31, 1, 31, ' Cermati langkah-langkah berikut!<br>Urutan langkah-langkah yang tepat membuat pupuk organik tersebut adalah ....', 1, ' (2), (5), (3), (1), (4)', ' (3), (4), (1), (2), (5)', ' (4), (5), (2), (3), (1)', ' (4), (1), (5), (2), (3)', ' (5), (3), (2), (1), (4)', 'E', NULL, '16632117597.png', '', '', '', '', ''),
(32, 1, 32, ' Cermati kalimat berikut ini ! <br>Dengan mengenyampingkan kekurangan tadi, sinema itu benar benar sebuah pertunjukkan yang sangat dibutuhkan oleh remaja di negeri ini. Sinema ini memberi motifasi, semangat, dan mimpi pada remaja yang patah semangat untuk berwirausaha. Selaian itu, sinema ini juga mengajarkan ketidakmungkinan yang dapat diwujudkan dengan kerja keras. <br>Pada kutipan teks di atas terdapat penggunaan kata yang salah, perbaikan penulisan kata yang tepat adalah&hellip;.', 1, ' mengenyampingkan dan memotivasi', ' mengesampingkan dan motivasi', ' mengsampingkan dan motipasi', ' menyampingkan dan motivasi', ' mengkesampingkan dan motivasi', 'B', NULL, '', '', '', '', '', ''),
(33, 1, 33, ' Bacalah paragraf berikut dengan cermat ! <br>(1) Atlet professional itu bertanding di Bangkok. (2) Dia berasal dari Ambon. (3) Dia anak Bupati. (4) Sejak kecil dia gemar makan pisang Ambon. (5) Banyak foto dirinya ketika di selat Bali diunggah di sosial media. <br>Kesalahan penggunaan ejaan terdapat pada kalimat&hellip;', 1, ' 1, 2 dan 3', ' 3,  4 dan 5', ' 1, 3, dan 5', ' 1, 2 dan 4', ' 2, 3 dan 4', 'B', NULL, '', '', '', '', '', ''),
(34, 1, 34, ' Cermati kalimat-kalimat berikut! <br>Agar kalimat-kalimat tersebut menjadi paragraf dedukatif, urutannya adalah &hellip;.', 1, '(3), (5), (1), (4), (2)', ' (3), (1), (2), (4), (5)', ' (5), (1), (3), (2), (4)', ' (5), (2), (4), (1), (3)', ' (4), (2), (3), (5), (1)', 'C', NULL, '16632117596.png', '', '', '', '', ''),
(35, 1, 35, ' Penggunaan tanda baca yang tepat  pada kalimat di bawah ini adalah&hellip;', 1, ' Masa berlaku SIM nya telah habis.', ' Fitri memerlukan peralatan kebersihan: sapu, alat pel dan kemoceng.', ' Joni membeli : buku, pensil, dan penghapus.', ' Debora, M,Pd. Mengikuti pelatihan di Batu.', ' Restu Mulya, ST. menjadi instruktur di sekolah kami.', 'B', NULL, '', '', '', '', '', ''),
(36, 1, 36, ' Penanganan masalah pendidikan diantaranya ditempuh dengan membangun SD kecil untuk melayani kebutuhan pendidikan di daerah terpencil yang dialkukan pada pelita V, di samping SD regular di wilayah-wilayah yang pada penduduknya. <br>Ejaan pada kalimat tersebut menjadi benar jika diperbaiki dengan cara&hellip;', 1, ' Menulis kata diantaranya menjadi di antaranya', ' Menulis kata pelita V menjadi pelita ke-V', ' Menulis kata pelita V menjadi PELITA V', ' Menulis kata di samping menjadi disamping', ' Menulis SD menjadi S.D.', 'A', NULL, '', '', '', '', '', ''),
(37, 1, 37, ' Dia memberitahukan, bahwa kami harus membawa tongkat, tali dan lampu <br>Penggunaan tanda baca dalam kalimat tersebut salah, benarnya adalah&hellip;', 1, ' Dia memberitahukan, bahwa kami harus membawa: tongkat, tali dan lampu.', ' Dia memberitahukan, bahwa kami harus membawa tongkat, tali, dan lampu', ' Dia memberitahukan bahwa kami harus membawa: tongkat, tali dan lampu', ' Dia memberitahukan, bahwa kami harus membawa tongkat, tali dan, lampu.', ' Dia memberitahukan bahwa kami harus membawa tongkat, tali, dan lampu.', 'E', NULL, '', '', '', '', '', ''),
(38, 1, 38, ' Dalam satu wilayah yang dihuni berbagai etnik, terjadi integrasi budaya sehingga menghasilkan budaya baru. <br>Makna istilah integrasi dalam kalimat tersebut adalah&hellip;.', 1, ' Percampuran', ' Penyatuan', ' Pembentukan', ' Pembauran', ' Penyesuaian', 'B', NULL, '', '', '', '', '', ''),
(39, 1, 39, ' Musim hujan yang terjadi tahun ini dapat dikatakan sangat parah. Banyak genangan air di kebun, perumahan, bahkan di jalan-jalan. Sementara, masyarakat masih sering membuang sampah di sembarang tempat. Tidak ada kesadaran warga untuk membersihkannya. Kondisi seperti ini sangat mendukung nyamuk DBD untuk berkembang biak. <br>Kalimat akibat untuk melengkapi paragraf tersebut adalah&hellip;', 1, ' tidak ada upaya warga untuk memberantas nyamuk DBD.', ' Banyak warga terserang nyamuk DBD.', ' Kebersihan lingkungan harus menjadi prioritas utama warga.', ' Setiap warga harus berhati-hati bila musim penghujan tiba.', ' Pada musim hujan banyak muncul nyamuk demam berdarah.', 'B', NULL, '', '', '', '', '', ''),
(40, 1, 40, ' Hujan deras yang menimpa India baru-baru ini mengakibatkan banjir besar. Jalan raya hancur dan rumah penduduk hanyut dibawa arus sungai. Kerugian sangat besar dan seorang penduduk menyatakan bahwa hujan dan banjir tersebut merupakan peristiwa terburuk sejak seratus tahun terakhir. <br>Tanggapan negatif terhadap isi teks tersebut adalah..', 1, ' Bencana tersebut harus mendapat perhatian serius dari pemerintah setempat', ' Penduduk India harus berbenah diri agar terhindar dari bencana banjir.', ' Terkadang bencana alam juga karena ulah manusia itu sendiri.', ' Pemerintah tidak perhatian terhadap nasib korban bencana alam.', ' Manusia harus menyadari mengapa sampai terjadi bencana besar seperti itu.', 'D', NULL, '', '', '', '', '', ''),
(41, 1, 41, ' Bacalah penggalan novel  berikut dengan saksama ! <br>Anda mendalami bidang kimia, sedangkan aku meneruskan mengambil kuliah di B-1 Sejarah. Aku tidak tahu apakah akan dapat terus mengikuti studi tersebut  sambil bekerja. Tapi, kupikir tidak ada jeleknya, apalagi aku memang menyukai sejarah. Di samping B-1 aku juga mulai kursus bahasa prancis. <br><i>Apa unsur ekstrinsik yang menonjol pada penggalan novel di tersebut? Jelaskan dengan bukti!</i>', 2, '', '', '', '', '', 'D', NULL, '', '', '', '', '', ''),
(42, 1, 42, '                    <b>Penerimaan</b><i>Chairil Anwar</i><br>Kalau kau mau kuterima kau kembali <br>dengan sepenuh hati<br>Aku masih tetap sendiri<br>Kutahu kau bukan yang dulu lagi<br>Bak kembang sari sudah terbagi<br>Jangantunduk<br>Tentang aku dengan berani<br>Kalau kau mau kuterima kau kembali<br> Untukku sendiri tapi<br>Sedang dengan cermin aku enggan berbagi<br><i>Tunjukkan majas perumpamaan (simile) dalam puisi tersebut? Jelaskan jawabanmu! </i>', 2, '', '', '', '', '', 'D', NULL, '', '', '', '', '', ''),
(43, 1, 43, ' Bacalah kutipan teks dialog berikut! <br>Lengkapilah kutipan teks dialog tersebut dengan kalimat pada bagian yang rumpang!<br>Gunakan kalimat, ejaan, dan tanda baca yang tepat!', 2, '', '', '', '', '', 'D', NULL, '16632117593.png', '', '', '', '', ''),
(44, 1, 44, ' Ketika berkunjung ke Indonesia, Presiden Amerika dikawal 100  prajurit. <br><i>Tentukan kata yang penulisaannya salah, kemudian betulkan!</i>', 2, '', '', '', '', '', 'D', NULL, '', '', '', '', '', ''),
(45, 1, 45, ' Banyak tayangan televisi mempertontonkan gaya hidup masyarakat kelas atas. Tayangan-tayangan tersebut dapat memengaruhi perubahan gaya hidup anak. Anak akan mencoba gaya hidup tersebut meskipun tidak sesuai dengan kemampuan keluarganya. Akibatnya, anak akan memeiliki obsesi tinggi terhadap isi tayangan tersebut. Contohnya, anak akan malu menggunakan benda-benda tidak bermerek terkenal. Jika orang tua tidak dapat memenuhi obsesi tersebut, anak cenderung menunjukkan sikap membangkang. <br>Tentukan ide pokok dalam paragraf tersebut, kemudian jelaskan!', 2, '', '', '', '', '', 'D', NULL, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id_token` int(11) NOT NULL,
  `token` varchar(6) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `masa_berlaku` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id_token`, `token`, `time`, `masa_berlaku`) VALUES
(1, 'UUFZTR', '2020-12-19 11:58:33', '00:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id_tugas` int(255) NOT NULL,
  `id_guru` int(255) NOT NULL DEFAULT 0,
  `kelas` text NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tugas` longtext NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE `ujian` (
  `id_ujian` int(5) NOT NULL,
  `kode_nama` varchar(255) DEFAULT '0',
  `id_pk` varchar(255) NOT NULL,
  `id_guru` int(5) NOT NULL,
  `id_mapel` int(5) NOT NULL,
  `kode_ujian` varchar(30) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jml_soal` int(5) NOT NULL,
  `jml_esai` int(5) NOT NULL,
  `bobot_pg` int(5) NOT NULL,
  `opsi` int(1) NOT NULL,
  `bobot_esai` int(5) NOT NULL,
  `tampil_pg` int(5) NOT NULL,
  `tampil_esai` int(5) NOT NULL,
  `lama_ujian` int(5) NOT NULL,
  `tgl_ujian` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `waktu_ujian` time DEFAULT NULL,
  `selesai_ujian` time DEFAULT NULL,
  `level` varchar(5) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `sesi` varchar(1) DEFAULT NULL,
  `acak` int(1) NOT NULL,
  `token` int(1) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `hasil` int(1) DEFAULT NULL,
  `kkm` varchar(128) DEFAULT NULL,
  `ulang` int(2) DEFAULT NULL,
  `soal_agama` varchar(50) DEFAULT NULL,
  `reset` int(1) DEFAULT NULL,
  `ulang_kkm` int(1) NOT NULL,
  `btn_selesai` int(11) NOT NULL,
  `pelanggaran` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `kode_nama`, `id_pk`, `id_guru`, `id_mapel`, `kode_ujian`, `nama`, `jml_soal`, `jml_esai`, `bobot_pg`, `opsi`, `bobot_esai`, `tampil_pg`, `tampil_esai`, `lama_ujian`, `tgl_ujian`, `tgl_selesai`, `waktu_ujian`, `selesai_ujian`, `level`, `kelas`, `sesi`, `acak`, `token`, `status`, `hasil`, `kkm`, `ulang`, `soal_agama`, `reset`, `ulang_kkm`, `btn_selesai`, `pelanggaran`) VALUES
(1, 'tess', 'a:1:{i:0;s:3:\"BDP\";}', 1, 1, 'PTS', 'tess', 20, 0, 100, 5, 0, 20, 0, 30, '2022-09-15 10:00:00', '2022-09-15 12:00:00', '10:00:00', NULL, 'X', 'a:1:{i:0;s:4:\"XBDP\";}', '1', 1, 0, 1, 1, '75', 0, '', 0, 0, 2, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `file_pendukung`
--
ALTER TABLE `file_pendukung`
  ADD PRIMARY KEY (`id_file`);

--
-- Indexes for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`id_jawaban`);

--
-- Indexes for table `jawaban_tugas`
--
ALTER TABLE `jawaban_tugas`
  ADD PRIMARY KEY (`id_jawaban`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`jurusan_id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`kode_level`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`kode_mapel`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id_materi`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `pengawas`
--
ALTER TABLE `pengawas`
  ADD PRIMARY KEY (`id_pengawas`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id_pengumuman`);

--
-- Indexes for table `pk`
--
ALTER TABLE `pk`
  ADD PRIMARY KEY (`id_pk`);

--
-- Indexes for table `referensi_jurusan`
--
ALTER TABLE `referensi_jurusan`
  ADD PRIMARY KEY (`jurusan_id`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`kode_ruang`);

--
-- Indexes for table `savsoft_options`
--
ALTER TABLE `savsoft_options`
  ADD PRIMARY KEY (`oid`);

--
-- Indexes for table `savsoft_qbank`
--
ALTER TABLE `savsoft_qbank`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`semester_id`);

--
-- Indexes for table `sesi`
--
ALTER TABLE `sesi`
  ADD PRIMARY KEY (`kode_sesi`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `sinkron`
--
ALTER TABLE `sinkron`
  ADD PRIMARY KEY (`nama_data`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id_token`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id_tugas`);

--
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id_ujian`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_pendukung`
--
ALTER TABLE `file_pendukung`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=370;

--
-- AUTO_INCREMENT for table `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `jawaban_tugas`
--
ALTER TABLE `jawaban_tugas`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id_materi` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pengawas`
--
ALTER TABLE `pengawas`
  MODIFY `id_pengawas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id_pengumuman` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `savsoft_options`
--
ALTER TABLE `savsoft_options`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `savsoft_qbank`
--
ALTER TABLE `savsoft_qbank`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id_tugas` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id_ujian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
