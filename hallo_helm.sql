/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.6-MariaDB : Database - helm_cuci_3
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`helm_cuci_3` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `helm_cuci_3`;

/*Table structure for table `jenis_karyawan` */

DROP TABLE IF EXISTS `jenis_karyawan`;

CREATE TABLE `jenis_karyawan` (
  `ID_JENIS_KARYAWAN` int(11) NOT NULL,
  `NAMA_JENIS_KARYAWAN` varchar(150) DEFAULT NULL,
  `TUGAS` varchar(500) DEFAULT NULL,
  `GAJI` decimal(10,0) DEFAULT NULL,
  `WAKTU_JENIS_KARYAWAN` datetime DEFAULT NULL COMMENT 'WAKTU DITUJUKAN KETIKA PEMBUATAN DATA DI TABEL JENIS_KARYAWAN',
  PRIMARY KEY (`ID_JENIS_KARYAWAN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jenis_karyawan` */

insert  into `jenis_karyawan`(`ID_JENIS_KARYAWAN`,`NAMA_JENIS_KARYAWAN`,`TUGAS`,`GAJI`,`WAKTU_JENIS_KARYAWAN`) values 
(1,'Kasir','Mengurus Transaks Penjualan ',2000000,'2019-12-09 12:28:27'),
(2,'Pencuci','Mengurus Kegiatan Cuci Helm',1500000,'2019-12-09 12:34:23'),
(3,'Pemasok','Memasok Barang dan Alat Untuk Jasa Pencucian Helm',1500000,'2019-12-09 12:36:02');

/*Table structure for table `ms_barang` */

DROP TABLE IF EXISTS `ms_barang`;

CREATE TABLE `ms_barang` (
  `ID_BARANG` int(11) NOT NULL,
  `ID_STOK` int(11) DEFAULT NULL,
  `NAMA_BARANG` varchar(150) DEFAULT NULL,
  `HARGA_BARANG` decimal(10,0) DEFAULT NULL,
  `JENIS_BARANG` int(11) DEFAULT NULL COMMENT '1 = BARANG DAN ALAT YANG BELI, 2 = JASA YANG DI JUAL/TAWARKAN',
  `KETERANGAN_BARANG` varchar(500) DEFAULT NULL,
  `WAKTU_BARANG` datetime DEFAULT NULL COMMENT 'WAKTU DITUJUKAN KETIKA PEMBUATAN DATA DI TABEL MS_BARANG',
  PRIMARY KEY (`ID_BARANG`),
  KEY `FK_TERSEDIA` (`ID_STOK`),
  CONSTRAINT `FK_TERSEDIA` FOREIGN KEY (`ID_STOK`) REFERENCES `stok` (`ID_STOK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ms_barang` */

insert  into `ms_barang`(`ID_BARANG`,`ID_STOK`,`NAMA_BARANG`,`HARGA_BARANG`,`JENIS_BARANG`,`KETERANGAN_BARANG`,`WAKTU_BARANG`) values 
(1,1,'Sampo',8000,1,'Digunakan Untuk Mencuci Helm','2019-07-10 12:24:30'),
(2,2,'Sikat Cuci',10000,1,'Sebagai Alat Untuk Mencuci Helm','2019-07-10 13:43:31'),
(3,3,'Sikat Semir',10000,1,'Sebagai Alat Untuk Menyemir Helm','2019-07-10 14:33:39'),
(4,4,'Pewangi',13000,1,'Digunakan Untuk Mengharumkan Helm','2019-07-10 14:40:02'),
(5,5,'Plastik Helm',15000,1,'Untuk Membungkus Helm Setelah Pross Cuci','2019-07-10 15:00:24'),
(6,6,'Pengering',50000,1,'Untuk Mengeringkan Helm Setelah Proses Pencucian','2019-07-10 15:05:35'),
(7,7,'Kain Lap Halus',20000,1,'Untuk Mengelap Helm Pada Bagian Yang Sensitif Seperti Kaca ','2019-07-10 15:20:23'),
(8,8,'Sikat Kecil',10000,1,'Untuk Menyikat Bagian Helm Yang Sulit Dijangkau','2019-07-10 15:30:30'),
(9,9,'Kanebo',25000,1,'Untuk Mengelap Helm Sebelum Memakai Lap Halus','2019-07-10 15:43:29'),
(10,10,'Pengkilat',35000,1,'Digunakan Untuk Membuat Helm Mengkilat','2019-07-10 16:02:04'),
(11,11,'Wadah Air',15000,1,'Digunakan Untuk Menampung Air ','2019-07-10 16:15:19'),
(12,12,'cuci helm fullface',20000,2,'Sebuah Jasa Pencucian','2019-07-10 17:43:31'),
(13,13,'cuci helm halface',15000,2,'Sebuah Jasa Pencucian','2019-07-10 17:50:27');

/*Table structure for table `ms_karyawan` */

DROP TABLE IF EXISTS `ms_karyawan`;

CREATE TABLE `ms_karyawan` (
  `ID_KARYAWAN` int(11) NOT NULL,
  `ID_JENIS_KARYAWAN` int(11) DEFAULT NULL,
  `NAMA_KARYAWAN` varchar(150) DEFAULT NULL,
  `JENIS_KELAMIN_KARYAWAN` varchar(50) DEFAULT NULL,
  `NOMOR_TELEPONE_KARYAWAN` varchar(20) DEFAULT NULL,
  `EMAIL_KARYAWAN` varchar(150) DEFAULT NULL,
  `ALAMAT_KARYAWAN` text DEFAULT NULL,
  `WAKTU_KARYAWAN` datetime DEFAULT NULL COMMENT 'WAKTU DITUJUKAN KETIKA PEMBUATAN DATA DI TABEL MS_KARYAWAN',
  PRIMARY KEY (`ID_KARYAWAN`),
  KEY `FK_MEMILIKI` (`ID_JENIS_KARYAWAN`),
  CONSTRAINT `FK_MEMILIKI` FOREIGN KEY (`ID_JENIS_KARYAWAN`) REFERENCES `jenis_karyawan` (`ID_JENIS_KARYAWAN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ms_karyawan` */

insert  into `ms_karyawan`(`ID_KARYAWAN`,`ID_JENIS_KARYAWAN`,`NAMA_KARYAWAN`,`JENIS_KELAMIN_KARYAWAN`,`NOMOR_TELEPONE_KARYAWAN`,`EMAIL_KARYAWAN`,`ALAMAT_KARYAWAN`,`WAKTU_KARYAWAN`) values 
(1,1,'Adi','Pria','087735367612','adi123@gmail.com','Jl Manggis','2019-12-09 12:40:51'),
(2,1,'Ana','Wanita','087654654323','ana123@gmail.com','Jl Mangga','2019-12-13 10:39:09'),
(3,3,'Bayu','Pria','089736242262','bayu123@gmail.com','Jl Salak','2019-11-07 09:40:44'),
(4,3,'Tami','Pria','087642626366','tami09@gmail.com','Jl Anggur','2019-11-07 13:42:06'),
(5,2,'Aji','Pria','086378836428','aji12@gmail.com','Jl Mawar','2019-12-02 08:42:36'),
(6,2,'Rudi','Pria','085362772762','rudirud@gmail.com','Jl Kamboja','2019-12-03 10:44:33'),
(7,2,'Dono','Pria','087526171725','donono@gmail.com','Jl Melati','2019-12-20 14:48:33'),
(8,2,'Jepri','Pria','081235261782','jepriiiii@gmail.com','Jl Damai','2019-12-25 11:49:14'),
(9,2,'Budi','Pria','087367123881','budbud@gmail.com','Jl Bawang','2020-01-05 09:20:42'),
(10,2,'Wahyu','Pria','087271818283','yuyuwah@gmail.com','Jl Cabai','2020-01-05 12:50:13');

/*Table structure for table `ms_supplier` */

DROP TABLE IF EXISTS `ms_supplier`;

CREATE TABLE `ms_supplier` (
  `ID_SUPPLIER` int(11) NOT NULL,
  `NAMA_SUPPLIER` varchar(150) DEFAULT NULL,
  `NO_HP_SUPPLIER` varchar(20) DEFAULT NULL,
  `CONTACT_SUPPLIER` varchar(50) DEFAULT NULL,
  `EMAIL_SUPPLIER` varchar(150) DEFAULT NULL,
  `WAKTU_SUPPLIER` datetime DEFAULT NULL COMMENT 'WAKTU DITUJUKAN KETIKA PEMBUATAN DATA DI TABEL MS_SUPPLIER',
  PRIMARY KEY (`ID_SUPPLIER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ms_supplier` */

insert  into `ms_supplier`(`ID_SUPPLIER`,`NAMA_SUPPLIER`,`NO_HP_SUPPLIER`,`CONTACT_SUPPLIER`,`EMAIL_SUPPLIER`,`WAKTU_SUPPLIER`) values 
(1,'David Satria','087635161725','021763728','davidtria@gmail.com','2019-10-19 13:41:19'),
(2,'Chris Antoni','082163526727','021563277','christoni123@gmail.com','2019-10-22 10:42:31'),
(3,'Jhonathan','083936273754','021345678','jhonjhon@gmail.com','2019-10-22 17:55:44'),
(4,'Melly','087362322419','021344674','melmelly@gmail.com','2019-11-01 14:16:01'),
(5,'Bella Nasution','087837534393','021365485','bellanasution@gmail.com','2019-11-01 10:08:42'),
(6,'Christian Park','089753245415','021211341','parkchristian@gmail.com','2019-11-01 09:00:59'),
(7,'Justin Seagul','085624326145','021979795','jseagul@gmail.com','2019-11-01 14:54:36'),
(8,'Jeonguk','087435416246','021345678','jeon97@gmail.com','2019-11-01 17:00:09'),
(9,'Kim Yontan','083562754163','021463738','kimyontan@gmail.com','2019-11-01 08:59:39'),
(10,'Budi Setya','089373534426','021789003','setyabudi@gmail.com','2019-11-01 13:00:09'),
(11,'Nugraha','087653748783','021636478','nugraha@gmail.com','2019-11-01 14:03:55');

/*Table structure for table `stok` */

DROP TABLE IF EXISTS `stok`;

CREATE TABLE `stok` (
  `ID_STOK` int(11) NOT NULL,
  `JUMLAH` int(11) DEFAULT NULL,
  `WAKTU_STOK` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_STOK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stok` */

insert  into `stok`(`ID_STOK`,`JUMLAH`,`WAKTU_STOK`) values 
(1,100,'2019-11-10 15:00:00'),
(2,10,'2019-11-09 17:00:46'),
(3,7,'2019-11-19 10:30:47'),
(4,100,'2019-11-10 13:30:27'),
(5,3,'2019-12-10 08:02:49'),
(6,13,'2019-11-30 09:10:11'),
(7,6,'2020-11-29 10:00:51'),
(8,29,'2019-11-12 11:00:02'),
(9,25,'2019-11-12 11:20:13'),
(10,50,'2019-11-09 08:28:54'),
(11,10,'2019-11-09 09:37:17'),
(12,NULL,'2020-01-07 17:02:56'),
(13,NULL,'2020-01-07 17:02:57');

/*Table structure for table `tr_order_beli` */

DROP TABLE IF EXISTS `tr_order_beli`;

CREATE TABLE `tr_order_beli` (
  `ID_ORDER_BELI` int(11) NOT NULL,
  `ID_SUPPLIER` int(11) DEFAULT NULL,
  `ID_KARYAWAN` int(11) DEFAULT NULL,
  `ID_STOK` int(11) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `JUMLAH` int(11) DEFAULT NULL,
  `WAKTU_TR_ORDER_BELI` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_ORDER_BELI`),
  KEY `FK_TRANSAKSI BELI` (`ID_KARYAWAN`),
  KEY `FK_MENYUPLAI` (`ID_SUPPLIER`),
  KEY `FK_TERSUPLAI` (`ID_STOK`),
  CONSTRAINT `FK_MENYUPLAI` FOREIGN KEY (`ID_SUPPLIER`) REFERENCES `ms_supplier` (`ID_SUPPLIER`),
  CONSTRAINT `FK_TERSUPLAI` FOREIGN KEY (`ID_STOK`) REFERENCES `stok` (`ID_STOK`),
  CONSTRAINT `FK_TRANSAKSI BELI` FOREIGN KEY (`ID_KARYAWAN`) REFERENCES `ms_karyawan` (`ID_KARYAWAN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tr_order_beli` */

insert  into `tr_order_beli`(`ID_ORDER_BELI`,`ID_SUPPLIER`,`ID_KARYAWAN`,`ID_STOK`,`keterangan`,`JUMLAH`,`WAKTU_TR_ORDER_BELI`) values 
(1,11,3,11,'beli wadah air',10,'2019-11-08 16:45:18'),
(2,10,3,10,'beli pengkilat',50,'2019-11-08 17:05:24'),
(3,8,3,8,'beli sikat kecil',10,'2019-11-08 16:48:29'),
(4,2,3,2,'beli sikat cuci',10,'2019-11-09 16:49:21'),
(5,6,4,6,'beli pengering',10,'2019-11-09 17:11:07'),
(6,8,4,8,'beli sikat kecil',10,'2019-11-09 17:13:46'),
(7,8,4,8,'beli sikat kecil',5,'2019-11-09 17:14:37'),
(8,9,3,9,'beli kanebo',15,'2019-11-10 11:18:02'),
(9,9,3,9,'beli kanebo',3,'2019-11-10 12:18:04'),
(10,1,3,1,'beli shampo',100,'2019-11-10 14:20:03'),
(11,4,4,4,'beli pewangi',100,'2019-11-10 13:10:15'),
(12,7,4,7,'beli kain lap halus',5,'2019-11-10 15:54:06'),
(13,5,3,5,'beli plastik helm',3,'2019-11-10 18:54:34'),
(14,6,3,6,'beli pengering',2,'2019-11-12 08:54:36'),
(15,8,4,8,'beli sikat kecil',4,'2019-11-12 10:54:37'),
(16,9,3,9,'beli kanebo',6,'2019-11-12 16:54:38'),
(17,3,3,3,'beli sikat semir',7,'2019-11-14 09:54:39'),
(18,9,4,9,'beli kanebo',1,'2019-11-25 18:54:40'),
(19,6,4,6,'beli pengering',1,'2019-11-27 17:54:41'),
(20,7,3,7,'beli kain lap halus',1,'2019-11-29 09:54:42'),
(21,3,3,3,'beli sikat semir',1,'2019-12-06 10:54:43'),
(22,10,3,10,'beli pengkilat',100,'2019-12-07 11:54:44'),
(23,4,3,4,'beli pewangi',100,'2019-12-08 13:54:45'),
(24,1,4,1,'beli shampo',100,'2019-12-08 15:02:57'),
(25,4,3,4,'beli pewangi',100,'2019-12-09 10:03:45'),
(26,8,3,8,'beli sikat kecil',1,'2019-12-10 10:04:26'),
(27,7,3,7,'beli kain lap halus',1,'2019-12-10 11:05:03'),
(28,2,3,2,'beli sikat cuci',1,'2019-12-13 12:05:44'),
(29,3,3,3,'beli sikat semir',2,'2019-12-15 13:06:28'),
(30,6,4,6,'beli pengering',3,'2019-12-15 13:19:06'),
(31,3,3,3,'beli sikat semir',1,'2019-12-20 10:08:02'),
(32,9,3,9,'beli kanebo',1,'2019-12-20 13:08:38'),
(33,5,4,5,'beli plastik helm',4,'2019-12-21 11:09:26'),
(34,2,4,2,'beli sikat cuci',1,'2019-12-21 10:10:04'),
(35,10,4,10,'beli pengkilat',100,'2019-12-25 10:10:58'),
(36,11,4,11,'beli wadah air',3,'2019-12-26 12:11:35'),
(37,9,3,9,'beli kanebo',1,'2019-12-29 16:12:09'),
(38,7,3,7,'beli kain lap halus',1,'2019-12-29 14:12:52'),
(39,9,3,9,'beli kanebo',3,'2019-12-29 14:20:54'),
(40,8,3,8,'beli sikat kecil',1,'2019-12-30 16:14:39'),
(41,7,4,7,'beli kain lap halus',3,'2019-01-07 12:16:43'),
(42,4,4,4,'beli pewangi',20,'2020-01-07 12:20:51'),
(43,5,3,5,'beli plastik helm',7,'2020-01-08 11:20:59'),
(44,6,4,6,'beli pengering',4,'2020-01-09 14:22:08'),
(45,5,4,5,'beli plastik helm',10,'2020-01-10 10:22:52'),
(46,4,3,4,'beli pewangi',15,'2020-01-13 13:23:49'),
(47,7,3,7,'beli kain lap halus',20,'2020-01-20 10:24:29'),
(48,5,3,5,'beli plastik helm',100,'2020-01-21 11:27:04'),
(49,2,3,2,'beli sikat cuci',50,'2020-01-21 15:57:47'),
(50,10,3,10,'beli pengkilat',50,'2020-01-26 10:30:37'),
(51,9,4,9,'beli kanebo',50,'2020-01-27 08:22:25'),
(52,11,3,11,'beli wadah air',8,'2020-01-27 13:10:19'),
(53,8,3,8,'beli sikat kecil',5,'2020-01-28 09:33:05'),
(54,1,4,1,'beli shampo',500,'2020-01-28 10:49:29'),
(55,2,4,2,'beli sikat cuci',20,'2020-01-29 10:35:07'),
(56,3,4,3,'beli sikat semir',15,'2020-01-29 14:28:19'),
(57,4,3,4,'beli pewangi',100,'2020-01-30 09:37:05'),
(58,5,4,5,'beli plastik helm',500,'2020-01-30 14:20:01'),
(59,7,4,7,'beli kain lap halus',80,'2020-01-31 10:45:52'),
(60,10,3,10,'beli pengkilat',80,'2020-01-31 15:39:48');

/*Table structure for table `tr_order_beli_dt` */

DROP TABLE IF EXISTS `tr_order_beli_dt`;

CREATE TABLE `tr_order_beli_dt` (
  `ID_ORDER_BELI_DETAIL` int(11) NOT NULL,
  `ID_ORDER_BELI` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  PRIMARY KEY (`ID_ORDER_BELI`,`ID_BARANG`,`ID_ORDER_BELI_DETAIL`),
  KEY `FK_MEMBELI_BARANG` (`ID_BARANG`),
  CONSTRAINT `FK_MEMBELI_BARANG` FOREIGN KEY (`ID_BARANG`) REFERENCES `ms_barang` (`ID_BARANG`),
  CONSTRAINT `FK_PEMBELIAN_DETAIL` FOREIGN KEY (`ID_ORDER_BELI`) REFERENCES `tr_order_beli` (`ID_ORDER_BELI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tr_order_beli_dt` */

insert  into `tr_order_beli_dt`(`ID_ORDER_BELI_DETAIL`,`ID_ORDER_BELI`,`ID_BARANG`) values 
(1,1,11),
(2,2,10),
(3,3,8),
(4,4,2),
(5,5,6),
(6,6,8),
(7,7,8),
(8,8,9),
(9,9,9),
(10,10,1),
(11,11,4),
(12,12,7),
(13,13,5),
(14,14,6),
(15,15,8),
(16,16,9),
(17,17,3),
(18,18,9),
(19,19,6),
(20,20,7),
(21,21,3),
(22,22,10),
(23,23,4),
(24,24,1),
(25,25,4),
(26,26,8),
(27,27,7),
(28,28,2),
(29,29,3),
(30,30,6),
(31,31,3),
(32,32,9),
(33,33,5),
(34,34,2),
(35,35,10),
(36,36,11),
(37,37,9),
(38,38,7),
(39,39,9),
(40,40,8),
(41,41,7),
(42,42,4),
(43,43,5),
(44,44,6),
(45,45,5),
(46,46,4),
(47,47,7),
(48,48,5),
(49,49,2),
(50,50,10),
(51,51,9),
(52,52,11),
(53,53,8),
(54,54,1),
(55,55,2),
(56,56,3),
(57,57,4),
(58,58,5),
(59,59,7),
(60,60,10);

/*Table structure for table `tr_order_jual` */

DROP TABLE IF EXISTS `tr_order_jual`;

CREATE TABLE `tr_order_jual` (
  `ID_ORDER_JUAL` int(11) NOT NULL,
  `ID_KARYAWAN` int(11) DEFAULT NULL,
  `ID_STOK` int(11) DEFAULT NULL,
  `Keterangan` varchar(50) DEFAULT NULL,
  `JUMLAH_JUAL` int(11) DEFAULT NULL,
  `WAKTU_TR_ORDER_JUAL` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_ORDER_JUAL`),
  KEY `FK_MENGAMBIL` (`ID_STOK`),
  KEY `FK_DILAKUKAN` (`ID_KARYAWAN`),
  CONSTRAINT `FK_DILAKUKAN` FOREIGN KEY (`ID_KARYAWAN`) REFERENCES `ms_karyawan` (`ID_KARYAWAN`),
  CONSTRAINT `FK_MENGAMBIL` FOREIGN KEY (`ID_STOK`) REFERENCES `stok` (`ID_STOK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tr_order_jual` */

insert  into `tr_order_jual`(`ID_ORDER_JUAL`,`ID_KARYAWAN`,`ID_STOK`,`Keterangan`,`JUMLAH_JUAL`,`WAKTU_TR_ORDER_JUAL`) values 
(1,8,13,'cuci helm half-face',1,'2019-12-10 11:03:24'),
(2,9,12,'cuci helm-full-face',1,'2019-12-10 14:10:55'),
(3,5,12,'cuci helm full-face',2,'2019-12-10 17:01:09'),
(4,6,12,'cuci helm full-face',2,'2019-12-11 09:10:34'),
(5,8,13,'cuci helm half-face',1,'2019-12-12 11:06:19'),
(6,9,13,'cuci helm half-face',1,'2019-12-12 13:08:29'),
(7,5,12,'cuci helm full-face',2,'2019-12-12 16:27:16'),
(8,5,12,'cuci elm full-face',2,'2019-12-14 10:30:37'),
(9,9,13,'cuci helm half-face',2,'2019-12-16 12:45:29'),
(10,2,13,'cuci helm half-face',1,'2019-12-16 15:55:20'),
(11,4,13,'cuci helm half-face',1,'2019-12-17 10:00:45'),
(12,9,12,'cuci helm full-face',1,'2019-12-17 10:45:23'),
(13,10,13,'cuci helm half-face',1,'2019-12-18 11:37:45'),
(14,6,13,'cuci helm half-face',1,'2019-12-18 11:56:36'),
(15,7,12,'cuci helm full-face',1,'2019-12-18 14:56:48'),
(16,9,12,'cuci helm full-face',1,'2019-12-18 15:38:27'),
(17,5,12,'cuci helm full-face',1,'2019-12-19 09:45:36'),
(18,6,12,'cuci helm full face',1,'2019-12-19 10:15:09'),
(19,5,13,'cuci helm half-face',1,'2019-12-19 10:30:28'),
(20,9,13,'cuci helm half-face',1,'2019-12-20 10:49:30'),
(21,5,12,'cuci helm full-face',1,'2020-01-01 09:50:11'),
(22,8,12,'cuci helm full-face',1,'2020-01-01 10:10:10'),
(23,7,13,'cuci helm half-face',1,'2020-01-01 12:11:44'),
(24,8,13,'cuci helm half-face',1,'2020-01-01 13:57:18'),
(25,9,12,'cuci helm full-face',1,'2020-01-02 10:08:34'),
(26,5,12,'cuci helm full-face',1,'2020-01-02 10:30:21'),
(27,6,12,'cuci helm full-face',1,'2020-01-02 11:02:23'),
(28,7,13,'cuci helm half-face',1,'2020-01-04 09:23:37'),
(29,9,13,'cuci helm half-face',1,'2020-01-04 09:40:24'),
(30,7,13,'cuci helm half-face',1,'2020-01-04 11:25:32'),
(31,8,13,'cuci helm half-face',1,'2020-01-07 10:29:38'),
(32,5,12,'cuci helm full-face',1,'2020-01-08 12:30:45'),
(33,6,12,'cuci helm full-face',1,'2020-01-08 13:59:48'),
(34,8,12,'cuci helm fulll-face',1,'2020-01-09 10:29:29'),
(35,9,13,'cuci helm half-face',1,'2020-01-11 11:20:58'),
(36,7,13,'cuci helm half-face',1,'2020-01-11 12:49:57'),
(37,8,13,'cuci helm half-face',1,'2020-01-12 13:20:18'),
(38,9,13,'cuci helm half-face',1,'2020-01-12 13:25:44'),
(39,10,13,'cuci helm half-face',2,'2020-01-12 14:27:33'),
(40,10,12,'cuci helm full-face',2,'2020-01-13 11:34:57'),
(41,5,12,'cuci helm full-face',2,'2020-02-01 10:27:34'),
(42,8,12,'cuci helm full-face',3,'2020-02-02 13:06:10'),
(43,9,13,'cuci helm half-face',1,'2020-02-02 13:58:30'),
(44,10,12,'cuci helm full-face',1,'2020-02-03 10:27:23'),
(45,10,12,'cuci helm full-face',1,'2020-02-03 11:10:23'),
(46,9,12,'cuci helm full-face',1,'2020-02-03 12:00:12'),
(47,7,12,'cui helm full-face',1,'2020-02-04 10:33:22'),
(48,9,13,'cuci helm half-face',2,'2020-02-04 11:08:37'),
(49,10,13,'cuci helm half-face',2,'2020-02-04 13:02:19'),
(50,10,12,'cuci helm full-face',1,'2020-02-08 10:09:28'),
(51,9,12,'cuci helm full-face',1,'2020-02-08 15:11:46'),
(52,6,13,'cuci helm half-face',1,'2020-02-08 16:27:34'),
(53,7,12,'cuci helm full-face',1,'2020-02-10 10:29:37'),
(54,9,12,'cuci helm full-face',1,'2020-02-11 10:12:40'),
(55,10,12,'cuci helm full-face',1,'2020-02-13 11:23:01'),
(56,5,13,'cuci helm half-face',1,'2020-02-13 13:45:58'),
(57,10,12,'cuci helm full-face',1,'2020-02-09 10:28:28'),
(58,6,12,'cuci helm full-face',1,'2020-02-13 15:26:17'),
(59,8,13,'cuci helm half-face',1,'2020-02-18 10:28:36'),
(60,10,12,'cuci helm full-face',1,'2020-02-18 12:38:14');

/*Table structure for table `tr_order_jual_dt` */

DROP TABLE IF EXISTS `tr_order_jual_dt`;

CREATE TABLE `tr_order_jual_dt` (
  `ID_ORDER_JUAL_DETAIL` int(11) NOT NULL,
  `ID_ORDER_JUAL` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  PRIMARY KEY (`ID_BARANG`,`ID_ORDER_JUAL`,`ID_ORDER_JUAL_DETAIL`),
  KEY `FK_PENJUALAN_DETAIL` (`ID_ORDER_JUAL`),
  CONSTRAINT `FK_MENGGUNAKAN` FOREIGN KEY (`ID_BARANG`) REFERENCES `ms_barang` (`ID_BARANG`),
  CONSTRAINT `FK_PENJUALAN_DETAIL` FOREIGN KEY (`ID_ORDER_JUAL`) REFERENCES `tr_order_jual` (`ID_ORDER_JUAL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tr_order_jual_dt` */

insert  into `tr_order_jual_dt`(`ID_ORDER_JUAL_DETAIL`,`ID_ORDER_JUAL`,`ID_BARANG`) values 
(2,2,12),
(3,3,12),
(4,4,12),
(7,7,12),
(8,8,12),
(12,12,12),
(15,15,12),
(16,16,12),
(17,17,12),
(18,18,12),
(21,21,12),
(22,22,12),
(25,25,12),
(26,26,12),
(27,27,12),
(32,32,12),
(33,33,12),
(34,34,12),
(40,40,12),
(41,41,12),
(42,42,12),
(44,44,12),
(45,45,12),
(46,46,12),
(47,47,12),
(50,50,12),
(51,51,12),
(53,53,12),
(54,54,12),
(55,55,12),
(57,57,12),
(58,58,12),
(1,1,13),
(5,5,13),
(6,6,13),
(9,9,13),
(10,10,13),
(11,11,13),
(13,13,13),
(14,14,13),
(19,19,13),
(20,20,13),
(23,23,13),
(24,24,13),
(28,28,13),
(29,29,13),
(30,30,13),
(31,31,13),
(35,35,13),
(36,36,13),
(37,37,13),
(38,38,13),
(39,39,13),
(43,43,13),
(48,48,13),
(49,49,13),
(52,52,13),
(56,56,13),
(59,59,13);

/* Trigger structure for table `tr_order_beli` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `penambahan_stok` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `penambahan_stok` AFTER INSERT ON `tr_order_beli` FOR EACH ROW UPDATE stok
SET Stok.jumlah = Stok.jumlah + new.JUMLAH
WHERE stok.ID_STOK = new.ID_STOK */$$


DELIMITER ;

/* Trigger structure for table `tr_order_jual` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `pengurangan_stok` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `pengurangan_stok` AFTER INSERT ON `tr_order_jual` FOR EACH ROW UPDATE stok
SET Stok.jumlah = Stok.jumlah + NEW.JUMLAH_JUAL
WHERE stok.ID_STOK = new.ID_STOK */$$


DELIMITER ;

/* Procedure structure for procedure `selectTransaksi_pembelian` */

/*!50003 DROP PROCEDURE IF EXISTS  `selectTransaksi_pembelian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `selectTransaksi_pembelian`(
    IN mulaitanggal DATETIME,
    IN sampaitanggal DATETIME
)
BEGIN
    SELECT * 
     FROM tr_order_beli
    WHERE CRETIME_ORDER_BELI >= mulaitanggal
    AND CRETIME_ORDER_BELI <= sampaitanggal;
END */$$
DELIMITER ;

/* Procedure structure for procedure `select_stok` */

/*!50003 DROP PROCEDURE IF EXISTS  `select_stok` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `select_stok`(
	IN search_stok VARCHAR(100)
)
BEGIN
	SELECT * FROM tr_order_jual
	WHERE ID_STOK LIKE CONCAT('%',search_stok,'%');
END */$$
DELIMITER ;

/* Procedure structure for procedure `TR_BYTANGGAL` */

/*!50003 DROP PROCEDURE IF EXISTS  `TR_BYTANGGAL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `TR_BYTANGGAL`(
TGL_AWAL DATETIME, TGL_AKHIR DATETIME
)
BEGIN
SELECT * FROM TR_ORDER_JUAL WHERE CRETIME_ORDER_JUAL BETWEEN TGL_AWAL AND TGL_AKHIR;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
