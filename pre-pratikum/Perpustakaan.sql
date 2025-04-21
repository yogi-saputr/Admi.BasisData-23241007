-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: perpustakaan
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `No_Admin` int(11) NOT NULL,
  `Karyawan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`No_Admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (101,'Dina Putri'),(102,'Rudi Hartono'),(103,'Maya Sari'),(104,'Tono Susilo'),(105,'Eka Pratama');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buku`
--

DROP TABLE IF EXISTS `buku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buku` (
  `ID_Buku` int(11) NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Kategori` varchar(100) DEFAULT NULL,
  `Jenis_buku` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Buku`),
  KEY `Kategori` (`Kategori`),
  KEY `Jenis_buku` (`Jenis_buku`),
  CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`Kategori`) REFERENCES `kategori` (`Kategori_Buku`),
  CONSTRAINT `buku_ibfk_2` FOREIGN KEY (`Jenis_buku`) REFERENCES `jenis_buku` (`Nama_jenis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buku`
--

LOCK TABLES `buku` WRITE;
/*!40000 ALTER TABLE `buku` DISABLE KEYS */;
INSERT INTO `buku` VALUES (1,'Laskar Pelangi','Fiksi','Novel'),(2,'Sejarah Dunia','Sejarah','Ensiklopedia'),(3,'Belajar MySQL','Teknologi','Panduan'),(4,'Dongeng Nusantara','Anak-anak','Cerita'),(5,'Psikologi Populer','Non-Fiksi','Referensi');
/*!40000 ALTER TABLE `buku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenis_buku`
--

DROP TABLE IF EXISTS `jenis_buku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jenis_buku` (
  `Nama_jenis` varchar(100) NOT NULL,
  PRIMARY KEY (`Nama_jenis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_buku`
--

LOCK TABLES `jenis_buku` WRITE;
/*!40000 ALTER TABLE `jenis_buku` DISABLE KEYS */;
INSERT INTO `jenis_buku` VALUES ('Cerita'),('Ensiklopedia'),('Novel'),('Panduan'),('Referensi');
/*!40000 ALTER TABLE `jenis_buku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karya_terdahulu`
--

DROP TABLE IF EXISTS `karya_terdahulu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `karya_terdahulu` (
  `Karya_Buku_Terdahulu` varchar(255) NOT NULL,
  PRIMARY KEY (`Karya_Buku_Terdahulu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karya_terdahulu`
--

LOCK TABLES `karya_terdahulu` WRITE;
/*!40000 ALTER TABLE `karya_terdahulu` DISABLE KEYS */;
INSERT INTO `karya_terdahulu` VALUES ('Belajar MySQL'),('Dongeng Nusantara'),('Laskar Pelangi'),('Psikologi Populer'),('Sejarah Dunia');
/*!40000 ALTER TABLE `karya_terdahulu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori` (
  `Kategori_Buku` varchar(100) NOT NULL,
  PRIMARY KEY (`Kategori_Buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES ('Anak-anak'),('Fiksi'),('Non-Fiksi'),('Sejarah'),('Teknologi');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kembali`
--

DROP TABLE IF EXISTS `kembali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kembali` (
  `ID_Buku` int(11) NOT NULL,
  `No_Pengunjung` int(11) NOT NULL,
  `Denda` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Buku`,`No_Pengunjung`),
  KEY `No_Pengunjung` (`No_Pengunjung`),
  CONSTRAINT `kembali_ibfk_1` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`),
  CONSTRAINT `kembali_ibfk_2` FOREIGN KEY (`No_Pengunjung`) REFERENCES `pengunjung` (`No_Pengunjung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kembali`
--

LOCK TABLES `kembali` WRITE;
/*!40000 ALTER TABLE `kembali` DISABLE KEYS */;
INSERT INTO `kembali` VALUES (1,201,0),(2,202,5000),(3,203,0),(4,204,10000),(5,205,0);
/*!40000 ALTER TABLE `kembali` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penerbit`
--

DROP TABLE IF EXISTS `penerbit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penerbit` (
  `ID_Penerbit` int(11) NOT NULL,
  `FNama` varchar(100) DEFAULT NULL,
  `MNama` varchar(100) DEFAULT NULL,
  `LNama` varchar(100) DEFAULT NULL,
  `Tahun_Terbit` int(11) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Informasi_Kontak` varchar(100) DEFAULT NULL,
  `ID_Buku` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Penerbit`),
  KEY `ID_Buku` (`ID_Buku`),
  CONSTRAINT `penerbit_ibfk_1` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerbit`
--

LOCK TABLES `penerbit` WRITE;
/*!40000 ALTER TABLE `penerbit` DISABLE KEYS */;
INSERT INTO `penerbit` VALUES (1,'PT','Bentang','Pustaka',2005,'Yogyakarta','0274561234',1),(2,'PT','Gramedia','Pustaka',1990,'Jakarta','0216789123',2),(3,'CV','Informatika','',2021,'Bandung','0223344455',3),(4,'PT','Elex','Media',1980,'Jakarta','0215566778',4),(5,'PT','Andi','Publisher',2010,'Yogyakarta','0274987654',5);
/*!40000 ALTER TABLE `penerbit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengunjung`
--

DROP TABLE IF EXISTS `pengunjung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengunjung` (
  `No_Pengunjung` int(11) NOT NULL,
  `FNama` varchar(100) DEFAULT NULL,
  `MNama` varchar(100) DEFAULT NULL,
  `LNama` varchar(100) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Umur` int(11) DEFAULT NULL,
  `No_Hp` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`No_Pengunjung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengunjung`
--

LOCK TABLES `pengunjung` WRITE;
/*!40000 ALTER TABLE `pengunjung` DISABLE KEYS */;
INSERT INTO `pengunjung` VALUES (201,'Sari','Dewi','Putri','Jl. Melati 10, Jakarta',25,'081234567890'),(202,'Budi','Santoso','','Jl. Mawar 5, Bandung',30,'082345678901'),(203,'Ani','Nur','Lestari','Jl. Kenanga 3, Surabaya',22,'083456789012'),(204,'Joko','','Widodo','Jl. Anggrek 7, Yogyakarta',28,'084567890123'),(205,'Rina','Marcelia','','Jl. Kamboja 2, Medan',27,'085678901234');
/*!40000 ALTER TABLE `pengunjung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penulis`
--

DROP TABLE IF EXISTS `penulis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penulis` (
  `ID_Penulis` int(11) NOT NULL,
  `FNama` varchar(100) DEFAULT NULL,
  `MNama` varchar(100) DEFAULT NULL,
  `LNama` varchar(100) DEFAULT NULL,
  `Biografi` text DEFAULT NULL,
  `Karya_Terdahulu` text DEFAULT NULL,
  `Kontak` varchar(100) DEFAULT NULL,
  `Riwayat_Pendidikan` text DEFAULT NULL,
  `ID_Buku` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Penulis`),
  KEY `ID_Buku` (`ID_Buku`),
  CONSTRAINT `penulis_ibfk_1` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penulis`
--

LOCK TABLES `penulis` WRITE;
/*!40000 ALTER TABLE `penulis` DISABLE KEYS */;
INSERT INTO `penulis` VALUES (1,'Andrea','','Hirata','Penulis asal Belitung','Laskar Pelangi','andrea@mail.com','UI',1),(2,'James','','Clear','Motivator dan penulis','Atomic Habits','james@mail.com','Harvard',2),(3,'Dian','','Purnomo','Dosen IT','Algoritma dan Pemrograman','dian@mail.com','ITS',3),(4,'Pramoedya','','Toer','Sastrawan legendaris','Bumi Manusia','pram@mail.com','Autodidak',4),(5,'Tim','','Sains','Peneliti','Fakta Unik Dunia','tim@mail.com','Umum',5);
/*!40000 ALTER TABLE `penulis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sewa`
--

DROP TABLE IF EXISTS `sewa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sewa` (
  `No_Pengunjung` int(11) NOT NULL,
  `ID_Buku` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `selama` varchar(50) DEFAULT NULL,
  `biaya` float DEFAULT NULL,
  PRIMARY KEY (`No_Pengunjung`,`ID_Buku`),
  KEY `ID_Buku` (`ID_Buku`),
  CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`No_Pengunjung`) REFERENCES `pengunjung` (`No_Pengunjung`),
  CONSTRAINT `sewa_ibfk_2` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sewa`
--

LOCK TABLES `sewa` WRITE;
/*!40000 ALTER TABLE `sewa` DISABLE KEYS */;
INSERT INTO `sewa` VALUES (201,1,1,'7 hari',5000),(202,2,2,'14 hari',12000),(203,3,1,'3 hari',3000),(204,4,1,'5 hari',8000),(205,5,3,'10 hari',20000);
/*!40000 ALTER TABLE `sewa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-21 15:41:52
