-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: ceindetec15    Database: controlrfid
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acceso`
--

DROP TABLE IF EXISTS `acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acceso` (
  `acc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campo que registra el id del acceso',
  `acc_funcionario_id` int(11) NOT NULL COMMENT 'Campo que registra el funcionario que realiza el acceso',
  `acc_modulo_id` int(11) NOT NULL COMMENT 'Campo que registra el modulo al que realiza el acceso',
  `acc_fecha` date NOT NULL COMMENT 'Campo que registra la fecha en la que se realiza el acceso',
  `acc_hora` time NOT NULL COMMENT 'Campo que registra la hora en la que se realiza el acceso',
  PRIMARY KEY (`acc_id`),
  UNIQUE KEY `acc_id_UNIQUE` (`acc_id`),
  KEY `FK1_ACCESO_idx` (`acc_funcionario_id`),
  KEY `FK2_ACCESO_idx` (`acc_modulo_id`),
  CONSTRAINT `FK1_ACCESO` FOREIGN KEY (`acc_funcionario_id`) REFERENCES `funcionario` (`func_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK2_ACCESO` FOREIGN KEY (`acc_modulo_id`) REFERENCES `modulo` (`mod_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=435 DEFAULT CHARSET=utf8 COMMENT='Tabla que registra los accesos por medio del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `are_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campo que registra el id de la area',
  `are_nombre` varchar(100) NOT NULL COMMENT 'Campo que registra el nombre de la area',
  `are_estado_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Campo que registra el estado de la area',
  PRIMARY KEY (`are_id`),
  UNIQUE KEY `are_id_UNIQUE` (`are_id`),
  KEY `FK1_AREA_idx` (`are_estado_id`),
  CONSTRAINT `FK1_AREA` FOREIGN KEY (`are_estado_id`) REFERENCES `estado` (`sta_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena la informacion de las areas demarcadas en el sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `area_modulo`
--

DROP TABLE IF EXISTS `area_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_modulo` (
  `armo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campo que registra el id de la relacion area modulo',
  `armo_area_id` int(11) NOT NULL COMMENT 'Campo que registra el area de la relacion area modulo',
  `armo_modulo_id` int(11) NOT NULL COMMENT 'Campo que registra el modulo de la relacion area modulo',
  `armo_estado_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Campo que registra el estado de la relacion area modulo',
  PRIMARY KEY (`armo_id`),
  UNIQUE KEY `armo_id_UNIQUE` (`armo_id`),
  KEY `FK1_AREA_MODULO_idx` (`armo_area_id`),
  KEY `FK2_AREA_MODULO_idx` (`armo_modulo_id`),
  KEY `FK3_AREA_MODULO_idx` (`armo_estado_id`),
  CONSTRAINT `FK1_AREA_MODULO` FOREIGN KEY (`armo_area_id`) REFERENCES `area` (`are_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK2_AREA_MODULO` FOREIGN KEY (`armo_modulo_id`) REFERENCES `modulo` (`mod_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK3_AREA_MODULO` FOREIGN KEY (`armo_estado_id`) REFERENCES `estado` (`sta_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que relaciona la informacion de area y modulos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autorizacion`
--

DROP TABLE IF EXISTS `autorizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autorizacion` (
  `aut_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campo que registra el id de la autorizacion',
  `aut_funcionario_id` int(11) NOT NULL COMMENT 'Campo que registra el id del funcionario al que se le realiza la autorizacion',
  `aut_modulo_id` int(11) NOT NULL COMMENT 'Campo que registra el id del modulo al que se le realiza la autorizacion para el funcionario',
  `aut_usuario_id` int(11) NOT NULL COMMENT 'Campo que registra el id del usuario que realiza la autorizacion',
  `aut_fecha_registro` date DEFAULT NULL COMMENT 'Campo que registra la fecha de registro de la autorizacion',
  `aut_tautorizacion_id` int(11) NOT NULL COMMENT 'Campo que registra el tipo de autorizacion de la autorizacion',
  `aut_estado_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Campo que registra el estado de la autorizacion',
  PRIMARY KEY (`aut_id`),
  UNIQUE KEY `aut_id_UNIQUE` (`aut_id`),
  KEY `FK1_AUTORIZACION_idx` (`aut_funcionario_id`),
  KEY `FK2_AUTORIZACION_idx` (`aut_modulo_id`),
  KEY `FK3_AUTORIZACION_idx` (`aut_usuario_id`),
  KEY `FK4_AUTORIZACION_idx` (`aut_estado_id`),
  KEY `FK4_AUTORIZACION_idx1` (`aut_tautorizacion_id`),
  CONSTRAINT `FK1_AUTORIZACION` FOREIGN KEY (`aut_funcionario_id`) REFERENCES `funcionario` (`func_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK2_AUTORIZACION` FOREIGN KEY (`aut_modulo_id`) REFERENCES `modulo` (`mod_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK3_AUTORIZACION` FOREIGN KEY (`aut_usuario_id`) REFERENCES `usuario` (`usu_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK4_AUTORIZACION` FOREIGN KEY (`aut_tautorizacion_id`) REFERENCES `tipo_autorizacion` (`taut_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK5_AUTORIZACION` FOREIGN KEY (`aut_estado_id`) REFERENCES `estado` (`sta_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena las autorizaciones para los permisos provisionales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuracion_server`
--

DROP TABLE IF EXISTS `configuracion_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracion_server` (
  `conser_id` int(11) NOT NULL COMMENT 'Campo que registra el id del servidor',
  `conser_address` varchar(45) NOT NULL COMMENT 'Campo que registra la direccion de acceso del servidor',
  `conser_port` int(11) NOT NULL COMMENT 'Campo que registra el puerto de acceso del servidor',
  `conser_estado` int(11) NOT NULL DEFAULT '1' COMMENT 'Campo que registra el estado de la configuracion del servidor',
  PRIMARY KEY (`conser_id`),
  UNIQUE KEY `conser_id_UNIQUE` (`conser_id`),
  KEY `FKO_CONFIGURACION_SERVER_idx` (`conser_estado`),
  CONSTRAINT `FKO_CONFIGURACION_SERVER` FOREIGN KEY (`conser_estado`) REFERENCES `estado` (`sta_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena la configuracion del servidor para el uso del web socket	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `sta_id` int(11) NOT NULL COMMENT 'Campo que registra el id del estado',
  `sta_nombre` varchar(45) NOT NULL COMMENT 'Campo que registra el nombre del estado',
  `sta_estado_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Campo que registra el estado del estado',
  PRIMARY KEY (`sta_id`),
  UNIQUE KEY `sta_id_UNIQUE` (`sta_id`),
  KEY `FK1_ESTADO_idx` (`sta_estado_id`),
  CONSTRAINT `FK1_ESTADO` FOREIGN KEY (`sta_estado_id`) REFERENCES `estado` (`sta_id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena los estados disponibles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `func_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campo que registra el id del funcionario',
  `func_tfuncionario_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Campo que registra el tipo de funcionario',
  `func_tdocumento_id` int(11) DEFAULT NULL COMMENT 'Campo que registra el tipo de documento del funcionario',
  `func_documento` varchar(11) DEFAULT NULL COMMENT 'Campo que registra el documento del funcionario',
  `func_tarjeta` varchar(45) NOT NULL COMMENT 'Campo que registra el codigo de la tarjeta RFID del funcionario',
  `func_nombres` varchar(100) DEFAULT NULL COMMENT 'Campo que registra los nombres del funcionario',
  `func_apellidos` varchar(100) DEFAULT NULL COMMENT 'Campo que registra los apellidos del funcionario',
  `func_estado_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Campo que registra el estado del funcionario',
  PRIMARY KEY (`func_id`),
  UNIQUE KEY `func_id_UNIQUE` (`func_id`),
  KEY `FK0_FUNCIONARIO_idx` (`func_tfuncionario_id`),
  KEY `FK1_FUNCIONARIO_idx` (`func_tdocumento_id`),
  KEY `FK2_FUNCIONARIO_idx` (`func_estado_id`),
  CONSTRAINT `FK0_FUNCIONARIO` FOREIGN KEY (`func_tfuncionario_id`) REFERENCES `tipo_funcionario` (`tfunc_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK1_FUNCIONARIO` FOREIGN KEY (`func_tdocumento_id`) REFERENCES `tipo_documento` (`tdoc_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK2_FUNCIONARIO` FOREIGN KEY (`func_estado_id`) REFERENCES `estado` (`sta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Tabla que registra los datos de los funcionarios que usan el sistema	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `mod_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campo que registra el id del modulo',
  `mod_codigo` varchar(8) NOT NULL COMMENT 'Campo que registra el codigo del modulo',
  `mod_nombre` varchar(100) NOT NULL COMMENT 'Campo que registra el nombre del modulo',
  `mod_fecha` date NOT NULL COMMENT 'Campo que registra la ultima fecha de edicion de informacion del modulo',
  `mod_usuario_id` int(11) NOT NULL COMMENT 'Campo que registra el ultimo usuario que realizo una edicion de informacion del modulo',
  `mod_estado` int(11) NOT NULL DEFAULT '1' COMMENT 'Campo que registra el estado del modulo',
  PRIMARY KEY (`mod_id`),
  UNIQUE KEY `mod_id_UNIQUE` (`mod_id`),
  UNIQUE KEY `mod_codigo_UNIQUE` (`mod_codigo`),
  KEY `FK1_MODULO_idx` (`mod_usuario_id`),
  KEY `FK2_MODULO_idx` (`mod_estado`),
  CONSTRAINT `FK1_MODULO` FOREIGN KEY (`mod_usuario_id`) REFERENCES `usuario` (`usu_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK2_MODULO` FOREIGN KEY (`mod_estado`) REFERENCES `estado` (`sta_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena la informacion de los modulos implementados en el sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_autorizacion`
--

DROP TABLE IF EXISTS `tipo_autorizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_autorizacion` (
  `taut_id` int(11) NOT NULL COMMENT 'Campo que registra el id del tipo de autorizacion',
  `taut_nombre` varchar(45) NOT NULL COMMENT 'Campo que registra el nombre del tipo de autorizacion',
  `taut_estado_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Campo que registra el estado del tipo de autorizacion',
  PRIMARY KEY (`taut_id`),
  UNIQUE KEY `taut_id_UNIQUE` (`taut_id`),
  KEY `FK1_TIPO_AUTORIZACION_idx` (`taut_estado_id`),
  CONSTRAINT `FK1_TIPO_AUTORIZACION` FOREIGN KEY (`taut_estado_id`) REFERENCES `estado` (`sta_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena los tipos de autorizacion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_documento` (
  `tdoc_id` int(11) NOT NULL COMMENT 'Campo que registra el id del tipo de documento',
  `tdoc_nombre` varchar(45) NOT NULL COMMENT 'Campo que registra el nombre del tipo de documento',
  `tdoc_sigla` varchar(2) NOT NULL,
  `tdoc_estado_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Campo que registra el estado del tipo de documento',
  PRIMARY KEY (`tdoc_id`),
  UNIQUE KEY `tdoc_id_UNIQUE` (`tdoc_id`),
  KEY `FK1_TIPO_DOCUMENTO_idx` (`tdoc_estado_id`),
  CONSTRAINT `FK1_TIPO_DOCUMENTO` FOREIGN KEY (`tdoc_estado_id`) REFERENCES `estado` (`sta_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena los tipos de documentos de los usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_funcionario`
--

DROP TABLE IF EXISTS `tipo_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_funcionario` (
  `tfunc_id` int(11) NOT NULL COMMENT 'Campo que registra el id del tipo de funcionario',
  `tfunc_nombre` varchar(45) NOT NULL COMMENT 'Campo que registra el nombre del tipo de funcionario',
  `tfunc_estado` int(11) NOT NULL DEFAULT '1' COMMENT 'Campo que registra el estado del tipo de funcionario',
  PRIMARY KEY (`tfunc_id`),
  UNIQUE KEY `tfunc_id_UNIQUE` (`tfunc_id`),
  KEY `FK0_TFUNCIONARIO_idx` (`tfunc_estado`),
  CONSTRAINT `FK0_TFUNCIONARIO` FOREIGN KEY (`tfunc_estado`) REFERENCES `estado` (`sta_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena la informacion del tipo de funcionario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `tusu_id` int(11) NOT NULL COMMENT 'Campo que registra el id del tipo de usuario',
  `tusu_nombre` varchar(45) NOT NULL COMMENT 'Campo que registra el nombre del tipo de usuario',
  `tusu_estado_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Campo que registra el estado del tipo de usuario',
  PRIMARY KEY (`tusu_id`),
  UNIQUE KEY `tusu_id_UNIQUE` (`tusu_id`),
  KEY `FK1_TIPO_USUARIO_idx` (`tusu_estado_id`),
  CONSTRAINT `FK1_TIPO_USUARIO` FOREIGN KEY (`tusu_estado_id`) REFERENCES `estado` (`sta_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena los tipos de usuario que pueden acceder a la aplicacion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `usu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Campo que registra el id del usuario',
  `usu_tusuario_id` int(11) NOT NULL COMMENT 'Campo que registra el tipo de usuario del usuario',
  `usu_username` varchar(45) NOT NULL COMMENT 'Campo que registra el nombre de usuario del usuario',
  `password` varchar(60) NOT NULL COMMENT 'Campo que registra la contraseña de acceso del usuario',
  `remember_token` varchar(200) DEFAULT NULL,
  `usu_estado_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Campo que registra el estado del usuario',
  PRIMARY KEY (`usu_id`),
  UNIQUE KEY `usu_id_UNIQUE` (`usu_id`),
  UNIQUE KEY `usu_username_UNIQUE` (`usu_username`),
  KEY `FK1_USUARIO_idx` (`usu_tusuario_id`),
  KEY `FK2_USUARIO_idx` (`usu_estado_id`),
  CONSTRAINT `FK1_USUARIO` FOREIGN KEY (`usu_tusuario_id`) REFERENCES `tipo_usuario` (`tusu_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK2_USUARIO` FOREIGN KEY (`usu_estado_id`) REFERENCES `estado` (`sta_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena los datos de usuarios que acceden a la aplicacion';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-24  9:13:24
