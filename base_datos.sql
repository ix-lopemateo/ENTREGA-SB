-- MySQL dump 10.13  Distrib 8.0.27-18, for Linux (x86_64)
--
-- Host: localhost    Database: b3b2
-- ------------------------------------------------------
-- Server version	8.0.27-18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `b3b2_estudio`
--

DROP TABLE IF EXISTS `b3b2_estudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b3b2_estudio` (
  `expediente` varchar(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`expediente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b3b2_estudio`
--

LOCK TABLES `b3b2_estudio` WRITE;
/*!40000 ALTER TABLE `b3b2_estudio` DISABLE KEYS */;
INSERT INTO `b3b2_estudio` VALUES ('EXP1','Estudio de la practica de Sistemas Bioinfomaticos');
/*!40000 ALTER TABLE `b3b2_estudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b3b2_estudio_propiedad_biologica`
--

DROP TABLE IF EXISTS `b3b2_estudio_propiedad_biologica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b3b2_estudio_propiedad_biologica` (
  `estudio` varchar(255) NOT NULL,
  `propiedad_biologicacol` varchar(255) NOT NULL,
  PRIMARY KEY (`estudio`,`propiedad_biologicacol`),
  KEY `fk_b3b2_propiedad_biologica_idx` (`propiedad_biologicacol`),
  CONSTRAINT `fk_b3b2_estudio` FOREIGN KEY (`estudio`) REFERENCES `b3b2_estudio` (`expediente`),
  CONSTRAINT `fk_b3b2_propiedad_biologica` FOREIGN KEY (`propiedad_biologicacol`) REFERENCES `b3b2_propiedad_biologica` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b3b2_estudio_propiedad_biologica`
--

LOCK TABLES `b3b2_estudio_propiedad_biologica` WRITE;
/*!40000 ALTER TABLE `b3b2_estudio_propiedad_biologica` DISABLE KEYS */;
INSERT INTO `b3b2_estudio_propiedad_biologica` VALUES ('EXP1','edad'),('EXP1','patologia'),('EXP1','sexo'),('EXP1','tratamiento');
/*!40000 ALTER TABLE `b3b2_estudio_propiedad_biologica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b3b2_muestra`
--

DROP TABLE IF EXISTS `b3b2_muestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b3b2_muestra` (
  `codigo` varchar(255) NOT NULL,
  `sujeto` varchar(255) NOT NULL,
  `origen` varchar(255) NOT NULL,
  `tecnica_extraccion_dna` varchar(255) NOT NULL,
  `run` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`sujeto`),
  KEY `fk_b3b2_muestra_sujeto_idx` (`sujeto`),
  KEY `fk_b3b2_muestra_run_idx` (`run`),
  KEY `fk_b3b2_muestra_origen_idx` (`origen`),
  CONSTRAINT `fk_b3b2_muestra_origen` FOREIGN KEY (`origen`) REFERENCES `b3b2_origen` (`uri`),
  CONSTRAINT `fk_b3b2_muestra_run` FOREIGN KEY (`run`) REFERENCES `b3b2_run` (`codigo`),
  CONSTRAINT `fk_b3b2_muestra_sujeto` FOREIGN KEY (`sujeto`) REFERENCES `b3b2_sujeto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b3b2_muestra`
--

LOCK TABLES `b3b2_muestra` WRITE;
/*!40000 ALTER TABLE `b3b2_muestra` DISABLE KEYS */;
/*!40000 ALTER TABLE `b3b2_muestra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b3b2_muestra_taxon`
--

DROP TABLE IF EXISTS `b3b2_muestra_taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b3b2_muestra_taxon` (
  `muestra` varchar(255) NOT NULL,
  `taxon` varchar(255) NOT NULL,
  `numero_lecturas` int NOT NULL,
  `confidence` double NOT NULL,
  PRIMARY KEY (`muestra`,`taxon`),
  KEY `fk_b3b2_muestra_taxon_2_idx` (`taxon`),
  CONSTRAINT `fk_b3b2_muestra_taxon_1` FOREIGN KEY (`muestra`) REFERENCES `b3b2_muestra` (`codigo`),
  CONSTRAINT `fk_b3b2_muestra_taxon_2` FOREIGN KEY (`taxon`) REFERENCES `b3b2_taxon` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b3b2_muestra_taxon`
--

LOCK TABLES `b3b2_muestra_taxon` WRITE;
/*!40000 ALTER TABLE `b3b2_muestra_taxon` DISABLE KEYS */;
/*!40000 ALTER TABLE `b3b2_muestra_taxon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b3b2_origen`
--

DROP TABLE IF EXISTS `b3b2_origen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b3b2_origen` (
  `uri` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b3b2_origen`
--

LOCK TABLES `b3b2_origen` WRITE;
/*!40000 ALTER TABLE `b3b2_origen` DISABLE KEYS */;
/*!40000 ALTER TABLE `b3b2_origen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b3b2_propiedad_biologica`
--

DROP TABLE IF EXISTS `b3b2_propiedad_biologica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b3b2_propiedad_biologica` (
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b3b2_propiedad_biologica`
--

LOCK TABLES `b3b2_propiedad_biologica` WRITE;
/*!40000 ALTER TABLE `b3b2_propiedad_biologica` DISABLE KEYS */;
INSERT INTO `b3b2_propiedad_biologica` VALUES ('edad',NULL),('patologia',NULL),('sexo',NULL),('tratamiento',NULL);
/*!40000 ALTER TABLE `b3b2_propiedad_biologica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b3b2_run`
--

DROP TABLE IF EXISTS `b3b2_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b3b2_run` (
  `codigo` varchar(255) NOT NULL,
  `fecha_secuenciacion` date NOT NULL,
  `libreria_secuenciacion` varchar(255) NOT NULL,
  `modelo_secuenciador` varchar(255) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b3b2_run`
--

LOCK TABLES `b3b2_run` WRITE;
/*!40000 ALTER TABLE `b3b2_run` DISABLE KEYS */;
INSERT INTO `b3b2_run` VALUES ('RUN_1','2025-03-17','lib1','illumina'),('RUN_2','2025-03-28','lib2','pacbio'),('RUN_3','2025-04-05','lib3','nanopore'),('RUN_4','2025-04-06','lib1','illumina'),('RUN_5','2025-06-07','lib1','illumina');
/*!40000 ALTER TABLE `b3b2_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b3b2_sujeto`
--

DROP TABLE IF EXISTS `b3b2_sujeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b3b2_sujeto` (
  `codigo` varchar(255) NOT NULL,
  `estudio` varchar(255) NOT NULL,
  `taxon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`estudio`),
  KEY `fk_b3b2_estudio_idx` (`estudio`),
  KEY `fk_b3b2_sujeto_taxon_idx` (`taxon`),
  CONSTRAINT `fk_b3b2_sujeto_estudio` FOREIGN KEY (`estudio`) REFERENCES `b3b2_estudio` (`expediente`),
  CONSTRAINT `fk_b3b2_sujeto_taxon` FOREIGN KEY (`taxon`) REFERENCES `b3b2_taxon` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b3b2_sujeto`
--

LOCK TABLES `b3b2_sujeto` WRITE;
/*!40000 ALTER TABLE `b3b2_sujeto` DISABLE KEYS */;
INSERT INTO `b3b2_sujeto` VALUES ('PAC_1','EXP1','homo sapiens'),('PAC_10','EXP1','homo sapiens'),('PAC_11','EXP1','homo sapiens'),('PAC_12','EXP1','homo sapiens'),('PAC_13','EXP1','homo sapiens'),('PAC_14','EXP1','homo sapiens'),('PAC_15','EXP1','homo sapiens'),('PAC_16','EXP1','homo sapiens'),('PAC_17','EXP1','homo sapiens'),('PAC_18','EXP1','homo sapiens'),('PAC_19','EXP1','homo sapiens'),('PAC_2','EXP1','homo sapiens'),('PAC_20','EXP1','homo sapiens'),('PAC_21','EXP1','homo sapiens'),('PAC_22','EXP1','homo sapiens'),('PAC_23','EXP1','homo sapiens'),('PAC_24','EXP1','homo sapiens'),('PAC_25','EXP1','homo sapiens'),('PAC_26','EXP1','homo sapiens'),('PAC_27','EXP1','homo sapiens'),('PAC_28','EXP1','homo sapiens'),('PAC_29','EXP1','homo sapiens'),('PAC_3','EXP1','homo sapiens'),('PAC_30','EXP1','homo sapiens'),('PAC_31','EXP1','homo sapiens'),('PAC_32','EXP1','homo sapiens'),('PAC_33','EXP1','homo sapiens'),('PAC_34','EXP1','homo sapiens'),('PAC_35','EXP1','homo sapiens'),('PAC_36','EXP1','homo sapiens'),('PAC_37','EXP1','homo sapiens'),('PAC_38','EXP1','homo sapiens'),('PAC_39','EXP1','homo sapiens'),('PAC_4','EXP1','homo sapiens'),('PAC_40','EXP1','homo sapiens'),('PAC_41','EXP1','homo sapiens'),('PAC_5','EXP1','homo sapiens'),('PAC_6','EXP1','homo sapiens'),('PAC_7','EXP1','homo sapiens'),('PAC_8','EXP1','homo sapiens'),('PAC_9','EXP1','homo sapiens');
/*!40000 ALTER TABLE `b3b2_sujeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b3b2_sujeto_valor_propiedad_biologica`
--

DROP TABLE IF EXISTS `b3b2_sujeto_valor_propiedad_biologica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b3b2_sujeto_valor_propiedad_biologica` (
  `valor_propiedad_biologica` varchar(255) NOT NULL,
  `sujeto` varchar(255) NOT NULL,
  PRIMARY KEY (`valor_propiedad_biologica`,`sujeto`),
  KEY `fk_b3b2_sujeto_valor_propiedad_biologica_2_idx` (`sujeto`),
  CONSTRAINT `fk_b3b2_sujeto_valor_propiedad_biologica` FOREIGN KEY (`valor_propiedad_biologica`) REFERENCES `b3b2_valor_propiedad_biologica` (`nombre`),
  CONSTRAINT `fk_b3b2_sujeto_valor_propiedad_biologica_2` FOREIGN KEY (`sujeto`) REFERENCES `b3b2_sujeto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b3b2_sujeto_valor_propiedad_biologica`
--

LOCK TABLES `b3b2_sujeto_valor_propiedad_biologica` WRITE;
/*!40000 ALTER TABLE `b3b2_sujeto_valor_propiedad_biologica` DISABLE KEYS */;
INSERT INTO `b3b2_sujeto_valor_propiedad_biologica` VALUES ('41-50','PAC_1'),('analgesico','PAC_1'),('antihipertensivo','PAC_1'),('antiinflamatorio','PAC_1'),('hematologica','PAC_1'),('infecciosa','PAC_1'),('mujer','PAC_1'),('neurologica','PAC_1'),('oncologica','PAC_1'),('31-40','PAC_10'),('antibioticos','PAC_10'),('hematologica','PAC_10'),('mujer','PAC_10'),('71-80','PAC_11'),('antihipertensivo','PAC_11'),('cardiovascular','PAC_11'),('hematologica','PAC_11'),('hombre','PAC_11'),('>80','PAC_12'),('antihipertensivo','PAC_12'),('antiinflamatorio','PAC_12'),('hematologica','PAC_12'),('mujer','PAC_12'),('neurologica','PAC_12'),('51-60','PAC_13'),('antibioticos','PAC_13'),('cardiovascular','PAC_13'),('hematologica','PAC_13'),('hombre','PAC_13'),('infecciosa','PAC_13'),('neurologica','PAC_13'),('19-30','PAC_14'),('antihipertensivo','PAC_14'),('cardiovascular','PAC_14'),('hematologica','PAC_14'),('mujer','PAC_14'),('oncologica','PAC_14'),('0-18','PAC_15'),('antibioticos','PAC_15'),('hombre','PAC_15'),('neurologica','PAC_15'),('0-18','PAC_16'),('antiinflamatorio','PAC_16'),('infecciosa','PAC_16'),('mujer','PAC_16'),('61-70','PAC_17'),('antihipertensivo','PAC_17'),('hombre','PAC_17'),('infecciosa','PAC_17'),('41-50','PAC_18'),('antibioticos','PAC_18'),('hombre','PAC_18'),('infecciosa','PAC_18'),('oncologica','PAC_18'),('51-60','PAC_19'),('antibioticos','PAC_19'),('antihipertensivo','PAC_19'),('hematologica','PAC_19'),('infecciosa','PAC_19'),('mujer','PAC_19'),('neurologica','PAC_19'),('oncologica','PAC_19'),('0-18','PAC_2'),('antihipertensivo','PAC_2'),('cardiovascular','PAC_2'),('hematologica','PAC_2'),('mujer','PAC_2'),('oncologica','PAC_2'),('31-40','PAC_20'),('analgesico','PAC_20'),('antiinflamatorio','PAC_20'),('cardiovascular','PAC_20'),('mujer','PAC_20'),('neurologica','PAC_20'),('51-60','PAC_21'),('analgesico','PAC_21'),('hombre','PAC_21'),('oncologica','PAC_21'),('51-60','PAC_22'),('antibioticos','PAC_22'),('infecciosa','PAC_22'),('mujer','PAC_22'),('19-30','PAC_23'),('hombre','PAC_23'),('71-80','PAC_24'),('antihipertensivo','PAC_24'),('cardiovascular','PAC_24'),('hematologica','PAC_24'),('hombre','PAC_24'),('neurologica','PAC_24'),('31-40','PAC_25'),('mujer','PAC_25'),('>80','PAC_26'),('analgesico','PAC_26'),('antibioticos','PAC_26'),('antihipertensivo','PAC_26'),('infecciosa','PAC_26'),('mujer','PAC_26'),('neurologica','PAC_26'),('oncologica','PAC_26'),('0-18','PAC_27'),('antibioticos','PAC_27'),('antihipertensivo','PAC_27'),('cardiovascular','PAC_27'),('hombre','PAC_27'),('infecciosa','PAC_27'),('neurologica','PAC_27'),('41-50','PAC_28'),('analgesico','PAC_28'),('antihipertensivo','PAC_28'),('mujer','PAC_28'),('neurologica','PAC_28'),('oncologica','PAC_28'),('71-80','PAC_29'),('mujer','PAC_29'),('41-50','PAC_3'),('mujer','PAC_3'),('71-80','PAC_30'),('antiinflamatorio','PAC_30'),('hombre','PAC_30'),('infecciosa','PAC_30'),('51-60','PAC_31'),('analgesico','PAC_31'),('hombre','PAC_31'),('infecciosa','PAC_31'),('neurologica','PAC_31'),('19-30','PAC_32'),('analgesico','PAC_32'),('hombre','PAC_32'),('neurologica','PAC_32'),('oncologica','PAC_32'),('51-60','PAC_33'),('antiinflamatorio','PAC_33'),('cardiovascular','PAC_33'),('hombre','PAC_33'),('neurologica','PAC_33'),('oncologica','PAC_33'),('71-80','PAC_34'),('antiinflamatorio','PAC_34'),('cardiovascular','PAC_34'),('hombre','PAC_34'),('31-40','PAC_35'),('analgesico','PAC_35'),('hematologica','PAC_35'),('mujer','PAC_35'),('41-50','PAC_36'),('analgesico','PAC_36'),('antibioticos','PAC_36'),('hematologica','PAC_36'),('infecciosa','PAC_36'),('mujer','PAC_36'),('oncologica','PAC_36'),('>80','PAC_37'),('analgesico','PAC_37'),('antihipertensivo','PAC_37'),('antiinflamatorio','PAC_37'),('cardiovascular','PAC_37'),('hombre','PAC_37'),('infecciosa','PAC_37'),('neurologica','PAC_37'),('0-18','PAC_38'),('antibioticos','PAC_38'),('cardiovascular','PAC_38'),('hombre','PAC_38'),('infecciosa','PAC_38'),('>80','PAC_39'),('analgesico','PAC_39'),('infecciosa','PAC_39'),('mujer','PAC_39'),('51-60','PAC_4'),('antihipertensivo','PAC_4'),('cardiovascular','PAC_4'),('hematologica','PAC_4'),('hombre','PAC_4'),('neurologica','PAC_4'),('oncologica','PAC_4'),('0-18','PAC_40'),('analgesico','PAC_40'),('antibioticos','PAC_40'),('hematologica','PAC_40'),('infecciosa','PAC_40'),('mujer','PAC_40'),('oncologica','PAC_40'),('71-80','PAC_41'),('analgesico','PAC_41'),('antibioticos','PAC_41'),('infecciosa','PAC_41'),('mujer','PAC_41'),('neurologica','PAC_41'),('41-50','PAC_5'),('mujer','PAC_5'),('19-30','PAC_6'),('antibioticos','PAC_6'),('hematologica','PAC_6'),('hombre','PAC_6'),('infecciosa','PAC_6'),('neurologica','PAC_6'),('oncologica','PAC_6'),('61-70','PAC_7'),('antibioticos','PAC_7'),('antihipertensivo','PAC_7'),('antiinflamatorio','PAC_7'),('hematologica','PAC_7'),('hombre','PAC_7'),('neurologica','PAC_7'),('oncologica','PAC_7'),('71-80','PAC_8'),('analgesico','PAC_8'),('antibioticos','PAC_8'),('mujer','PAC_8'),('neurologica','PAC_8'),('oncologica','PAC_8'),('71-80','PAC_9'),('mujer','PAC_9');
/*!40000 ALTER TABLE `b3b2_sujeto_valor_propiedad_biologica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b3b2_taxon`
--

DROP TABLE IF EXISTS `b3b2_taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b3b2_taxon` (
  `nombre` varchar(255) NOT NULL,
  `tipo_taxon` enum('Kingdom','Phylum','Class','Order','Family','Genus','Species') NOT NULL,
  `padre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nombre`,`tipo_taxon`),
  KEY `fk_b3b2_taxon_padre_idx` (`padre`),
  CONSTRAINT `fk_b3b2_taxon_padre` FOREIGN KEY (`padre`) REFERENCES `b3b2_taxon` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b3b2_taxon`
--

LOCK TABLES `b3b2_taxon` WRITE;
/*!40000 ALTER TABLE `b3b2_taxon` DISABLE KEYS */;
INSERT INTO `b3b2_taxon` VALUES ('homo sapiens','Species',NULL);
/*!40000 ALTER TABLE `b3b2_taxon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b3b2_valor_propiedad_biologica`
--

DROP TABLE IF EXISTS `b3b2_valor_propiedad_biologica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b3b2_valor_propiedad_biologica` (
  `nombre` varchar(255) NOT NULL,
  `propiedad_biologica` varchar(255) NOT NULL,
  PRIMARY KEY (`nombre`,`propiedad_biologica`),
  KEY `fk_b3b2_valor_propiedad_biologica_idx` (`propiedad_biologica`),
  CONSTRAINT `fk_b3b2_valor_propiedad_biologica` FOREIGN KEY (`propiedad_biologica`) REFERENCES `b3b2_propiedad_biologica` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b3b2_valor_propiedad_biologica`
--

LOCK TABLES `b3b2_valor_propiedad_biologica` WRITE;
/*!40000 ALTER TABLE `b3b2_valor_propiedad_biologica` DISABLE KEYS */;
INSERT INTO `b3b2_valor_propiedad_biologica` VALUES ('>80','edad'),('0-18','edad'),('19-30','edad'),('31-40','edad'),('41-50','edad'),('51-60','edad'),('61-70','edad'),('71-80','edad'),('cardiovascular','patologia'),('hematologica','patologia'),('infecciosa','patologia'),('neurologica','patologia'),('oncologica','patologia'),('hombre','sexo'),('mujer','sexo'),('analgesico','tratamiento'),('antibioticos','tratamiento'),('antihipertensivo','tratamiento'),('antiinflamatorio','tratamiento');
/*!40000 ALTER TABLE `b3b2_valor_propiedad_biologica` ENABLE KEYS */;
UNLOCK TABLES;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-10 18:54:56
