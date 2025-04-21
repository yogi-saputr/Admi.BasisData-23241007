-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: perpustakaan
-- ------------------------------------------------------
-- Server version	8.0.30

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
  `No_Admin` int NOT NULL,
  `Karyawan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`No_Admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buku`
--

DROP TABLE IF EXISTS `buku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buku` (
  `ID_Buku` int NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Kategori` varchar(100) DEFAULT NULL,
  `Jenis_buku` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Buku`),
  KEY `Kategori` (`Kategori`),
  KEY `Jenis_buku` (`Jenis_buku`),
  CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`Kategori`) REFERENCES `kategori` (`Kategori_Buku`),
  CONSTRAINT `buku_ibfk_2` FOREIGN KEY (`Jenis_buku`) REFERENCES `jenis_buku` (`Nama_jenis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buku`
--

LOCK TABLES `buku` WRITE;
/*!40000 ALTER TABLE `buku` DISABLE KEYS */;
INSERT INTO `buku` VALUES (1,'Laskar Pelangi','Fiksi','Novel'),(2,'Ensiklopedia Sains','Ilmiah','Ensiklopedia'),(3,'Komik Naruto','Komik','Cerita Bergambar'),(4,'Biografi Soekarno','Biografi','Jurnal'),(5,'Majalah Nasional','Non-Fiksi','Majalah');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_buku`
--

LOCK TABLES `jenis_buku` WRITE;
/*!40000 ALTER TABLE `jenis_buku` DISABLE KEYS */;
INSERT INTO `jenis_buku` VALUES ('Cerita Bergambar'),('Ensiklopedia'),('Jurnal'),('Majalah'),('Novel');
/*!40000 ALTER TABLE `jenis_buku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karya_terdahulu`
--

DROP TABLE IF EXISTS `karya_terdahulu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `karya_terdahulu` (
  `ID_Terdahulu` int DEFAULT NULL,
  `Karya_Buku_Terdahulu` varchar(255) NOT NULL,
  PRIMARY KEY (`Karya_Buku_Terdahulu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karya_terdahulu`
--

LOCK TABLES `karya_terdahulu` WRITE;
/*!40000 ALTER TABLE `karya_terdahulu` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES ('Biografi'),('Fiksi'),('Ilmiah'),('Komik'),('Non-Fiksi');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kembali`
--

DROP TABLE IF EXISTS `kembali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kembali` (
  `ID_Buku` int NOT NULL,
  `No_Pengunjung` int NOT NULL,
  `Denda` int DEFAULT NULL,
  PRIMARY KEY (`ID_Buku`,`No_Pengunjung`),
  KEY `No_Pengunjung` (`No_Pengunjung`),
  CONSTRAINT `kembali_ibfk_1` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`),
  CONSTRAINT `kembali_ibfk_2` FOREIGN KEY (`No_Pengunjung`) REFERENCES `pengunjung` (`No_Pengunjung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kembali`
--

LOCK TABLES `kembali` WRITE;
/*!40000 ALTER TABLE `kembali` DISABLE KEYS */;
/*!40000 ALTER TABLE `kembali` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penerbit`
--

DROP TABLE IF EXISTS `penerbit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penerbit` (
  `ID_Penerbit` int NOT NULL,
  `FNama` varchar(100) DEFAULT NULL,
  `MNama` varchar(100) DEFAULT NULL,
  `LNama` varchar(100) DEFAULT NULL,
  `Tahun_Terbit` int DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Informasi_Kontak` varchar(100) DEFAULT NULL,
  `ID_Buku` int DEFAULT NULL,
  PRIMARY KEY (`ID_Penerbit`),
  KEY `ID_Buku` (`ID_Buku`),
  CONSTRAINT `penerbit_ibfk_1` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerbit`
--

LOCK TABLES `penerbit` WRITE;
/*!40000 ALTER TABLE `penerbit` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerbit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengunjung`
--

DROP TABLE IF EXISTS `pengunjung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengunjung` (
  `No_Pengunjung` int NOT NULL,
  `FNama` varchar(100) DEFAULT NULL,
  `MNama` varchar(100) DEFAULT NULL,
  `LNama` varchar(100) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Umur` int DEFAULT NULL,
  `No_Hp` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`No_Pengunjung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengunjung`
--

LOCK TABLES `pengunjung` WRITE;
/*!40000 ALTER TABLE `pengunjung` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengunjung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penulis`
--

DROP TABLE IF EXISTS `penulis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penulis` (
  `ID_Penulis` int NOT NULL,
  `FNama` varchar(100) DEFAULT NULL,
  `MNama` varchar(100) DEFAULT NULL,
  `LNama` varchar(100) DEFAULT NULL,
  `Biografi` text,
  `Karya_Terdahulu` text,
  `Kontak` varchar(100) DEFAULT NULL,
  `Riwayat_Pendidikan` text,
  `ID_Buku` int DEFAULT NULL,
  PRIMARY KEY (`ID_Penulis`),
  KEY `ID_Buku` (`ID_Buku`),
  CONSTRAINT `penulis_ibfk_1` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penulis`
--

LOCK TABLES `penulis` WRITE;
/*!40000 ALTER TABLE `penulis` DISABLE KEYS */;
/*!40000 ALTER TABLE `penulis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sewa`
--

DROP TABLE IF EXISTS `sewa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sewa` (
  `No_Pengunjung` int NOT NULL,
  `ID_Buku` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `selama` varchar(50) DEFAULT NULL,
  `biaya` float DEFAULT NULL,
  `Id_admin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`No_Pengunjung`,`ID_Buku`),
  KEY `ID_Buku` (`ID_Buku`),
  CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`No_Pengunjung`) REFERENCES `pengunjung` (`No_Pengunjung`),
  CONSTRAINT `sewa_ibfk_2` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sewa`
--

LOCK TABLES `sewa` WRITE;
/*!40000 ALTER TABLE `sewa` DISABLE KEYS */;
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

-- Dump completed on 2025-04-21 16:29:43
