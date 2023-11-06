-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-11-2023 a las 03:20:47
-- Versión del servidor: 8.0.32
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_af`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `DeleteEtnia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteEtnia` (IN `etniaId` INT)   BEGIN
  UPDATE tbl_etnias SET estado = 0 WHERE id_etnia = etniaId;
END$$

DROP PROCEDURE IF EXISTS `DeleteObjeto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteObjeto` (IN `newId_objetos` VARCHAR(255))   BEGIN
     DELETE FROM objetos WHERE Id_objetos = newId_objetos;
END$$

DROP PROCEDURE IF EXISTS `DeletePregunta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePregunta` (IN `preguntaId` INT)   BEGIN
    DELETE FROM Preguntas WHERE Id_pregunta = preguntaId;
END$$

DROP PROCEDURE IF EXISTS `DesactivarMotivo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DesactivarMotivo` (IN `id_motivo_param` INT)   BEGIN
  UPDATE `tbl_motivos_migracion`
  SET
    `Estado` = 'INACTIVO',
    `Fecha_Actualizacion` = CURRENT_TIMESTAMP
  WHERE `Id_motivo` = id_motivo_param;
END$$

DROP PROCEDURE IF EXISTS `EditarAldea`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarAldea` (IN `newId_Aldea` BIGINT(20), IN `newNombre_Aldea` VARCHAR(100), IN `newDescripcion` VARCHAR(255), IN `newEstado` ENUM('A','I'), IN `newId_Municipio` BIGINT(20))   BEGIN
    UPDATE tbl_aldeas
    SET Nombre_Aldea = newNombre_Aldea,
        Descripcion= newDescripcion,
        Estado= newEstado,
        Id_Municipio= newId_Municipio,
        Fecha_Modificacion = CURRENT_TIMESTAMP()
    WHERE Id_Aldea = newId_Aldea;
END$$

DROP PROCEDURE IF EXISTS `EditarApoyo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarApoyo` (IN `id_apoyo_produccion_param` INT, IN `tipo_apoyo_produccion_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_apoyos`
  SET
    `tipo_apoyo_produccion` = tipo_apoyo_produccion_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_apoyo_produccion` = id_apoyo_produccion_param;
END$$

DROP PROCEDURE IF EXISTS `EditarCacerio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarCacerio` (IN `newId_Cacerio` BIGINT(20), IN `newNombre_Cacerio` VARCHAR(100), IN `newDescripcion` VARCHAR(255), IN `newEstado` ENUM('A','I'), IN `newId_Aldea` BIGINT(20))   BEGIN
    UPDATE tbl_cacerios
    SET Nombre_Cacerio = newNombre_Cacerio,
        Descripcion= newDescripcion,
        Estado= newEstado,
        Id_Aldea= newId_Aldea,
        Fecha_Modificacion = CURRENT_TIMESTAMP()
    WHERE Id_Cacerio = newId_Cacerio;
END$$

DROP PROCEDURE IF EXISTS `EditarCultivo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarCultivo` (IN `id_tipo_cultivo_param` INT, IN `tipo_cultivo_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_tipo_cultivo`
  SET
    `tipo_cultivo` = tipo_cultivo_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_tipo_cultivo` = id_tipo_cultivo_param;
END$$

DROP PROCEDURE IF EXISTS `EditarDepartamento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarDepartamento` (IN `newId_Departamento` BIGINT(20), IN `newNombre_Departamento` VARCHAR(100), IN `newDescripcion` VARCHAR(255), IN `newEstado` ENUM('A','I'))   BEGIN
    UPDATE tbl_departamentos
    SET Nombre_Departamento = newNombre_Departamento,
        Descripcion= newDescripcion,
        Estado= newEstado,
        Fecha_Modificacion = CURRENT_TIMESTAMP()
    WHERE Id_Departamento = newId_Departamento;
END$$

DROP PROCEDURE IF EXISTS `EditarMedidaTierra`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarMedidaTierra` (IN `id_medida_param` INT, IN `medida_param` ENUM('MZ','HA','TAREAS'), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_medidas_tierra`
  SET
    `medida` =  medida_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_medida` = id_medida_param;
END$$

DROP PROCEDURE IF EXISTS `EditarMotivo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarMotivo` (IN `id_motivo_param` INT, IN `motivo_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_motivos_migracion`
  SET
    `Motivo` = motivo_param,
    `Descripcion` = descripcion_param,
    `Estado` = estado_param,
    `Fecha_Actualizacion` = CURRENT_TIMESTAMP
  WHERE `Id_motivo` = id_motivo_param;
END$$

DROP PROCEDURE IF EXISTS `EditarMunicipio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarMunicipio` (IN `newId_Municipio` BIGINT(20), IN `newNombre_Municipio` VARCHAR(100), IN `newDescripcion` VARCHAR(255), IN `newEstado` ENUM('A','I'), IN `newId_Departamento` BIGINT(20))   BEGIN
    UPDATE tbl_municipios
    SET Nombre_Municipio = newNombre_Municipio,
        Descripcion= newDescripcion,
        Estado= newEstado,
        Id_Departamento= newId_Departamento,
        Fecha_Modificacion = CURRENT_TIMESTAMP()
    WHERE Id_Municipio = newId_Municipio;
END$$

DROP PROCEDURE IF EXISTS `EditarOrganizacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarOrganizacion` (IN `id_organizacion_param` INT, IN `organizacion_param` VARCHAR(255), IN `id_tipo_organizacion_param` INT, IN `descripcion_param` TEXT)   BEGIN
  UPDATE `tbl_organizaciones`
  SET
    `organizacion` = organizacion_param,
    `id_tipo_organizacion` = id_tipo_organizacion_param,
    `descripcion` = descripcion_param
  WHERE `id_organizacion` = id_organizacion_param;
END$$

DROP PROCEDURE IF EXISTS `EditarPeriodicidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarPeriodicidad` (IN `id_periodo_param` INT, IN `periodo_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_periodicidad`
  SET
    `periodo` = periodo_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_periodo` = id_periodo_param;
END$$

DROP PROCEDURE IF EXISTS `EditarPracticas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarPracticas` (IN `id_tipo_practica_param` INT, IN `tipo_practica_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_tipo_practicas_productivas`
  SET
    `tipo_practica` = tipo_practica_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_tipo_practica` = id_tipo_practica_param;
END$$

DROP PROCEDURE IF EXISTS `EditarRiego`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarRiego` (IN `id_tipo_riego_param` INT, IN `tipo_riego_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_tipo_riego`
  SET
    `tipo_riego` = tipo_riego_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_tipo_riego` = id_tipo_riego_param;
END$$

DROP PROCEDURE IF EXISTS `EditarTipoApoyo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarTipoApoyo` (IN `id_tipo_apoyos_param` INT, IN `tipo_apoyos_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_tipos_apoyos`
  SET
    `tipo_apoyos` = tipo_apoyos_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_tipo_apoyos` = id_tipo_apoyos_param;
END$$

DROP PROCEDURE IF EXISTS `EditarTipoTrabajador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarTipoTrabajador` (IN `id_tipo_trabajador_param` INT, IN `tipo_trabajador_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_tipo_trabajadores`
  SET
    `tipo_trabajador` = tipo_trabajador_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_tipo_trabajador` = id_tipo_trabajador_param;
END$$

DROP PROCEDURE IF EXISTS `EditarTipo_Negocio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarTipo_Negocio` (IN `id_tipo_negocio_param` INT, IN `tipo_negocio_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_tipo_negocios`
  SET
    `tipo_negocio` = tipo_negocio_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param
  WHERE `id_tipo_negocio` = id_tipo_negocio_param;
END$$

DROP PROCEDURE IF EXISTS `EditarTipo_Organizacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarTipo_Organizacion` (IN `id_tipo_organizacion_param` INT, IN `tipo_organizacion_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_tipo_organizacion`
  SET
    `tipo_organizacion` = tipo_organizacion_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param
  WHERE `id_tipo_organizacion` = id_tipo_organizacion_param;
END$$

DROP PROCEDURE IF EXISTS `EditarTipo_Produccion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarTipo_Produccion` (IN `id_tipo_produccion_param` INT, IN `tipo_produccion_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('1','2'))   BEGIN
  UPDATE `tbl_tipo_produccion`
  SET
    `tipo_produccion` = tipo_produccion_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param
  WHERE `id_tipo_produccion` = id_tipo_produccion_param;
END$$

DROP PROCEDURE IF EXISTS `EditarTomaDecisiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarTomaDecisiones` (IN `id_tipo_tomador_param` INT, IN `tomador_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_toma_decisiones`
  SET
    `tomador` =  tomador_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_tipo_tomador` = id_tipo_tomador_param;
END$$

DROP PROCEDURE IF EXISTS `EliminarApoyo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarApoyo` (IN `id_apoyo_produccion_param` INT(11))   BEGIN
  DELETE FROM  tbl_apoyos WHERE id_apoyo_produccion = id_apoyo_produccion_param;
END$$

DROP PROCEDURE IF EXISTS `EliminarCacerio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCacerio` (IN `newId_Cacerio` BIGINT(20))   BEGIN
     DELETE FROM tbl_cacerios WHERE Id_Cacerio = newId_Cacerio;
END$$

DROP PROCEDURE IF EXISTS `EliminarCultivo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCultivo` (IN `id_tipo_cultivo_parm` INT(20))   BEGIN
    DELETE FROM tbl_tipo_cultivo WHERE id_tipo_cultivo = id_tipo_cultivo_parm;
END$$

DROP PROCEDURE IF EXISTS `EliminarDepartamento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDepartamento` (IN `Id_Departamento_parm` INT(20))   BEGIN
    DELETE FROM tbl_departamentos WHERE Id_Departamento = Id_Departamento_parm;
END$$

DROP PROCEDURE IF EXISTS `EliminarMedidaTierra`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMedidaTierra` (IN `id_medida_param` INT(11))   BEGIN
  DELETE FROM tbl_medidas_tierra WHERE id_medida = id_medida_param;
END$$

DROP PROCEDURE IF EXISTS `EliminarMotivo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMotivo` (IN `id_motivo_param` INT)   BEGIN
  DELETE FROM `tbl_motivos_migracion`
  WHERE `Id_motivo` = id_motivo_param;
END$$

DROP PROCEDURE IF EXISTS `EliminarMunicipio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMunicipio` (IN `newId_Municipio` BIGINT(20))   BEGIN
     DELETE FROM tbl_municipios WHERE Id_Municipio = newId_Municipio;
END$$

DROP PROCEDURE IF EXISTS `EliminarOrganizacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarOrganizacion` (IN `id_organizacion_param` INT(20))   BEGIN
  DELETE FROM tbl_organizaciones WHERE id_organizacion = id_organizacion_param;
END$$

DROP PROCEDURE IF EXISTS `EliminarPeriodicidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPeriodicidad` (IN `id_periodo_parm` INT(20))   BEGIN
    DELETE FROM tbl_periodicidad WHERE id_periodo = id_periodo_parm;
END$$

DROP PROCEDURE IF EXISTS `EliminarPracticas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPracticas` (IN `id_tipo_practica_parm` INT(20))   BEGIN
    DELETE FROM tbl_tipo_practicas_productivas WHERE id_tipo_practica = id_tipo_practica_parm;
END$$

DROP PROCEDURE IF EXISTS `EliminarRiego`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarRiego` (IN `id_tipo_riego_parm` INT(20))   BEGIN
    DELETE FROM tbl_tipo_riego WHERE id_tipo_riego = id_tipo_riego_parm;
END$$

DROP PROCEDURE IF EXISTS `EliminarTipoApoyo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTipoApoyo` (IN `id_tipo_apoyos_param` INT(11))   BEGIN
  DELETE FROM  tbl_tipos_apoyos WHERE id_tipo_apoyos = id_tipo_apoyos_param;
END$$

DROP PROCEDURE IF EXISTS `EliminarTipoPecuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTipoPecuario` (IN `id_tipo_pecuario_param` INT)   BEGIN
  DELETE FROM tbl_tipo_pecuarios
  WHERE id_tipo_pecuario = id_tipo_pecuario_param;
END$$

DROP PROCEDURE IF EXISTS `EliminarTipoTrabajador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTipoTrabajador` (IN `id_tipo_trabajador_param` INT(11))   BEGIN
  DELETE FROM tbl_tipo_trabajadores WHERE id_tipo_trabajador = id_tipo_trabajador_param;
END$$

DROP PROCEDURE IF EXISTS `EliminarTipo_Negocio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTipo_Negocio` (IN `id_tipo_negocio_parm` INT(20))   BEGIN
    DELETE FROM tbl_tipo_negocios WHERE id_tipo_negocio = id_tipo_negocio_parm;
END$$

DROP PROCEDURE IF EXISTS `EliminarTipo_Organizacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTipo_Organizacion` (IN `id_tipo_organizacion_parm` INT(20))   BEGIN
    DELETE FROM tbl_tipo_organizacion WHERE id_tipo_organizacion = id_tipo_organizacion_parm;
END$$

DROP PROCEDURE IF EXISTS `EliminarTomaDecisiones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTomaDecisiones` (IN `id_tipo_tomador_param` INT(11))   BEGIN
  DELETE FROM   tbl_toma_decisiones WHERE id_tipo_tomador = id_tipo_tomador_param;
END$$

DROP PROCEDURE IF EXISTS `InsertarAldea`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAldea` (IN `p_Nombre_Aldea` VARCHAR(255), IN `p_Descripcion` VARCHAR(255), IN `p_Id_Municipio` BIGINT(20))   BEGIN
    INSERT INTO tbl_aldeas (Nombre_Aldea, Descripcion, Estado, Id_Municipio, Id_Usuario,
        Creado_Por, Fecha_Creacion, Modificado_Por, Fecha_Modificacion)
    VALUES (p_Nombre_Aldea, p_Descripcion, 'A', p_Id_Municipio, '1','1',CURRENT_TIMESTAMP(),'1',CURRENT_TIMESTAMP());
END$$

DROP PROCEDURE IF EXISTS `InsertarApoyo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarApoyo` (IN `tipo_apoyo_produccion_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_apoyos` (`tipo_apoyo_produccion`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_apoyo_produccion_param, descripcion_param, 'Daniela', 'Daniela', 'ACTIVO');
END$$

DROP PROCEDURE IF EXISTS `InsertarCacerio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCacerio` (IN `p_Nombre_Cacerio` VARCHAR(255), IN `p_Descripcion` VARCHAR(255), IN `p_Id_Aldea` BIGINT(20))   BEGIN
    INSERT INTO tbl_cacerios (Nombre_Cacerio, Descripcion, Estado, Id_Aldea, Id_Usuario,
        Creado_Por, Fecha_Creacion, Modificado_Por, Fecha_Modificacion)
    VALUES (p_Nombre_Cacerio, p_Descripcion, 'A', p_Id_Aldea, '1','1',CURRENT_TIMESTAMP(),'1',CURRENT_TIMESTAMP());
END$$

DROP PROCEDURE IF EXISTS `InsertarCultivo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCultivo` (IN `tipo_cultivo_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_cultivo` (`tipo_cultivo`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_cultivo_param, descripcion_param, 'Manuel', 'Manuel', 'ACTIVO');
END$$

DROP PROCEDURE IF EXISTS `InsertarDepartamento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDepartamento` (IN `p_Nombre_Departamento` VARCHAR(100), IN `p_Descripcion` VARCHAR(255))   BEGIN
    INSERT INTO tbl_departamentos (
        Nombre_Departamento,
        Descripcion,
        Estado,
        Id_Usuario,
        Creado_Por,
        Fecha_Creacion,
        Modificado_Por,
        Fecha_Modificacion
    ) VALUES (
        p_Nombre_Departamento,
        p_Descripcion,
        'A',  -- Estado 'A' por defecto
        '1',
        '1',
        CURRENT_TIMESTAMP(),
        '1',
        CURRENT_TIMESTAMP()
    );
END$$

DROP PROCEDURE IF EXISTS `InsertarEtnia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEtnia` (IN `etniaParam` VARCHAR(255), IN `descripcionParam` TEXT, IN `fechaCreacionParam` TIMESTAMP, IN `estadoParam` INT)   BEGIN
    DECLARE usuarioCreador VARCHAR(255);
    DECLARE usuarioModificador VARCHAR(255);
    
    SET usuarioCreador = 'usuario1';
    SET usuarioModificador = 'usuario1';

    INSERT INTO tbl_etnias (etnia, descripcion, creado_por, fecha_creacion, modificado_por, fecha_modificacion, estado)
    VALUES (etniaParam, descripcionParam, usuarioCreador, fechaCreacionParam, usuarioModificador, NOW(), estadoParam);
END$$

DROP PROCEDURE IF EXISTS `InsertarMedidaTierra`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMedidaTierra` (IN `medida_param` ENUM('MZ','HA','TAREAS'), IN `descripcion_param` TEXT)   BEGIN
    
    
    INSERT INTO tbl_medidas_tierra (medida, descripcion, creado_por, modificado_por, estado) 
    VALUES (medida_param, descripcion_param, 'Daniela', 'Daniela', 'ACTIVO');

END$$

DROP PROCEDURE IF EXISTS `InsertarMotivo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMotivo` (IN `motivo_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_motivos_migracion` (`Motivo`, `Descripcion`,`Creado_por`,`Modificado_por` ,`Estado`) 
  VALUES (motivo_param, descripcion_param,'Manuel','Manuel','ACTIVO');
END$$

DROP PROCEDURE IF EXISTS `InsertarMunicipio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMunicipio` (IN `p_Nombre_Municipio` VARCHAR(255), IN `p_Descripcion` VARCHAR(255), IN `p_Id_Departamento` BIGINT(20))   BEGIN
    INSERT INTO tbl_municipios (Nombre_Municipio, Descripcion, Estado, Id_Departamento, Id_Usuario,
        Creado_Por, Fecha_Creacion, Modificado_Por, Fecha_Modificacion)
    VALUES (p_Nombre_Municipio, p_Descripcion, 'A', p_Id_Departamento, '1','1',CURRENT_TIMESTAMP(),'1',CURRENT_TIMESTAMP());
END$$

DROP PROCEDURE IF EXISTS `InsertarOrganizacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarOrganizacion` (IN `organizacion_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_organizaciones` (`organizacion`, `descripcion`, `id_tipo_organizacion` ,`creado_por`,`modificado_por` , `estado`) 
  VALUES (organizacion_param, descripcion_param, '1' , 'Kevin', 'Kevin', 'ACTIVO');
END$$

DROP PROCEDURE IF EXISTS `InsertarPeriodicidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPeriodicidad` (IN `periodo_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_periodicidad` (`periodo`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (periodo_param, descripcion_param, 'Manuel', 'Manuel', 'ACTIVO');
END$$

DROP PROCEDURE IF EXISTS `InsertarPracticas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPracticas` (IN `tipo_practica_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_practicas_productivas` (`tipo_practica`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_practica_param, descripcion_param, 'Manuel', 'Manuel', 'ACTIVO');
END$$

DROP PROCEDURE IF EXISTS `InsertarRiego`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarRiego` (IN `tipo_riego_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_riego` (`tipo_riego`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_riego_param, descripcion_param, 'Manuel', 'Manuel', 'ACTIVO');
END$$

DROP PROCEDURE IF EXISTS `InsertarTipoApoyo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoApoyo` (IN `tipo_apoyos_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipos_apoyos` (`tipo_apoyos`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_apoyos_param, descripcion_param, 'Daniela', 'Daniela', 'ACTIVO');
END$$

DROP PROCEDURE IF EXISTS `InsertarTipoOrganizacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoOrganizacion` (IN `tipo_organizacion_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_organizacion` (`tipo_organizacion`, `descripcion`, `creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_organizacion_param, descripcion_param, 'Kevin', 'Kevin', 'ACTIVO');
END$$

DROP PROCEDURE IF EXISTS `InsertarTipoTrabajador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoTrabajador` (IN `tipo_trabajador_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_trabajadores` (`tipo_trabajador`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_trabajador_param, descripcion_param, 'Daniela', 'Daniela', 'ACTIVO');
END$$

DROP PROCEDURE IF EXISTS `InsertarTipo_Negocio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipo_Negocio` (IN `tipo_negocio_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_negocios` (`tipo_negocio`, `descripcion`, `creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_negocio_param, descripcion_param, 'Kevin', 'Kevin', 'ACTIVO');
END$$

DROP PROCEDURE IF EXISTS `InsertarTipo_Produccion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipo_Produccion` (IN `tipo_produccion_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_produccion` (`tipo_produccion`, `descripcion`, `creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_produccion_param, descripcion_param, 'Kevin', 'Kevin', '1');
END$$

DROP PROCEDURE IF EXISTS `InsertarTomaDecisones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTomaDecisones` (IN `tomador_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_toma_decisiones` (`tomador`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tomador_param, descripcion_param, 'Daniela', 'Daniela', 'ACTIVO');
END$$

DROP PROCEDURE IF EXISTS `InsertObejtos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertObejtos` (IN `newObjeto` VARCHAR(255), IN `newDescripcion` VARCHAR(255), IN `newActualizado_Por` VARCHAR(255), IN `newCreado_Por` VARCHAR(255))   BEGIN
    DECLARE currentDate TIMESTAMP;
    SET currentDate = NOW();
 INSERT INTO objetos(Objeto, Descripcion, Actualizado_Por, Creado_Por, Fecha_Creacion,Fecha_Actualizacon, Status)
    VALUES (newObjeto , newDescripcion, newActualizado_Por, newCreado_Por, currentDate, currentDate,'Activo');
END$$

DROP PROCEDURE IF EXISTS `InsertPermisos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPermisos` (IN `newId_rol` BIGINT(20), IN `newId_objetos` BIGINT(20), IN `newpermiso_eliminacion` VARCHAR(10), IN `newpermiso_actualizacion` VARCHAR(10), IN `newpermiso_consulta` VARCHAR(10), IN `newpermiso_insercion` VARCHAR(10), IN `newCreado_Por` BIGINT(20), IN `newEstado` ENUM('ACTIVO','INACTIVO'))   BEGIN
    DECLARE currentDate TIMESTAMP;  
    
    SET currentDate = NOW();  
    
    INSERT INTO permisos (Id_rol, Id_objetos, permiso_eliminacion, permiso_actualizacion, permiso_consulta, permiso_insercion, Creado_Por, Fecha_Creacion, Fecha_Actualizacion, Estado)
    VALUES (newId_rol, newId_objetos, newpermiso_eliminacion, newpermiso_actualizacion, newpermiso_consulta, newpermiso_insercion, newCreado_Por, currentDate, currentDate, newEstado );
END$$

DROP PROCEDURE IF EXISTS `InsertPreguntas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPreguntas` (IN `newPregunta` VARCHAR(255), IN `newActualizado_Por` VARCHAR(255), IN `newCreador_Por` VARCHAR(255))   BEGIN
    DECLARE currentDate TIMESTAMP;
    SET currentDate = NOW();
 INSERT INTO Preguntas (Pregunta, Actualizado_Por, Creador_Por, Fecha_Creacion, Fecha_Actualizacion)
    VALUES (newPregunta, newActualizado_Por, newCreador_Por, currentDate, currentDate);
END$$

DROP PROCEDURE IF EXISTS `InsertRoles`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRoles` (IN `newNombre` VARCHAR(255), IN `newDescripcion` VARCHAR(255))   BEGIN
    DECLARE currentDate TIMESTAMP;  -- Declarar la variable currentDate
    SET currentDate = NOW();  -- Obtener la fecha y hora actuales
    
    INSERT INTO roles (Nombre, Descripcion, Creado_Por, Fecha_Creacion, Actualizado_Por, Fecha_Actualizacion, STATUS)
    VALUES (newNombre, newDescripcion, 1, currentDate, 1, currentDate, 'Activo');
END$$

DROP PROCEDURE IF EXISTS `InsertUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUsuario` (IN `newNombre` VARCHAR(255), IN `newCorreo` VARCHAR(255), IN `newUsuario` VARCHAR(255), IN `newContraseña` VARCHAR(255))   BEGIN
    DECLARE currentDate TIMESTAMP;
    DECLARE estado VARCHAR(255);
  

    INSERT INTO `usuario`(`Id_rol`, `Nombre`, `Correo`, `Usuario`, `Contraseña`, `Token`, `Fecha_Creacion`, `Actualizado_Por`, `Fecha_Actualizacion`, `Preguntas_Contestadas`, `Estado`, `Id_estado`, `Primera_Vez`, `Fecha_Vencimiento`, `Intentos_Preguntas`, `Preguntas_Correctas`, `Intentos_Fallidos`) 
    VALUES (2, `newNombre`, `newCorreo`, `newUsuario`, `newContraseña`, '', currentDate, '', currentDate, 1, 1, 1, 1, CURRENT_TIMESTAMP, NULL, NULL, NULL);
END$$

DROP PROCEDURE IF EXISTS `Sp_permiso_actualizar`$$
CREATE DEFINER=`ppa`@`%` PROCEDURE `Sp_permiso_actualizar` (IN `ROL` INT, IN `OBJETO` INT)   BEGIN
START TRANSACTION;
IF NOT EXISTS (SELECT * FROM usuario u WHERE u.Id_rol = ROL) THEN
SET @m='EL TIPO DE ROL NO EXISTE';
SELECT @m;
ELSEIF NOT EXISTS (SELECT * FROM objetos ob WHERE ob.Id_objetos = OBJETO) THEN
SET @m='El objeto no existe';
SELECT @m;
ELSE
SELECT p.permiso_actualizacion
FROM permisos p
WHERE p.Id_rol = ROL
AND p.Id_objetos = OBJETO;
END IF;
COMMIT;
END$$

DROP PROCEDURE IF EXISTS `Sp_permiso_eliminar`$$
CREATE DEFINER=`ppa`@`%` PROCEDURE `Sp_permiso_eliminar` (IN `ROL` INT, IN `OBJETO` INT)   BEGIN
START TRANSACTION;
IF NOT EXISTS (SELECT * FROM usuario u WHERE u.Id_rol = ROL) THEN
SET @m='EL TIPO DE ROL NO EXISTE';
SELECT @m;
ELSEIF NOT EXISTS (SELECT * FROM objetos ob WHERE ob.Id_objetos = OBJETO) THEN
SET @m='El objeto no existe';
SELECT @m;
ELSE
SELECT p.permiso_eliminacion
FROM permisos p
WHERE p.Id_rol = ROL
AND p.Id_objetos = OBJETO;
END IF;
COMMIT;
END$$

DROP PROCEDURE IF EXISTS `Sp_permiso_insertar`$$
CREATE DEFINER=`ppa`@`%` PROCEDURE `Sp_permiso_insertar` (IN `ROL` INT, IN `OBJETO` INT)   BEGIN
START TRANSACTION;
IF NOT EXISTS (SELECT * FROM usuario u WHERE u.Id_rol = ROL) THEN
SET @m='EL TIPO DE ROL NO EXISTE';
SELECT @m;
ELSEIF NOT EXISTS (SELECT * FROM objetos ob WHERE ob.Id_objetos = OBJETO) THEN
SET @m='El objeto no existe';
SELECT @m;
ELSE
SELECT p.permiso_insercion
FROM permisos p
WHERE p.Id_rol = ROL
AND p.Id_objetos = OBJETO;
END IF;
COMMIT;
END$$

DROP PROCEDURE IF EXISTS `Sp_permiso_mostrar`$$
CREATE DEFINER=`ppa`@`%` PROCEDURE `Sp_permiso_mostrar` (IN `ROL` INT, IN `OBJETO` INT)   BEGIN
START TRANSACTION;
IF NOT EXISTS (SELECT * FROM usuario u WHERE u.Id_rol = ROL) THEN
SET @m='EL TIPO DE ROL NO EXISTE';
SELECT @m;
ELSEIF NOT EXISTS (SELECT * FROM objetos ob WHERE ob.Id_objetos = OBJETO) THEN
SET @m='El objeto no existe';
SELECT @m;
ELSE
SELECT p.permiso_consultar
FROM permisos p
WHERE p.Id_rol = ROL
AND p.Id_objetos = OBJETO;
END IF;
COMMIT;
END$$

DROP PROCEDURE IF EXISTS `UpdateEtnia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateEtnia` (IN `etniaId` INT, IN `nuevaEtnia` VARCHAR(255), IN `nuevaDescripcion` TEXT, IN `nuevoEstado` VARCHAR(50))   BEGIN
    DECLARE nuevoEstadoValor INT;

    -- Asignar el valor correcto para el estado
    CASE
        WHEN nuevoEstado = 'Activo' THEN SET nuevoEstadoValor = 1;
        WHEN nuevoEstado = 'Inactivo' THEN SET nuevoEstadoValor = 0;
        ELSE SET nuevoEstadoValor = estado;
    END CASE;

    UPDATE tbl_etnias
    SET etnia = nuevaEtnia,
        descripcion = nuevaDescripcion,
        estado = nuevoEstadoValor
    WHERE id_etnia = etniaId;
END$$

DROP PROCEDURE IF EXISTS `UpdateFuenteCredito`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateFuenteCredito` (IN `id_fuente_creditoParam` INT, IN `fuente_creditoParam` VARCHAR(255), IN `descripcionParam` TEXT, IN `estadoParam` INT)   BEGIN
    DECLARE creado_porParam VARCHAR(255);
    DECLARE fecha_modificacionParam TIMESTAMP;
    DECLARE modificado_porParam VARCHAR(255);

    SET creado_porParam = 'usuario1';
    SET fecha_modificacionParam = NOW();
    SET modificado_porParam = 'usuario1';

    UPDATE tbl_fuentes_credito
    SET
        fuente_credito = fuente_creditoParam,
        descripcion = descripcionParam,
        estado = estadoParam,
        creado_por = creado_porParam,
        fecha_modificacion = fecha_modificacionParam,
        modificado_por = modificado_porParam
    WHERE id_fuente_credito = id_fuente_creditoParam;
END$$

DROP PROCEDURE IF EXISTS `UpdateObjeto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateObjeto` (IN `newID_Objeto` BIGINT(20), IN `newObjeto` VARCHAR(255), IN `newDescripcion` VARCHAR(255), IN `newActualizado_Por` VARCHAR(255), IN `newCreado_Por` VARCHAR(255), IN `newStatus` VARCHAR(255))   BEGIN
    UPDATE objetos
    SET Objeto = newObjeto,
        Descripcion = newDescripcion,
        Actualizado_Por = newActualizado_Por,
        Creado_Por = newCreado_Por,
        Fecha_Actualizacon = CURRENT_TIMESTAMP,
        Status = newStatus
    WHERE Id_objetos = newID_Objeto;
END$$

DROP PROCEDURE IF EXISTS `UpdatePermiso`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePermiso` (IN `newId_Permisos` BIGINT(20), IN `newpermiso_eliminacion` VARCHAR(10), IN `newpermiso_actualizacion` VARCHAR(10), IN `newpermiso_consulta` VARCHAR(10), IN `newpermiso_insercion` VARCHAR(10), IN `newActualizado_Por` BIGINT(20), IN `newEstado` ENUM('ACTIVO','INACTIVO'))   BEGIN 
    UPDATE permisos
    SET permiso_eliminacion = newpermiso_eliminacion,
        permiso_actualizacion = newpermiso_actualizacion,
        permiso_consulta = newpermiso_consulta,
        permiso_insercion = newpermiso_insercion,
        Actualizado_Por = newActualizado_Por,
        Fecha_Actualizacion = CURRENT_TIMESTAMP,
        Estado = newEstado
        WHERE Id_Permisos = newId_Permisos;
END$$

DROP PROCEDURE IF EXISTS `UpdatePregunta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePregunta` (IN `p_Id_pregunta` INT, IN `p_Pregunta` VARCHAR(255), IN `p_Actualizado_Por` VARCHAR(255))   BEGIN
    UPDATE Preguntas
    SET
        Pregunta = p_Pregunta,
        Actualizado_Por = p_Actualizado_Por
    WHERE Id_pregunta = p_Id_pregunta;
END$$

DROP PROCEDURE IF EXISTS `UpdateRole`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateRole` (IN `newIdRol` BIGINT(20), IN `newNombre` VARCHAR(255), IN `newDescripcion` VARCHAR(255), IN `newStatus` VARCHAR(255))   BEGIN
    UPDATE roles
    SET Nombre = newNombre,
    	Descripcion = newDescripcion,
        STATUS = newStatus,
        Fecha_Actualizacion = CURRENT_TIMESTAMP
    WHERE Id_rol = newIdRol;
END$$

DROP PROCEDURE IF EXISTS `UpdateTipoPecuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateTipoPecuario` (IN `id_tipo_pecuario_param` INT, IN `tipo_pecuario_param` VARCHAR(255), IN `raza_con_genero_param` CHAR(1), IN `descripcion_param` TEXT, IN `estado_param` VARCHAR(50))   BEGIN

  DECLARE creado_por_valor VARCHAR(255) DEFAULT 'Usuario 1';
  DECLARE modificado_por_valor VARCHAR(255) DEFAULT 'Usuario 1';
  DECLARE fecha_creacion_valor TIMESTAMP DEFAULT NOW();
  DECLARE fecha_modificacion_valor TIMESTAMP DEFAULT NOW();


  UPDATE tbl_tipo_pecuarios
  SET
    tipo_pecuario = tipo_pecuario_param,
    raza_con_genero = raza_con_genero_param,
    descripcion = descripcion_param,
    creado_por = creado_por_valor,
    fecha_creacion = fecha_creacion_valor,
    modificado_por = modificado_por_valor,
    fecha_modificacion = fecha_modificacion_valor,
    estado = estado_param
  WHERE id_tipo_pecuario = id_tipo_pecuario_param;
END$$

DROP PROCEDURE IF EXISTS `UpdateUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUsuario` (IN `newId_Usuario` BIGINT(20), IN `newNombre` VARCHAR(255), IN `newUsuario` VARCHAR(255), IN `newCorreo` VARCHAR(255), IN `newEstado` ENUM('ACTIVO','INACTIVO','PENDIENTE'))   BEGIN
    UPDATE usuario
    SET Nombre = newNombre,
         Usuario= newUsuario,
         Correo= newCorreo,
         Estado= newEstado,
        Fecha_Actualizacion = CURRENT_TIMESTAMP
    WHERE Id_Usuario = newId_Usuario;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacoras`
--

DROP TABLE IF EXISTS `bitacoras`;
CREATE TABLE IF NOT EXISTS `bitacoras` (
  `Id_bitacoras` bigint NOT NULL,
  `Fecha` datetime NOT NULL,
  `Tabla` varchar(255) NOT NULL,
  `Accion` varchar(255) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Id_Usuario` bigint NOT NULL,
  `Id_objetos` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_usuario`
--

DROP TABLE IF EXISTS `estado_usuario`;
CREATE TABLE IF NOT EXISTS `estado_usuario` (
  `id_estado` bigint NOT NULL AUTO_INCREMENT,
  `Estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `estado_usuario`
--

INSERT INTO `estado_usuario` (`id_estado`, `Estado`) VALUES
(1, 'ACTIVO'),
(2, 'INACTIVO'),
(3, 'NUEVO'),
(4, 'BLOQUEADO ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hist_contrasena`
--

DROP TABLE IF EXISTS `hist_contrasena`;
CREATE TABLE IF NOT EXISTS `hist_contrasena` (
  `Id_hist` bigint NOT NULL,
  `Id_Usuario` bigint NOT NULL,
  `contrasena` varchar(60) NOT NULL,
  `Creado_Por` varchar(50) NOT NULL,
  `Fecha_Creacion` datetime NOT NULL,
  `Actualizado_Por` varchar(50) DEFAULT NULL,
  `Fecha_Modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_permisos`
--

DROP TABLE IF EXISTS `model_permisos`;
CREATE TABLE IF NOT EXISTS `model_permisos` (
  `Id_Permisos` bigint NOT NULL,
  `Tipo_Modelo` varchar(255) NOT NULL,
  `Modelo_Id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_roles`
--

DROP TABLE IF EXISTS `model_roles`;
CREATE TABLE IF NOT EXISTS `model_roles` (
  `Rol_Id` bigint NOT NULL,
  `Tipo_Modelo` varchar(255) NOT NULL,
  `Modelo_Id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetos`
--

DROP TABLE IF EXISTS `objetos`;
CREATE TABLE IF NOT EXISTS `objetos` (
  `Id_objetos` bigint NOT NULL AUTO_INCREMENT,
  `Objeto` varchar(255) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `tipo_objeto` varchar(50) NOT NULL,
  `Creado_Por` bigint NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Actualizado_Por` bigint NOT NULL,
  `Fecha_Actualizacon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`Id_objetos`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `objetos`
--

INSERT INTO `objetos` (`Id_objetos`, `Objeto`, `Descripcion`, `tipo_objeto`, `Creado_Por`, `Fecha_Creacion`, `Actualizado_Por`, `Fecha_Actualizacon`, `Status`) VALUES
(1, 'login', 'inicio de sesion', 'pantalla', 1, '2023-10-18 12:32:23', 1, '2023-10-20 12:32:23', 'ACTIVO'),
(5, '2', 'Bienvenida', '', 1, '2023-10-28 12:10:23', 1, '2023-10-28 12:10:23', 'ACTIVO'),
(7, 'Pantalla', 'Pantalla Usuario', '', 1, '2023-10-29 07:45:02', 1, '2023-10-29 07:45:17', 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

DROP TABLE IF EXISTS `parametros`;
CREATE TABLE IF NOT EXISTS `parametros` (
  `Id_parametros` bigint NOT NULL,
  `Id_Usuario` bigint NOT NULL,
  `Parametro` varchar(255) NOT NULL,
  `Valor` varchar(255) NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Id_parametros`),
  KEY `Parametro_Usuario_id` (`Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`Id_parametros`, `Id_Usuario`, `Parametro`, `Valor`, `Fecha_Creacion`, `Fecha_Actualizacion`) VALUES
(2, 1, 'Intentos_Fallidos', '3', '2022-09-27 11:46:41', '2022-09-27 11:46:41'),
(3, 1, 'Admin_Preguntas', '2', '2022-10-18 03:11:00', NULL),
(4, 1, 'Vigencia_Usuario', '30', '2022-10-26 08:00:00', NULL),
(5, 1, 'Min_Contraseña', '5', '2022-10-26 08:00:00', NULL),
(6, 1, 'Max_Contraseña', '16', '2022-10-26 08:00:00', NULL),
(7, 1, 'Intentos_Preguntas', '3', '2022-10-26 08:00:00', NULL),
(8, 1, 'Min_Usuario', '5', '2022-10-26 19:00:00', NULL),
(12, 1, 'Max_Usuario', '15', '2022-11-22 06:39:05', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `Id_Permisos` bigint NOT NULL AUTO_INCREMENT,
  `Id_rol` bigint NOT NULL,
  `Id_objetos` bigint NOT NULL,
  `permiso_eliminacion` varchar(10) NOT NULL,
  `permiso_actualizacion` varchar(10) NOT NULL,
  `permiso_consulta` varchar(10) NOT NULL,
  `permiso_insercion` varchar(10) NOT NULL,
  `Creado_Por` bigint NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Actualizado_Por` bigint NOT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL,
  `Estado` enum('ACTIVO','INACTIVO','','') NOT NULL,
  PRIMARY KEY (`Id_Permisos`),
  KEY `Permisos_Objeto` (`Id_objetos`),
  KEY `Permisos_Rol` (`Id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`Id_Permisos`, `Id_rol`, `Id_objetos`, `permiso_eliminacion`, `permiso_actualizacion`, `permiso_consulta`, `permiso_insercion`, `Creado_Por`, `Fecha_Creacion`, `Actualizado_Por`, `Fecha_Actualizacion`, `Estado`) VALUES
(1, 1, 1, 'SI', 'SI', 'SI', 'SI', 1, '2023-10-17 12:35:58', 1, '2023-10-19 12:35:58', 'ACTIVO'),
(2, 2, 1, 'NO', 'SI', 'SI', 'SI', 1, '2023-10-29 08:57:24', 1, '2023-10-29 08:58:04', 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
CREATE TABLE IF NOT EXISTS `preguntas` (
  `Id_pregunta` bigint NOT NULL AUTO_INCREMENT,
  `Pregunta` varchar(255) NOT NULL,
  `Creador_Por` bigint NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Actualizado_Por` bigint NOT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`Id_pregunta`, `Pregunta`, `Creador_Por`, `Fecha_Creacion`, `Actualizado_Por`, `Fecha_Actualizacion`) VALUES
(1, '¿Cuál es tu color favorito?', 1, '2023-10-11 09:45:08', 1, '2023-10-12 09:45:08'),
(2, '¿que equipo es tu favorito?', 1, '2023-10-29 02:14:09', 1, '2023-10-29 02:14:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas_usuario`
--

DROP TABLE IF EXISTS `preguntas_usuario`;
CREATE TABLE IF NOT EXISTS `preguntas_usuario` (
  `Id_Pregunta_U` bigint NOT NULL AUTO_INCREMENT,
  `Id_pregunta` bigint NOT NULL,
  `Id_Usuario` bigint DEFAULT NULL,
  `Respuestas` varchar(100) NOT NULL,
  `Creado_Por` varchar(80) DEFAULT NULL,
  `Fecha_Creacion` datetime DEFAULT NULL,
  `Modificado_Por` varchar(80) DEFAULT NULL,
  `Fecha_Modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_Pregunta_U`),
  KEY `Preguntas_idx` (`Id_pregunta`),
  KEY `Preguntas_Usuario_idx` (`Id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `preguntas_usuario`
--

INSERT INTO `preguntas_usuario` (`Id_Pregunta_U`, `Id_pregunta`, `Id_Usuario`, `Respuestas`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`) VALUES
(1, 1, 1, 'Rojo', '1', '2023-10-27 22:53:34', '1', '2023-10-31 22:53:34'),
(2, 2, 1, 'gato', '1', '2023-10-28 20:14:35', '1', '2023-10-31 20:14:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recuperar_clave`
--

DROP TABLE IF EXISTS `recuperar_clave`;
CREATE TABLE IF NOT EXISTS `recuperar_clave` (
  `Correo` varchar(255) NOT NULL,
  `Token` varchar(255) NOT NULL,
  `Fecha_Creacion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
CREATE TABLE IF NOT EXISTS `respuestas` (
  `Id_pregunta` bigint NOT NULL,
  `Id_Usuario` bigint NOT NULL,
  `Respuesta` varchar(255) NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL,
  `Id_respuesta` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `Id_rol` bigint NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Creado_Por` bigint NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Actualizado_Por` bigint NOT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL,
  `STATUS` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`Id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`Id_rol`, `Nombre`, `Descripcion`, `Creado_Por`, `Fecha_Creacion`, `Actualizado_Por`, `Fecha_Actualizacion`, `STATUS`) VALUES
(1, 'ADMINISTRADOR', 'ADMIN', 1, '2023-10-17 12:01:16', 2, '2023-10-18 12:01:16', 'ACTIVO'),
(2, 'Nuevo', 'Personal Nuevo', 1, '2023-10-29 05:42:09', 1, NULL, 'ACTIVO'),
(18, 'nomnre', 'SFD', 1, '2023-10-31 08:04:04', 1, '2023-10-31 08:04:04', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

DROP TABLE IF EXISTS `sesion`;
CREATE TABLE IF NOT EXISTS `sesion` (
  `Id_Sesion` varchar(255) NOT NULL,
  `Usuario_Id` bigint DEFAULT NULL,
  `Direccion_Ip` varchar(45) DEFAULT NULL,
  `Usuario_Agente` text,
  `Payload` text NOT NULL,
  `Ultima_Actividad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_aldeas`
--

DROP TABLE IF EXISTS `tbl_aldeas`;
CREATE TABLE IF NOT EXISTS `tbl_aldeas` (
  `Id_Aldea` bigint NOT NULL AUTO_INCREMENT,
  `Id_Municipio` bigint NOT NULL,
  `Nombre_Aldea` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estado` enum('A','I') DEFAULT NULL,
  `Id_Usuario` bigint DEFAULT NULL,
  `Creado_Por` bigint NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modificado_Por` bigint NOT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_Aldea`),
  KEY `FK_Aldea_Usuario` (`Id_Usuario`),
  KEY `FK_Aldea_Municipio` (`Id_Municipio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_aldeas`
--

INSERT INTO `tbl_aldeas` (`Id_Aldea`, `Id_Municipio`, `Nombre_Aldea`, `Descripcion`, `Estado`, `Id_Usuario`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`) VALUES
(1, 1, 'Agua Blanca', 'Aldea de talanga', 'A', 1, 1, '2023-11-05 04:52:40', 1, '2023-11-05 04:52:40'),
(2, 2, 'la capa', 'aldea de yoro', 'A', 1, 1, '2023-11-05 05:20:52', 1, '2023-11-05 05:20:52'),
(3, 2, 'A', 'A', 'I', 1, 1, '2023-11-05 06:47:24', 1, '2023-11-05 09:01:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_apoyos`
--

DROP TABLE IF EXISTS `tbl_apoyos`;
CREATE TABLE IF NOT EXISTS `tbl_apoyos` (
  `id_apoyo_produccion` int NOT NULL AUTO_INCREMENT,
  `tipo_apoyo_produccion` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_apoyo_produccion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_apoyos`
--

INSERT INTO `tbl_apoyos` (`id_apoyo_produccion`, `tipo_apoyo_produccion`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Bono Productor', 'Segun indicaciones fueron 3 manzanas haha', NULL, '2023-11-04 14:07:20', NULL, '2023-11-04 14:07:20', 'ACTIVO'),
(2, 'SalarioA', 'Un sueldo base1', 'Daniela', '2023-11-05 08:59:34', 'Daniela', '2023-11-05 08:59:34', 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cacerios`
--

DROP TABLE IF EXISTS `tbl_cacerios`;
CREATE TABLE IF NOT EXISTS `tbl_cacerios` (
  `Id_Cacerio` bigint NOT NULL AUTO_INCREMENT,
  `Id_Aldea` bigint NOT NULL,
  `Nombre_Cacerio` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estado` enum('A','I') DEFAULT NULL,
  `Id_Usuario` bigint DEFAULT NULL,
  `Creado_Por` bigint NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modificado_Por` bigint NOT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_Cacerio`),
  KEY `FK_Cacerio_Usuario` (`Id_Usuario`),
  KEY `FK_Caserio_Aldea` (`Id_Aldea`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_cacerios`
--

INSERT INTO `tbl_cacerios` (`Id_Cacerio`, `Id_Aldea`, `Nombre_Cacerio`, `Descripcion`, `Estado`, `Id_Usuario`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`) VALUES
(1, 1, 'Cacerio1', 'Descripción1', 'I', 1, 1, '2023-11-04 06:00:00', 1, '2023-11-04 06:00:00'),
(2, 2, 'Cacerio2', 'Descripción2', 'I', 1, 1, '2023-11-04 06:00:00', 1, '2023-11-04 06:00:00'),
(3, 1, 'Cacerio3', 'Descripción3', 'I', 1, 1, '2023-11-04 06:00:00', 1, '2023-11-04 06:00:00'),
(4, 2, 'Cacerio4', 'Descripción4', 'A', 1, 1, '2023-11-04 06:00:00', 1, '2023-11-05 09:01:00'),
(5, 1, 'Cacerio5', 'Descripción5', 'I', 1, 1, '2023-11-04 06:00:00', 1, '2023-11-04 06:00:00'),
(6, 2, 'Cacerio6', 'Descripción6', 'A', 1, 1, '2023-11-04 06:00:00', 1, '2023-11-05 09:01:09'),
(7, 1, 'Cacerio7', 'Descripción7', 'I', 1, 1, '2023-11-04 06:00:00', 1, '2023-11-04 06:00:00'),
(8, 2, 'Cacerio8', 'Descripción8', 'I', 1, 1, '2023-11-04 06:00:00', 1, '2023-11-04 06:00:00'),
(9, 1, 'Cacerio9', 'Descripción9', 'I', 1, 1, '2023-11-04 06:00:00', 1, '2023-11-04 06:00:00'),
(10, 2, 'Cacerio10', 'Descripción10', 'A', 1, 1, '2023-11-04 06:00:00', 1, '2023-11-05 09:00:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_departamentos`
--

DROP TABLE IF EXISTS `tbl_departamentos`;
CREATE TABLE IF NOT EXISTS `tbl_departamentos` (
  `Id_Departamento` bigint NOT NULL AUTO_INCREMENT,
  `Id_Usuario` bigint DEFAULT NULL,
  `Nombre_Departamento` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Creado_Por` bigint NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modificado_Por` bigint NOT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`Id_Departamento`),
  KEY `FK_Departamento_Usuario` (`Id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_departamentos`
--

INSERT INTO `tbl_departamentos` (`Id_Departamento`, `Id_Usuario`, `Nombre_Departamento`, `Descripcion`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `Estado`) VALUES
(1, 1, 'Francisco Morazan', 'Central', 1, '2023-11-05 04:15:22', 1, '2023-11-05 04:15:22', 'A'),
(2, 1, 'Olancho', 'Sur', 1, '2023-11-05 04:41:44', 1, '2023-11-05 09:01:36', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_etnias`
--

DROP TABLE IF EXISTS `tbl_etnias`;
CREATE TABLE IF NOT EXISTS `tbl_etnias` (
  `id_etnia` int NOT NULL AUTO_INCREMENT,
  `etnia` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` int DEFAULT NULL,
  PRIMARY KEY (`id_etnia`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_etnias`
--

INSERT INTO `tbl_etnias` (`id_etnia`, `etnia`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Etnia 1', 'Prueba', 'Usuario1', '2023-11-04 09:04:51', 'Usuario1', '2023-11-04 09:04:51', 1),
(2, 'Etnia 2', 'Descripción de Etnia 2', 'Usuario2', '2023-11-04 09:04:51', 'Usuario2', '2023-11-04 09:04:51', 0),
(3, 'Etnia 3', 'Descripción de Etnia 3', 'Usuario3', '2023-11-04 09:04:51', 'Usuario3', '2023-11-04 09:04:51', 0),
(4, 'Etnia 4', 'Descripción de Etnia 4', 'Usuario4', '2023-11-04 09:04:51', 'Usuario4', '2023-11-04 09:04:51', 1),
(5, 'Etnia 5', 'Descripción de Etnia 5', 'Usuario5', '2023-11-04 09:04:51', 'Usuario5', '2023-11-04 09:04:51', 0),
(6, 'Etnia 6', 'Descripción de Etnia 6', 'Usuario6', '2023-11-04 09:04:51', 'Usuario6', '2023-11-04 09:04:51', 1),
(7, 'Etnia 7', 'Descripción de Etnia 7', 'Usuario7', '2023-11-04 09:04:51', 'Usuario7', '2023-11-04 09:04:51', 1),
(8, 'Etnia 8', 'Descripción de Etnia 8', 'Usuario8', '2023-11-04 09:04:51', 'Usuario8', '2023-11-04 09:04:51', 0),
(9, 'Etnia 9', 'Descripción de Etnia 9', 'Usuario9', '2023-11-04 09:04:51', 'Usuario9', '2023-11-04 09:04:51', 1),
(10, 'Etnia 10', 'Descripción de Etnia 10', 'Usuario10', '2023-11-04 09:04:51', 'Usuario10', '2023-11-04 09:04:51', 0),
(11, 'Etnia 11', 'Descripción de Etnia 11', 'Usuario11', '2023-11-04 09:04:51', 'Usuario11', '2023-11-04 09:04:51', 0),
(12, 'Etnia 12', 'Descripción de Etnia ', 'Usuario12', '2023-11-05 03:38:42', 'Usuario12', '2023-11-05 03:38:42', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_fuentes_credito`
--

DROP TABLE IF EXISTS `tbl_fuentes_credito`;
CREATE TABLE IF NOT EXISTS `tbl_fuentes_credito` (
  `id_fuente_credito` int NOT NULL AUTO_INCREMENT,
  `fuente_credito` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_fuente_credito`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_fuentes_credito`
--

INSERT INTO `tbl_fuentes_credito` (`id_fuente_credito`, `fuente_credito`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Fuente 1', 'Descripción Fuente 1', 'usuario1', '2023-11-05 03:41:44', 'usuario1', '2023-11-05 03:41:44', '1'),
(2, 'Fuente 2', 'Descripción Fuente 2', 'usuario1', '2023-11-05 00:43:53', 'usuario1', '2023-11-05 00:43:53', '0'),
(3, 'Fuente 3', 'Descripción Fuente 3', 'usuario1', '2023-11-05 00:43:53', 'usuario1', '2023-11-05 00:43:53', '0'),
(4, 'Fuente 4', 'Descripción Fuente 4', 'usuario1', '2023-11-05 00:43:53', 'usuario1', '2023-11-05 00:43:53', '0'),
(5, 'Fuente 5', 'Descripción Fuente 5', 'usuario1', '2023-11-05 00:43:53', 'usuario1', '2023-11-05 00:43:53', '0'),
(6, 'Fuente 6', 'Descripción Fuente 6', 'usuario1', '2023-11-05 00:43:53', 'usuario1', '2023-11-05 00:43:53', '0'),
(7, 'Fuente 7', 'Descripción Fuente 7', 'usuario1', '2023-11-05 03:41:29', 'usuario1', '2023-11-05 03:41:29', '1'),
(8, 'Fuente 8', 'Descripción Fuente 8', 'usuario1', '2023-11-05 00:43:53', 'usuario1', '2023-11-05 00:43:53', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_medidas_tierra`
--

DROP TABLE IF EXISTS `tbl_medidas_tierra`;
CREATE TABLE IF NOT EXISTS `tbl_medidas_tierra` (
  `id_medida` int NOT NULL AUTO_INCREMENT,
  `medida` enum('MZ','HA','TAREAS','') DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_medidas_tierra`
--

INSERT INTO `tbl_medidas_tierra` (`id_medida`, `medida`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'TAREAS', 'Son 5 tareas', NULL, '2023-11-04 14:08:58', NULL, '2023-11-04 14:08:58', 'ACTIVO'),
(2, 'HA', 'Se compraron 2', 'Daniela', '2023-11-05 08:59:02', 'Daniela', '2023-11-05 08:59:02', 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_motivos_migracion`
--

DROP TABLE IF EXISTS `tbl_motivos_migracion`;
CREATE TABLE IF NOT EXISTS `tbl_motivos_migracion` (
  `Id_motivo` bigint NOT NULL AUTO_INCREMENT,
  `Motivo` varchar(255) DEFAULT NULL,
  `Descripcion` text,
  `Creado_por` varchar(255) DEFAULT NULL,
  `Fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modificado_por` varchar(255) DEFAULT NULL,
  `Fecha_Actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`Id_motivo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_motivos_migracion`
--

INSERT INTO `tbl_motivos_migracion` (`Id_motivo`, `Motivo`, `Descripcion`, `Creado_por`, `Fecha_creacion`, `Modificado_por`, `Fecha_Actualizacion`, `Estado`) VALUES
(1, 'Trabajo', 'No encontre empleo', 'Manuel', '2023-10-31 03:56:32', 'Manuel', '2023-10-31 03:56:32', 'INACTIVO'),
(2, 'JUBILACION', 'RESIDENCIA', NULL, '2023-10-31 04:58:55', NULL, '2023-10-31 04:58:55', ''),
(3, 'JUBILACION', 'Vive alla', 'Manuel', '2023-10-31 05:07:18', 'Manuel', '2023-11-04 05:20:37', 'INACTIVO'),
(4, 'JUBILACION', 'por ', 'Manuel', '2023-10-31 05:15:26', 'Manuel', '2023-10-31 05:33:43', 'INACTIVO'),
(5, 'DXFCVGBH', 'FVGJHBKJNK', 'Manuel', '2023-10-31 05:34:00', 'Manuel', '2023-10-31 05:34:00', 'ACTIVO'),
(6, 'FD', 'eyey', 'Manuel', '2023-10-31 05:39:54', 'Manuel', '2023-10-31 07:08:35', 'ACTIVO'),
(7, 'JUBILACION SI', 'asdgrrfqeafqe', 'Manuel', '2023-10-31 07:02:30', 'Manuel', '2023-10-31 07:08:24', 'ACTIVO'),
(8, 'edi', 'E3QERRR3E', 'Manuel', '2023-10-31 07:55:37', 'Manuel', '2023-11-01 04:39:36', 'INACTIVO'),
(9, 's', 'asd', 'Manuel', '2023-11-01 05:51:35', 'Manuel', '2023-11-01 05:52:31', 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_municipios`
--

DROP TABLE IF EXISTS `tbl_municipios`;
CREATE TABLE IF NOT EXISTS `tbl_municipios` (
  `Id_Municipio` bigint NOT NULL AUTO_INCREMENT,
  `Id_Departamento` bigint NOT NULL,
  `Id_Usuario` bigint DEFAULT NULL,
  `Nombre_Municipio` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Creado_Por` bigint NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modificado_Por` bigint NOT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estado` enum('A','I') DEFAULT NULL,
  PRIMARY KEY (`Id_Municipio`),
  KEY `FK_Municipio_Usuario` (`Id_Usuario`),
  KEY `FK_Municipio_Departamento` (`Id_Departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_municipios`
--

INSERT INTO `tbl_municipios` (`Id_Municipio`, `Id_Departamento`, `Id_Usuario`, `Nombre_Municipio`, `Descripcion`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `Estado`) VALUES
(1, 1, 1, 'Talanga', 'Talanga', 1, '2023-11-05 04:33:27', 1, '2023-11-05 04:33:27', 'A'),
(2, 1, 1, 'Yoro', 'Dep. Yoro', 1, '2023-11-05 04:54:02', 1, '2023-11-05 04:54:02', 'A'),
(4, 1, 1, 'COMAYAGUELA', '32wd', 1, '2023-11-05 06:24:59', 1, '2023-11-05 06:24:59', 'A'),
(5, 2, 1, 'TEGUCIGALPA', 'DEP. ', 1, '2023-11-05 06:26:27', 1, '2023-11-05 09:01:26', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_organizaciones`
--

DROP TABLE IF EXISTS `tbl_organizaciones`;
CREATE TABLE IF NOT EXISTS `tbl_organizaciones` (
  `id_organizacion` int NOT NULL AUTO_INCREMENT,
  `organizacion` varchar(255) DEFAULT NULL,
  `id_tipo_organizacion` int DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_organizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_organizaciones`
--

INSERT INTO `tbl_organizaciones` (`id_organizacion`, `organizacion`, `id_tipo_organizacion`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'orga', 1, 'desc', '1', '2023-11-03 05:00:40', NULL, '2023-11-03 05:01:48', 'ACTIVO'),
(3, 'orga2', 1, 'desc2', 'Kevin', '2023-11-03 05:06:50', 'Kevin', '2023-11-03 05:16:38', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_periodicidad`
--

DROP TABLE IF EXISTS `tbl_periodicidad`;
CREATE TABLE IF NOT EXISTS `tbl_periodicidad` (
  `id_periodo` int NOT NULL AUTO_INCREMENT,
  `periodo` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_periodicidad`
--

INSERT INTO `tbl_periodicidad` (`id_periodo`, `periodo`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'marzo', 'descr', 'Manuel', '2023-10-31 19:41:24', 'Manuel', '2023-10-31 19:41:24', ''),
(2, 'se', 'se', NULL, '2023-10-31 21:03:54', NULL, '2023-10-31 21:03:54', ''),
(3, 'e', 'e', NULL, '2023-10-31 21:17:57', NULL, '2023-10-31 21:33:04', ''),
(4, 'adsda', 'dfa', NULL, '2023-10-31 21:36:39', NULL, '2023-11-01 04:46:23', 'ACTIVO'),
(9, 'rwewe', 'gdgd', 'Manuel', '2023-11-01 04:45:38', 'Manuel', '2023-11-01 06:07:37', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipos_apoyos`
--

DROP TABLE IF EXISTS `tbl_tipos_apoyos`;
CREATE TABLE IF NOT EXISTS `tbl_tipos_apoyos` (
  `id_tipo_apoyos` bigint NOT NULL AUTO_INCREMENT,
  `tipo_apoyos` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_apoyos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_tipos_apoyos`
--

INSERT INTO `tbl_tipos_apoyos` (`id_tipo_apoyos`, `tipo_apoyos`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Bono', 'Bono ganadero', 'Daniela', '2023-11-04 13:29:36', 'Daniela', '2023-11-04 13:29:36', 'ACTIVO'),
(2, 'Bono A', 'Bono Agricultor 1', 'Daniela', '2023-11-05 08:59:41', 'Daniela', '2023-11-05 08:59:41', 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_cultivo`
--

DROP TABLE IF EXISTS `tbl_tipo_cultivo`;
CREATE TABLE IF NOT EXISTS `tbl_tipo_cultivo` (
  `id_tipo_cultivo` int NOT NULL AUTO_INCREMENT,
  `tipo_cultivo` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_cultivo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_tipo_cultivo`
--

INSERT INTO `tbl_tipo_cultivo` (`id_tipo_cultivo`, `tipo_cultivo`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Maiz', 'Maiz amarillo', 'Manuel', '2023-12-01 04:18:29', NULL, '2023-11-02 04:18:29', 'ACTIVO'),
(4, 'Frijol', 'ADS', 'Manuel', '2023-11-02 05:10:49', 'Manuel', '2023-11-02 05:10:49', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_negocios`
--

DROP TABLE IF EXISTS `tbl_tipo_negocios`;
CREATE TABLE IF NOT EXISTS `tbl_tipo_negocios` (
  `id_tipo_negocio` int NOT NULL AUTO_INCREMENT,
  `tipo_negocio` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_negocio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_tipo_negocios`
--

INSERT INTO `tbl_tipo_negocios` (`id_tipo_negocio`, `tipo_negocio`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Granja', 'venta de huevos', '1', '2023-12-01 04:29:34', '1', '2023-11-04 04:29:34', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_organizacion`
--

DROP TABLE IF EXISTS `tbl_tipo_organizacion`;
CREATE TABLE IF NOT EXISTS `tbl_tipo_organizacion` (
  `id_tipo_organizacion` int NOT NULL AUTO_INCREMENT,
  `tipo_organizacion` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_organizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_tipo_organizacion`
--

INSERT INTO `tbl_tipo_organizacion` (`id_tipo_organizacion`, `tipo_organizacion`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'BENEFICA', 'Grupo Solidario ', '1', '2023-11-05 08:57:22', '1', '2023-11-05 08:57:22', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_pecuarios`
--

DROP TABLE IF EXISTS `tbl_tipo_pecuarios`;
CREATE TABLE IF NOT EXISTS `tbl_tipo_pecuarios` (
  `id_tipo_pecuario` int NOT NULL AUTO_INCREMENT,
  `tipo_pecuario` varchar(255) DEFAULT NULL,
  `raza_con_genero` char(1) DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_pecuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tbl_tipo_pecuarios`
--

INSERT INTO `tbl_tipo_pecuarios` (`id_tipo_pecuario`, `tipo_pecuario`, `raza_con_genero`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Ganado Bovino', 'M', 'Raza de ganado bovino macho', 'Usuario 1', '2023-11-06 03:07:47', 'Usuario 1', '2023-11-06 03:07:47', 'INACTIVO'),
(2, 'Ganado Bovino', 'H', 'Raza de ganado bovino hembra', 'Usuario2', '2023-11-06 02:09:49', 'Usuario2', '2023-11-06 02:09:49', 'Activo'),
(3, 'Cerdos', 'M', 'Raza de cerdos macho', 'Usuario3', '2023-11-06 02:09:49', 'Usuario3', '2023-11-06 02:09:49', 'Activo'),
(4, 'Cerdos', 'H', 'Raza de cerdos hembra', 'Usuario4', '2023-11-06 02:09:49', 'Usuario4', '2023-11-06 02:09:49', 'Activo'),
(5, 'Aves', 'M', 'Raza de aves macho', 'Usuario5', '2023-11-06 02:09:49', 'Usuario5', '2023-11-06 02:09:49', 'Activo'),
(6, 'Aves', 'H', 'Raza de aves hembra', 'Usuario6', '2023-11-06 02:09:49', 'Usuario6', '2023-11-06 02:09:49', 'Activo'),
(7, 'Caballos', 'M', 'Raza de caballos macho', 'Usuario7', '2023-11-06 02:09:49', 'Usuario7', '2023-11-06 02:09:49', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_practicas_productivas`
--

DROP TABLE IF EXISTS `tbl_tipo_practicas_productivas`;
CREATE TABLE IF NOT EXISTS `tbl_tipo_practicas_productivas` (
  `id_tipo_practica` int NOT NULL AUTO_INCREMENT,
  `tipo_practica` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_practica`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_tipo_practicas_productivas`
--

INSERT INTO `tbl_tipo_practicas_productivas` (`id_tipo_practica`, `tipo_practica`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Siembra', 'Maiz', '1', '2023-11-04 06:27:46', '1', '2023-11-04 06:27:46', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_produccion`
--

DROP TABLE IF EXISTS `tbl_tipo_produccion`;
CREATE TABLE IF NOT EXISTS `tbl_tipo_produccion` (
  `id_tipo_produccion` int NOT NULL AUTO_INCREMENT,
  `tipo_produccion` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_produccion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_tipo_produccion`
--

INSERT INTO `tbl_tipo_produccion` (`id_tipo_produccion`, `tipo_produccion`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Maiz', 'Maiz Blanco', '1', '2023-11-04 06:06:10', '1', '2023-11-04 06:06:10', 'ACTIVO'),
(2, 'Cafe', 'CAfe de palo', 'Kevin', '2023-11-05 01:55:51', 'Kevin', '2023-11-05 01:55:51', 'INACTIVO'),
(3, 'a', 'a', 'Kevin', '2023-11-05 01:55:45', 'Kevin', '2023-11-05 01:55:45', 'ACTIVO'),
(4, 'sd', 'sd', 'Kevin', '2023-11-04 06:17:09', 'Kevin', '2023-11-04 06:17:09', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_riego`
--

DROP TABLE IF EXISTS `tbl_tipo_riego`;
CREATE TABLE IF NOT EXISTS `tbl_tipo_riego` (
  `id_tipo_riego` int NOT NULL AUTO_INCREMENT,
  `tipo_riego` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_riego`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_tipo_riego`
--

INSERT INTO `tbl_tipo_riego` (`id_tipo_riego`, `tipo_riego`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Pozo', 'Pozo', 'Manuel', '2023-11-02 05:23:18', 'Manuel', '2023-11-02 05:23:18', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_trabajadores`
--

DROP TABLE IF EXISTS `tbl_tipo_trabajadores`;
CREATE TABLE IF NOT EXISTS `tbl_tipo_trabajadores` (
  `id_tipo_trabajador` int NOT NULL AUTO_INCREMENT,
  `tipo_trabajador` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_trabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_tipo_trabajadores`
--

INSERT INTO `tbl_tipo_trabajadores` (`id_tipo_trabajador`, `tipo_trabajador`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Ganadero', 'kkka', 'Daniela', '2023-11-04 13:41:05', 'Daniela', '2023-11-04 13:41:05', 'ACTIVO'),
(2, 'Agricultor', '3 cultivos de papa', 'Daniela', '2023-11-05 08:58:54', 'Daniela', '2023-11-05 08:58:54', 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_toma_decisiones`
--

DROP TABLE IF EXISTS `tbl_toma_decisiones`;
CREATE TABLE IF NOT EXISTS `tbl_toma_decisiones` (
  `id_tipo_tomador` int NOT NULL AUTO_INCREMENT,
  `tomador` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL,
  PRIMARY KEY (`id_tipo_tomador`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_toma_decisiones`
--

INSERT INTO `tbl_toma_decisiones` (`id_tipo_tomador`, `tomador`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'SAG', 'Se decidio por voto', 'Daniela', '2023-11-04 13:40:26', 'Daniela', '2023-11-04 13:40:26', 'ACTIVO'),
(2, 'SAG 1', 'Creacion de base 1', 'Daniela', '2023-11-04 22:44:19', 'Daniela', '2023-11-04 22:44:19', 'ACTIVO'),
(3, 'UPEG1', 'Pagos1', 'Daniela', '2023-11-05 08:58:41', 'Daniela', '2023-11-05 08:58:41', 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `Id_Usuario` bigint NOT NULL AUTO_INCREMENT,
  `Id_rol` bigint NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Correo` varchar(255) NOT NULL,
  `Usuario` varchar(255) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `Token` varchar(100) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Actualizado_Por` bigint NOT NULL,
  `Fecha_Actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Preguntas_Contestadas` int NOT NULL,
  `Estado` int NOT NULL,
  `Id_estado` bigint NOT NULL,
  `Primera_Vez` tinyint(1) NOT NULL,
  `Fecha_Vencimiento` date NOT NULL,
  `Intentos_Preguntas` int DEFAULT NULL,
  `Preguntas_Correctas` int DEFAULT NULL,
  `Intentos_Fallidos` int DEFAULT NULL,
  PRIMARY KEY (`Id_Usuario`),
  KEY `Estado` (`Id_estado`),
  KEY `Rol` (`Id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id_Usuario`, `Id_rol`, `Nombre`, `Correo`, `Usuario`, `Contraseña`, `Token`, `Fecha_Creacion`, `Actualizado_Por`, `Fecha_Actualizacion`, `Preguntas_Contestadas`, `Estado`, `Id_estado`, `Primera_Vez`, `Fecha_Vencimiento`, `Intentos_Preguntas`, `Preguntas_Correctas`, `Intentos_Fallidos`) VALUES
(1, 1, 'manuel', 'manuel@gmail.com', 'manu', '123', '1', '2023-10-29 01:48:15', 1, '2023-10-30 01:48:15', 1, 1, 1, 1, '2023-10-31', NULL, NULL, 0),
(2, 18, 'AS', 'AS', 'ASZ', '111', NULL, '2023-10-25 08:04:11', 1, '2023-10-31 08:04:11', 1, 1, 1, 1, '2023-10-31', NULL, NULL, NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD CONSTRAINT `Parametro_Usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `Permisos_Objeto` FOREIGN KEY (`Id_objetos`) REFERENCES `objetos` (`Id_objetos`),
  ADD CONSTRAINT `Permisos_Rol` FOREIGN KEY (`Id_rol`) REFERENCES `roles` (`Id_rol`);

--
-- Filtros para la tabla `preguntas_usuario`
--
ALTER TABLE `preguntas_usuario`
  ADD CONSTRAINT `Preguntas_P` FOREIGN KEY (`Id_pregunta`) REFERENCES `preguntas` (`Id_pregunta`),
  ADD CONSTRAINT `Preguntas_U` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`);

--
-- Filtros para la tabla `tbl_aldeas`
--
ALTER TABLE `tbl_aldeas`
  ADD CONSTRAINT `FK_Aldea_Municipio` FOREIGN KEY (`Id_Municipio`) REFERENCES `tbl_municipios` (`Id_Municipio`),
  ADD CONSTRAINT `FK_Aldea_Usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`);

--
-- Filtros para la tabla `tbl_cacerios`
--
ALTER TABLE `tbl_cacerios`
  ADD CONSTRAINT `FK_Cacerio_Usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`),
  ADD CONSTRAINT `FK_Caserio_Aldea` FOREIGN KEY (`Id_Aldea`) REFERENCES `tbl_aldeas` (`Id_Aldea`);

--
-- Filtros para la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  ADD CONSTRAINT `FK_Departamento_Usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`);

--
-- Filtros para la tabla `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  ADD CONSTRAINT `FK_Municipio_Departamento` FOREIGN KEY (`Id_Departamento`) REFERENCES `tbl_departamentos` (`Id_Departamento`),
  ADD CONSTRAINT `FK_Municipio_Usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `Estado` FOREIGN KEY (`Id_estado`) REFERENCES `estado_usuario` (`id_estado`),
  ADD CONSTRAINT `Rol` FOREIGN KEY (`Id_rol`) REFERENCES `roles` (`Id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
