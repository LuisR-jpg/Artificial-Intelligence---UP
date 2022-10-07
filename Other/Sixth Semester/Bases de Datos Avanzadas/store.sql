-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: store
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `birth_date` date NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `adress` varchar(45) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `state` varchar(25) NOT NULL,
  `points` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Barbara','Lopez','1986-03-28','962-625-7744','CENTRAL PONIENTE NO 18','Aguascalientes','AG',2273),(2,'Ines','Gomez','1986-04-13','804-427-9456','CAMPANA NO. 1708','Baja California Nte','BC',947),(3,'Alfredo','Borges','1985-02-07','719-724-7869','RIO SALINAS NO. 1118','Baja California Sur','BS',2967),(4,'Amara','Limon','1974-04-14','407-231-8017',' AV AGUASCALIENTES SUR 217','Ciudad de México','CX',457),(5,'Clemente','Hernández','1973-11-07',NULL,'CIRCUITO ARCO SUR SN','Chihuahua','CH',3675),(6,'María ','García','1991-09-04','312-480-8498','REPUBLICA DE NICARAGUA Nº605','Puebla','PU',3073),(7,'Valeria','Martínez','1964-08-30','615-641-4759','50 Lillian Crossing','Queretaro','QT',1672),(8,'Sofia','Pérez','1993-07-17','941-527-3977','AZALEA NO. 709','San Luis','SL',205),(9,'Renata','Rodríguez','1992-05-23','559-181-3744',' RICARTE 580 INT 2','Sinaloa','SI',1486),(10,'Victoria','Sánchez','1969-10-13','404-246-3370','CALLE 3 NO. 41 NO. B','Zacatecas','ZA',796),(20,'Sarita','Gomez','2000-12-31','474-020-068','valle del rio #112','Lagos de Moreno','JL',100);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item_notes`
--

DROP TABLE IF EXISTS `order_item_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item_notes` (
  `note_id` varchar(50) NOT NULL,
  `order_Id` varchar(45) NOT NULL,
  `product_id` varchar(45) NOT NULL,
  `note` varchar(45) NOT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item_notes`
--

LOCK TABLES `order_item_notes` WRITE;
/*!40000 ALTER TABLE `order_item_notes` DISABLE KEYS */;
INSERT INTO `order_item_notes` VALUES ('1','1','2','nota ejemplo 1'),('2','1','2','nota ejemplo 2');
/*!40000 ALTER TABLE `order_item_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id_order` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` float NOT NULL,
  PRIMARY KEY (`id_order`,`product_id`),
  KEY `product_id_idx` (`product_id`),
  CONSTRAINT `id_order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,4,4,600),(2,1,2,8000),(2,4,4,600),(2,6,2,200),(3,3,10,12000),(4,3,7,12000),(4,10,7,4000),(5,2,3,1500),(6,1,4,8000),(6,2,4,1500),(6,3,4,12000),(6,5,1,800),(7,3,7,12000),(8,5,2,800),(8,8,2,14000),(9,6,5,200),(10,1,10,8000),(10,9,9,20000);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_statuses` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_statuses`
--

LOCK TABLES `order_statuses` WRITE;
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
INSERT INTO `order_statuses` VALUES (1,'Procesada'),(2,'Enviada'),(3,'Entregada');
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` date NOT NULL,
  `status` int NOT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `shipped_date` date DEFAULT NULL,
  `shipped_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id_idx` (`customer_id`),
  KEY `status_idx` (`status`),
  KEY `shipper_id_idx` (`shipped_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `shipper_id` FOREIGN KEY (`shipped_id`) REFERENCES `shippers` (`id`),
  CONSTRAINT `status` FOREIGN KEY (`status`) REFERENCES `order_statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,6,'2024-01-30',1,'Lorem Ipsum is simply dummy text of the printing and typesetting',NULL,NULL),(2,7,'2022-08-02',2,NULL,'2018-08-03',4),(3,8,'2021-12-01',1,NULL,NULL,NULL),(4,2,'2021-01-22',1,NULL,NULL,NULL),(5,5,'2021-08-25',2,'','2017-08-26',3),(6,10,'2022-11-18',1,'Aliquam erat volutpat. In congue.',NULL,NULL),(7,2,'2022-09-22',2,NULL,'2018-09-23',4),(8,5,'2022-06-08',1,'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',NULL,NULL),(9,10,'2021-07-05',2,'Nulla mollis molestie lorem. Quisque ut erat.','2017-07-06',1),(10,6,'2022-04-22',2,NULL,'2018-04-23',2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `quantity_in_stock` int NOT NULL,
  `unit_price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Tablet',70,8000),(2,'Audifonos',49,1500),(3,'Smartphone',38,12000),(4,'Mouse ',90,600),(5,'Teclado',94,800),(6,'MousePad',14,200),(7,'Lampara',98,500),(8,'PC Gamer',26,14000),(9,'Laptop',67,20000),(10,'Smartwatch',6,4000);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respcustomers`
--

DROP TABLE IF EXISTS `respcustomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respcustomers` (
  `id` int NOT NULL DEFAULT '0',
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `birth_date` date NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `adress` varchar(45) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `state` varchar(25) NOT NULL,
  `points` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respcustomers`
--

LOCK TABLES `respcustomers` WRITE;
/*!40000 ALTER TABLE `respcustomers` DISABLE KEYS */;
INSERT INTO `respcustomers` VALUES (1,'Barbara','Lopez','1986-03-28','962-625-7744','CENTRAL PONIENTE NO 18','Aguascalientes','AG',2273),(2,'Ines','Gomez','1986-04-13','804-427-9456','CAMPANA NO. 1708','Baja California Nte','BC',947),(3,'Alfredo','Borges','1985-02-07','719-724-7869','RIO SALINAS NO. 1118','Baja California Sur','BS',2967),(4,'Amara','Limon','1974-04-14','407-231-8017',' AV AGUASCALIENTES SUR 217','Ciudad de México','CX',457),(5,'Clemente','Hernández','1973-11-07',NULL,'CIRCUITO ARCO SUR SN','Chihuahua','CH',3675),(6,'María ','García','1991-09-04','312-480-8498','REPUBLICA DE NICARAGUA Nº605','Puebla','PU',3073),(7,'Valeria','Martínez','1964-08-30','615-641-4759','50 Lillian Crossing','Queretaro','QT',1672),(8,'Sofia','Pérez','1993-07-17','941-527-3977','AZALEA NO. 709','San Luis','SL',205),(9,'Renata','Rodríguez','1992-05-23','559-181-3744',' RICARTE 580 INT 2','Sinaloa','SI',1486),(10,'Victoria','Sánchez','1969-10-13','404-246-3370','CALLE 3 NO. 41 NO. B','Zacatecas','ZA',796),(20,'Sarita','Gomez','2000-12-31','474-020-068','valle del rio #112','Lagos de Moreno','JL',100);
/*!40000 ALTER TABLE `respcustomers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resporder`
--

DROP TABLE IF EXISTS `resporder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resporder` (
  `order_id` int NOT NULL DEFAULT '0',
  `customer_id` int NOT NULL,
  `order_date` date NOT NULL,
  `status` int NOT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `shipped_date` date DEFAULT NULL,
  `shipped_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resporder`
--

LOCK TABLES `resporder` WRITE;
/*!40000 ALTER TABLE `resporder` DISABLE KEYS */;
INSERT INTO `resporder` VALUES (1,6,'2020-01-30',1,'Lorem Ipsum is simply dummy text of the printing and typesetting',NULL,NULL),(2,7,'2018-08-02',2,NULL,'2018-08-03',4),(3,8,'2017-12-01',1,NULL,NULL,NULL),(4,2,'2017-01-22',1,NULL,NULL,NULL),(5,5,'2017-08-25',2,'','2017-08-26',3),(6,10,'2018-11-18',1,'Aliquam erat volutpat. In congue.',NULL,NULL),(7,2,'2018-09-22',2,NULL,'2018-09-23',4),(8,5,'2018-06-08',1,'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',NULL,NULL),(9,10,'2017-07-05',2,'Nulla mollis molestie lorem. Quisque ut erat.','2017-07-06',1),(10,6,'2018-04-22',2,NULL,'2018-04-23',2);
/*!40000 ALTER TABLE `resporder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resporderitems`
--

DROP TABLE IF EXISTS `resporderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resporderitems` (
  `id_order` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resporderitems`
--

LOCK TABLES `resporderitems` WRITE;
/*!40000 ALTER TABLE `resporderitems` DISABLE KEYS */;
INSERT INTO `resporderitems` VALUES (1,4,4,600),(2,1,2,8000),(2,4,4,600),(2,6,2,200),(3,3,10,12000),(4,3,7,12000),(4,10,7,4000),(5,2,3,1500),(6,1,4,8000),(6,2,4,1500),(6,3,4,12000),(6,5,1,800),(7,3,7,12000),(8,5,2,800),(8,8,2,14000),(9,6,5,200),(10,1,10,8000),(10,9,9,20000);
/*!40000 ALTER TABLE `resporderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippers`
--

DROP TABLE IF EXISTS `shippers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippers`
--

LOCK TABLES `shippers` WRITE;
/*!40000 ALTER TABLE `shippers` DISABLE KEYS */;
INSERT INTO `shippers` VALUES (1,'DHL'),(2,'UPS'),(3,'FEDEX'),(4,'ESTAFETA'),(5,'AMAZON');
/*!40000 ALTER TABLE `shippers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-18 18:53:17
