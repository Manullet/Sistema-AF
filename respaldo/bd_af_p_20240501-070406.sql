-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bd_af_p
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bitacoras`
--

DROP TABLE IF EXISTS `bitacoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitacoras` (
  `id_bitacora` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `ejecutor` varchar(30) NOT NULL,
  `actividad_realizada` varchar(50) NOT NULL,
  `informacion_actual` varchar(300) DEFAULT NULL,
  `informacion_anterior` varchar(300) DEFAULT NULL,
  `tabla` text DEFAULT NULL,
  `informacion_eliminada` text DEFAULT NULL,
  PRIMARY KEY (`id_bitacora`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacoras`
--

LOCK TABLES `bitacoras` WRITE;
/*!40000 ALTER TABLE `bitacoras` DISABLE KEYS */;
INSERT INTO `bitacoras` VALUES (1,'2024-04-16 03:53:32','root@localhost','Se insertó','Información actual = id_ficha: 3, fecha_solicitud: 2024-04-09, anio_solicitud: 2024, descripcion: prueba2 , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez',NULL,'fichas',NULL),(2,'2024-04-16 03:57:49','root@localhost','Se insertó','Información actual = id_ficha: 4, fecha_solicitud: 2024-04-09, anio_solicitud: 2024, descripcion: prueba2 , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez',NULL,'fichas',NULL),(3,'2024-04-16 03:58:38','root@localhost','Se actualizó','Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-09, anio_solicitud: 0, descripcion: prueba2 , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez','Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-09 anio_solicitud: 2024, descripcion: prueba2 A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez','fichas',NULL),(4,'2024-04-16 04:01:51','root@localhost','Se insertó','Información actual = id_ficha: 5, fecha_solicitud: 2024-04-09, anio_solicitud: 2024, descripcion: prueba2 , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez',NULL,'fichas',NULL),(5,'2024-04-16 04:03:42','root@localhost','Se actualizó','Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-09, anio_solicitud: 0, descripcion: prueba2 , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez','Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-09 anio_solicitud: 2024, descripcion: prueba2 A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez','fichas',NULL),(6,'2024-04-16 04:04:08','root@localhost','Se actualizó','Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-09, anio_solicitud: 0, descripcion: prueba2 , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez','Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-09 anio_solicitud: 0, descripcion: prueba2 A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez','fichas',NULL),(7,'2024-04-16 04:09:38','root@localhost','Se actualizó','Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-09, anio_solicitud: 0, descripcion: prueba2 , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez','Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-09 anio_solicitud: 0, descripcion: prueba2 A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez','fichas',NULL),(8,'2024-04-16 04:12:51','root@localhost','Se insertó','Información actual = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 2023, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf',NULL,'fichas',NULL),(9,'2024-04-16 04:15:59','root@localhost','Se insertó','Información actual = id_ficha: 7, fecha_solicitud: 2024-04-17, anio_solicitud: 2023, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf',NULL,'fichas',NULL),(10,'2024-04-16 04:16:13','root@localhost','Se actualizó','Información actualizada = id_ficha: 7, fecha_solicitud: 2024-04-17, anio_solicitud: 2025, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','Información anterior = id_ficha: 7, fecha_solicitud: 2024-04-17 anio_solicitud: 2023, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','fichas',NULL),(11,'2024-04-16 04:24:16','root@localhost','Se actualizó','Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 2023, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','fichas',NULL),(12,'2024-04-16 04:26:25','root@localhost','Se actualizó','Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','fichas',NULL),(13,'2024-04-16 04:32:29','root@localhost','Se actualizó','Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','fichas',NULL),(14,'2024-04-16 04:33:03','root@localhost','Se actualizó','Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','fichas',NULL),(15,'2024-04-16 04:48:20','root@localhost','Se actualizó','Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','fichas',NULL),(16,'2024-04-16 04:57:08','root@localhost','Se actualizó','Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','fichas',NULL),(17,'2024-04-16 04:58:26','root@localhost','Se actualizó','Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','fichas',NULL),(18,'2024-04-16 05:02:23','root@localhost','Se actualizó','Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','fichas',NULL),(19,'2024-04-16 05:03:51','root@localhost','Se actualizó','Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','fichas',NULL),(20,'2024-04-16 05:07:29','root@localhost','Se actualizó','Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','fichas',NULL),(21,'2024-04-16 05:08:30','root@localhost','Se actualizó','Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','fichas',NULL),(22,'2024-04-16 05:09:27','root@localhost','Se insertó','Información actual = id_ficha: 8, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ',NULL,'fichas',NULL),(23,'2024-04-16 05:10:00','root@localhost','Se insertó','Información actual = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ',NULL,'fichas',NULL),(24,'2024-04-16 05:10:05','root@localhost','Se actualizó','Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf','fichas',NULL),(25,'2024-04-16 05:10:51','root@localhost','Se actualizó','Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','fichas',NULL),(26,'2024-04-16 05:13:43','root@localhost','Se actualizó','Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','fichas',NULL),(27,'2024-04-16 05:14:47','root@localhost','Se actualizó','Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','fichas',NULL),(28,'2024-04-16 05:16:32','root@localhost','Se actualizó','Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','fichas',NULL),(29,'2024-04-16 05:17:33','root@localhost','Se actualizó','Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','fichas',NULL),(30,'2024-04-16 05:18:57','root@localhost','Se actualizó','Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','fichas',NULL),(31,'2024-04-16 05:23:32','root@localhost','Se actualizó','Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','fichas',NULL),(32,'2024-04-16 05:25:25','root@localhost','Se actualizó','Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','fichas',NULL),(33,'2024-04-16 05:25:33','root@localhost','Se actualizó','Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','fichas',NULL),(34,'2024-04-16 05:26:30','root@localhost','Se actualizó','Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ','fichas',NULL),(35,'2024-04-16 05:28:11','root@localhost','Se insertó','Información actual = id_ficha: 10, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ',NULL,'fichas',NULL),(36,'2024-04-16 05:37:50','root@localhost','Se insertó','Información actual = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 2024, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino',NULL,'fichas',NULL),(37,'2024-04-16 05:43:15','root@localhost','Se insertó','Información actual = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 2024, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino',NULL,'fichas',NULL),(38,'2024-04-16 05:43:40','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 2024, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(39,'2024-04-19 01:46:58','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(40,'2024-04-19 01:47:00','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(41,'2024-04-19 01:50:06','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(42,'2024-04-19 01:53:00','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(43,'2024-04-19 01:54:37','root@localhost','Se actualizó','Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-10 anio_solicitud: 2024, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(44,'2024-04-19 01:55:41','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(45,'2024-04-20 17:55:39','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(46,'2024-04-20 18:00:00','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(47,'2024-04-20 18:01:45','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(48,'2024-04-20 18:02:47','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(49,'2024-04-20 18:08:27','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(50,'2024-04-20 18:13:16','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(51,'2024-04-20 18:31:52','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(52,'2024-04-20 18:47:30','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(53,'2024-04-20 18:52:36','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(54,'2024-04-20 19:07:07','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(55,'2024-04-20 19:07:46','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(56,'2024-04-20 19:12:53','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(57,'2024-04-20 19:14:11','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(58,'2024-04-20 19:19:12','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(59,'2024-04-20 19:21:01','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(60,'2024-04-20 19:25:05','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(61,'2024-04-20 19:30:34','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(62,'2024-04-20 19:42:00','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(63,'2024-04-20 19:48:06','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(64,'2024-04-20 19:50:36','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(65,'2024-04-20 19:52:18','root@localhost','Se insertó','Información actual = id_ficha: 3, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ',NULL,'fichas',NULL),(66,'2024-04-20 19:52:50','root@localhost','Se insertó','Información actual = id_ficha: 4, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino',NULL,'fichas',NULL),(67,'2024-04-20 19:52:58','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino','fichas',NULL),(68,'2024-04-21 02:00:56','root@localhost','Se insertó','Información actual = id_ficha: 1, fecha_solicitud: 2024-04-17, anio_solicitud: 2024, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez',NULL,'fichas',NULL),(69,'2024-04-21 02:06:00','root@localhost','Se actualizó','Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-17 anio_solicitud: 2024, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','fichas',NULL),(70,'2024-04-21 02:10:26','root@localhost','Se actualizó','Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','fichas',NULL),(71,'2024-04-21 02:11:40','root@localhost','Se actualizó','Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','fichas',NULL),(72,'2024-04-21 02:21:33','root@localhost','Se actualizó','Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','fichas',NULL),(73,'2024-04-21 02:23:10','root@localhost','Se actualizó','Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','fichas',NULL),(74,'2024-04-21 02:28:37','root@localhost','Se insertó','Información actual = id_ficha: 2, fecha_solicitud: 2024-04-02, anio_solicitud: 2024, descripcion:  sdfdsfds, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: fsdfdsfd',NULL,'fichas',NULL),(75,'2024-04-21 02:32:42','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-02, anio_solicitud: 0, descripcion:  sdfdsfds, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: fsdfdsfd','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-02 anio_solicitud: 2024, descripcion:  sdfdsfdsA, fecha_entrevista: 2024-04-04, nombre_encuestador: fsdfdsfd','fichas',NULL),(76,'2024-04-21 02:33:42','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-02, anio_solicitud: 0, descripcion:  sdfdsfds, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: fsdfdsfd','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-02 anio_solicitud: 0, descripcion:  sdfdsfdsA, fecha_entrevista: 2024-04-04, nombre_encuestador: fsdfdsfd','fichas',NULL),(77,'2024-04-21 02:33:52','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-02, anio_solicitud: 0, descripcion:  sdfdsfds, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: fsdfdsfd','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-02 anio_solicitud: 0, descripcion:  sdfdsfdsA, fecha_entrevista: 2024-04-04, nombre_encuestador: fsdfdsfd','fichas',NULL),(78,'2024-04-21 02:37:23','root@localhost','Se insertó','Información actual = id_ficha: 3, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ',NULL,'fichas',NULL),(79,'2024-04-21 02:39:10','root@localhost','Se insertó','Información actual = id_ficha: 4, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez',NULL,'fichas',NULL),(80,'2024-04-21 02:39:20','root@localhost','Se actualizó','Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','fichas',NULL),(81,'2024-04-21 02:45:24','root@localhost','Se actualizó','Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','fichas',NULL),(82,'2024-04-21 02:45:29','root@localhost','Se actualizó','Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','fichas',NULL),(83,'2024-04-21 02:45:40','root@localhost','Se actualizó','Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez','fichas',NULL),(84,'2024-04-21 03:24:15','root@localhost','Se insertó','Información actual = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 2024, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria',NULL,'fichas',NULL),(85,'2024-04-21 03:29:04','root@localhost','Se insertó','Información actual = id_ficha: 2, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC',NULL,'fichas',NULL),(86,'2024-04-21 03:31:36','root@localhost','Se actualizó','Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria','Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-10 anio_solicitud: 2024, descripcion: prueba A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria','fichas',NULL),(87,'2024-04-21 03:33:36','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-16, anio_solicitud: 0, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-16 anio_solicitud: 2024, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','fichas',NULL),(88,'2024-04-21 03:35:26','root@localhost','Se insertó','Información actual = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 0, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC',NULL,'fichas',NULL),(89,'2024-04-21 03:35:54','root@localhost','Se actualizó','Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 0, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 0, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','fichas',NULL),(90,'2024-04-22 04:38:36','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-16, anio_solicitud: 0, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-16 anio_solicitud: 0, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','fichas',NULL),(91,'2024-04-22 04:45:10','root@localhost','Se actualizó','Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 0, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 0, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','fichas',NULL),(92,'2024-04-22 04:49:42','root@localhost','Se insertó','Información actual = id_ficha: 4, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ',NULL,'fichas',NULL),(93,'2024-04-22 04:55:01','root@localhost','Se insertó','Información actual = id_ficha: 5, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ',NULL,'fichas',NULL),(94,'2024-04-22 04:59:39','root@localhost','Se insertó','Información actual = id_ficha: 6, fecha_solicitud: 0000-00-00, anio_solicitud: 2024, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ',NULL,'fichas',NULL),(95,'2024-04-23 02:40:25','root@localhost','Se actualizó','Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2025, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 0, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','fichas',NULL),(96,'2024-04-23 02:41:23','root@localhost','Se actualizó','Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2025, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 2025, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','fichas',NULL),(97,'2024-04-23 02:41:41','root@localhost','Se actualizó','Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 0, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 2025, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','fichas',NULL),(98,'2024-04-23 02:46:05','root@localhost','Se actualizó','Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 0, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','fichas',NULL),(99,'2024-04-23 02:49:19','root@localhost','Se actualizó','Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 2024, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','fichas',NULL),(100,'2024-04-23 02:57:27','root@localhost','Se actualizó','Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 2024, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','fichas',NULL),(101,'2024-04-23 02:58:50','root@localhost','Se insertó','Información actual = id_ficha: 7, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ',NULL,'fichas',NULL),(102,'2024-04-23 03:00:20','root@localhost','Se insertó','Información actual = id_ficha: 8, fecha_solicitud: 2024-04-09, anio_solicitud: 4324, descripcion:  , estado: A, fecha_entrevista: 2024-04-02, nombre_encuestador: fdsfsd',NULL,'fichas',NULL),(103,'2024-04-23 03:05:11','root@localhost','Se actualizó','Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 2024, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','fichas',NULL),(104,'2024-04-23 03:17:39','root@localhost','Se actualizó','Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 2024, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','fichas',NULL),(105,'2024-04-23 03:20:17','root@localhost','Se insertó','Información actual = id_ficha: 9, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC',NULL,'fichas',NULL),(106,'2024-04-23 03:20:27','root@localhost','Se actualizó','Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 2024, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC','fichas',NULL),(107,'2024-04-23 03:41:03','root@localhost','Se actualizó','Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria','Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria','fichas',NULL),(108,'2024-04-23 03:41:54','root@localhost','Se actualizó','Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria','Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria','fichas',NULL),(109,'2024-04-23 03:42:11','root@localhost','Se insertó','Información actual = id_ficha: 10, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ',NULL,'fichas',NULL),(110,'2024-04-23 03:42:37','root@localhost','Se actualizó','Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria','Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria','fichas',NULL),(111,'2024-04-24 11:52:15','root@localhost','Se actualizó','Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria','Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria','fichas',NULL),(112,'2024-04-24 11:53:10','root@localhost','Se insertó','Información actual = id_ficha: 11, fecha_solicitud: 2024-04-10, anio_solicitud: 545, descripcion:  4545, estado: A, fecha_entrevista: 2024-04-03, nombre_encuestador: 3545',NULL,'fichas',NULL),(113,'2024-04-24 11:53:38','root@localhost','Se insertó','Información actual = id_ficha: 12, fecha_solicitud: 2024-04-25, anio_solicitud: 31, descripcion:  sdfdsf, estado: A, fecha_entrevista: 2024-04-11, nombre_encuestador: sdfsf',NULL,'fichas',NULL),(114,'2024-04-25 23:46:27','root@localhost','Se insertó','Información actual = id_ficha: 1, fecha_solicitud: 2024-04-25, anio_solicitud: 2024, descripcion:  Prueba 1, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: Prueba 1',NULL,'fichas',NULL),(115,'2024-04-26 01:55:36','root@localhost','Se insertó','Información actual = id_ficha: 2, fecha_solicitud: 2024-04-25, anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal',NULL,'fichas',NULL),(116,'2024-04-26 02:24:07','root@localhost','Se insertó','Información actual = id_ficha: 3, fecha_solicitud: 2024-04-25, anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal',NULL,'fichas',NULL),(117,'2024-04-26 02:24:42','root@localhost','Se insertó','Información actual = id_ficha: 4, fecha_solicitud: 2024-04-25, anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal',NULL,'fichas',NULL),(118,'2024-04-26 02:24:55','root@localhost','Se actualizó','Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-25, anio_solicitud: 2024, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal','Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-25 anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacionA, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal','fichas',NULL),(119,'2024-04-26 02:28:54','root@localhost','Se actualizó','Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-25, anio_solicitud: 2024, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal','Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-25 anio_solicitud: 2024, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacionA, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal','fichas',NULL),(120,'2024-04-27 03:13:51','root@localhost','Se actualizó','Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-25, anio_solicitud: 2024, descripcion:  Prueba 1, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: Prueba 1','Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-25 anio_solicitud: 2024, descripcion:  Prueba 1A, fecha_entrevista: 2024-04-25, nombre_encuestador: Prueba 1','fichas',NULL),(121,'2024-04-27 03:14:30','root@localhost','Se insertó','Información actual = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras',NULL,'fichas',NULL),(122,'2024-04-27 03:37:51','root@localhost','Se actualizó','Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-25, anio_solicitud: 2024, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal','Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-25 anio_solicitud: 2024, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacionA, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal','fichas',NULL),(123,'2024-04-27 03:39:40','root@localhost','Se actualizó','Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-25, anio_solicitud: 2024, descripcion:  Prueba 1, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: Prueba 1','Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-25 anio_solicitud: 2024, descripcion:  Prueba 1A, fecha_entrevista: 2024-04-25, nombre_encuestador: Prueba 1','fichas',NULL),(124,'2024-04-27 03:40:01','root@localhost','Se actualizó','Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-25, anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal','Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-25 anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacionA, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal','fichas',NULL),(125,'2024-04-27 03:45:40','root@localhost','Se actualizó','Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-25, anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal','Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-25 anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacionA, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal','fichas',NULL),(126,'2024-04-27 03:47:00','root@localhost','Se actualizó','Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-25, anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal','Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-25 anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacionA, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal','fichas',NULL),(127,'2024-04-27 03:49:18','root@localhost','Se actualizó','Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-25, anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal','Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-25 anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacionA, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal','fichas',NULL),(128,'2024-04-30 03:46:48','root@localhost','Se actualizó','Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','fichas',NULL),(129,'2024-04-30 04:19:17','root@localhost','Se actualizó','Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','fichas',NULL),(130,'2024-04-30 04:37:22','root@localhost','Se actualizó','Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','fichas',NULL),(131,'2024-04-30 04:38:07','root@localhost','Se actualizó','Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','fichas',NULL),(132,'2024-04-30 04:45:52','root@localhost','Se actualizó','Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','fichas',NULL),(133,'2024-05-01 02:17:26','root@localhost','Se actualizó','Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','fichas',NULL),(134,'2024-05-01 02:20:29','root@localhost','Se actualizó','Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','fichas',NULL),(135,'2024-05-01 02:21:33','root@localhost','Se actualizó','Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras','fichas',NULL),(136,'2024-05-01 02:27:38','root@localhost','Se insertó','Información actual = id_ficha: 6, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ',NULL,'fichas',NULL),(137,'2024-05-01 02:31:06','root@localhost','Se insertó','Información actual = id_ficha: 7, fecha_solicitud: 2024-04-02, anio_solicitud: 2024, descripcion:  sdfds, estado: A, fecha_entrevista: 2024-04-08, nombre_encuestador: sdfsdf',NULL,'fichas',NULL),(138,'2024-05-01 02:34:05','root@localhost','Se insertó','Información actual = id_ficha: 8, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ',NULL,'fichas',NULL),(139,'2024-05-01 02:39:54','root@localhost','Se insertó','Información actual = id_ficha: 9, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria',NULL,'fichas',NULL),(140,'2024-05-01 02:46:15','root@localhost','Se insertó','Información actual = id_ficha: 10, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria',NULL,'fichas',NULL),(141,'2024-05-01 02:49:05','root@localhost','Se insertó','Información actual = id_ficha: 11, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria',NULL,'fichas',NULL),(142,'2024-05-01 04:16:28','root@localhost','Se actualizó','Información actualizada = id_ficha: 11, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria','Información anterior = id_ficha: 11, fecha_solicitud: 2024-04-04 anio_solicitud: 204, descripcion: preba A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria','fichas',NULL),(143,'2024-05-01 04:21:39','root@localhost','Se actualizó','Información actualizada = id_ficha: 11, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria','Información anterior = id_ficha: 11, fecha_solicitud: 2024-04-04 anio_solicitud: 204, descripcion: preba A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria','fichas',NULL),(144,'2024-05-01 04:39:24','root@localhost','Se actualizó','Información actualizada = id_ficha: 11, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria','Información anterior = id_ficha: 11, fecha_solicitud: 2024-04-04 anio_solicitud: 204, descripcion: preba A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria','fichas',NULL);
/*!40000 ALTER TABLE `bitacoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_usuario`
--

DROP TABLE IF EXISTS `estado_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_usuario` (
  `id_estado` bigint(20) NOT NULL AUTO_INCREMENT,
  `Estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_usuario`
--

LOCK TABLES `estado_usuario` WRITE;
/*!40000 ALTER TABLE `estado_usuario` DISABLE KEYS */;
INSERT INTO `estado_usuario` VALUES (1,'ACTIVO'),(2,'INACTIVO'),(3,'NUEVO'),(4,'BLOQUEADO ');
/*!40000 ALTER TABLE `estado_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fichas`
--

DROP TABLE IF EXISTS `fichas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fichas` (
  `id_ficha` bigint(20) NOT NULL DEFAULT 0,
  `fecha_solicitud` date DEFAULT NULL,
  `anio_solicitud` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL,
  `fecha_entrevista` date DEFAULT NULL,
  `nombre_encuentrador` varchar(50) DEFAULT NULL,
  `firma_productor` varchar(100) DEFAULT NULL,
  `nombre_encuestador` varchar(50) DEFAULT NULL,
  `firma_encuestador` varchar(100) DEFAULT NULL,
  `nombre_supervisor` varchar(50) DEFAULT NULL,
  `firma_supervisor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_ficha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fichas`
--

LOCK TABLES `fichas` WRITE;
/*!40000 ALTER TABLE `fichas` DISABLE KEYS */;
INSERT INTO `fichas` VALUES (1,'2024-04-25',2024,' Prueba 1','HARU','2024-04-25 23:46:27','HARU','2024-04-27 03:39:40','A','2024-04-25','Prueba 1',NULL,'Prueba 1',NULL,'Prueba 1',NULL),(2,'2024-04-25',2023,' Esta es la primera ficha desde 0 de la clase de evaluacion','HARU','2024-04-26 01:55:36','HARU','2024-04-27 03:49:18','A','2024-04-25','EncuestadorFinal',NULL,'EncuestadoFinal',NULL,'SupervisorFinal',NULL),(3,'2024-04-25',2023,' Esta es la primera ficha desde 0 de la clase de evaluacion','HARU','2024-04-26 01:55:36','HARU','2024-04-27 03:47:00','A','2024-04-25','EncuestadorFinal',NULL,'EncuestadoFinal',NULL,'SupervisorFinal',NULL),(4,'2024-04-25',2024,' Esta es la primera ficha desde 0 de la clase de evaluacion','HARU','2024-04-26 01:55:36','HARU','2024-04-27 03:37:51','A','2024-04-25','EncuestadorFinal',NULL,'EncuestadoFinal',NULL,'SupervisorFinal',NULL),(5,'2024-04-26',2024,' gh','HARU','2024-04-27 03:14:30','HARU','2024-05-01 02:21:33','A','2024-04-26','Francisco Morazan',NULL,'Honduras',NULL,'Manuel',NULL),(6,'0000-00-00',0,' ','HARU','2024-05-01 02:27:38',NULL,'2024-05-01 02:27:38','A','0000-00-00','',NULL,'',NULL,'',NULL),(7,'2024-04-02',2024,' sdfds','HARU','2024-05-01 02:31:06',NULL,'2024-05-01 02:31:06','A','2024-04-08','fsdfsd',NULL,'sdfsdf',NULL,'sfsd',NULL),(8,'0000-00-00',0,' ','HARU','2024-05-01 02:34:05',NULL,'2024-05-01 02:34:05','A','0000-00-00','',NULL,'',NULL,'',NULL),(9,'2024-04-04',204,'preba ','HARU','2024-05-01 02:39:54',NULL,'2024-05-01 02:39:54','A','2024-04-01','Mario',NULL,'Maria',NULL,'Juan',NULL),(10,'2024-04-04',204,'preba ','HARU','2024-05-01 02:39:54',NULL,'2024-05-01 02:39:54','A','2024-04-01','Mario',NULL,'Maria',NULL,'Juan',NULL),(11,'2024-04-04',204,'preba ','HARU','2024-05-01 02:39:54','HARU','2024-05-01 04:39:24','A','2024-04-01','Mario',NULL,'Maria',NULL,'Juan',NULL);
/*!40000 ALTER TABLE `fichas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `InsertFichas` AFTER INSERT ON `fichas` FOR EACH ROW BEGIN
            INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)VALUES(
            CURRENT_USER, 'Se insertó', concat('Información actual = id_ficha: ', NEW.id_ficha, ', fecha_solicitud: ',NEW.fecha_solicitud, ', anio_solicitud: ',NEW.anio_solicitud, ', descripcion: ', NEW.descripcion, ', estado: ',NEW.estado, ', fecha_entrevista: ',NEW.fecha_entrevista, ', nombre_encuestador: ',NEW.nombre_encuestador), 'fichas');
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateFichas` AFTER UPDATE ON `fichas` FOR EACH ROW BEGIN
            INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)VALUES(CURRENT_USER, 'Se actualizó', concat('Información anterior = id_ficha: ', OLD.id_ficha, ', fecha_solicitud: ',OLD.fecha_solicitud, ' anio_solicitud: ',OLD.anio_solicitud, ', descripcion: ', OLD.descripcion, '',OLD.estado, ', fecha_entrevista: ',OLD.fecha_entrevista, ', nombre_encuestador: ',OLD.nombre_encuestador), concat('Información actualizada = id_ficha: ', NEW.id_ficha, ', fecha_solicitud: ',NEW.fecha_solicitud, ', anio_solicitud: ',NEW.anio_solicitud, ', descripcion: ', NEW.descripcion, ', estado: ',NEW.estado, ', fecha_entrevista: ',NEW.fecha_entrevista, ', nombre_encuestador: ',NEW.nombre_encuestador), 'fichas');
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DeleteFichas` AFTER DELETE ON `fichas` FOR EACH ROW BEGIN
            INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)VALUES(
            CURRENT_USER, 'Se eliminó', concat('Información eliminada = id_ficha: ', OLD.id_ficha, ', fecha_solicitud: ',OLD.fecha_solicitud, ', anio_solicitud: ',OLD.anio_solicitud, ', descripcion: ', OLD.descripcion, ', estado: ',OLD.estado, ', fecha_entrevista: ',OLD.fecha_entrevista, ', nombre_encuestador: ',OLD.nombre_encuestador), 'fichas');
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `historial_contrasenas`
--

DROP TABLE IF EXISTS `historial_contrasenas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historial_contrasenas` (
  `id_historial` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) NOT NULL,
  `contrasena_hash` varchar(255) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_historial`),
  UNIQUE KEY `usuario_contraseña_unico` (`usuario_id`,`contrasena_hash`),
  CONSTRAINT `fk_historial_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`Id_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_contrasenas`
--

LOCK TABLES `historial_contrasenas` WRITE;
/*!40000 ALTER TABLE `historial_contrasenas` DISABLE KEYS */;
INSERT INTO `historial_contrasenas` VALUES (1,9,'$2y$10$o2I2ApYtBul2Yjm6j5sfL.kKOySMFtk3Yqb3uj6O0/iHwNGl8VfBi','2024-04-28 04:38:00'),(2,9,'$2y$10$OYa/poBKf/7HvQAfg0nOdu3giNsH61cfE.PcsSW/MJfCkP8.csSLi','2024-04-28 04:41:25'),(3,9,'$2y$10$zQ4V8DhqaznBKRXFXS33L.nDk0SWhvjdZ1fXadC7levKDnImsRpru','2024-04-28 04:41:42'),(4,15,'$2y$10$EY0Z2Ro6taSicrlSDgKh2O7XvNL89AZ43NDkkwi7oKoPhePVT5a8.','2024-04-28 22:06:22'),(5,9,'$2y$10$bqrIfn1INEBy25aFEoQD6eiGROE9tESDrt3ruuKWf/3MbnMgmlzbK','2024-04-29 02:58:46');
/*!40000 ALTER TABLE `historial_contrasenas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_permisos`
--

DROP TABLE IF EXISTS `model_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_permisos` (
  `Id_Permisos` bigint(20) NOT NULL,
  `Tipo_Modelo` varchar(255) NOT NULL,
  `Modelo_Id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_permisos`
--

LOCK TABLES `model_permisos` WRITE;
/*!40000 ALTER TABLE `model_permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_roles`
--

DROP TABLE IF EXISTS `model_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_roles` (
  `Rol_Id` bigint(20) NOT NULL,
  `Tipo_Modelo` varchar(255) NOT NULL,
  `Modelo_Id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_roles`
--

LOCK TABLES `model_roles` WRITE;
/*!40000 ALTER TABLE `model_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetos`
--

DROP TABLE IF EXISTS `objetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objetos` (
  `Id_objetos` bigint(20) NOT NULL AUTO_INCREMENT,
  `Objeto` varchar(255) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `tipo_objeto` varchar(50) NOT NULL,
  `Creado_Por` varchar(40) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Actualizado_Por` varchar(40) NOT NULL,
  `Fecha_Actualizacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`Id_objetos`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetos`
--

LOCK TABLES `objetos` WRITE;
/*!40000 ALTER TABLE `objetos` DISABLE KEYS */;
INSERT INTO `objetos` VALUES (1,'Login','Login del sistema','Pantalla','0','2024-04-21 23:02:33','0','2024-04-21 23:02:33','A'),(2,'usuario','Pantalla de usuarios','Pantalla','PRUEBA1','2024-04-21 23:04:00','PRUEBA1','2024-04-21 23:04:00','A'),(3,'Permisos','Pantalla de permisos','Pantalla','HARU','2024-04-21 23:05:15','HARU','2024-04-21 23:05:15','A'),(4,'Preguntas','Pantalla de preguntas','Pantalla','HARU','2024-04-21 23:05:42','HARU','2024-04-21 23:05:42','A'),(5,'Objetos','Pantalla de los objetos','Pantalla','HARU','2024-04-21 23:06:15','HARU','2024-04-21 23:06:15','A'),(6,'Roles','Pantalla de roles','Pantalla','HARU','2024-04-21 23:06:58','HARU','2024-04-21 23:06:58','A'),(7,'Bitacora','Pantalla de la bitacora','Pantalla','HARU','2024-04-21 23:07:38','HARU','2024-04-21 23:07:38','A'),(8,'Backup','Pantalla para hacer el backup','Pantalla','HARU','2024-04-21 23:08:21','HARU','2024-04-21 23:08:21','A'),(9,'Llenar Formulario','Pantalla para llenar el formulario','Pantalla','HARU','2024-04-21 23:11:07','HARU','2024-04-21 23:11:07','A'),(10,'Ficha','Mantenimiento de fichas','Pantalla/Mantenimiento','HARU','2024-04-21 23:13:04','HARU','2024-04-21 23:13:04','A'),(11,'Datos Generales','Datos generales del agricultor','Pantalla','HARU','2024-04-21 23:13:56','HARU','2024-04-21 23:13:56','A'),(12,'Pertenencia a ORG','Pantalla para buscar los agricultores con organizacion','Pantalla','HARU','2024-04-21 23:15:09','HARU','2024-04-21 23:15:09','A'),(13,'Organizaciones Productor','Pantalla que muestras las organizaciones por productor','Pantalla','HARU','2024-04-21 23:15:54','HARU','2024-04-21 23:15:54','A'),(14,'Relevo Generacional','Pantalla que muestra los relevos que tiene un productor','Pantalla','HARU','2024-04-21 23:16:50','HARU','2024-04-21 23:16:50','A'),(15,'Ubicacion Greografica','Pantalla de la ubicacion del productor','Pantalla','HARU','2024-04-21 23:17:42','HARU','2024-04-21 23:17:42','A'),(16,'Composicion del hogar','pantalla de la Composicion del hogar','Pantalla','HARU','2024-04-21 23:20:11','HARU','2024-04-21 23:20:11','A'),(17,'Migracion familiar','pantalla sobre si hay migracion del productor','Pantalla','HARU','2024-04-21 23:21:07','HARU','2024-04-21 23:21:07','A'),(18,'Informacion Basica','pantalla de la informacion basica de la agricultura ','Pantalla','HARU','2024-04-21 23:22:48','HARU','2024-04-21 23:22:48','A'),(19,'Manejo de riego','Pantalla que muestra si el agricultor maneja de riego','Pantalla','HARU','2024-04-21 23:24:17','HARU','2024-04-21 23:24:17','A'),(20,'Produccion Agricola Año Anterior','Pantalla que muestra la Produccion Agricola del  Año Anterior','Pantalla','HARU','2024-04-21 23:25:02','HARU','2024-04-21 23:25:02','A'),(21,'Inventario','Pantalla que muestra el inventario del productor','Pantalla','HARU','2024-04-21 23:27:50','HARU','2024-04-21 23:27:50','A'),(22,'Produccion vendida','Pantalla que muestra la produccion que se vendio en el transcursos del año','Pantalla','HARU','2024-04-21 23:28:39','HARU','2024-04-21 23:28:39','A'),(23,'comercializacion','Pantalla que muestra la informcion de la comercializacion','Pantalla','HARU','2024-04-21 23:30:09','HARU','2024-04-21 23:30:09','A'),(24,'Otros ingresos','Pantalla que muestra los ingresos que genera el productor','Pantalla','HARU','2024-04-21 23:32:30','HARU','2024-04-21 23:32:30','A'),(25,'No Credito','Pantalla que muestra porque no tiene credito','Pantalla','HARU','2024-04-21 23:40:53','HARU','2024-04-21 23:40:53','A'),(26,'Credito','Pantalla que muestra los creditos que tiene el productor','Pantalla','HARU','2024-04-21 23:41:34','HARU','2024-04-21 23:41:34','A'),(27,'TRABEXT','Pantalla que muestra los trabajores externos que tiene el productor','Pantalla','HARU','2024-04-21 23:42:37','HARU','2024-04-21 23:42:37','A'),(28,'PAE','Pantalla de PAE','Pantalla','HARU','2024-04-21 23:43:00','HARU','2024-04-21 23:43:00','A'),(29,'Practicas para produccion','Pantalla que muestra las practicas que tiene el productor','Pantalla','HARU','2024-04-21 23:43:53','HARU','2024-04-21 23:43:53','A'),(30,'Tipos Apoyos','Pantalla que muestra los tipos de apoyos que tiene el productor','Pantalla','HARU','2024-04-21 23:44:43','HARU','2024-04-21 23:44:43','A'),(31,'Apoyo Productor','Pantalla que muestra los apoyos que recibe el productor','Pantalla','HARU','2024-04-21 23:45:51','HARU','2024-04-21 23:45:51','A'),(32,'Apoyos Externos','Pantallas que muestra los apoyos externos que tiene el productor','Pantalla','HARU','2024-04-21 23:47:08','HARU','2024-04-21 23:47:08','A'),(33,'Etnia','Etnias que existen','Pantalla','HARU','2024-04-28 13:17:12','','2024-04-28 13:17:12','A'),(34,'Departamento','Mantenimiento donde esta cada departamento de HN','Pantalla','HARU','2024-04-28 13:25:34','','2024-04-28 13:25:34','A'),(35,'Municipios','Los municipios de cada departamento','Pantalla','HARU','2024-04-28 13:26:05','','2024-04-28 13:26:05','A'),(36,'Aldea','Aldea de los municipios','Pantalla','HARU','2024-04-28 13:27:03','','2024-04-28 13:27:03','A'),(37,'Cacerios','son los cacerios de las aldeas','Pantalla','HARU','2024-04-28 13:27:58','','2024-04-28 13:27:58','A'),(38,'Organizaciones','Son las organizaciones que existe','Pantalla','HARU','2024-04-28 13:28:50','','2024-04-28 13:28:50','A'),(39,'Tipo de Organizacion','son los tipos de organizaciones','Pantalla','HARU','2024-04-28 13:29:55','','2024-04-28 13:29:55','A'),(40,'Motivos Migracion','Son los motivos de migracion ','Pantalla','HARU','2024-04-28 13:30:48','','2024-04-28 13:30:48','A'),(41,'Medidas','son las medidas que se pueden usar para diversos usos','Pantalla','HARU','2024-04-28 13:31:31','','2024-04-28 13:31:31','A'),(42,'Riego','son los tipos de riegos que existen','Pantalla','HARU','2024-04-28 13:31:56','','2024-04-28 13:31:56','A'),(43,'Cultivo','son los tipos de cultivos que se puede cultivar el productor','Pantalla','HARU','2024-04-28 13:32:36','','2024-04-28 13:32:36','A'),(44,'Tipos pecuarios','Son los tipos de animales que se pueden meter','Pantalla','HARU','2024-04-28 13:34:04','','2024-04-28 13:34:04','A'),(45,'Tipo de producción','Son los tipos de productos que el productor elabora','Pantalla','HARU','2024-04-28 13:34:50','','2024-04-28 13:34:50','A'),(46,'Periodos','son los tiempos en periodos','Pantalla','HARU','2024-04-28 13:40:50','','2024-04-28 13:40:50','A'),(47,'Negocio','Son los negocios que puede tener el productor','Pantalla','HARU','2024-04-28 13:42:19','','2024-04-28 13:42:19','A'),(48,'Motivos no credito','son los motivos por el cual el productor no puede tener un credito','Pantalla','HARU','2024-04-28 13:43:03','','2024-04-28 13:43:03','A'),(49,'Fuente de credito','son las fuentes de credito que le productor puede recibir','Pantalla','HARU','2024-04-28 13:43:37','','2024-04-28 13:43:37','A'),(50,'Toma de desiciones ','es quien toma la decision de la finca','Pantalla','HARU','2024-04-28 13:45:48','','2024-04-28 13:45:48','A'),(51,'Tipos de trabajadores','son los tipos de trabajadores que existen','Pantalla','HARU','2024-04-28 13:47:09','','2024-04-28 13:47:09','A'),(52,'Practicas/Productivas','Pantalla que muestras las practicas que puede tener un productor','Pantalla','HARU','2024-04-28 13:48:15','','2024-04-28 13:48:15','A'),(53,'Apoyo','pantalla que dice que apoyos puede tener un productor','Pantalla','HARU','2024-04-28 13:48:50','','2024-04-28 13:48:50','A'),(54,'Tipos de apoyos','son los tipos de apoyos que puede recibir los productores','Pantalla','HARU','2024-04-28 13:49:28','','2024-04-28 13:49:28','A'),(55,'ETNICIDAD','Pantalla donde muestra la informacion de la ETNICIDAD de los productores','Pantalla','HARU','2024-04-28 23:10:16','','2024-04-28 23:10:16','A');
/*!40000 ALTER TABLE `objetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametros` (
  `Id_parametros` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` bigint(20) NOT NULL,
  `Parametro` varchar(255) NOT NULL,
  `Valor` varchar(255) NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Id_parametros`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros`
--

LOCK TABLES `parametros` WRITE;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
INSERT INTO `parametros` VALUES (2,1,'Intentos_Fallidos','3','2022-09-27 11:46:41','2022-09-27 11:46:41'),(3,1,'Admin_Preguntas','2','2022-10-18 03:11:00',NULL),(4,1,'Vigencia_Usuario','30','2022-10-26 08:00:00',NULL),(5,1,'Min_Contraseña','5','2022-10-26 08:00:00',NULL),(6,1,'Max_Contraseña','16','2022-10-26 08:00:00',NULL),(7,1,'Intentos_Preguntas','3','2022-10-26 08:00:00',NULL),(8,1,'Min_Usuario','5','2022-10-26 19:00:00',NULL),(12,1,'Max_Usuario','15','2022-11-22 06:39:05',NULL),(13,0,'DSFSD','adasda','2024-04-30 02:55:00',NULL);
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `id_permisos` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_rol` bigint(20) NOT NULL,
  `permiso_eliminacion` int(11) NOT NULL,
  `id_objeto` int(10) NOT NULL,
  `permiso_actualizacion` int(11) NOT NULL,
  `permiso_insercion` int(11) NOT NULL,
  `permiso_consulta` int(11) DEFAULT NULL,
  `Actualizado_Por` varchar(255) NOT NULL,
  `Fecha_Actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_permisos`),
  KEY `id_rol` (`Id_rol`) USING BTREE,
  KEY `id_objeto` (`id_objeto`),
  KEY `Id_rol_2` (`Id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,1,1,33,1,1,1,'HARU','2024-04-28 13:20:44'),(5,1,1,35,1,1,NULL,'HARU','2024-04-28 15:21:51'),(6,1,1,36,1,1,NULL,'HARU','2024-04-28 15:21:51'),(7,1,1,38,1,1,NULL,'HARU','2024-04-28 15:21:51'),(8,1,1,2,1,1,NULL,'HARU','2024-04-28 23:01:51'),(9,1,1,5,1,1,NULL,'HARU','2024-04-28 23:09:34'),(10,1,1,4,1,1,NULL,'HARU','2024-04-28 20:33:51'),(11,1,1,3,1,1,NULL,'HARU','2024-04-28 22:14:03'),(12,18,0,33,0,0,0,'HARU','2024-04-28 22:25:57');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas` (
  `Id_pregunta` bigint(20) NOT NULL AUTO_INCREMENT,
  `Pregunta` varchar(255) NOT NULL,
  `Creador_Por` varchar(40) NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Actualizado_Por` varchar(40) NOT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL,
  `estado` enum('A','I') NOT NULL DEFAULT 'A',
  PRIMARY KEY (`Id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,'¿Cuál es tu color favorito?','Haru','2023-10-11 09:45:08','Haru','2023-10-12 09:45:08','A'),(2,'¿que equipo es tu favorito?','Haru','2023-10-29 02:14:09','Haru','2023-10-29 02:14:09','A'),(6,'¿Comida Favorita?','HARU','2024-04-28 20:49:50','HARU','2024-04-28 20:55:23','A'),(7,'sfsdf','USUARIO','2024-04-30 03:20:43','USUARIO','2024-04-30 03:20:43','I');
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas_usuario`
--

DROP TABLE IF EXISTS `preguntas_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas_usuario` (
  `Id_Pregunta_U` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_pregunta` bigint(20) NOT NULL,
  `Id_Usuario` bigint(20) DEFAULT NULL,
  `Respuestas` varchar(100) NOT NULL,
  `Creado_Por` varchar(80) DEFAULT NULL,
  `Fecha_Creacion` datetime DEFAULT NULL,
  `Modificado_Por` varchar(80) DEFAULT NULL,
  `Fecha_Modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_Pregunta_U`),
  KEY `Preguntas_idx` (`Id_pregunta`),
  KEY `Preguntas_Usuario_idx` (`Id_Usuario`),
  CONSTRAINT `Preguntas_P` FOREIGN KEY (`Id_pregunta`) REFERENCES `preguntas` (`Id_pregunta`),
  CONSTRAINT `Preguntas_U` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas_usuario`
--

LOCK TABLES `preguntas_usuario` WRITE;
/*!40000 ALTER TABLE `preguntas_usuario` DISABLE KEYS */;
INSERT INTO `preguntas_usuario` VALUES (1,1,1,'Rojo','1','2023-10-27 22:53:34','1','2023-10-31 22:53:34'),(4,2,15,'PSG','15','2024-04-28 21:11:43',NULL,NULL),(6,2,14,'san marino','USUARIO','2024-04-29 21:31:36',NULL,NULL),(11,2,9,'a','9','2024-05-01 06:35:31',NULL,NULL);
/*!40000 ALTER TABLE `preguntas_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recuperar_clave`
--

DROP TABLE IF EXISTS `recuperar_clave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recuperar_clave` (
  `Correo` varchar(255) NOT NULL,
  `Token` varchar(255) NOT NULL,
  `Fecha_Creacion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recuperar_clave`
--

LOCK TABLES `recuperar_clave` WRITE;
/*!40000 ALTER TABLE `recuperar_clave` DISABLE KEYS */;
/*!40000 ALTER TABLE `recuperar_clave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuestas` (
  `Id_pregunta` bigint(20) NOT NULL,
  `Id_Usuario` bigint(20) NOT NULL,
  `Respuesta` varchar(255) NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL,
  `Id_respuesta` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `Id_rol` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Creado_Por` bigint(20) NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Actualizado_Por` bigint(20) NOT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL,
  `STATUS` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`Id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMINISTRADOR','ADMIN',1,'2023-10-17 12:01:16',2,'2023-10-18 12:01:16','ACTIVO'),(2,'NUEVO','Personal Nuevo',1,'2023-10-29 05:42:09',1,'2024-05-01 04:30:38','ACTIVO');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion`
--

DROP TABLE IF EXISTS `sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesion` (
  `Id_Sesion` varchar(255) NOT NULL,
  `Usuario_Id` bigint(20) DEFAULT NULL,
  `Direccion_Ip` varchar(45) DEFAULT NULL,
  `Usuario_Agente` text DEFAULT NULL,
  `Payload` text NOT NULL,
  `Ultima_Actividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
/*!40000 ALTER TABLE `sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aldeas`
--

DROP TABLE IF EXISTS `tbl_aldeas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_aldeas` (
  `Id_Aldea` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_Departamento` bigint(20) NOT NULL,
  `Id_Municipio` bigint(20) NOT NULL,
  `Nombre_Aldea` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estado` enum('A','I') DEFAULT NULL,
  `Creado_Por` varchar(50) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(50) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Id_Aldea`),
  KEY `fk_municipio_aldeas` (`Id_Municipio`),
  KEY `fk_departamento_aldeas` (`Id_Departamento`),
  CONSTRAINT `fk_departamento_aldeas` FOREIGN KEY (`Id_Departamento`) REFERENCES `tbl_departamentos` (`Id_Departamento`),
  CONSTRAINT `fk_municipio_aldeas` FOREIGN KEY (`Id_Municipio`) REFERENCES `tbl_municipios` (`Id_Municipio`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aldeas`
--

LOCK TABLES `tbl_aldeas` WRITE;
/*!40000 ALTER TABLE `tbl_aldeas` DISABLE KEYS */;
INSERT INTO `tbl_aldeas` VALUES (1,1,1,'Pueblo Nuevo','Descripción de Pueblo Nuevo','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(2,1,1,'La Unión','Descripción de La Unión','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(3,1,1,'El Porvenir','Descripción de El Porvenir','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(4,1,1,'La Masica','Descripción de La Masica','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(5,1,1,'Esparta','Descripción de Esparta','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(6,1,2,'El Porvenir','Descripción de El Porvenir','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(7,1,2,'La Unión','Descripción de La Unión','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(8,1,2,'Tela','Descripción de Tela','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(9,1,2,'San Juan','Descripción de San Juan','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(10,1,2,'La Ceibita','Descripción de La Ceibita','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(11,1,3,'El Zapote','Descripción de El Zapote','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(12,1,3,'La Libertad','Descripción de La Libertad','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(13,1,3,'Los Horcones','Descripción de Los Horcones','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(14,1,3,'Los Planes','Descripción de Los Planes','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(15,1,3,'El Tamarindo','Descripción de El Tamarindo','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(16,1,4,'Arizona','Descripción de Arizona','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(17,1,4,'Choloma','Descripción de Choloma','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(18,1,4,'La Masica','Descripción de La Masica','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(19,1,4,'San Juan','Descripción de San Juan','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(20,1,4,'La Ensenada','Descripción de La Ensenada','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(21,1,5,'Arizona Centro','Descripción de Arizona Centro','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(22,1,5,'El Triunfo','Descripción de El Triunfo','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(23,1,5,'La Laguna','Descripción de La Laguna','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(24,1,5,'Pimienta','Descripción de Pimienta','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(25,1,5,'Valle de Ángeles','Descripción de Valle de Ángeles','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(26,2,6,'Trujillo Centro','Descripción de Trujillo Centro','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(27,2,6,'Barrio Inglés','Descripción de Barrio Inglés','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(28,2,6,'Santa Fe','Descripción de Santa Fe','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(29,2,6,'La Ceiba','Descripción de La Ceiba','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(30,2,6,'Las Flores','Descripción de Las Flores','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(31,2,7,'Tocoa Centro','Descripción de Tocoa Centro','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(32,2,7,'El Paraíso','Descripción de El Paraíso','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(33,2,7,'San Juan','Descripción de San Juan','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(34,2,7,'Santa Teresa','Descripción de Santa Teresa','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(35,2,7,'Saba','Descripción de Saba','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(36,2,8,'Sonaguera Centro','Descripción de Sonaguera Centro','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(37,2,8,'El Higueral','Descripción de El Higueral','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(38,2,8,'San Jorge','Descripción de San Jorge','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(39,2,8,'Las Mercedes','Descripción de Las Mercedes','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(40,2,8,'La Unión','Descripción de La Unión','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(41,2,9,'Iriona Centro','Descripción de Iriona Centro','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(42,2,9,'Plan Grande','Descripción de Plan Grande','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(43,2,9,'Santa María','Descripción de Santa María','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(44,2,9,'Limón','Descripción de Limón','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(45,2,9,'Trinidad','Descripción de Trinidad','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(46,2,10,'Santa Fe Centro','Descripción de Santa Fe Centro','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(47,2,10,'La Fe','Descripción de La Fe','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(48,2,10,'El Pino','Descripción de El Pino','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(49,2,10,'Santa Rosa','Descripción de Santa Rosa','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(50,2,10,'La Esperanza','Descripción de La Esperanza','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(51,3,11,'Barrio Guamilito','Descripción de Barrio Guamilito','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(52,3,11,'Barrio Suyapa','Descripción de Barrio Suyapa','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(53,3,11,'Barrio Cabañas','Descripción de Barrio Cabañas','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(54,3,11,'Barrio Los Andes','Descripción de Barrio Los Andes','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(55,3,11,'Barrio Barandillas','Descripción de Barrio Barandillas','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(56,3,12,'Barrio El Porvenir','Descripción de Barrio El Porvenir','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(57,3,12,'Barrio La Antorcha','Descripción de Barrio La Antorcha','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(58,3,12,'Barrio La Guadalupe','Descripción de Barrio La Guadalupe','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(59,3,12,'Barrio Las Mercedes','Descripción de Barrio Las Mercedes','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(60,3,12,'Barrio Las Palmas','Descripción de Barrio Las Palmas','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(61,3,13,'Barrio El Centro','Descripción de Barrio El Centro','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(62,3,13,'Barrio El Edén','Descripción de Barrio El Edén','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(63,3,13,'Barrio La Planeta','Descripción de Barrio La Planeta','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(64,3,13,'Barrio El Paraíso','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(65,3,13,'Barrio La Esperanza','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 02:01:38',NULL,'2024-04-25 02:01:38'),(66,3,14,'Agua Salada','Descripción de Barrio El Centro','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(67,3,14,'Cantoral','Descripción de Barrio El Edén','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(68,3,14,'Comayagua','Descripción de Barrio La Planeta','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(69,3,14,'El Ciruelo','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(70,3,14,'Cacahuapa','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(71,3,15,'Flores','Descripción de Barrio El Centro','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(72,3,15,'Las Botijas','Descripción de Barrio El Edén','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(73,3,15,'Los Cimientos','Descripción de Barrio La Planeta','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(74,3,15,'Potrero Granda','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(75,3,15,'Protección','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(76,4,16,'Calzontes','Descripción de Barrio El Centro','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(77,4,16,'El Callejón','Descripción de Barrio El Edén','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(78,4,16,'Oromilaca','Descripción de Barrio La Planeta','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(79,4,16,'Quezailica','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(80,4,16,'Santa Rosa de Copán','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(81,4,17,'Agua Buena','Descripción de Barrio El Centro','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(82,4,17,'Buenos Aires','Descripción de Barrio El Edén','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(83,4,17,'La Unión','Descripción de Barrio La Planeta','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(84,4,17,'Los Pozos','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(85,4,17,'Quebrada Seca','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(86,4,18,'Barbasqueadero','Descripción de Barrio El Centro','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(87,4,18,'Agua Caliente','Descripción de Barrio El Edén','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(88,4,18,'Agua Buena Arriba','Descripción de Barrio La Planeta','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(89,4,18,'Carrizalón','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(90,4,18,'Boca del Monte','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(91,4,19,'Capucas','Descripción de Barrio El Centro','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(92,4,19,'Jimilile','Descripción de Barrio El Edén','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(93,4,19,'Gualme','Descripción de Barrio La Planeta','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(94,4,19,'Corquín','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(95,4,19,'El Carrizal','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(96,4,20,'La Cebratana','Descripción de Barrio El Centro','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(97,4,20,'La Laguna Negra','Descripción de Barrio El Edén','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(98,4,20,'La Majada','Descripción de Barrio La Planeta','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(99,4,20,'Las Sandías','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(100,4,20,'Los Pozos','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(101,5,21,'Artemisales','Descripción de Barrio El Centro','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(102,5,21,'Bañaderos o Guadalupe','Descripción de Barrio El Edén','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(103,5,21,'Berlín','Descripción de Barrio La Planeta','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(104,5,21,'Buena Vista','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(105,5,21,'Chotepe','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 02:49:34',NULL,'2024-04-25 02:49:34'),(106,5,22,'Bajamar','Descripción de Barrio El Centro','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(107,5,22,'Baracoa','Descripción de Barrio El Edén','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(108,5,22,'Barra de Chamelecón','Descripción de Barrio La Planeta','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(109,5,22,'Calán','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(110,5,22,'Chameleconcito','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(111,5,23,'Banderas','Descripción de Barrio El Centro','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(112,5,23,'Choloma','Descripción de Barrio El Edén','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(113,5,23,'El Chorrerón','Descripción de Barrio La Planeta','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(114,5,23,'El Guanacaste','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(115,5,23,'El Higuero','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(116,5,24,'Calán Alto','Descripción de Barrio El Centro','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(117,5,24,'Campo Dos Caminos','Descripción de Barrio El Edén','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(118,5,24,'El Cuábano','Descripción de Barrio La Planeta','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(119,5,24,'El Marañó','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(120,5,24,'El Milagro','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(121,5,25,'La Lima','Descripción de Barrio El Centro','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(122,5,25,'Cruz de Valencia','Descripción de Barrio El Edén','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(123,5,25,'El Paraíso','Descripción de Barrio La Planeta','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(124,5,25,'Flor de Oriente','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(125,5,25,'Flor de Oriente','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(126,6,26,'Agua Caliente de Linaca','Descripción de Barrio El Centro','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(127,6,26,'Choluteca','Descripción de Barrio El Edén','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(128,6,26,'Copal Abajo','Descripción de Barrio La Planeta','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(129,6,26,'Copal Arriba','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(130,6,26,'El Carrizo','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(131,6,27,'Concepción El Brasilar','Descripción de Barrio El Centro','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(132,6,27,'San Juan Bosco','Descripción de Barrio El Edén','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(133,6,27,'San Antonio de Papua','Descripción de Barrio La Planeta','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(134,6,27,'La Ermita, Marilica','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(135,6,27,'El Espinal','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(136,6,28,'San Marcos de Colón','Descripción de Barrio El Centro','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(137,6,28,'Cacamuya','Descripción de Barrio El Edén','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(138,6,28,'Caire','Descripción de Barrio La Planeta','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(139,6,28,'Comalí','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(140,6,28,'El Ojo de Agua','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(141,6,29,'El Polvo','Descripción de Barrio El Centro','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(142,6,29,'El Tular','Descripción de Barrio El Edén','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(143,6,29,'El Chilcal','Descripción de Barrio La Planeta','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(144,6,29,'Paso de Vela','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(145,6,29,'Buena Fe','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(146,6,30,'Marcovia ','Descripción de Barrio El Centro','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(147,6,30,'Cedeño','Descripción de Barrio El Edén','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(148,6,30,'Colonia Buena Vista','Descripción de Barrio La Planeta','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(149,6,30,'El Botadero','Descripción de Barrio El Paraíso','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(150,6,30,'El Obraje','Descripción de Barrio La Esperanza','A','Admin','2024-04-25 05:07:24',NULL,'2024-04-25 05:07:24'),(151,22,91,'AldeaActiva','AldeaActiva','A','HARU','2024-04-26 01:28:09',NULL,'2024-04-26 01:28:09'),(152,23,91,'AldeaInactiva','AldeaInactiva','A','HARU','2024-04-26 01:28:58',NULL,'2024-04-26 01:28:58');
/*!40000 ALTER TABLE `tbl_aldeas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_apoyo_actividad_externa`
--

DROP TABLE IF EXISTS `tbl_apoyo_actividad_externa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_apoyo_actividad_externa` (
  `id_apoyo_ext` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `recibe_apoyo_prodagrícola` enum('S','N') DEFAULT NULL,
  `atencion_por_UAG` enum('S','N') DEFAULT NULL,
  `productos_vendidospor_pralesc` enum('S','N') DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id_apoyo_ext`),
  KEY `fk_id_ficha_apoyo_actividad_extern` (`id_ficha`),
  KEY `fk_id_productor_apoyo_actividad_extern` (`id_productor`),
  CONSTRAINT `fk_id_ficha_apoyo_actividad_extern` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  CONSTRAINT `fk_id_productor_apoyo_actividad_extern` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_apoyo_actividad_externa`
--

LOCK TABLES `tbl_apoyo_actividad_externa` WRITE;
/*!40000 ALTER TABLE `tbl_apoyo_actividad_externa` DISABLE KEYS */;
INSERT INTO `tbl_apoyo_actividad_externa` VALUES (6,1,12,'S','S','S',NULL,'HARU','2024-04-26 00:00:59',NULL,'2024-04-26 00:00:59','A'),(7,2,13,'S','S','S',NULL,'HARU','2024-04-26 02:20:30',NULL,'2024-04-26 02:20:30','A'),(8,3,14,'S','S','S',NULL,'HARU','2024-04-26 02:20:30',NULL,'2024-04-26 02:20:30','A'),(9,4,15,'S','S','S',NULL,'HARU','2024-04-26 02:20:30','HARU','2024-04-26 02:31:45','A'),(10,5,16,'S','S','S',NULL,'HARU','2024-04-27 03:26:13',NULL,'2024-04-27 03:26:13','A'),(11,9,20,'S','S','S',NULL,'HARU','2024-05-01 02:42:24',NULL,'2024-05-01 02:42:24','A'),(12,11,22,'S','S','S',NULL,'HARU','2024-05-01 02:42:24','HARU','2024-05-01 04:19:29','A');
/*!40000 ALTER TABLE `tbl_apoyo_actividad_externa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_apoyo_tipo_organizacion`
--

DROP TABLE IF EXISTS `tbl_apoyo_tipo_organizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_apoyo_tipo_organizacion` (
  `id_ficha` int(11) DEFAULT NULL,
  `id_productor` int(11) DEFAULT NULL,
  `id_tipo_organizacion` int(11) DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` varchar(50) DEFAULT NULL,
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_apoyo_tipo_organizacion`
--

LOCK TABLES `tbl_apoyo_tipo_organizacion` WRITE;
/*!40000 ALTER TABLE `tbl_apoyo_tipo_organizacion` DISABLE KEYS */;
INSERT INTO `tbl_apoyo_tipo_organizacion` VALUES (1,12,1,'HARU','2024-04-25 18:00:59',NULL,NULL,'A'),(1,12,2,'HARU','2024-04-25 18:00:59',NULL,NULL,'A'),(1,12,5,'HARU','2024-04-25 18:00:59',NULL,NULL,'A'),(2,13,1,'HARU','2024-04-25 20:20:30',NULL,NULL,'A'),(3,14,1,'HARU','2024-04-25 20:20:30',NULL,NULL,'A'),(4,15,1,'HARU','2024-04-25 20:31:45',NULL,NULL,'A'),(5,16,9,'HARU','2024-04-26 21:26:13',NULL,NULL,'A'),(9,20,9,'HARU','2024-04-30 20:42:25',NULL,NULL,'A'),(11,22,9,'HARU','2024-04-30 22:19:30',NULL,NULL,'A');
/*!40000 ALTER TABLE `tbl_apoyo_tipo_organizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_apoyos`
--

DROP TABLE IF EXISTS `tbl_apoyos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_apoyos` (
  `id_apoyo_produccion` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_apoyo_produccion` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_apoyo_produccion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_apoyos`
--

LOCK TABLES `tbl_apoyos` WRITE;
/*!40000 ALTER TABLE `tbl_apoyos` DISABLE KEYS */;
INSERT INTO `tbl_apoyos` VALUES (1,'Gobierno','Ayuda que da el gobierno',NULL,'2024-04-25 20:17:17',NULL,'2024-04-25 20:17:17','ACTIVO'),(2,'ONG','Organismo internacional','Daniela','2024-04-25 20:17:47','Daniela','2024-04-25 20:17:47','INACTIVO'),(3,'Amigo','Ayuda de un amigo','HAru','2024-04-25 20:18:02','Haru','2024-04-25 20:18:02','ACTIVO'),(4,'Cooperativa','Ayuda de alguna cooperativa','Haru','2024-04-25 20:19:00','Haru','2024-04-25 20:19:00','ACTIVO'),(5,'APActiva','APActiva','Daniela','2024-04-26 01:50:54','Daniela','2024-04-26 01:50:54','ACTIVO'),(6,'APInactiva','APInactiva','Daniela','2024-04-26 01:51:13','Daniela','2024-04-26 01:51:13','INACTIVO');
/*!40000 ALTER TABLE `tbl_apoyos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_apoyos_produccion`
--

DROP TABLE IF EXISTS `tbl_apoyos_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_apoyos_produccion` (
  `id_apoyo_prod` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_apoyo_produccion` bigint(20) NOT NULL,
  `otros_detalles` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id_apoyo_prod`),
  KEY `fk_id_ficha_apoyos_produccion` (`id_ficha`),
  KEY `fk_id_productor_apoyos_produccion` (`id_productor`),
  KEY `fk_id_apoyo_produccion` (`id_apoyo_produccion`),
  CONSTRAINT `fk_id_ficha_apoyos_produccion` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  CONSTRAINT `fk_id_productor_apoyos_produccion` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_apoyos_produccion`
--

LOCK TABLES `tbl_apoyos_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_apoyos_produccion` DISABLE KEYS */;
INSERT INTO `tbl_apoyos_produccion` VALUES (4,1,12,13,NULL,NULL,'HARU','2024-04-26 00:00:59',NULL,'2024-04-26 00:00:59','A'),(5,1,12,14,NULL,NULL,'HARU','2024-04-26 00:00:59',NULL,'2024-04-26 00:00:59','A'),(6,1,12,15,NULL,NULL,'HARU','2024-04-26 00:00:59',NULL,'2024-04-26 00:00:59','A'),(7,2,13,17,NULL,NULL,'HARU','2024-04-26 02:20:30',NULL,'2024-04-26 02:20:30','A'),(8,3,14,17,NULL,NULL,'HARU','2024-04-26 02:20:30',NULL,'2024-04-26 02:20:30','A'),(11,4,15,17,NULL,NULL,'HARU','2024-04-26 02:31:45',NULL,'2024-04-26 02:31:45','A'),(12,5,16,1,NULL,NULL,'HARU','2024-04-27 03:26:13',NULL,'2024-04-27 03:26:13','A'),(13,9,20,1,NULL,NULL,'HARU','2024-05-01 02:42:24',NULL,'2024-05-01 02:42:24','A'),(14,9,20,2,NULL,NULL,'HARU','2024-05-01 02:42:24',NULL,'2024-05-01 02:42:24','A'),(18,11,22,1,NULL,NULL,'HARU','2024-05-01 04:19:29',NULL,'2024-05-01 04:19:29','A'),(19,11,22,3,NULL,NULL,'HARU','2024-05-01 04:19:29',NULL,'2024-05-01 04:19:29','A');
/*!40000 ALTER TABLE `tbl_apoyos_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_base_organizacion`
--

DROP TABLE IF EXISTS `tbl_base_organizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_base_organizacion` (
  `id_pertenece_organizacion` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ficha` bigint(20) NOT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `pertenece_a_organizacion` enum('S','N') DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id_pertenece_organizacion`),
  KEY `fk_id_productor_base_organizacion` (`id_productor`),
  KEY `fk_id_ficha_base_organizacion` (`id_ficha`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_base_organizacion`
--

LOCK TABLES `tbl_base_organizacion` WRITE;
/*!40000 ALTER TABLE `tbl_base_organizacion` DISABLE KEYS */;
INSERT INTO `tbl_base_organizacion` VALUES (12,1,12,'S',NULL,'HARU','2024-04-25 23:48:26',NULL,'2024-04-25 23:48:26','A'),(13,2,13,'S',NULL,'HARU','2024-04-26 02:03:18','HARU','2024-04-27 03:49:22','A'),(14,3,14,'S',NULL,'HARU','2024-04-26 02:03:18','HARU','2024-04-27 03:47:02','A'),(15,4,15,'S',NULL,'HARU','2024-04-26 02:03:18','HARU','2024-04-27 03:37:54','A'),(16,5,16,'N',NULL,'HARU','2024-04-27 03:17:09','HARU','2024-05-01 02:21:36','A'),(17,6,17,'N',NULL,'HARU','2024-05-01 02:27:41',NULL,'2024-05-01 02:27:41','A'),(18,7,18,'S',NULL,'HARU','2024-05-01 02:31:23',NULL,'2024-05-01 02:31:23','A'),(19,8,19,'N',NULL,'HARU','2024-05-01 02:34:08',NULL,'2024-05-01 02:34:08','A'),(20,9,20,'S',NULL,'HARU','2024-05-01 02:40:23',NULL,'2024-05-01 02:40:23','A'),(21,10,21,'S',NULL,'HARU','2024-05-01 02:40:23',NULL,'2024-05-01 02:40:23','A'),(22,11,22,'S',NULL,'HARU','2024-05-01 02:40:23','HARU','2024-05-01 04:39:27','A');
/*!40000 ALTER TABLE `tbl_base_organizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cacerios`
--

DROP TABLE IF EXISTS `tbl_cacerios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cacerios` (
  `Id_Cacerio` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_Aldea` bigint(20) NOT NULL,
  `Id_Municipio` bigint(20) NOT NULL,
  `Id_Departamento` bigint(20) NOT NULL,
  `Nombre_Cacerio` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estado` enum('A','I') DEFAULT NULL,
  `Creado_Por` varchar(25) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Modificado_Por` varchar(25) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Id_Cacerio`),
  KEY `fk_aldea_cacerios` (`Id_Aldea`),
  KEY `fk_municipio_cacerios` (`Id_Municipio`),
  KEY `fk_departamento_cacerios` (`Id_Departamento`),
  CONSTRAINT `fk_aldea_cacerios` FOREIGN KEY (`Id_Aldea`) REFERENCES `tbl_aldeas` (`Id_Aldea`),
  CONSTRAINT `fk_departamento_cacerios` FOREIGN KEY (`Id_Departamento`) REFERENCES `tbl_departamentos` (`Id_Departamento`),
  CONSTRAINT `fk_municipio_cacerios` FOREIGN KEY (`Id_Municipio`) REFERENCES `tbl_municipios` (`Id_Municipio`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cacerios`
--

LOCK TABLES `tbl_cacerios` WRITE;
/*!40000 ALTER TABLE `tbl_cacerios` DISABLE KEYS */;
INSERT INTO `tbl_cacerios` VALUES (1,1,1,1,'El Trapiche','Descripción de El Trapiche','A','Admin','2024-04-25 05:15:03',NULL,'2024-04-25 05:15:03'),(2,2,1,1,'La Laguneta','Descripción de La Laguneta','A','Admin','2024-04-25 05:15:03',NULL,'2024-04-25 05:15:03'),(3,26,6,2,'Caserío de Trujillo 1','Caserío de Trujillo 1','A','Haru','2024-04-25 05:19:25','Haru','2024-04-25 05:19:25'),(4,27,6,2,'Caserío de Trujillo 2','Caserío de Trujillo 2','A','Haru','2024-04-25 05:19:25','Haru','2024-04-25 05:19:25'),(5,51,11,3,'Col. INCEHSA','Col. INCEHSA','A','Haru','2024-04-26 00:20:54','Haru','2024-04-25 05:28:17'),(6,51,11,3,'Bo. La Zarcita','Bo. La Zarcita','A','Haru','2024-04-25 05:28:17','Haru','2024-04-25 05:28:17');
/*!40000 ALTER TABLE `tbl_cacerios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_composicion`
--

DROP TABLE IF EXISTS `tbl_composicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_composicion` (
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_composicion` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_productor` bigint(20) DEFAULT NULL,
  `genero` enum('Hombre','Mujer') DEFAULT NULL,
  `edad` varchar(10) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `creado_por` varchar(25) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(25) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`id_composicion`),
  KEY `fk_id_ficha_composicion` (`id_ficha`),
  KEY `fk_id_producto_composicionr` (`id_productor`),
  CONSTRAINT `fk_id_ficha_composicion` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  CONSTRAINT `fk_id_producto_composicionr` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_composicion`
--

LOCK TABLES `tbl_composicion` WRITE;
/*!40000 ALTER TABLE `tbl_composicion` DISABLE KEYS */;
INSERT INTO `tbl_composicion` VALUES (1,20,12,'Hombre','11-20',2,'HARU','2024-04-25 23:48:48',NULL,'2024-04-25 23:48:48','A'),(1,21,12,'Mujer','41-50',1,'HARU','2024-04-25 23:48:48',NULL,'2024-04-25 23:48:48','A'),(1,22,12,'Hombre','41-50',1,'HARU','2024-04-25 23:48:48',NULL,'2024-04-25 23:48:48','A'),(4,39,15,'Mujer','0-10',1,'HARU','2024-04-27 03:37:55',NULL,'2024-04-27 03:37:55','A'),(4,40,15,'Hombre','11-20',1,'HARU','2024-04-27 03:37:55',NULL,'2024-04-27 03:37:55','A'),(4,41,15,'Hombre','41-50',1,'HARU','2024-04-27 03:37:55',NULL,'2024-04-27 03:37:55','A'),(3,48,14,'Mujer','0-10',1,'HARU','2024-04-27 03:47:03',NULL,'2024-04-27 03:47:03','A'),(3,49,14,'Hombre','11-20',1,'HARU','2024-04-27 03:47:03',NULL,'2024-04-27 03:47:03','A'),(3,50,14,'Hombre','41-50',1,'HARU','2024-04-27 03:47:03',NULL,'2024-04-27 03:47:03','A'),(2,51,13,'Mujer','0-10',1,'HARU','2024-04-27 03:49:23',NULL,'2024-04-27 03:49:23','A'),(2,52,13,'Hombre','11-20',1,'HARU','2024-04-27 03:49:23',NULL,'2024-04-27 03:49:23','A'),(2,53,13,'Hombre','41-50',1,'HARU','2024-04-27 03:49:23',NULL,'2024-04-27 03:49:23','A'),(5,61,16,'Mujer','0-10',34,'HARU','2024-05-01 02:21:37',NULL,'2024-05-01 02:21:37','A'),(7,62,18,'Mujer','0-10',2,'HARU','2024-05-01 02:31:27',NULL,'2024-05-01 02:31:27','A'),(9,63,20,'Mujer','11-20',2,'HARU','2024-05-01 02:40:27',NULL,'2024-05-01 02:40:27','A'),(10,64,21,'Mujer','11-20',2,'HARU','2024-05-01 02:40:27',NULL,'2024-05-01 02:40:27','A'),(11,68,22,'Mujer','11-20',2,'HARU','2024-05-01 04:39:28',NULL,'2024-05-01 04:39:28','A');
/*!40000 ALTER TABLE `tbl_composicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_credito_produccion`
--

DROP TABLE IF EXISTS `tbl_credito_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_credito_produccion` (
  `id_credpro` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `ha_solicitado_creditos` enum('S','N') DEFAULT NULL,
  `id_fuente_credito` bigint(20) DEFAULT NULL,
  `monto_credito` decimal(10,2) DEFAULT NULL,
  `id_motivos_no_credito` bigint(20) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id_credpro`),
  KEY `fk_id_fuente_credito` (`id_fuente_credito`),
  KEY `fk_id_ficha_credito_produccion` (`id_ficha`),
  KEY `fk_id_productor_credito_produccion` (`id_productor`),
  KEY `fk_id_motivos_no_credito` (`id_motivos_no_credito`),
  CONSTRAINT `fk_id_ficha_credito_produccion` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  CONSTRAINT `fk_id_fuente_credito` FOREIGN KEY (`id_fuente_credito`) REFERENCES `tbl_fuentes_credito` (`id_fuente_credito`),
  CONSTRAINT `fk_id_motivos_no_credito` FOREIGN KEY (`id_motivos_no_credito`) REFERENCES `tbl_motivos_no_creditos` (`id_motivos_no_credito`),
  CONSTRAINT `fk_id_productor_credito_produccion` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_credito_produccion`
--

LOCK TABLES `tbl_credito_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_credito_produccion` DISABLE KEYS */;
INSERT INTO `tbl_credito_produccion` VALUES (13,1,12,'S',1,NULL,NULL,NULL,'HARU','2024-04-25 23:59:15',NULL,'2024-04-25 23:59:15','A'),(14,1,12,'S',2,NULL,NULL,NULL,'HARU','2024-04-25 23:59:15',NULL,'2024-04-25 23:59:15','A'),(15,1,12,'S',5,NULL,NULL,NULL,'HARU','2024-04-25 23:59:15',NULL,'2024-04-25 23:59:15','A'),(21,9,20,'S',7,NULL,NULL,NULL,'HARU','2024-05-01 02:42:00',NULL,'2024-05-01 02:42:00','A'),(24,11,22,'S',7,NULL,NULL,NULL,'HARU','2024-05-01 04:21:51',NULL,'2024-05-01 04:21:51','A');
/*!40000 ALTER TABLE `tbl_credito_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_departamentos`
--

DROP TABLE IF EXISTS `tbl_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_departamentos` (
  `Id_Departamento` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nombre_Departamento` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Creado_Por` varchar(25) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(25) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`Id_Departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_departamentos`
--

LOCK TABLES `tbl_departamentos` WRITE;
/*!40000 ALTER TABLE `tbl_departamentos` DISABLE KEYS */;
INSERT INTO `tbl_departamentos` VALUES (1,'Atlántida','Departamento en la costa norte de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(2,'Colón','Departamento en la costa norte de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(3,'Comayagua','Departamento en la región central de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(4,'Copán','Departamento en el occidente de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(5,'Cortés','Departamento en la costa norte de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(6,'Choluteca','Departamento en el sur de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(7,'El Paraíso','Departamento en el oriente de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(8,'Francisco Morazán','Departamento en la región central de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(9,'Gracias a Dios','Departamento en el oriente de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(10,'Intibucá','Departamento en el occidente de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(11,'Islas de la Bahía','Departamento en el norte de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(12,'La Paz','Departamento en la región central de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(13,'Lempira','Departamento en el occidente de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(14,'Ocotepeque','Departamento en el occidente de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(15,'Olancho','Departamento en el oriente de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(16,'Santa Bárbara','Departamento en el occidente de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(17,'Valle','Departamento en el sur de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(18,'Yoro','Departamento en el norte de Honduras','Admin','2024-04-25 00:00:26',NULL,'2024-04-25 00:00:26','A'),(22,'DepartamentoACtivo','Activo','HARU','2024-04-26 01:20:13',NULL,'2024-04-26 01:20:13','A'),(23,'DepartamentoInactivo','Inactivo','HARU','2024-04-26 01:20:54','HARU','2024-04-26 01:21:04','I');
/*!40000 ALTER TABLE `tbl_departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_etnias`
--

DROP TABLE IF EXISTS `tbl_etnias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_etnias` (
  `id_etnia` bigint(11) NOT NULL AUTO_INCREMENT,
  `etnia` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_etnia`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_etnias`
--

LOCK TABLES `tbl_etnias` WRITE;
/*!40000 ALTER TABLE `tbl_etnias` DISABLE KEYS */;
INSERT INTO `tbl_etnias` VALUES (1,'Lenca','Prueba','Usuario1','2023-12-11 20:37:01','Usuario1','2023-12-11 20:37:01','A'),(2,'Pech','Descripción de Etnia 2','Usuario2','2023-12-11 20:40:44','Usuario2','2023-12-11 20:40:44','A'),(3,'Tolupanes','Descripción de Etnia 3','Usuario3','2023-12-11 20:41:13','Usuario3','2023-12-11 20:41:13','A'),(4,'Garífunas','Descripción de Etnia 4','Usuario4','2023-12-11 20:38:19','Usuario4','2023-12-11 20:38:19','A'),(5,'Maya Chortís','Descripción de Etnia 5','Usuario5','2023-12-11 20:41:19','Usuario5','2023-12-11 20:41:19','A'),(6,'Tawahkas','Descripción de Etnia 6','Usuario6','2023-12-11 20:38:42','Usuario6','2023-12-11 20:38:42','A'),(7,'Misquitos','Descripción de Etnia 7','Usuario7','2023-12-11 20:38:52','Usuario7','2023-12-11 20:38:52','A'),(8,'Nahua','Descripción de Etnia 8','Usuario8','2023-12-11 20:41:25','Usuario8','2023-12-11 20:41:25','A'),(9,'Ladino','Descripción de Etnia 9','Usuario9','2023-12-11 20:39:08','Usuario9','2023-12-11 20:39:08','A'),(10,'Negro habla inglesa','Descripción de Etnia 10','Usuario10','2023-12-11 20:41:33','Usuario10','2023-12-11 20:41:33','A'),(11,'Otros(Especifique)','Descripción de Etnia 11','Usuario11','2023-12-11 20:41:38','Usuario11','2023-12-11 20:41:38','A'),(13,'','','usuario1','1970-01-01 07:00:00','usuario1','2024-02-26 04:19:49','');
/*!40000 ALTER TABLE `tbl_etnias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_etnias_por_productor`
--

DROP TABLE IF EXISTS `tbl_etnias_por_productor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_etnias_por_productor` (
  `Id_etnicidad` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_etnia` bigint(20) NOT NULL,
  `detalle_de_otros` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`Id_etnicidad`),
  KEY `id_productor` (`id_productor`),
  KEY `id_etnia` (`id_etnia`),
  KEY `fk_etnias_fichas` (`id_ficha`),
  CONSTRAINT `fk_etnias_fichas` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  CONSTRAINT `tbl_etnias_por_productor_ibfk_1` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`),
  CONSTRAINT `tbl_etnias_por_productor_ibfk_2` FOREIGN KEY (`id_etnia`) REFERENCES `tbl_etnias` (`id_etnia`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_etnias_por_productor`
--

LOCK TABLES `tbl_etnias_por_productor` WRITE;
/*!40000 ALTER TABLE `tbl_etnias_por_productor` DISABLE KEYS */;
INSERT INTO `tbl_etnias_por_productor` VALUES (10,1,12,6,'0',NULL,'HARU','2024-04-25 23:48:52',NULL,'2024-04-25 23:48:52','A'),(11,2,13,1,'',NULL,'HARU','2024-04-26 02:08:10','HARU','2024-04-27 03:49:24','A'),(12,3,14,1,'',NULL,'HARU','2024-04-26 02:08:10','HARU','2024-04-27 03:47:04','A'),(13,4,15,2,'',NULL,'HARU','2024-04-26 02:08:10','HARU','2024-04-27 03:37:56','A'),(14,5,16,6,'',NULL,'HARU','2024-04-27 03:17:15','HARU','2024-05-01 02:21:38','A'),(16,7,18,1,'0',NULL,'HARU','2024-05-01 02:31:29',NULL,'2024-05-01 02:31:29','A'),(18,9,20,1,'0',NULL,'HARU','2024-05-01 02:40:29',NULL,'2024-05-01 02:40:29','A'),(19,10,21,1,'0',NULL,'HARU','2024-05-01 02:40:29',NULL,'2024-05-01 02:46:17','A'),(20,11,22,1,'',NULL,'HARU','2024-05-01 02:40:29','HARU','2024-05-01 04:39:29','A');
/*!40000 ALTER TABLE `tbl_etnias_por_productor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fuentes_credito`
--

DROP TABLE IF EXISTS `tbl_fuentes_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_fuentes_credito` (
  `id_fuente_credito` bigint(20) NOT NULL AUTO_INCREMENT,
  `fuente_credito` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`id_fuente_credito`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fuentes_credito`
--

LOCK TABLES `tbl_fuentes_credito` WRITE;
/*!40000 ALTER TABLE `tbl_fuentes_credito` DISABLE KEYS */;
INSERT INTO `tbl_fuentes_credito` VALUES (1,'Banca','Bancos','usuario1','2024-04-27 03:21:40','usuario1','2024-04-27 03:21:40','I'),(2,'Amigos','Amigos cercanos','usuario1','2024-04-27 03:21:40','usuario1','2024-04-27 03:21:40','I'),(3,'Familia','Familiares','usuario1','2024-04-27 03:21:40','usuario1','2024-04-27 03:21:40','I'),(4,'Cooperativa','Cooperativas','usuario1','2024-04-27 03:21:40','usuario1','2024-04-27 03:21:40','I'),(5,'Prestamistas','Prestamistas','usuario1','2024-04-27 03:21:40','usuario1','2024-04-27 03:21:40','I'),(6,'Microfinanciera','Microfinanciera','usuario1','2024-04-27 03:21:40','usuario1','2024-04-27 03:21:40','I'),(7,'Fuente de credito','Fuente de credito','usuario1','2024-04-27 03:21:19','usuario1','2024-04-27 03:21:19','A');
/*!40000 ALTER TABLE `tbl_fuentes_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ingreso_familiar`
--

DROP TABLE IF EXISTS `tbl_ingreso_familiar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ingreso_familiar` (
  `Id_Ficha` bigint(20) DEFAULT NULL,
  `Id_Productor` bigint(20) DEFAULT NULL,
  `Id_Ingreso_Familiar` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_Tipo_Negocio` bigint(20) DEFAULT NULL,
  `Total_Ingreso` decimal(10,2) DEFAULT NULL,
  `Id_Periodo_Ingreso` bigint(20) DEFAULT NULL,
  `Descripcion_Otros` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Creado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`Id_Ingreso_Familiar`),
  KEY `FK_Id_Productor_Ingreso_Familiar` (`Id_Productor`),
  KEY `FK_Id_Tipo_Negocio_Ingreso_Familiar` (`Id_Tipo_Negocio`),
  KEY `FK_Id_Periodo_Ingreso_Ingreso_Familiar` (`Id_Periodo_Ingreso`),
  KEY `FK_Id_Ficha_Ingreso_Familiar` (`Id_Ficha`),
  CONSTRAINT `FK_Id_Ficha_Ingreso_Familiar` FOREIGN KEY (`Id_Ficha`) REFERENCES `fichas` (`id_ficha`),
  CONSTRAINT `FK_Id_Productor_Ingreso_Familiar` FOREIGN KEY (`Id_Productor`) REFERENCES `tbl_productor` (`id_productor`),
  CONSTRAINT `FK_Id_Tipo_Negocio_Ingreso_Familiar` FOREIGN KEY (`Id_Tipo_Negocio`) REFERENCES `tbl_tipo_negocios` (`id_tipo_negocio`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ingreso_familiar`
--

LOCK TABLES `tbl_ingreso_familiar` WRITE;
/*!40000 ALTER TABLE `tbl_ingreso_familiar` DISABLE KEYS */;
INSERT INTO `tbl_ingreso_familiar` VALUES (1,12,9,4,523100.00,NULL,NULL,NULL,'HARU','2024-04-25 23:58:28',NULL,'2024-04-25 23:58:28','A'),(1,12,10,8,10000.00,NULL,NULL,NULL,'HARU','2024-04-25 23:58:28',NULL,'2024-04-25 23:58:28','A'),(4,15,16,14,100.00,NULL,NULL,NULL,'HARU','2024-04-27 03:39:20','HARU','2024-04-27 03:39:20','A'),(3,14,19,14,100.00,NULL,NULL,NULL,'HARU','2024-04-27 03:48:07','HARU','2024-04-27 03:48:07','A'),(2,13,20,14,100.00,NULL,NULL,NULL,'HARU','2024-04-27 03:49:42','HARU','2024-04-27 03:49:42','A'),(9,20,21,1,333.00,NULL,NULL,NULL,'HARU','2024-05-01 02:41:57',NULL,'2024-05-01 02:41:57','A'),(11,22,24,1,333.00,NULL,NULL,NULL,'HARU','2024-05-01 04:21:50','HARU','2024-05-01 04:21:50','A');
/*!40000 ALTER TABLE `tbl_ingreso_familiar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_manejo_riego`
--

DROP TABLE IF EXISTS `tbl_manejo_riego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_manejo_riego` (
  `Id_Manejo_Riego` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_Ficha` bigint(20) DEFAULT NULL,
  `Id_Ubicacion` bigint(20) DEFAULT NULL,
  `Id_Productor` bigint(20) DEFAULT NULL,
  `Tiene_Riego` enum('S','N') DEFAULT NULL,
  `Superficie_Riego` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Superficie_Riego` bigint(20) DEFAULT NULL,
  `Id_Tipo_Riego` bigint(20) DEFAULT NULL,
  `Fuente_Agua` varchar(255) DEFAULT NULL,
  `Disponibilidad_Agua_Meses` int(11) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Id_Usuario` bigint(20) DEFAULT NULL,
  `Creado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`Id_Manejo_Riego`),
  KEY `FK_Id_Ficha_Manejo_Riego` (`Id_Ficha`),
  KEY `FK_Id_Ubicacion_Manejo_Riego` (`Id_Ubicacion`),
  KEY `FK_Id_Productor_Manejo_Riego` (`Id_Productor`),
  KEY `FK_Id_Medida_Superficie_Riego` (`Id_Medida_Superficie_Riego`),
  KEY `FK_Id_Tipo_Riego` (`Id_Tipo_Riego`),
  CONSTRAINT `FK_Id_Ficha_Manejo_Riego` FOREIGN KEY (`Id_Ficha`) REFERENCES `fichas` (`id_ficha`),
  CONSTRAINT `FK_Id_Productor_Manejo_Riego` FOREIGN KEY (`Id_Productor`) REFERENCES `tbl_productor` (`id_productor`),
  CONSTRAINT `FK_Id_Tipo_Riego` FOREIGN KEY (`Id_Tipo_Riego`) REFERENCES `tbl_tipo_riego` (`id_tipo_riego`),
  CONSTRAINT `FK_Id_Ubicacion_Manejo_Riego` FOREIGN KEY (`Id_Ubicacion`) REFERENCES `tbl_ubicacion_productor` (`id_ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_manejo_riego`
--

LOCK TABLES `tbl_manejo_riego` WRITE;
/*!40000 ALTER TABLE `tbl_manejo_riego` DISABLE KEYS */;
INSERT INTO `tbl_manejo_riego` VALUES (7,1,7,12,'S',15.00,8,3,'SANNA',8,NULL,NULL,'HARU','2024-04-25 23:52:48',NULL,'2024-04-25 23:52:48','A'),(8,2,8,13,'S',100.00,2,2,'fuente de agua',100,NULL,NULL,'HARU','2024-04-26 02:12:07',NULL,'2024-04-26 02:12:07','A'),(9,3,9,14,'S',100.00,2,2,'fuente de agua',100,NULL,NULL,'HARU','2024-04-26 02:12:07',NULL,'2024-04-26 02:12:07','A'),(10,4,10,15,'S',100.00,2,2,'fuente de agua',100,NULL,NULL,'HARU','2024-04-26 02:12:07',NULL,'2024-04-26 02:12:07','A'),(11,5,11,16,'S',2332.00,3,4,'pozo comunitario',32,NULL,NULL,'HARU','2024-04-27 03:19:24',NULL,'2024-04-27 03:19:24','A'),(12,9,14,20,'S',11.00,1,1,'44',4,NULL,NULL,'HARU','2024-05-01 02:41:15',NULL,'2024-05-01 02:41:15','A'),(13,10,15,21,'S',11.00,1,1,'44',4,NULL,NULL,'HARU','2024-05-01 02:41:15',NULL,'2024-05-01 02:41:15','A'),(14,11,16,22,'S',11.00,1,1,'44',4,NULL,NULL,'HARU','2024-05-01 02:41:15',NULL,'2024-05-01 02:41:15','A');
/*!40000 ALTER TABLE `tbl_manejo_riego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_medidas_tierra`
--

DROP TABLE IF EXISTS `tbl_medidas_tierra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_medidas_tierra` (
  `id_medida` bigint(20) NOT NULL AUTO_INCREMENT,
  `medida` varchar(25) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_medidas_tierra`
--

LOCK TABLES `tbl_medidas_tierra` WRITE;
/*!40000 ALTER TABLE `tbl_medidas_tierra` DISABLE KEYS */;
INSERT INTO `tbl_medidas_tierra` VALUES (1,'TAREAS','Son 5 tareas',NULL,'2023-11-04 14:08:58',NULL,'2023-11-04 14:08:58','ACTIVO'),(2,'HA','Se compraron 2','Daniela','2024-02-26 03:52:35','Daniela','2024-02-26 03:52:35','ACTIVO'),(3,'MZ','desc','Daniela','2023-12-11 01:56:55','Daniela','2023-12-11 01:56:55','ACTIVO'),(4,'CM','CM (Centimetro)','manu','2023-12-11 01:57:01','manu','2023-12-11 01:57:01','ACTIVO'),(5,'Oz (onza)','Oz (onza)','Daniela','2024-04-25 21:03:54','Daniela','2024-04-25 21:03:54','ACTIVO'),(6,'Kg (kilogramo)','Kg (kilogramo)','Daniela','2024-04-25 21:03:58','Daniela','2024-04-25 21:03:58','ACTIVO'),(7,'Lb (Libra)','Lb (Libra)','Daniela','2024-04-25 21:04:02','Daniela','2024-04-25 21:04:02','ACTIVO'),(8,'KM (Kilómetro)','KM (Kilómetro)','Daniela','2024-04-25 21:04:05','Daniela','2024-04-25 21:04:05','ACTIVO'),(9,'L (Litro)','L (Litro)','Daniela','2024-04-25 21:04:10','Daniela','2024-04-25 21:04:10','ACTIVO'),(10,'Milla (MI)','Milla (MI)','Daniela','2024-04-25 21:04:13','Daniela','2024-04-25 21:04:13','ACTIVO'),(11,'Saco','Saco','Daniela','2024-04-25 21:04:16','Daniela','2024-04-25 21:04:16','ACTIVO'),(12,'Botella','Botella','Daniela','2024-04-25 21:04:19','Daniela','2024-04-25 21:04:19','ACTIVO'),(13,'semanal','semanal','Haru','2024-04-25 21:04:28','Haru','2024-04-25 21:04:28','ACTIVO'),(14,'mensual','mensual','Haru','2024-04-25 21:04:28','Haru','2024-04-25 21:04:28','ACTIVO'),(15,'anual','anual','Haru','2024-04-25 21:05:35','Haru','2024-04-25 21:05:35','ACTIVO'),(16,'','MedidaActiva','Daniela','2024-04-26 01:35:52','Daniela','2024-04-26 01:35:52','ACTIVO'),(17,'','MedidaInactiva','Daniela','2024-04-26 01:37:48','Daniela','2024-04-26 01:37:48','');
/*!40000 ALTER TABLE `tbl_medidas_tierra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_migracion_familiar`
--

DROP TABLE IF EXISTS `tbl_migracion_familiar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_migracion_familiar` (
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_migracion` bigint(20) NOT NULL AUTO_INCREMENT,
  `tiene_migrantes` enum('S','N') DEFAULT NULL,
  `migracion_dentro_pais` enum('S','N') DEFAULT NULL,
  `migracion_fuera_pais` enum('S','N') DEFAULT NULL,
  `id_tipo_motivos` bigint(20) DEFAULT NULL,
  `remesas` enum('S','N') DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`id_migracion`),
  KEY `fk_id_ficha_migracion_familiar` (`id_ficha`),
  KEY `fk_id_productor_migracion_familiar` (`id_productor`),
  KEY `fk_id_tipo_motivos` (`id_tipo_motivos`),
  CONSTRAINT `fk_id_ficha_migracion_familiar` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  CONSTRAINT `fk_id_productor_migracion_familiar` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`),
  CONSTRAINT `fk_id_tipo_motivos` FOREIGN KEY (`id_tipo_motivos`) REFERENCES `tbl_motivos_migracion` (`Id_motivo`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_migracion_familiar`
--

LOCK TABLES `tbl_migracion_familiar` WRITE;
/*!40000 ALTER TABLE `tbl_migracion_familiar` DISABLE KEYS */;
INSERT INTO `tbl_migracion_familiar` VALUES (1,12,38,'S','S','N',1,'S',NULL,'HARU','2024-04-25 23:49:18',NULL,'2024-04-25 23:49:18','A'),(1,12,39,'S','S','N',3,'S',NULL,'HARU','2024-04-25 23:49:18',NULL,'2024-04-25 23:49:18','A'),(3,14,51,'N','N','N',NULL,'N',NULL,'HARU','2024-04-27 03:47:07',NULL,'2024-04-27 03:47:07','A'),(3,14,52,'N','N','N',NULL,'N',NULL,'HARU','2024-04-27 03:47:07',NULL,'2024-04-27 03:47:07','A'),(5,16,69,'N','N','N',NULL,'N',NULL,'HARU','2024-05-01 02:21:40',NULL,'2024-05-01 02:21:40','A'),(5,16,70,'N','N','N',NULL,'N',NULL,'HARU','2024-05-01 02:21:40',NULL,'2024-05-01 02:21:40','A'),(6,17,71,'N','N','N',NULL,'N',NULL,'HARU','2024-05-01 02:27:45',NULL,'2024-05-01 02:27:45','A'),(7,18,72,'N','N','N',NULL,'N',NULL,'HARU','2024-05-01 02:31:34',NULL,'2024-05-01 02:31:34','A'),(8,19,73,'N','N','N',NULL,'N',NULL,'HARU','2024-05-01 02:34:11',NULL,'2024-05-01 02:34:11','A'),(9,20,74,'S','N','S',11,'S',NULL,'HARU','2024-05-01 02:40:40',NULL,'2024-05-01 02:40:40','A'),(10,21,75,'S','N','S',11,'S',NULL,'HARU','2024-05-01 02:40:40',NULL,'2024-05-01 02:40:40','A'),(11,22,81,'S','N','S',11,'S',NULL,'HARU','2024-05-01 04:39:31',NULL,'2024-05-01 04:39:31','A'),(11,22,82,'S','N','S',11,'S',NULL,'HARU','2024-05-01 04:39:31',NULL,'2024-05-01 04:39:31','A');
/*!40000 ALTER TABLE `tbl_migracion_familiar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_motivos_migracion`
--

DROP TABLE IF EXISTS `tbl_motivos_migracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_motivos_migracion` (
  `Id_motivo` bigint(20) NOT NULL AUTO_INCREMENT,
  `Motivo` varchar(255) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Creado_por` varchar(255) DEFAULT NULL,
  `Fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_por` varchar(255) DEFAULT NULL,
  `Fecha_Actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') NOT NULL DEFAULT 'A',
  PRIMARY KEY (`Id_motivo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_motivos_migracion`
--

LOCK TABLES `tbl_motivos_migracion` WRITE;
/*!40000 ALTER TABLE `tbl_motivos_migracion` DISABLE KEYS */;
INSERT INTO `tbl_motivos_migracion` VALUES (1,'Estudio','por el Estudio','Manuel','2023-10-31 03:56:32','Manuel','2024-04-27 03:18:16','I'),(2,'Trabajo','No encuentra Trabajo en el país.','manuel','2023-10-31 04:58:55','manuel','2024-04-27 03:18:16','I'),(3,'Violencia','Violencia familiar o amenazas','Manuel','2023-10-31 05:07:18','Manuel','2024-04-27 03:18:16','I'),(4,'Cambio climático','Cambio climático o desastre natural','Manuel','2023-10-31 05:15:26','Manuel','2024-04-27 03:18:16','I'),(11,'MotivoMigracion','MotivoMigracion','Manuel','2024-04-27 01:34:31','Manuel','2024-04-27 03:18:01','A');
/*!40000 ALTER TABLE `tbl_motivos_migracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_motivos_no_creditos`
--

DROP TABLE IF EXISTS `tbl_motivos_no_creditos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_motivos_no_creditos` (
  `id_motivos_no_credito` bigint(20) NOT NULL AUTO_INCREMENT,
  `motivo_no_credito` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`id_motivos_no_credito`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_motivos_no_creditos`
--

LOCK TABLES `tbl_motivos_no_creditos` WRITE;
/*!40000 ALTER TABLE `tbl_motivos_no_creditos` DISABLE KEYS */;
INSERT INTO `tbl_motivos_no_creditos` VALUES (1,'Estoy en la central de riesgos','Estoy en la central de riesgos','HARU','2024-04-13 15:23:57','Haru','2024-04-27 03:22:45','I'),(2,'Son muchos los requisitos','Son muchos los requisitos','HARU','2024-04-13 15:24:35','Haru','2024-04-27 03:22:45','I'),(3,'No lo he necesitado','No lo he necesitado','Haru','2024-04-25 20:29:27','Haru','2024-04-27 03:22:45','I'),(4,'No tengo capacidad de pago','No tengo capacidad de pago','Haru','2024-04-25 20:29:27','Haru','2024-04-27 03:22:45','I'),(5,'Temor al rechazo ','Temor al rechazo ','Haru','2024-04-25 20:31:10','Haru','2024-04-27 03:22:45','I'),(6,'Temor a no pagarlo ','Temor a no pagarlo ','Haru','2024-04-25 20:31:54','Haru','2024-04-27 03:22:45','I'),(7,'Tasas de interés muy altas ','Tasas de interés muy altas ','Haru','2024-04-25 20:32:24','Haru','2024-04-27 03:22:45','I'),(8,'MNCreActivo','MNCreActivo','HARU','2024-04-26 01:45:15',NULL,'2024-04-26 01:45:15','A'),(9,'MNCreInactivo','MNCreInactivo','HARU','2024-04-26 01:45:29',NULL,'2024-04-27 03:22:45','I');
/*!40000 ALTER TABLE `tbl_motivos_no_creditos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_municipios`
--

DROP TABLE IF EXISTS `tbl_municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_municipios` (
  `Id_Municipio` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_Departamento` bigint(20) NOT NULL,
  `Nombre_Municipio` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Creado_Por` varchar(25) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(25) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`Id_Municipio`),
  KEY `fk_municipios_departamento` (`Id_Departamento`),
  CONSTRAINT `fk_municipios_departamento` FOREIGN KEY (`Id_Departamento`) REFERENCES `tbl_departamentos` (`Id_Departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_municipios`
--

LOCK TABLES `tbl_municipios` WRITE;
/*!40000 ALTER TABLE `tbl_municipios` DISABLE KEYS */;
INSERT INTO `tbl_municipios` VALUES (1,1,'La Ceiba','Descripción de La Ceiba','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 07:31:01','A'),(2,1,'Tela','Descripción de Tela','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 07:31:04','A'),(3,1,'Jutiapa','Descripción de Jutiapa','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(4,1,'La Masica','Descripción de La Masica','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(5,1,'Arizona','Descripción de Arizona','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(6,2,'Trujillo','Descripción de Trujillo','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(7,2,'Tocoa','Descripción de Tocoa','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(8,2,'Sonaguera','Descripción de Sonaguera','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(9,2,'Iriona','Descripción de Iriona','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(10,2,'Santa Fe','Descripción de Santa Fe','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(11,3,'Comayagua','Descripción de Comayagua','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(12,3,'Siguatepeque','Descripción de Siguatepeque','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(13,3,'La Libertad','Descripción de La Libertad','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(14,3,'Ajuterique','Descripción de Ajuterique','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(15,3,'Villa de San Antonio','Descripción de Villa de San Antonio','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(16,4,'Santa Rosa de Copán','Descripción de Santa Rosa de Copán','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(17,4,'La Entrada','Descripción de La Entrada','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(18,4,'Copán Ruinas','Descripción de Copaán Ruinas','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 02:31:01','A'),(19,4,'Corquín','Descripción de Corquín','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(20,4,'San Juan de Opoa','Descripción de San Juan de Opoa','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(21,5,'San Pedro Sula','Descripción de San Pedro Sula','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(22,5,'Puerto Cortés','Descripción de Puerto Cortés','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(23,5,'Choloma','Descripción de Choloma','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(24,5,'Villanueva','Descripción de Villanueva','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(25,5,'La Lima','Descripción de La Lima','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(26,6,'Choluteca','Descripción de Choluteca','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(27,6,'Pespire','Descripción de Pespire','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(28,6,'San Marcos de Colón','Descripción de San Marcos de Colón','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(29,6,'Nacaome','Descripción de Nacaome','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(30,6,'Marcovia','Descripción de Marcovia','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(31,7,'Yuscarán','Descripción de Yuscarán','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(32,7,'Danlí','Descripción de Danlí','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(33,7,'El Paraíso','Descripción de El Paraíso','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(34,7,'Texiguat','Descripción de Texiguat','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(35,7,'Jacaleapa','Descripción de Jacaleapa','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(36,8,'Tegucigalpa','Descripción de Tegucigalpa','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(37,8,'Comayagüela','Descripción de Comayagüela','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(38,8,'Valle de Ángeles','Descripción de Valle de Ángeles','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(39,8,'Santa Lucía','Descripción de Santa Lucía','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(40,8,'Ojojona','Descripción de Ojojona','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(41,9,'Puerto Lempira','Descripción de Puerto Lempira','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(42,9,'Brus Laguna','Descripción de Brus Laguna','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(43,9,'Ahuas','Descripción de Ahuas','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(44,9,'Juan Francisco Bulnes','Descripción de Juan Francisco Bulnes','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(45,9,'Wampusirpe','Descripción de Wampusirpe','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(46,10,'La Esperanza','Descripción de La Esperanza','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(47,10,'Intibucá','Descripción de Intibucá','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(48,10,'Dolores','Descripción de Dolores','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(49,10,'San Juan','Descripción de San Juan','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(50,10,'San Marcos de Sierra','Descripción de San Marcos de Sierra','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(51,11,'Roatán','Descripción de Roatán','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(52,11,'Utila','Descripción de Utila','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(53,11,'Guanaja','Descripción de Guanaja','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(54,11,'José Santos Guardiola','Descripción de José Santos Guardiola','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(55,11,'Santa Elena','Descripción de Santa Elena','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(56,12,'La Paz','Descripción de La Paz','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(57,12,'Marcala','Descripción de Marcala','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(58,12,'Santa Ana','Descripción de Santa Ana','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(59,12,'Yarula','Descripción de Yarula','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(60,12,'Ajuterique','Descripción de Ajuterique','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(61,13,'Gracias','Descripción de Gracias','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(62,13,'La Iguala','Descripción de La Iguala','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(63,13,'Las Flores','Descripción de Las Flores','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(64,13,'La Unión','Descripción de La Unión','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(65,13,'La Virtud','Descripción de La Virtud','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(66,14,'Ocotepeque','Descripción de Ocotepeque','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(67,14,'San Marcos','Descripción de San Marcos','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(68,14,'La Labor','Descripción de La Labor','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(69,14,'Sinuapa','Descripción de Sinuapa','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(70,14,'San Fernando','Descripción de San Fernando','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(71,15,'Juticalpa','Descripción de Juticalpa','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(72,15,'Campamento','Descripción de Campamento','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(73,15,'Catacamas','Descripción de Catacamas','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(74,15,'Guarizama','Descripción de Guarizama','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(75,15,'San Esteban','Descripción de San Esteban','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(76,16,'Santa Bárbara','Descripción de Santa Bárbara','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(77,16,'Arada','Descripción de Arada','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(78,16,'Atima','Descripción de Atima','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(79,16,'Azacualpa','Descripción de Azacualpa','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(80,16,'Ceguaca','Descripción de Ceguaca','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(81,17,'Nacaome','Descripción de Nacaome','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(82,17,'Alianza','Descripción de Alianza','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(83,17,'Amapala','Descripción de Amapala','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(84,17,'Aramecina','Descripción de Aramecina','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(85,17,'Caridad','Descripción de Caridad','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(86,18,'Yoro','Descripción de Yoro','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(87,18,'El Progreso','Descripción de El Progreso','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(88,18,'Morazán','Descripción de Morazán','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(89,18,'Olanchito','Descripción de Olanchito','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(90,18,'Santa Rita','Descripción de Santa Rita','Admin','2024-04-25 00:10:12',NULL,'2024-04-25 00:10:12','A'),(91,22,'Activo','Activo','HARU','2024-04-26 01:23:28',NULL,'2024-04-26 01:23:28','A'),(92,23,'MunicipioInactivo','MunicipioInactivo','HARU','2024-04-26 01:24:05','HARU','2024-04-26 01:25:30','I');
/*!40000 ALTER TABLE `tbl_municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_no_creditos`
--

DROP TABLE IF EXISTS `tbl_no_creditos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_no_creditos` (
  `id_nocred` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_motivos_no_credito` bigint(20) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id_nocred`),
  KEY `fk_id_fichal_no_creditos` (`id_ficha`),
  KEY `fk_id_productorl_no_creditos` (`id_productor`),
  KEY `fk_id_motivos_no_credito1` (`id_motivos_no_credito`),
  CONSTRAINT `fk_id_fichal_no_creditos` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  CONSTRAINT `fk_id_motivos_no_credito1` FOREIGN KEY (`id_motivos_no_credito`) REFERENCES `tbl_motivos_no_creditos` (`id_motivos_no_credito`),
  CONSTRAINT `fk_id_productorl_no_creditos` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_no_creditos`
--

LOCK TABLES `tbl_no_creditos` WRITE;
/*!40000 ALTER TABLE `tbl_no_creditos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_no_creditos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_organizaciones`
--

DROP TABLE IF EXISTS `tbl_organizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_organizaciones` (
  `id_organizacion` bigint(20) NOT NULL AUTO_INCREMENT,
  `organizacion` varchar(255) DEFAULT NULL,
  `id_tipo_organizacion` bigint(20) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`id_organizacion`),
  KEY `fk_tipo_organizacion` (`id_tipo_organizacion`),
  CONSTRAINT `fk_tipo_organizacion` FOREIGN KEY (`id_tipo_organizacion`) REFERENCES `tbl_tipo_organizacion` (`id_tipo_organizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_organizaciones`
--

LOCK TABLES `tbl_organizaciones` WRITE;
/*!40000 ALTER TABLE `tbl_organizaciones` DISABLE KEYS */;
INSERT INTO `tbl_organizaciones` VALUES (1,'Asociación',1,'Cooperativa Sagrada familia','manuel','2024-02-28 04:24:55','manuel','2024-04-27 03:16:48','I'),(2,'Cooperativa',2,'Cooperativa Elga','manuel','2024-02-28 04:26:28','manuel','2024-04-27 03:16:48','I'),(3,'Caja rural',1,'sfsdfsdfs','Kevin','2024-03-18 02:44:11','Kevin','2024-04-27 03:16:48','I'),(4,'Patronato',6,'Patrono','Haru','2024-04-25 21:28:17','haru','2024-04-27 03:16:48','I'),(5,'Junta de agua',7,'Junta de agua','Haru','2024-04-25 21:29:50','Haru','2024-04-27 03:16:48','I'),(8,'Organizacion',1,'Organizacion','Organizacion','2024-04-26 01:31:31','Organizacion','2024-04-27 03:16:28','A');
/*!40000 ALTER TABLE `tbl_organizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_organizaciones_por_productor`
--

DROP TABLE IF EXISTS `tbl_organizaciones_por_productor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_organizaciones_por_productor` (
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_organizacion` bigint(20) NOT NULL,
  `Id_Organizacion_Productor` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`Id_Organizacion_Productor`),
  KEY `fk_organizacion_por_productor` (`id_organizacion`),
  KEY `fk_id_productor` (`id_productor`),
  KEY `id_ficha` (`id_ficha`),
  CONSTRAINT `fk_id_productor` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`),
  CONSTRAINT `fk_organizacion_por_productor` FOREIGN KEY (`id_organizacion`) REFERENCES `tbl_organizaciones` (`id_organizacion`),
  CONSTRAINT `tbl_organizaciones_por_productor_ibfk_1` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_organizaciones_por_productor`
--

LOCK TABLES `tbl_organizaciones_por_productor` WRITE;
/*!40000 ALTER TABLE `tbl_organizaciones_por_productor` DISABLE KEYS */;
INSERT INTO `tbl_organizaciones_por_productor` VALUES (1,12,1,7,NULL,'HARU','2024-04-25 23:48:26',NULL,'2024-04-25 23:48:26','A'),(1,12,3,8,NULL,'HARU','2024-04-25 23:48:26',NULL,'2024-04-25 23:48:26','A'),(1,12,4,9,NULL,'HARU','2024-04-25 23:48:26',NULL,'2024-04-25 23:48:26','A'),(7,18,8,15,NULL,'HARU','2024-05-01 02:31:23',NULL,'2024-05-01 02:31:23','A'),(9,20,8,16,NULL,'HARU','2024-05-01 02:40:23',NULL,'2024-05-01 02:40:23','A'),(10,21,8,17,NULL,'HARU','2024-05-01 02:40:23',NULL,'2024-05-01 02:40:23','A'),(11,22,8,21,NULL,'HARU','2024-05-01 04:39:27',NULL,'2024-05-01 04:39:27','A');
/*!40000 ALTER TABLE `tbl_organizaciones_por_productor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_parametros`
--

DROP TABLE IF EXISTS `tbl_parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_parametros` (
  `id_parametros` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint(20) NOT NULL,
  `parametro` varchar(30) NOT NULL,
  `valor` varchar(20) NOT NULL,
  `Fecha_Creacion` datetime NOT NULL,
  `Fecha_Modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_parametros`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_parametros`
--

LOCK TABLES `tbl_parametros` WRITE;
/*!40000 ALTER TABLE `tbl_parametros` DISABLE KEYS */;
INSERT INTO `tbl_parametros` VALUES (1,1,'admin_dias_vigencia','360','2023-12-09 23:48:41','2023-12-08 23:48:41');
/*!40000 ALTER TABLE `tbl_parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_periodicidad`
--

DROP TABLE IF EXISTS `tbl_periodicidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_periodicidad` (
  `id_periodo` bigint(20) NOT NULL AUTO_INCREMENT,
  `periodo` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_periodicidad`
--

LOCK TABLES `tbl_periodicidad` WRITE;
/*!40000 ALTER TABLE `tbl_periodicidad` DISABLE KEYS */;
INSERT INTO `tbl_periodicidad` VALUES (1,'bimestral','bimestral','Manuel','2023-10-31 19:41:24','Manuel','2023-12-11 01:33:12','A'),(2,'Trimestral','Trimestral',NULL,'2023-10-31 21:03:54',NULL,'2023-12-11 01:33:07','A'),(3,'Cuatrimestral','Cuatrimestral','manu','2023-12-11 01:31:47','manu','2023-12-11 01:31:47','A'),(4,'Semestre','Semestre','manu','2023-12-11 01:32:23','manu','2023-12-11 01:32:23','A'),(5,'Semanal','Semanal','manu','2023-12-11 01:33:15','manu','2023-12-11 01:33:15','A'),(6,'Quincenal','Quincenal','manu','2023-12-11 01:34:18','manu','2023-12-11 01:34:18','A'),(7,'Mensual','Mensual','manu','2023-12-11 01:35:19','manu','2023-12-11 01:35:19','A'),(14,'PerInactivo','PerInactivo','Manuel','2024-04-26 01:43:54','Manuel','2024-04-27 03:20:11','I');
/*!40000 ALTER TABLE `tbl_periodicidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_practicas_por_produccion`
--

DROP TABLE IF EXISTS `tbl_practicas_por_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_practicas_por_produccion` (
  `Id_Practica_Produccion` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_Ficha` bigint(20) DEFAULT NULL,
  `Id_Productor` bigint(20) DEFAULT NULL,
  `Id_Tipo_Practica` bigint(20) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Id_Usuario` bigint(20) DEFAULT NULL,
  `Creado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`Id_Practica_Produccion`),
  KEY `FK_Id_Ficha_Practica_Produccion` (`Id_Ficha`),
  KEY `FK_Id_Productor_Practica_Produccion` (`Id_Productor`),
  KEY `FK_Id_Tipo_Practica_Practica_Produccion` (`Id_Tipo_Practica`),
  CONSTRAINT `FK_Id_Ficha_Practica_Produccion` FOREIGN KEY (`Id_Ficha`) REFERENCES `fichas` (`id_ficha`),
  CONSTRAINT `FK_Id_Productor_Practica_Produccion` FOREIGN KEY (`Id_Productor`) REFERENCES `tbl_productor` (`id_productor`),
  CONSTRAINT `FK_Id_Tipo_Practica_Practica_Produccion` FOREIGN KEY (`Id_Tipo_Practica`) REFERENCES `tbl_tipo_practicas_productivas` (`id_tipo_practica`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_practicas_por_produccion`
--

LOCK TABLES `tbl_practicas_por_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_practicas_por_produccion` DISABLE KEYS */;
INSERT INTO `tbl_practicas_por_produccion` VALUES (9,1,12,1,' ',NULL,'HARU','2024-04-25 23:59:53',NULL,'2024-04-25 23:59:53','A'),(10,1,12,2,' ',NULL,'HARU','2024-04-25 23:59:53',NULL,'2024-04-25 23:59:53','A'),(11,1,12,3,' ',NULL,'HARU','2024-04-25 23:59:53',NULL,'2024-04-25 23:59:53','A'),(12,1,12,4,' ',NULL,'HARU','2024-04-25 23:59:53',NULL,'2024-04-25 23:59:53','A'),(13,1,12,5,' ',NULL,'HARU','2024-04-25 23:59:53',NULL,'2024-04-25 23:59:53','A'),(14,1,12,34,' ',NULL,'HARU','2024-04-25 23:59:53',NULL,'2024-04-25 23:59:53','A'),(15,1,12,35,' ',NULL,'HARU','2024-04-25 23:59:53',NULL,'2024-04-25 23:59:53','A'),(16,1,12,36,' ',NULL,'HARU','2024-04-25 23:59:53',NULL,'2024-04-25 23:59:53','A'),(17,1,12,37,' ',NULL,'HARU','2024-04-25 23:59:53',NULL,'2024-04-25 23:59:53','A'),(18,1,12,39,' ',NULL,'HARU','2024-04-25 23:59:53',NULL,'2024-04-25 23:59:53','A'),(19,2,13,1,' ',NULL,'HARU','2024-04-26 02:19:33',NULL,'2024-04-26 02:19:33','A'),(24,9,20,3,' ',NULL,'HARU','2024-05-01 02:42:17',NULL,'2024-05-01 02:42:17','A'),(25,9,20,4,' ',NULL,'HARU','2024-05-01 02:42:17',NULL,'2024-05-01 02:42:17','A'),(31,11,22,3,' ',NULL,'HARU','2024-05-01 04:21:54',NULL,'2024-05-01 04:21:54','A'),(32,11,22,4,' ',NULL,'HARU','2024-05-01 04:21:54',NULL,'2024-05-01 04:21:54','A');
/*!40000 ALTER TABLE `tbl_practicas_por_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_produccion_agricola_anterior`
--

DROP TABLE IF EXISTS `tbl_produccion_agricola_anterior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_produccion_agricola_anterior` (
  `Id_Produccion_Anterior` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_Ficha` bigint(20) DEFAULT NULL,
  `Id_Ubicacion` bigint(20) DEFAULT NULL,
  `Id_Productor` bigint(20) DEFAULT NULL,
  `Id_Tipo_Cultivo` bigint(20) DEFAULT NULL,
  `Superficie_Primera_Postrera` enum('Primera','Postrera') DEFAULT NULL,
  `Id_Medida_Primera_Postrera` bigint(20) DEFAULT NULL,
  `Produccion_Obtenida` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Produccion_Obtenida` bigint(20) DEFAULT NULL,
  `Cantidad_Vendida` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Vendida` bigint(20) DEFAULT NULL,
  `Precio_Venta` decimal(10,2) DEFAULT NULL,
  `A_Quien_Se_Vendio` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Creado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`Id_Produccion_Anterior`),
  KEY `FK_Id_Ficha_Produccion_Anterior` (`Id_Ficha`),
  KEY `FK_Id_Ubicacion_Produccion_Anterior` (`Id_Ubicacion`),
  KEY `FK_Id_Productor_Produccion_Anterior` (`Id_Productor`),
  KEY `FK_Id_Tipo_Cultivo_Produccion_Anterior` (`Id_Tipo_Cultivo`),
  KEY `FK_Id_Medida_Primera_Postrera` (`Id_Medida_Primera_Postrera`),
  KEY `FK_Id_Medida_Produccion_Obtenida` (`Id_Medida_Produccion_Obtenida`),
  KEY `FK_Id_Medida_Vendida` (`Id_Medida_Vendida`),
  CONSTRAINT `FK_Id_Ficha_Produccion_Anterior` FOREIGN KEY (`Id_Ficha`) REFERENCES `fichas` (`id_ficha`),
  CONSTRAINT `FK_Id_Medida_Primera_Postrera` FOREIGN KEY (`Id_Medida_Primera_Postrera`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  CONSTRAINT `FK_Id_Medida_Produccion_Obtenida` FOREIGN KEY (`Id_Medida_Produccion_Obtenida`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  CONSTRAINT `FK_Id_Medida_Vendida` FOREIGN KEY (`Id_Medida_Vendida`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  CONSTRAINT `FK_Id_Tipo_Cultivo_Produccion_Anterior` FOREIGN KEY (`Id_Tipo_Cultivo`) REFERENCES `tbl_tipo_cultivo` (`id_tipo_cultivo`),
  CONSTRAINT `FK_Id_Ubicacion_Produccion_Anterior` FOREIGN KEY (`Id_Ubicacion`) REFERENCES `tbl_ubicacion_productor` (`id_ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produccion_agricola_anterior`
--

LOCK TABLES `tbl_produccion_agricola_anterior` WRITE;
/*!40000 ALTER TABLE `tbl_produccion_agricola_anterior` DISABLE KEYS */;
INSERT INTO `tbl_produccion_agricola_anterior` VALUES (12,1,7,12,1,'Primera',8,500.00,8,100.00,6,100.00,'la capital sosa',NULL,'HARU','2024-04-25 23:55:35',NULL,'2024-04-25 23:55:35','A'),(13,2,8,13,12,'Primera',2,100.00,2,100.00,2,100.00,'a quien vendio',NULL,'HARU','2024-04-26 02:13:41',NULL,'2024-04-26 02:13:41','A'),(14,3,9,14,12,'Primera',2,100.00,2,100.00,2,100.00,'a quien vendio',NULL,'HARU','2024-04-26 02:13:41',NULL,'2024-04-26 02:13:41','A'),(15,4,10,15,12,'Primera',2,100.00,2,100.00,2,100.00,'a quien vendio',NULL,'HARU','2024-04-26 02:13:41',NULL,'2024-04-26 02:13:41','A'),(16,5,11,16,4,'Primera',3,2.00,3,2.00,3,2.00,'assa',NULL,'HARU','2024-04-27 03:19:44',NULL,'2024-04-27 03:19:44','A'),(17,7,13,18,1,'Primera',1,121.00,2,2.00,1,2.00,'2',NULL,'HARU','2024-05-01 02:31:51',NULL,'2024-05-01 02:31:51','A'),(18,7,13,18,1,'Primera',1,121.00,2,2.00,1,2.00,'2',NULL,'HARU','2024-05-01 02:32:40',NULL,'2024-05-01 02:32:40','A'),(19,9,14,20,2,'Primera',1,111.00,1,2.00,13,1.00,'1',NULL,'HARU','2024-05-01 02:41:28',NULL,'2024-05-01 02:41:28','A'),(20,10,15,21,2,'Primera',1,111.00,1,2.00,13,1.00,'1',NULL,'HARU','2024-05-01 02:41:28',NULL,'2024-05-01 02:41:28','A'),(21,11,16,22,2,'Primera',1,111.00,1,2.00,13,1.00,'1',NULL,'HARU','2024-05-01 02:41:28',NULL,'2024-05-01 02:41:28','A');
/*!40000 ALTER TABLE `tbl_produccion_agricola_anterior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_produccion_comercializacion`
--

DROP TABLE IF EXISTS `tbl_produccion_comercializacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_produccion_comercializacion` (
  `Id_Produccion_Comercio` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_Ficha` bigint(20) DEFAULT NULL,
  `Id_Ubicacion` bigint(20) DEFAULT NULL,
  `Id_Productor` bigint(20) DEFAULT NULL,
  `Id_Tipo_Produccion` bigint(20) DEFAULT NULL,
  `Cantidad_Produccion` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Produccion` bigint(20) DEFAULT NULL,
  `Cantidad_Vendida` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Venta` bigint(20) DEFAULT NULL,
  `Precio_Venta` decimal(10,2) DEFAULT NULL,
  `A_Quien_Se_Vendio` varchar(255) DEFAULT NULL,
  `Creado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`Id_Produccion_Comercio`),
  KEY `FK_Id_Ficha_Produccion_Comercio` (`Id_Ficha`),
  KEY `FK_Id_Ubicacion_Produccion_Comercio` (`Id_Ubicacion`),
  KEY `FK_Id_Productor_Produccion_Comercio` (`Id_Productor`),
  KEY `FK_Id_Tipo_Produccion_Produccion_Comercio` (`Id_Tipo_Produccion`),
  KEY `FK_Id_Medida_Produccion_Produccion_Comercio` (`Id_Medida_Produccion`),
  KEY `FK_Id_Medida_Venta_Produccion_Comercio` (`Id_Medida_Venta`),
  CONSTRAINT `FK_Id_Ficha_Produccion_Comercio` FOREIGN KEY (`Id_Ficha`) REFERENCES `fichas` (`id_ficha`),
  CONSTRAINT `FK_Id_Medida_Venta_Produccion_Comercio` FOREIGN KEY (`Id_Medida_Venta`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  CONSTRAINT `FK_Id_Productor_Produccion_Comercio` FOREIGN KEY (`Id_Productor`) REFERENCES `tbl_productor` (`id_productor`),
  CONSTRAINT `FK_Id_Tipo_Produccion_Produccion_Comercio` FOREIGN KEY (`Id_Tipo_Produccion`) REFERENCES `tbl_tipo_produccion` (`id_tipo_produccion`),
  CONSTRAINT `FK_Id_Ubicacion_Produccion_Comercio` FOREIGN KEY (`Id_Ubicacion`) REFERENCES `tbl_ubicacion_productor` (`id_ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produccion_comercializacion`
--

LOCK TABLES `tbl_produccion_comercializacion` WRITE;
/*!40000 ALTER TABLE `tbl_produccion_comercializacion` DISABLE KEYS */;
INSERT INTO `tbl_produccion_comercializacion` VALUES (10,1,7,12,5,NULL,3,100.00,6,500.00,'La union','HARU','2024-04-25 23:58:04',NULL,'2024-04-25 23:58:04','A'),(18,5,11,16,3,NULL,2,12.00,5,22.00,'pulperia','HARU','2024-04-27 03:20:23',NULL,'2024-04-27 03:20:23','A'),(19,4,10,15,12,NULL,14,100.00,2,200.00,'a quien vendio','HARU','2024-04-27 03:39:18',NULL,'2024-04-27 03:39:18','A'),(20,4,10,15,1,NULL,1,200.00,1,100.00,'a quien vendio','HARU','2024-04-27 03:39:18',NULL,'2024-04-27 03:39:18','A'),(23,3,9,14,12,NULL,14,100.00,2,200.00,'a quien vendio','HARU','2024-04-27 03:48:07',NULL,'2024-04-27 03:48:07','A'),(24,2,8,13,12,NULL,14,100.00,2,200.00,'a quien vendio','HARU','2024-04-27 03:49:41',NULL,'2024-04-27 03:49:41','A'),(25,9,14,20,1,NULL,1,31.00,1,222.00,'gfgdfg','HARU','2024-05-01 02:41:54',NULL,'2024-05-01 02:41:54','A'),(28,11,16,22,1,NULL,1,31.00,1,222.00,'gfgdfg','HARU','2024-05-01 04:21:49',NULL,'2024-05-01 04:21:49','A');
/*!40000 ALTER TABLE `tbl_produccion_comercializacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_produccion_pecuaria`
--

DROP TABLE IF EXISTS `tbl_produccion_pecuaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_produccion_pecuaria` (
  `Id_Produccion_Pecuaria` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_Ficha` bigint(20) DEFAULT NULL,
  `Id_Ubicacion` bigint(20) DEFAULT NULL,
  `Id_Productor` bigint(20) DEFAULT NULL,
  `Año_Produccion` int(11) DEFAULT NULL,
  `Id_Tipo_Pecuario` bigint(20) DEFAULT NULL,
  `Cantidad_Hembras` int(11) DEFAULT NULL,
  `Cantidad_Machos` int(11) DEFAULT NULL,
  `Cantidad_Total` int(11) DEFAULT NULL,
  `Descripcion_Otros` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Creado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`Id_Produccion_Pecuaria`),
  KEY `FK_Id_Ubicacion_Produccion_Pecuaria` (`Id_Ubicacion`),
  KEY `FK_Id_Productor_Produccion_Pecuaria` (`Id_Productor`),
  KEY `FK_Id_Tipo_Pecuario_Produccion_Pecuaria` (`Id_Tipo_Pecuario`),
  KEY `FK_Id_Ficha_Produccion_Pecuaria` (`Id_Ficha`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produccion_pecuaria`
--

LOCK TABLES `tbl_produccion_pecuaria` WRITE;
/*!40000 ALTER TABLE `tbl_produccion_pecuaria` DISABLE KEYS */;
INSERT INTO `tbl_produccion_pecuaria` VALUES (23,5,11,16,0,1,2,0,2,NULL,NULL,NULL,'2024-05-01 02:23:45',NULL,'2024-05-01 02:23:45','A'),(25,7,13,18,0,1,2,0,2,NULL,NULL,NULL,'2024-05-01 02:32:41',NULL,'2024-05-01 02:32:41','A'),(26,9,14,20,0,1,2,0,2,NULL,NULL,NULL,'2024-05-01 02:41:36',NULL,'2024-05-01 02:41:36','A'),(27,9,14,20,0,3,0,4,4,NULL,NULL,NULL,'2024-05-01 02:41:37',NULL,'2024-05-01 02:41:37','A'),(28,10,15,21,0,1,2,0,2,NULL,NULL,NULL,'2024-05-01 02:41:36',NULL,'2024-05-01 02:41:36','A'),(29,10,15,21,0,3,0,4,4,NULL,NULL,NULL,'2024-05-01 02:41:37',NULL,'2024-05-01 02:41:37','A'),(36,11,16,22,0,1,2,0,2,NULL,NULL,NULL,'2024-05-01 04:21:48',NULL,'2024-05-01 04:21:48','A'),(37,11,16,22,0,3,0,4,4,NULL,NULL,NULL,'2024-05-01 04:21:49',NULL,'2024-05-01 04:21:49','A');
/*!40000 ALTER TABLE `tbl_produccion_pecuaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_produccion_vendida`
--

DROP TABLE IF EXISTS `tbl_produccion_vendida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_produccion_vendida` (
  `Id_Produccion_Vendida` bigint(20) NOT NULL AUTO_INCREMENT,
  `Año_Venta` int(11) DEFAULT NULL,
  `Id_Tipo_Pecuario` bigint(20) DEFAULT NULL,
  `Precio_Venta` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Venta` bigint(20) DEFAULT NULL,
  `Cantidad_Mercado` int(11) DEFAULT NULL,
  `Creado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`Id_Produccion_Vendida`),
  KEY `FK_Id_Tipo_Pecuario_Produccion_Vendida` (`Id_Tipo_Pecuario`),
  KEY `FK_Id_Medida_Venta_Produccion_Vendida` (`Id_Medida_Venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produccion_vendida`
--

LOCK TABLES `tbl_produccion_vendida` WRITE;
/*!40000 ALTER TABLE `tbl_produccion_vendida` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_produccion_vendida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_productor`
--

DROP TABLE IF EXISTS `tbl_productor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_productor` (
  `id_ficha` varchar(50) DEFAULT NULL,
  `id_productor` bigint(20) NOT NULL AUTO_INCREMENT,
  `primer_nombre` varchar(255) DEFAULT NULL,
  `segundo_nombre` varchar(255) DEFAULT NULL,
  `primer_apellido` varchar(255) DEFAULT NULL,
  `segundo_apellido` varchar(255) DEFAULT NULL,
  `identificacion` bigint(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `estado_civil` varchar(20) DEFAULT NULL,
  `nivel_escolaridad` varchar(50) DEFAULT NULL,
  `ultimo_grado_escolar_aprobado` varchar(50) DEFAULT NULL,
  `telefono_1` int(11) DEFAULT NULL,
  `telefono_2` int(11) DEFAULT NULL,
  `telefono_3` int(11) DEFAULT NULL,
  `email_1` varchar(255) DEFAULT NULL,
  `email_2` varchar(255) DEFAULT NULL,
  `email_3` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(25) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(25) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`id_productor`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productor`
--

LOCK TABLES `tbl_productor` WRITE;
/*!40000 ALTER TABLE `tbl_productor` DISABLE KEYS */;
INSERT INTO `tbl_productor` VALUES ('1',12,'manuel','de jesus','figueroa','barahona',801200205125,'2001-08-28','Masculino','Soltero(a)','primaria','4',987456321,31673917,31673917,'manubara200128@gmail.com','manubara200128@gmail.com','manubara200128@gmail.com',NULL,'HARU','2024-04-27 03:13:52','0','2024-04-27 03:13:52','A'),('2',13,'prueba','final','prueba','final',801999999999,'2025-05-01','Masculino','Unión libre','universitaria','5',11111111,22222222,33333333,'principal@gmail.com','secundario@gmail.com','opcional@gmail.com',NULL,'HARU','2024-04-27 03:49:19','0','2024-04-27 03:49:19','A'),('3',14,'prueba','final','prueba','final',801999999999,'2025-05-01','Masculino','Unión libre','universitaria','5',11111111,22222222,33333333,'principal@gmail.com','secundario@gmail.com','opcional@gmail.com',NULL,'HARU','2024-04-27 03:47:00','0','2024-04-27 03:47:00','A'),('4',15,'prueba','final','prueba','final',801999999999,'2025-05-01','Masculino','Unión libre','universitaria','5',11111111,22222222,33333333,'principal@gmail.com','secundario@gmail.com','opcional@gmail.com',NULL,'HARU','2024-04-27 03:37:52','0','2024-04-27 03:37:52','A'),('5',16,'manuel','daasdw','figueroaas','barahona',802155855585,'2024-04-26','Masculino','Soltero(a)','primaria','2',31673917,31313131,3333333,'manuelfigueroa2818@gmail.com','manuelfigueroa2818@gmail.com','manuelfigueroa2818@gmail.com',NULL,'HARU','2024-05-01 02:21:35','0','2024-05-01 02:21:35','A'),('6',17,'','','','',0,'0000-00-00','','','','',0,0,0,'','','',NULL,'HARU','2024-05-01 02:27:39',NULL,'2024-05-01 02:27:39','A'),('7',18,'sfsdfsd','sdfsdf','sdfsdf','',4141,'2024-04-09','Masculino','','','',0,0,0,'','','',NULL,'HARU','2024-05-01 02:31:14',NULL,'2024-05-01 02:31:14','A'),('8',19,'','','','',0,'0000-00-00','','','','',0,0,0,'','','',NULL,'HARU','2024-05-01 02:34:07',NULL,'2024-05-01 02:34:07','A'),('9',20,'Mario','Juan','Soto','',423432,'2024-04-09','Masculino','Soltero(a)','primaria','1',2343243,0,0,'','','',NULL,'HARU','2024-05-01 02:40:11',NULL,'2024-05-01 02:40:11','A'),('10',21,'Mario','Juan','Soto','',423432,'2024-04-09','Masculino','Soltero(a)','primaria','1',2343243,0,0,'','','',NULL,'HARU','2024-05-01 02:40:11',NULL,'2024-05-01 02:40:11','A'),('11',22,'Mario','Juan','Soto','',423432,'2024-04-09','Masculino','Soltero(a)','primaria','1',2343243,0,0,'','','',NULL,'HARU','2024-05-01 04:39:25','0','2024-05-01 04:39:25','A');
/*!40000 ALTER TABLE `tbl_productor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_productor_actividad_externa`
--

DROP TABLE IF EXISTS `tbl_productor_actividad_externa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_productor_actividad_externa` (
  `id_actividad_ext` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `miembros_realizan_actividades_fuera_finca` enum('S','N') DEFAULT NULL,
  `cuantos_miembros` int(11) DEFAULT NULL,
  `trabajadores_temporales` int(11) DEFAULT NULL,
  `trabajadores_permanentes` int(11) DEFAULT NULL,
  `id_tomador_decisiones` bigint(20) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id_actividad_ext`),
  KEY `fk_id_ficha_actividad_externa` (`id_ficha`),
  KEY `fk_id_productor_actividad_externa` (`id_productor`),
  KEY `fk_id_tomador_decisiones_actividad_externa` (`id_tomador_decisiones`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productor_actividad_externa`
--

LOCK TABLES `tbl_productor_actividad_externa` WRITE;
/*!40000 ALTER TABLE `tbl_productor_actividad_externa` DISABLE KEYS */;
INSERT INTO `tbl_productor_actividad_externa` VALUES (8,1,12,'S',10,5,5,1,NULL,'HARU','2024-04-25 23:59:40',NULL,'2024-04-25 23:59:40','A'),(9,1,12,'S',10,5,5,4,NULL,'HARU','2024-04-25 23:59:40',NULL,'2024-04-25 23:59:40','A'),(15,9,20,'S',1,1,1,6,NULL,'HARU','2024-05-01 02:42:13',NULL,'2024-05-01 02:42:13','A'),(18,11,22,'S',1,1,1,6,NULL,'HARU','2024-05-01 04:21:52',NULL,'2024-05-01 04:21:52','A');
/*!40000 ALTER TABLE `tbl_productor_actividad_externa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_relevo_organizacion`
--

DROP TABLE IF EXISTS `tbl_relevo_organizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_relevo_organizacion` (
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `Id_Relevo` bigint(20) NOT NULL AUTO_INCREMENT,
  `tendra_relevo` enum('S','N') DEFAULT NULL,
  `cuantos_relevos` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`Id_Relevo`),
  KEY `fk_id_ficha` (`id_ficha`),
  KEY `fk_id_productor_relevo` (`id_productor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_relevo_organizacion`
--

LOCK TABLES `tbl_relevo_organizacion` WRITE;
/*!40000 ALTER TABLE `tbl_relevo_organizacion` DISABLE KEYS */;
INSERT INTO `tbl_relevo_organizacion` VALUES (1,12,10,'S',50,NULL,'HARU','2024-04-25 23:49:07',NULL,'2024-04-25 23:49:07','A'),(2,13,11,'S',2,NULL,'HARU','2024-04-26 02:08:32','HARU','2024-04-27 03:49:24','A'),(3,14,12,'S',2,NULL,'HARU','2024-04-26 02:08:32','HARU','2024-04-27 03:47:06','A'),(4,15,13,'S',2,NULL,'HARU','2024-04-26 02:08:32','HARU','2024-04-27 03:37:57','A'),(5,16,14,'S',3,NULL,'HARU','2024-04-27 03:17:19','HARU','2024-05-01 02:21:39','A'),(6,17,15,'N',0,NULL,'HARU','2024-05-01 02:27:44',NULL,'2024-05-01 02:27:44','A'),(7,18,16,'N',0,NULL,'HARU','2024-05-01 02:31:31',NULL,'2024-05-01 02:31:31','A'),(8,19,17,'N',0,NULL,'HARU','2024-05-01 02:34:10',NULL,'2024-05-01 02:34:10','A'),(9,20,18,'S',2,NULL,'HARU','2024-05-01 02:40:34',NULL,'2024-05-01 02:40:34','A'),(10,21,19,'S',2,NULL,'HARU','2024-05-01 02:40:34',NULL,'2024-05-01 02:40:34','A'),(11,22,20,'S',2,NULL,'HARU','2024-05-01 02:40:34','HARU','2024-05-01 04:39:30','A');
/*!40000 ALTER TABLE `tbl_relevo_organizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_siembra`
--

DROP TABLE IF EXISTS `tbl_siembra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_siembra` (
  `Id_siembra` bigint(20) NOT NULL AUTO_INCREMENT,
  `Tipo_siembra` varchar(50) NOT NULL,
  `Creado_Por` varchar(50) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Actualizado_Por` varchar(50) NOT NULL,
  `Fecha_Actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') NOT NULL DEFAULT 'A',
  PRIMARY KEY (`Id_siembra`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_siembra`
--

LOCK TABLES `tbl_siembra` WRITE;
/*!40000 ALTER TABLE `tbl_siembra` DISABLE KEYS */;
INSERT INTO `tbl_siembra` VALUES (1,'Primera','Haru','2024-04-29 06:08:41','Haru','2024-04-29 06:08:41','A'),(2,'Postrera','Haru','2024-04-29 06:09:15','Haru','2024-04-29 06:09:15','A');
/*!40000 ALTER TABLE `tbl_siembra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_cultivo`
--

DROP TABLE IF EXISTS `tbl_tipo_cultivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipo_cultivo` (
  `id_tipo_cultivo` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_cultivo` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_cultivo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_cultivo`
--

LOCK TABLES `tbl_tipo_cultivo` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_cultivo` DISABLE KEYS */;
INSERT INTO `tbl_tipo_cultivo` VALUES (1,'Maiz','Maiz amarillo','Manuel','2023-12-01 04:18:29',NULL,'2023-11-02 04:18:29','ACTIVO'),(2,'Cafe','Cafe de palo','Haru','2024-04-26 00:30:34','Haru','2024-04-26 00:30:34','ACTIVO'),(3,'Frijol','Frijol','Haru','2024-04-26 00:31:10','Haru','2024-04-26 00:31:10','ACTIVO'),(4,'Palma','Palma','Manuel','2023-11-02 05:10:49','Manuel','2024-04-26 00:33:17','ACTIVO'),(5,'Caña de Azúcar','Caña de Azúcar','manu','2023-12-11 07:44:45','manu','2023-12-11 07:44:45','ACTIVO'),(6,'Sorgo','Sorgo','manu','2023-12-11 07:45:19','manu','2023-12-11 07:45:19','ACTIVO'),(7,'Naranja','Naranja','manu','2023-12-11 07:45:19','manu','2023-12-11 07:45:19','ACTIVO'),(8,'Banano','Banano','manu','2023-12-11 07:46:35','manu','2023-12-11 07:46:35','ACTIVO'),(9,'Melón','Melón','manu','2023-12-11 07:47:49','manu','2023-12-11 07:47:49','ACTIVO'),(10,'sandía','prueba','Kevin','2024-02-26 10:01:58','Kevin','2024-02-26 10:01:58','ACTIVO'),(11,'CultivoInactivo','CultivoInactivo','Manuel','2024-04-26 01:39:42','Manuel','2024-04-26 01:40:04','INACTIVO'),(12,'CultivoActivo','CultivoActivo','Manuel','2024-04-26 01:39:54','Manuel','2024-04-26 01:39:54','ACTIVO');
/*!40000 ALTER TABLE `tbl_tipo_cultivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_negocios`
--

DROP TABLE IF EXISTS `tbl_tipo_negocios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipo_negocios` (
  `id_tipo_negocio` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_negocio` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_negocio`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_negocios`
--

LOCK TABLES `tbl_tipo_negocios` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_negocios` DISABLE KEYS */;
INSERT INTO `tbl_tipo_negocios` VALUES (1,'Venta de servicio','Venta de servicios','Kevin','2023-12-11 09:36:51','Kevin','2023-12-11 09:36:51',''),(2,'Jornal agricola','Jornal agricola','Kevin','2024-04-25 20:57:53','Kevin','2024-04-25 20:57:53',''),(3,'Corte de café','Café',NULL,'2024-04-25 20:57:57',NULL,'2024-04-25 20:57:57',''),(4,'Jornal no agrícola','Jornal no agrícola',NULL,'2024-04-25 20:58:01',NULL,'2024-04-25 20:58:01',''),(5,'Alquileres','Alquileres',NULL,'2024-04-25 20:58:04',NULL,'2024-04-25 20:58:04',''),(6,'Remesa del exterior','Remesa del exterior',NULL,'2024-04-25 20:58:13',NULL,'2024-04-25 20:58:13',''),(7,'Remesa nacional','Remesa nacional',NULL,'2024-04-25 20:58:16',NULL,'2024-04-25 20:58:16',''),(8,'Bono (10 mil, 3ra edad, escolar)','Bono(10 mil, 3ra edad, escolar)',NULL,'2024-04-25 20:59:30',NULL,'2024-04-25 20:59:30',''),(9,'Salario profesional','Salario profesional',NULL,'2024-04-25 20:58:23',NULL,'2024-04-25 20:58:23',''),(10,'Artesanía','Artesanía',NULL,'2024-04-25 20:58:27',NULL,'2024-04-25 20:58:27',''),(11,'Negocio','Negocio','Kevin','2024-04-25 21:01:35','Kevin','2024-04-25 21:01:35',''),(14,'NegInactivo','NegInactivo','Kevin','2024-04-26 01:44:48','Kevin','2024-04-26 01:44:48','');
/*!40000 ALTER TABLE `tbl_tipo_negocios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_organizacion`
--

DROP TABLE IF EXISTS `tbl_tipo_organizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipo_organizacion` (
  `id_tipo_organizacion` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_organizacion` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id_tipo_organizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_organizacion`
--

LOCK TABLES `tbl_tipo_organizacion` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_organizacion` DISABLE KEYS */;
INSERT INTO `tbl_tipo_organizacion` VALUES (1,'Asociación','Gobierno','1','2024-04-27 03:13:27','1','2024-04-27 03:13:27','I'),(2,'Cooperativa','ONG','manu','2024-04-27 03:13:27','manu','2024-04-27 03:13:27','I'),(5,'Caja rural','Amigo','Kevin','2024-04-27 03:13:27','Kevin','2024-04-27 03:13:27','I'),(6,'Patronato','Cooperativa','Kevin','2024-04-27 03:13:27','Kevin','2024-04-27 03:13:27','I'),(7,'Junta de agua','FAO','Kevin','2024-04-27 03:13:27','Kevin','2024-04-27 03:13:27','I'),(8,'ORGACtiva','ORGActivo','Kevin','2024-04-27 03:13:27','Kevin','2024-04-27 03:13:27','I'),(9,'tbl_tipo_organizacion','tbl_tipo_organizacion','tbl_tipo_organizacion','2024-04-27 03:12:27','tbl_tipo_organizacion','2024-04-27 03:12:27','A');
/*!40000 ALTER TABLE `tbl_tipo_organizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_pecuarios`
--

DROP TABLE IF EXISTS `tbl_tipo_pecuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipo_pecuarios` (
  `id_tipo_pecuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_pecuario` varchar(25) NOT NULL,
  `raza_con_genero` enum('s','n') DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_pecuario`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_pecuarios`
--

LOCK TABLES `tbl_tipo_pecuarios` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_pecuarios` DISABLE KEYS */;
INSERT INTO `tbl_tipo_pecuarios` VALUES (1,'Bovinos','s','asasa','manu','2023-11-26 06:00:00','manu','2023-12-11 01:15:58','A'),(2,'Ovinos','s','prueba','manu','2023-11-26 06:13:32','manu','2023-12-11 01:15:45','A'),(3,'Caprinos','s','Caprinos','manu','2023-11-26 06:29:31','manu','2023-12-11 01:15:30','A'),(4,'Cerdo','s','Cerdos','Mfigue','2023-12-11 01:11:16',NULL,'2023-12-11 01:11:49','A'),(5,'Pollo de Engorde','s','Pollo de Engorde','manu','2023-12-11 01:11:57','manu','2023-12-11 01:11:57','A'),(6,'Aves','n','Aves','manu','2023-12-11 01:12:58','manu','2023-12-11 01:12:58','A'),(7,'Peces','n','Peces','manu','2023-12-11 01:13:38','manu','2024-04-25 21:14:23','A'),(8,'Camarones','n','Camarones','manu','2023-12-11 01:14:08','manu','2023-12-11 01:14:08','A'),(9,'Otros','n','Otras especies','manu','2023-12-11 01:14:44','manu','2024-04-25 23:43:20','I'),(11,'PeActivo','s','PeActivo','HARU','2024-04-26 01:41:07',NULL,'2024-04-26 01:41:07','A'),(12,'','s','PeInactivo','HARU','2024-04-26 01:41:22','HARU','2024-04-26 01:41:31','I');
/*!40000 ALTER TABLE `tbl_tipo_pecuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_practicas_productivas`
--

DROP TABLE IF EXISTS `tbl_tipo_practicas_productivas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipo_practicas_productivas` (
  `id_tipo_practica` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_practica` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_practica`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_practicas_productivas`
--

LOCK TABLES `tbl_tipo_practicas_productivas` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_practicas_productivas` DISABLE KEYS */;
INSERT INTO `tbl_tipo_practicas_productivas` VALUES (1,'Quema',NULL,NULL,'2024-04-27 03:25:15',NULL,'2024-04-27 03:25:15','I'),(2,'Riega',NULL,NULL,'2024-04-27 03:25:21',NULL,'2024-04-27 03:25:21','I'),(3,'Manejo de rastrojo',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(4,'Cero labranzas',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(5,'Labranza mínima',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(6,'Siembra en hileras o surcos',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(7,'Curvas a nivel',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(8,'Cultivos en asoci',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(9,'Desparasitantes',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(10,'Preparación de suelo con tractor',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(11,'Cultivo en relevo',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(12,'Tierra en descanso',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(13,'Barreras vivas',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(14,'Barreras muertas',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(15,'Abono orgánico',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(16,'Abono sintético',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(17,'Cosecha de agua',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(18,'Manejo de humedad',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(19,'Semilla criolla',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(20,'Semilla mejorada',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(21,'Huerto familiar',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(22,'Almacenamiento de grano',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(23,'Agricultura protegida',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(24,'Secadora solar',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(25,'Uso de insecticidas',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(26,'Uso de fungicidas',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(27,'Uso de acaricidas',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(28,'Uso de herbicidas',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(29,'Podas',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(30,'Sistema agroforestal',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(31,'Control de sombra',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(32,'Sistema silvopastoril',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(33,'Terrazas',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(34,'Cultivo de cobertura',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(35,'Banco de proteína',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(36,'Pastos mejorados',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(37,'Aplicación de vacunas',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(38,'Vitaminas','Vitaminas',NULL,'2024-04-25 23:26:06',NULL,'2024-04-25 23:26:06','I'),(39,'Preparación de suelo con tracción animal',NULL,NULL,'2023-12-12 17:05:48',NULL,'2023-12-12 17:05:48','A'),(41,'PPInactivas','PPInactivas','Manuel','2024-04-26 01:50:26','Manuel','2024-04-26 01:50:26','');
/*!40000 ALTER TABLE `tbl_tipo_practicas_productivas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_produccion`
--

DROP TABLE IF EXISTS `tbl_tipo_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipo_produccion` (
  `id_tipo_produccion` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_produccion` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_produccion`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_produccion`
--

LOCK TABLES `tbl_tipo_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_produccion` DISABLE KEYS */;
INSERT INTO `tbl_tipo_produccion` VALUES (1,'Producción de leche','Leche','1','2024-04-26 00:25:24','1','2024-04-26 00:25:24','ACTIVO'),(2,'Producción de carne','Carne','Kevin','2024-04-26 00:25:30','Kevin','2024-04-26 00:25:30','ACTIVO'),(3,'Producción de derivados de leche','Derivados de la leche','Kevin','2024-04-26 00:25:40','Kevin','2024-04-26 00:25:40','ACTIVO'),(4,'Producción de huevos','Huevos','Kevin','2024-04-26 00:25:49','Kevin','2024-04-26 00:25:49','ACTIVO'),(5,'Producción apícola ','Apicola','manu','2024-04-26 00:25:57','manu','2024-04-26 00:25:57','ACTIVO'),(6,'Producto de Transformación','Transformación','manu','2024-04-26 00:26:08','manu','2024-04-26 00:26:08','ACTIVO'),(12,'ProInactivo','ProInactivo','Kevin','2024-04-26 01:43:26','Kevin','2024-04-26 01:43:26','');
/*!40000 ALTER TABLE `tbl_tipo_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_riego`
--

DROP TABLE IF EXISTS `tbl_tipo_riego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipo_riego` (
  `id_tipo_riego` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_riego` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_riego`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_riego`
--

LOCK TABLES `tbl_tipo_riego` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_riego` DISABLE KEYS */;
INSERT INTO `tbl_tipo_riego` VALUES (1,'Pozo','Pozo','Manuel','2023-11-02 05:23:18','Manuel','2023-11-02 05:23:18','ACTIVO'),(2,'riego por goteo','riego por goteo','Manuel','2024-04-25 14:49:46','Manuel','2024-04-25 14:49:46','ACTIVO'),(3,'riego por aspersión','riego por aspersión','Manuel','2024-04-25 14:51:45','Manuel','2024-04-25 14:51:45','ACTIVO'),(4,'Riego por bombeo','Riego por bombeo','Manuel','2024-04-25 14:52:13','Manuel','2024-04-25 14:52:13','ACTIVO'),(5,'Riego por gravedad','Riego por gravedad','Manuel','2024-04-25 14:52:47','Manuel','2024-04-25 14:52:47','ACTIVO'),(6,'RiegoActivo','RiegoActivo','Manuel','2024-04-26 01:38:30','Manuel','2024-04-26 01:38:30','ACTIVO'),(7,'RiegoInactivo','RiegoInactivo','Manuel','2024-04-26 01:38:50','Manuel','2024-04-26 01:38:58','INACTIVO');
/*!40000 ALTER TABLE `tbl_tipo_riego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_trabajadores`
--

DROP TABLE IF EXISTS `tbl_tipo_trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipo_trabajadores` (
  `id_tipo_trabajador` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_trabajador` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_trabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_trabajadores`
--

LOCK TABLES `tbl_tipo_trabajadores` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_trabajadores` DISABLE KEYS */;
INSERT INTO `tbl_tipo_trabajadores` VALUES (1,'Ganadero','kkka','Daniela','2023-11-22 06:17:22','Daniela','2023-11-22 06:17:22','I'),(2,'Agricultor','3 cultivos de papa','Daniela','2023-11-22 06:17:27','Daniela','2023-11-22 06:17:27','A'),(5,'TraInactivo','TraInactivo','Daniela','2024-04-26 01:49:13','Daniela','2024-04-26 01:49:13','');
/*!40000 ALTER TABLE `tbl_tipo_trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipos_apoyo_produccion`
--

DROP TABLE IF EXISTS `tbl_tipos_apoyo_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipos_apoyo_produccion` (
  `id_apoyo_produccion` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_tipos_apoyos` bigint(20) NOT NULL,
  `otros_detalles` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`id_apoyo_produccion`) USING BTREE,
  KEY `fk_id_ficha_apoyo_produccion` (`id_ficha`),
  KEY `fk_id_productor_apoyo_produccion` (`id_productor`),
  KEY `fk_id_tipos_apoyos_apoyo_produccion` (`id_tipos_apoyos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipos_apoyo_produccion`
--

LOCK TABLES `tbl_tipos_apoyo_produccion` WRITE;
/*!40000 ALTER TABLE `tbl_tipos_apoyo_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tipos_apoyo_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipos_apoyos`
--

DROP TABLE IF EXISTS `tbl_tipos_apoyos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipos_apoyos` (
  `id_tipo_apoyos` bigint(11) NOT NULL AUTO_INCREMENT,
  `tipo_apoyos` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_apoyos`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipos_apoyos`
--

LOCK TABLES `tbl_tipos_apoyos` WRITE;
/*!40000 ALTER TABLE `tbl_tipos_apoyos` DISABLE KEYS */;
INSERT INTO `tbl_tipos_apoyos` VALUES (1,'Crédito','Descripción del apoyo de Crédito','admin','2023-12-12 20:53:05',NULL,'2023-12-12 20:53:05','ACTIVO'),(2,'Semilla','Descripción del apoyo de Semilla','admin','2023-12-12 20:53:05',NULL,'2023-12-12 20:53:05','ACTIVO'),(3,'Fertilizante','Descripción del apoyo de Fertilizante','admin','2023-12-12 20:53:05',NULL,'2023-12-12 20:53:05','ACTIVO'),(4,'Capacitación','Descripción del apoyo de Capacitación','admin','2023-12-12 20:53:05',NULL,'2023-12-12 20:53:05','ACTIVO'),(5,'Asistencia técnica','Descripción del apoyo de Asistencia técnica','admin','2023-12-12 20:53:05',NULL,'2023-12-12 20:53:05','ACTIVO'),(6,'Herramientas de trabajo','Descripción del apoyo de Herramientas de trabajo','admin','2023-12-12 20:53:05',NULL,'2023-12-12 20:53:05','ACTIVO'),(7,'Sistema de riego','Descripción del apoyo de Sistema de riego','admin','2023-12-12 20:53:05',NULL,'2023-12-12 20:53:05','ACTIVO'),(8,'Equipo agrícola','Descripción del apoyo de Equipo agrícola','admin','2023-12-12 20:53:05',NULL,'2023-12-12 20:53:05','ACTIVO'),(9,'Silos','Descripción del apoyo de Silos','admin','2023-12-12 20:53:05',NULL,'2023-12-12 20:53:05','ACTIVO'),(10,'Cosechadoras de agua','Descripción del apoyo de Cosechadoras de agua','admin','2023-12-12 20:53:05',NULL,'2023-12-12 20:53:05','ACTIVO'),(11,'Pie de cría','Descripción del apoyo de Pie de cría','admin','2023-12-12 20:53:05',NULL,'2023-12-12 20:53:05','ACTIVO'),(12,'Información de precios','Descripción del apoyo de Información de precios','admin','2023-12-12 20:53:05',NULL,'2023-12-12 20:53:05','ACTIVO'),(13,'Comercialización/mercados','Descripción del apoyo de Comercialización/mercados','admin','2023-12-12 20:53:05',NULL,'2023-12-12 20:53:05','ACTIVO'),(14,'Organización rural','Descripción del apoyo de Organización rural','admin','2023-12-12 20:53:05',NULL,'2023-12-12 20:53:05','ACTIVO'),(15,'Transformación de productos','Descripción del apoyo de Transformación de productos','admin','2023-12-12 20:53:05',NULL,'2023-12-12 20:53:05','ACTIVO'),(17,'TPActivo','TPActivo','Daniela','2024-04-26 01:51:45','Daniela','2024-04-26 01:51:45','ACTIVO'),(18,'TPInactivo','TPInactivo','Daniela','2024-04-26 01:52:16','Daniela','2024-04-26 01:52:16','INACTIVO');
/*!40000 ALTER TABLE `tbl_tipos_apoyos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_toma_decisiones`
--

DROP TABLE IF EXISTS `tbl_toma_decisiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_toma_decisiones` (
  `id_tipo_tomador` bigint(20) NOT NULL AUTO_INCREMENT,
  `tomador` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_tomador`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_toma_decisiones`
--

LOCK TABLES `tbl_toma_decisiones` WRITE;
/*!40000 ALTER TABLE `tbl_toma_decisiones` DISABLE KEYS */;
INSERT INTO `tbl_toma_decisiones` VALUES (1,'Esposo','Esposo','Daniela','2024-04-27 03:23:44','Daniela','2024-04-27 03:23:44','I'),(2,'Esposa','Esposa','Daniela','2024-04-27 03:23:44','Daniela','2024-04-27 03:23:44','I'),(3,'Consenso en Familia','Consenso en Familia','Daniela','2024-04-25 23:31:05','Daniela','2024-04-25 23:31:05','I'),(4,'Un familiar','Un familiar toma las deciones','Haru','2024-04-27 03:23:44','Haru','2024-04-27 03:23:44','I'),(5,'Un administrador','El administrador toma la decision','Haru','2024-04-27 03:23:44','Haru','2024-04-27 03:23:44','I'),(6,'TomaDInactivo','TomaDInactivo','Daniela','2024-04-27 03:23:23','Daniela','2024-04-27 03:23:23','A');
/*!40000 ALTER TABLE `tbl_toma_decisiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_trabajadores_externos`
--

DROP TABLE IF EXISTS `tbl_trabajadores_externos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_trabajadores_externos` (
  `id_trabajador_ext` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_tipo_trabajador` bigint(20) DEFAULT NULL,
  `cantidad_trabajador` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`id_trabajador_ext`),
  KEY `fk_id_ficha_trabajadores_externos` (`id_ficha`),
  KEY `fk_id_productor_trabajadores_externos` (`id_productor`),
  KEY `fk_id_tipo_trabajador` (`id_tipo_trabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_trabajadores_externos`
--

LOCK TABLES `tbl_trabajadores_externos` WRITE;
/*!40000 ALTER TABLE `tbl_trabajadores_externos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_trabajadores_externos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ubicacion_productor`
--

DROP TABLE IF EXISTS `tbl_ubicacion_productor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ubicacion_productor` (
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_ubicacion` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_Departamento` bigint(20) NOT NULL,
  `Id_Municipio` bigint(20) NOT NULL,
  `Id_Aldea` bigint(20) NOT NULL,
  `Id_Cacerio` bigint(20) NOT NULL,
  `ubicacion_geografica` varchar(255) DEFAULT NULL,
  `distancia_parcela_vivienda` decimal(10,2) DEFAULT NULL,
  `latitud_parcela` varchar(20) DEFAULT NULL,
  `longitud_parcela` varchar(20) DEFAULT NULL,
  `msnm` decimal(10,2) DEFAULT NULL,
  `direccion_1` varchar(255) DEFAULT NULL,
  `direccion_2` varchar(255) DEFAULT NULL,
  `direccion_3` varchar(255) DEFAULT NULL,
  `vive_en_finca` enum('S','N') DEFAULT NULL,
  `nombre_finca` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id_ubicacion`),
  KEY `id_productor` (`id_productor`),
  KEY `fk_id_ficha_ubicacion` (`id_ficha`),
  KEY `fk_departamento_ubicacion_productor` (`Id_Departamento`),
  KEY `fk_municipio_ubicacion_productor` (`Id_Municipio`),
  KEY `fk_aldea_ubicacion_productor` (`Id_Aldea`),
  KEY `fk_cacerio_ubicacion_productor` (`Id_Cacerio`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ubicacion_productor`
--

LOCK TABLES `tbl_ubicacion_productor` WRITE;
/*!40000 ALTER TABLE `tbl_ubicacion_productor` DISABLE KEYS */;
INSERT INTO `tbl_ubicacion_productor` VALUES (1,12,7,2,6,26,3,'trujillo',10.00,'2','2',13.00,'Residencial Arturo Quezada bloque 15 casa 3317','casa 3323','Carretera CA5','S','Finca lomas',NULL,'HARU','2024-04-25 23:48:19','HARU','2024-04-27 03:13:52','A'),(2,13,8,1,1,1,1,'evaluacion final de la clase de evaluacion, departamento de informatica, facultad de ciencias economicas, universidad nacional autonoma de honduras',10.00,'100','200',100.00,' evaluacion final de la clase de evaluacion, departamento de informatica, facultad de ciencias economicas, universidad nacional autonoma de honduras','evaluacion final de la clase de evaluacion, departamento de informatica, facultad de ciencias economicas, universidad nacional autonoma de honduras','evaluacion final de la clase de evaluacion, departamento de informatica, facultad de ciencias economicas, universidad nacional autonoma de honduras','S','finca final',NULL,'HARU','2024-04-26 02:02:05','HARU','2024-04-27 03:49:21','A'),(3,14,9,1,1,1,1,'evaluacion final de la clase de evaluacion, departamento de informatica, facultad de ciencias economicas, universidad nacional autonoma de honduras',10.00,'100','200',100.00,' evaluacion final de la clase de evaluacion, departamento de informatica, facultad de ciencias economicas, universidad nacional autonoma de honduras','evaluacion final de la clase de evaluacion, departamento de informatica, facultad de ciencias economicas, universidad nacional autonoma de honduras','evaluacion final de la clase de evaluacion, departamento de informatica, facultad de ciencias economicas, universidad nacional autonoma de honduras','S','finca final',NULL,'HARU','2024-04-26 02:02:05','HARU','2024-04-27 03:47:01','A'),(4,15,10,1,1,1,1,'evaluacion final de la clase de evaluacion, departamento de informatica, facultad de ciencias economicas, universidad nacional autonoma de honduras',10.00,'100','200',100.00,' evaluacion final de la clase de evaluacion, departamento de informatica, facultad de ciencias economicas, universidad nacional autonoma de honduras','evaluacion final de la clase de evaluacion, departamento de informatica, facultad de ciencias economicas, universidad nacional autonoma de honduras','evaluacion final de la clase de evaluacion, departamento de informatica, facultad de ciencias economicas, universidad nacional autonoma de honduras','S','finca final',NULL,'HARU','2024-04-26 02:02:05','HARU','2024-04-27 03:37:53','A'),(5,16,11,1,1,1,1,'',1.00,'2','1',1.00,'Residencial Arturo Quezada bloque 15 casa 3317','casa 3323','55887onouigiug','S','corrales',NULL,'HARU','2024-04-27 03:15:23','HARU','2024-05-01 02:21:35','A'),(5,16,12,1,1,1,1,'',1.00,'2','1',1.00,'Residencial Arturo Quezada bloque 15 casa 3317','casa 3323','55887onouigiug','S','corrales',NULL,'HARU','2024-04-27 03:16:55',NULL,'2024-04-27 03:16:55','A'),(7,18,13,1,1,1,1,'',0.00,'','',0.00,' ','','','N','',NULL,'HARU','2024-05-01 02:31:20',NULL,'2024-05-01 02:31:20','A'),(9,20,14,2,6,27,4,'',0.00,'','',0.00,' ','','','N','',NULL,'HARU','2024-05-01 02:40:20',NULL,'2024-05-01 02:40:20','A'),(10,21,15,2,6,27,4,'',0.00,'','',0.00,' ','','','N','',NULL,'HARU','2024-05-01 02:40:20',NULL,'2024-05-01 02:40:20','A'),(11,22,16,2,6,27,4,'',0.00,'','',0.00,' ','','','N','',NULL,'HARU','2024-05-01 02:40:20','HARU','2024-05-01 04:39:26','A');
/*!40000 ALTER TABLE `tbl_ubicacion_productor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_unidad_productora`
--

DROP TABLE IF EXISTS `tbl_unidad_productora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_unidad_productora` (
  `Id_Ubicacion` bigint(20) NOT NULL,
  `Id_Ficha` bigint(20) DEFAULT NULL,
  `Id_Unidad_Productiva` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_Productor` bigint(20) DEFAULT NULL,
  `Tipo_De_Manejo` enum('Propia','Alquilada','Prestada','Ejidal') DEFAULT NULL,
  `Superficie_Produccion` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Produccion` bigint(20) DEFAULT NULL,
  `Superficie_Agricultura` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Agricultura` bigint(20) DEFAULT NULL,
  `rubro_agricultura` varchar(100) DEFAULT NULL,
  `Superficie_Ganaderia` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Ganaderia` bigint(20) DEFAULT NULL,
  `rubro_ganaderia` varchar(100) DEFAULT NULL,
  `Superficie_Apicultura` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Apicultura` bigint(20) DEFAULT NULL,
  `Superficie_Forestal` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Forestal` bigint(20) DEFAULT NULL,
  `rubro_forestal` varchar(100) DEFAULT NULL,
  `Id_Superficie_Acuacultura` int(11) DEFAULT NULL,
  `Superficie_Acuacultura` decimal(10,2) DEFAULT NULL,
  `Numero_Estanques` int(11) DEFAULT NULL,
  `Id_Superficie_Agroturismo` int(11) DEFAULT NULL,
  `Superficie_Agroturismo` decimal(10,2) DEFAULT NULL,
  `Superficie_Otros` decimal(10,2) DEFAULT NULL,
  `Otros_Descripcion` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Creado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`Id_Unidad_Productiva`),
  KEY `FK_Id_Ficha_Unidad_Productora` (`Id_Ficha`),
  KEY `FK_Id_Ubicacion_Unidad_Productora` (`Id_Ubicacion`),
  KEY `FK_Id_Productor_Unidad_Productora` (`Id_Productor`),
  KEY `FK_Id_Medida_Produccion` (`Id_Medida_Produccion`),
  KEY `FK_Id_Medida_Agricultura` (`Id_Medida_Agricultura`),
  KEY `FK_Id_Medida_Ganaderia` (`Id_Medida_Ganaderia`),
  KEY `FK_Id_Medida_Apicultura` (`Id_Medida_Apicultura`),
  KEY `FK_Id_Medida_Forestal` (`Id_Medida_Forestal`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_unidad_productora`
--

LOCK TABLES `tbl_unidad_productora` WRITE;
/*!40000 ALTER TABLE `tbl_unidad_productora` DISABLE KEYS */;
INSERT INTO `tbl_unidad_productora` VALUES (7,1,7,12,'Ejidal',NULL,4,100.00,2,'Siembra',50.00,8,'Vacas',40.00,1,20.00,8,'pinos',3,2.00,5,8,4.00,NULL,'Area de picnic',NULL,'HARU','2024-04-25 23:52:48',NULL,'2024-04-25 23:52:48','A'),(8,2,8,13,'Propia',NULL,2,2.00,100,'agricultura',100.00,2,'ganaderia',100.00,2,100.00,2,'forestal',2,100.00,100,2,100.00,NULL,'otros usos',NULL,'HARU','2024-04-26 02:12:07','HARU','2024-04-27 03:49:27','A'),(9,3,9,14,'Propia',NULL,2,2.00,0,'agricultura',100.00,2,'ganaderia',100.00,2,100.00,2,'forestal',2,100.00,100,2,100.00,NULL,'otros usos',NULL,'HARU','2024-04-26 02:12:07','HARU','2024-04-27 03:47:09','A'),(10,4,10,15,'Propia',NULL,2,0.00,2,'agricultura',100.00,2,'ganaderia',100.00,2,100.00,2,'forestal',2,100.00,100,2,100.00,NULL,'otros usos',NULL,'HARU','2024-04-26 02:12:07','HARU','2024-04-27 03:38:53','A'),(11,5,11,16,'Propia',NULL,3,0.00,3,'trwwrf',400.00,3,'fdsfdsfd',2323.00,3,10.00,3,'gsfdsfv',3,10.00,323,3,232.00,NULL,'Area de picnic',NULL,'HARU','2024-04-27 03:19:24','HARU','2024-05-01 02:21:41','A'),(14,9,12,20,'Alquilada',NULL,1,2.00,14,'ewrwer',4.00,2,'dfdsf',3.00,12,121.00,2,'rewrwer',6,12.00,5,11,12.00,NULL,'fff',NULL,'HARU','2024-05-01 02:41:15',NULL,'2024-05-01 02:41:15','A'),(15,10,13,21,'Alquilada',NULL,1,2.00,14,'ewrwer',4.00,2,'dfdsf',3.00,12,121.00,2,'rewrwer',6,12.00,5,11,12.00,NULL,'fff',NULL,'HARU','2024-05-01 02:41:15',NULL,'2024-05-01 02:41:15','A'),(16,11,14,22,'Alquilada',NULL,1,14.00,2,'ewrwer',4.00,2,'dfdsf',3.00,12,121.00,2,'rewrwer',6,12.00,5,11,12.00,NULL,'fff',NULL,'HARU','2024-05-01 02:41:15','HARU','2024-05-01 04:39:32','A');
/*!40000 ALTER TABLE `tbl_unidad_productora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_venta_pecuario`
--

DROP TABLE IF EXISTS `tbl_venta_pecuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_venta_pecuario` (
  `Id_ficha` bigint(20) NOT NULL,
  `Id_productor` bigint(20) NOT NULL,
  `Tipo_pecurio` bigint(20) NOT NULL,
  `Precio_venta` decimal(20,0) NOT NULL,
  `Unidad_medida` bigint(20) NOT NULL,
  `Mercado` varchar(50) NOT NULL,
  `Creado_Por` varchar(50) DEFAULT NULL,
  `Fecha_creacion` timestamp NULL DEFAULT current_timestamp(),
  `Actualizado_por` varchar(50) DEFAULT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') NOT NULL DEFAULT 'A',
  KEY `fk_tipo_pecuario` (`Tipo_pecurio`),
  KEY `fk_unidad_medida` (`Unidad_medida`),
  KEY `fk_id_ficha_tbl_venta_pecuario` (`Id_ficha`),
  KEY `fk_id_productor_tbl_venta_pecuario` (`Id_productor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_venta_pecuario`
--

LOCK TABLES `tbl_venta_pecuario` WRITE;
/*!40000 ALTER TABLE `tbl_venta_pecuario` DISABLE KEYS */;
INSERT INTO `tbl_venta_pecuario` VALUES (5,16,3,12,3,'1','HARU','2024-05-01 02:23:45',NULL,'2024-05-01 02:23:45','A'),(5,16,1,1,1,'1','HARU','2024-05-01 02:23:45',NULL,'2024-05-01 02:23:45','A'),(8,19,1,2,1,'1','HARU','2024-05-01 02:34:24',NULL,'2024-05-01 02:34:24','A'),(9,20,1,11,1,'2','HARU','2024-05-01 02:41:46',NULL,'2024-05-01 02:41:46','A'),(9,20,3,33,4,'1','HARU','2024-05-01 02:41:47',NULL,'2024-05-01 02:41:47','A'),(11,22,1,11,1,'2','HARU','2024-05-01 04:21:49',NULL,'2024-05-01 04:21:49','A'),(11,22,3,33,4,'1','HARU','2024-05-01 04:21:49',NULL,'2024-05-01 04:21:49','A');
/*!40000 ALTER TABLE `tbl_venta_pecuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `Id_Usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_rol` bigint(20) NOT NULL,
  `nombre_completo` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `Token` varchar(100) DEFAULT NULL,
  `Fecha_Vencimiento_Token` datetime DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Actualizado_Por` bigint(20) NOT NULL,
  `Fecha_Actualizacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Preguntas_Contestadas` int(11) NOT NULL,
  `Estado` enum('ACTIVO','INACTIVO','PENDIENTE','BLOQUEADO') NOT NULL,
  `id_estado` bigint(20) NOT NULL DEFAULT 3,
  `Primera_Vez` enum('SI','NO') NOT NULL,
  `fecha_vencimiento` timestamp NOT NULL DEFAULT current_timestamp(),
  `Intentos_Preguntas` int(3) DEFAULT NULL,
  `Preguntas_Correctas` int(3) DEFAULT NULL,
  `Intentos_Fallidos` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Usuario`),
  KEY `Estado` (`id_estado`),
  KEY `Rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'manuel','manuel@gmail.com','manu','123','1',NULL,'2023-10-29 01:48:15',1,'2023-10-30 01:48:15',1,'ACTIVO',1,'SI','2023-10-31 06:00:00',NULL,NULL,0),(9,1,'MANUEL FIGUEROA','manuelfigueroa2818@gmail.com','HARU','$2y$10$zRXi8ImgUMfdkZsNdySI9ewwh2FyTNdzZiFWux.DdA7g/33DnadOW',NULL,NULL,'2023-12-10 14:00:24',0,'2023-12-10 07:00:24',0,'ACTIVO',1,'SI','1970-01-01 07:00:00',NULL,NULL,0),(11,2,'MANUEL FIGUEROA BARAHONA','mdfigueroa@unah.hn','MANUBARA','$2y$10$UF/ahTJn5okUojk8aTN/uOiuWNJ2AnDdySKNNewLKLaC7WtZORzTu',NULL,NULL,'2023-12-10 22:25:54',0,'2023-12-10 15:25:54',0,'ACTIVO',1,'SI','2024-12-04 22:25:54',NULL,NULL,0),(13,1,'Enrique','manuelfigueroa2818@gmail.com','Enri','$2y$10$pwhObKfogmDRxnB57iSfr.ux6s2E3HJYB6snkAg8LXmRaxrOAfiK6',NULL,NULL,'2024-02-18 20:26:49',0,'2024-02-18 20:26:49',0,'ACTIVO',4,'SI','2024-02-18 20:26:49',NULL,NULL,NULL),(14,1,'USUARIO','usuario@usuario.com','USUARIO','$2y$10$LVE7hGMrlZWH/HaRI5HBi.LZRKjNwUzXVvBUnEDpvQeZoZi78DTHS',NULL,NULL,'2024-04-29 01:25:52',0,'2024-04-28 17:25:52',0,'ACTIVO',1,'SI','2025-04-24 01:25:52',NULL,NULL,0),(15,2,'CARLOS VACAS','principal@gmail.com','CARLOSV','$2y$10$EY0Z2Ro6taSicrlSDgKh2O7XvNL89AZ43NDkkwi7oKoPhePVT5a8.',NULL,NULL,'2024-04-29 03:11:09',0,'2024-04-28 19:11:09',0,'ACTIVO',1,'SI','2025-04-24 03:11:09',NULL,NULL,0),(16,2,'','','','$2y$10$2BnbJc6EV5BtjM/8CxQeSuAt6egw3NAaBUjTELhbnydPb6B.uWNji',NULL,NULL,'2024-05-01 12:59:07',0,'2024-05-01 04:59:07',0,'ACTIVO',3,'SI','2025-04-26 12:59:07',NULL,NULL,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-30 23:04:20
