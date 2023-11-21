-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2023 a las 09:38:18
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarEtniasPorProductor` (IN `p_Id_etnicidad` BIGINT, IN `p_id_ficha` BIGINT, IN `p_id_productor` BIGINT, IN `p_id_etnia` BIGINT, IN `p_detalle_de_otros` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(255), IN `p_estado` ENUM('A','I'))   BEGIN
    DECLARE v_valid_productor BOOLEAN;

    -- Verificar si el id_productor coincide con el id_ficha en la tabla fichas
    SELECT COUNT(*) INTO v_valid_productor
    FROM tbl_productor p
    JOIN fichas f ON p.id_ficha = f.id_ficha
    WHERE p.id_ficha = p_id_ficha AND p.id_productor = p_id_productor;

    -- Si el id_productor no coincide, lanzar un error o tomar medidas apropiadas
    IF v_valid_productor = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El id_productor no coincide con el id_ficha en la tabla fichas';
    ELSE
        -- Realizar la actualización si la validación es exitosa
        UPDATE tbl_etnias_por_productor
        SET
            id_ficha = p_id_ficha,
            id_productor = p_id_productor,
            id_etnia = p_id_etnia,
            detalle_de_otros = p_detalle_de_otros,
            descripcion = p_descripcion,
            modificado_por = p_modificado_por,
            fecha_modificacion = CURRENT_TIMESTAMP(),
            estado = p_estado
        WHERE
            Id_etnicidad = p_Id_etnicidad;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarOrganizacionPorProductor` (IN `p_Id_Organizacion_Productor` BIGINT(20), IN `p_id_ficha` BIGINT(20), IN `p_id_productor` BIGINT(20), IN `p_id_organizacion` BIGINT(20), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(20), IN `p_estado` ENUM('A','I'))   BEGIN
    UPDATE `tbl_organizaciones_por_productor`
    SET
        `id_ficha` = p_id_ficha,
        `id_productor` = p_id_productor,
        `id_organizacion` = p_id_organizacion,
        `descripcion` = p_descripcion,
        `modificado_por` = p_modificado_por,
        `fecha_modificacion` = CURRENT_TIMESTAMP(),
        `estado` = p_estado
    WHERE
        `Id_Organizacion_Productor` = p_Id_Organizacion_Productor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProductor` (IN `p_id_productor` BIGINT, IN `p_id_ficha` BIGINT, IN `p_primer_nombre` VARCHAR(255), IN `p_segundo_nombre` VARCHAR(255), IN `p_primer_apellido` VARCHAR(255), IN `p_segundo_apellido` VARCHAR(255), IN `p_identificacion` BIGINT, IN `p_fecha_nacimiento` DATE, IN `p_genero` VARCHAR(10), IN `p_estado_civil` VARCHAR(20), IN `p_nivel_escolaridad` VARCHAR(50), IN `p_ultimo_grado_escolar_aprobado` VARCHAR(50), IN `p_telefono_1` INT, IN `p_telefono_2` INT, IN `p_telefono_3` INT, IN `p_email_1` VARCHAR(255), IN `p_email_2` VARCHAR(255), IN `p_email_3` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_modificado_por` BIGINT, IN `p_estado` ENUM('A','I'))   BEGIN
    DECLARE v_valid_productor BOOLEAN;

    -- Verificar si el id_productor coincide con el id_ficha en la tabla fichas
    SELECT COUNT(*) INTO v_valid_productor
    FROM tbl_productor p
    JOIN fichas f ON p.id_ficha = f.id_ficha
    WHERE p.id_ficha = p_id_ficha AND p.id_productor = p_id_productor;

    -- Si el id_productor no coincide, lanzar un error o tomar medidas apropiadas
    IF v_valid_productor = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El id_productor no coincide con el id_ficha en la tabla fichas';
    ELSE
        -- Realizar la actualización si la validación es exitosa
        UPDATE tbl_productor
        SET
            id_ficha = p_id_ficha,
            primer_nombre = p_primer_nombre,
            segundo_nombre = p_segundo_nombre,
            primer_apellido = p_primer_apellido,
            segundo_apellido = p_segundo_apellido,
            identificacion = p_identificacion,
            fecha_nacimiento = p_fecha_nacimiento,
            genero = p_genero,
            estado_civil = p_estado_civil,
            nivel_escolaridad = p_nivel_escolaridad,
            ultimo_grado_escolar_aprobado = p_ultimo_grado_escolar_aprobado,
            telefono_1 = p_telefono_1,
            telefono_2 = p_telefono_2,
            telefono_3 = p_telefono_3,
            email_1 = p_email_1,
            email_2 = p_email_2,
            email_3 = p_email_3,
            descripcion = p_descripcion,
            modificado_por = p_modificado_por,
            fecha_modificacion = CURRENT_TIMESTAMP(),
            estado = p_estado
        WHERE
            id_productor = p_id_productor;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarRegistro` (IN `p_Id_Organizacion_Productor` BIGINT, IN `p_id_ficha` BIGINT, IN `p_id_organizacion` BIGINT, IN `p_id_productor` BIGINT, IN `p_descripcion` VARCHAR(255), IN `p_modificado_por` BIGINT, IN `p_estado` ENUM('A','I'))   BEGIN
    DECLARE v_valid_productor BOOLEAN;

    -- Verificar si el id_productor coincide con el id_ficha en la tabla fichas
    SELECT COUNT(*) INTO v_valid_productor
    FROM tbl_productor p
    JOIN fichas f ON p.id_ficha = f.id_ficha
    WHERE p.id_ficha = p_id_ficha AND p.id_productor = p_id_productor;

    -- Si el id_productor no coincide, lanzar un error o tomar medidas apropiadas
    IF v_valid_productor = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El id_productor no coincide con el id_ficha en la tabla fichas';
    ELSE
        -- Realizar la actualización si la validación es exitosa
        UPDATE tbl_organizaciones_por_productor
        SET
            id_ficha = p_id_ficha,
            id_productor = p_id_productor,
            id_organizacion = p_id_organizacion,
            descripcion = p_descripcion,
            modificado_por = p_modificado_por,
            fecha_modificacion = CURRENT_TIMESTAMP(),
            estado = p_estado
        WHERE
            Id_Organizacion_Productor = p_Id_Organizacion_Productor;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarRelevoOrganizacion` (IN `p_Id_Relevo` BIGINT, IN `p_id_ficha` BIGINT, IN `p_id_productor` BIGINT, IN `p_tendra_relevo` ENUM('S','N'), IN `p_cuantos_relevos` INT, IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(25), IN `p_estado` ENUM('A','I'))   BEGIN
    DECLARE v_valid_productor BOOLEAN;

    -- Verificar si el id_productor coincide con el id_ficha en la tabla fichas
    SELECT COUNT(*) INTO v_valid_productor
    FROM tbl_productor p
    JOIN fichas f ON p.id_ficha = f.id_ficha
    WHERE p.id_ficha = p_id_ficha AND p.id_productor = p_id_productor;

    -- Si el id_productor no coincide, lanzar un error o tomar medidas apropiadas
    IF v_valid_productor = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El id_productor no coincide con el id_ficha en la tabla fichas';
    ELSE
        -- Realizar la actualización si la validación es exitosa
        UPDATE tbl_relevo_organizacion
        SET
            id_ficha = p_id_ficha,
            id_productor = p_id_productor,
            tendra_relevo = p_tendra_relevo,
            cuantos_relevos = p_cuantos_relevos,
            descripcion = p_descripcion,
            modificado_por = p_modificado_por,
            fecha_modificacion = CURRENT_TIMESTAMP(),
            estado = p_estado
        WHERE
            Id_Relevo = p_Id_Relevo;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarUbicacionProductor` (IN `p_id_ubicacion` BIGINT, IN `p_id_ficha` BIGINT, IN `p_id_productor` BIGINT, IN `p_id_departamento` BIGINT, IN `p_id_municipio` BIGINT, IN `p_id_aldea` BIGINT, IN `p_id_caserio` BIGINT, IN `p_ubicacion_geografica` VARCHAR(255), IN `p_distancia_parcela_vivienda` DECIMAL(10,2), IN `p_latitud_parcela` VARCHAR(20), IN `p_longitud_parcela` VARCHAR(20), IN `p_msnm` DECIMAL(10,2), IN `p_direccion_1` VARCHAR(255), IN `p_direccion_2` VARCHAR(255), IN `p_direccion_3` VARCHAR(255), IN `p_vive_en_finca` ENUM('S','N'), IN `p_nombre_finca` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(50), IN `p_estado` ENUM('A','I'))   BEGIN
    DECLARE v_valid_productor BOOLEAN;

    -- Verificar si el id_productor coincide con el id_ficha en la tabla tbl_productor
    SELECT COUNT(*) INTO v_valid_productor
    FROM tbl_productor
    WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;

    -- Si el id_productor no coincide, lanzar un error o tomar medidas apropiadas
    IF v_valid_productor = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El id_productor no coincide con el id_ficha en la tabla tbl_productor';
    ELSE
        -- Realizar la actualización si la validación es exitosa
        UPDATE tbl_ubicacion_productor
        SET
            id_ficha = p_id_ficha,
            id_productor = p_id_productor,
            id_ubicacion = p_id_ubicacion,
            id_departamento = p_id_departamento,
            id_municipio = p_id_municipio,
            id_aldea = p_id_aldea,
            id_caserio = p_id_caserio,
            ubicacion_geografica = p_ubicacion_geografica,
            distancia_parcela_vivienda = p_distancia_parcela_vivienda,
            latitud_parcela = p_latitud_parcela,
            longitud_parcela = p_longitud_parcela,
            msnm = p_msnm,
            direccion_1 = p_direccion_1,
            direccion_2 = p_direccion_2,
            direccion_3 = p_direccion_3,
            vive_en_finca = p_vive_en_finca,
            nombre_finca = p_nombre_finca,
            descripcion = p_descripcion,
            modificado_por = p_modificado_por,
            fecha_modificacion = CURRENT_TIMESTAMP(),
            estado = p_estado
        WHERE
            id_ubicacion = p_id_ubicacion;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteEtnia` (IN `etniaId` INT)   BEGIN
  UPDATE tbl_etnias SET estado = 0 WHERE id_etnia = etniaId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteObjeto` (IN `newId_objetos` VARCHAR(255))   BEGIN
     DELETE FROM objetos WHERE Id_objetos = newId_objetos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePregunta` (IN `preguntaId` INT)   BEGIN
    DELETE FROM Preguntas WHERE Id_pregunta = preguntaId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DesactivarMotivo` (IN `id_motivo_param` INT)   BEGIN
  UPDATE `tbl_motivos_migracion`
  SET
    `Estado` = 'INACTIVO',
    `Fecha_Actualizacion` = CURRENT_TIMESTAMP
  WHERE `Id_motivo` = id_motivo_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarAldea` (IN `newId_Aldea` BIGINT(20), IN `newNombre_Aldea` VARCHAR(100), IN `newDescripcion` VARCHAR(255), IN `newEstado` ENUM('A','I'), IN `newId_Municipio` BIGINT(20), IN `newModificado_Por` VARCHAR(50))   BEGIN
    UPDATE tbl_aldeas
    SET Nombre_Aldea = newNombre_Aldea,
        Descripcion= newDescripcion,
        Estado= newEstado,
        Id_Municipio= newId_Municipio,
        Fecha_Modificacion = CURRENT_TIMESTAMP(),
Modificado_Por = newModificado_Por
    WHERE Id_Aldea = newId_Aldea;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarApoyo` (IN `id_apoyo_produccion_param` INT, IN `tipo_apoyo_produccion_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_apoyos`
  SET
    `tipo_apoyo_produccion` = tipo_apoyo_produccion_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_apoyo_produccion` = id_apoyo_produccion_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarCacerio` (IN `newId_Cacerio` BIGINT(20), IN `newNombre_Cacerio` VARCHAR(100), IN `newDescripcion` VARCHAR(255), IN `newEstado` ENUM('A','I'), IN `newId_Aldea` BIGINT(20))   BEGIN
    UPDATE tbl_cacerios
    SET Nombre_Cacerio = newNombre_Cacerio,
        Descripcion= newDescripcion,
        Estado= newEstado,
        Id_Aldea= newId_Aldea,
        Fecha_Modificacion = CURRENT_TIMESTAMP()
    WHERE Id_Cacerio = newId_Cacerio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarCultivo` (IN `id_tipo_cultivo_param` INT, IN `tipo_cultivo_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_tipo_cultivo`
  SET
    `tipo_cultivo` = tipo_cultivo_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_tipo_cultivo` = id_tipo_cultivo_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarDepartamento` (IN `newId_Departamento` BIGINT(20), IN `newNombre_Departamento` VARCHAR(100), IN `newDescripcion` VARCHAR(255), IN `newEstado` ENUM('A','I'))   BEGIN
    UPDATE tbl_departamentos
    SET Nombre_Departamento = newNombre_Departamento,
        Descripcion= newDescripcion,
        Estado= newEstado,
        Fecha_Modificacion = CURRENT_TIMESTAMP()
    WHERE Id_Departamento = newId_Departamento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarMedidaTierra` (IN `id_medida_param` INT, IN `medida_param` ENUM('MZ','HA','TAREAS'), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_medidas_tierra`
  SET
    `medida` =  medida_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_medida` = id_medida_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarMotivo` (IN `id_motivo_param` INT, IN `motivo_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_motivos_migracion`
  SET
    `Motivo` = motivo_param,
    `Descripcion` = descripcion_param,
    `Estado` = estado_param,
    `Fecha_Actualizacion` = CURRENT_TIMESTAMP
  WHERE `Id_motivo` = id_motivo_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarMunicipio` (IN `newId_Municipio` BIGINT(20), IN `newNombre_Municipio` VARCHAR(100), IN `newDescripcion` VARCHAR(255), IN `newEstado` ENUM('A','I'), IN `newId_Departamento` BIGINT(20))   BEGIN
    UPDATE tbl_municipios
    SET Nombre_Municipio = newNombre_Municipio,
        Descripcion= newDescripcion,
        Estado= newEstado,
        Id_Departamento= newId_Departamento,
        Fecha_Modificacion = CURRENT_TIMESTAMP()
    WHERE Id_Municipio = newId_Municipio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarOrganizacion` (IN `id_organizacion_param` INT, IN `organizacion_param` VARCHAR(255), IN `id_tipo_organizacion_param` INT, IN `descripcion_param` TEXT)   BEGIN
  UPDATE `tbl_organizaciones`
  SET
    `organizacion` = organizacion_param,
    `id_tipo_organizacion` = id_tipo_organizacion_param,
    `descripcion` = descripcion_param
  WHERE `id_organizacion` = id_organizacion_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarPeriodicidad` (IN `id_periodo_param` INT, IN `periodo_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_periodicidad`
  SET
    `periodo` = periodo_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_periodo` = id_periodo_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarPracticas` (IN `id_tipo_practica_param` INT, IN `tipo_practica_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_tipo_practicas_productivas`
  SET
    `tipo_practica` = tipo_practica_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_tipo_practica` = id_tipo_practica_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarRiego` (IN `id_tipo_riego_param` INT, IN `tipo_riego_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_tipo_riego`
  SET
    `tipo_riego` = tipo_riego_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_tipo_riego` = id_tipo_riego_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarTipoApoyo` (IN `id_tipo_apoyos_param` INT, IN `tipo_apoyos_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_tipos_apoyos`
  SET
    `tipo_apoyos` = tipo_apoyos_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_tipo_apoyos` = id_tipo_apoyos_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarTipoTrabajador` (IN `id_tipo_trabajador_param` INT, IN `tipo_trabajador_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_tipo_trabajadores`
  SET
    `tipo_trabajador` = tipo_trabajador_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_tipo_trabajador` = id_tipo_trabajador_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarTipo_Negocio` (IN `id_tipo_negocio_param` INT, IN `tipo_negocio_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_tipo_negocios`
  SET
    `tipo_negocio` = tipo_negocio_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param
  WHERE `id_tipo_negocio` = id_tipo_negocio_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarTipo_Organizacion` (IN `id_tipo_organizacion_param` INT, IN `tipo_organizacion_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_tipo_organizacion`
  SET
    `tipo_organizacion` = tipo_organizacion_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param
  WHERE `id_tipo_organizacion` = id_tipo_organizacion_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarTipo_Produccion` (IN `id_tipo_produccion_param` INT, IN `tipo_produccion_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('1','2'))   BEGIN
  UPDATE `tbl_tipo_produccion`
  SET
    `tipo_produccion` = tipo_produccion_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param
  WHERE `id_tipo_produccion` = id_tipo_produccion_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarTomaDecisiones` (IN `id_tipo_tomador_param` INT, IN `tomador_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_toma_decisiones`
  SET
    `tomador` =  tomador_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_tipo_tomador` = id_tipo_tomador_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarApoyo` (IN `id_apoyo_produccion_param` INT(11))   BEGIN
  DELETE FROM  tbl_apoyos WHERE id_apoyo_produccion = id_apoyo_produccion_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCacerio` (IN `newId_Cacerio` BIGINT(20))   BEGIN
     DELETE FROM tbl_cacerios WHERE Id_Cacerio = newId_Cacerio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCultivo` (IN `id_tipo_cultivo_parm` INT(20))   BEGIN
    DELETE FROM tbl_tipo_cultivo WHERE id_tipo_cultivo = id_tipo_cultivo_parm;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDepartamento` (IN `Id_Departamento_parm` INT(20))   BEGIN
    DELETE FROM tbl_departamentos WHERE Id_Departamento = Id_Departamento_parm;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMedidaTierra` (IN `id_medida_param` INT(11))   BEGIN
  DELETE FROM tbl_medidas_tierra WHERE id_medida = id_medida_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMotivo` (IN `id_motivo_param` INT)   BEGIN
  DELETE FROM `tbl_motivos_migracion`
  WHERE `Id_motivo` = id_motivo_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMunicipio` (IN `newId_Municipio` BIGINT(20))   BEGIN
     DELETE FROM tbl_municipios WHERE Id_Municipio = newId_Municipio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarOrganizacion` (IN `id_organizacion_param` INT(20))   BEGIN
  DELETE FROM tbl_organizaciones WHERE id_organizacion = id_organizacion_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarOrganizacionPorProductor` (IN `p_Id_Organizacion_Productor` BIGINT(20))   BEGIN
    DELETE FROM `tbl_organizaciones_por_productor`
    WHERE `Id_Organizacion_Productor` = p_Id_Organizacion_Productor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPeriodicidad` (IN `id_periodo_parm` INT(20))   BEGIN
    DELETE FROM tbl_periodicidad WHERE id_periodo = id_periodo_parm;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPracticas` (IN `id_tipo_practica_parm` INT(20))   BEGIN
    DELETE FROM tbl_tipo_practicas_productivas WHERE id_tipo_practica = id_tipo_practica_parm;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarRiego` (IN `id_tipo_riego_parm` INT(20))   BEGIN
    DELETE FROM tbl_tipo_riego WHERE id_tipo_riego = id_tipo_riego_parm;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTipoApoyo` (IN `id_tipo_apoyos_param` INT(11))   BEGIN
  DELETE FROM  tbl_tipos_apoyos WHERE id_tipo_apoyos = id_tipo_apoyos_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTipoTrabajador` (IN `id_tipo_trabajador_param` INT(11))   BEGIN
  DELETE FROM tbl_tipo_trabajadores WHERE id_tipo_trabajador = id_tipo_trabajador_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTipo_Negocio` (IN `id_tipo_negocio_parm` INT(20))   BEGIN
    DELETE FROM tbl_tipo_negocios WHERE id_tipo_negocio = id_tipo_negocio_parm;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTipo_Organizacion` (IN `id_tipo_organizacion_parm` INT(20))   BEGIN
    DELETE FROM tbl_tipo_organizacion WHERE id_tipo_organizacion = id_tipo_organizacion_parm;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTomaDecisiones` (IN `id_tipo_tomador_param` INT(11))   BEGIN
  DELETE FROM   tbl_toma_decisiones WHERE id_tipo_tomador = id_tipo_tomador_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAldea` (IN `p_Nombre_Aldea` VARCHAR(255), IN `p_Descripcion` VARCHAR(255), IN `p_Id_Municipio` BIGINT(20))   BEGIN
    INSERT INTO tbl_aldeas (Nombre_Aldea, Descripcion, Estado, Id_Municipio, Id_Usuario,
        Creado_Por, Fecha_Creacion, Modificado_Por, Fecha_Modificacion)
    VALUES (p_Nombre_Aldea, p_Descripcion, 'A', p_Id_Municipio, '1','1',CURRENT_TIMESTAMP(),'1',CURRENT_TIMESTAMP());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarApoyo` (IN `tipo_apoyo_produccion_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_apoyos` (`tipo_apoyo_produccion`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_apoyo_produccion_param, descripcion_param, 'Daniela', 'Daniela', 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCacerio` (IN `p_Nombre_Cacerio` VARCHAR(255), IN `p_Descripcion` VARCHAR(255), IN `p_Id_Aldea` BIGINT(20))   BEGIN
    INSERT INTO tbl_cacerios (Nombre_Cacerio, Descripcion, Estado, Id_Aldea, Id_Usuario,
        Creado_Por, Fecha_Creacion, Modificado_Por, Fecha_Modificacion)
    VALUES (p_Nombre_Cacerio, p_Descripcion, 'A', p_Id_Aldea, '1','1',CURRENT_TIMESTAMP(),'1',CURRENT_TIMESTAMP());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarComposicion` (IN `p_id_ficha` BIGINT, IN `p_id_productor` BIGINT, IN `p_genero` ENUM('H','M'), IN `p_edad` INT, IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(25))   BEGIN
    -- Realizar la inserción
    INSERT INTO tbl_composicion (
        id_ficha,
        id_productor,
        genero,
        edad,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
    ) VALUES (
        p_id_ficha,
        p_id_productor,
        p_genero,
        p_edad,
        p_descripcion,
        p_creado_por,
        CURRENT_TIMESTAMP(),
        NULL,
        CURRENT_TIMESTAMP(),
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCultivo` (IN `tipo_cultivo_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_cultivo` (`tipo_cultivo`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_cultivo_param, descripcion_param, 'Manuel', 'Manuel', 'ACTIVO');
END$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEtnia` (IN `etniaParam` VARCHAR(255), IN `descripcionParam` TEXT, IN `fechaCreacionParam` TIMESTAMP, IN `estadoParam` INT)   BEGIN
    DECLARE usuarioCreador VARCHAR(255);
    DECLARE usuarioModificador VARCHAR(255);
    
    SET usuarioCreador = 'usuario1';
    SET usuarioModificador = 'usuario1';

    INSERT INTO tbl_etnias (etnia, descripcion, creado_por, fecha_creacion, modificado_por, fecha_modificacion, estado)
    VALUES (etniaParam, descripcionParam, usuarioCreador, fechaCreacionParam, usuarioModificador, NOW(), estadoParam);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEtniasPorProductor` (IN `p_id_ficha` BIGINT, IN `p_id_productor` BIGINT, IN `p_id_etnia` BIGINT, IN `p_detalle_de_otros` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(255))   BEGIN
    DECLARE v_valid_productor BOOLEAN;

    -- Verificar si el id_productor coincide con el id_ficha en la tabla fichas
    SELECT COUNT(*) INTO v_valid_productor
    FROM tbl_productor p
    JOIN fichas f ON p.id_ficha = f.id_ficha
    WHERE p.id_ficha = p_id_ficha AND p.id_productor = p_id_productor;

    -- Si el id_productor no coincide, lanzar un error o tomar medidas apropiadas
    IF v_valid_productor = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El id_productor no coincide con el id_ficha en la tabla fichas';
    ELSE
        -- Realizar la inserción si la validación es exitosa
        INSERT INTO tbl_etnias_por_productor (
            id_ficha,
            id_productor,
            id_etnia,
            detalle_de_otros,
            descripcion,
            creado_por,
            fecha_creacion,
            modificado_por,
            fecha_modificacion,
            estado
        ) VALUES (
            p_id_ficha,
            p_id_productor,
            p_id_etnia,
            p_detalle_de_otros,
            p_descripcion,
            p_creado_por,
            CURRENT_TIMESTAMP(),
            NULL,
            CURRENT_TIMESTAMP(),
            'A'
        );
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMedidaTierra` (IN `medida_param` ENUM('MZ','HA','TAREAS'), IN `descripcion_param` TEXT)   BEGIN
    
    
    INSERT INTO tbl_medidas_tierra (medida, descripcion, creado_por, modificado_por, estado) 
    VALUES (medida_param, descripcion_param, 'Daniela', 'Daniela', 'ACTIVO');

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMotivo` (IN `motivo_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_motivos_migracion` (`Motivo`, `Descripcion`,`Creado_por`,`Modificado_por` ,`Estado`) 
  VALUES (motivo_param, descripcion_param,'Manuel','Manuel','ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMunicipio` (IN `p_Nombre_Municipio` VARCHAR(255), IN `p_Descripcion` VARCHAR(255), IN `p_Id_Departamento` BIGINT(20))   BEGIN
    INSERT INTO tbl_municipios (Nombre_Municipio, Descripcion, Estado, Id_Departamento, Id_Usuario,
        Creado_Por, Fecha_Creacion, Modificado_Por, Fecha_Modificacion)
    VALUES (p_Nombre_Municipio, p_Descripcion, 'A', p_Id_Departamento, '1','1',CURRENT_TIMESTAMP(),'1',CURRENT_TIMESTAMP());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarOrganizacion` (IN `organizacion_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_organizaciones` (`organizacion`, `descripcion`, `id_tipo_organizacion` ,`creado_por`,`modificado_por` , `estado`) 
  VALUES (organizacion_param, descripcion_param, '1' , 'Kevin', 'Kevin', 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarOrganizacionProductor` (IN `p_id_ficha` BIGINT(20), IN `p_id_organizacion` BIGINT(20), IN `p_id_productor` BIGINT(20), IN `p_descripcion` VARCHAR(20), IN `p_creado_por` VARCHAR(255))   BEGIN
    INSERT INTO `tbl_organizaciones_por_productor` (
        `id_ficha`,
        `id_organizacion`,
        `id_productor`,
        `descripcion`,
        `creado_por`,
        `fecha_creacion`,
        `modificado_por`,
        `fecha_modificacion`
    ) VALUES (
        p_id_ficha,
        p_id_organizacion,
        p_id_productor,
        p_descripcion,
        p_creado_por,
        CURRENT_TIMESTAMP(),
        NULL,
        CURRENT_TIMESTAMP()
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPeriodicidad` (IN `periodo_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_periodicidad` (`periodo`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (periodo_param, descripcion_param, 'Manuel', 'Manuel', 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPracticas` (IN `tipo_practica_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_practicas_productivas` (`tipo_practica`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_practica_param, descripcion_param, 'Manuel', 'Manuel', 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProductor` (IN `p_id_ficha` BIGINT, IN `p_id_productor` BIGINT, IN `p_primer_nombre` VARCHAR(255), IN `p_segundo_nombre` VARCHAR(255), IN `p_primer_apellido` VARCHAR(255), IN `p_segundo_apellido` VARCHAR(255), IN `p_identificacion` BIGINT, IN `p_fecha_nacimiento` DATE, IN `p_genero` VARCHAR(10), IN `p_estado_civil` VARCHAR(20), IN `p_nivel_escolaridad` VARCHAR(50), IN `p_ultimo_grado_escolar_aprobado` VARCHAR(50), IN `p_telefono_1` INT, IN `p_telefono_2` INT, IN `p_telefono_3` INT, IN `p_email_1` VARCHAR(255), IN `p_email_2` VARCHAR(255), IN `p_email_3` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_creado_por` BIGINT)   BEGIN
    INSERT INTO tbl_productor (
        id_ficha,
        id_productor,
        primer_nombre,
        segundo_nombre,
        primer_apellido,
        segundo_apellido,
        identificacion,
        fecha_nacimiento,
        genero,
        estado_civil,
        nivel_escolaridad,
        ultimo_grado_escolar_aprobado,
        telefono_1,
        telefono_2,
        telefono_3,
        email_1,
        email_2,
        email_3,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
    ) VALUES (
        p_id_ficha,
        p_id_productor,
        p_primer_nombre,
        p_segundo_nombre,
        p_primer_apellido,
        p_segundo_apellido,
        p_identificacion,
        p_fecha_nacimiento,
        p_genero,
        p_estado_civil,
        p_nivel_escolaridad,
        p_ultimo_grado_escolar_aprobado,
        p_telefono_1,
        p_telefono_2,
        p_telefono_3,
        p_email_1,
        p_email_2,
        p_email_3,
        p_descripcion,
        p_creado_por,
        CURRENT_TIMESTAMP(),
        NULL,
        CURRENT_TIMESTAMP(),
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarRegistro` (IN `p_id_ficha` BIGINT, IN `p_id_organizacion` BIGINT, IN `p_id_productor` BIGINT, IN `p_descripcion` VARCHAR(255), IN `p_creado_por` BIGINT)   BEGIN
    DECLARE v_valid_productor BOOLEAN;

    -- Verificar si el id_productor coincide con el id_ficha en la tabla fichas
    SELECT COUNT(*) INTO v_valid_productor
    FROM tbl_productor p
    JOIN fichas f ON p.id_ficha = f.id_ficha
    WHERE p.id_ficha = p_id_ficha AND p.id_productor = p_id_productor;

    -- Si el id_productor no coincide, lanzar un error o tomar medidas apropiadas
    IF v_valid_productor = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El id_productor no coincide con el id_ficha en la tabla fichas';
    ELSE
        -- Realizar la inserción si la validación es exitosa
        INSERT INTO tbl_organizaciones_por_productor (
            id_ficha,
            id_organizacion,
            id_productor,
            descripcion,
            creado_por,
            fecha_creacion,
            modificado_por,
            fecha_modificacion
        ) VALUES (
            p_id_ficha,
            p_id_organizacion,
            p_id_productor,
            p_descripcion,
            p_creado_por,
            CURRENT_TIMESTAMP(),
            NULL,
            CURRENT_TIMESTAMP()
        );
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarRelevoOrganizacion` (IN `p_id_ficha` BIGINT(20), IN `p_id_productor` BIGINT(20), IN `p_tendra_relevo` ENUM('S','N'), IN `p_cuantos_relevos` INT(20), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(20))   BEGIN
    DECLARE v_valid_productor BOOLEAN;

    -- Verificar si el id_productor coincide con el id_ficha en la tabla fichas
    SELECT COUNT(*) INTO v_valid_productor
    FROM tbl_productor p
    JOIN fichas f ON p.id_ficha = f.id_ficha
    WHERE p.id_ficha = p_id_ficha AND p.id_productor = p_id_productor;

    -- Si el id_productor no coincide, lanzar un error o tomar medidas apropiadas
    IF v_valid_productor = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El id_productor no coincide con el id_ficha en la tabla fichas';
    ELSE
        -- Realizar la inserción si la validación es exitosa
        INSERT INTO tbl_relevo_organizacion (
            id_ficha,
            id_productor,
            tendra_relevo,
            cuantos_relevos,
            descripcion,
            creado_por,
            fecha_creacion,
            modificado_por,
            fecha_modificacion
        ) VALUES (
            p_id_ficha,
            p_id_productor,
            p_tendra_relevo,
            p_cuantos_relevos,
            p_descripcion,
            p_creado_por,
            CURRENT_TIMESTAMP(),
            NULL,
            CURRENT_TIMESTAMP()
        );
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarRiego` (IN `tipo_riego_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_riego` (`tipo_riego`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_riego_param, descripcion_param, 'Manuel', 'Manuel', 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoApoyo` (IN `tipo_apoyos_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipos_apoyos` (`tipo_apoyos`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_apoyos_param, descripcion_param, 'Daniela', 'Daniela', 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoOrganizacion` (IN `tipo_organizacion_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_organizacion` (`tipo_organizacion`, `descripcion`, `creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_organizacion_param, descripcion_param, 'Kevin', 'Kevin', 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoTrabajador` (IN `tipo_trabajador_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_trabajadores` (`tipo_trabajador`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_trabajador_param, descripcion_param, 'Daniela', 'Daniela', 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipo_Negocio` (IN `tipo_negocio_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_negocios` (`tipo_negocio`, `descripcion`, `creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_negocio_param, descripcion_param, 'Kevin', 'Kevin', 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipo_Produccion` (IN `tipo_produccion_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_produccion` (`tipo_produccion`, `descripcion`, `creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_produccion_param, descripcion_param, 'Kevin', 'Kevin', '1');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTomaDecisones` (IN `tomador_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_toma_decisiones` (`tomador`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tomador_param, descripcion_param, 'Daniela', 'Daniela', 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUbicacionProductor` (IN `p_id_ficha` BIGINT, IN `p_id_productor` BIGINT, IN `p_id_ubicacion` BIGINT, IN `p_id_departamento` BIGINT, IN `p_id_municipio` BIGINT, IN `p_id_aldea` BIGINT, IN `p_id_caserio` BIGINT, IN `p_ubicacion_geografica` VARCHAR(255), IN `p_distancia_parcela_vivienda` DECIMAL(10,2), IN `p_latitud_parcela` VARCHAR(20), IN `p_longitud_parcela` VARCHAR(20), IN `p_msnm` DECIMAL(10,2), IN `p_direccion_1` VARCHAR(255), IN `p_direccion_2` VARCHAR(255), IN `p_direccion_3` VARCHAR(255), IN `p_vive_en_finca` CHAR(1), IN `p_nombre_finca` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(255))   BEGIN
    DECLARE v_valid_productor BOOLEAN;

    -- Verificar si el id_productor coincide con el id_ficha en la tabla tbl_productor
    SELECT COUNT(*) INTO v_valid_productor
    FROM tbl_productor
    WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;

    -- Si el id_productor no coincide, lanzar un error o tomar medidas apropiadas
    IF v_valid_productor = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El id_productor no coincide con el id_ficha en la tabla tbl_productor';
    ELSE
        -- Realizar la inserción si la validación es exitosa
        INSERT INTO tbl_ubicacion_productor (
            id_ficha,
            id_productor,
            id_ubicacion,
            id_departamento,
            id_municipio,
            id_aldea,
            id_caserio,
            ubicacion_geografica,
            distancia_parcela_vivienda,
            latitud_parcela,
            longitud_parcela,
            msnm,
            direccion_1,
            direccion_2,
            direccion_3,
            vive_en_finca,
            nombre_finca,
            descripcion,
            creado_por,
            fecha_creacion,
            modificado_por,
            fecha_modificacion,
            estado
        ) VALUES (
            p_id_ficha,
            p_id_productor,
            p_id_ubicacion,
            p_id_departamento,
            p_id_municipio,
            p_id_aldea,
            p_id_caserio,
            p_ubicacion_geografica,
            p_distancia_parcela_vivienda,
            p_latitud_parcela,
            p_longitud_parcela,
            p_msnm,
            p_direccion_1,
            p_direccion_2,
            p_direccion_3,
            p_vive_en_finca,
            p_nombre_finca,
            p_descripcion,
            p_creado_por,
            CURRENT_TIMESTAMP(),
            NULL,
            CURRENT_TIMESTAMP(),
            'A'
        );
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertObejtos` (IN `newObjeto` VARCHAR(255), IN `newDescripcion` VARCHAR(255), IN `newActualizado_Por` VARCHAR(255), IN `newCreado_Por` VARCHAR(255))   BEGIN
    DECLARE currentDate TIMESTAMP;
    SET currentDate = NOW();
 INSERT INTO objetos(Objeto, Descripcion, Actualizado_Por, Creado_Por, Fecha_Creacion,Fecha_Actualizacon, Status)
    VALUES (newObjeto , newDescripcion, newActualizado_Por, newCreado_Por, currentDate, currentDate,'Activo');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPermisos` (IN `newId_rol` BIGINT(20), IN `newId_objetos` BIGINT(20), IN `newpermiso_eliminacion` VARCHAR(10), IN `newpermiso_actualizacion` VARCHAR(10), IN `newpermiso_consulta` VARCHAR(10), IN `newpermiso_insercion` VARCHAR(10), IN `newCreado_Por` BIGINT(20), IN `newEstado` ENUM('ACTIVO','INACTIVO'))   BEGIN
    DECLARE currentDate TIMESTAMP;  
    
    SET currentDate = NOW();  
    
    INSERT INTO permisos (Id_rol, Id_objetos, permiso_eliminacion, permiso_actualizacion, permiso_consulta, permiso_insercion, Creado_Por, Fecha_Creacion, Fecha_Actualizacion, Estado)
    VALUES (newId_rol, newId_objetos, newpermiso_eliminacion, newpermiso_actualizacion, newpermiso_consulta, newpermiso_insercion, newCreado_Por, currentDate, currentDate, newEstado );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPreguntas` (IN `newPregunta` VARCHAR(255), IN `newActualizado_Por` VARCHAR(255), IN `newCreador_Por` VARCHAR(255))   BEGIN
    DECLARE currentDate TIMESTAMP;
    SET currentDate = NOW();
 INSERT INTO Preguntas (Pregunta, Actualizado_Por, Creador_Por, Fecha_Creacion, Fecha_Actualizacion)
    VALUES (newPregunta, newActualizado_Por, newCreador_Por, currentDate, currentDate);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRoles` (IN `newNombre` VARCHAR(255), IN `newDescripcion` VARCHAR(255))   BEGIN
    DECLARE currentDate TIMESTAMP;  -- Declarar la variable currentDate
    SET currentDate = NOW();  -- Obtener la fecha y hora actuales
    
    INSERT INTO roles (Nombre, Descripcion, Creado_Por, Fecha_Creacion, Actualizado_Por, Fecha_Actualizacion, STATUS)
    VALUES (newNombre, newDescripcion, 1, currentDate, 1, currentDate, 'Activo');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUsuario` (IN `newNombre` VARCHAR(255), IN `newCorreo` VARCHAR(255), IN `newUsuario` VARCHAR(255), IN `newContraseña` VARCHAR(255))   BEGIN
    DECLARE currentDate TIMESTAMP;
    DECLARE estado VARCHAR(255);
  

    INSERT INTO `usuario`(`Id_rol`, `Nombre`, `Correo`, `Usuario`, `Contraseña`, `Token`, `Fecha_Creacion`, `Actualizado_Por`, `Fecha_Actualizacion`, `Preguntas_Contestadas`, `Estado`, `Id_estado`, `Primera_Vez`, `Fecha_Vencimiento`, `Intentos_Preguntas`, `Preguntas_Correctas`, `Intentos_Fallidos`) 
    VALUES (2, `newNombre`, `newCorreo`, `newUsuario`, `newContraseña`, '', currentDate, '', currentDate, 1, 1, 1, 1, CURRENT_TIMESTAMP, NULL, NULL, NULL);
END$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePregunta` (IN `p_Id_pregunta` INT, IN `p_Pregunta` VARCHAR(255), IN `p_Actualizado_Por` VARCHAR(255))   BEGIN
    UPDATE Preguntas
    SET
        Pregunta = p_Pregunta,
        Actualizado_Por = p_Actualizado_Por
    WHERE Id_pregunta = p_Id_pregunta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateRole` (IN `newIdRol` BIGINT(20), IN `newNombre` VARCHAR(255), IN `newDescripcion` VARCHAR(255), IN `newStatus` VARCHAR(255))   BEGIN
    UPDATE roles
    SET Nombre = newNombre,
    	Descripcion = newDescripcion,
        STATUS = newStatus,
        Fecha_Actualizacion = CURRENT_TIMESTAMP
    WHERE Id_rol = newIdRol;
END$$

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

CREATE TABLE `bitacoras` (
  `Id_bitacoras` bigint(20) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Tabla` varchar(255) NOT NULL,
  `Accion` varchar(255) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Id_Usuario` bigint(20) NOT NULL,
  `Id_objetos` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_usuario`
--

CREATE TABLE `estado_usuario` (
  `id_estado` bigint(20) NOT NULL,
  `Estado` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
-- Estructura de tabla para la tabla `fichas`
--

CREATE TABLE `fichas` (
  `id_ficha` bigint(20) NOT NULL,
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
  `firma_supervisor` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `fichas`
--

INSERT INTO `fichas` (`id_ficha`, `fecha_solicitud`, `anio_solicitud`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`, `fecha_entrevista`, `nombre_encuentrador`, `firma_productor`, `nombre_encuestador`, `firma_encuestador`, `nombre_supervisor`, `firma_supervisor`) VALUES
(1, '2023-11-17', 2023, 'Prueba', 'manu', '2023-11-17 20:43:05', 'manu', '2023-11-21 08:25:47', 'I', '2023-11-17', NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2023-11-17', 2023, 'Prueba', 'manu', '2023-11-17 20:57:36', 'manu', '2023-11-17 20:57:36', 'A', '2023-11-17', NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2023-11-17', 2023, 'Creado', 'manu', '2023-11-20 06:00:21', 'manu', '2023-11-20 06:00:21', 'A', '2023-11-17', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hist_contrasena`
--

CREATE TABLE `hist_contrasena` (
  `Id_hist` bigint(20) NOT NULL,
  `Id_Usuario` bigint(20) NOT NULL,
  `contrasena` varchar(60) NOT NULL,
  `Creado_Por` varchar(50) NOT NULL,
  `Fecha_Creacion` datetime NOT NULL,
  `Actualizado_Por` varchar(50) DEFAULT NULL,
  `Fecha_Modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_permisos`
--

CREATE TABLE `model_permisos` (
  `Id_Permisos` bigint(20) NOT NULL,
  `Tipo_Modelo` varchar(255) NOT NULL,
  `Modelo_Id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_roles`
--

CREATE TABLE `model_roles` (
  `Rol_Id` bigint(20) NOT NULL,
  `Tipo_Modelo` varchar(255) NOT NULL,
  `Modelo_Id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetos`
--

CREATE TABLE `objetos` (
  `Id_objetos` bigint(20) NOT NULL,
  `Objeto` varchar(255) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `tipo_objeto` varchar(50) NOT NULL,
  `Creado_Por` bigint(20) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Actualizado_Por` bigint(20) NOT NULL,
  `Fecha_Actualizacon` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` enum('ACTIVO','INACTIVO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

CREATE TABLE `parametros` (
  `Id_parametros` bigint(20) NOT NULL,
  `Id_Usuario` bigint(20) NOT NULL,
  `Parametro` varchar(255) NOT NULL,
  `Valor` varchar(255) NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

CREATE TABLE `permisos` (
  `Id_Permisos` bigint(20) NOT NULL,
  `Id_rol` bigint(20) NOT NULL,
  `Id_objetos` bigint(20) NOT NULL,
  `permiso_eliminacion` varchar(10) NOT NULL,
  `permiso_actualizacion` varchar(10) NOT NULL,
  `permiso_consulta` varchar(10) NOT NULL,
  `permiso_insercion` varchar(10) NOT NULL,
  `Creado_Por` bigint(20) NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Actualizado_Por` bigint(20) NOT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL,
  `Estado` enum('ACTIVO','INACTIVO','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

CREATE TABLE `preguntas` (
  `Id_pregunta` bigint(20) NOT NULL,
  `Pregunta` varchar(255) NOT NULL,
  `Creador_Por` bigint(20) NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Actualizado_Por` bigint(20) NOT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

CREATE TABLE `preguntas_usuario` (
  `Id_Pregunta_U` bigint(20) NOT NULL,
  `Id_pregunta` bigint(20) NOT NULL,
  `Id_Usuario` bigint(20) DEFAULT NULL,
  `Respuestas` varchar(100) NOT NULL,
  `Creado_Por` varchar(80) DEFAULT NULL,
  `Fecha_Creacion` datetime DEFAULT NULL,
  `Modificado_Por` varchar(80) DEFAULT NULL,
  `Fecha_Modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

CREATE TABLE `recuperar_clave` (
  `Correo` varchar(255) NOT NULL,
  `Token` varchar(255) NOT NULL,
  `Fecha_Creacion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `Id_pregunta` bigint(20) NOT NULL,
  `Id_Usuario` bigint(20) NOT NULL,
  `Respuesta` varchar(255) NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL,
  `Id_respuesta` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `Id_rol` bigint(20) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Creado_Por` bigint(20) NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Actualizado_Por` bigint(20) NOT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL,
  `STATUS` enum('ACTIVO','INACTIVO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

CREATE TABLE `sesion` (
  `Id_Sesion` varchar(255) NOT NULL,
  `Usuario_Id` bigint(20) DEFAULT NULL,
  `Direccion_Ip` varchar(45) DEFAULT NULL,
  `Usuario_Agente` text DEFAULT NULL,
  `Payload` text NOT NULL,
  `Ultima_Actividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_aldeas`
--

CREATE TABLE `tbl_aldeas` (
  `Id_Aldea` bigint(20) NOT NULL,
  `Id_Municipio` bigint(20) NOT NULL,
  `Nombre_Aldea` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estado` enum('A','I') DEFAULT NULL,
  `Id_Usuario` bigint(20) DEFAULT NULL,
  `Creado_Por` varchar(50) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(50) NOT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_aldeas`
--

INSERT INTO `tbl_aldeas` (`Id_Aldea`, `Id_Municipio`, `Nombre_Aldea`, `Descripcion`, `Estado`, `Id_Usuario`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`) VALUES
(1, 1, 'Agua Blanca', 'Aldea de talanga', 'A', 1, '1', '2023-11-05 04:52:40', '1', '2023-11-05 04:52:40'),
(2, 2, 'la capa', 'aldea de yoro', 'A', 1, '1', '2023-11-05 05:20:52', '1', '2023-11-05 05:20:52'),
(3, 4, 'sss', 'sss', 'I', 1, '1', '2023-11-05 06:47:24', 'manu', '2023-11-15 05:08:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_apoyos`
--

CREATE TABLE `tbl_apoyos` (
  `id_apoyo_produccion` bigint(20) NOT NULL,
  `tipo_apoyo_produccion` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_apoyos`
--

INSERT INTO `tbl_apoyos` (`id_apoyo_produccion`, `tipo_apoyo_produccion`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Bono Productor', 'Segun indicaciones fueron 3 manzanas haha', NULL, '2023-11-04 14:07:20', NULL, '2023-11-04 14:07:20', 'ACTIVO'),
(2, 'SalarioA', 'Un sueldo base1', 'Daniela', '2023-11-05 08:59:34', 'Daniela', '2023-11-05 08:59:34', 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_apoyos_produccion`
--

CREATE TABLE `tbl_apoyos_produccion` (
  `id_apoyo_prod` bigint(20) NOT NULL,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_apoyo_produccion` bigint(20) NOT NULL,
  `otros_detalles` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_apoyo_actividad_externa`
--

CREATE TABLE `tbl_apoyo_actividad_externa` (
  `id_apoyo_ext` bigint(20) NOT NULL,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `recibe_apoyo_prodagrícola` enum('S','N') DEFAULT NULL,
  `atencion_por_UAG` enum('S','N') DEFAULT NULL,
  `productos_vendidospor_pralesc` enum('S','N') DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_base_organizacion_por_productor`
--

CREATE TABLE `tbl_base_organizacion_por_productor` (
  `Id_base_organizacion` bigint(20) NOT NULL,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `ha_solicitado_creditos` enum('S','N') DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(20) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(20) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cacerios`
--

CREATE TABLE `tbl_cacerios` (
  `Id_Cacerio` bigint(20) NOT NULL,
  `Id_Aldea` bigint(20) NOT NULL,
  `Nombre_Cacerio` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estado` enum('A','I') DEFAULT NULL,
  `Id_Usuario` bigint(20) DEFAULT NULL,
  `Creado_Por` bigint(20) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` bigint(20) NOT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
-- Estructura de tabla para la tabla `tbl_composicion`
--

CREATE TABLE `tbl_composicion` (
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_composicion` bigint(20) NOT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `genero` enum('H','M') DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(25) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(25) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_composicion`
--

INSERT INTO `tbl_composicion` (`id_ficha`, `id_composicion`, `id_productor`, `genero`, `edad`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 0, 1, 'H', 50, 'gqad', 'manu', '2023-11-20 10:08:52', NULL, '2023-11-20 10:08:52', 'A'),
(1, 1, 1, 'H', 28, 'desct', 'manu', '2023-11-20 09:28:22', 'manu', '2023-11-20 09:28:22', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_credito_produccion`
--

CREATE TABLE `tbl_credito_produccion` (
  `id_credpro` bigint(20) NOT NULL,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `ha_solicitado_creditos` enum('S','N') DEFAULT NULL,
  `id_fuente_credito` bigint(20) DEFAULT NULL,
  `monto_credito` decimal(10,2) DEFAULT NULL,
  `id_motivos_no_credito` bigint(20) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_departamentos`
--

CREATE TABLE `tbl_departamentos` (
  `Id_Departamento` bigint(20) NOT NULL,
  `Id_Usuario` bigint(20) DEFAULT NULL,
  `Nombre_Departamento` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Creado_Por` bigint(20) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` bigint(20) NOT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_departamentos`
--

INSERT INTO `tbl_departamentos` (`Id_Departamento`, `Id_Usuario`, `Nombre_Departamento`, `Descripcion`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `Estado`) VALUES
(1, 1, 'Francisco Morazan', 'Central', 1, '2023-11-05 04:15:22', 1, '2023-11-05 04:15:22', 'A'),
(2, 1, 'Olancho', 'saasas', 1, '2023-11-05 04:41:44', 1, '2023-11-15 05:02:39', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_etnias`
--

CREATE TABLE `tbl_etnias` (
  `id_etnia` bigint(11) NOT NULL,
  `etnia` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
-- Estructura de tabla para la tabla `tbl_etnias_por_productor`
--

CREATE TABLE `tbl_etnias_por_productor` (
  `Id_etnicidad` int(11) NOT NULL,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_etnia` bigint(20) NOT NULL,
  `detalle_de_otros` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_etnias_por_productor`
--

INSERT INTO `tbl_etnias_por_productor` (`Id_etnicidad`, `id_ficha`, `id_productor`, `id_etnia`, `detalle_de_otros`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 1, 8, 'Prueba de Detalle1', 'Agregar Descripcion', 'manu', '2023-11-13 06:01:50', 'manu', '2023-11-20 02:41:03', 'I'),
(2, 2, 2, 7, 'Prueba de Detalleas', 'desc', 'manu', '2023-11-20 02:48:45', NULL, '2023-11-20 02:48:45', 'A'),
(3, 1, 1, 11, 'Prueba de Detalleas', 'sisterna', 'manu', '2023-11-20 02:49:31', NULL, '2023-11-20 02:49:31', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_fuentes_credito`
--

CREATE TABLE `tbl_fuentes_credito` (
  `id_fuente_credito` bigint(20) NOT NULL,
  `fuente_credito` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

CREATE TABLE `tbl_medidas_tierra` (
  `id_medida` int(11) NOT NULL,
  `medida` enum('MZ','HA','TAREAS','') DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_medidas_tierra`
--

INSERT INTO `tbl_medidas_tierra` (`id_medida`, `medida`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'TAREAS', 'Son 5 tareas', NULL, '2023-11-04 14:08:58', NULL, '2023-11-04 14:08:58', 'ACTIVO'),
(2, 'HA', 'Se compraron 2', 'Daniela', '2023-11-05 08:59:02', 'Daniela', '2023-11-05 08:59:02', 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_migracion_familiar`
--

CREATE TABLE `tbl_migracion_familiar` (
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_migracion` bigint(20) NOT NULL,
  `tiene_migrantes` enum('S','N') DEFAULT NULL,
  `migracion_dentro_pais` enum('S','N') DEFAULT NULL,
  `migracion_fuera_pais` enum('S','N') DEFAULT NULL,
  `id_tipo_motivos` bigint(20) NOT NULL,
  `remesas` enum('S','N') DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` bigint(20) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` bigint(20) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_motivos_migracion`
--

CREATE TABLE `tbl_motivos_migracion` (
  `Id_motivo` bigint(20) NOT NULL,
  `Motivo` varchar(255) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Creado_por` varchar(255) DEFAULT NULL,
  `Fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_por` varchar(255) DEFAULT NULL,
  `Fecha_Actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_motivos_migracion`
--

INSERT INTO `tbl_motivos_migracion` (`Id_motivo`, `Motivo`, `Descripcion`, `Creado_por`, `Fecha_creacion`, `Modificado_por`, `Fecha_Actualizacion`, `Estado`) VALUES
(1, 'Trabajo', 'No encontre empleo', 'Manuel', '2023-10-31 03:56:32', 'Manuel', '2023-10-31 03:56:32', ''),
(2, 'JUBILACION', 'RESIDENCIA', NULL, '2023-10-31 04:58:55', NULL, '2023-10-31 04:58:55', ''),
(3, 'JUBILACION', 'Vive alla', 'Manuel', '2023-10-31 05:07:18', 'Manuel', '2023-11-04 05:20:37', ''),
(4, 'JUBILACION', 'por ', 'Manuel', '2023-10-31 05:15:26', 'Manuel', '2023-10-31 05:33:43', ''),
(5, 'DXFCVGBH', 'FVGJHBKJNK', 'Manuel', '2023-10-31 05:34:00', 'Manuel', '2023-10-31 05:34:00', ''),
(6, 'FD', 'eyey', 'Manuel', '2023-10-31 05:39:54', 'Manuel', '2023-10-31 07:08:35', ''),
(7, 'JUBILACION SI', 'asdgrrfqeafqe', 'Manuel', '2023-10-31 07:02:30', 'Manuel', '2023-10-31 07:08:24', ''),
(8, 'edi', 'E3QERRR3E', 'Manuel', '2023-10-31 07:55:37', 'Manuel', '2023-11-01 04:39:36', ''),
(9, 's', 'asd', 'Manuel', '2023-11-01 05:51:35', 'Manuel', '2023-11-01 05:52:31', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_motivos_nocredito`
--

CREATE TABLE `tbl_motivos_nocredito` (
  `id_motivos_no_credito` bigint(20) NOT NULL,
  `motivo_no_credito` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(100) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(100) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('S','N') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_municipios`
--

CREATE TABLE `tbl_municipios` (
  `Id_Municipio` bigint(20) NOT NULL,
  `Id_Departamento` bigint(20) NOT NULL,
  `Id_Usuario` bigint(20) DEFAULT NULL,
  `Nombre_Municipio` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Creado_Por` bigint(20) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` bigint(20) NOT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
-- Estructura de tabla para la tabla `tbl_no_creditos`
--

CREATE TABLE `tbl_no_creditos` (
  `id_nocred` bigint(20) NOT NULL,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_motivos_no_credito` bigint(20) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_organizaciones`
--

CREATE TABLE `tbl_organizaciones` (
  `id_organizacion` bigint(20) NOT NULL,
  `organizacion` varchar(255) DEFAULT NULL,
  `id_tipo_organizacion` bigint(20) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_organizaciones`
--

INSERT INTO `tbl_organizaciones` (`id_organizacion`, `organizacion`, `id_tipo_organizacion`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Cooperativa Elga', 2, 'Cooperativa de ahorro', 'manu', '2023-11-16 06:22:34', 'manu', '2023-11-16 06:26:08', 'A'),
(2, 'Cooperativa Sagrada Familia', 2, 'Prueba', 'manu', '2023-11-17 20:47:02', 'manu', '2023-11-17 20:47:02', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_organizaciones_por_productor`
--

CREATE TABLE `tbl_organizaciones_por_productor` (
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_organizacion` bigint(20) NOT NULL,
  `Id_Organizacion_Productor` bigint(20) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_organizaciones_por_productor`
--

INSERT INTO `tbl_organizaciones_por_productor` (`id_ficha`, `id_productor`, `id_organizacion`, `Id_Organizacion_Productor`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 2, 4, 'desc', 'manu', '2023-11-17 20:51:46', 'manu', '2023-11-18 05:43:18', 'I'),
(1, 1, 2, 5, 'desc', 'manu', '2023-11-17 20:51:52', 'manu', '2023-11-19 04:53:48', 'I'),
(2, 2, 2, 9, 'SI', 'manu', '2023-11-17 21:08:34', 'manu', '2023-11-19 04:53:53', 'A'),
(1, 1, 2, 12, 'TierrasSana', '0', '2023-11-19 04:33:58', 'manu', '2023-11-19 04:55:11', 'I'),
(2, 2, 2, 13, 'edi', '0', '2023-11-19 04:35:37', 'manu', '2023-11-20 02:51:15', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_periodicidad`
--

CREATE TABLE `tbl_periodicidad` (
  `id_periodo` int(11) NOT NULL,
  `periodo` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_periodicidad`
--

INSERT INTO `tbl_periodicidad` (`id_periodo`, `periodo`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'marzo', 'descr', 'Manuel', '2023-10-31 19:41:24', 'Manuel', '2023-10-31 19:41:24', ''),
(2, 'se', 'se', NULL, '2023-10-31 21:03:54', NULL, '2023-10-31 21:03:54', ''),
(3, 'e', 'e', NULL, '2023-10-31 21:17:57', NULL, '2023-10-31 21:33:04', ''),
(4, 'adsda', 'dfa', NULL, '2023-10-31 21:36:39', NULL, '2023-11-01 04:46:23', 'ACTIVO'),
(9, 'rwewe', 'gdgd', 'Manuel', '2023-11-01 04:45:38', 'Manuel', '2023-11-01 06:07:37', 'ACTIVO'),
(10, '', '', 'Manuel', '2023-11-07 04:42:54', 'Manuel', '2023-11-07 04:42:54', 'ACTIVO'),
(11, '', '', 'Manuel', '2023-11-13 04:28:49', 'Manuel', '2023-11-13 04:28:49', 'ACTIVO'),
(12, '', '', 'Manuel', '2023-11-16 04:35:41', 'Manuel', '2023-11-16 04:35:41', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productor`
--

CREATE TABLE `tbl_productor` (
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) NOT NULL,
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
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_productor`
--

INSERT INTO `tbl_productor` (`id_ficha`, `id_productor`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `identificacion`, `fecha_nacimiento`, `genero`, `estado_civil`, `nivel_escolaridad`, `ultimo_grado_escolar_aprobado`, `telefono_1`, `telefono_2`, `telefono_3`, `email_1`, `email_2`, `email_3`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 'Manuel', 'Jesus', 'Figueroa', 'Barahona', 801200205125, '2001-08-28', 'M', 'Soltero', 'Universitario', 'Bachillerato', 31373917, NULL, NULL, 'manuel_figueroa@gmail.com', NULL, NULL, 'Creado por Manuel', '1', '2023-11-13 03:26:44', '1', '2023-11-13 03:26:44', 'A'),
(2, 2, 'Kevin', 'ale', 'vaca', 'vaca', 801200205125, '2023-11-17', 'M', 'Soltero', 'Universitario', 'Bachillerato', 31373917, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-17 20:59:25', NULL, '2023-11-17 20:59:25', 'A'),
(3, 3, 'manuel', 'jesus', 'figueroaas', 'barahona', 801200205125, '2023-11-20', 'Masculino', 'Casado(a)', 'universitario', 'universitario', 31673917, 31673917, 31673917, 'manuelfigueroa2818@gmail.com', 'manuelfigueroa2818@gmail.com', 'manu@unah.hn', 'prueba', '0', '2023-11-20 06:54:47', '0', '2023-11-20 06:54:47', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productor_actividad_externa`
--

CREATE TABLE `tbl_productor_actividad_externa` (
  `id_actividad_ext` bigint(20) NOT NULL,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `miembros_realizan_actividades_fuera_finca` enum('S','N') DEFAULT NULL,
  `id_tomador_decisiones` bigint(20) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_relevo_organizacion`
--

CREATE TABLE `tbl_relevo_organizacion` (
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `Id_Relevo` bigint(20) NOT NULL,
  `tendra_relevo` enum('S','N') DEFAULT NULL,
  `cuantos_relevos` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_relevo_organizacion`
--

INSERT INTO `tbl_relevo_organizacion` (`id_ficha`, `id_productor`, `Id_Relevo`, `tendra_relevo`, `cuantos_relevos`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 1, 'S', 2, 'Relevo por la vida', 'manu', '2023-11-19 05:15:18', 'manu', '2023-11-19 05:15:18', 'A'),
(2, 2, 14, 'S', 71, 'TierrasSana1', 'manu', '2023-11-19 22:37:46', 'manu', '2023-11-19 22:45:03', 'I'),
(1, 1, 15, 'N', 565, 'yh', 'manu', '2023-11-19 22:39:31', 'manu', '2023-11-19 22:51:06', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipos_apoyos`
--

CREATE TABLE `tbl_tipos_apoyos` (
  `id_tipo_apoyos` bigint(11) NOT NULL,
  `tipo_apoyos` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipos_apoyos`
--

INSERT INTO `tbl_tipos_apoyos` (`id_tipo_apoyos`, `tipo_apoyos`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Bono', 'Bono ganadero', 'Daniela', '2023-11-04 13:29:36', 'Daniela', '2023-11-04 13:29:36', 'ACTIVO'),
(2, 'Bono A', 'Bono Agricultor 1', 'Daniela', '2023-11-05 08:59:41', 'Daniela', '2023-11-05 08:59:41', 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipos_apoyo_produccion`
--

CREATE TABLE `tbl_tipos_apoyo_produccion` (
  `id_apoyo_produccion` bigint(20) NOT NULL,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_tipos_apoyos` bigint(20) NOT NULL,
  `otros_detalles` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_cultivo`
--

CREATE TABLE `tbl_tipo_cultivo` (
  `id_tipo_cultivo` int(11) NOT NULL,
  `tipo_cultivo` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

CREATE TABLE `tbl_tipo_negocios` (
  `id_tipo_negocio` int(11) NOT NULL,
  `tipo_negocio` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipo_negocios`
--

INSERT INTO `tbl_tipo_negocios` (`id_tipo_negocio`, `tipo_negocio`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Granja', 'venta de huevos', '1', '2023-12-01 04:29:34', '1', '2023-11-04 04:29:34', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_organizacion`
--

CREATE TABLE `tbl_tipo_organizacion` (
  `id_tipo_organizacion` bigint(20) NOT NULL,
  `tipo_organizacion` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipo_organizacion`
--

INSERT INTO `tbl_tipo_organizacion` (`id_tipo_organizacion`, `tipo_organizacion`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'BENEFICA', 'Grupo Solidario ', '1', '2023-11-16 06:22:08', '1', '2023-11-16 06:22:08', 'A'),
(2, 'Cooperativa', 'cooperativas', 'manu', '2023-11-16 06:22:15', 'manu', '2023-11-16 06:22:15', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_practicas_productivas`
--

CREATE TABLE `tbl_tipo_practicas_productivas` (
  `id_tipo_practica` int(11) NOT NULL,
  `tipo_practica` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipo_practicas_productivas`
--

INSERT INTO `tbl_tipo_practicas_productivas` (`id_tipo_practica`, `tipo_practica`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Siembra', 'Maiz', '1', '2023-11-04 06:27:46', '1', '2023-11-04 06:27:46', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_produccion`
--

CREATE TABLE `tbl_tipo_produccion` (
  `id_tipo_produccion` int(11) NOT NULL,
  `tipo_produccion` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

CREATE TABLE `tbl_tipo_riego` (
  `id_tipo_riego` int(11) NOT NULL,
  `tipo_riego` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipo_riego`
--

INSERT INTO `tbl_tipo_riego` (`id_tipo_riego`, `tipo_riego`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Pozo', 'Pozo', 'Manuel', '2023-11-02 05:23:18', 'Manuel', '2023-11-02 05:23:18', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_trabajadores`
--

CREATE TABLE `tbl_tipo_trabajadores` (
  `id_tipo_trabajador` bigint(20) NOT NULL,
  `tipo_trabajador` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

CREATE TABLE `tbl_toma_decisiones` (
  `id_tipo_tomador` bigint(20) NOT NULL,
  `tomador` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_toma_decisiones`
--

INSERT INTO `tbl_toma_decisiones` (`id_tipo_tomador`, `tomador`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'SAG', 'Se decidio por voto', 'Daniela', '2023-11-04 13:40:26', 'Daniela', '2023-11-04 13:40:26', ''),
(2, 'SAG 1', 'Creacion de base 1', 'Daniela', '2023-11-04 22:44:19', 'Daniela', '2023-11-04 22:44:19', ''),
(3, 'UPEG1', 'Pagos1', 'Daniela', '2023-11-05 08:58:41', 'Daniela', '2023-11-05 08:58:41', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_trabajadores_externos`
--

CREATE TABLE `tbl_trabajadores_externos` (
  `id_trabajador_ext` bigint(20) NOT NULL,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_tipo_trabajador` bigint(20) DEFAULT NULL,
  `cantidad_trabajador` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_trabajadores_externos`
--

INSERT INTO `tbl_trabajadores_externos` (`id_trabajador_ext`, `id_ficha`, `id_productor`, `id_tipo_trabajador`, `cantidad_trabajador`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 1, 1, 12, 'saas', 'manu', '2023-11-21 08:26:07', 'manu', '2023-11-21 08:26:07', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ubicacion_productor`
--

CREATE TABLE `tbl_ubicacion_productor` (
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_ubicacion` bigint(20) NOT NULL,
  `id_departamento` bigint(20) DEFAULT NULL,
  `id_municipio` bigint(20) DEFAULT NULL,
  `id_aldea` bigint(20) DEFAULT NULL,
  `id_caserio` bigint(20) DEFAULT NULL,
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
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_ubicacion_productor`
--

INSERT INTO `tbl_ubicacion_productor` (`id_ficha`, `id_productor`, `id_ubicacion`, `id_departamento`, `id_municipio`, `id_aldea`, `id_caserio`, `ubicacion_geografica`, `distancia_parcela_vivienda`, `latitud_parcela`, `longitud_parcela`, `msnm`, `direccion_1`, `direccion_2`, `direccion_3`, `vive_en_finca`, `nombre_finca`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 1, 1, 4, 1, 1, 'Prueba ', 100.00, '11', '12', 13.00, 'Col. Arturo Quezada', 'Col. Arturo Quezada1', 'Col. Arturo Quezada2', 'S', 'Resi Quezada', 'Prueba', 'manu', '2023-11-13 03:29:27', 'manu', '2023-11-20 08:38:11', 'A'),
(1, 1, 2, 1, 1, 1, 1, 'Prueba', NULL, NULL, NULL, NULL, 'Col.Quezada', NULL, NULL, 'S', 'Resi Quezada', 'Prueba', '1', '2023-11-13 03:31:13', '1', '2023-11-20 07:46:21', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_Usuario` bigint(20) NOT NULL,
  `Id_rol` bigint(20) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Correo` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `Token` varchar(100) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Actualizado_Por` bigint(20) NOT NULL,
  `Fecha_Actualizacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Preguntas_Contestadas` int(11) NOT NULL,
  `Estado` int(11) NOT NULL,
  `Id_estado` bigint(20) NOT NULL,
  `Primera_Vez` tinyint(1) NOT NULL,
  `Fecha_Vencimiento` date NOT NULL,
  `Intentos_Preguntas` int(3) DEFAULT NULL,
  `Preguntas_Correctas` int(3) DEFAULT NULL,
  `Intentos_Fallidos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id_Usuario`, `Id_rol`, `Nombre`, `Correo`, `usuario`, `Contraseña`, `Token`, `Fecha_Creacion`, `Actualizado_Por`, `Fecha_Actualizacion`, `Preguntas_Contestadas`, `Estado`, `Id_estado`, `Primera_Vez`, `Fecha_Vencimiento`, `Intentos_Preguntas`, `Preguntas_Correctas`, `Intentos_Fallidos`) VALUES
(1, 1, 'manuel', 'manuel@gmail.com', 'manu', '123', '1', '2023-10-29 01:48:15', 1, '2023-10-30 01:48:15', 1, 1, 1, 1, '2023-10-31', NULL, NULL, 0),
(2, 18, 'AS', 'AS', 'ASZ', '111', NULL, '2023-10-25 08:04:11', 1, '2023-10-31 08:04:11', 1, 1, 1, 1, '2023-10-31', NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `fichas`
--
ALTER TABLE `fichas`
  ADD PRIMARY KEY (`id_ficha`);

--
-- Indices de la tabla `objetos`
--
ALTER TABLE `objetos`
  ADD PRIMARY KEY (`Id_objetos`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`Id_parametros`),
  ADD KEY `Parametro_Usuario_id` (`Id_Usuario`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`Id_Permisos`),
  ADD KEY `Permisos_Objeto` (`Id_objetos`),
  ADD KEY `Permisos_Rol` (`Id_rol`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`Id_pregunta`);

--
-- Indices de la tabla `preguntas_usuario`
--
ALTER TABLE `preguntas_usuario`
  ADD PRIMARY KEY (`Id_Pregunta_U`),
  ADD KEY `Preguntas_idx` (`Id_pregunta`),
  ADD KEY `Preguntas_Usuario_idx` (`Id_Usuario`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id_rol`);

--
-- Indices de la tabla `tbl_aldeas`
--
ALTER TABLE `tbl_aldeas`
  ADD PRIMARY KEY (`Id_Aldea`),
  ADD KEY `FK_Aldea_Usuario` (`Id_Usuario`),
  ADD KEY `FK_Aldea_Municipio` (`Id_Municipio`);

--
-- Indices de la tabla `tbl_apoyos`
--
ALTER TABLE `tbl_apoyos`
  ADD PRIMARY KEY (`id_apoyo_produccion`);

--
-- Indices de la tabla `tbl_apoyos_produccion`
--
ALTER TABLE `tbl_apoyos_produccion`
  ADD PRIMARY KEY (`id_apoyo_prod`),
  ADD KEY `fk_id_ficha_apoyos_produccion` (`id_ficha`),
  ADD KEY `fk_id_productor_apoyos_produccion` (`id_productor`),
  ADD KEY `fk_id_apoyo_produccion` (`id_apoyo_produccion`);

--
-- Indices de la tabla `tbl_apoyo_actividad_externa`
--
ALTER TABLE `tbl_apoyo_actividad_externa`
  ADD PRIMARY KEY (`id_apoyo_ext`),
  ADD KEY `fk_id_ficha_apoyo_actividad_extern` (`id_ficha`),
  ADD KEY `fk_id_productor_apoyo_actividad_extern` (`id_productor`);

--
-- Indices de la tabla `tbl_base_organizacion_por_productor`
--
ALTER TABLE `tbl_base_organizacion_por_productor`
  ADD PRIMARY KEY (`Id_base_organizacion`),
  ADD KEY `fk_base_organizacion_ficha` (`id_ficha`),
  ADD KEY `fk_base_organizacion_productor` (`id_productor`);

--
-- Indices de la tabla `tbl_cacerios`
--
ALTER TABLE `tbl_cacerios`
  ADD PRIMARY KEY (`Id_Cacerio`),
  ADD KEY `FK_Cacerio_Usuario` (`Id_Usuario`),
  ADD KEY `FK_Caserio_Aldea` (`Id_Aldea`);

--
-- Indices de la tabla `tbl_composicion`
--
ALTER TABLE `tbl_composicion`
  ADD PRIMARY KEY (`id_composicion`),
  ADD KEY `fk_id_ficha_composicion` (`id_ficha`),
  ADD KEY `fk_id_producto_composicionr` (`id_productor`);

--
-- Indices de la tabla `tbl_credito_produccion`
--
ALTER TABLE `tbl_credito_produccion`
  ADD PRIMARY KEY (`id_credpro`),
  ADD KEY `fk_id_motivos_no_credito` (`id_motivos_no_credito`),
  ADD KEY `fk_id_fuente_credito` (`id_fuente_credito`),
  ADD KEY `fk_id_ficha_credito_produccion` (`id_ficha`),
  ADD KEY `fk_id_productor_credito_produccion` (`id_productor`);

--
-- Indices de la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  ADD PRIMARY KEY (`Id_Departamento`),
  ADD KEY `FK_Departamento_Usuario` (`Id_Usuario`);

--
-- Indices de la tabla `tbl_etnias`
--
ALTER TABLE `tbl_etnias`
  ADD PRIMARY KEY (`id_etnia`);

--
-- Indices de la tabla `tbl_etnias_por_productor`
--
ALTER TABLE `tbl_etnias_por_productor`
  ADD PRIMARY KEY (`Id_etnicidad`),
  ADD KEY `id_productor` (`id_productor`),
  ADD KEY `id_etnia` (`id_etnia`),
  ADD KEY `fk_etnias_fichas` (`id_ficha`);

--
-- Indices de la tabla `tbl_fuentes_credito`
--
ALTER TABLE `tbl_fuentes_credito`
  ADD PRIMARY KEY (`id_fuente_credito`);

--
-- Indices de la tabla `tbl_medidas_tierra`
--
ALTER TABLE `tbl_medidas_tierra`
  ADD PRIMARY KEY (`id_medida`);

--
-- Indices de la tabla `tbl_migracion_familiar`
--
ALTER TABLE `tbl_migracion_familiar`
  ADD PRIMARY KEY (`id_migracion`),
  ADD KEY `fk_id_ficha_migracion_familiar` (`id_ficha`),
  ADD KEY `fk_id_productor_migracion_familiar` (`id_productor`),
  ADD KEY `fk_id_tipo_motivos` (`id_tipo_motivos`);

--
-- Indices de la tabla `tbl_motivos_migracion`
--
ALTER TABLE `tbl_motivos_migracion`
  ADD PRIMARY KEY (`Id_motivo`);

--
-- Indices de la tabla `tbl_motivos_nocredito`
--
ALTER TABLE `tbl_motivos_nocredito`
  ADD PRIMARY KEY (`id_motivos_no_credito`);

--
-- Indices de la tabla `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  ADD PRIMARY KEY (`Id_Municipio`),
  ADD KEY `FK_Municipio_Usuario` (`Id_Usuario`),
  ADD KEY `FK_Municipio_Departamento` (`Id_Departamento`);

--
-- Indices de la tabla `tbl_no_creditos`
--
ALTER TABLE `tbl_no_creditos`
  ADD PRIMARY KEY (`id_nocred`),
  ADD KEY `fk_id_fichal_no_creditos` (`id_ficha`),
  ADD KEY `fk_id_productorl_no_creditos` (`id_productor`),
  ADD KEY `fk_id_motivos` (`id_motivos_no_credito`);

--
-- Indices de la tabla `tbl_organizaciones`
--
ALTER TABLE `tbl_organizaciones`
  ADD PRIMARY KEY (`id_organizacion`),
  ADD KEY `fk_tipo_organizacion` (`id_tipo_organizacion`);

--
-- Indices de la tabla `tbl_organizaciones_por_productor`
--
ALTER TABLE `tbl_organizaciones_por_productor`
  ADD PRIMARY KEY (`Id_Organizacion_Productor`),
  ADD KEY `fk_organizacion_por_productor` (`id_organizacion`),
  ADD KEY `fk_id_productor` (`id_productor`),
  ADD KEY `id_ficha` (`id_ficha`);

--
-- Indices de la tabla `tbl_periodicidad`
--
ALTER TABLE `tbl_periodicidad`
  ADD PRIMARY KEY (`id_periodo`);

--
-- Indices de la tabla `tbl_productor`
--
ALTER TABLE `tbl_productor`
  ADD PRIMARY KEY (`id_productor`),
  ADD KEY `id_ficha` (`id_ficha`);

--
-- Indices de la tabla `tbl_productor_actividad_externa`
--
ALTER TABLE `tbl_productor_actividad_externa`
  ADD PRIMARY KEY (`id_actividad_ext`),
  ADD KEY `fk_id_ficha_actividad_externa` (`id_ficha`),
  ADD KEY `fk_id_productor_actividad_externa` (`id_productor`),
  ADD KEY `fk_id_tomador_decisiones_actividad_externa` (`id_tomador_decisiones`);

--
-- Indices de la tabla `tbl_relevo_organizacion`
--
ALTER TABLE `tbl_relevo_organizacion`
  ADD PRIMARY KEY (`Id_Relevo`),
  ADD KEY `fk_id_ficha` (`id_ficha`),
  ADD KEY `fk_id_productor_relevo` (`id_productor`);

--
-- Indices de la tabla `tbl_tipos_apoyos`
--
ALTER TABLE `tbl_tipos_apoyos`
  ADD PRIMARY KEY (`id_tipo_apoyos`);

--
-- Indices de la tabla `tbl_tipos_apoyo_produccion`
--
ALTER TABLE `tbl_tipos_apoyo_produccion`
  ADD PRIMARY KEY (`id_apoyo_produccion`) USING BTREE,
  ADD KEY `fk_id_ficha_apoyo_produccion` (`id_ficha`),
  ADD KEY `fk_id_productor_apoyo_produccion` (`id_productor`),
  ADD KEY `fk_id_tipos_apoyos_apoyo_produccion` (`id_tipos_apoyos`);

--
-- Indices de la tabla `tbl_tipo_cultivo`
--
ALTER TABLE `tbl_tipo_cultivo`
  ADD PRIMARY KEY (`id_tipo_cultivo`);

--
-- Indices de la tabla `tbl_tipo_negocios`
--
ALTER TABLE `tbl_tipo_negocios`
  ADD PRIMARY KEY (`id_tipo_negocio`);

--
-- Indices de la tabla `tbl_tipo_organizacion`
--
ALTER TABLE `tbl_tipo_organizacion`
  ADD PRIMARY KEY (`id_tipo_organizacion`);

--
-- Indices de la tabla `tbl_tipo_practicas_productivas`
--
ALTER TABLE `tbl_tipo_practicas_productivas`
  ADD PRIMARY KEY (`id_tipo_practica`);

--
-- Indices de la tabla `tbl_tipo_produccion`
--
ALTER TABLE `tbl_tipo_produccion`
  ADD PRIMARY KEY (`id_tipo_produccion`);

--
-- Indices de la tabla `tbl_tipo_riego`
--
ALTER TABLE `tbl_tipo_riego`
  ADD PRIMARY KEY (`id_tipo_riego`);

--
-- Indices de la tabla `tbl_tipo_trabajadores`
--
ALTER TABLE `tbl_tipo_trabajadores`
  ADD PRIMARY KEY (`id_tipo_trabajador`);

--
-- Indices de la tabla `tbl_toma_decisiones`
--
ALTER TABLE `tbl_toma_decisiones`
  ADD PRIMARY KEY (`id_tipo_tomador`);

--
-- Indices de la tabla `tbl_trabajadores_externos`
--
ALTER TABLE `tbl_trabajadores_externos`
  ADD PRIMARY KEY (`id_trabajador_ext`),
  ADD KEY `fk_id_ficha_trabajadores_externos` (`id_ficha`),
  ADD KEY `fk_id_productor_trabajadores_externos` (`id_productor`),
  ADD KEY `fk_id_tipo_trabajador` (`id_tipo_trabajador`);

--
-- Indices de la tabla `tbl_ubicacion_productor`
--
ALTER TABLE `tbl_ubicacion_productor`
  ADD PRIMARY KEY (`id_ubicacion`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_municipio` (`id_municipio`),
  ADD KEY `id_aldea` (`id_aldea`),
  ADD KEY `id_caserio` (`id_caserio`),
  ADD KEY `id_productor` (`id_productor`),
  ADD KEY `fk_id_ficha_ubicacion` (`id_ficha`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_Usuario`),
  ADD KEY `Estado` (`Id_estado`),
  ADD KEY `Rol` (`Id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  MODIFY `id_estado` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `objetos`
--
ALTER TABLE `objetos`
  MODIFY `Id_objetos` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `Id_Permisos` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `Id_pregunta` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `preguntas_usuario`
--
ALTER TABLE `preguntas_usuario`
  MODIFY `Id_Pregunta_U` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `Id_rol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tbl_aldeas`
--
ALTER TABLE `tbl_aldeas`
  MODIFY `Id_Aldea` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_apoyos`
--
ALTER TABLE `tbl_apoyos`
  MODIFY `id_apoyo_produccion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_cacerios`
--
ALTER TABLE `tbl_cacerios`
  MODIFY `Id_Cacerio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  MODIFY `Id_Departamento` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_etnias`
--
ALTER TABLE `tbl_etnias`
  MODIFY `id_etnia` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tbl_etnias_por_productor`
--
ALTER TABLE `tbl_etnias_por_productor`
  MODIFY `Id_etnicidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_fuentes_credito`
--
ALTER TABLE `tbl_fuentes_credito`
  MODIFY `id_fuente_credito` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_medidas_tierra`
--
ALTER TABLE `tbl_medidas_tierra`
  MODIFY `id_medida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_migracion_familiar`
--
ALTER TABLE `tbl_migracion_familiar`
  MODIFY `id_migracion` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_motivos_migracion`
--
ALTER TABLE `tbl_motivos_migracion`
  MODIFY `Id_motivo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tbl_motivos_nocredito`
--
ALTER TABLE `tbl_motivos_nocredito`
  MODIFY `id_motivos_no_credito` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  MODIFY `Id_Municipio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbl_organizaciones`
--
ALTER TABLE `tbl_organizaciones`
  MODIFY `id_organizacion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_organizaciones_por_productor`
--
ALTER TABLE `tbl_organizaciones_por_productor`
  MODIFY `Id_Organizacion_Productor` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tbl_periodicidad`
--
ALTER TABLE `tbl_periodicidad`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tbl_productor`
--
ALTER TABLE `tbl_productor`
  MODIFY `id_productor` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_relevo_organizacion`
--
ALTER TABLE `tbl_relevo_organizacion`
  MODIFY `Id_Relevo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tbl_tipos_apoyos`
--
ALTER TABLE `tbl_tipos_apoyos`
  MODIFY `id_tipo_apoyos` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_cultivo`
--
ALTER TABLE `tbl_tipo_cultivo`
  MODIFY `id_tipo_cultivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_negocios`
--
ALTER TABLE `tbl_tipo_negocios`
  MODIFY `id_tipo_negocio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_organizacion`
--
ALTER TABLE `tbl_tipo_organizacion`
  MODIFY `id_tipo_organizacion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_practicas_productivas`
--
ALTER TABLE `tbl_tipo_practicas_productivas`
  MODIFY `id_tipo_practica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_produccion`
--
ALTER TABLE `tbl_tipo_produccion`
  MODIFY `id_tipo_produccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_riego`
--
ALTER TABLE `tbl_tipo_riego`
  MODIFY `id_tipo_riego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_trabajadores`
--
ALTER TABLE `tbl_tipo_trabajadores`
  MODIFY `id_tipo_trabajador` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_toma_decisiones`
--
ALTER TABLE `tbl_toma_decisiones`
  MODIFY `id_tipo_tomador` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Usuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- Filtros para la tabla `tbl_apoyos_produccion`
--
ALTER TABLE `tbl_apoyos_produccion`
  ADD CONSTRAINT `fk_id_apoyo_produccion` FOREIGN KEY (`id_apoyo_produccion`) REFERENCES `tbl_apoyos` (`id_apoyo_produccion`),
  ADD CONSTRAINT `fk_id_ficha_apoyos_produccion` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `fk_id_productor_apoyos_produccion` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`);

--
-- Filtros para la tabla `tbl_apoyo_actividad_externa`
--
ALTER TABLE `tbl_apoyo_actividad_externa`
  ADD CONSTRAINT `fk_id_ficha_apoyo_actividad_extern` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `fk_id_productor_apoyo_actividad_extern` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`);

--
-- Filtros para la tabla `tbl_base_organizacion_por_productor`
--
ALTER TABLE `tbl_base_organizacion_por_productor`
  ADD CONSTRAINT `fk_base_organizacion_ficha` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `fk_base_organizacion_productor` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`);

--
-- Filtros para la tabla `tbl_cacerios`
--
ALTER TABLE `tbl_cacerios`
  ADD CONSTRAINT `FK_Cacerio_Usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`),
  ADD CONSTRAINT `FK_Caserio_Aldea` FOREIGN KEY (`Id_Aldea`) REFERENCES `tbl_aldeas` (`Id_Aldea`);

--
-- Filtros para la tabla `tbl_composicion`
--
ALTER TABLE `tbl_composicion`
  ADD CONSTRAINT `fk_id_ficha_composicion` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `fk_id_producto_composicionr` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`);

--
-- Filtros para la tabla `tbl_credito_produccion`
--
ALTER TABLE `tbl_credito_produccion`
  ADD CONSTRAINT `fk_id_ficha_credito_produccion` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `fk_id_fuente_credito` FOREIGN KEY (`id_fuente_credito`) REFERENCES `tbl_fuentes_credito` (`id_fuente_credito`),
  ADD CONSTRAINT `fk_id_motivos_no_credito` FOREIGN KEY (`id_motivos_no_credito`) REFERENCES `tbl_motivos_nocredito` (`id_motivos_no_credito`),
  ADD CONSTRAINT `fk_id_productor_credito_produccion` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`);

--
-- Filtros para la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  ADD CONSTRAINT `FK_Departamento_Usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`);

--
-- Filtros para la tabla `tbl_etnias_por_productor`
--
ALTER TABLE `tbl_etnias_por_productor`
  ADD CONSTRAINT `fk_etnias_fichas` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `tbl_etnias_por_productor_ibfk_1` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `tbl_etnias_por_productor_ibfk_2` FOREIGN KEY (`id_etnia`) REFERENCES `tbl_etnias` (`id_etnia`);

--
-- Filtros para la tabla `tbl_migracion_familiar`
--
ALTER TABLE `tbl_migracion_familiar`
  ADD CONSTRAINT `fk_id_ficha_migracion_familiar` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `fk_id_productor_migracion_familiar` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `fk_id_tipo_motivos` FOREIGN KEY (`id_tipo_motivos`) REFERENCES `tbl_motivos_migracion` (`Id_motivo`);

--
-- Filtros para la tabla `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  ADD CONSTRAINT `FK_Municipio_Departamento` FOREIGN KEY (`Id_Departamento`) REFERENCES `tbl_departamentos` (`Id_Departamento`),
  ADD CONSTRAINT `FK_Municipio_Usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`);

--
-- Filtros para la tabla `tbl_no_creditos`
--
ALTER TABLE `tbl_no_creditos`
  ADD CONSTRAINT `fk_id_fichal_no_creditos` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `fk_id_motivos` FOREIGN KEY (`id_motivos_no_credito`) REFERENCES `tbl_motivos_nocredito` (`id_motivos_no_credito`),
  ADD CONSTRAINT `fk_id_productorl_no_creditos` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`);

--
-- Filtros para la tabla `tbl_organizaciones`
--
ALTER TABLE `tbl_organizaciones`
  ADD CONSTRAINT `fk_tipo_organizacion` FOREIGN KEY (`id_tipo_organizacion`) REFERENCES `tbl_tipo_organizacion` (`id_tipo_organizacion`);

--
-- Filtros para la tabla `tbl_organizaciones_por_productor`
--
ALTER TABLE `tbl_organizaciones_por_productor`
  ADD CONSTRAINT `fk_id_productor` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `fk_organizacion_por_productor` FOREIGN KEY (`id_organizacion`) REFERENCES `tbl_organizaciones` (`id_organizacion`),
  ADD CONSTRAINT `tbl_organizaciones_por_productor_ibfk_1` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`);

--
-- Filtros para la tabla `tbl_productor`
--
ALTER TABLE `tbl_productor`
  ADD CONSTRAINT `tbl_productor_ibfk_1` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`);

--
-- Filtros para la tabla `tbl_productor_actividad_externa`
--
ALTER TABLE `tbl_productor_actividad_externa`
  ADD CONSTRAINT `fk_id_ficha_actividad_externa` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `fk_id_productor_actividad_externa` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `fk_id_tomador_decisiones_actividad_externa` FOREIGN KEY (`id_tomador_decisiones`) REFERENCES `tbl_toma_decisiones` (`id_tipo_tomador`);

--
-- Filtros para la tabla `tbl_relevo_organizacion`
--
ALTER TABLE `tbl_relevo_organizacion`
  ADD CONSTRAINT `fk_id_ficha` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `fk_id_productor_relevo` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`);

--
-- Filtros para la tabla `tbl_tipos_apoyo_produccion`
--
ALTER TABLE `tbl_tipos_apoyo_produccion`
  ADD CONSTRAINT `fk_id_ficha_apoyo_produccion` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `fk_id_productor_apoyo_produccion` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `fk_id_tipos_apoyos_apoyo_produccion` FOREIGN KEY (`id_tipos_apoyos`) REFERENCES `tbl_tipos_apoyos` (`id_tipo_apoyos`);

--
-- Filtros para la tabla `tbl_trabajadores_externos`
--
ALTER TABLE `tbl_trabajadores_externos`
  ADD CONSTRAINT `fk_id_ficha_trabajadores_externos` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `fk_id_productor_trabajadores_externos` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `fk_id_tipo_trabajador` FOREIGN KEY (`id_tipo_trabajador`) REFERENCES `tbl_tipo_trabajadores` (`id_tipo_trabajador`);

--
-- Filtros para la tabla `tbl_ubicacion_productor`
--
ALTER TABLE `tbl_ubicacion_productor`
  ADD CONSTRAINT `fk_id_ficha_ubicacion` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `tbl_ubicacion_productor_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `tbl_departamentos` (`Id_Departamento`),
  ADD CONSTRAINT `tbl_ubicacion_productor_ibfk_2` FOREIGN KEY (`id_municipio`) REFERENCES `tbl_municipios` (`Id_Municipio`),
  ADD CONSTRAINT `tbl_ubicacion_productor_ibfk_3` FOREIGN KEY (`id_aldea`) REFERENCES `tbl_aldeas` (`Id_Aldea`),
  ADD CONSTRAINT `tbl_ubicacion_productor_ibfk_4` FOREIGN KEY (`id_caserio`) REFERENCES `tbl_cacerios` (`Id_Cacerio`),
  ADD CONSTRAINT `tbl_ubicacion_productor_ibfk_5` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `tbl_ubicacion_productor_ibfk_6` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`);

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
