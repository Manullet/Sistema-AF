-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2024 a las 19:40:08
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
-- Base de datos: `bd_af_p`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarActividadExterna` (IN `p_Id_ActividadExterna` BIGINT, IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Miembros_Actividades_Fuera_Finca` ENUM('S','N'), IN `p_Id_Tomador_Decisiones` BIGINT, IN `p_Descripcion` TEXT, IN `p_Modificado_Por` VARCHAR(255), IN `p_Nuevo_Estado` VARCHAR(50))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_productor_actividad_externa
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_productor_actividad_externa
        WHERE id_actividad_ext = p_Id_ActividadExterna
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_productor_actividad_externa';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_productor_actividad_externa`
        SET
            `id_ficha` = p_Id_Ficha,
            `id_productor` = p_Id_Productor,
            `miembros_realizan_actividades_fuera_finca` = p_Miembros_Actividades_Fuera_Finca,
            `id_tomador_decisiones` = p_Id_Tomador_Decisiones,
            `descripcion` = p_Descripcion,
            `modificado_por` = p_Modificado_Por,
            `fecha_modificacion` = CURRENT_TIMESTAMP(),
            `estado` = p_Nuevo_Estado
        WHERE
            `id_actividad_ext` = p_Id_ActividadExterna;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarAldea` (IN `p_Id_Aldea` BIGINT, IN `p_Id_Departamento` BIGINT, IN `p_Id_Municipio` BIGINT, IN `p_Nombre_Aldea` VARCHAR(100), IN `p_Descripcion` VARCHAR(255), IN `p_Modificado_Por` VARCHAR(50), IN `p_Nuevo_Estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_aldeas
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_aldeas
        WHERE Id_Aldea = p_Id_Aldea
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_aldeas';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_aldeas`
        SET
            `Id_Departamento` = p_Id_Departamento,
            `Id_Municipio` = p_Id_Municipio,
            `Nombre_Aldea` = p_Nombre_Aldea,
            `Descripcion` = p_Descripcion,
            `Estado` = p_Nuevo_Estado,
            `Modificado_Por` = p_Modificado_Por,
            `Fecha_Modificacion` = CURRENT_TIMESTAMP()
        WHERE
            `Id_Aldea` = p_Id_Aldea;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarApoyoActividadExterna` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Recibe_Apoyo_Produccion_Agricola` ENUM('S','N'), IN `p_Atencion_Por_UAG` ENUM('S','N'), IN `p_Productos_Vendidos_Por_Pralesc` ENUM('S','N'), IN `p_Descripcion` TEXT, IN `p_Modificado_Por` VARCHAR(255))   BEGIN
        -- Realizar la actualización
        UPDATE tbl_apoyo_actividad_externa
        SET
            recibe_apoyo_prodagrícola = p_Recibe_Apoyo_Produccion_Agricola,
         	atencion_por_UAG = p_Atencion_Por_UAG,
            productos_vendidospor_pralesc = p_Productos_Vendidos_Por_Pralesc,
            descripcion = p_Descripcion,
            modificado_por = p_Modificado_Por,
            fecha_modificacion = CURRENT_TIMESTAMP()
        WHERE
            id_ficha = p_Id_Ficha AND id_productor = p_Id_Productor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarApoyoProduccion` (IN `p_Id_Apoyo_Produccion` BIGINT, IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Id_Apoyo_Produccion_Tipo` BIGINT, IN `p_Otros_Detalles` TEXT, IN `p_Descripcion` TEXT, IN `p_Modificado_Por` VARCHAR(255), IN `p_Nuevo_Estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_apoyos_produccion
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_apoyos_produccion
        WHERE id_apoyo_prod = p_Id_Apoyo_Produccion
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_apoyos_produccion';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_apoyos_produccion`
        SET
            `id_ficha` = p_Id_Ficha,
            `id_productor` = p_Id_Productor,
            `id_apoyo_produccion` = p_Id_Apoyo_Produccion_Tipo,
            `otros_detalles` = p_Otros_Detalles,
            `descripcion` = p_Descripcion,
            `modificado_por` = p_Modificado_Por,
            `fecha_modificacion` = CURRENT_TIMESTAMP(),
            `estado` = p_Nuevo_Estado
        WHERE
            `id_apoyo_prod` = p_Id_Apoyo_Produccion;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarApoyos` (IN `p_id_apoyo_produccion` BIGINT, IN `p_tipo_apoyo_produccion` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(255), IN `p_estado` ENUM('ACTIVO','INACTIVO'))   BEGIN
    UPDATE tbl_apoyos
    SET tipo_apoyo_produccion = p_tipo_apoyo_produccion,
        descripcion = p_descripcion,
        modificado_por = p_modificado_por,
        fecha_modificacion = CURRENT_TIMESTAMP(),
        estado = p_estado
    WHERE id_apoyo_produccion = p_id_apoyo_produccion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarBaseOrganizacion` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Pertenece_A_Organizacion` ENUM('S','N'), IN `p_Descripcion` TEXT, IN `p_Modificado_Por` VARCHAR(50))   BEGIN

	DELETE FROM tbl_organizaciones_por_productor WHERE id_ficha = p_Id_Ficha AND id_productor = p_Id_Productor;
	
   -- Realizar la actualización
   UPDATE tbl_base_organizacion
      SET
         id_ficha = p_Id_Ficha,
         id_productor = p_Id_Productor,
         pertenece_a_organizacion = p_Pertenece_A_Organizacion,
         descripcion = p_Descripcion,
         modificado_por = p_Modificado_Por,
         fecha_modificacion = CURRENT_TIMESTAMP()
   WHERE id_ficha = p_Id_Ficha AND id_productor = p_Id_Productor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCacerio` (IN `p_Id_Cacerio` BIGINT, IN `p_Id_Aldea` BIGINT, IN `p_Id_Municipio` BIGINT, IN `p_Id_Departamento` BIGINT, IN `p_Nombre_Cacerio` VARCHAR(100), IN `p_Descripcion` VARCHAR(255), IN `p_Modificado_Por` VARCHAR(255), IN `p_Nuevo_Estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_cacerios
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_cacerios
        WHERE Id_Cacerio = p_Id_Cacerio
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_cacerios';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_cacerios`
        SET
            `Id_Aldea` = p_Id_Aldea,
            `Id_Municipio` = p_Id_Municipio,
            `Id_Departamento` = p_Id_Departamento,
            `Nombre_Cacerio` = p_Nombre_Cacerio,
            `Descripcion` = p_Descripcion,
            `Estado` = p_Nuevo_Estado,
            `Modificado_Por` = p_Modificado_Por,
            `Fecha_Modificacion` = CURRENT_TIMESTAMP()
        WHERE
            `Id_Cacerio` = p_Id_Cacerio;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCreditoProduccion` (IN `p_Id_CreditoProduccion` BIGINT, IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Ha_Solicitado_Creditos` ENUM('S','N'), IN `p_Id_Fuente_Credito` BIGINT, IN `p_Monto_Credito` DECIMAL(10,2), IN `p_Id_Motivos_No_Credito` BIGINT, IN `p_Descripcion` TEXT, IN `p_Modificado_Por` VARCHAR(255), IN `p_Nuevo_Estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_credito_produccion
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_credito_produccion
        WHERE id_credpro = p_Id_CreditoProduccion
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_credito_produccion';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_credito_produccion`
        SET
            `id_ficha` = p_Id_Ficha,
            `id_productor` = p_Id_Productor,
            `ha_solicitado_creditos` = p_Ha_Solicitado_Creditos,
            `id_fuente_credito` = p_Id_Fuente_Credito,
            `monto_credito` = p_Monto_Credito,
            `id_motivos_no_credito` = p_Id_Motivos_No_Credito,
            `descripcion` = p_Descripcion,
            `modificado_por` = p_Modificado_Por,
            `fecha_modificacion` = CURRENT_TIMESTAMP(),
            `estado` = p_Nuevo_Estado
        WHERE
            `id_credpro` = p_Id_CreditoProduccion;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDepartamento` (IN `p_Id_Departamento` BIGINT, IN `p_Nombre_Departamento` VARCHAR(100), IN `p_Descripcion` VARCHAR(255), IN `p_Modificado_Por` VARCHAR(255), IN `p_Nuevo_Estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_departamentos
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_departamentos
        WHERE Id_Departamento = p_Id_Departamento
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_departamentos';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_departamentos`
        SET
            `Nombre_Departamento` = p_Nombre_Departamento,
            `Descripcion` = p_Descripcion,
            `Modificado_Por` = p_Modificado_Por,
            `Fecha_Modificacion` = CURRENT_TIMESTAMP(),
            `Estado` = p_Nuevo_Estado
        WHERE
            `Id_Departamento` = p_Id_Departamento;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarEtnia` (IN `p_id_etnia` BIGINT, IN `p_etnia` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(255), IN `p_estado` ENUM('A','I'))   BEGIN
    -- Actualizar datos en la tabla
    UPDATE tbl_etnias
    SET etnia = p_etnia,
        descripcion = p_descripcion,
        modificado_por = p_modificado_por,
        fecha_modificacion = CURRENT_TIMESTAMP(),
        estado = p_estado
    WHERE id_etnia = p_id_etnia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarEtniasPorProductor` (IN `p_id_ficha` BIGINT, IN `p_id_productor` BIGINT, IN `p_id_etnia` BIGINT, IN `p_detalle_de_otros` VARCHAR(255), IN `p_modificado_por` VARCHAR(255))   BEGIN
        -- Realizar la actualización si la validación es exitosa
        UPDATE tbl_etnias_por_productor
        SET
            id_ficha = p_id_ficha,
            id_productor = p_id_productor,
            id_etnia = p_id_etnia,
            detalle_de_otros = p_detalle_de_otros,
            modificado_por = p_modificado_por,
            fecha_modificacion = CURRENT_TIMESTAMP()
        WHERE
            id_ficha = p_id_ficha AND id_productor = p_id_productor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarFicha` (IN `p_Id_Ficha` BIGINT, IN `p_Fecha_Solicitud` DATE, IN `p_Anio_Solicitud` INT, IN `p_Descripcion` VARCHAR(255), IN `p_Modificado_Por` VARCHAR(50), IN `p_Nuevo_Estado` ENUM('A','I'), IN `p_Fecha_Entrevista` DATE, IN `p_Nombre_Encuentrador` VARCHAR(50), IN `p_Nombre_Encuestador` VARCHAR(50), IN `p_Nombre_Supervisor` VARCHAR(50))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla fichas
    IF NOT EXISTS (
        SELECT 1
        FROM fichas
        WHERE id_ficha = p_Id_Ficha
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla fichas';
    ELSE
        -- Realizar la actualización
        UPDATE `fichas`
        SET
            `fecha_solicitud` = p_Fecha_Solicitud,
            `anio_solicitud` = p_Anio_Solicitud,
            `descripcion` = p_Descripcion,
            `modificado_por` = p_Modificado_Por,
            `fecha_modificacion` = CURRENT_TIMESTAMP(),
            `estado` = p_Nuevo_Estado,
            `fecha_entrevista` = p_Fecha_Entrevista,
            `nombre_encuentrador` = p_Nombre_Encuentrador,
            `nombre_encuestador` = p_Nombre_Encuestador,
            `nombre_supervisor` = p_Nombre_Supervisor
        WHERE
            `id_ficha` = p_Id_Ficha;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarFuenteCredito` (IN `p_id_fuente_credito` BIGINT, IN `p_fuente_credito` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(255), IN `p_estado` ENUM('A','I'))   BEGIN
    UPDATE tbl_fuentes_credito
    SET fuente_credito = p_fuente_credito,
        descripcion = p_descripcion,
        modificado_por = p_modificado_por,
        fecha_modificacion = CURRENT_TIMESTAMP(),
        estado = p_estado
    WHERE id_fuente_credito = p_id_fuente_credito;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarIngresoFamiliar` (IN `p_Id_Ingreso_Familiar` BIGINT, IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Id_Tipo_Negocio` BIGINT, IN `p_Total_Ingreso` DECIMAL(10,2), IN `p_Id_Periodo_Ingreso` BIGINT, IN `p_Descripcion_Otros` VARCHAR(255), IN `p_Descripcion` VARCHAR(255), IN `p_Modificado_Por` VARCHAR(255), IN `p_Nuevo_Estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_ingreso_familiar
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_ingreso_familiar
        WHERE Id_Ingreso_Familiar = p_Id_Ingreso_Familiar
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_ingreso_familiar';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_ingreso_familiar`
        SET
            `Id_Ficha` = p_Id_Ficha,
            `Id_Productor` = p_Id_Productor,
            `Id_Tipo_Negocio` = p_Id_Tipo_Negocio,
            `Total_Ingreso` = p_Total_Ingreso,
            `Id_Periodo_Ingreso` = p_Id_Periodo_Ingreso,
            `Descripcion_Otros` = p_Descripcion_Otros,
            `Descripcion` = p_Descripcion,
            `Modificado_Por` = p_Modificado_Por,
            `Fecha_Modificacion` = CURRENT_TIMESTAMP(),
            `estado` = p_Nuevo_Estado
        WHERE
            `Id_Ingreso_Familiar` = p_Id_Ingreso_Familiar;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarManejoRiego` (IN `p_Id_Manejo_Riego` BIGINT, IN `p_Id_Ficha` BIGINT, IN `p_Id_Ubicacion` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Tiene_Riego` ENUM('S','N'), IN `p_Superficie_Riego` DECIMAL(10,2), IN `p_Id_Medida_Superficie_Riego` BIGINT, IN `p_Id_Tipo_Riego` BIGINT, IN `p_Fuente_Agua` VARCHAR(255), IN `p_Disponibilidad_Agua_Meses` INT, IN `p_Descripcion` VARCHAR(255), IN `p_Modificado_Por` VARCHAR(255), IN `p_Estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_manejo_riego
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_manejo_riego
        WHERE Id_Manejo_Riego = p_Id_Manejo_Riego
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_manejo_riego';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_manejo_riego`
        SET
            `Id_Ficha` = p_Id_Ficha,
            `Id_Ubicacion` = p_Id_Ubicacion,
            `Id_Productor` = p_Id_Productor,
            `Tiene_Riego` = p_Tiene_Riego,
            `Superficie_Riego` = p_Superficie_Riego,
            `Id_Medida_Superficie_Riego` = p_Id_Medida_Superficie_Riego,
            `Id_Tipo_Riego` = p_Id_Tipo_Riego,
            `Fuente_Agua` = p_Fuente_Agua,
            `Disponibilidad_Agua_Meses` = p_Disponibilidad_Agua_Meses,
            `Descripcion` = p_Descripcion,
            `Modificado_Por` = p_Modificado_Por,
            `Fecha_Modificacion` = CURRENT_TIMESTAMP(),
            `Estado` = p_Estado
        WHERE
            `Id_Manejo_Riego` = p_Id_Manejo_Riego;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarMedidaTierra` (IN `p_id_medida` BIGINT, IN `p_medida` VARCHAR(25), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(255), IN `p_estado` ENUM('ACTIVO','INACTIVO'))   BEGIN
    UPDATE tbl_medidas_tierra
    SET medida = p_medida,
        descripcion = p_descripcion,
        modificado_por = p_modificado_por,
        fecha_modificacion = CURRENT_TIMESTAMP(),
        estado = p_estado
    WHERE id_medida = p_id_medida;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarMigracionFamiliar` (IN `p_Id_Migracion` BIGINT, IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Tiene_Migrantes` ENUM('S','N'), IN `p_Migracion_Dentro_Pais` ENUM('S','N'), IN `p_Migracion_Fuera_Pais` ENUM('S','N'), IN `p_Id_Tipo_Motivos` BIGINT, IN `p_Remesas` ENUM('S','N'), IN `p_Descripcion` TEXT, IN `p_Modificado_Por` VARCHAR(255), IN `p_Nuevo_Estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_migracion_familiar
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_migracion_familiar
        WHERE id_migracion = p_Id_Migracion
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_migracion_familiar';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_migracion_familiar`
        SET
            `id_ficha` = p_Id_Ficha,
            `id_productor` = p_Id_Productor,
            `tiene_migrantes` = p_Tiene_Migrantes,
            `migracion_dentro_pais` = p_Migracion_Dentro_Pais,
            `migracion_fuera_pais` = p_Migracion_Fuera_Pais,
            `id_tipo_motivos` = p_Id_Tipo_Motivos,
            `remesas` = p_Remesas,
            `descripcion` = p_Descripcion,
            `modificado_por` = p_Modificado_Por,
            `fecha_modificacion` = CURRENT_TIMESTAMP(),
            `estado` = p_Nuevo_Estado
        WHERE
            `id_migracion` = p_Id_Migracion;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarMotivoMigracion` (IN `p_id_motivo` BIGINT, IN `p_motivo` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(255), IN `p_estado` ENUM('A','I'))   BEGIN
    UPDATE tbl_motivos_migracion
    SET Motivo = p_motivo,
        Descripcion = p_descripcion,
        Modificado_por = p_modificado_por,
        Fecha_Actualizacion = CURRENT_TIMESTAMP(),
        Estado = p_estado
    WHERE Id_motivo = p_id_motivo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarMotivoNoCredito` (IN `p_id_motivo_no_credito` BIGINT, IN `p_motivo_no_credito` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(255), IN `p_estado` ENUM('A','I'))   BEGIN
    UPDATE tbl_motivos_no_creditos
    SET motivo_no_credito = p_motivo_no_credito,
        descripcion = p_descripcion,
        modificado_por = p_modificado_por,
        fecha_modificacion = CURRENT_TIMESTAMP(),
        estado = p_estado
    WHERE id_motivos_no_credito = p_id_motivo_no_credito;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarMunicipio` (IN `p_Id_Municipio` BIGINT, IN `p_Id_Departamento` BIGINT, IN `p_Nombre_Municipio` VARCHAR(100), IN `p_Descripcion` VARCHAR(255), IN `p_Modificado_Por` VARCHAR(100), IN `p_Nuevo_Estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_municipios
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_municipios
        WHERE Id_Municipio = p_Id_Municipio
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_municipios';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_municipios`
        SET
            `Id_Departamento` = p_Id_Departamento,
            `Nombre_Municipio` = p_Nombre_Municipio,
            `Descripcion` = p_Descripcion,
            `Modificado_Por` = p_Modificado_Por,
            `Fecha_Modificacion` = CURRENT_TIMESTAMP(),
            `Estado` = p_Nuevo_Estado
        WHERE
            `Id_Municipio` = p_Id_Municipio;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarNoCredito` (IN `p_Id_NoCredito` BIGINT, IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Id_Motivos_No_Credito` BIGINT, IN `p_Descripcion` TEXT, IN `p_Modificado_Por` VARCHAR(255), IN `p_Nuevo_Estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_no_creditos
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_no_creditos
        WHERE id_nocred = p_Id_NoCredito
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_no_creditos';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_no_creditos`
        SET
            `id_ficha` = p_Id_Ficha,
            `id_productor` = p_Id_Productor,
            `id_motivos_no_credito` = p_Id_Motivos_No_Credito,
            `descripcion` = p_Descripcion,
            `modificado_por` = p_Modificado_Por,
            `fecha_modificacion` = CURRENT_TIMESTAMP(),
            `estado` = p_Nuevo_Estado
        WHERE
            `id_nocred` = p_Id_NoCredito;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarOrganizacion` (IN `p_id_organizacion` BIGINT, IN `p_organizacion` VARCHAR(255), IN `p_id_tipo_organizacion` BIGINT, IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(255), IN `p_estado` ENUM('A','I'))   BEGIN
    UPDATE tbl_organizaciones
    SET organizacion = p_organizacion,
        id_tipo_organizacion = p_id_tipo_organizacion,
        descripcion = p_descripcion,
        modificado_por = p_modificado_por,
        fecha_modificacion = CURRENT_TIMESTAMP(),
        estado = p_estado
    WHERE id_organizacion = p_id_organizacion;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPeriodicidad` (IN `p_id_periodo` BIGINT, IN `p_periodo` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(255), IN `p_estado` ENUM('A','I'))   BEGIN
    UPDATE tbl_periodicidad
    SET periodo = p_periodo,
        descripcion = p_descripcion,
        modificado_por = p_modificado_por,
        fecha_modificacion = CURRENT_TIMESTAMP(),
        estado = p_estado
    WHERE id_periodo = p_id_periodo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPracticaProduccion` (IN `Id_Practica_Produccion_param` BIGINT, IN `Id_Ficha_param` BIGINT, IN `Id_Productor_param` BIGINT, IN `Id_Tipo_Practica_param` BIGINT, IN `Descripcion_param` TEXT, IN `Modificado_Por_param` VARCHAR(255), IN `nuevo_estado` ENUM('A','I'))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de modificación
    UPDATE `tbl_practicas_por_produccion`
    SET
        `Id_Ficha` = Id_Ficha_param,
        `Id_Productor` = Id_Productor_param,
        `Id_Tipo_Practica` = Id_Tipo_Practica_param,
        `Descripcion` = Descripcion_param,
        `Modificado_Por` = Modificado_Por_param,
        `Fecha_Modificacion` = CURRENT_TIMESTAMP,
        `estado` = nuevo_estado
    WHERE
        `Id_Practica_Produccion` = Id_Practica_Produccion_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPregunta` (IN `p_id_pregunta` BIGINT, IN `p_pregunta` VARCHAR(255), IN `p_actualizado_por` VARCHAR(40), IN `p_estado` ENUM('A','I'))   BEGIN
    UPDATE preguntas 
    SET Pregunta = p_pregunta,
        Actualizado_Por = p_actualizado_por,
        Fecha_Actualizacion = CURRENT_TIMESTAMP,
        estado = p_estado
    WHERE Id_pregunta = p_id_pregunta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProduccionAgricolaAnterior` (IN `p_Id_Produccion_Anterior` BIGINT, IN `p_Id_Ficha` BIGINT, IN `p_Id_Ubicacion` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Id_Tipo_Cultivo` BIGINT, IN `p_Superficie_Primera_Postrera` DECIMAL(10,2), IN `p_Id_Medida_Primera_Postrera` BIGINT, IN `p_Produccion_Obtenida` DECIMAL(10,2), IN `p_Id_Medida_Produccion_Obtenida` BIGINT, IN `p_Cantidad_Vendida` DECIMAL(10,2), IN `p_Id_Medida_Vendida` BIGINT, IN `p_Precio_Venta` DECIMAL(10,2), IN `p_A_Quien_Se_Vendio` VARCHAR(255), IN `p_Descripcion` VARCHAR(255), IN `p_Modificado_Por` VARCHAR(255), IN `p_nuevo_estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_produccion_agricola_anterior
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_produccion_agricola_anterior
        WHERE Id_Produccion_Anterior = p_Id_Produccion_Anterior
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_produccion_agricola_anterior';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_produccion_agricola_anterior`
        SET
            `Id_Ficha` = p_Id_Ficha,
            `Id_Ubicacion` = p_Id_Ubicacion,
            `Id_Productor` = p_Id_Productor,
            `Id_Tipo_Cultivo` = p_Id_Tipo_Cultivo,
            `Superficie_Primera_Postrera` = p_Superficie_Primera_Postrera,
            `Id_Medida_Primera_Postrera` = p_Id_Medida_Primera_Postrera,
            `Produccion_Obtenida` = p_Produccion_Obtenida,
            `Id_Medida_Produccion_Obtenida` = p_Id_Medida_Produccion_Obtenida,
            `Cantidad_Vendida` = p_Cantidad_Vendida,
            `Id_Medida_Vendida` = p_Id_Medida_Vendida,
            `Precio_Venta` = p_Precio_Venta,
            `A_Quien_Se_Vendio` = p_A_Quien_Se_Vendio,
            `Descripcion` = p_Descripcion,
            `Modificado_Por` = p_Modificado_Por,
            `Fecha_Modificacion` = CURRENT_TIMESTAMP,
            `Estado` = p_nuevo_estado
        WHERE
            `Id_Produccion_Anterior` = p_Id_Produccion_Anterior;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProduccionComercializacion` (IN `p_Id_Produccion_Comercio` BIGINT, IN `p_Id_Ficha` BIGINT, IN `p_Id_Ubicacion` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Id_Tipo_Produccion` BIGINT, IN `p_Cantidad_Produccion` DECIMAL(10,2), IN `p_Id_Medida_Produccion` BIGINT, IN `p_Cantidad_Vendida` DECIMAL(10,2), IN `p_Id_Medida_Venta` BIGINT, IN `p_Precio_Venta` DECIMAL(10,2), IN `p_A_Quien_Se_Vendio` VARCHAR(255), IN `p_Modificado_Por` VARCHAR(255), IN `p_nuevo_estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_produccion_comercializacion
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_produccion_comercializacion
        WHERE Id_Produccion_Comercio = p_Id_Produccion_Comercio
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_produccion_comercializacion';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_produccion_comercializacion`
        SET
            `Id_Ficha` = p_Id_Ficha,
            `Id_Ubicacion` = p_Id_Ubicacion,
            `Id_Productor` = p_Id_Productor,
            `Id_Tipo_Produccion` = p_Id_Tipo_Produccion,
            `Cantidad_Produccion` = p_Cantidad_Produccion,
            `Id_Medida_Produccion` = p_Id_Medida_Produccion,
            `Cantidad_Vendida` = p_Cantidad_Vendida,
            `Id_Medida_Venta` = p_Id_Medida_Venta,
            `Precio_Venta` = p_Precio_Venta,
            `A_Quien_Se_Vendio` = p_A_Quien_Se_Vendio,
            `Modificado_Por` = p_Modificado_Por,
            `Fecha_Modificacion` = CURRENT_TIMESTAMP,
            `estado` = p_nuevo_estado
        WHERE
            `Id_Produccion_Comercio` = p_Id_Produccion_Comercio;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProduccionPecuaria` (IN `p_Id_Produccion_Pecuaria` BIGINT, IN `p_Id_Ficha` BIGINT, IN `p_Id_Ubicacion` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Año_Produccion` INT, IN `p_Id_Tipo_Pecuario` BIGINT, IN `p_Cantidad_Hembras` INT, IN `p_Cantidad_Machos` INT, IN `p_Descripcion_Otros` VARCHAR(255), IN `p_Precio_Venta` DECIMAL(10,2), IN `p_Id_Medida_Venta` BIGINT, IN `p_Cantidad_Mercado` INT, IN `p_Descripcion` VARCHAR(255), IN `p_Modificado_Por` VARCHAR(255), IN `p_nuevo_estado` ENUM('A','I'))   BEGIN
    -- Calcula la nueva Cantidad_Total
    SET @total = p_Cantidad_Machos + p_Cantidad_Hembras;

    -- Realiza la actualización
    UPDATE `tbl_produccion_pecuaria`
    SET
        `Id_Ficha` = p_Id_Ficha,
        `Id_Ubicacion` = p_Id_Ubicacion,
        `Id_Productor` = p_Id_Productor,
        `Año_Produccion` = p_Año_Produccion,
        `Id_Tipo_Pecuario` = p_Id_Tipo_Pecuario,
        `Cantidad_Hembras` = p_Cantidad_Hembras,
        `Cantidad_Machos` = p_Cantidad_Machos,
        `Cantidad_Total` = @total,
        `Descripcion_Otros` = p_Descripcion_Otros,
        `Precio_Venta` = p_Precio_Venta,
        `Id_Medida_Venta` = p_Id_Medida_Venta,
        `Cantidad_Mercado` = p_Cantidad_Mercado,
        `Descripcion` = p_Descripcion,
        `Modificado_Por` = p_Modificado_Por,
        `Fecha_Modificacion` = CURRENT_TIMESTAMP,
        `Estado` = p_nuevo_estado
    WHERE
        `Id_Produccion_Pecuaria` = p_Id_Produccion_Pecuaria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProduccionVendida` (IN `p_Id_Produccion_Vendida` BIGINT, IN `p_Año_Venta` INT, IN `p_Id_Tipo_Pecuario` BIGINT, IN `p_Precio_Venta` DECIMAL(10,2), IN `p_Id_Medida_Venta` BIGINT, IN `p_Cantidad_Mercado` INT, IN `p_Modificado_Por` VARCHAR(255), IN `p_nuevo_estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_produccion_vendida
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_produccion_vendida
        WHERE Id_Produccion_Vendida = p_Id_Produccion_Vendida
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_produccion_vendida';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_produccion_vendida`
        SET
            `Año_Venta` = p_Año_Venta,
            `Id_Tipo_Pecuario` = p_Id_Tipo_Pecuario,
            `Precio_Venta` = p_Precio_Venta,
            `Id_Medida_Venta` = p_Id_Medida_Venta,
            `Cantidad_Mercado` = p_Cantidad_Mercado,
            `Modificado_Por` = p_Modificado_Por,
            `Fecha_Modificacion` = CURRENT_TIMESTAMP,
            `Estado` = p_nuevo_estado
        WHERE
            `Id_Produccion_Vendida` = p_Id_Produccion_Vendida;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProductor` (IN `p_id_ficha` BIGINT, IN `p_primer_nombre` VARCHAR(255), IN `p_segundo_nombre` VARCHAR(255), IN `p_primer_apellido` VARCHAR(255), IN `p_segundo_apellido` VARCHAR(255), IN `p_identificacion` BIGINT, IN `p_fecha_nacimiento` DATE, IN `p_genero` VARCHAR(10), IN `p_estado_civil` VARCHAR(20), IN `p_nivel_escolaridad` VARCHAR(50), IN `p_ultimo_grado_escolar_aprobado` VARCHAR(50), IN `p_telefono_1` INT, IN `p_telefono_2` INT, IN `p_telefono_3` INT, IN `p_email_1` VARCHAR(255), IN `p_email_2` VARCHAR(255), IN `p_email_3` VARCHAR(255), IN `p_modificado_por` BIGINT)   BEGIN

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
            modificado_por = p_modificado_por,
            fecha_modificacion = CURRENT_TIMESTAMP(),
            estado = 'A'
        WHERE
            id_ficha = p_id_ficha;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarRelevoOrganizacion` (IN `p_id_ficha` BIGINT, IN `p_id_productor` BIGINT, IN `p_tendra_relevo` ENUM('S','N'), IN `p_cuantos_relevos` INT, IN `p_modificado_por` VARCHAR(25))   BEGIN
        -- Realizar la actualización si la validación es exitosa
        UPDATE tbl_relevo_organizacion
        SET
            id_ficha = p_id_ficha,
            id_productor = p_id_productor,
            tendra_relevo = p_tendra_relevo,
            cuantos_relevos = p_cuantos_relevos,
            modificado_por = p_modificado_por,
            fecha_modificacion = CURRENT_TIMESTAMP()
        WHERE
            id_ficha = p_id_ficha AND id_productor = p_id_productor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarTipoApoyo` (IN `p_id_tipo_apoyos` BIGINT, IN `p_tipo_apoyos` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(255), IN `p_estado` ENUM('ACTIVO','INACTIVO'))   BEGIN
    UPDATE tbl_tipos_apoyos
    SET tipo_apoyos = p_tipo_apoyos,
        descripcion = p_descripcion,
        modificado_por = p_modificado_por,
        fecha_modificacion = CURRENT_TIMESTAMP(),
        estado = p_estado
    WHERE id_tipo_apoyos = p_id_tipo_apoyos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarTipoApoyoProduccion` (IN `p_Id_TipoApoyoProduccion` BIGINT, IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Id_Tipos_Apoyos` BIGINT, IN `p_Otros_Detalles` TEXT, IN `p_Descripcion` TEXT, IN `p_Modificado_Por` VARCHAR(255), IN `p_Nuevo_Estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_tipos_apoyo_produccion
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_tipos_apoyo_produccion
        WHERE id_apoyo_produccion = p_Id_TipoApoyoProduccion
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_tipos_apoyo_produccion';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_tipos_apoyo_produccion`
        SET
            `id_ficha` = p_Id_Ficha,
            `id_productor` = p_Id_Productor,
            `id_tipos_apoyos` = p_Id_Tipos_Apoyos,
            `otros_detalles` = p_Otros_Detalles,
            `descripcion` = p_Descripcion,
            `modificado_por` = p_Modificado_Por,
            `fecha_modificacion` = CURRENT_TIMESTAMP(),
            `estado` = p_Nuevo_Estado
        WHERE
            `id_apoyo_produccion` = p_Id_TipoApoyoProduccion;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarTipoNegocio` (IN `p_id_tipo_negocio` BIGINT, IN `p_tipo_negocio` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(255), IN `p_estado` ENUM('A','I'))   BEGIN
    UPDATE tbl_tipo_negocios
    SET tipo_negocio = p_tipo_negocio,
        descripcion = p_descripcion,
        modificado_por = p_modificado_por,
        fecha_modificacion = CURRENT_TIMESTAMP(),
        estado = p_estado
    WHERE id_tipo_negocio = p_id_tipo_negocio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarTipoOrganizacion` (IN `p_id_tipo_organizacion` BIGINT, IN `p_tipo_organizacion` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(255), IN `p_estado` ENUM('A','I'))   BEGIN
    UPDATE tbl_tipo_organizacion
    SET tipo_organizacion = p_tipo_organizacion,
        descripcion = p_descripcion,
        modificado_por = p_modificado_por,
        fecha_modificacion = CURRENT_TIMESTAMP(),
        estado = p_estado
    WHERE id_tipo_organizacion = p_id_tipo_organizacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarTipoPecuario` (IN `id_tipo_pecuario_param` BIGINT, IN `nuevo_tipo_pecuario` VARCHAR(50), IN `nueva_raza_con_genero` ENUM('s','n'), IN `nueva_descripcion` TEXT, IN `modificado_por_param` VARCHAR(50), IN `nuevo_estado` ENUM('A','I'))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de modificación
    UPDATE `tbl_tipo_pecuarios`
    SET
        `tipo_pecuario` = nuevo_tipo_pecuario,
        `raza_con_genero` = nueva_raza_con_genero,
        `descripcion` = nueva_descripcion,
        `modificado_por` = modificado_por_param,
        `fecha_modificacion` = CURRENT_TIMESTAMP,
        `estado` = nuevo_estado
    WHERE
        `id_tipo_pecuario` = id_tipo_pecuario_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarTipoPracticaProductiva` (IN `p_id_tipo_practica` BIGINT, IN `p_tipo_practica` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(255), IN `p_estado` ENUM('A','I'))   BEGIN
    UPDATE tbl_tipo_practicas_productivas
    SET tipo_practica = p_tipo_practica,
        descripcion = p_descripcion,
        modificado_por = p_modificado_por,
        fecha_modificacion = CURRENT_TIMESTAMP(),
        estado = p_estado
    WHERE id_tipo_practica = p_id_tipo_practica;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarTipoProduccion` (IN `p_id_tipo_produccion` BIGINT, IN `p_tipo_produccion` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(255), IN `p_estado` ENUM('A','I'))   BEGIN
    UPDATE tbl_tipo_produccion
    SET tipo_produccion = p_tipo_produccion,
        descripcion = p_descripcion,
        modificado_por = p_modificado_por,
        fecha_modificacion = CURRENT_TIMESTAMP(),
        estado = p_estado
    WHERE id_tipo_produccion = p_id_tipo_produccion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarTomadorDecisiones` (IN `p_id_tipo_tomador` BIGINT, IN `p_tomador` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_modificado_por` VARCHAR(255), IN `p_estado` ENUM('A','I'))   BEGIN
    UPDATE tbl_toma_decisiones
    SET tomador = p_tomador,
        descripcion = p_descripcion,
        modificado_por = p_modificado_por,
        fecha_modificacion = CURRENT_TIMESTAMP(),
        estado = p_estado
    WHERE id_tipo_tomador = p_id_tipo_tomador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarTrabajadorExterno` (IN `p_Id_TrabajadorExterno` BIGINT, IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Id_Tipo_Trabajador` BIGINT, IN `p_Cantidad_Trabajador` INT, IN `p_Descripcion` TEXT, IN `p_Modificado_Por` VARCHAR(255), IN `p_Nuevo_Estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_trabajadores_externos
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_trabajadores_externos
        WHERE id_trabajador_ext = p_Id_TrabajadorExterno
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_trabajadores_externos';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_trabajadores_externos`
        SET
            `id_ficha` = p_Id_Ficha,
            `id_productor` = p_Id_Productor,
            `id_tipo_trabajador` = p_Id_Tipo_Trabajador,
            `cantidad_trabajador` = p_Cantidad_Trabajador,
            `descripcion` = p_Descripcion,
            `modificado_por` = p_Modificado_Por,
            `fecha_modificacion` = CURRENT_TIMESTAMP(),
            `estado` = p_Nuevo_Estado
        WHERE
            `id_trabajador_ext` = p_Id_TrabajadorExterno;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarUbicacionProductor` (IN `p_id_ubicacion` BIGINT, IN `p_id_ficha` BIGINT, IN `p_id_productor` BIGINT, IN `p_id_departamento` BIGINT, IN `p_id_municipio` BIGINT, IN `p_id_aldea` BIGINT, IN `p_id_caserio` BIGINT, IN `p_ubicacion_geografica` VARCHAR(255), IN `p_distancia_parcela_vivienda` DECIMAL(10,2), IN `p_latitud_parcela` VARCHAR(20), IN `p_longitud_parcela` VARCHAR(20), IN `p_msnm` DECIMAL(10,2), IN `p_direccion_1` VARCHAR(255), IN `p_direccion_2` VARCHAR(255), IN `p_direccion_3` VARCHAR(255), IN `p_vive_en_finca` ENUM('S','N'), IN `p_nombre_finca` VARCHAR(255), IN `p_modificado_por` VARCHAR(50))   BEGIN
        -- Realizar la actualización si la validación es exitosa
        UPDATE tbl_ubicacion_productor
        SET
            id_ficha = p_id_ficha,
            id_productor = p_id_productor,
            id_ubicacion = p_id_ubicacion,
            id_departamento = p_id_departamento,
            id_municipio = p_id_municipio,
            id_aldea = p_id_aldea,
            id_cacerio = p_id_caserio,
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
            modificado_por = p_modificado_por,
            fecha_modificacion = CURRENT_TIMESTAMP(),
            estado = 'A'
        WHERE
            id_ubicacion = p_id_ubicacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarUnidadProductoraYRiego` (IN `p_id_ubicacion` INT, IN `p_id_ficha` INT, IN `p_id_productor` INT, IN `p_Tipo_De_Manejo` ENUM('Propia','Alquilada','Prestada','Ejidal'), IN `p_Id_Medida_Produccion` BIGINT(20), IN `p_Superficie_Agricultura` DECIMAL(10,2), IN `p_Id_Medida_Agricultura` BIGINT(20), IN `p_Superficie_Ganaderia` DECIMAL(10,2), IN `p_Id_Medida_Ganaderia` BIGINT(20), IN `p_Superficie_Apicultura` DECIMAL(10,2), IN `p_Id_Medida_Apicultura` BIGINT(20), IN `p_Superficie_Forestal` DECIMAL(10,2), IN `p_Id_Medida_Forestal` BIGINT(20), IN `p_Superficie_Acuacultura` DECIMAL(10,2), IN `p_Numero_Estanques` INT, IN `p_Superficie_Agroturismo` DECIMAL(10,2), IN `p_Superficie_Otros` VARCHAR(50), IN `p_Modificado_Por` VARCHAR(255), IN `p_Tiene_Riego` ENUM('S','N'), IN `p_Medida_Riego` BIGINT(20), IN `p_Superficie_Riego` DECIMAL(10,2), IN `p_Id_Tipo_Riego` BIGINT(20), IN `p_Fuente_Agua` VARCHAR(255), IN `p_Disponibilidad_Agua_Meses` INT, IN `p_rubroAgricultura` VARCHAR(100), IN `p_rubroGanaderia` VARCHAR(100), IN `p_rubroForestal` VARCHAR(100), IN `p_Id_Superficie_Acuacultura` INT, IN `p_Id_Superficie_Agroturismo` INT)   BEGIN
	 UPDATE tbl_unidad_productora SET 
	    Tipo_De_Manejo = p_Tipo_De_Manejo,
	    Id_Medida_Produccion = p_Id_Medida_Produccion,
	    Superficie_Agricultura = p_Superficie_Agricultura,
	    Id_Medida_Agricultura = p_Id_Medida_Agricultura,
	    Superficie_Ganaderia = p_Superficie_Ganaderia,
	    Id_Medida_Ganaderia = p_Id_Medida_Ganaderia,
	    Superficie_Apicultura = p_Superficie_Apicultura,
	    Id_Medida_Apicultura = p_Id_Medida_Apicultura,
	    Superficie_Forestal = p_Superficie_Forestal,
	    Id_Medida_Forestal = p_Id_Medida_Forestal,
	    Superficie_Acuacultura = p_Superficie_Acuacultura,
	    Numero_Estanques = p_Numero_Estanques,
	    Superficie_Agroturismo = p_Superficie_Agroturismo,
	    Otros_Descripcion = p_Superficie_Otros,
	    rubro_agricultura = p_rubroAgricultura,
	    rubro_ganaderia = p_rubroGanaderia,
	    rubro_forestal = p_rubroForestal,
	    Id_Superficie_Acuacultura = p_Id_Superficie_Acuacultura,
	    Id_Superficie_Agroturismo = p_Id_Superficie_Agroturismo,
	    Modificado_Por = p_Modificado_Por,
	    Fecha_Modificacion = CURRENT_TIMESTAMP()
	    
	WHERE Id_Ficha = p_id_ficha AND Id_Productor = p_id_productor AND 
	Id_Ubicacion = p_id_ubicacion;
	
	UPDATE tbl_manejo_riego SET
	    Tiene_Riego = p_Tiene_Riego,
		 Id_Medida_Superficie_Riego= p_Medida_Riego,
	    Superficie_Riego = p_Superficie_Riego,
	    Id_Tipo_Riego = p_Id_Tipo_Riego,
	    Fuente_Agua = p_Fuente_Agua,
	    Disponibilidad_Agua_Meses = p_Disponibilidad_Agua_Meses
    
  WHERE Id_Ficha = p_id_ficha AND Id_Productor = p_id_productor AND 
  Id_Ubicacion = p_id_ubicacion;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarUsuario` (IN `p_Id_Usuario` BIGINT(20), IN `p_nombre_completo` VARCHAR(255), IN `p_correo` VARCHAR(255), IN `p_usuario` VARCHAR(255), IN `p_id_estado` BIGINT(20), IN `p_id_rol` INT)   BEGIN
    UPDATE usuario
    SET
        nombre_completo = p_nombre_completo,
        correo = p_correo,
        usuario = p_usuario,
        id_estado = p_id_estado,
        id_rol = p_id_rol
    WHERE
        Id_Usuario = p_Id_Usuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearUsuario` (IN `p_nombre_completo` VARCHAR(255), IN `p_correo` VARCHAR(255), IN `p_usuario` VARCHAR(255), IN `p_contrasena` VARCHAR(255), IN `p_id_rol` BIGINT, IN `p_estado` INT)   BEGIN
    -- Insertar el nuevo usuario
    INSERT INTO usuario (id_rol, nombre_completo, correo, usuario, contrasena, id_estado)
    VALUES (p_id_rol, p_nombre_completo, p_correo, p_usuario, p_contrasena, p_estado);
    
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `DuplicarFicha` (IN `p_id_ficha` INT)   BEGIN
    DECLARE nuevo_id INT;
    DECLARE nuevo_productor INT;
    DECLARE nueva_ubicacion INT;
    DECLARE p_id_productor INT;
    DECLARE p_id_ubicacion INT;

    SELECT MAX(id_ficha) INTO nuevo_id FROM fichas;
    
    -- Incrementa el nuevo ID
    SET nuevo_id = nuevo_id + 1;

    -- Obtener id_productor para el p_id_ficha dado
    SELECT id_productor INTO p_id_productor FROM tbl_productor WHERE id_ficha = p_id_ficha LIMIT 1;
    
     -- Obtener id_productor para el p_id_ficha dado
    SELECT id_ubicacion INTO p_id_ubicacion FROM tbl_ubicacion_productor 
	 WHERE id_ficha = p_id_ficha and id_productor = p_id_productor LIMIT 1;

    -- Insertar la nueva ficha
    INSERT INTO fichas (
        id_ficha,
        fecha_solicitud,
        anio_solicitud,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado,
        fecha_entrevista,
        nombre_encuentrador,
        nombre_encuestador,
        nombre_supervisor
    ) 
    SELECT
        nuevo_id,
        fecha_solicitud,
        anio_solicitud,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado,
        fecha_entrevista,
        nombre_encuentrador,
        nombre_encuestador,
        nombre_supervisor
    FROM fichas
    WHERE id_ficha = p_id_ficha;
    
    -- Insertar el nuevo registro en tbl_productor
    INSERT INTO tbl_productor (
        id_ficha,
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
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
    )
    SELECT 
        nuevo_id,
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
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
    FROM tbl_productor
    WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
    
    -- Obtener id_productor para el p_id_ficha dado
    SELECT id_productor INTO nuevo_productor FROM tbl_productor WHERE id_ficha = nuevo_id LIMIT 1;

    -- Insertar el nuevo registro en tbl_ubicacion_productor
    INSERT INTO tbl_ubicacion_productor (
        id_ficha,
        id_productor,
        Id_Departamento,
        Id_Municipio,
        Id_Aldea,
        Id_Cacerio,
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
    )
    SELECT
        nuevo_id,
        nuevo_productor,
        Id_Departamento,
        Id_Municipio,
        Id_Aldea,
        Id_Cacerio,
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
    FROM tbl_ubicacion_productor
    WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
    
     SELECT id_ubicacion INTO nueva_ubicacion FROM tbl_ubicacion_productor 
	 WHERE id_ficha = nuevo_id and id_productor = nuevo_productor LIMIT 1;
    
    
    INSERT INTO tbl_base_organizacion (
        id_ficha,
        id_productor,
        pertenece_a_organizacion,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
    )select
        nuevo_id,
        nuevo_productor,
        pertenece_a_organizacion,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
     FROM tbl_base_organizacion
    WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
    
    
    INSERT INTO tbl_organizaciones_por_productor(
        id_ficha,
        id_organizacion,
        id_productor,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion
    )SELECT
       nuevo_id,
        id_organizacion,
        nuevo_productor,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion
    FROM tbl_organizaciones_por_productor
    WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
    
    
    INSERT INTO tbl_composicion (
        id_ficha,
        id_productor,
        genero,
        edad,
        cantidad,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
    )SELECT
    		nuevo_id,
        nuevo_productor,
        genero,
        edad,
        cantidad,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
    FROM tbl_composicion
    WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
    
    INSERT INTO tbl_etnias_por_productor (
	    id_ficha,
	    id_productor,
	    id_etnia,
	    detalle_de_otros,
	    creado_por,
	    fecha_creacion,
	    estado
	  )select
	     nuevo_id,
        nuevo_productor,
        id_etnia,
	    detalle_de_otros,
	    creado_por,
	    fecha_creacion,
	    estado
	  FROM tbl_etnias_por_productor
    WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
    
    
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
        )select
            nuevo_id,
        		nuevo_productor,
            tendra_relevo,
            cuantos_relevos,
            descripcion,
            creado_por,
            fecha_creacion,
            modificado_por,
            fecha_modificacion
         FROM tbl_relevo_organizacion
    	WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
    	
    	INSERT INTO tbl_migracion_familiar (
        id_ficha,
        id_productor,
        tiene_migrantes,
        migracion_dentro_pais,
        migracion_fuera_pais,
        id_tipo_motivos,
        remesas,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
    )select
        nuevo_id,
        nuevo_productor,
        tiene_migrantes,
        migracion_dentro_pais,
        migracion_fuera_pais,
        id_tipo_motivos,
        remesas,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
    FROM tbl_migracion_familiar
    	WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
    	
    	
 INSERT INTO tbl_unidad_productora (
    Id_Ubicacion,
    Id_Ficha,
    Id_Productor,
    Tipo_De_Manejo,
    Id_Medida_Produccion,
    Superficie_Agricultura,
    Id_Medida_Agricultura,
    rubro_agricultura,
    Superficie_Ganaderia,
    Id_Medida_Ganaderia,
    rubro_ganaderia,
    Superficie_Apicultura,
    Id_Medida_Apicultura,
    Superficie_Forestal,
    Id_Medida_Forestal,
    rubro_forestal,
    Id_Superficie_Acuacultura,
    Superficie_Acuacultura,
    Numero_Estanques,
    Id_Superficie_Agroturismo,
    Superficie_Agroturismo,
    Otros_Descripcion,
    Creado_Por,
    Fecha_Creacion,
    Modificado_Por,
    Fecha_Modificacion,
    estado
) select
	    nueva_ubicacion,
	    nuevo_id,
       nuevo_productor,
	    Tipo_De_Manejo,
	    Id_Medida_Produccion,
	    Superficie_Agricultura,
	    Id_Medida_Agricultura,
	    rubro_agricultura,
	    Superficie_Ganaderia,
	    Id_Medida_Ganaderia,
	    rubro_ganaderia,
	    Superficie_Apicultura,
	    Id_Medida_Apicultura,
	    Superficie_Forestal,
	    Id_Medida_Forestal,
	    rubro_forestal,
    	 Id_Superficie_Acuacultura,
    	 Superficie_Acuacultura,
	    Numero_Estanques,
	    Id_Superficie_Agroturismo,
	    Superficie_Agroturismo,
	    Otros_Descripcion,
	    Creado_Por,
	    Fecha_Creacion,
	    Modificado_Por,
	    Fecha_Modificacion,
	    estado
	    FROM tbl_unidad_productora
    	WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor AND id_ubicacion = p_id_ubicacion;
    	

		INSERT INTO tbl_manejo_riego (
		    Id_Ficha,
		    Id_Ubicacion,
		    Id_Productor,
		    Tiene_Riego,
		    Superficie_Riego,
		    Id_Medida_Superficie_Riego,
		    Id_Tipo_Riego,
		    Fuente_Agua,
		    Disponibilidad_Agua_Meses,
		    Descripcion,
		    Creado_Por,
		    Fecha_Creacion,
		    Modificado_Por,
		    Fecha_Modificacion,
		    Estado
		  ) SELECT
	    	 nuevo_id,
	    	 nueva_ubicacion,
       	 nuevo_productor,
		    Tiene_Riego,
		    Superficie_Riego,
		    Id_Medida_Superficie_Riego,
		    Id_Tipo_Riego,
		    Fuente_Agua,
		    Disponibilidad_Agua_Meses,
		    Descripcion,
		    Creado_Por,
		    Fecha_Creacion,
		    Modificado_Por,
		    Fecha_Modificacion,
		    Estado
		FROM tbl_manejo_riego
    	WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor AND id_ubicacion = p_id_ubicacion;
    	
    	INSERT INTO tbl_produccion_agricola_anterior (
        Id_Ubicacion,
        Id_Ficha,
        Id_Productor,
        Id_Tipo_Cultivo,
        Superficie_Primera_Postrera,
        Id_Medida_Primera_Postrera,
        Produccion_Obtenida,
        Id_Medida_Produccion_Obtenida,
        Cantidad_Vendida,
        Id_Medida_Vendida,
        Precio_Venta,
        A_Quien_Se_Vendio,
        Creado_Por,
        Fecha_Creacion,
        Modificado_Por,
        Fecha_Modificacion,
        estado
    )SELECT
    		nueva_ubicacion,
    		nuevo_id,
       	nuevo_productor,
        Id_Tipo_Cultivo,
        Superficie_Primera_Postrera,
        Id_Medida_Primera_Postrera,
        Produccion_Obtenida,
        Id_Medida_Produccion_Obtenida,
        Cantidad_Vendida,
        Id_Medida_Vendida,
        Precio_Venta,
        A_Quien_Se_Vendio,
        Creado_Por,
        Fecha_Creacion,
        Modificado_Por,
        Fecha_Modificacion,
        estado
    FROM tbl_produccion_agricola_anterior
    	WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor AND id_ubicacion = p_id_ubicacion;
    	
    	INSERT INTO tbl_produccion_pecuaria (
        Id_Ficha,
        Id_Ubicacion,
        Id_Productor,
        Año_Produccion,
        Id_Tipo_Pecuario,
        Cantidad_Hembras,
        Cantidad_Machos,
        Cantidad_Total,
        Descripcion_Otros,
        Descripcion,
        Creado_Por,
        Fecha_Creacion,
        Modificado_Por,
        Fecha_Modificacion,
        Estado
    )SELECT
    		nuevo_id,
    		nueva_ubicacion,
       	nuevo_productor,
        Año_Produccion,
        Id_Tipo_Pecuario,
        Cantidad_Hembras,
        Cantidad_Machos,
        Cantidad_Total,
        Descripcion_Otros,
        Descripcion,
        Creado_Por,
        Fecha_Creacion,
        Modificado_Por,
        Fecha_Modificacion,
        Estado
		FROM tbl_produccion_pecuaria
    	WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor AND id_ubicacion = p_id_ubicacion;
    	
    	
    	INSERT INTO tbl_venta_pecuario (
			 Id_ficha,
			Id_productor,
			Tipo_pecurio,
			Precio_venta,
			Unidad_medida,
			Mercado,
			Creado_Por,
			Fecha_creacion,
			Actualizado_por,
			Fecha_Actualizacion,
			Estado
		 )SELECT 
		 	nuevo_id,
       	nuevo_productor,
			Tipo_pecurio,
			Precio_venta,
			Unidad_medida,
			Mercado,
			Creado_Por,
			Fecha_creacion,
			Actualizado_por,
			Fecha_Actualizacion,
			Estado
		FROM tbl_venta_pecuario
    	WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
    	
		 
    	INSERT INTO tbl_produccion_comercializacion (
        Id_Ficha,
        Id_Ubicacion,
        Id_Productor,
        Id_Tipo_Produccion,
        Id_Medida_Produccion,
        Cantidad_Vendida,
        Id_Medida_Venta,
        Precio_Venta,
        A_Quien_Se_Vendio,
        Creado_Por,
      	Fecha_Creacion,
        Modificado_Por,
        Fecha_Modificacion,
        estado
    )SELECT
    	   nuevo_id,
    		nueva_ubicacion,
       	nuevo_productor,
        Id_Tipo_Produccion,
        Id_Medida_Produccion,
        Cantidad_Vendida,
        Id_Medida_Venta,
        Precio_Venta,
        A_Quien_Se_Vendio,
        Creado_Por,
      	Fecha_Creacion,
        Modificado_Por,
        Fecha_Modificacion,
        estado
    FROM tbl_produccion_comercializacion
    	WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor AND id_ubicacion = p_id_ubicacion;
    	
    	 INSERT INTO tbl_ingreso_familiar (
        Id_Ficha,
        Id_Productor,
        Id_Tipo_Negocio,
        Total_Ingreso,
        Id_Periodo_Ingreso,
        Descripcion_Otros,
        Descripcion,
        Creado_Por,
        Fecha_Creacion,
        Modificado_Por,
        Fecha_Modificacion,
        estado
    )SELECT
        nuevo_id,
       	nuevo_productor,
        Id_Tipo_Negocio,
        Total_Ingreso,
        Id_Periodo_Ingreso,
        Descripcion_Otros,
        Descripcion,
        Creado_Por,
        Fecha_Creacion,
        Modificado_Por,
        Fecha_Modificacion,
        estado
    	FROM tbl_ingreso_familiar
    	WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
    	
    	INSERT INTO tbl_credito_produccion (
        id_ficha,
        id_productor,
        ha_solicitado_creditos,
        id_fuente_credito,
        monto_credito,
        id_motivos_no_credito,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
    )SELECT
        nuevo_id,
       	nuevo_productor,
        ha_solicitado_creditos,
        id_fuente_credito,
        monto_credito,
        id_motivos_no_credito,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
   FROM tbl_credito_produccion
   WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
    	
   INSERT INTO tbl_productor_actividad_externa(
		id_ficha, 
		id_productor,
		miembros_realizan_actividades_fuera_finca,
		cuantos_miembros,
		trabajadores_temporales,
		trabajadores_permanentes,
	   id_tomador_decisiones,
		creado_por
	)SELECT
		nuevo_id,
      nuevo_productor,
		miembros_realizan_actividades_fuera_finca,
		cuantos_miembros,
		trabajadores_temporales,
		trabajadores_permanentes,
	   id_tomador_decisiones,
		creado_por
	FROM tbl_productor_actividad_externa
   WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
	
	
	INSERT INTO tbl_practicas_por_produccion (
        Id_Ficha,
        Id_Productor,
        Id_Tipo_Practica,
        Descripcion,
        Id_Usuario,
        Creado_Por,
        Fecha_Creacion,
        Modificado_Por,
        Fecha_Modificacion,
        estado
    )SELECT
        	nuevo_id,
         nuevo_productor,
        Id_Tipo_Practica,
        Descripcion,
        Id_Usuario,
        Creado_Por,
        Fecha_Creacion,
        Modificado_Por,
        Fecha_Modificacion,
        estado
 	FROM tbl_practicas_por_produccion
   WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
   
   
   INSERT INTO tbl_apoyo_actividad_externa (
        id_ficha,
        id_productor,
        recibe_apoyo_prodagrícola,
        atencion_por_UAG,
        productos_vendidospor_pralesc,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
    )SELECT
        nuevo_id,
         nuevo_productor,
         recibe_apoyo_prodagrícola,
        atencion_por_UAG,
        productos_vendidospor_pralesc,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
  	FROM tbl_apoyo_actividad_externa
   WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
   
   INSERT INTO tbl_apoyo_tipo_organizacion (
   	  id_ficha,
        id_productor,
        id_tipo_organizacion,creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
   )SELECT
        nuevo_id,
         nuevo_productor,
        id_tipo_organizacion,creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
	FROM tbl_apoyo_tipo_organizacion
   WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
   
   INSERT INTO tbl_apoyos_produccion (
        id_ficha,
        id_productor,
        id_apoyo_produccion,
        otros_detalles,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
    )SELECT
        nuevo_id,
         nuevo_productor,
        id_apoyo_produccion,
        otros_detalles,
        descripcion,
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
	FROM tbl_apoyos_produccion
   WHERE id_ficha = p_id_ficha AND id_productor = p_id_productor;
   
		
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarRiego` (IN `id_tipo_riego_param` INT, IN `tipo_riego_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `estado_param` ENUM('ACTIVO','INACTIVO'))   BEGIN
  UPDATE `tbl_tipo_riego`
  SET
    `tipo_riego` = tipo_riego_param,
    `descripcion` = descripcion_param,
    `estado` = estado_param,
    `fecha_modificacion` = CURRENT_TIMESTAMP
  WHERE `id_tipo_riego` = id_tipo_riego_param;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarActividadExterna` (IN `p_Id_ActividadExterna` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_productor_actividad_externa
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_productor_actividad_externa
        WHERE id_actividad_ext = p_Id_ActividadExterna
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_productor_actividad_externa';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_productor_actividad_externa`
        WHERE `id_actividad_ext` = p_Id_ActividadExterna;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarAldea` (IN `p_Id_Aldea` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_aldeas
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_aldeas
        WHERE Id_Aldea = p_Id_Aldea
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_aldeas';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_aldeas`
        WHERE `Id_Aldea` = p_Id_Aldea;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarApoyo` (IN `id_apoyo_produccion_param` INT(11))   BEGIN
  DELETE FROM  tbl_apoyos WHERE id_apoyo_produccion = id_apoyo_produccion_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarApoyoActividadExterna` (IN `p_Id_Apoyo_Externo` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_apoyo_actividad_externa
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_apoyo_actividad_externa
        WHERE id_apoyo_ext = p_Id_Apoyo_Externo
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_apoyo_actividad_externa';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_apoyo_actividad_externa`
        WHERE `id_apoyo_ext` = p_Id_Apoyo_Externo;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarApoyoProduccion` (IN `p_Id_Apoyo_Produccion` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_apoyos_produccion
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_apoyos_produccion
        WHERE id_apoyo_prod = p_Id_Apoyo_Produccion
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_apoyos_produccion';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_apoyos_produccion`
        WHERE `id_apoyo_prod` = p_Id_Apoyo_Produccion;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarBaseOrganizacion` (IN `p_Id_Pertenece_Organizacion` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_base_organizacion
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_base_organizacion
        WHERE id_pertenece_organizacion = p_Id_Pertenece_Organizacion
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_base_organizacion';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_base_organizacion`
        WHERE `id_pertenece_organizacion` = p_Id_Pertenece_Organizacion;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCacerio` (IN `newId_Cacerio` BIGINT(20))   BEGIN
     DELETE FROM tbl_cacerios WHERE Id_Cacerio = newId_Cacerio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCreditoProduccion` (IN `p_Id_CreditoProduccion` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_credito_produccion
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_credito_produccion
        WHERE id_credpro = p_Id_CreditoProduccion
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_credito_produccion';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_credito_produccion`
        WHERE `id_credpro` = p_Id_CreditoProduccion;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCultivo` (IN `id_tipo_cultivo_parm` INT(20))   BEGIN
    DELETE FROM tbl_tipo_cultivo WHERE id_tipo_cultivo = id_tipo_cultivo_parm;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDepartamento` (IN `Id_Departamento_parm` INT(20))   BEGIN
    DELETE FROM tbl_departamentos WHERE Id_Departamento = Id_Departamento_parm;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarEtnia` (IN `p_id_etnia` BIGINT)   BEGIN
    -- Eliminar la fila de la tabla
    DELETE FROM tbl_etnias
    WHERE id_etnia = p_id_etnia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarFicha` (IN `p_Id_Ficha` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla fichas
    IF NOT EXISTS (
        SELECT 1
        FROM fichas
        WHERE id_ficha = p_Id_Ficha
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla fichas';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `fichas`
        WHERE `id_ficha` = p_Id_Ficha;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarFuenteCredito` (IN `p_id_fuente_credito` BIGINT)   BEGIN
    DELETE FROM tbl_fuentes_credito
    WHERE id_fuente_credito = p_id_fuente_credito;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarIngresoFamiliar` (IN `p_Id_Ingreso_Familiar` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_ingreso_familiar
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_ingreso_familiar
        WHERE Id_Ingreso_Familiar = p_Id_Ingreso_Familiar
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_ingreso_familiar';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_ingreso_familiar`
        WHERE `Id_Ingreso_Familiar` = p_Id_Ingreso_Familiar;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarManejoRiego` (IN `p_Id_Manejo_Riego` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_manejo_riego
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_manejo_riego
        WHERE Id_Manejo_Riego = p_Id_Manejo_Riego
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_manejo_riego';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_manejo_riego`
        WHERE `Id_Manejo_Riego` = p_Id_Manejo_Riego;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMedidaTierra` (IN `id_medida_param` INT(11))   BEGIN
  DELETE FROM tbl_medidas_tierra WHERE id_medida = id_medida_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMigracionFamiliar` (IN `p_Id_Migracion` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_migracion_familiar
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_migracion_familiar
        WHERE id_migracion = p_Id_Migracion
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_migracion_familiar';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_migracion_familiar`
        WHERE `id_migracion` = p_Id_Migracion;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMONCRED` (IN `id_motivos_no_credito_parm` INT(20))   BEGIN
    DELETE FROM  tbl_motivos_no_creditos WHERE id_motivos_no_credito = id_motivos_no_credito_parm;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMotivo` (IN `id_motivo_param` INT)   BEGIN
  DELETE FROM `tbl_motivos_migracion`
  WHERE `Id_motivo` = id_motivo_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMunicipio` (IN `newId_Municipio` BIGINT(20))   BEGIN
     DELETE FROM tbl_municipios WHERE Id_Municipio = newId_Municipio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarNoCredito` (IN `p_Id_NoCredito` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_no_creditos
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_no_creditos
        WHERE id_nocred = p_Id_NoCredito
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_no_creditos';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_no_creditos`
        WHERE `id_nocred` = p_Id_NoCredito;
    END IF;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPracticaProduccion` (IN `Id_Practica_Produccion_param` BIGINT)   BEGIN
    DELETE FROM `tbl_practicas_por_produccion`
    WHERE `Id_Practica_Produccion` = Id_Practica_Produccion_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPracticas` (IN `id_tipo_practica_parm` INT(20))   BEGIN
    DELETE FROM tbl_tipo_practicas_productivas WHERE id_tipo_practica = id_tipo_practica_parm;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProduccionAgricolaAnterior` (IN `p_Id_Produccion_Anterior` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_produccion_agricola_anterior
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_produccion_agricola_anterior
        WHERE Id_Produccion_Anterior = p_Id_Produccion_Anterior
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_produccion_agricola_anterior';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_produccion_agricola_anterior`
        WHERE `Id_Produccion_Anterior` = p_Id_Produccion_Anterior;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProduccionComercializacion` (IN `p_Id_Produccion_Comercio` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_produccion_comercializacion
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_produccion_comercializacion
        WHERE Id_Produccion_Comercio = p_Id_Produccion_Comercio
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_produccion_comercializacion';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_produccion_comercializacion`
        WHERE `Id_Produccion_Comercio` = p_Id_Produccion_Comercio;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProduccionPecuaria` (IN `p_Id_Produccion_Pecuaria` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_produccion_pecuaria
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_produccion_pecuaria
        WHERE Id_Produccion_Pecuaria = p_Id_Produccion_Pecuaria
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_produccion_pecuaria';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_produccion_pecuaria`
        WHERE `Id_Produccion_Pecuaria` = p_Id_Produccion_Pecuaria;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProduccionVendida` (IN `p_Id_Produccion_Vendida` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_produccion_vendida
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_produccion_vendida
        WHERE Id_Produccion_Vendida = p_Id_Produccion_Vendida
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_produccion_vendida';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_produccion_vendida`
        WHERE `Id_Produccion_Vendida` = p_Id_Produccion_Vendida;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarRiego` (IN `id_tipo_riego_parm` INT(20))   BEGIN
    DELETE FROM tbl_tipo_riego WHERE id_tipo_riego = id_tipo_riego_parm;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTipoApoyo` (IN `id_tipo_apoyos_param` INT(11))   BEGIN
  DELETE FROM  tbl_tipos_apoyos WHERE id_tipo_apoyos = id_tipo_apoyos_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTipoApoyoProduccion` (IN `p_Id_TipoApoyoProduccion` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_tipos_apoyo_produccion
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_tipos_apoyo_produccion
        WHERE id_apoyo_produccion = p_Id_TipoApoyoProduccion
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_tipos_apoyo_produccion';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_tipos_apoyo_produccion`
        WHERE `id_apoyo_produccion` = p_Id_TipoApoyoProduccion;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTipoPecuario` (IN `id_tipo_pecuario_param` BIGINT)   BEGIN
    DELETE FROM `tbl_tipo_pecuarios`
    WHERE `id_tipo_pecuario` = id_tipo_pecuario_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTipoProduccion` (IN `p_id_tipo_produccion` BIGINT)   BEGIN
    DELETE FROM tbl_tipo_produccion
    WHERE id_tipo_produccion = p_id_tipo_produccion;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTrabajadorExterno` (IN `p_Id_TrabajadorExterno` BIGINT)   BEGIN
    -- Verificar si el registro a eliminar existe en la tabla tbl_trabajadores_externos
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_trabajadores_externos
        WHERE id_trabajador_ext = p_Id_TrabajadorExterno
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a eliminar no existe en la tabla tbl_trabajadores_externos';
    ELSE
        -- Realizar la eliminación
        DELETE FROM `tbl_trabajadores_externos`
        WHERE `id_trabajador_ext` = p_Id_TrabajadorExterno;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarUsuario` (IN `p_id_usuario` BIGINT)   BEGIN
    DELETE FROM usuario WHERE Id_Usuario = p_id_usuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarActividadExterna` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Miembros_Actividades_Fuera_Finca` ENUM('S','N'), IN `p_Id_Tomador_Decisiones` BIGINT, IN `p_Descripcion` TEXT, IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_productor_actividad_externa` (
        `id_ficha`,
        `id_productor`,
        `miembros_realizan_actividades_fuera_finca`,
        `id_tomador_decisiones`,
        `descripcion`,
        `creado_por`,
        `fecha_creacion`,
        `modificado_por`,
        `fecha_modificacion`,
        `estado`
    ) 
    VALUES (
        p_Id_Ficha,
        p_Id_Productor,
        p_Miembros_Actividades_Fuera_Finca,
        p_Id_Tomador_Decisiones,
        p_Descripcion,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAldea` (IN `p_Id_Departamento` BIGINT, IN `p_Id_Municipio` BIGINT, IN `p_Nombre_Aldea` VARCHAR(100), IN `p_Descripcion` VARCHAR(255), IN `p_Creado_Por` VARCHAR(50))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_aldeas` (
        `Id_Departamento`,
        `Id_Municipio`,
        `Nombre_Aldea`,
        `Descripcion`,
        `Estado`,
        `Creado_Por`,
        `Fecha_Creacion`,
        `Modificado_Por`,
        `Fecha_Modificacion`
    ) 
    VALUES (
        p_Id_Departamento,
        p_Id_Municipio,
        p_Nombre_Aldea,
        p_Descripcion,
        'A',
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarApoyo` (IN `p_tipo_apoyo_produccion` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(255))   BEGIN
    INSERT INTO tbl_apoyos (tipo_apoyo_produccion, descripcion, creado_por, estado)
    VALUES (p_tipo_apoyo_produccion, p_descripcion, p_creado_por, 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarApoyoActividadExterna` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Recibe_Apoyo_Produccion_Agricola` ENUM('S','N'), IN `p_Atencion_Por_UAG` ENUM('S','N'), IN `p_Productos_Vendidos_Por_Pralesc` ENUM('S','N'), IN `p_Descripcion` TEXT, IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_apoyo_actividad_externa` (
        `id_ficha`,
        `id_productor`,
        `recibe_apoyo_prodagrícola`,
        `atencion_por_UAG`,
        `productos_vendidospor_pralesc`,
        `descripcion`,
        `creado_por`,
        `fecha_creacion`,
        `modificado_por`,
        `fecha_modificacion`,
        `estado`
    ) 
    VALUES (
        p_Id_Ficha,
        p_Id_Productor,
        p_Recibe_Apoyo_Produccion_Agricola,
        p_Atencion_Por_UAG,
        p_Productos_Vendidos_Por_Pralesc,
        p_Descripcion,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarApoyoProduccion` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Id_Apoyo_Produccion` BIGINT, IN `p_Otros_Detalles` TEXT, IN `p_Descripcion` TEXT, IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_apoyos_produccion` (
        `id_ficha`,
        `id_productor`,
        `id_apoyo_produccion`,
        `otros_detalles`,
        `descripcion`,
        `creado_por`,
        `fecha_creacion`,
        `modificado_por`,
        `fecha_modificacion`,
        `estado`
    ) 
    VALUES (
        p_Id_Ficha,
        p_Id_Productor,
        p_Id_Apoyo_Produccion,
        p_Otros_Detalles,
        p_Descripcion,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarBaseOrganizacion` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Pertenece_A_Organizacion` ENUM('S','N'), IN `p_Descripcion` TEXT, IN `p_Creado_Por` VARCHAR(50))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_base_organizacion` (
        `id_ficha`,
        `id_productor`,
        `pertenece_a_organizacion`,
        `descripcion`,
        `creado_por`,
        `fecha_creacion`,
        `modificado_por`,
        `fecha_modificacion`,
        `estado`
    ) 
    VALUES (
        p_Id_Ficha,
        p_Id_Productor,
        p_Pertenece_A_Organizacion,
        p_Descripcion,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCacerio` (IN `p_Id_Aldea` BIGINT, IN `p_Id_Municipio` BIGINT, IN `p_Id_Departamento` BIGINT, IN `p_Nombre_Cacerio` VARCHAR(100), IN `p_Descripcion` VARCHAR(255), IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_cacerios` (
        `Id_Aldea`,
        `Id_Municipio`,
        `Id_Departamento`,
        `Nombre_Cacerio`,
        `Descripcion`,
        `Estado`,
        `Creado_Por`,
        `Fecha_Creacion`,
        `Modificado_Por`,
        `Fecha_Modificacion`
    ) 
    VALUES (
        p_Id_Aldea,
        p_Id_Municipio,
        p_Id_Departamento,
        p_Nombre_Cacerio,
        p_Descripcion,
        'A',
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarComposicion` (IN `p_id_ficha` INT, IN `p_id_productor` INT, IN `p_genero` ENUM('Hombre','Mujer'), IN `p_edad` VARCHAR(10), IN `p_cantidad` INT, IN `p_creado_por` VARCHAR(25))   BEGIN
    -- Realizar la inserción
    INSERT INTO tbl_composicion (
        id_ficha,
        id_productor,
        genero,
        edad,
        cantidad,
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
        p_cantidad,
        p_creado_por,
        CURRENT_TIMESTAMP(),
        NULL,
        CURRENT_TIMESTAMP(),
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCreditoProduccion` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Ha_Solicitado_Creditos` ENUM('S','N'), IN `p_Id_Fuente_Credito` BIGINT, IN `p_Monto_Credito` DECIMAL(10,2), IN `p_Id_Motivos_No_Credito` BIGINT, IN `p_Descripcion` TEXT, IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_credito_produccion` (
        `id_ficha`,
        `id_productor`,
        `ha_solicitado_creditos`,
        `id_fuente_credito`,
        `monto_credito`,
        `id_motivos_no_credito`,
        `descripcion`,
        `creado_por`,
        `fecha_creacion`,
        `modificado_por`,
        `fecha_modificacion`,
        `estado`
    ) 
    VALUES (
        p_Id_Ficha,
        p_Id_Productor,
        p_Ha_Solicitado_Creditos,
        p_Id_Fuente_Credito,
        p_Monto_Credito,
        p_Id_Motivos_No_Credito,
        p_Descripcion,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCultivo` (IN `tipo_cultivo_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_cultivo` (`tipo_cultivo`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_cultivo_param, descripcion_param, 'Manuel', 'Manuel', 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDepartamento` (IN `p_Nombre_Departamento` VARCHAR(100), IN `p_Descripcion` VARCHAR(255), IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_departamentos` (
        `Nombre_Departamento`,
        `Descripcion`,
        `Creado_Por`,
        `Fecha_Creacion`,
        `Modificado_Por`,
        `Fecha_Modificacion`,
        `Estado`
    ) 
    VALUES (
        p_Nombre_Departamento,
        p_Descripcion,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEtnia` (IN `p_etnia` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(255))   BEGIN
    -- Insertar datos en la tabla
    INSERT INTO tbl_etnias (etnia, descripcion, creado_por, fecha_creacion, estado)
    VALUES (p_etnia, p_descripcion, p_creado_por, CURRENT_TIMESTAMP(), 'A');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEtniaProductor` (IN `p_id_ficha` INT, IN `p_id_productor` INT, IN `p_id_etnia` BIGINT(20), IN `p_detalle` INT, IN `p_creado_por` VARCHAR(50))   BEGIN

  INSERT INTO tbl_etnias_por_productor (
    id_ficha,
    id_productor,
    id_etnia,
    detalle_de_otros,
    creado_por,
    fecha_creacion,
    estado
  ) VALUES (
    p_id_ficha,
    p_id_productor,
    p_id_etnia,
    p_detalle,
    p_creado_por,
    CURRENT_TIMESTAMP(),
    'A'
  );
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarFicha` (IN `p_idFicha` INT, IN `p_Fecha_Solicitud` DATE, IN `p_Anio_Solicitud` INT, IN `p_Descripcion` VARCHAR(255), IN `p_Creado_Por` VARCHAR(50), IN `p_Fecha_Entrevista` DATE, IN `p_Nombre_Encuentrador` VARCHAR(50), IN `p_Nombre_Encuestador` VARCHAR(50), IN `p_Nombre_Supervisor` VARCHAR(50))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `fichas` (
    		id_ficha,
        `fecha_solicitud`,
        `anio_solicitud`,
        `descripcion`,
        `creado_por`,
        `fecha_creacion`,
        `modificado_por`,
        `fecha_modificacion`,
        `estado`,
        `fecha_entrevista`,
        `nombre_encuentrador`,
        `nombre_encuestador`,
        `nombre_supervisor`
    ) 
    VALUES (
    	  p_idFicha,
        p_Fecha_Solicitud,
        p_Anio_Solicitud,
        p_Descripcion,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A',
        p_Fecha_Entrevista,
        p_Nombre_Encuentrador,
        p_Nombre_Encuestador,
        p_Nombre_Supervisor
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarfichaformulario` (IN `p_fecha_solicitud` DATE, IN `p_anio_solicitud` INT, IN `p_descripcion` VARCHAR(255), IN `p_fecha_entrevista` DATE, IN `p_nombre_encuestador` VARCHAR(50), IN `p_nombre_encuestado` VARCHAR(50), IN `p_nombre_supervisor` VARCHAR(50), IN `p_creado_por` VARCHAR(50))   BEGIN
    DECLARE p_estado ENUM('A', 'I');
    
    -- Asignar automáticamente el estado
    SET p_estado = 'A';

    -- Insertar datos en la tabla
    INSERT INTO fichas (
        fecha_solicitud,
        anio_solicitud,
        descripcion,
        creado_por,
        fecha_creacion,
        estado,
        fecha_entrevista,
        nombre_encuentrador,
        nombre_encuestador,
        nombre_supervisor
    ) VALUES (
        p_fecha_solicitud,
        p_anio_solicitud,
        p_descripcion,
        p_creado_por,
        CURRENT_TIMESTAMP(),
        p_estado,
        p_fecha_entrevista,
        p_nombre_encuestador,
        p_nombre_encuestado,
        p_nombre_supervisor
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarFuenteCredito` (IN `p_fuente_credito` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(255))   BEGIN
    INSERT INTO tbl_fuentes_credito (fuente_credito, descripcion, creado_por, estado)
    VALUES (p_fuente_credito, p_descripcion, p_creado_por, 'A');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarIngresoFamiliar` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Id_Tipo_Negocio` BIGINT, IN `p_Total_Ingreso` DECIMAL(10,2), IN `p_Id_Periodo_Ingreso` BIGINT, IN `p_Descripcion_Otros` VARCHAR(255), IN `p_Descripcion` VARCHAR(255), IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_ingreso_familiar` (
        `Id_Ficha`,
        `Id_Productor`,
        `Id_Tipo_Negocio`,
        `Total_Ingreso`,
        `Id_Periodo_Ingreso`,
        `Descripcion_Otros`,
        `Descripcion`,
        `Creado_Por`,
        `Fecha_Creacion`,
        `Modificado_Por`,
        `Fecha_Modificacion`,
        `estado`
    ) 
    VALUES (
        p_Id_Ficha,
        p_Id_Productor,
        p_Id_Tipo_Negocio,
        p_Total_Ingreso,
        p_Id_Periodo_Ingreso,
        p_Descripcion_Otros,
        p_Descripcion,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarManejoRiego` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Ubicacion` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Tiene_Riego` ENUM('S','N'), IN `p_Superficie_Riego` DECIMAL(10,2), IN `p_Id_Medida_Superficie_Riego` BIGINT, IN `p_Id_Tipo_Riego` BIGINT, IN `p_Fuente_Agua` VARCHAR(255), IN `p_Disponibilidad_Agua_Meses` INT, IN `p_Descripcion` VARCHAR(255), IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Verificar si el Id_Productor existe en la tabla tbl_productor
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_productor
        WHERE id_ficha = p_Id_Ficha AND id_productor = p_Id_Productor
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El Id_Productor no existe en la tabla tbl_productor';
    ELSE
        -- Realizar la inserción
        INSERT INTO `tbl_manejo_riego` (
            `Id_Ficha`,
            `Id_Ubicacion`,
            `Id_Productor`,
            `Tiene_Riego`,
            `Superficie_Riego`,
            `Id_Medida_Superficie_Riego`,
            `Id_Tipo_Riego`,
            `Fuente_Agua`,
            `Disponibilidad_Agua_Meses`,
            `Descripcion`,
            `Creado_Por`,
            `Fecha_Creacion`,
            `Modificado_Por`,
            `Fecha_Modificacion`,
            `Estado`
        ) VALUES (
            p_Id_Ficha,
            p_Id_Ubicacion,
            p_Id_Productor,
            p_Tiene_Riego,
            p_Superficie_Riego,
            p_Id_Medida_Superficie_Riego,
            p_Id_Tipo_Riego,
            p_Fuente_Agua,
            p_Disponibilidad_Agua_Meses,
            p_Descripcion,
            p_Creado_Por,
            CURRENT_TIMESTAMP(),
            NULL,
            CURRENT_TIMESTAMP(),
            'A'
        );
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMedidaTierra` (IN `p_medida` VARCHAR(25), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(255))   BEGIN
    INSERT INTO tbl_medidas_tierra (medida, descripcion, creado_por, estado)
    VALUES (p_medida, p_descripcion, p_creado_por, 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMigracionFamiliar` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Tiene_Migrantes` ENUM('S','N'), IN `p_Migracion_Dentro_Pais` ENUM('S','N'), IN `p_Migracion_Fuera_Pais` ENUM('S','N'), IN `p_Id_Tipo_Motivos` BIGINT, IN `p_Remesas` ENUM('S','N'), IN `p_Descripcion` TEXT, IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_migracion_familiar` (
        `id_ficha`,
        `id_productor`,
        `tiene_migrantes`,
        `migracion_dentro_pais`,
        `migracion_fuera_pais`,
        `id_tipo_motivos`,
        `remesas`,
        `descripcion`,
        `creado_por`,
        `fecha_creacion`,
        `modificado_por`,
        `fecha_modificacion`,
        `estado`
    ) 
    VALUES (
        p_Id_Ficha,
        p_Id_Productor,
        p_Tiene_Migrantes,
        p_Migracion_Dentro_Pais,
        p_Migracion_Fuera_Pais,
        p_Id_Tipo_Motivos,
        p_Remesas,
        p_Descripcion,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMotivoMigracion` (IN `p_motivo` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(255))   BEGIN
    INSERT INTO tbl_motivos_migracion (Motivo, Descripcion, Creado_por, Estado)
    VALUES (p_motivo, p_descripcion, p_creado_por, 'A');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMotivoNoCredito` (IN `motivo_no_credito_param` VARCHAR(255), IN `descripcion_param` TEXT, IN `creado_por_param` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha actual en el servidor
    INSERT INTO `tbl_motivos_no_creditos` (
        `motivo_no_credito`,
        `descripcion`,
        `creado_por`,
        `fecha_creacion`,
        `modificado_por`,
        `fecha_modificacion`,
        `estado`
    ) 
    VALUES (
        motivo_no_credito_param,
        descripcion_param,
        creado_por_param,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMunicipio` (IN `p_Id_Departamento` BIGINT, IN `p_Nombre_Municipio` VARCHAR(100), IN `p_Descripcion` VARCHAR(255), IN `p_Creado_Por` VARCHAR(100))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_municipios` (
        `Id_Departamento`,
        `Nombre_Municipio`,
        `Descripcion`,
        `Creado_Por`,
        `Fecha_Creacion`,
        `Modificado_Por`,
        `Fecha_Modificacion`,
        `Estado`
    ) 
    VALUES (
        p_Id_Departamento,
        p_Nombre_Municipio,
        p_Descripcion,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarNoCredito` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Id_Motivos_No_Credito` BIGINT, IN `p_Descripcion` TEXT, IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_no_creditos` (
        `id_ficha`,
        `id_productor`,
        `id_motivos_no_credito`,
        `descripcion`,
        `creado_por`,
        `fecha_creacion`,
        `modificado_por`,
        `fecha_modificacion`,
        `estado`
    ) 
    VALUES (
        p_Id_Ficha,
        p_Id_Productor,
        p_Id_Motivos_No_Credito,
        p_Descripcion,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarOrganizacion` (IN `p_organizacion` VARCHAR(255), IN `p_id_tipo_organizacion` BIGINT, IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(255))   BEGIN
    INSERT INTO tbl_organizaciones (organizacion, id_tipo_organizacion, descripcion, creado_por, estado)
    VALUES (p_organizacion, p_id_tipo_organizacion, p_descripcion, p_creado_por, 'A');
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPeriodicidad` (IN `p_periodo` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(255))   BEGIN
    INSERT INTO tbl_periodicidad (periodo, descripcion, creado_por, estado)
    VALUES (p_periodo, p_descripcion, p_creado_por, 'A');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPracticaProduccion` (IN `Id_Ficha_param` BIGINT, IN `Id_Productor_param` BIGINT, IN `Id_Tipo_Practica_param` BIGINT, IN `Descripcion_param` TEXT, IN `Creado_Por_param` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_practicas_por_produccion` (
        `Id_Ficha`,
        `Id_Productor`,
        `Id_Tipo_Practica`,
        `Descripcion`,
        `Id_Usuario`,
        `Creado_Por`,
        `Fecha_Creacion`,
        `Modificado_Por`,
        `Fecha_Modificacion`,
        `estado`
    ) 
    VALUES (
        Id_Ficha_param,
        Id_Productor_param,
        Id_Tipo_Practica_param,
        Descripcion_param,
        NULL, -- Configura Id_Usuario como NULL
        Creado_Por_param,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPregunta` (IN `p_pregunta` VARCHAR(255), IN `p_creador_por` VARCHAR(40), IN `p_actualizado_por` VARCHAR(40))   BEGIN
    INSERT INTO preguntas (Pregunta, Creador_Por, Fecha_Creacion, Actualizado_Por, Fecha_Actualizacion, estado)
    VALUES (p_pregunta, p_creador_por, CURRENT_TIMESTAMP, p_actualizado_por, CURRENT_TIMESTAMP, 'A');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProduccionAgricolaAnterior` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Ubicacion` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Id_Tipo_Cultivo` BIGINT, IN `p_Superficie_Primera_Postrera` DECIMAL(10,2), IN `p_Id_Medida_Primera_Postrera` BIGINT, IN `p_Produccion_Obtenida` DECIMAL(10,2), IN `p_Id_Medida_Produccion_Obtenida` BIGINT, IN `p_Cantidad_Vendida` DECIMAL(10,2), IN `p_Id_Medida_Vendida` BIGINT, IN `p_Precio_Venta` DECIMAL(10,2), IN `p_A_Quien_Se_Vendio` VARCHAR(255), IN `p_Descripcion` VARCHAR(255), IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_produccion_agricola_anterior` (
        `Id_Ficha`,
        `Id_Ubicacion`,
        `Id_Productor`,
        `Id_Tipo_Cultivo`,
        `Superficie_Primera_Postrera`,
        `Id_Medida_Primera_Postrera`,
        `Produccion_Obtenida`,
        `Id_Medida_Produccion_Obtenida`,
        `Cantidad_Vendida`,
        `Id_Medida_Vendida`,
        `Precio_Venta`,
        `A_Quien_Se_Vendio`,
        `Descripcion`,
        `Creado_Por`,
        `Fecha_Creacion`,
        `Modificado_Por`,
        `Fecha_Modificacion`,
        `Estado`
    ) 
    VALUES (
        p_Id_Ficha,
        p_Id_Ubicacion,
        p_Id_Productor,
        p_Id_Tipo_Cultivo,
        p_Superficie_Primera_Postrera,
        p_Id_Medida_Primera_Postrera,
        p_Produccion_Obtenida,
        p_Id_Medida_Produccion_Obtenida,
        p_Cantidad_Vendida,
        p_Id_Medida_Vendida,
        p_Precio_Venta,
        p_A_Quien_Se_Vendio,
        p_Descripcion,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProduccionComercializacion` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Ubicacion` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Id_Tipo_Produccion` BIGINT, IN `p_Id_Medida_Produccion` BIGINT, IN `p_Cantidad_Vendida` DECIMAL(10,2), IN `p_Id_Medida_Venta` BIGINT, IN `p_Precio_Venta` DECIMAL(10,2), IN `p_A_Quien_Se_Vendio` VARCHAR(255), IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_produccion_comercializacion` (
        `Id_Ficha`,
        `Id_Ubicacion`,
        `Id_Productor`,
        `Id_Tipo_Produccion`,
        `Id_Medida_Produccion`,
        `Cantidad_Vendida`,
        `Id_Medida_Venta`,
        `Precio_Venta`,
        `A_Quien_Se_Vendio`,
        `Creado_Por`,
        `Fecha_Creacion`,
        `Modificado_Por`,
        `Fecha_Modificacion`,
        `estado`
    ) 
    VALUES (
        p_Id_Ficha,
        p_Id_Ubicacion,
        p_Id_Productor,
        p_Id_Tipo_Produccion,
        p_Id_Medida_Produccion,
        p_Cantidad_Vendida,
        p_Id_Medida_Venta,
        p_Precio_Venta,
        p_A_Quien_Se_Vendio,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProduccionPecuaria` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Ubicacion` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Año_Produccion` INT, IN `p_Id_Tipo_Pecuario` BIGINT, IN `p_Cantidad_Hembras` INT, IN `p_Cantidad_Machos` INT, IN `p_Descripcion_Otros` VARCHAR(255), IN `p_Precio_Venta` DECIMAL(10,2), IN `p_Id_Medida_Venta` BIGINT, IN `p_Cantidad_Mercado` INT, IN `p_Descripcion` VARCHAR(255), IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    DECLARE total INT;

    -- Calcula la suma de Cantidad_Machos y Cantidad_Hembras
    SET total = p_Cantidad_Machos + p_Cantidad_Hembras;

    -- Inserta el nuevo registro
    INSERT INTO `tbl_produccion_pecuaria` (
        `Id_Ficha`,
        `Id_Ubicacion`,
        `Id_Productor`,
        `Año_Produccion`,
        `Id_Tipo_Pecuario`,
        `Cantidad_Hembras`,
        `Cantidad_Machos`,
        `Cantidad_Total`,
        `Descripcion_Otros`,
        `Precio_Venta`,
        `Id_Medida_Venta`,
        `Cantidad_Mercado`,
        `Descripcion`,
        `Creado_Por`,
        `Fecha_Creacion`,
        `Modificado_Por`,
        `Fecha_Modificacion`,
        `Estado`
    ) 
    VALUES (
        p_Id_Ficha,
        p_Id_Ubicacion,
        p_Id_Productor,
        p_Año_Produccion,
        p_Id_Tipo_Pecuario,
        p_Cantidad_Hembras,
        p_Cantidad_Machos,
        total,
        p_Descripcion_Otros,
        p_Precio_Venta,
        p_Id_Medida_Venta,
        p_Cantidad_Mercado,
        p_Descripcion,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProduccionVendida` (IN `p_Año_Venta` INT, IN `p_Id_Tipo_Pecuario` BIGINT, IN `p_Precio_Venta` DECIMAL(10,2), IN `p_Id_Medida_Venta` BIGINT, IN `p_Cantidad_Mercado` INT, IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_produccion_vendida` (
        `Año_Venta`,
        `Id_Tipo_Pecuario`,
        `Precio_Venta`,
        `Id_Medida_Venta`,
        `Cantidad_Mercado`,
        `Creado_Por`,
        `Fecha_Creacion`,
        `Modificado_Por`,
        `Fecha_Modificacion`,
        `Estado`
    ) 
    VALUES (
        p_Año_Venta,
        p_Id_Tipo_Pecuario,
        p_Precio_Venta,
        p_Id_Medida_Venta,
        p_Cantidad_Mercado,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProductor` (IN `p_id_ficha` BIGINT, IN `p_primer_nombre` VARCHAR(255), IN `p_segundo_nombre` VARCHAR(255), IN `p_primer_apellido` VARCHAR(255), IN `p_segundo_apellido` VARCHAR(255), IN `p_identificacion` BIGINT, IN `p_fecha_nacimiento` DATE, IN `p_genero` VARCHAR(10), IN `p_estado_civil` VARCHAR(20), IN `p_nivel_escolaridad` VARCHAR(50), IN `p_ultimo_grado_escolar_aprobado` VARCHAR(50), IN `p_telefono_1` INT, IN `p_telefono_2` INT, IN `p_telefono_3` INT, IN `p_email_1` VARCHAR(255), IN `p_email_2` VARCHAR(255), IN `p_email_3` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_creado_por` BIGINT)   BEGIN
    INSERT INTO tbl_productor (
        id_ficha,
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProductorFormulario` (IN `p_primer_nombre` VARCHAR(255), IN `p_segundo_nombre` VARCHAR(255), IN `p_primer_apellido` VARCHAR(255), IN `p_segundo_apellido` VARCHAR(255), IN `p_identificacion` BIGINT(20), IN `p_fecha_nacimiento` DATE, IN `p_genero` VARCHAR(10), IN `p_estado_civil` VARCHAR(20), IN `p_nivel_escolaridad` VARCHAR(50), IN `p_ultimo_grado_escolar_aprobado` VARCHAR(50), IN `p_telefono_1` INT(11), IN `p_telefono_2` INT(11), IN `p_telefono_3` INT(11), IN `p_email_1` VARCHAR(255), IN `p_email_2` VARCHAR(255), IN `p_email_3` VARCHAR(255), IN `p_creado_por` VARCHAR(25), OUT `p_id_ficha` BIGINT(20))   BEGIN
    -- Variable para almacenar el último id_ficha
    DECLARE last_id bigint(20);

    -- Obtener el último id_ficha
    SELECT COALESCE(MAX(id_ficha), 0) INTO last_id FROM tbl_productor;

    -- Incrementar el último id_ficha
    SET last_id = last_id + 1;

    -- Insertar el nuevo registro
    INSERT INTO tbl_productor (
        id_ficha,
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
        estado
    ) VALUES (
        last_id,
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
        'desc',
        p_creado_por,
        'A'
    );

    -- Asignar valores a las variables de salida
    SET p_id_ficha = last_id;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoApoyo` (IN `p_tipo_apoyos` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(255))   BEGIN
    INSERT INTO tbl_tipos_apoyos (tipo_apoyos, descripcion, creado_por, estado)
    VALUES (p_tipo_apoyos, p_descripcion, p_creado_por, 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoApoyoProduccion` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Id_Tipos_Apoyos` BIGINT, IN `p_Otros_Detalles` TEXT, IN `p_Descripcion` TEXT, IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_tipos_apoyo_produccion` (
        `id_ficha`,
        `id_productor`,
        `id_tipos_apoyos`,
        `otros_detalles`,
        `descripcion`,
        `creado_por`,
        `fecha_creacion`,
        `modificado_por`,
        `fecha_modificacion`,
        `estado`
    ) 
    VALUES (
        p_Id_Ficha,
        p_Id_Productor,
        p_Id_Tipos_Apoyos,
        p_Otros_Detalles,
        p_Descripcion,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoNegocio` (IN `p_tipo_negocio` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(255))   BEGIN
    INSERT INTO tbl_tipo_negocios (tipo_negocio, descripcion, creado_por, estado)
    VALUES (p_tipo_negocio, p_descripcion, p_creado_por, 'A');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoOrganizacion` (IN `p_tipo_organizacion` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(255))   BEGIN
    INSERT INTO tbl_tipo_organizacion (tipo_organizacion, descripcion, creado_por, estado)
    VALUES (p_tipo_organizacion, p_descripcion, p_creado_por, 'A');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoPecuario` (IN `p_tipo_pecuario` VARCHAR(255), IN `p_raza_con_genero` ENUM('s','n'), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(50))   BEGIN
    INSERT INTO `tbl_tipo_pecuarios` (
        `tipo_pecuario`,
        `raza_con_genero`,
        `descripcion`,
        `creado_por`,
        `fecha_creacion`,
        `modificado_por`,
        `fecha_modificacion`,
        `estado`
    ) VALUES (
        p_tipo_pecuario,
        p_raza_con_genero,
        p_descripcion,
        p_creado_por,
        CURRENT_TIMESTAMP(),
        NULL,
        CURRENT_TIMESTAMP(),
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoPracticaProductiva` (IN `p_tipo_practica` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(255))   BEGIN
    INSERT INTO tbl_tipo_practicas_productivas (tipo_practica, descripcion, creado_por, estado)
    VALUES (p_tipo_practica, p_descripcion, p_creado_por, 'A');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoProduccion` (IN `p_tipo_produccion` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(255))   BEGIN
    INSERT INTO tbl_tipo_produccion (tipo_produccion, descripcion, creado_por, estado)
    VALUES (p_tipo_produccion, p_descripcion, p_creado_por, 'A');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoTrabajador` (IN `tipo_trabajador_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_trabajadores` (`tipo_trabajador`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_trabajador_param, descripcion_param, 'Daniela', 'Daniela', 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTomadorDecisiones` (IN `p_tomador` VARCHAR(255), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(255))   BEGIN
    INSERT INTO tbl_toma_decisiones (tomador, descripcion, creado_por, estado)
    VALUES (p_tomador, p_descripcion, p_creado_por, 'A');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTrabajadorExterno` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Id_Tipo_Trabajador` BIGINT, IN `p_Cantidad_Trabajador` INT, IN `p_Descripcion` TEXT, IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_trabajadores_externos` (
        `id_ficha`,
        `id_productor`,
        `id_tipo_trabajador`,
        `cantidad_trabajador`,
        `descripcion`,
        `creado_por`,
        `fecha_creacion`,
        `modificado_por`,
        `fecha_modificacion`,
        `estado`
    ) 
    VALUES (
        p_Id_Ficha,
        p_Id_Productor,
        p_Id_Tipo_Trabajador,
        p_Cantidad_Trabajador,
        p_Descripcion,
        p_Creado_Por,
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A'
    );
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUbicacionProductorFormulario` (IN `p_id_departamento` BIGINT(20), IN `p_id_municipio` BIGINT(20), IN `p_id_aldea` BIGINT(20), IN `p_id_caserio` BIGINT(20), IN `p_ubicacion_geografica` VARCHAR(255), IN `p_distancia_parcela_vivienda` DECIMAL(10,2), IN `p_latitud_parcela` VARCHAR(20), IN `p_longitud_parcela` VARCHAR(20), IN `p_msnm` DECIMAL(10,2), IN `p_direccion_1` VARCHAR(255), IN `p_direccion_2` VARCHAR(255), IN `p_direccion_3` VARCHAR(255), IN `p_vive_en_finca` ENUM('S','N'), IN `p_nombre_finca` VARCHAR(255), IN `p_creado_por` VARCHAR(50), OUT `p_id_ficha` BIGINT(20), OUT `p_id_productor` BIGINT(20))   BEGIN
    -- Variable para almacenar el último id_productor
    DECLARE last_id_productor bigint(20);

    -- Variable para almacenar el último id_ficha
    DECLARE last_id_ficha bigint(20);

    -- Obtener el último id_productor
    SELECT COALESCE(MAX(id_productor), 0) INTO last_id_productor FROM tbl_ubicacion_productor;

    -- Incrementar el último id_productor
    SET last_id_productor = last_id_productor + 1;

    -- Obtener el último id_ficha
    SELECT COALESCE(MAX(id_ficha), 0) INTO last_id_ficha FROM tbl_ubicacion_productor;

    -- Incrementar el último id_ficha
    SET last_id_ficha = last_id_ficha + 1;

    -- Insertar el nuevo registro
    INSERT INTO tbl_ubicacion_productor (
        id_ficha,
        id_productor,
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
        estado
    ) VALUES (
        last_id_ficha,
        last_id_productor,
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
        'descripcion',
        p_creado_por,
        'A'
    );

    -- Asignar valores a las variables de salida
    SET p_id_productor = last_id_productor;
    SET p_id_ficha = last_id_ficha;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUnidadProductora` (IN `p_Id_Ubicacion` BIGINT, IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Tipo_De_Manejo` ENUM('Propia','Alquilada','Prestada','Ejidal'), IN `p_Superficie_Produccion` DECIMAL(10,2), IN `p_Id_Medida_Produccion` BIGINT, IN `p_Superficie_Agricultura` DECIMAL(10,2), IN `p_Id_Medida_Agricultura` BIGINT, IN `p_Superficie_Ganaderia` DECIMAL(10,2), IN `p_Id_Medida_Ganaderia` BIGINT, IN `p_Superficie_Apicultura` DECIMAL(10,2), IN `p_Id_Medida_Apicultura` BIGINT, IN `p_Superficie_Forestal` DECIMAL(10,2), IN `p_Id_Medida_Forestal` BIGINT, IN `p_Superficie_Acuacultura` DECIMAL(10,2), IN `p_Numero_Estanques` INT, IN `p_Superficie_Agroturismo` DECIMAL(10,2), IN `p_Superficie_Otros` DECIMAL(10,2), IN `p_Otros_Descripcion` VARCHAR(255), IN `p_Descripcion` VARCHAR(255), IN `p_Creado_Por` VARCHAR(255))   BEGIN
    DECLARE v_valid_producer BOOLEAN;

    -- Verificar si el Id_Productor existe en la tabla tbl_productor
    SELECT COUNT(*) INTO v_valid_producer
    FROM tbl_productor
    WHERE id_ficha = p_Id_Ficha AND id_productor = p_Id_Productor;

    -- Si el Id_Productor no existe, lanzar un error o tomar medidas apropiadas
    IF v_valid_producer = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El Id_Productor no existe en la tabla tbl_productor';
    ELSE
        -- Realizar la inserción si la validación es exitosa
        INSERT INTO tbl_unidad_productora (
            Id_Ubicacion,
            Id_Ficha,
            Id_Productor,
            Tipo_De_Manejo,
            Superficie_Produccion,
            Id_Medida_Produccion,
            Superficie_Agricultura,
            Id_Medida_Agricultura,
            Superficie_Ganaderia,
            Id_Medida_Ganaderia,
            Superficie_Apicultura,
            Id_Medida_Apicultura,
            Superficie_Forestal,
            Id_Medida_Forestal,
            Superficie_Acuacultura,
            Numero_Estanques,
            Superficie_Agroturismo,
            Superficie_Otros,
            Otros_Descripcion,
            Descripcion,
            Creado_Por,
            Fecha_Creacion,
            Modificado_Por,
            Fecha_Modificacion,
            Estado
        ) VALUES (
            p_Id_Ubicacion,
            p_Id_Ficha,
            p_Id_Productor,
            p_Tipo_De_Manejo,
            p_Superficie_Produccion,
            p_Id_Medida_Produccion,
            p_Superficie_Agricultura,
            p_Id_Medida_Agricultura,
            p_Superficie_Ganaderia,
            p_Id_Medida_Ganaderia,
            p_Superficie_Apicultura,
            p_Id_Medida_Apicultura,
            p_Superficie_Forestal,
            p_Id_Medida_Forestal,
            p_Superficie_Acuacultura,
            p_Numero_Estanques,
            p_Superficie_Agroturismo,
            p_Superficie_Otros,
            p_Otros_Descripcion,
            p_Descripcion,
            p_Creado_Por,
            CURRENT_TIMESTAMP(),
            NULL,
            CURRENT_TIMESTAMP(),
            'A'
        );
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUsuario` (IN `p_nombre_completo` VARCHAR(255), IN `p_correo` VARCHAR(255), IN `p_usuario` VARCHAR(255), IN `p_contrasena` VARCHAR(255))   BEGIN
    INSERT INTO usuario (nombre_completo, correo, usuario, contrasena, Id_rol, id_estado)
    VALUES (p_nombre_completo, p_correo, p_usuario, p_contrasena, 2, 3);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertMigracionFamiliarData` (IN `p_id_ficha` INT, IN `p_id_productor` INT, IN `p_tiene_migrantes` ENUM('S','N'), IN `p_migracion_dentro_pais` ENUM('S','N'), IN `p_migracion_fuera_pais` ENUM('S','N'), IN `p_id_tipo_motivos` VARCHAR(255), IN `p_remesas` ENUM('S','N'), IN `p_creado_por` VARCHAR(50))   BEGIN
  

  INSERT INTO tbl_migracion_familiar (
    id_ficha,
    id_productor,
    tiene_migrantes,
    migracion_dentro_pais,
    migracion_fuera_pais,
    id_tipo_motivos,
    remesas,
    creado_por,
    estado
  )
  VALUES (
    p_id_ficha,
    p_id_productor,
    p_tiene_migrantes,
    p_migracion_dentro_pais,
    p_migracion_fuera_pais,
    p_id_tipo_motivos,
    p_remesas,
    p_creado_por,
    'A'
  );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertObejtos` (IN `newObjeto` VARCHAR(255), IN `newDescripcion` VARCHAR(255), IN `newActualizado_Por` VARCHAR(255), IN `newCreado_Por` VARCHAR(255))   BEGIN
    DECLARE currentDate TIMESTAMP;
    SET currentDate = NOW();
 INSERT INTO objetos(Objeto, Descripcion, Actualizado_Por, Creado_Por, Fecha_Creacion,Fecha_Actualizacon, Status)
    VALUES (newObjeto , newDescripcion, newActualizado_Por, newCreado_Por, currentDate, currentDate,'Activo');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertObjeto` (IN `p_Objeto` VARCHAR(255), IN `p_Descripcion` VARCHAR(255), IN `p_tipo_objeto` VARCHAR(50), IN `p_Creado_Por` VARCHAR(40))   BEGIN
    INSERT INTO objetos (Objeto, Descripcion, tipo_objeto, Creado_Por, Status)
    VALUES (p_Objeto, p_Descripcion, p_tipo_objeto, p_Creado_Por, 'A');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertOrganizationData` (IN `p_pertenece_a_organizacion` ENUM('S','N'), IN `p_creado_por` VARCHAR(255))   BEGIN
    DECLARE last_id_productor BIGINT;
    DECLARE last_id_ficha BIGINT;
    
    -- Obtener el último ID de productor insertado
    SELECT MAX(id_productor) INTO last_id_productor FROM tbl_productor;
    
    -- Verificar si se encontró el último ID de productor
    IF last_id_productor IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al obtener el ID del productor.';
    END IF;
    
    -- Obtener el último ID de ficha insertado
    SELECT MAX(id_ficha) INTO last_id_ficha FROM fichas;
    
    -- Verificar si se encontró el último ID de ficha
    IF last_id_ficha IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al obtener el ID de la ficha.';
    END IF;
  
    -- Insertar datos en la tabla tbl_base_organizacion
    INSERT INTO tbl_base_organizacion (id_productor, id_ficha, pertenece_a_organizacion, estado, creado_por, fecha_creacion, modificado_por, fecha_modificacion)
    VALUES (last_id_productor, last_id_ficha, p_pertenece_a_organizacion, 'A', p_creado_por, CURRENT_TIMESTAMP, NULL , CURRENT_TIMESTAMP);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertOrUpdatePermiso` (IN `p_id_rol` INT, IN `p_permiso_eliminacion` VARCHAR(255), IN `p_id_objeto` INT, IN `p_permiso_actualizacion` VARCHAR(255), IN `p_permiso_insercion` VARCHAR(255), IN `p_Actualizado_Por` VARCHAR(255))   BEGIN
    INSERT INTO permisos (id_rol, permiso_eliminacion, id_objeto, permiso_actualizacion, permiso_insercion, Actualizado_Por, Fecha_Actualizacion) 
    VALUES (p_id_rol, p_permiso_eliminacion, p_id_objeto, p_permiso_actualizacion, p_permiso_insercion, p_Actualizado_Por, NOW())
    ON DUPLICATE KEY UPDATE 
    permiso_eliminacion = VALUES(permiso_eliminacion),
    permiso_actualizacion = VALUES(permiso_actualizacion),
    permiso_insercion = VALUES(permiso_insercion),
    Actualizado_Por = VALUES(Actualizado_Por),
    Fecha_Actualizacion = NOW();
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPermisos` (IN `newId_rol` BIGINT(20), IN `newId_objetos` BIGINT(20), IN `newpermiso_eliminacion` VARCHAR(10), IN `newpermiso_actualizacion` VARCHAR(10), IN `newpermiso_insercion` VARCHAR(10), IN `newpermiso_consulta` VARCHAR(10), IN `newCreado_Por` VARCHAR(50))   BEGIN
    DECLARE currentDate TIMESTAMP;  
    
    SET currentDate = NOW();  
    
    INSERT INTO permisos (Id_rol, permiso_eliminacion, id_objeto, permiso_actualizacion, permiso_insercion,  permiso_consulta, Actualizado_Por, Fecha_Actualizacion)
    VALUES (newId_rol, newpermiso_eliminacion, newId_objetos, newpermiso_actualizacion, newpermiso_insercion, newpermiso_consulta, newCreado_Por, currentDate);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTProduccion_AgrAnterior` (IN `p_id_ubicacion` INT, IN `p_id_ficha` INT, IN `p_id_productor` INT, IN `p_Id_Tipo_Cultivo` BIGINT(20), IN `p_Superficie_Primera_Postrera` INT, IN `p_Id_Medida_Primera_Postrera` BIGINT(20), IN `p_Produccion_Obtenida` DECIMAL(10,2), IN `p_Id_Medida_Produccion_Obtenida` BIGINT(20), IN `p_Cantidad_Vendida` DECIMAL(10,2), IN `p_Id_Medida_Vendida` BIGINT(20), IN `p_Precio_Venta` DECIMAL(10,2), IN `p_A_Quien_Se_Vendio` VARCHAR(255), IN `p_Creado_Por` VARCHAR(255))   BEGIN

    -- Insertar datos en tbl_unidad_productora
    INSERT INTO tbl_produccion_agricola_anterior (
        Id_Ubicacion,
        Id_Ficha,
        Id_Productor,
        Id_Tipo_Cultivo,
        Superficie_Primera_Postrera,
        Id_Medida_Primera_Postrera,
        Produccion_Obtenida,
        Id_Medida_Produccion_Obtenida,
        Cantidad_Vendida,
        Id_Medida_Vendida,
        Precio_Venta,
        A_Quien_Se_Vendio,
        Creado_Por,
        Fecha_Creacion,
        Modificado_Por,
        Fecha_Modificacion,
        estado
    ) VALUES (
        p_id_ubicacion,
        p_id_ficha,
        p_id_productor,
        p_Id_Tipo_Cultivo,
        p_Superficie_Primera_Postrera,
        p_Id_Medida_Primera_Postrera,
        p_Produccion_Obtenida,
        p_Id_Medida_Produccion_Obtenida,
        p_Cantidad_Vendida,
        p_Id_Medida_Vendida,
        p_Precio_Venta,
        p_A_Quien_Se_Vendio,
        p_Creado_Por,
        CURRENT_TIMESTAMP(),
        NULL,
        CURRENT_TIMESTAMP(),
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRelevoData` (IN `p_id_ficha` INT, IN `p_id_productor` INT, IN `p_tendra_relevo` ENUM('S','N'), IN `p_cuantos_relevos` INT, IN `p_creado_por` VARCHAR(50))   BEGIN
  
  INSERT INTO tbl_relevo_organizacion (id_ficha,id_productor,tendra_relevo, cuantos_relevos, creado_por,fecha_creacion ,estado)
  VALUES (p_id_ficha, p_id_productor, p_tendra_relevo, p_cuantos_relevos, p_creado_por,  CURRENT_TIMESTAMP(),'A');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRoles` (IN `newNombre` VARCHAR(255), IN `newDescripcion` VARCHAR(255), IN `newEstado` VARCHAR(50))   BEGIN
    DECLARE currentDate TIMESTAMP;  -- Declarar la variable currentDate
    SET currentDate = NOW();  -- Obtener la fecha y hora actuales
    
    INSERT INTO roles (Nombre, Descripcion, Creado_Por, Fecha_Creacion, Actualizado_Por, Fecha_Actualizacion, STATUS)
    VALUES (newNombre, newDescripcion, 1, currentDate, 1, currentDate, newEstado);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TempInsertarUnidadProductoraYRiego` (IN `p_id_ubicacion` INT, IN `p_id_ficha` INT, IN `p_id_productor` INT, IN `p_Tipo_De_Manejo` ENUM('Propia','Alquilada','Prestada','Ejidal'), IN `p_Id_Medida_Produccion` BIGINT(20), IN `p_Superficie_Agricultura` DECIMAL(10,2), IN `p_Id_Medida_Agricultura` BIGINT(20), IN `p_Superficie_Ganaderia` DECIMAL(10,2), IN `p_Id_Medida_Ganaderia` BIGINT(20), IN `p_Superficie_Apicultura` DECIMAL(10,2), IN `p_Id_Medida_Apicultura` BIGINT(20), IN `p_Superficie_Forestal` DECIMAL(10,2), IN `p_Id_Medida_Forestal` BIGINT(20), IN `p_Superficie_Acuacultura` DECIMAL(10,2), IN `p_Numero_Estanques` INT, IN `p_Superficie_Agroturismo` DECIMAL(10,2), IN `p_Superficie_Otros` VARCHAR(50), IN `p_Creado_Por` VARCHAR(255), IN `p_Tiene_Riego` ENUM('S','N'), IN `p_Superficie_Riego` DECIMAL(10,6), IN `p_Id_Medida_Superficie_Riego` BIGINT(20), IN `p_Id_Tipo_Riego` BIGINT(20), IN `p_Fuente_Agua` VARCHAR(255), IN `p_Disponibilidad_Agua_Meses` INT, IN `p_rubroAgricultura` VARCHAR(100), IN `p_rubroGanaderia` VARCHAR(100), IN `p_rubroForestal` VARCHAR(100), IN `p_Id_Superficie_Acuacultura` INT, IN `p_Id_Superficie_Agroturismo` INT)   BEGIN

  INSERT INTO tbl_unidad_productora (
    Id_Ubicacion,
    Id_Ficha,
    Id_Productor,
    Tipo_De_Manejo,
    Id_Medida_Produccion,
    Superficie_Agricultura,
    Id_Medida_Agricultura,
    rubro_agricultura,
    Superficie_Ganaderia,
    Id_Medida_Ganaderia,
    rubro_ganaderia,
    Superficie_Apicultura,
    Id_Medida_Apicultura,
    Superficie_Forestal,
    Id_Medida_Forestal,
    rubro_forestal,
    Id_Superficie_Acuacultura,
    Superficie_Acuacultura,
    Numero_Estanques,
    Id_Superficie_Agroturismo,
	     Superficie_Agroturismo,
    Otros_Descripcion,
    Creado_Por,
    Fecha_Creacion,
    Modificado_Por,
    Fecha_Modificacion,
    estado
  ) VALUES (
    p_id_ubicacion,
    p_id_ficha,
    p_id_productor,
    p_Tipo_De_Manejo,
    p_Id_Medida_Produccion,
    p_Superficie_Agricultura,
    p_Id_Medida_Agricultura,
    p_rubroAgricultura,
    p_Superficie_Ganaderia,
    p_Id_Medida_Ganaderia,
    p_rubroGanaderia,
    p_Superficie_Apicultura,
    p_Id_Medida_Apicultura,
    p_Superficie_Forestal,
    p_Id_Medida_Forestal,
    p_rubroForestal,
    p_Id_Superficie_Acuacultura,
    p_Superficie_Acuacultura,
    p_Numero_Estanques,
    p_Id_Superficie_Agroturismo,
    p_Superficie_Agroturismo,
    p_Superficie_Otros,
    p_Creado_Por,
    CURRENT_TIMESTAMP(),
    NULL,
    CURRENT_TIMESTAMP() ,
    'A'
  );

INSERT INTO tbl_manejo_riego (
    Id_Ficha,
    Id_Ubicacion,
    Id_Productor,
    Tiene_Riego,
    Superficie_Riego,
    Id_Medida_Superficie_Riego,
    Id_Tipo_Riego,
    Fuente_Agua,
    Disponibilidad_Agua_Meses,
    Creado_Por,
    Fecha_Creacion,
    Modificado_Por,
    Fecha_Modificacion,
    Estado
  ) VALUES (
    p_id_ficha,
    p_id_ubicacion,
    p_id_productor,
    p_Tiene_Riego,
    p_Superficie_Riego,
    p_Id_Medida_Superficie_Riego,
    p_Id_Tipo_Riego,
    p_Fuente_Agua,
    p_Disponibilidad_Agua_Meses,
    p_Creado_Por,
    CURRENT_TIMESTAMP(),
    NULL,
    CURRENT_TIMESTAMP(),
    'A'
  );

 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Temp_Insertar_Ficha` (IN `p_Fecha_Solicitud` DATE, IN `p_Anio_Solicitud` INT, IN `p_Descripcion` VARCHAR(255), IN `p_Fecha_Entrevista` DATE, IN `p_Nombre_Encuentrador` VARCHAR(50), IN `p_Nombre_Encuestador` VARCHAR(50), IN `p_Nombre_Supervisor` VARCHAR(50))   BEGIN
    DECLARE id_ficha BIGINT;

    -- Insertar datos en la tabla fichas
    INSERT INTO `fichas` (
        `fecha_solicitud`,
        `anio_solicitud`,
        `descripcion`,
        `creado_por`,
        `fecha_creacion`,
        `modificado_por`,
        `fecha_modificacion`,
        `estado`,
        `fecha_entrevista`,
        `nombre_encuentrador`,
        `nombre_encuestador`,
        `nombre_supervisor`
    ) 
    VALUES (
        p_Fecha_Solicitud,
        p_Anio_Solicitud,
        p_Descripcion,
        '',
        CURRENT_TIMESTAMP,
        NULL,
        CURRENT_TIMESTAMP,
        'A',
        p_Fecha_Entrevista,
        p_Nombre_Encuentrador,
        p_Nombre_Encuestador,
        p_Nombre_Supervisor
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Temp_Insertar_Productor` (IN `p_id_ficha` INT, IN `p_primer_nombre` VARCHAR(255), IN `p_segundo_nombre` VARCHAR(255), IN `p_primer_apellido` VARCHAR(255), IN `p_segundo_apellido` VARCHAR(255), IN `p_identificacion` BIGINT, IN `p_fecha_nacimiento` DATE, IN `p_genero` VARCHAR(10), IN `p_estado_civil` VARCHAR(20), IN `p_nivel_escolaridad` VARCHAR(50), IN `p_ultimo_grado_escolar_aprobado` VARCHAR(50), IN `p_telefono_1` INT, IN `p_telefono_2` INT, IN `p_telefono_3` INT, IN `p_email_1` VARCHAR(255), IN `p_email_2` VARCHAR(255), IN `p_email_3` VARCHAR(255), IN `p_creado_por` VARCHAR(255))   BEGIN
    DECLARE v_temp INT;
    
    -- Intentar convertir p_id_ficha a un entero
    SET v_temp = CAST(p_id_ficha AS SIGNED);
    -- Insertar datos en la tabla productor
    INSERT INTO tbl_productor (
        id_ficha,
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
        creado_por,
        fecha_creacion,
        modificado_por,
        fecha_modificacion,
        estado
    ) VALUES (
        v_temp,
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
        p_creado_por,
        CURRENT_TIMESTAMP(),
        NULL,
        CURRENT_TIMESTAMP(),
        'A'
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Temp_Insertar_Ubicacion_Productor` (IN `p_id_ficha` INT, IN `p_id_productor` INT, IN `p_Id_Departamento` BIGINT, IN `p_Id_Municipio` BIGINT, IN `p_Id_Aldea` BIGINT, IN `p_Id_Cacerio` BIGINT, IN `p_ubicacion_geografica` VARCHAR(255), IN `p_distancia_parcela_vivienda` DECIMAL(10,2), IN `p_latitud_parcela` VARCHAR(20), IN `p_longitud_parcela` VARCHAR(20), IN `p_msnm` DECIMAL(10,2), IN `p_direccion_1` VARCHAR(255), IN `p_direccion_2` VARCHAR(255), IN `p_direccion_3` VARCHAR(255), IN `p_vive_en_finca` ENUM('S','N'), IN `p_nombre_finca` VARCHAR(255), IN `p_creado_por` VARCHAR(50))   BEGIN
    -- Insertar datos en la tabla ubicacion_productor
    INSERT INTO tbl_ubicacion_productor (
        id_ficha,
        id_productor,
        Id_Departamento,
        Id_Municipio,
        Id_Aldea,
        Id_Cacerio,
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
        p_Id_Departamento,
        p_Id_Municipio,
        p_Id_Aldea,
        p_Id_Cacerio,
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
        NULL,
        p_creado_por,
        CURRENT_TIMESTAMP(),
        NULL,
        CURRENT_TIMESTAMP(),
        'A'
    );
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePermiso` (IN `newIdPermiso` BIGINT(20), IN `newId_Rol` BIGINT(20), IN `newId_Objeto` INT, IN `newpermiso_eliminacion` VARCHAR(10), IN `newpermiso_actualizacion` VARCHAR(10), IN `newpermiso_consulta` VARCHAR(10), IN `newpermiso_insercion` VARCHAR(10), IN `newActualizado` INT)   BEGIN 
    UPDATE permisos
    SET permiso_eliminacion = newpermiso_eliminacion,
    		id_rol = newId_Rol,
    		id_objeto = newId_Objeto,
        permiso_actualizacion = newpermiso_actualizacion,
        permiso_consulta = newpermiso_consulta,
        permiso_insercion = newpermiso_insercion,
        Actualizado_Por = newActualizado,
        Fecha_Actualizacion = CURRENT_TIMESTAMP
        WHERE id_permisos = newIdPermiso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateRole` (IN `newIdRol` BIGINT(20), IN `newNombre` VARCHAR(255), IN `newDescripcion` VARCHAR(255), IN `newStatus` VARCHAR(255))   BEGIN
    UPDATE roles
    SET Nombre = newNombre,
    	Descripcion = newDescripcion,
        STATUS = newStatus,
        Fecha_Actualizacion = CURRENT_TIMESTAMP
    WHERE Id_rol = newIdRol;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacoras`
--

CREATE TABLE `bitacoras` (
  `id_bitacora` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `ejecutor` varchar(30) NOT NULL,
  `actividad_realizada` varchar(50) NOT NULL,
  `informacion_actual` varchar(300) DEFAULT NULL,
  `informacion_anterior` varchar(300) DEFAULT NULL,
  `tabla` text DEFAULT NULL,
  `informacion_eliminada` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bitacoras`
--

INSERT INTO `bitacoras` (`id_bitacora`, `fecha`, `ejecutor`, `actividad_realizada`, `informacion_actual`, `informacion_anterior`, `tabla`, `informacion_eliminada`) VALUES
(1, '2024-04-16 03:53:32', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 3, fecha_solicitud: 2024-04-09, anio_solicitud: 2024, descripcion: prueba2 , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez', NULL, 'fichas', NULL),
(2, '2024-04-16 03:57:49', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 4, fecha_solicitud: 2024-04-09, anio_solicitud: 2024, descripcion: prueba2 , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez', NULL, 'fichas', NULL),
(3, '2024-04-16 03:58:38', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-09, anio_solicitud: 0, descripcion: prueba2 , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez', 'Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-09 anio_solicitud: 2024, descripcion: prueba2 A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez', 'fichas', NULL),
(4, '2024-04-16 04:01:51', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 5, fecha_solicitud: 2024-04-09, anio_solicitud: 2024, descripcion: prueba2 , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez', NULL, 'fichas', NULL),
(5, '2024-04-16 04:03:42', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-09, anio_solicitud: 0, descripcion: prueba2 , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-09 anio_solicitud: 2024, descripcion: prueba2 A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez', 'fichas', NULL),
(6, '2024-04-16 04:04:08', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-09, anio_solicitud: 0, descripcion: prueba2 , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-09 anio_solicitud: 0, descripcion: prueba2 A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez', 'fichas', NULL),
(7, '2024-04-16 04:09:38', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-09, anio_solicitud: 0, descripcion: prueba2 , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-09 anio_solicitud: 0, descripcion: prueba2 A, fecha_entrevista: 2024-04-24, nombre_encuestador: Luis Nuñez', 'fichas', NULL),
(8, '2024-04-16 04:12:51', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 2023, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', NULL, 'fichas', NULL),
(9, '2024-04-16 04:15:59', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 7, fecha_solicitud: 2024-04-17, anio_solicitud: 2023, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', NULL, 'fichas', NULL),
(10, '2024-04-16 04:16:13', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 7, fecha_solicitud: 2024-04-17, anio_solicitud: 2025, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'Información anterior = id_ficha: 7, fecha_solicitud: 2024-04-17 anio_solicitud: 2023, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'fichas', NULL),
(11, '2024-04-16 04:24:16', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 2023, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'fichas', NULL),
(12, '2024-04-16 04:26:25', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'fichas', NULL),
(13, '2024-04-16 04:32:29', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'fichas', NULL),
(14, '2024-04-16 04:33:03', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'fichas', NULL),
(15, '2024-04-16 04:48:20', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'fichas', NULL),
(16, '2024-04-16 04:57:08', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'fichas', NULL),
(17, '2024-04-16 04:58:26', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'fichas', NULL),
(18, '2024-04-16 05:02:23', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'fichas', NULL),
(19, '2024-04-16 05:03:51', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'fichas', NULL),
(20, '2024-04-16 05:07:29', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'fichas', NULL),
(21, '2024-04-16 05:08:30', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'fichas', NULL),
(22, '2024-04-16 05:09:27', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 8, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(23, '2024-04-16 05:10:00', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(24, '2024-04-16 05:10:05', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion:  sdfsdfs, estado: A, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion:  sdfsdfsA, fecha_entrevista: 2024-04-18, nombre_encuestador: fsddfsdf', 'fichas', NULL),
(25, '2024-04-16 05:10:51', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'fichas', NULL),
(26, '2024-04-16 05:13:43', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'fichas', NULL),
(27, '2024-04-16 05:14:47', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'fichas', NULL),
(28, '2024-04-16 05:16:32', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'fichas', NULL),
(29, '2024-04-16 05:17:33', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'fichas', NULL),
(30, '2024-04-16 05:18:57', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'fichas', NULL),
(31, '2024-04-16 05:23:32', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'fichas', NULL),
(32, '2024-04-16 05:25:25', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'fichas', NULL),
(33, '2024-04-16 05:25:33', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'fichas', NULL),
(34, '2024-04-16 05:26:30', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 9, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'Información anterior = id_ficha: 9, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'fichas', NULL),
(35, '2024-04-16 05:28:11', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 10, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(36, '2024-04-16 05:37:50', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 2024, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', NULL, 'fichas', NULL),
(37, '2024-04-16 05:43:15', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 2024, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', NULL, 'fichas', NULL),
(38, '2024-04-16 05:43:40', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 2024, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(39, '2024-04-19 01:46:58', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(40, '2024-04-19 01:47:00', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(41, '2024-04-19 01:50:06', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(42, '2024-04-19 01:53:00', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(43, '2024-04-19 01:54:37', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-10 anio_solicitud: 2024, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(44, '2024-04-19 01:55:41', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(45, '2024-04-20 17:55:39', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(46, '2024-04-20 18:00:00', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(47, '2024-04-20 18:01:45', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(48, '2024-04-20 18:02:47', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(49, '2024-04-20 18:08:27', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(50, '2024-04-20 18:13:16', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(51, '2024-04-20 18:31:52', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(52, '2024-04-20 18:47:30', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(53, '2024-04-20 18:52:36', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(54, '2024-04-20 19:07:07', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(55, '2024-04-20 19:07:46', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(56, '2024-04-20 19:12:53', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(57, '2024-04-20 19:14:11', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(58, '2024-04-20 19:19:12', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(59, '2024-04-20 19:21:01', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(60, '2024-04-20 19:25:05', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(61, '2024-04-20 19:30:34', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(62, '2024-04-20 19:42:00', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(63, '2024-04-20 19:48:06', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(64, '2024-04-20 19:50:36', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(65, '2024-04-20 19:52:18', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 3, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(66, '2024-04-20 19:52:50', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 4, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', NULL, 'fichas', NULL),
(67, '2024-04-20 19:52:58', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-24, nombre_encuestador: Paula Maritza Osorio Espino', 'fichas', NULL),
(68, '2024-04-21 02:00:56', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 1, fecha_solicitud: 2024-04-17, anio_solicitud: 2024, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', NULL, 'fichas', NULL),
(69, '2024-04-21 02:06:00', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-17 anio_solicitud: 2024, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'fichas', NULL),
(70, '2024-04-21 02:10:26', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'fichas', NULL),
(71, '2024-04-21 02:11:40', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'fichas', NULL),
(72, '2024-04-21 02:21:33', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'fichas', NULL),
(73, '2024-04-21 02:23:10', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'fichas', NULL),
(74, '2024-04-21 02:28:37', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 2, fecha_solicitud: 2024-04-02, anio_solicitud: 2024, descripcion:  sdfdsfds, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: fsdfdsfd', NULL, 'fichas', NULL),
(75, '2024-04-21 02:32:42', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-02, anio_solicitud: 0, descripcion:  sdfdsfds, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: fsdfdsfd', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-02 anio_solicitud: 2024, descripcion:  sdfdsfdsA, fecha_entrevista: 2024-04-04, nombre_encuestador: fsdfdsfd', 'fichas', NULL),
(76, '2024-04-21 02:33:42', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-02, anio_solicitud: 0, descripcion:  sdfdsfds, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: fsdfdsfd', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-02 anio_solicitud: 0, descripcion:  sdfdsfdsA, fecha_entrevista: 2024-04-04, nombre_encuestador: fsdfdsfd', 'fichas', NULL),
(77, '2024-04-21 02:33:52', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-02, anio_solicitud: 0, descripcion:  sdfdsfds, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: fsdfdsfd', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-02 anio_solicitud: 0, descripcion:  sdfdsfdsA, fecha_entrevista: 2024-04-04, nombre_encuestador: fsdfdsfd', 'fichas', NULL),
(78, '2024-04-21 02:37:23', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 3, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(79, '2024-04-21 02:39:10', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 4, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', NULL, 'fichas', NULL),
(80, '2024-04-21 02:39:20', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'fichas', NULL),
(81, '2024-04-21 02:45:24', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'fichas', NULL),
(82, '2024-04-21 02:45:29', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'fichas', NULL),
(83, '2024-04-21 02:45:40', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-17, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-17 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-17, nombre_encuestador: Josue Manuel Arriaga Sanchez', 'fichas', NULL),
(84, '2024-04-21 03:24:15', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 2024, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria', NULL, 'fichas', NULL),
(85, '2024-04-21 03:29:04', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 2, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', NULL, 'fichas', NULL),
(86, '2024-04-21 03:31:36', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-10 anio_solicitud: 2024, descripcion: prueba A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria', 'fichas', NULL),
(87, '2024-04-21 03:33:36', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-16, anio_solicitud: 0, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-16 anio_solicitud: 2024, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'fichas', NULL),
(88, '2024-04-21 03:35:26', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 0, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', NULL, 'fichas', NULL),
(89, '2024-04-21 03:35:54', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 0, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 0, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'fichas', NULL),
(90, '2024-04-22 04:38:36', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-16, anio_solicitud: 0, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-16 anio_solicitud: 0, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'fichas', NULL),
(91, '2024-04-22 04:45:10', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 0, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 0, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'fichas', NULL),
(92, '2024-04-22 04:49:42', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 4, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(93, '2024-04-22 04:55:01', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 5, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(94, '2024-04-22 04:59:39', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 6, fecha_solicitud: 0000-00-00, anio_solicitud: 2024, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(95, '2024-04-23 02:40:25', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2025, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 0, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'fichas', NULL),
(96, '2024-04-23 02:41:23', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2025, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 2025, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'fichas', NULL),
(97, '2024-04-23 02:41:41', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 0, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 2025, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'fichas', NULL),
(98, '2024-04-23 02:46:05', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 0, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'fichas', NULL),
(99, '2024-04-23 02:49:19', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 2024, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'fichas', NULL),
(100, '2024-04-23 02:57:27', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 2024, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'fichas', NULL),
(101, '2024-04-23 02:58:50', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 7, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(102, '2024-04-23 03:00:20', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 8, fecha_solicitud: 2024-04-09, anio_solicitud: 4324, descripcion:  , estado: A, fecha_entrevista: 2024-04-02, nombre_encuestador: fdsfsd', NULL, 'fichas', NULL),
(103, '2024-04-23 03:05:11', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 2024, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'fichas', NULL),
(104, '2024-04-23 03:17:39', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 2024, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'fichas', NULL),
(105, '2024-04-23 03:20:17', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 9, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', NULL, 'fichas', NULL),
(106, '2024-04-23 03:20:27', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-16, anio_solicitud: 2024, descripcion:  DFASDFAFDS, estado: A, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-16 anio_solicitud: 2024, descripcion:  DFASDFAFDSA, fecha_entrevista: 2024-04-04, nombre_encuestador: ZXCXZC', 'fichas', NULL),
(107, '2024-04-23 03:41:03', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria', 'fichas', NULL),
(108, '2024-04-23 03:41:54', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria', 'fichas', NULL),
(109, '2024-04-23 03:42:11', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 10, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(110, '2024-04-23 03:42:37', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria', 'fichas', NULL),
(111, '2024-04-24 11:52:15', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-10, anio_solicitud: 0, descripcion: prueba , estado: A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-10 anio_solicitud: 0, descripcion: prueba A, fecha_entrevista: 2024-04-02, nombre_encuestador: Maria', 'fichas', NULL),
(112, '2024-04-24 11:53:10', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 11, fecha_solicitud: 2024-04-10, anio_solicitud: 545, descripcion:  4545, estado: A, fecha_entrevista: 2024-04-03, nombre_encuestador: 3545', NULL, 'fichas', NULL),
(113, '2024-04-24 11:53:38', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 12, fecha_solicitud: 2024-04-25, anio_solicitud: 31, descripcion:  sdfdsf, estado: A, fecha_entrevista: 2024-04-11, nombre_encuestador: sdfsf', NULL, 'fichas', NULL),
(114, '2024-04-25 23:46:27', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 1, fecha_solicitud: 2024-04-25, anio_solicitud: 2024, descripcion:  Prueba 1, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: Prueba 1', NULL, 'fichas', NULL),
(115, '2024-04-26 01:55:36', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 2, fecha_solicitud: 2024-04-25, anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', NULL, 'fichas', NULL),
(116, '2024-04-26 02:24:07', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 3, fecha_solicitud: 2024-04-25, anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', NULL, 'fichas', NULL),
(117, '2024-04-26 02:24:42', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 4, fecha_solicitud: 2024-04-25, anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', NULL, 'fichas', NULL),
(118, '2024-04-26 02:24:55', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-25, anio_solicitud: 2024, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', 'Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-25 anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacionA, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', 'fichas', NULL),
(119, '2024-04-26 02:28:54', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-25, anio_solicitud: 2024, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', 'Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-25 anio_solicitud: 2024, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacionA, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', 'fichas', NULL),
(120, '2024-04-27 03:13:51', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-25, anio_solicitud: 2024, descripcion:  Prueba 1, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: Prueba 1', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-25 anio_solicitud: 2024, descripcion:  Prueba 1A, fecha_entrevista: 2024-04-25, nombre_encuestador: Prueba 1', 'fichas', NULL),
(121, '2024-04-27 03:14:30', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', NULL, 'fichas', NULL),
(122, '2024-04-27 03:37:51', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 4, fecha_solicitud: 2024-04-25, anio_solicitud: 2024, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', 'Información anterior = id_ficha: 4, fecha_solicitud: 2024-04-25 anio_solicitud: 2024, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacionA, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', 'fichas', NULL),
(123, '2024-04-27 03:39:40', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-04-25, anio_solicitud: 2024, descripcion:  Prueba 1, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: Prueba 1', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-04-25 anio_solicitud: 2024, descripcion:  Prueba 1A, fecha_entrevista: 2024-04-25, nombre_encuestador: Prueba 1', 'fichas', NULL),
(124, '2024-04-27 03:40:01', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-25, anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-25 anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacionA, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', 'fichas', NULL);
INSERT INTO `bitacoras` (`id_bitacora`, `fecha`, `ejecutor`, `actividad_realizada`, `informacion_actual`, `informacion_anterior`, `tabla`, `informacion_eliminada`) VALUES
(125, '2024-04-27 03:45:40', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-25, anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-25 anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacionA, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', 'fichas', NULL),
(126, '2024-04-27 03:47:00', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-04-25, anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-04-25 anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacionA, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', 'fichas', NULL),
(127, '2024-04-27 03:49:18', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-04-25, anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacion, estado: A, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-04-25 anio_solicitud: 2023, descripcion:  Esta es la primera ficha desde 0 de la clase de evaluacionA, fecha_entrevista: 2024-04-25, nombre_encuestador: EncuestadoFinal', 'fichas', NULL),
(128, '2024-04-30 03:46:48', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'fichas', NULL),
(129, '2024-04-30 04:19:17', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'fichas', NULL),
(130, '2024-04-30 04:37:22', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'fichas', NULL),
(131, '2024-04-30 04:38:07', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'fichas', NULL),
(132, '2024-04-30 04:45:52', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'fichas', NULL),
(133, '2024-05-01 02:17:26', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'fichas', NULL),
(134, '2024-05-01 02:20:29', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'fichas', NULL),
(135, '2024-05-01 02:21:33', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-04-26, anio_solicitud: 2024, descripcion:  gh, estado: A, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-04-26 anio_solicitud: 2024, descripcion:  ghA, fecha_entrevista: 2024-04-26, nombre_encuestador: Honduras', 'fichas', NULL),
(136, '2024-05-01 02:27:38', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 6, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(137, '2024-05-01 02:31:06', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 7, fecha_solicitud: 2024-04-02, anio_solicitud: 2024, descripcion:  sdfds, estado: A, fecha_entrevista: 2024-04-08, nombre_encuestador: sdfsdf', NULL, 'fichas', NULL),
(138, '2024-05-01 02:34:05', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 8, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(139, '2024-05-01 02:39:54', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 9, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', NULL, 'fichas', NULL),
(140, '2024-05-01 02:46:15', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 10, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', NULL, 'fichas', NULL),
(141, '2024-05-01 02:49:05', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 11, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', NULL, 'fichas', NULL),
(142, '2024-05-01 04:16:28', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 11, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', 'Información anterior = id_ficha: 11, fecha_solicitud: 2024-04-04 anio_solicitud: 204, descripcion: preba A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', 'fichas', NULL),
(143, '2024-05-01 04:21:39', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 11, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', 'Información anterior = id_ficha: 11, fecha_solicitud: 2024-04-04 anio_solicitud: 204, descripcion: preba A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', 'fichas', NULL),
(144, '2024-05-01 04:39:24', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 11, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', 'Información anterior = id_ficha: 11, fecha_solicitud: 2024-04-04 anio_solicitud: 204, descripcion: preba A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', 'fichas', NULL),
(145, '2024-05-01 16:31:51', 'root@localhost', 'Se insertó', 'Información actual: Id_Municipio = 93, Id_Departamento = 2, Nombre_Municipio = sfsd, Descripcion = sfdsf', NULL, 'tbl_municipios', NULL),
(146, '2024-05-01 16:32:08', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Municipio = 93, Id_Departamento = 2, Nombre_Municipio = sfsd, Descripcion = ggdfgdf', 'Información anterior: Id_Municipio = 93, Id_Departamento = 2, Nombre_Municipio = sfsd, Descripcion = sfdsf', 'tbl_municipios', NULL),
(147, '2024-05-01 16:32:26', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_municipios', 'Información eliminada: Id_Municipio = 93, Id_Departamento = 2, Nombre_Municipio = sfsd, Descripcion = ggdfgdf'),
(148, '2024-05-01 16:33:10', 'root@localhost', 'Se insertó', 'Información actual: Id_Aldea = 153, Id_Departamento = 2, Id_Municipio = 2, Nombre_Aldea = doaaa, Descripcion = dasd, Estado = A', NULL, 'tbl_aldeas', NULL),
(149, '2024-05-01 16:33:21', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Aldea = 153, Id_Departamento = 2, Id_Municipio = 2, Nombre_Aldea = doaaa, Descripcion = dasd, Estado = I', 'Información anterior: Id_Aldea = 153, Id_Departamento = 2, Id_Municipio = 2, Nombre_Aldea = doaaa, Descripcion = dasd, Estado = A', 'tbl_aldeas', NULL),
(150, '2024-05-01 16:33:26', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_aldeas', 'Información eliminada: Id_Aldea = 153, Id_Departamento = 2, Id_Municipio = 2, Nombre_Aldea = doaaa, Descripcion = dasd, Estado = I'),
(151, '2024-05-01 16:34:08', 'root@localhost', 'Se insertó', 'Información actual: Id_Municipio = 94, Id_Departamento = 2, Nombre_Municipio = fsdf, Descripcion = sfsdf', NULL, 'tbl_municipios', NULL),
(152, '2024-05-01 16:34:13', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_municipios', 'Información eliminada: Id_Municipio = 94, Id_Departamento = 2, Nombre_Municipio = fsdf, Descripcion = sfsdf'),
(153, '2024-05-01 16:34:36', 'root@localhost', 'Se insertó', 'Información actual: id_organizacion = 9, organizacion = dassd, id_tipo_organizacion = 1, descripcion = asdasd', NULL, 'tbl_organizaciones', NULL),
(154, '2024-05-01 16:34:46', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_organizaciones', 'Información eliminada: id_organizacion = 9, organizacion = dassd, id_tipo_organizacion = 1, descripcion = asdasd'),
(155, '2024-05-01 16:38:27', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 11, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', 'Información anterior = id_ficha: 11, fecha_solicitud: 2024-04-04 anio_solicitud: 204, descripcion: preba A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', 'fichas', NULL),
(156, '2024-05-01 16:38:36', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 14, Id_Ficha = 11, Id_Ubicacion = 16, Id_Productor = 22, Tiene_Riego = S, Superficie_Riego = 11.00', 'Información anterior: Id_Manejo_Riego = 14, Id_Ficha = 11, Id_Ubicacion = 16, Id_Productor = 22, Tiene_Riego = S, Superficie_Riego = 11.00', 'tbl_manejo_riego', NULL),
(157, '2024-05-01 16:38:49', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 31, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 3, Descripcion =  '),
(158, '2024-05-01 16:38:49', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 32, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 4, Descripcion =  '),
(159, '2024-05-01 16:38:49', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 33, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(160, '2024-05-01 16:38:49', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 34, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(161, '2024-05-01 16:49:15', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 11, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', 'Información anterior = id_ficha: 11, fecha_solicitud: 2024-04-04 anio_solicitud: 204, descripcion: preba A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', 'fichas', NULL),
(162, '2024-05-01 16:49:22', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 14, Id_Ficha = 11, Id_Ubicacion = 16, Id_Productor = 22, Tiene_Riego = S, Superficie_Riego = 11.00', 'Información anterior: Id_Manejo_Riego = 14, Id_Ficha = 11, Id_Ubicacion = 16, Id_Productor = 22, Tiene_Riego = S, Superficie_Riego = 11.00', 'tbl_manejo_riego', NULL),
(163, '2024-05-01 16:49:29', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 33, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 3, Descripcion =  '),
(164, '2024-05-01 16:49:29', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 34, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 4, Descripcion =  '),
(165, '2024-05-01 16:49:30', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 35, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(166, '2024-05-01 16:49:30', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 36, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(167, '2024-05-01 16:50:02', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 11, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', 'Información anterior = id_ficha: 11, fecha_solicitud: 2024-04-04 anio_solicitud: 204, descripcion: preba A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', 'fichas', NULL),
(168, '2024-05-01 16:50:11', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 14, Id_Ficha = 11, Id_Ubicacion = 16, Id_Productor = 22, Tiene_Riego = S, Superficie_Riego = 11.00', 'Información anterior: Id_Manejo_Riego = 14, Id_Ficha = 11, Id_Ubicacion = 16, Id_Productor = 22, Tiene_Riego = S, Superficie_Riego = 11.00', 'tbl_manejo_riego', NULL),
(169, '2024-05-01 16:50:16', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 35, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 3, Descripcion =  '),
(170, '2024-05-01 16:50:16', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 36, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 4, Descripcion =  '),
(171, '2024-05-01 16:50:16', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 37, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(172, '2024-05-01 16:50:16', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 38, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(173, '2024-05-01 16:51:13', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 11, fecha_solicitud: 2024-04-04, anio_solicitud: 204, descripcion: preba , estado: A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', 'Información anterior = id_ficha: 11, fecha_solicitud: 2024-04-04 anio_solicitud: 204, descripcion: preba A, fecha_entrevista: 2024-04-01, nombre_encuestador: Maria', 'fichas', NULL),
(174, '2024-05-01 16:51:20', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 14, Id_Ficha = 11, Id_Ubicacion = 16, Id_Productor = 22, Tiene_Riego = S, Superficie_Riego = 11.00', 'Información anterior: Id_Manejo_Riego = 14, Id_Ficha = 11, Id_Ubicacion = 16, Id_Productor = 22, Tiene_Riego = S, Superficie_Riego = 11.00', 'tbl_manejo_riego', NULL),
(175, '2024-05-01 16:51:27', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 37, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 3, Descripcion =  '),
(176, '2024-05-01 16:51:27', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 38, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 4, Descripcion =  '),
(177, '2024-05-01 16:51:27', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 39, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(178, '2024-05-01 16:51:27', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 40, Id_Ficha = 11, Id_Productor = 22, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(179, '2024-05-01 20:51:58', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 1, fecha_solicitud: 2024-05-02, anio_solicitud: 2024, descripcion:  sfsd, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: sdfsdf', NULL, 'fichas', NULL),
(180, '2024-05-01 21:01:31', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-05-02, anio_solicitud: 2024, descripcion:  sfsd, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: sdfsdf', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-05-02 anio_solicitud: 2024, descripcion:  sfsdA, fecha_entrevista: 2024-05-02, nombre_encuestador: sdfsdf', 'fichas', NULL),
(181, '2024-05-01 21:04:48', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-05-02, anio_solicitud: 2024, descripcion:  sfsd, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: sdfsdf', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-05-02 anio_solicitud: 2024, descripcion:  sfsdA, fecha_entrevista: 2024-05-02, nombre_encuestador: sdfsdf', 'fichas', NULL),
(182, '2024-05-01 21:09:24', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 2, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(183, '2024-05-02 02:25:40', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 1, fecha_solicitud: 2024-05-01, anio_solicitud: 2024, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-09, nombre_encuestador: Olivia Rodrigo', NULL, 'fichas', NULL),
(184, '2024-05-02 02:30:02', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 2, fecha_solicitud: 2024-05-01, anio_solicitud: 2024, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-09, nombre_encuestador: Olivia Rodrigo', NULL, 'fichas', NULL),
(185, '2024-05-02 02:30:26', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-05-01, anio_solicitud: 2024, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-09, nombre_encuestador: Olivia Rodrigo', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-05-01 anio_solicitud: 2024, descripcion:  pruebaA, fecha_entrevista: 2024-05-09, nombre_encuestador: Olivia Rodrigo', 'fichas', NULL),
(186, '2024-05-02 02:31:23', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-05-01, anio_solicitud: 2024, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-09, nombre_encuestador: Olivia Rodrigo', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-05-01 anio_solicitud: 2024, descripcion:  pruebaA, fecha_entrevista: 2024-05-09, nombre_encuestador: Olivia Rodrigo', 'fichas', NULL),
(187, '2024-05-02 07:43:29', 'root@localhost', 'Se insertó', 'Información actual: id_etnia = 14, etnia = Etnia 12, descripcion = TierrasSana', NULL, 'tbl_etnias', NULL),
(188, '2024-05-02 07:47:01', 'root@localhost', 'Se actualizó', 'Información actualizada: id_etnia = 14, etnia = Etnia edit, descripcion = edti', 'Información anterior: id_etnia = 14, etnia = Etnia 12, descripcion = TierrasSana', 'tbl_etnias', NULL),
(189, '2024-05-02 07:47:12', 'root@localhost', 'Se actualizó', 'Información actualizada: id_etnia = 14, etnia = adsa, descripcion = sdad', 'Información anterior: id_etnia = 14, etnia = Etnia edit, descripcion = edti', 'tbl_etnias', NULL),
(190, '2024-05-02 07:51:20', 'root@localhost', 'Se actualizó', 'Información actualizada: id_etnia = 14, etnia = Ladino, descripcion = sdad', 'Información anterior: id_etnia = 14, etnia = adsa, descripcion = sdad', 'tbl_etnias', NULL),
(191, '2024-05-02 07:51:49', 'root@localhost', 'Se actualizó', 'Información actualizada: id_etnia = 14, etnia = asda, descripcion = sdad', 'Información anterior: id_etnia = 14, etnia = Ladino, descripcion = sdad', 'tbl_etnias', NULL),
(192, '2024-05-02 07:53:17', 'root@localhost', 'Se actualizó', 'Información actualizada: id_etnia = 14, etnia = Ladino, descripcion = sdad', 'Información anterior: id_etnia = 14, etnia = asda, descripcion = sdad', 'tbl_etnias', NULL),
(193, '2024-05-02 07:55:57', 'root@localhost', 'Se actualizó', 'Información actualizada: id_etnia = 14, etnia = sadasd, descripcion = sdad', 'Información anterior: id_etnia = 14, etnia = Ladino, descripcion = sdad', 'tbl_etnias', NULL),
(194, '2024-05-02 07:56:20', 'root@localhost', 'Se actualizó', 'Información actualizada: id_etnia = 14, etnia = ghfdgsdf, descripcion = sdad', 'Información anterior: id_etnia = 14, etnia = sadasd, descripcion = sdad', 'tbl_etnias', NULL),
(195, '2024-05-02 08:15:30', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_etnias', 'Información eliminada: id_etnia = 14, etnia = ghfdgsdf, descripcion = sdad'),
(196, '2024-05-02 08:15:35', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_etnias', 'Información eliminada: id_etnia = 13, etnia = , descripcion = '),
(197, '2024-05-02 08:16:19', 'root@localhost', 'Se insertó', 'Información actual: id_etnia = 15, etnia = CrearE, descripcion = CrearE', NULL, 'tbl_etnias', NULL),
(198, '2024-05-02 08:16:39', 'root@localhost', 'Se actualizó', 'Información actualizada: id_etnia = 15, etnia = CrearED, descripcion = CrearED', 'Información anterior: id_etnia = 15, etnia = CrearE, descripcion = CrearE', 'tbl_etnias', NULL),
(199, '2024-05-02 08:16:48', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_etnias', 'Información eliminada: id_etnia = 15, etnia = CrearED, descripcion = CrearED'),
(200, '2024-05-02 08:21:58', 'root@localhost', 'Se insertó', 'Información actual: Id_Departamento = 24, Nombre_Departamento = prueba, Descripcion = desc', NULL, 'tbl_departamentos', NULL),
(201, '2024-05-02 08:22:05', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Departamento = 24, Nombre_Departamento = prueba, Descripcion = desc', 'Información anterior: Id_Departamento = 24, Nombre_Departamento = prueba, Descripcion = desc', 'tbl_departamentos', NULL),
(202, '2024-05-02 08:22:24', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_departamentos', 'Información eliminada: Id_Departamento = 24, Nombre_Departamento = prueba, Descripcion = desc'),
(203, '2024-05-02 08:24:04', 'root@localhost', 'Se insertó', 'Información actual: Id_Municipio = 95, Id_Departamento = 22, Nombre_Municipio = prueba, Descripcion = desc', NULL, 'tbl_municipios', NULL),
(204, '2024-05-02 08:24:32', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_municipios', 'Información eliminada: Id_Municipio = 95, Id_Departamento = 22, Nombre_Municipio = prueba, Descripcion = desc'),
(205, '2024-05-02 08:24:59', 'root@localhost', 'Se insertó', 'Información actual: Id_Aldea = 154, Id_Departamento = 1, Id_Municipio = 1, Nombre_Aldea = prueba, Descripcion = desc, Estado = A', NULL, 'tbl_aldeas', NULL),
(206, '2024-05-02 08:26:05', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Aldea = 154, Id_Departamento = 1, Id_Municipio = 1, Nombre_Aldea = Esparta, Descripcion = desc, Estado = A', 'Información anterior: Id_Aldea = 154, Id_Departamento = 1, Id_Municipio = 1, Nombre_Aldea = prueba, Descripcion = desc, Estado = A', 'tbl_aldeas', NULL),
(207, '2024-05-02 08:31:34', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Aldea = 154, Id_Departamento = 1, Id_Municipio = 1, Nombre_Aldea = Espartaasa, Descripcion = desc, Estado = A', 'Información anterior: Id_Aldea = 154, Id_Departamento = 1, Id_Municipio = 1, Nombre_Aldea = Esparta, Descripcion = desc, Estado = A', 'tbl_aldeas', NULL),
(208, '2024-05-02 08:32:00', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_aldeas', 'Información eliminada: Id_Aldea = 154, Id_Departamento = 1, Id_Municipio = 1, Nombre_Aldea = Espartaasa, Descripcion = desc, Estado = A'),
(209, '2024-05-02 08:32:18', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Aldea = 152, Id_Departamento = 23, Id_Municipio = 91, Nombre_Aldea = AldeaInactiva, Descripcion = AldeaInactiva, Estado = I', 'Información anterior: Id_Aldea = 152, Id_Departamento = 23, Id_Municipio = 91, Nombre_Aldea = AldeaInactiva, Descripcion = AldeaInactiva, Estado = A', 'tbl_aldeas', NULL),
(210, '2024-05-02 09:05:41', 'root@localhost', 'Se insertó', 'Información actual: Id_Cacerio = 7, Id_Aldea = 1, Id_Municipio = 1, Id_Departamento = 1, Nombre_Cacerio = prueba C, Descripcion = sadasdasdgs', NULL, 'tbl_cacerios', NULL),
(211, '2024-05-02 09:06:58', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Cacerio = 7, Id_Aldea = 1, Id_Municipio = 1, Id_Departamento = 1, Nombre_Cacerio = prueba C, Descripcion = sadasdasdgs', 'Información anterior: Id_Cacerio = 7, Id_Aldea = 1, Id_Municipio = 1, Id_Departamento = 1, Nombre_Cacerio = prueba C, Descripcion = sadasdasdgs', 'tbl_cacerios', NULL),
(212, '2024-05-02 09:07:06', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Cacerio = 7, Id_Aldea = 1, Id_Municipio = 1, Id_Departamento = 1, Nombre_Cacerio = prueba C, Descripcion = sadasdasdgs', 'Información anterior: Id_Cacerio = 7, Id_Aldea = 1, Id_Municipio = 1, Id_Departamento = 1, Nombre_Cacerio = prueba C, Descripcion = sadasdasdgs', 'tbl_cacerios', NULL),
(213, '2024-05-02 09:07:10', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Cacerio = 7, Id_Aldea = 1, Id_Municipio = 1, Id_Departamento = 1, Nombre_Cacerio = prueba C, Descripcion = sadasdasdgs', 'Información anterior: Id_Cacerio = 7, Id_Aldea = 1, Id_Municipio = 1, Id_Departamento = 1, Nombre_Cacerio = prueba C, Descripcion = sadasdasdgs', 'tbl_cacerios', NULL),
(214, '2024-05-02 09:07:14', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_cacerios', 'Información eliminada: Id_Cacerio = 7, Id_Aldea = 1, Id_Municipio = 1, Id_Departamento = 1, Nombre_Cacerio = prueba C, Descripcion = sadasdasdgs'),
(215, '2024-05-02 09:08:56', 'root@localhost', 'Se insertó', 'Información actual: id_organizacion = 10, organizacion = PRUebacrea , id_tipo_organizacion = 1, descripcion = PRUebacrea ', NULL, 'tbl_organizaciones', NULL),
(216, '2024-05-02 09:19:08', 'root@localhost', 'Se insertó', 'Información actual: id_organizacion = 11, organizacion = afre, id_tipo_organizacion = 9, descripcion = TierrasSana', NULL, 'tbl_organizaciones', NULL),
(217, '2024-05-02 09:53:14', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_organizaciones', 'Información eliminada: id_organizacion = 11, organizacion = afre, id_tipo_organizacion = 9, descripcion = TierrasSana'),
(218, '2024-05-02 09:53:26', 'root@localhost', 'Se actualizó', 'Información actualizada: id_organizacion = 10, organizacion = PRUebacrea , id_tipo_organizacion = 9, descripcion = PRUebacrea ', 'Información anterior: id_organizacion = 10, organizacion = PRUebacrea , id_tipo_organizacion = 1, descripcion = PRUebacrea ', 'tbl_organizaciones', NULL),
(219, '2024-05-02 09:53:37', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_organizaciones', 'Información eliminada: id_organizacion = 10, organizacion = PRUebacrea , id_tipo_organizacion = 9, descripcion = PRUebacrea '),
(220, '2024-05-02 09:53:45', 'root@localhost', 'Se insertó', 'Información actual: id_organizacion = 12, organizacion = PRUeba, id_tipo_organizacion = 9, descripcion = TierrasSana', NULL, 'tbl_organizaciones', NULL),
(221, '2024-05-02 09:53:49', 'root@localhost', 'Se actualizó', 'Información actualizada: id_organizacion = 12, organizacion = PRUeba, id_tipo_organizacion = 9, descripcion = TierrasSana', 'Información anterior: id_organizacion = 12, organizacion = PRUeba, id_tipo_organizacion = 9, descripcion = TierrasSana', 'tbl_organizaciones', NULL),
(222, '2024-05-02 09:59:30', 'root@localhost', 'Se actualizó', 'Información actualizada: id_organizacion = 12, organizacion = PRUeba, id_tipo_organizacion = 9, descripcion = afd', 'Información anterior: id_organizacion = 12, organizacion = PRUeba, id_tipo_organizacion = 9, descripcion = TierrasSana', 'tbl_organizaciones', NULL),
(223, '2024-05-02 09:59:34', 'root@localhost', 'Se actualizó', 'Información actualizada: id_organizacion = 12, organizacion = PRUeba, id_tipo_organizacion = 9, descripcion = afd', 'Información anterior: id_organizacion = 12, organizacion = PRUeba, id_tipo_organizacion = 9, descripcion = afd', 'tbl_organizaciones', NULL),
(224, '2024-05-02 09:59:42', 'root@localhost', 'Se actualizó', 'Información actualizada: id_organizacion = 12, organizacion = PRUeba, id_tipo_organizacion = 9, descripcion = afdfefe', 'Información anterior: id_organizacion = 12, organizacion = PRUeba, id_tipo_organizacion = 9, descripcion = afd', 'tbl_organizaciones', NULL),
(225, '2024-05-02 09:59:47', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_organizaciones', 'Información eliminada: id_organizacion = 12, organizacion = PRUeba, id_tipo_organizacion = 9, descripcion = afdfefe'),
(226, '2024-05-02 10:01:20', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_organizacion = 10, tipo_organizacion = Preuena, descripcion = TierrasSana', NULL, 'tbl_tipo_organizacion', NULL),
(227, '2024-05-02 10:11:40', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_organizacion = 11, tipo_organizacion = afdafsdafe, descripcion = rgergfewafqe', NULL, 'tbl_tipo_organizacion', NULL),
(228, '2024-05-02 10:12:18', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 11, tipo_organizacion = afdafsdafe, descripcion = rgergfewafqe', 'Información anterior: id_tipo_organizacion = 11, tipo_organizacion = afdafsdafe, descripcion = rgergfewafqe', 'tbl_tipo_organizacion', NULL),
(229, '2024-05-02 10:15:14', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 11, tipo_organizacion = afdafsdafe, descripcion = rgergfewafqe', 'Información anterior: id_tipo_organizacion = 11, tipo_organizacion = afdafsdafe, descripcion = rgergfewafqe', 'tbl_tipo_organizacion', NULL),
(230, '2024-05-02 10:15:21', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 11, tipo_organizacion = afdafsdaferfd3qe, descripcion = vrgsfdasfde', 'Información anterior: id_tipo_organizacion = 11, tipo_organizacion = afdafsdafe, descripcion = rgergfewafqe', 'tbl_tipo_organizacion', NULL),
(231, '2024-05-02 10:15:25', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 11, tipo_organizacion = afdafsdaferfd3qe, descripcion = vrgsfdasfde', 'Información anterior: id_tipo_organizacion = 11, tipo_organizacion = afdafsdaferfd3qe, descripcion = vrgsfdasfde', 'tbl_tipo_organizacion', NULL),
(232, '2024-05-02 10:15:28', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_tipo_organizacion', 'Información eliminada: id_tipo_organizacion = 11, tipo_organizacion = afdafsdaferfd3qe, descripcion = vrgsfdasfde'),
(233, '2024-05-02 10:15:40', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 8, tipo_organizacion = ORGACtiva, descripcion = ORGActivo', 'Información anterior: id_tipo_organizacion = 8, tipo_organizacion = ORGACtiva, descripcion = ORGActivo', 'tbl_tipo_organizacion', NULL),
(234, '2024-05-02 10:15:40', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 8, tipo_organizacion = ORGACtiva, descripcion = ORGActivo', 'Información anterior: id_tipo_organizacion = 8, tipo_organizacion = ORGACtiva, descripcion = ORGActivo', 'tbl_tipo_organizacion', NULL),
(235, '2024-05-02 10:15:57', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 10, tipo_organizacion = Preuena, descripcion = TierrasSana', 'Información anterior: id_tipo_organizacion = 10, tipo_organizacion = Preuena, descripcion = TierrasSana', 'tbl_tipo_organizacion', NULL),
(236, '2024-05-02 10:19:12', 'root@localhost', 'Se insertó', 'Información actual: Id_motivo = 12, Motivo = DXFCVGBH, Descripcion = dasvgsfd', NULL, 'tbl_motivos_migracion', NULL),
(237, '2024-05-02 10:22:23', 'root@localhost', 'Se insertó', 'Información actual: Id_motivo = 13, Motivo = dffse, Descripcion = dwa', NULL, 'tbl_motivos_migracion', NULL),
(238, '2024-05-02 10:22:29', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_motivo = 13, Motivo = dffse, Descripcion = dwa', 'Información anterior: Id_motivo = 13, Motivo = dffse, Descripcion = dwa', 'tbl_motivos_migracion', NULL),
(239, '2024-05-02 10:24:48', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_motivo = 13, Motivo = dffse, Descripcion = dwa', 'Información anterior: Id_motivo = 13, Motivo = dffse, Descripcion = dwa', 'tbl_motivos_migracion', NULL),
(240, '2024-05-02 10:24:53', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_motivo = 13, Motivo = dffse, Descripcion = dwa', 'Información anterior: Id_motivo = 13, Motivo = dffse, Descripcion = dwa', 'tbl_motivos_migracion', NULL),
(241, '2024-05-02 10:25:21', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_motivo = 13, Motivo = dffse, Descripcion = dwa', 'Información anterior: Id_motivo = 13, Motivo = dffse, Descripcion = dwa', 'tbl_motivos_migracion', NULL),
(242, '2024-05-02 10:25:24', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_motivos_migracion', 'Información eliminada: Id_motivo = 13, Motivo = dffse, Descripcion = dwa'),
(243, '2024-05-02 10:25:27', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_motivos_migracion', 'Información eliminada: Id_motivo = 12, Motivo = DXFCVGBH, Descripcion = dasvgsfd'),
(244, '2024-05-02 10:30:09', 'root@localhost', 'Se insertó', 'Información actual: id_medida = 18, medida = , descripcion = dwadqew', NULL, 'tbl_medidas_tierra', NULL),
(245, '2024-05-02 10:33:10', 'root@localhost', 'Se insertó', 'Información actual: id_medida = 19, medida = gfdfrswgfe, descripcion = fewrsfw', NULL, 'tbl_medidas_tierra', NULL),
(246, '2024-05-02 10:36:21', 'root@localhost', 'Se actualizó', 'Información actualizada: id_medida = 19, medida = tgdefrwsfd, descripcion = rga', 'Información anterior: id_medida = 19, medida = gfdfrswgfe, descripcion = fewrsfw', 'tbl_medidas_tierra', NULL),
(247, '2024-05-02 10:36:48', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_medidas_tierra', 'Información eliminada: id_medida = 19, medida = tgdefrwsfd, descripcion = rga'),
(248, '2024-05-02 10:37:02', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_medidas_tierra', 'Información eliminada: id_medida = 18, medida = , descripcion = dwadqew'),
(249, '2024-05-02 10:37:06', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_medidas_tierra', 'Información eliminada: id_medida = 17, medida = , descripcion = MedidaInactiva'),
(250, '2024-05-02 10:37:10', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_medidas_tierra', 'Información eliminada: id_medida = 16, medida = , descripcion = MedidaActiva'),
(251, '2024-05-02 10:37:15', 'root@localhost', 'Se insertó', 'Información actual: id_medida = 20, medida = wrfsdefg, descripcion = aerfaefadfa', NULL, 'tbl_medidas_tierra', NULL),
(252, '2024-05-02 10:37:23', 'root@localhost', 'Se actualizó', 'Información actualizada: id_medida = 20, medida = fdgafgafaef, descripcion = arfgaregafdga', 'Información anterior: id_medida = 20, medida = wrfsdefg, descripcion = aerfaefadfa', 'tbl_medidas_tierra', NULL),
(253, '2024-05-02 10:37:28', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_medidas_tierra', 'Información eliminada: id_medida = 20, medida = fdgafgafaef, descripcion = arfgaregafdga'),
(254, '2024-05-02 16:21:59', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_cultivo = 13, tipo_cultivo = fvsdfa, descripcion = asdasdads', NULL, 'tbl_tipo_cultivo', NULL),
(255, '2024-05-02 16:22:06', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_cultivo = 13, tipo_cultivo = fvsdfa, descripcion = sdfada', 'Información anterior: id_tipo_cultivo = 13, tipo_cultivo = fvsdfa, descripcion = asdasdads', 'tbl_tipo_cultivo', NULL),
(256, '2024-05-02 16:22:12', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_cultivo = 13, tipo_cultivo = afdgrsdefaedd, descripcion = sdfada', 'Información anterior: id_tipo_cultivo = 13, tipo_cultivo = fvsdfa, descripcion = sdfada', 'tbl_tipo_cultivo', NULL),
(257, '2024-05-02 16:22:33', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_tipo_cultivo', 'Información eliminada: id_tipo_cultivo = 13, tipo_cultivo = afdgrsdefaedd, descripcion = sdfada'),
(258, '2024-05-02 16:23:46', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_pecuario = 13, tipo_pecuario = ergafafawefaewrf, raza_con_genero = s, descripcion = TierrasSana', NULL, 'tbl_tipo_pecuarios', NULL),
(259, '2024-05-02 16:23:52', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_pecuario = 13, tipo_pecuario = , raza_con_genero = s, descripcion = TierrasSana', 'Información anterior: id_tipo_pecuario = 13, tipo_pecuario = ergafafawefaewrf, raza_con_genero = s, descripcion = TierrasSana', 'tbl_tipo_pecuarios', NULL),
(260, '2024-05-02 16:24:01', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_pecuario = 13, tipo_pecuario = , raza_con_genero = s, descripcion = TierrasSana', 'Información anterior: id_tipo_pecuario = 13, tipo_pecuario = , raza_con_genero = s, descripcion = TierrasSana', 'tbl_tipo_pecuarios', NULL),
(261, '2024-05-02 16:24:06', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_pecuario = 13, tipo_pecuario = , raza_con_genero = s, descripcion = TierrasSana', 'Información anterior: id_tipo_pecuario = 13, tipo_pecuario = , raza_con_genero = s, descripcion = TierrasSana', 'tbl_tipo_pecuarios', NULL),
(262, '2024-05-02 16:25:29', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_pecuario = 13, tipo_pecuario = sdfasfdasd, raza_con_genero = s, descripcion = TierrasSana', 'Información anterior: id_tipo_pecuario = 13, tipo_pecuario = , raza_con_genero = s, descripcion = TierrasSana', 'tbl_tipo_pecuarios', NULL),
(263, '2024-05-02 16:25:36', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_pecuario = 12, tipo_pecuario = frgafasfd, raza_con_genero = s, descripcion = PeInactivo', 'Información anterior: id_tipo_pecuario = 12, tipo_pecuario = , raza_con_genero = s, descripcion = PeInactivo', 'tbl_tipo_pecuarios', NULL),
(264, '2024-05-02 16:25:38', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_pecuario = 12, tipo_pecuario = frgafasfd, raza_con_genero = s, descripcion = PeInactivo', 'Información anterior: id_tipo_pecuario = 12, tipo_pecuario = frgafasfd, raza_con_genero = s, descripcion = PeInactivo', 'tbl_tipo_pecuarios', NULL),
(265, '2024-05-02 16:25:46', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_pecuario = 12, tipo_pecuario = frgafasfd, raza_con_genero = s, descripcion = PeInactivo', 'Información anterior: id_tipo_pecuario = 12, tipo_pecuario = frgafasfd, raza_con_genero = s, descripcion = PeInactivo', 'tbl_tipo_pecuarios', NULL),
(266, '2024-05-02 16:25:55', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_pecuario = 12, tipo_pecuario = PeInactivo, raza_con_genero = s, descripcion = PeInactivo', 'Información anterior: id_tipo_pecuario = 12, tipo_pecuario = frgafasfd, raza_con_genero = s, descripcion = PeInactivo', 'tbl_tipo_pecuarios', NULL),
(267, '2024-05-02 16:26:03', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_pecuario = 12, tipo_pecuario = PeInactivo, raza_con_genero = s, descripcion = PeInactivo', 'Información anterior: id_tipo_pecuario = 12, tipo_pecuario = PeInactivo, raza_con_genero = s, descripcion = PeInactivo', 'tbl_tipo_pecuarios', NULL),
(268, '2024-05-02 16:26:10', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_tipo_pecuarios', 'Información eliminada: id_tipo_pecuario = 13, tipo_pecuario = sdfasfdasd, raza_con_genero = s, descripcion = TierrasSana'),
(269, '2024-05-02 16:33:17', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_produccion = 13, tipo_produccion = ProActivo, descripcion = TierrasSana', NULL, 'tbl_tipo_produccion', NULL),
(270, '2024-05-02 16:33:42', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_produccion = 1, tipo_produccion = Producción de leche, descripcion = Leche', 'Información anterior: id_tipo_produccion = 1, tipo_produccion = Producción de leche, descripcion = Leche', 'tbl_tipo_produccion', NULL),
(271, '2024-05-02 16:33:42', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_produccion = 2, tipo_produccion = Producción de carne, descripcion = Carne', 'Información anterior: id_tipo_produccion = 2, tipo_produccion = Producción de carne, descripcion = Carne', 'tbl_tipo_produccion', NULL),
(272, '2024-05-02 16:33:42', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_produccion = 3, tipo_produccion = Producción de derivados de leche, descripcion = Derivados de la leche', 'Información anterior: id_tipo_produccion = 3, tipo_produccion = Producción de derivados de leche, descripcion = Derivados de la leche', 'tbl_tipo_produccion', NULL),
(273, '2024-05-02 16:33:42', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_produccion = 4, tipo_produccion = Producción de huevos, descripcion = Huevos', 'Información anterior: id_tipo_produccion = 4, tipo_produccion = Producción de huevos, descripcion = Huevos', 'tbl_tipo_produccion', NULL),
(274, '2024-05-02 16:33:42', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_produccion = 5, tipo_produccion = Producción apícola , descripcion = Apicola', 'Información anterior: id_tipo_produccion = 5, tipo_produccion = Producción apícola , descripcion = Apicola', 'tbl_tipo_produccion', NULL),
(275, '2024-05-02 16:33:42', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_produccion = 6, tipo_produccion = Producto de Transformación, descripcion = Transformación', 'Información anterior: id_tipo_produccion = 6, tipo_produccion = Producto de Transformación, descripcion = Transformación', 'tbl_tipo_produccion', NULL),
(276, '2024-05-02 16:33:42', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_produccion = 12, tipo_produccion = ProInactivo, descripcion = ProInactivo', 'Información anterior: id_tipo_produccion = 12, tipo_produccion = ProInactivo, descripcion = ProInactivo', 'tbl_tipo_produccion', NULL),
(277, '2024-05-02 16:33:51', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_produccion = 12, tipo_produccion = ProInactivo, descripcion = ProInactivo', 'Información anterior: id_tipo_produccion = 12, tipo_produccion = ProInactivo, descripcion = ProInactivo', 'tbl_tipo_produccion', NULL),
(278, '2024-05-02 16:36:20', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_produccion = 14, tipo_produccion = fseadwf, descripcion = arefWEFDAWEFD', NULL, 'tbl_tipo_produccion', NULL),
(279, '2024-05-02 16:36:41', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_produccion = 14, tipo_produccion = fgfgfgwwwwfgg, descripcion = poiujyhtf', 'Información anterior: id_tipo_produccion = 14, tipo_produccion = fseadwf, descripcion = arefWEFDAWEFD', 'tbl_tipo_produccion', NULL),
(280, '2024-05-02 16:37:59', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_tipo_produccion', 'Información eliminada: id_tipo_produccion = 14, tipo_produccion = fgfgfgwwwwfgg, descripcion = poiujyhtf'),
(281, '2024-05-02 16:38:53', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_produccion = 13, tipo_produccion = ProActivo, descripcion = TierrasSana1', 'Información anterior: id_tipo_produccion = 13, tipo_produccion = ProActivo, descripcion = TierrasSana', 'tbl_tipo_produccion', NULL),
(282, '2024-05-02 16:39:58', 'root@localhost', 'Se insertó', 'Información actual: id_periodo = 15, periodo = PerActivo, descripcion = PerActivo', NULL, 'tbl_periodicidad', NULL),
(283, '2024-05-02 17:13:42', 'root@localhost', 'Se insertó', 'Información actual: id_periodo = 16, periodo = cera, descripcion = carea', NULL, 'tbl_periodicidad', NULL),
(284, '2024-05-02 17:14:45', 'root@localhost', 'Se actualizó', 'Información actualizada: id_periodo = 16, periodo = edi, descripcion = fd', 'Información anterior: id_periodo = 16, periodo = cera, descripcion = carea', 'tbl_periodicidad', NULL),
(285, '2024-05-02 17:14:59', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_periodicidad', 'Información eliminada: id_periodo = 16, periodo = edi, descripcion = fd'),
(286, '2024-05-02 17:15:05', 'root@localhost', 'Se actualizó', 'Información actualizada: id_periodo = 15, periodo = PerActivo, descripcion = PerActivo', 'Información anterior: id_periodo = 15, periodo = PerActivo, descripcion = PerActivo', 'tbl_periodicidad', NULL),
(287, '2024-05-02 17:18:30', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_negocio = 1, tipo_negocio = Venta de servicio, descripcion = Venta de servicios', 'Información anterior: id_tipo_negocio = 1, tipo_negocio = Venta de servicio, descripcion = Venta de servicios', 'tbl_tipo_negocios', NULL),
(288, '2024-05-02 17:18:30', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_negocio = 2, tipo_negocio = Jornal agricola, descripcion = Jornal agricola', 'Información anterior: id_tipo_negocio = 2, tipo_negocio = Jornal agricola, descripcion = Jornal agricola', 'tbl_tipo_negocios', NULL),
(289, '2024-05-02 17:18:30', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_negocio = 3, tipo_negocio = Corte de café, descripcion = Café', 'Información anterior: id_tipo_negocio = 3, tipo_negocio = Corte de café, descripcion = Café', 'tbl_tipo_negocios', NULL),
(290, '2024-05-02 17:18:30', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_negocio = 4, tipo_negocio = Jornal no agrícola, descripcion = Jornal no agrícola', 'Información anterior: id_tipo_negocio = 4, tipo_negocio = Jornal no agrícola, descripcion = Jornal no agrícola', 'tbl_tipo_negocios', NULL),
(291, '2024-05-02 17:18:30', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_negocio = 5, tipo_negocio = Alquileres, descripcion = Alquileres', 'Información anterior: id_tipo_negocio = 5, tipo_negocio = Alquileres, descripcion = Alquileres', 'tbl_tipo_negocios', NULL),
(292, '2024-05-02 17:18:30', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_negocio = 6, tipo_negocio = Remesa del exterior, descripcion = Remesa del exterior', 'Información anterior: id_tipo_negocio = 6, tipo_negocio = Remesa del exterior, descripcion = Remesa del exterior', 'tbl_tipo_negocios', NULL),
(293, '2024-05-02 17:18:30', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_negocio = 7, tipo_negocio = Remesa nacional, descripcion = Remesa nacional', 'Información anterior: id_tipo_negocio = 7, tipo_negocio = Remesa nacional, descripcion = Remesa nacional', 'tbl_tipo_negocios', NULL),
(294, '2024-05-02 17:18:30', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_negocio = 8, tipo_negocio = Bono (10 mil, 3ra edad, escolar), descripcion = Bono(10 mil, 3ra edad, escolar)', 'Información anterior: id_tipo_negocio = 8, tipo_negocio = Bono (10 mil, 3ra edad, escolar), descripcion = Bono(10 mil, 3ra edad, escolar)', 'tbl_tipo_negocios', NULL),
(295, '2024-05-02 17:18:30', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_negocio = 9, tipo_negocio = Salario profesional, descripcion = Salario profesional', 'Información anterior: id_tipo_negocio = 9, tipo_negocio = Salario profesional, descripcion = Salario profesional', 'tbl_tipo_negocios', NULL),
(296, '2024-05-02 17:18:30', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_negocio = 10, tipo_negocio = Artesanía, descripcion = Artesanía', 'Información anterior: id_tipo_negocio = 10, tipo_negocio = Artesanía, descripcion = Artesanía', 'tbl_tipo_negocios', NULL),
(297, '2024-05-02 17:18:30', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_negocio = 11, tipo_negocio = Negocio, descripcion = Negocio', 'Información anterior: id_tipo_negocio = 11, tipo_negocio = Negocio, descripcion = Negocio', 'tbl_tipo_negocios', NULL),
(298, '2024-05-02 17:18:30', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_negocio = 14, tipo_negocio = NegInactivo, descripcion = NegInactivo', 'Información anterior: id_tipo_negocio = 14, tipo_negocio = NegInactivo, descripcion = NegInactivo', 'tbl_tipo_negocios', NULL),
(299, '2024-05-02 17:19:01', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_negocio = 15, tipo_negocio = fsdef, descripcion = faeasfdew', NULL, 'tbl_tipo_negocios', NULL),
(300, '2024-05-02 17:21:48', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_negocio = 16, tipo_negocio = fsgagt4r4ee, descripcion = dfgafda', NULL, 'tbl_tipo_negocios', NULL),
(301, '2024-05-02 17:24:19', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_negocio = 16, tipo_negocio = fsgagt4r4ee, descripcion = dfgafda', 'Información anterior: id_tipo_negocio = 16, tipo_negocio = fsgagt4r4ee, descripcion = dfgafda', 'tbl_tipo_negocios', NULL);
INSERT INTO `bitacoras` (`id_bitacora`, `fecha`, `ejecutor`, `actividad_realizada`, `informacion_actual`, `informacion_anterior`, `tabla`, `informacion_eliminada`) VALUES
(302, '2024-05-02 17:24:25', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_negocio = 16, tipo_negocio = fsgagt4r4ee, descripcion = dfgafda', 'Información anterior: id_tipo_negocio = 16, tipo_negocio = fsgagt4r4ee, descripcion = dfgafda', 'tbl_tipo_negocios', NULL),
(303, '2024-05-02 17:24:44', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_tipo_negocios', 'Información eliminada: id_tipo_negocio = 16, tipo_negocio = fsgagt4r4ee, descripcion = dfgafda'),
(304, '2024-05-02 17:24:47', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_tipo_negocios', 'Información eliminada: id_tipo_negocio = 15, tipo_negocio = fsdef, descripcion = faeasfdew'),
(305, '2024-05-02 17:24:53', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_negocio = 14, tipo_negocio = NegInactivo, descripcion = NegInactivo', 'Información anterior: id_tipo_negocio = 14, tipo_negocio = NegInactivo, descripcion = NegInactivo', 'tbl_tipo_negocios', NULL),
(306, '2024-05-02 17:25:22', 'root@localhost', 'Se insertó', 'Información actual: id_motivos_no_credito = 10, motivo_no_credito = dfsdfsdf, descripcion = asdasdada', NULL, 'tbl_motivos_no_creditos', NULL),
(307, '2024-05-02 17:28:19', 'root@localhost', 'Se actualizó', 'Información actualizada: id_motivos_no_credito = 10, motivo_no_credito = fgsdfasdf, descripcion = asdasdada', 'Información anterior: id_motivos_no_credito = 10, motivo_no_credito = dfsdfsdf, descripcion = asdasdada', 'tbl_motivos_no_creditos', NULL),
(308, '2024-05-02 17:28:31', 'root@localhost', 'Se actualizó', 'Información actualizada: id_motivos_no_credito = 10, motivo_no_credito = zxzxzxzxx, descripcion = dafadfgshsgfb', 'Información anterior: id_motivos_no_credito = 10, motivo_no_credito = fgsdfasdf, descripcion = asdasdada', 'tbl_motivos_no_creditos', NULL),
(309, '2024-05-02 17:29:28', 'root@localhost', 'Se actualizó', 'Información actualizada: id_motivos_no_credito = 10, motivo_no_credito = zxzxzxzxx, descripcion = dafadfgshsgfb', 'Información anterior: id_motivos_no_credito = 10, motivo_no_credito = zxzxzxzxx, descripcion = dafadfgshsgfb', 'tbl_motivos_no_creditos', NULL),
(310, '2024-05-02 17:29:36', 'root@localhost', 'Se actualizó', 'Información actualizada: id_motivos_no_credito = 10, motivo_no_credito = rttrtrt, descripcion = wsdsdsd', 'Información anterior: id_motivos_no_credito = 10, motivo_no_credito = zxzxzxzxx, descripcion = dafadfgshsgfb', 'tbl_motivos_no_creditos', NULL),
(311, '2024-05-02 17:29:43', 'root@localhost', 'Se actualizó', 'Información actualizada: id_motivos_no_credito = 10, motivo_no_credito = llllllllll, descripcion = lllllllll', 'Información anterior: id_motivos_no_credito = 10, motivo_no_credito = rttrtrt, descripcion = wsdsdsd', 'tbl_motivos_no_creditos', NULL),
(312, '2024-05-02 17:30:04', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_motivos_no_creditos', 'Información eliminada: id_motivos_no_credito = 10, motivo_no_credito = llllllllll, descripcion = lllllllll'),
(313, '2024-05-02 17:30:46', 'root@localhost', 'Se actualizó', 'Información actualizada: id_motivos_no_credito = 1, motivo_no_credito = Estoy en la central de riesgos, descripcion = Estoy en la central de riesgos', 'Información anterior: id_motivos_no_credito = 1, motivo_no_credito = Estoy en la central de riesgos, descripcion = Estoy en la central de riesgos', 'tbl_motivos_no_creditos', NULL),
(314, '2024-05-02 17:30:50', 'root@localhost', 'Se actualizó', 'Información actualizada: id_motivos_no_credito = 2, motivo_no_credito = Son muchos los requisitos, descripcion = Son muchos los requisitos', 'Información anterior: id_motivos_no_credito = 2, motivo_no_credito = Son muchos los requisitos, descripcion = Son muchos los requisitos', 'tbl_motivos_no_creditos', NULL),
(315, '2024-05-02 17:30:54', 'root@localhost', 'Se actualizó', 'Información actualizada: id_motivos_no_credito = 3, motivo_no_credito = No lo he necesitado, descripcion = No lo he necesitado', 'Información anterior: id_motivos_no_credito = 3, motivo_no_credito = No lo he necesitado, descripcion = No lo he necesitado', 'tbl_motivos_no_creditos', NULL),
(316, '2024-05-02 17:30:58', 'root@localhost', 'Se actualizó', 'Información actualizada: id_motivos_no_credito = 4, motivo_no_credito = No tengo capacidad de pago, descripcion = No tengo capacidad de pago', 'Información anterior: id_motivos_no_credito = 4, motivo_no_credito = No tengo capacidad de pago, descripcion = No tengo capacidad de pago', 'tbl_motivos_no_creditos', NULL),
(317, '2024-05-02 17:31:02', 'root@localhost', 'Se actualizó', 'Información actualizada: id_motivos_no_credito = 5, motivo_no_credito = Temor al rechazo , descripcion = Temor al rechazo ', 'Información anterior: id_motivos_no_credito = 5, motivo_no_credito = Temor al rechazo , descripcion = Temor al rechazo ', 'tbl_motivos_no_creditos', NULL),
(318, '2024-05-02 17:31:06', 'root@localhost', 'Se actualizó', 'Información actualizada: id_motivos_no_credito = 6, motivo_no_credito = Temor a no pagarlo , descripcion = Temor a no pagarlo ', 'Información anterior: id_motivos_no_credito = 6, motivo_no_credito = Temor a no pagarlo , descripcion = Temor a no pagarlo ', 'tbl_motivos_no_creditos', NULL),
(319, '2024-05-02 17:31:10', 'root@localhost', 'Se actualizó', 'Información actualizada: id_motivos_no_credito = 7, motivo_no_credito = Tasas de interés muy altas , descripcion = Tasas de interés muy altas ', 'Información anterior: id_motivos_no_credito = 7, motivo_no_credito = Tasas de interés muy altas , descripcion = Tasas de interés muy altas ', 'tbl_motivos_no_creditos', NULL),
(320, '2024-05-02 17:35:30', 'root@localhost', 'Se insertó', 'Información actual: id_motivos_no_credito = 11, motivo_no_credito = sdad, descripcion = sadasda', NULL, 'tbl_motivos_no_creditos', NULL),
(321, '2024-05-02 17:35:42', 'root@localhost', 'Se actualizó', 'Información actualizada: id_motivos_no_credito = 11, motivo_no_credito = dfasdfas, descripcion = zzzzzzzzz', 'Información anterior: id_motivos_no_credito = 11, motivo_no_credito = sdad, descripcion = sadasda', 'tbl_motivos_no_creditos', NULL),
(322, '2024-05-02 17:35:46', 'root@localhost', 'Se actualizó', 'Información actualizada: id_motivos_no_credito = 11, motivo_no_credito = dfasdfas, descripcion = zzzzzzzzz', 'Información anterior: id_motivos_no_credito = 11, motivo_no_credito = dfasdfas, descripcion = zzzzzzzzz', 'tbl_motivos_no_creditos', NULL),
(323, '2024-05-02 17:36:08', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_motivos_no_creditos', 'Información eliminada: id_motivos_no_credito = 11, motivo_no_credito = dfasdfas, descripcion = zzzzzzzzz'),
(324, '2024-05-02 19:38:19', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_tomador = 7, tomador = vrsfrfdce, descripcion =  dcx dcx', NULL, 'tbl_toma_decisiones', NULL),
(325, '2024-05-02 19:45:35', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_tomador = 8, tomador = rafe, descripcion = vfd', NULL, 'tbl_toma_decisiones', NULL),
(326, '2024-05-02 19:46:58', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_tomador = 7, tomador = vrsfrfdce, descripcion =  dcx dcx', 'Información anterior: id_tipo_tomador = 7, tomador = vrsfrfdce, descripcion =  dcx dcx', 'tbl_toma_decisiones', NULL),
(327, '2024-05-02 19:47:11', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_tomador = 6, tomador = TomaDInactivo, descripcion = TomaDInactivo', 'Información anterior: id_tipo_tomador = 6, tomador = TomaDInactivo, descripcion = TomaDInactivo', 'tbl_toma_decisiones', NULL),
(328, '2024-05-02 19:47:28', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_toma_decisiones', 'Información eliminada: id_tipo_tomador = 8, tomador = rafe, descripcion = vfd'),
(329, '2024-05-02 19:47:31', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_toma_decisiones', 'Información eliminada: id_tipo_tomador = 7, tomador = vrsfrfdce, descripcion =  dcx dcx'),
(330, '2024-05-02 19:47:39', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_tomador = 1, tomador = Esposo, descripcion = Esposo', 'Información anterior: id_tipo_tomador = 1, tomador = Esposo, descripcion = Esposo', 'tbl_toma_decisiones', NULL),
(331, '2024-05-02 19:47:43', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_tomador = 2, tomador = Esposa, descripcion = Esposa', 'Información anterior: id_tipo_tomador = 2, tomador = Esposa, descripcion = Esposa', 'tbl_toma_decisiones', NULL),
(332, '2024-05-02 19:47:46', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_tomador = 3, tomador = Consenso en Familia, descripcion = Consenso en Familia', 'Información anterior: id_tipo_tomador = 3, tomador = Consenso en Familia, descripcion = Consenso en Familia', 'tbl_toma_decisiones', NULL),
(333, '2024-05-02 19:47:51', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_tomador = 4, tomador = Un familiar, descripcion = Un familiar toma las deciones', 'Información anterior: id_tipo_tomador = 4, tomador = Un familiar, descripcion = Un familiar toma las deciones', 'tbl_toma_decisiones', NULL),
(334, '2024-05-02 19:47:56', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_tomador = 5, tomador = Un administrador, descripcion = El administrador toma la decision', 'Información anterior: id_tipo_tomador = 5, tomador = Un administrador, descripcion = El administrador toma la decision', 'tbl_toma_decisiones', NULL),
(335, '2024-05-02 20:15:22', 'root@localhost', 'Se insertó', 'Información actual: id_apoyo_produccion = 7, tipo_apoyo_produccion = fsfrewfewa, descripcion = gergrefrew', NULL, 'tbl_apoyos', NULL),
(336, '2024-05-02 20:15:27', 'root@localhost', 'Se actualizó', 'Información actualizada: id_apoyo_produccion = 7, tipo_apoyo_produccion = fsfrewfewa, descripcion = gergrefrew', 'Información anterior: id_apoyo_produccion = 7, tipo_apoyo_produccion = fsfrewfewa, descripcion = gergrefrew', 'tbl_apoyos', NULL),
(337, '2024-05-02 20:22:00', 'root@localhost', 'Se insertó', 'Información actual: id_apoyo_produccion = 8, tipo_apoyo_produccion = fghnf, descripcion = fgbfdgb', NULL, 'tbl_apoyos', NULL),
(338, '2024-05-02 20:24:58', 'root@localhost', 'Se actualizó', 'Información actualizada: id_apoyo_produccion = 8, tipo_apoyo_produccion = yuyuyuu, descripcion = gtrfbgfdgsf', 'Información anterior: id_apoyo_produccion = 8, tipo_apoyo_produccion = fghnf, descripcion = fgbfdgb', 'tbl_apoyos', NULL),
(339, '2024-05-02 20:25:26', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_apoyos', 'Información eliminada: id_apoyo_produccion = 8, tipo_apoyo_produccion = yuyuyuu, descripcion = gtrfbgfdgsf'),
(340, '2024-05-02 20:25:29', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_apoyos', 'Información eliminada: id_apoyo_produccion = 7, tipo_apoyo_produccion = fsfrewfewa, descripcion = gergrefrew'),
(341, '2024-05-02 20:30:39', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_apoyos = 19, tipo_apoyos = fgs f sfa, descripcion = fadf ', NULL, 'tbl_tipos_apoyos', NULL),
(342, '2024-05-02 20:30:51', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_apoyos = 19, tipo_apoyos = ererer, descripcion = gfgfgfg', 'Información anterior: id_tipo_apoyos = 19, tipo_apoyos = fgs f sfa, descripcion = fadf ', 'tbl_tipos_apoyos', NULL),
(343, '2024-05-02 20:31:22', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_apoyos = 19, tipo_apoyos = vcvcvc, descripcion = vc ', 'Información anterior: id_tipo_apoyos = 19, tipo_apoyos = ererer, descripcion = gfgfgfg', 'tbl_tipos_apoyos', NULL),
(344, '2024-05-02 20:31:27', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_tipos_apoyos', 'Información eliminada: id_tipo_apoyos = 19, tipo_apoyos = vcvcvc, descripcion = vc '),
(345, '2024-05-02 21:41:12', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Departamento = 1, Nombre_Departamento = Atlántida, Descripcion = Departamento en la costa norte de Honduras', 'Información anterior: Id_Departamento = 1, Nombre_Departamento = Atlántida, Descripcion = Departamento en la costa norte de Honduras', 'tbl_departamentos', NULL),
(346, '2024-05-02 21:41:20', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Departamento = 1, Nombre_Departamento = Atlántida, Descripcion = Departamento en la costa norte de Honduras', 'Información anterior: Id_Departamento = 1, Nombre_Departamento = Atlántida, Descripcion = Departamento en la costa norte de Honduras', 'tbl_departamentos', NULL),
(347, '2024-05-02 21:49:41', 'root@localhost', 'Se actualizó', 'Información actualizada: id_organizacion = 1, organizacion = Asociación, id_tipo_organizacion = 10, descripcion = Cooperativa Sagrada familia', 'Información anterior: id_organizacion = 1, organizacion = Asociación, id_tipo_organizacion = 1, descripcion = Cooperativa Sagrada familia', 'tbl_organizaciones', NULL),
(348, '2024-05-02 21:49:47', 'root@localhost', 'Se actualizó', 'Información actualizada: id_organizacion = 1, organizacion = Asociación, id_tipo_organizacion = 10, descripcion = Cooperativa Sagrada familia', 'Información anterior: id_organizacion = 1, organizacion = Asociación, id_tipo_organizacion = 10, descripcion = Cooperativa Sagrada familia', 'tbl_organizaciones', NULL),
(349, '2024-05-02 21:50:57', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 1, tipo_organizacion = Asociación, descripcion = Gobierno', 'Información anterior: id_tipo_organizacion = 1, tipo_organizacion = Asociación, descripcion = Gobierno', 'tbl_tipo_organizacion', NULL),
(350, '2024-05-02 21:51:01', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 1, tipo_organizacion = Asociación, descripcion = Gobierno', 'Información anterior: id_tipo_organizacion = 1, tipo_organizacion = Asociación, descripcion = Gobierno', 'tbl_tipo_organizacion', NULL),
(351, '2024-05-02 21:54:15', 'root@localhost', 'Se actualizó', 'Información actualizada: id_medida = 1, medida = TAREAS, descripcion = Son 5 tareas', 'Información anterior: id_medida = 1, medida = TAREAS, descripcion = Son 5 tareas', 'tbl_medidas_tierra', NULL),
(352, '2024-05-02 21:54:19', 'root@localhost', 'Se actualizó', 'Información actualizada: id_medida = 1, medida = TAREAS, descripcion = Son 5 tareas', 'Información anterior: id_medida = 1, medida = TAREAS, descripcion = Son 5 tareas', 'tbl_medidas_tierra', NULL),
(353, '2024-05-02 21:56:32', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_cultivo = 1, tipo_cultivo = Maiz, descripcion = Maiz amarillo', 'Información anterior: id_tipo_cultivo = 1, tipo_cultivo = Maiz, descripcion = Maiz amarillo', 'tbl_tipo_cultivo', NULL),
(354, '2024-05-02 21:58:46', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_produccion = 1, tipo_produccion = Producción de leche, descripcion = Leche', 'Información anterior: id_tipo_produccion = 1, tipo_produccion = Producción de leche, descripcion = Leche', 'tbl_tipo_produccion', NULL),
(355, '2024-05-02 21:58:50', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_produccion = 1, tipo_produccion = Producción de leche, descripcion = Leche', 'Información anterior: id_tipo_produccion = 1, tipo_produccion = Producción de leche, descripcion = Leche', 'tbl_tipo_produccion', NULL),
(356, '2024-05-02 22:18:57', 'root@localhost', 'Se actualizó', 'Información actualizada: id_apoyo_produccion = 6, tipo_apoyo_produccion = APInactiva, descripcion = APInactiva', 'Información anterior: id_apoyo_produccion = 6, tipo_apoyo_produccion = APInactiva, descripcion = APInactiva', 'tbl_apoyos', NULL),
(357, '2024-05-02 22:19:02', 'root@localhost', 'Se actualizó', 'Información actualizada: id_apoyo_produccion = 6, tipo_apoyo_produccion = APInactiva, descripcion = APInactiva', 'Información anterior: id_apoyo_produccion = 6, tipo_apoyo_produccion = APInactiva, descripcion = APInactiva', 'tbl_apoyos', NULL),
(358, '2024-05-02 23:44:48', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-05-01, anio_solicitud: 2024, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-09, nombre_encuestador: Olivia Rodrigo', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-05-01 anio_solicitud: 2024, descripcion:  pruebaA, fecha_entrevista: 2024-05-09, nombre_encuestador: Olivia Rodrigo', 'fichas', NULL),
(359, '2024-05-02 23:45:56', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 3, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  prueba del proyecro, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba', NULL, 'fichas', NULL),
(360, '2024-05-02 23:46:47', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 3, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  prueba del proyecro, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba'),
(361, '2024-05-02 23:47:48', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 3, fecha_solicitud: 2024-05-02, anio_solicitud: 2020, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: prueba', NULL, 'fichas', NULL),
(362, '2024-05-02 23:53:45', 'root@localhost', 'Se insertó', 'Información actual: Id_Manejo_Riego = 3, Id_Ficha = 3, Id_Ubicacion = 3, Id_Productor = 3, Tiene_Riego = S, Superficie_Riego = 12.00', NULL, 'tbl_manejo_riego', NULL),
(363, '2024-05-02 23:55:00', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-05-02, anio_solicitud: 2020, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: prueba', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-05-02 anio_solicitud: 2020, descripcion:  pruebaA, fecha_entrevista: 2024-05-02, nombre_encuestador: prueba', 'fichas', NULL),
(364, '2024-05-02 23:55:28', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 3, Id_Ficha = 3, Id_Ubicacion = 3, Id_Productor = 3, Tiene_Riego = S, Superficie_Riego = 12.00', 'Información anterior: Id_Manejo_Riego = 3, Id_Ficha = 3, Id_Ubicacion = 3, Id_Productor = 3, Tiene_Riego = S, Superficie_Riego = 12.00', 'tbl_manejo_riego', NULL),
(365, '2024-05-02 23:57:37', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 8, Id_Ficha = 3, Id_Productor = 3, Id_Tipo_Practica = 35, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(366, '2024-05-02 23:57:37', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 9, Id_Ficha = 3, Id_Productor = 3, Id_Tipo_Practica = 37, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(367, '2024-05-02 23:57:37', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 10, Id_Ficha = 3, Id_Productor = 3, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(368, '2024-05-03 00:00:35', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-05-02, anio_solicitud: 2020, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: prueba', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-05-02 anio_solicitud: 2020, descripcion:  pruebaA, fecha_entrevista: 2024-05-02, nombre_encuestador: prueba', 'fichas', NULL),
(369, '2024-05-03 00:00:49', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 3, Id_Ficha = 3, Id_Ubicacion = 3, Id_Productor = 3, Tiene_Riego = S, Superficie_Riego = 12.00', 'Información anterior: Id_Manejo_Riego = 3, Id_Ficha = 3, Id_Ubicacion = 3, Id_Productor = 3, Tiene_Riego = S, Superficie_Riego = 12.00', 'tbl_manejo_riego', NULL),
(370, '2024-05-03 00:00:58', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 8, Id_Ficha = 3, Id_Productor = 3, Id_Tipo_Practica = 35, Descripcion =  '),
(371, '2024-05-03 00:00:58', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 9, Id_Ficha = 3, Id_Productor = 3, Id_Tipo_Practica = 37, Descripcion =  '),
(372, '2024-05-03 00:00:58', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 10, Id_Ficha = 3, Id_Productor = 3, Id_Tipo_Practica = 44, Descripcion =  '),
(373, '2024-05-03 00:00:58', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 11, Id_Ficha = 3, Id_Productor = 3, Id_Tipo_Practica = 35, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(374, '2024-05-03 00:00:58', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 12, Id_Ficha = 3, Id_Productor = 3, Id_Tipo_Practica = 37, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(375, '2024-05-03 00:00:58', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 13, Id_Ficha = 3, Id_Productor = 3, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(376, '2024-05-03 00:01:10', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 3, fecha_solicitud: 2024-05-02, anio_solicitud: 2020, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: prueba', 'Información anterior = id_ficha: 3, fecha_solicitud: 2024-05-02 anio_solicitud: 2020, descripcion:  pruebaA, fecha_entrevista: 2024-05-02, nombre_encuestador: prueba', 'fichas', NULL),
(377, '2024-05-03 00:01:19', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 3, Id_Ficha = 3, Id_Ubicacion = 3, Id_Productor = 3, Tiene_Riego = S, Superficie_Riego = 12.00', 'Información anterior: Id_Manejo_Riego = 3, Id_Ficha = 3, Id_Ubicacion = 3, Id_Productor = 3, Tiene_Riego = S, Superficie_Riego = 12.00', 'tbl_manejo_riego', NULL),
(378, '2024-05-03 00:01:41', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 4, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(379, '2024-05-03 00:11:57', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 4, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'Información anterior = id_ficha: 4, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'fichas', NULL),
(380, '2024-05-03 00:12:22', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 5, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  tbl_tipo_pecuarios, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: tbl_tipo_pecuarios', NULL, 'fichas', NULL),
(381, '2024-05-03 00:13:00', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 5, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  tbl_tipo_pecuarios, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: tbl_tipo_pecuarios'),
(382, '2024-05-03 01:07:51', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 4, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'Información anterior = id_ficha: 4, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'fichas', NULL),
(383, '2024-05-03 01:08:23', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 4, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'Información anterior = id_ficha: 4, fecha_solicitud: 0000-00-00 anio_solicitud: 0, descripcion:  A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', 'fichas', NULL),
(384, '2024-05-03 01:16:04', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 5, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  fda, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras', NULL, 'fichas', NULL),
(385, '2024-05-03 01:17:39', 'root@localhost', 'Se insertó', 'Información actual: Id_Manejo_Riego = 4, Id_Ficha = 5, Id_Ubicacion = 4, Id_Productor = 6, Tiene_Riego = S, Superficie_Riego = 2.00', NULL, 'tbl_manejo_riego', NULL),
(386, '2024-05-03 01:18:36', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 14, Id_Ficha = 5, Id_Productor = 6, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(387, '2024-05-03 01:18:46', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  fda, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-05-02 anio_solicitud: 2023, descripcion:  fdaA, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras', 'fichas', NULL),
(388, '2024-05-03 01:18:54', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 4, Id_Ficha = 5, Id_Ubicacion = 4, Id_Productor = 6, Tiene_Riego = S, Superficie_Riego = 2.00', 'Información anterior: Id_Manejo_Riego = 4, Id_Ficha = 5, Id_Ubicacion = 4, Id_Productor = 6, Tiene_Riego = S, Superficie_Riego = 2.00', 'tbl_manejo_riego', NULL),
(389, '2024-05-03 01:19:24', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 14, Id_Ficha = 5, Id_Productor = 6, Id_Tipo_Practica = 3, Descripcion =  '),
(390, '2024-05-03 01:19:24', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 15, Id_Ficha = 5, Id_Productor = 6, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(391, '2024-05-03 01:19:33', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  fda, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-05-02 anio_solicitud: 2023, descripcion:  fdaA, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras', 'fichas', NULL),
(392, '2024-05-03 01:19:39', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 4, Id_Ficha = 5, Id_Ubicacion = 4, Id_Productor = 6, Tiene_Riego = S, Superficie_Riego = 2.00', 'Información anterior: Id_Manejo_Riego = 4, Id_Ficha = 5, Id_Ubicacion = 4, Id_Productor = 6, Tiene_Riego = S, Superficie_Riego = 2.00', 'tbl_manejo_riego', NULL),
(393, '2024-05-03 01:19:52', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 15, Id_Ficha = 5, Id_Productor = 6, Id_Tipo_Practica = 3, Descripcion =  '),
(394, '2024-05-03 01:19:52', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 16, Id_Ficha = 5, Id_Productor = 6, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(395, '2024-05-03 01:22:20', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  fda, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-05-02 anio_solicitud: 2023, descripcion:  fdaA, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras', 'fichas', NULL),
(396, '2024-05-03 01:22:30', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 4, Id_Ficha = 5, Id_Ubicacion = 4, Id_Productor = 6, Tiene_Riego = S, Superficie_Riego = 2.00', 'Información anterior: Id_Manejo_Riego = 4, Id_Ficha = 5, Id_Ubicacion = 4, Id_Productor = 6, Tiene_Riego = S, Superficie_Riego = 2.00', 'tbl_manejo_riego', NULL),
(397, '2024-05-03 01:23:48', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 16, Id_Ficha = 5, Id_Productor = 6, Id_Tipo_Practica = 3, Descripcion =  '),
(398, '2024-05-03 01:23:48', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 17, Id_Ficha = 5, Id_Productor = 6, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(399, '2024-05-03 01:56:12', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_manejo_riego', 'Información eliminada: Id_Manejo_Riego = 1, Id_Ficha = 1, Id_Ubicacion = 1, Id_Productor = 1, Tiene_Riego = S, Superficie_Riego = 22.00'),
(400, '2024-05-03 01:56:12', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_manejo_riego', 'Información eliminada: Id_Manejo_Riego = 2, Id_Ficha = 2, Id_Ubicacion = 2, Id_Productor = 2, Tiene_Riego = S, Superficie_Riego = 22.00'),
(401, '2024-05-03 01:56:12', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_manejo_riego', 'Información eliminada: Id_Manejo_Riego = 3, Id_Ficha = 3, Id_Ubicacion = 3, Id_Productor = 3, Tiene_Riego = S, Superficie_Riego = 12.00'),
(402, '2024-05-03 01:56:12', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_manejo_riego', 'Información eliminada: Id_Manejo_Riego = 4, Id_Ficha = 5, Id_Ubicacion = 4, Id_Productor = 6, Tiene_Riego = S, Superficie_Riego = 2.00'),
(403, '2024-05-03 01:56:48', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 1, Id_Ficha = 1, Id_Productor = 1, Id_Tipo_Practica = 12, Descripcion =  '),
(404, '2024-05-03 01:56:48', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 2, Id_Ficha = 1, Id_Productor = 1, Id_Tipo_Practica = 13, Descripcion =  '),
(405, '2024-05-03 01:56:48', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 6, Id_Ficha = 2, Id_Productor = 2, Id_Tipo_Practica = 12, Descripcion =  '),
(406, '2024-05-03 01:56:48', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 7, Id_Ficha = 2, Id_Productor = 2, Id_Tipo_Practica = 13, Descripcion =  '),
(407, '2024-05-03 01:56:48', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 11, Id_Ficha = 3, Id_Productor = 3, Id_Tipo_Practica = 35, Descripcion =  '),
(408, '2024-05-03 01:56:48', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 12, Id_Ficha = 3, Id_Productor = 3, Id_Tipo_Practica = 37, Descripcion =  '),
(409, '2024-05-03 01:56:48', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 13, Id_Ficha = 3, Id_Productor = 3, Id_Tipo_Practica = 44, Descripcion =  '),
(410, '2024-05-03 01:56:48', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 17, Id_Ficha = 5, Id_Productor = 6, Id_Tipo_Practica = 3, Descripcion =  '),
(411, '2024-05-03 02:01:35', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 1, fecha_solicitud: 2024-05-01, anio_solicitud: 2024, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-09, nombre_encuestador: Olivia Rodrigo'),
(412, '2024-05-03 02:01:35', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 2, fecha_solicitud: 2024-05-01, anio_solicitud: 2024, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-09, nombre_encuestador: Olivia Rodrigo'),
(413, '2024-05-03 02:01:35', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 3, fecha_solicitud: 2024-05-02, anio_solicitud: 2020, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: prueba'),
(414, '2024-05-03 02:01:35', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 4, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: '),
(415, '2024-05-03 02:01:35', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 5, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  fda, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras'),
(416, '2024-05-03 02:02:27', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 1, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  Prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba', NULL, 'fichas', NULL),
(417, '2024-05-03 02:04:19', 'root@localhost', 'Se insertó', 'Información actual: Id_Manejo_Riego = 5, Id_Ficha = 1, Id_Ubicacion = 5, Id_Productor = 8, Tiene_Riego = S, Superficie_Riego = 3.00', NULL, 'tbl_manejo_riego', NULL),
(418, '2024-05-03 02:06:25', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 18, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(419, '2024-05-03 02:06:25', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 19, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(420, '2024-05-03 02:07:32', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  Prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-05-02 anio_solicitud: 2023, descripcion:  PruebaA, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba', 'fichas', NULL),
(421, '2024-05-03 02:07:47', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 5, Id_Ficha = 1, Id_Ubicacion = 5, Id_Productor = 8, Tiene_Riego = S, Superficie_Riego = 3.00', 'Información anterior: Id_Manejo_Riego = 5, Id_Ficha = 1, Id_Ubicacion = 5, Id_Productor = 8, Tiene_Riego = S, Superficie_Riego = 3.00', 'tbl_manejo_riego', NULL),
(422, '2024-05-03 02:08:02', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 18, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 3, Descripcion =  '),
(423, '2024-05-03 02:08:02', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 19, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 4, Descripcion =  '),
(424, '2024-05-03 02:08:02', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 20, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(425, '2024-05-03 02:08:02', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 21, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(426, '2024-05-03 02:14:01', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 2, fecha_solicitud: 2024-05-02, anio_solicitud: 2020, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: prueba', NULL, 'fichas', NULL),
(427, '2024-05-03 02:15:31', 'root@localhost', 'Se insertó', 'Información actual: Id_Manejo_Riego = 6, Id_Ficha = 2, Id_Ubicacion = 6, Id_Productor = 9, Tiene_Riego = S, Superficie_Riego = 2.00', NULL, 'tbl_manejo_riego', NULL),
(428, '2024-05-03 02:24:13', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 22, Id_Ficha = 2, Id_Productor = 9, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(429, '2024-05-03 02:25:30', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 3, fecha_solicitud: 2024-05-02, anio_solicitud: 3333, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras', NULL, 'fichas', NULL),
(430, '2024-05-03 02:27:01', 'root@localhost', 'Se insertó', 'Información actual: Id_Manejo_Riego = 7, Id_Ficha = 3, Id_Ubicacion = 7, Id_Productor = 10, Tiene_Riego = S, Superficie_Riego = 3.00', NULL, 'tbl_manejo_riego', NULL),
(431, '2024-05-03 02:28:27', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 23, Id_Ficha = 3, Id_Productor = 10, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(432, '2024-05-03 02:29:32', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 4, fecha_solicitud: 2024-05-02, anio_solicitud: 3333, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras', NULL, 'fichas', NULL),
(433, '2024-05-03 02:29:32', 'root@localhost', 'Se insertó', 'Información actual: Id_Manejo_Riego = 8, Id_Ficha = 4, Id_Ubicacion = 8, Id_Productor = 11, Tiene_Riego = S, Superficie_Riego = 3.00', NULL, 'tbl_manejo_riego', NULL),
(434, '2024-05-03 02:29:32', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 24, Id_Ficha = 4, Id_Productor = 11, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(435, '2024-05-03 02:29:34', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 4, fecha_solicitud: 2024-05-02, anio_solicitud: 3333, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 4, fecha_solicitud: 2024-05-02 anio_solicitud: 3333, descripcion:  pruebaA, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras', 'fichas', NULL),
(436, '2024-05-03 02:29:41', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 8, Id_Ficha = 4, Id_Ubicacion = 8, Id_Productor = 11, Tiene_Riego = S, Superficie_Riego = 3.00', 'Información anterior: Id_Manejo_Riego = 8, Id_Ficha = 4, Id_Ubicacion = 8, Id_Productor = 11, Tiene_Riego = S, Superficie_Riego = 3.00', 'tbl_manejo_riego', NULL),
(437, '2024-05-03 02:30:26', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 24, Id_Ficha = 4, Id_Productor = 11, Id_Tipo_Practica = 3, Descripcion =  '),
(438, '2024-05-03 02:30:26', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 25, Id_Ficha = 4, Id_Productor = 11, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(439, '2024-05-03 02:33:21', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 5, fecha_solicitud: 2024-05-02, anio_solicitud: 222, descripcion:  Honduras, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras', NULL, 'fichas', NULL),
(440, '2024-05-03 02:33:50', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 5, fecha_solicitud: 2024-05-02, anio_solicitud: 222, descripcion:  Honduras, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras'),
(441, '2024-05-03 15:28:54', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 5, fecha_solicitud: 2024-05-03, anio_solicitud: 2323, descripcion: ewrwrwrw, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Honduras', NULL, 'fichas', NULL),
(442, '2024-05-03 15:29:36', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 5, fecha_solicitud: 2024-05-03, anio_solicitud: 2323, descripcion: ewrwrwrw, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Honduras'),
(443, '2024-05-03 17:34:40', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 4, fecha_solicitud: 2024-05-02, anio_solicitud: 3333, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 4, fecha_solicitud: 2024-05-02 anio_solicitud: 3333, descripcion:  pruebaA, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras', 'fichas', NULL),
(444, '2024-05-03 17:34:51', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 8, Id_Ficha = 4, Id_Ubicacion = 8, Id_Productor = 11, Tiene_Riego = S, Superficie_Riego = 3.00', 'Información anterior: Id_Manejo_Riego = 8, Id_Ficha = 4, Id_Ubicacion = 8, Id_Productor = 11, Tiene_Riego = S, Superficie_Riego = 3.00', 'tbl_manejo_riego', NULL),
(445, '2024-05-03 17:34:58', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 25, Id_Ficha = 4, Id_Productor = 11, Id_Tipo_Practica = 3, Descripcion =  '),
(446, '2024-05-03 17:34:58', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 26, Id_Ficha = 4, Id_Productor = 11, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(447, '2024-05-03 23:15:57', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 5, fecha_solicitud: 2024-05-03, anio_solicitud: 2023, descripcion:  Francisco Morazan, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Honduras', NULL, 'fichas', NULL),
(448, '2024-05-03 23:18:22', 'root@localhost', 'Se insertó', 'Información actual: Id_Manejo_Riego = 9, Id_Ficha = 5, Id_Ubicacion = 9, Id_Productor = 12, Tiene_Riego = S, Superficie_Riego = 10.00', NULL, 'tbl_manejo_riego', NULL),
(449, '2024-05-03 23:20:13', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 27, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(450, '2024-05-03 23:20:13', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 28, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 28, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(451, '2024-05-03 23:20:13', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 29, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(452, '2024-05-03 23:21:08', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-05-03, anio_solicitud: 2023, descripcion:  Francisco Morazan, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-05-03 anio_solicitud: 2023, descripcion:  Francisco MorazanA, fecha_entrevista: 2024-05-03, nombre_encuestador: Honduras', 'fichas', NULL),
(453, '2024-05-03 23:21:50', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 9, Id_Ficha = 5, Id_Ubicacion = 9, Id_Productor = 12, Tiene_Riego = S, Superficie_Riego = 10.00', 'Información anterior: Id_Manejo_Riego = 9, Id_Ficha = 5, Id_Ubicacion = 9, Id_Productor = 12, Tiene_Riego = S, Superficie_Riego = 10.00', 'tbl_manejo_riego', NULL),
(454, '2024-05-03 23:22:09', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 27, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 3, Descripcion =  '),
(455, '2024-05-03 23:22:09', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 28, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 28, Descripcion =  '),
(456, '2024-05-03 23:22:09', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 29, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 44, Descripcion =  '),
(457, '2024-05-03 23:22:09', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 30, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(458, '2024-05-03 23:22:09', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 31, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 28, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(459, '2024-05-03 23:22:09', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 32, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(460, '2024-05-03 23:26:22', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 5, fecha_solicitud: 2024-05-03, anio_solicitud: 2023, descripcion:  Francisco Morazan, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 5, fecha_solicitud: 2024-05-03 anio_solicitud: 2023, descripcion:  Francisco MorazanA, fecha_entrevista: 2024-05-03, nombre_encuestador: Honduras', 'fichas', NULL),
(461, '2024-05-03 23:27:02', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 9, Id_Ficha = 5, Id_Ubicacion = 9, Id_Productor = 12, Tiene_Riego = S, Superficie_Riego = 10.00', 'Información anterior: Id_Manejo_Riego = 9, Id_Ficha = 5, Id_Ubicacion = 9, Id_Productor = 12, Tiene_Riego = S, Superficie_Riego = 10.00', 'tbl_manejo_riego', NULL),
(462, '2024-05-03 23:27:23', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 30, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 3, Descripcion =  '),
(463, '2024-05-03 23:27:23', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 31, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 28, Descripcion =  '),
(464, '2024-05-03 23:27:23', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 32, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 44, Descripcion =  '),
(465, '2024-05-03 23:27:23', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 33, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(466, '2024-05-03 23:27:23', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 34, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 28, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(467, '2024-05-03 23:27:23', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 35, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(468, '2024-05-03 23:31:37', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 6, fecha_solicitud: 2024-05-03, anio_solicitud: 2023, descripcion:  Francisco Morazan, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Honduras', NULL, 'fichas', NULL),
(469, '2024-05-03 23:31:37', 'root@localhost', 'Se insertó', 'Información actual: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00', NULL, 'tbl_manejo_riego', NULL),
(470, '2024-05-03 23:31:37', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 36, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(471, '2024-05-03 23:31:37', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 37, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 28, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(472, '2024-05-03 23:31:37', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 38, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(473, '2024-05-03 23:31:54', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-05-03, anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco Morazan, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-05-03 anio_solicitud: 2023, descripcion:  Francisco MorazanA, fecha_entrevista: 2024-05-03, nombre_encuestador: Honduras', 'fichas', NULL),
(474, '2024-05-03 23:32:29', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00', 'Información anterior: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00', 'tbl_manejo_riego', NULL),
(475, '2024-05-03 23:33:01', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 36, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 3, Descripcion =  '),
(476, '2024-05-03 23:33:01', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 37, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 28, Descripcion =  '),
(477, '2024-05-03 23:33:01', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 38, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 44, Descripcion =  '),
(478, '2024-05-03 23:33:01', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 39, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(479, '2024-05-03 23:33:01', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 40, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(480, '2024-05-03 23:33:01', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 41, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 5, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(481, '2024-05-03 23:33:01', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 42, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 6, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL);
INSERT INTO `bitacoras` (`id_bitacora`, `fecha`, `ejecutor`, `actividad_realizada`, `informacion_actual`, `informacion_anterior`, `tabla`, `informacion_eliminada`) VALUES
(482, '2024-05-03 23:33:01', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 43, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 28, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(483, '2024-05-03 23:33:01', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 44, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(484, '2024-05-05 05:00:52', 'root@localhost', 'Se insertó', 'Información actual: id_etnia = 16, etnia = Etni2ewe, descripcion = sdasda', NULL, 'tbl_etnias', NULL),
(485, '2024-05-05 05:00:59', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_etnias', 'Información eliminada: id_etnia = 16, etnia = Etni2ewe, descripcion = sdasda'),
(486, '2024-05-05 05:01:10', 'root@localhost', 'Se actualizó', 'Información actualizada: id_etnia = 11, etnia = Otros(Especifique), descripcion = Descripción de Etnia 11', 'Información anterior: id_etnia = 11, etnia = Otros(Especifique), descripcion = Descripción de Etnia 11', 'tbl_etnias', NULL),
(487, '2024-05-05 05:01:43', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  Prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-05-02 anio_solicitud: 2023, descripcion:  PruebaA, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba', 'fichas', NULL),
(488, '2024-05-05 05:05:00', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  Prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-05-02 anio_solicitud: 2023, descripcion:  PruebaA, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba', 'fichas', NULL),
(489, '2024-05-05 05:05:13', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  Prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-05-02 anio_solicitud: 2023, descripcion:  PruebaA, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba', 'fichas', NULL),
(490, '2024-05-05 05:05:50', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  Prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-05-02 anio_solicitud: 2023, descripcion:  PruebaA, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba', 'fichas', NULL),
(491, '2024-05-05 05:36:15', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-05-03, anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco Morazan, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-05-03 anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco MorazanA, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg', 'fichas', NULL),
(492, '2024-05-05 05:36:36', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00', 'Información anterior: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00', 'tbl_manejo_riego', NULL),
(493, '2024-05-05 05:37:16', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 39, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 3, Descripcion =  '),
(494, '2024-05-05 05:37:16', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 40, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 4, Descripcion =  '),
(495, '2024-05-05 05:37:16', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 41, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 5, Descripcion =  '),
(496, '2024-05-05 05:37:16', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 42, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 6, Descripcion =  '),
(497, '2024-05-05 05:37:16', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 43, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 28, Descripcion =  '),
(498, '2024-05-05 05:37:16', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 44, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 44, Descripcion =  '),
(499, '2024-05-05 05:37:16', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 45, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(500, '2024-05-05 05:37:16', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 46, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(501, '2024-05-05 05:37:16', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 47, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 5, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(502, '2024-05-05 05:37:16', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 48, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 6, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(503, '2024-05-05 05:37:16', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 49, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 28, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(504, '2024-05-05 05:37:16', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 50, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(505, '2024-05-05 05:50:06', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-05-03, anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco Morazan, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-05-03 anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco MorazanA, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg', 'fichas', NULL),
(506, '2024-05-05 05:50:15', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00', 'Información anterior: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00', 'tbl_manejo_riego', NULL),
(507, '2024-05-05 05:50:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 45, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 3, Descripcion =  '),
(508, '2024-05-05 05:50:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 46, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 4, Descripcion =  '),
(509, '2024-05-05 05:50:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 47, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 5, Descripcion =  '),
(510, '2024-05-05 05:50:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 48, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 6, Descripcion =  '),
(511, '2024-05-05 05:50:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 49, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 28, Descripcion =  '),
(512, '2024-05-05 05:50:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 50, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 44, Descripcion =  '),
(513, '2024-05-05 05:50:43', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 51, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(514, '2024-05-05 05:50:43', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 52, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(515, '2024-05-05 05:50:43', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 53, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 5, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(516, '2024-05-05 05:50:43', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 54, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 6, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(517, '2024-05-05 05:50:43', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 55, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 28, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(518, '2024-05-05 05:50:43', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 56, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(519, '2024-05-05 05:52:50', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-05-03, anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco Morazan, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-05-03 anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco MorazanA, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg', 'fichas', NULL),
(520, '2024-05-05 05:53:27', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00', 'Información anterior: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00', 'tbl_manejo_riego', NULL),
(521, '2024-05-05 05:54:48', 'root@localhost', 'Se insertó', 'Información actual: id_etnia = 17, etnia = Etni2ewe, descripcion = sdadad', NULL, 'tbl_etnias', NULL),
(522, '2024-05-05 05:55:16', 'root@localhost', 'Se insertó', 'Información actual: id_etnia = 18, etnia = Lenca, descripcion = xfasd', NULL, 'tbl_etnias', NULL),
(523, '2024-05-05 05:55:23', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_etnias', 'Información eliminada: id_etnia = 18, etnia = Lenca, descripcion = xfasd'),
(524, '2024-05-05 05:59:45', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_etnias', 'Información eliminada: id_etnia = 17, etnia = Etni2ewe, descripcion = sdadad'),
(525, '2024-05-05 06:00:28', 'root@localhost', 'Se insertó', 'Información actual: Id_Departamento = 25, Nombre_Departamento = fdafdad, Descripcion = fadfadfaf', NULL, 'tbl_departamentos', NULL),
(526, '2024-05-05 06:00:34', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Departamento = 25, Nombre_Departamento = fdafdad, Descripcion = fadfadfaf', 'Información anterior: Id_Departamento = 25, Nombre_Departamento = fdafdad, Descripcion = fadfadfaf', 'tbl_departamentos', NULL),
(527, '2024-05-05 06:00:38', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_departamentos', 'Información eliminada: Id_Departamento = 25, Nombre_Departamento = fdafdad, Descripcion = fadfadfaf'),
(528, '2024-05-05 06:00:50', 'root@localhost', 'Se insertó', 'Información actual: Id_Municipio = 96, Id_Departamento = 22, Nombre_Municipio = fasewasfde, Descripcion = fewasfd', NULL, 'tbl_municipios', NULL),
(529, '2024-05-05 06:01:18', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_municipios', 'Información eliminada: Id_Municipio = 96, Id_Departamento = 22, Nombre_Municipio = fasewasfde, Descripcion = fewasfd'),
(530, '2024-05-05 06:01:47', 'root@localhost', 'Se insertó', 'Información actual: Id_Aldea = 155, Id_Departamento = 22, Id_Municipio = 91, Nombre_Aldea = deafedaew, Descripcion = dasasd, Estado = A', NULL, 'tbl_aldeas', NULL),
(531, '2024-05-05 06:04:02', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_aldeas', 'Información eliminada: Id_Aldea = 155, Id_Departamento = 22, Id_Municipio = 91, Nombre_Aldea = deafedaew, Descripcion = dasasd, Estado = A'),
(532, '2024-05-05 06:04:39', 'root@localhost', 'Se insertó', 'Información actual: Id_Cacerio = 8, Id_Aldea = 1, Id_Municipio = 1, Id_Departamento = 1, Nombre_Cacerio = Pueblo Nuevo, Descripcion = Pueblo Nuevo', NULL, 'tbl_cacerios', NULL),
(533, '2024-05-05 06:05:09', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Cacerio = 8, Id_Aldea = 1, Id_Municipio = 1, Id_Departamento = 1, Nombre_Cacerio = Pueblo Nuevo, Descripcion = Pueblo Nuevo', 'Información anterior: Id_Cacerio = 8, Id_Aldea = 1, Id_Municipio = 1, Id_Departamento = 1, Nombre_Cacerio = Pueblo Nuevo, Descripcion = Pueblo Nuevo', 'tbl_cacerios', NULL),
(534, '2024-05-05 06:05:12', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_cacerios', 'Información eliminada: Id_Cacerio = 8, Id_Aldea = 1, Id_Municipio = 1, Id_Departamento = 1, Nombre_Cacerio = Pueblo Nuevo, Descripcion = Pueblo Nuevo'),
(535, '2024-05-05 06:05:33', 'root@localhost', 'Se insertó', 'Información actual: id_organizacion = 13, organizacion = orga2, id_tipo_organizacion = 8, descripcion = TierrasSana', NULL, 'tbl_organizaciones', NULL),
(536, '2024-05-05 06:06:13', 'root@localhost', 'Se actualizó', 'Información actualizada: id_organizacion = 13, organizacion = orga2, id_tipo_organizacion = 8, descripcion = TierrasSana', 'Información anterior: id_organizacion = 13, organizacion = orga2, id_tipo_organizacion = 8, descripcion = TierrasSana', 'tbl_organizaciones', NULL),
(537, '2024-05-05 06:06:22', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_organizaciones', 'Información eliminada: id_organizacion = 13, organizacion = orga2, id_tipo_organizacion = 8, descripcion = TierrasSana'),
(538, '2024-05-05 06:07:13', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  Prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-05-02 anio_solicitud: 2023, descripcion:  PruebaA, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba', 'fichas', NULL),
(539, '2024-05-05 06:09:58', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 5, Id_Ficha = 1, Id_Ubicacion = 5, Id_Productor = 8, Tiene_Riego = S, Superficie_Riego = 3.00', 'Información anterior: Id_Manejo_Riego = 5, Id_Ficha = 1, Id_Ubicacion = 5, Id_Productor = 8, Tiene_Riego = S, Superficie_Riego = 3.00', 'tbl_manejo_riego', NULL),
(540, '2024-05-05 06:10:18', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 20, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 3, Descripcion =  '),
(541, '2024-05-05 06:10:18', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 21, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 4, Descripcion =  '),
(542, '2024-05-05 06:10:18', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 57, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(543, '2024-05-05 06:10:18', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 58, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(544, '2024-05-05 06:11:14', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 1, tipo_organizacion = Crédito, descripcion = Gobierno', 'Información anterior: id_tipo_organizacion = 1, tipo_organizacion = Asociación, descripcion = Gobierno', 'tbl_tipo_organizacion', NULL),
(545, '2024-05-05 06:11:31', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 2, tipo_organizacion = Capacitación, descripcion = ONG', 'Información anterior: id_tipo_organizacion = 2, tipo_organizacion = Cooperativa, descripcion = ONG', 'tbl_tipo_organizacion', NULL),
(546, '2024-05-05 06:11:50', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 5, tipo_organizacion = Sistema de riego, descripcion = Sistema de riego', 'Información anterior: id_tipo_organizacion = 5, tipo_organizacion = Caja rural, descripcion = Amigo', 'tbl_tipo_organizacion', NULL),
(547, '2024-05-05 06:12:06', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 6, tipo_organizacion = Cosechadoras de agua, descripcion = Cosechadoras de agua', 'Información anterior: id_tipo_organizacion = 6, tipo_organizacion = Patronato, descripcion = Cooperativa', 'tbl_tipo_organizacion', NULL),
(548, '2024-05-05 06:12:21', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 7, tipo_organizacion = Semilla, descripcion = Semilla', 'Información anterior: id_tipo_organizacion = 7, tipo_organizacion = Junta de agua, descripcion = FAO', 'tbl_tipo_organizacion', NULL),
(549, '2024-05-05 06:12:42', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 8, tipo_organizacion = Asistencia técnica, descripcion = Asistencia técnica', 'Información anterior: id_tipo_organizacion = 8, tipo_organizacion = ORGACtiva, descripcion = ORGActivo', 'tbl_tipo_organizacion', NULL),
(550, '2024-05-05 06:12:56', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 9, tipo_organizacion = Equipo agrícola, descripcion = Equipo agrícola', 'Información anterior: id_tipo_organizacion = 9, tipo_organizacion = tbl_tipo_organizacion, descripcion = tbl_tipo_organizacion', 'tbl_tipo_organizacion', NULL),
(551, '2024-05-05 06:13:13', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_organizacion = 12, tipo_organizacion = Pie de cría, descripcion = Pie de cría', NULL, 'tbl_tipo_organizacion', NULL),
(552, '2024-05-05 06:13:24', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_organizacion = 13, tipo_organizacion = Fertilizante, descripcion = Fertilizante', NULL, 'tbl_tipo_organizacion', NULL),
(553, '2024-05-05 06:13:36', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_organizacion = 14, tipo_organizacion = Herramientas de trabajo, descripcion = Herramientas de trabajo', NULL, 'tbl_tipo_organizacion', NULL),
(554, '2024-05-05 06:13:44', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_organizacion = 15, tipo_organizacion = Silos, descripcion = Silos', NULL, 'tbl_tipo_organizacion', NULL),
(555, '2024-05-05 06:13:58', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_organizacion = 16, tipo_organizacion = Información de precios, descripcion = Información de precios', NULL, 'tbl_tipo_organizacion', NULL),
(556, '2024-05-05 06:14:08', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-05-03, anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco Morazan, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-05-03 anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco MorazanA, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg', 'fichas', NULL),
(557, '2024-05-05 06:14:18', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00', 'Información anterior: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00', 'tbl_manejo_riego', NULL),
(558, '2024-05-05 06:14:34', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 51, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 3, Descripcion =  '),
(559, '2024-05-05 06:14:34', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 52, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 4, Descripcion =  '),
(560, '2024-05-05 06:14:34', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 53, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 5, Descripcion =  '),
(561, '2024-05-05 06:14:34', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 54, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 6, Descripcion =  '),
(562, '2024-05-05 06:14:34', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 55, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 28, Descripcion =  '),
(563, '2024-05-05 06:14:34', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 56, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 44, Descripcion =  '),
(564, '2024-05-05 06:14:34', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 59, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(565, '2024-05-05 06:14:34', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 60, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(566, '2024-05-05 06:14:34', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 61, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 5, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(567, '2024-05-05 06:14:34', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 62, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 6, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(568, '2024-05-05 06:14:34', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 63, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 28, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(569, '2024-05-05 06:14:34', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 64, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(570, '2024-05-05 06:15:00', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-05-03, anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco Morazan, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-05-03 anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco MorazanA, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg', 'fichas', NULL),
(571, '2024-05-05 06:15:51', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 2, tipo_organizacion = Capacitación, descripcion = ONG', 'Información anterior: id_tipo_organizacion = 2, tipo_organizacion = Capacitación, descripcion = ONG', 'tbl_tipo_organizacion', NULL),
(572, '2024-05-05 06:15:56', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 1, tipo_organizacion = Crédito, descripcion = Gobierno', 'Información anterior: id_tipo_organizacion = 1, tipo_organizacion = Crédito, descripcion = Gobierno', 'tbl_tipo_organizacion', NULL),
(573, '2024-05-05 06:16:00', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 5, tipo_organizacion = Sistema de riego, descripcion = Sistema de riego', 'Información anterior: id_tipo_organizacion = 5, tipo_organizacion = Sistema de riego, descripcion = Sistema de riego', 'tbl_tipo_organizacion', NULL),
(574, '2024-05-05 06:16:04', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 6, tipo_organizacion = Cosechadoras de agua, descripcion = Cosechadoras de agua', 'Información anterior: id_tipo_organizacion = 6, tipo_organizacion = Cosechadoras de agua, descripcion = Cosechadoras de agua', 'tbl_tipo_organizacion', NULL),
(575, '2024-05-05 06:16:08', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 7, tipo_organizacion = Semilla, descripcion = Semilla', 'Información anterior: id_tipo_organizacion = 7, tipo_organizacion = Semilla, descripcion = Semilla', 'tbl_tipo_organizacion', NULL),
(576, '2024-05-05 06:16:24', 'root@localhost', 'Se actualizó', 'Información actualizada: id_organizacion = 2, organizacion = Cooperativa, id_tipo_organizacion = 2, descripcion = Cooperativa Elga', 'Información anterior: id_organizacion = 2, organizacion = Cooperativa, id_tipo_organizacion = 2, descripcion = Cooperativa Elga', 'tbl_organizaciones', NULL),
(577, '2024-05-05 06:16:27', 'root@localhost', 'Se actualizó', 'Información actualizada: id_organizacion = 3, organizacion = Caja rural, id_tipo_organizacion = 1, descripcion = sfsdfsdfs', 'Información anterior: id_organizacion = 3, organizacion = Caja rural, id_tipo_organizacion = 1, descripcion = sfsdfsdfs', 'tbl_organizaciones', NULL),
(578, '2024-05-05 06:16:31', 'root@localhost', 'Se actualizó', 'Información actualizada: id_organizacion = 4, organizacion = Patronato, id_tipo_organizacion = 6, descripcion = Patrono', 'Información anterior: id_organizacion = 4, organizacion = Patronato, id_tipo_organizacion = 6, descripcion = Patrono', 'tbl_organizaciones', NULL),
(579, '2024-05-05 06:16:35', 'root@localhost', 'Se actualizó', 'Información actualizada: id_organizacion = 5, organizacion = Junta de agua, id_tipo_organizacion = 7, descripcion = Junta de agua', 'Información anterior: id_organizacion = 5, organizacion = Junta de agua, id_tipo_organizacion = 7, descripcion = Junta de agua', 'tbl_organizaciones', NULL),
(580, '2024-05-05 06:16:47', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-05-03, anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco Morazan, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-05-03 anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco MorazanA, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg', 'fichas', NULL),
(581, '2024-05-05 06:17:35', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_motivo = 1, Motivo = Estudio, Descripcion = por el Estudio', 'Información anterior: Id_motivo = 1, Motivo = Estudio, Descripcion = por el Estudio', 'tbl_motivos_migracion', NULL),
(582, '2024-05-05 06:17:40', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_motivo = 2, Motivo = Trabajo, Descripcion = No encuentra Trabajo en el país.', 'Información anterior: Id_motivo = 2, Motivo = Trabajo, Descripcion = No encuentra Trabajo en el país.', 'tbl_motivos_migracion', NULL),
(583, '2024-05-05 06:17:43', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_motivo = 3, Motivo = Violencia, Descripcion = Violencia familiar o amenazas', 'Información anterior: Id_motivo = 3, Motivo = Violencia, Descripcion = Violencia familiar o amenazas', 'tbl_motivos_migracion', NULL),
(584, '2024-05-05 06:17:47', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_motivo = 4, Motivo = Cambio climático, Descripcion = Cambio climático o desastre natural', 'Información anterior: Id_motivo = 4, Motivo = Cambio climático, Descripcion = Cambio climático o desastre natural', 'tbl_motivos_migracion', NULL),
(585, '2024-05-05 06:19:52', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00', 'Información anterior: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00', 'tbl_manejo_riego', NULL),
(586, '2024-05-05 06:20:59', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 59, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 3, Descripcion =  '),
(587, '2024-05-05 06:20:59', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 60, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 4, Descripcion =  '),
(588, '2024-05-05 06:20:59', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 61, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 5, Descripcion =  '),
(589, '2024-05-05 06:20:59', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 62, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 6, Descripcion =  '),
(590, '2024-05-05 06:20:59', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 63, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 28, Descripcion =  '),
(591, '2024-05-05 06:20:59', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 64, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 44, Descripcion =  '),
(592, '2024-05-05 06:20:59', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 65, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(593, '2024-05-05 06:20:59', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 66, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(594, '2024-05-05 06:20:59', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 67, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 5, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(595, '2024-05-05 06:20:59', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 68, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 6, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(596, '2024-05-05 06:20:59', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 69, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 28, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(597, '2024-05-05 06:20:59', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 70, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(598, '2024-05-05 06:21:14', 'root@localhost', 'Se actualizó', 'Información actualizada: id_apoyo_produccion = 2, tipo_apoyo_produccion = ONG, descripcion = Organismo internacional', 'Información anterior: id_apoyo_produccion = 2, tipo_apoyo_produccion = ONG, descripcion = Organismo internacional', 'tbl_apoyos', NULL),
(599, '2024-05-05 06:21:21', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 6, fecha_solicitud: 2024-05-03, anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco Morazan, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg', 'Información anterior = id_ficha: 6, fecha_solicitud: 2024-05-03 anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco MorazanA, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg', 'fichas', NULL),
(600, '2024-05-05 06:21:30', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00', 'Información anterior: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00', 'tbl_manejo_riego', NULL),
(601, '2024-05-05 06:21:49', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 65, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 3, Descripcion =  '),
(602, '2024-05-05 06:21:49', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 66, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 4, Descripcion =  '),
(603, '2024-05-05 06:21:49', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 67, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 5, Descripcion =  '),
(604, '2024-05-05 06:21:49', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 68, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 6, Descripcion =  '),
(605, '2024-05-05 06:21:49', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 69, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 28, Descripcion =  '),
(606, '2024-05-05 06:21:49', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 70, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 44, Descripcion =  '),
(607, '2024-05-05 06:21:49', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 71, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(608, '2024-05-05 06:21:49', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 72, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(609, '2024-05-05 06:21:49', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 73, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 5, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(610, '2024-05-05 06:21:49', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 74, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 6, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(611, '2024-05-05 06:21:49', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 75, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 28, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(612, '2024-05-05 06:21:49', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 76, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(613, '2024-05-05 19:42:28', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 7, fecha_solicitud: 2024-05-05, anio_solicitud: 2023, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-05, nombre_encuestador: prueba', NULL, 'fichas', NULL),
(614, '2024-05-05 19:46:14', 'root@localhost', 'Se insertó', 'Información actual: Id_Manejo_Riego = 11, Id_Ficha = 7, Id_Ubicacion = 11, Id_Productor = 14, Tiene_Riego = S, Superficie_Riego = 12.00', NULL, 'tbl_manejo_riego', NULL),
(615, '2024-05-05 19:49:02', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 77, Id_Ficha = 7, Id_Productor = 14, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(616, '2024-05-05 19:49:02', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 78, Id_Ficha = 7, Id_Productor = 14, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(617, '2024-05-05 19:49:02', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 79, Id_Ficha = 7, Id_Productor = 14, Id_Tipo_Practica = 5, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(618, '2024-05-05 19:49:28', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 7, fecha_solicitud: 2024-05-05, anio_solicitud: 2023, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-05, nombre_encuestador: prueba', 'Información anterior = id_ficha: 7, fecha_solicitud: 2024-05-05 anio_solicitud: 2023, descripcion:  pruebaA, fecha_entrevista: 2024-05-05, nombre_encuestador: prueba', 'fichas', NULL),
(619, '2024-05-05 19:50:25', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 11, Id_Ficha = 7, Id_Ubicacion = 11, Id_Productor = 14, Tiene_Riego = S, Superficie_Riego = 12.00', 'Información anterior: Id_Manejo_Riego = 11, Id_Ficha = 7, Id_Ubicacion = 11, Id_Productor = 14, Tiene_Riego = S, Superficie_Riego = 12.00', 'tbl_manejo_riego', NULL),
(620, '2024-05-05 19:50:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 77, Id_Ficha = 7, Id_Productor = 14, Id_Tipo_Practica = 3, Descripcion =  '),
(621, '2024-05-05 19:50:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 78, Id_Ficha = 7, Id_Productor = 14, Id_Tipo_Practica = 4, Descripcion =  '),
(622, '2024-05-05 19:50:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 79, Id_Ficha = 7, Id_Productor = 14, Id_Tipo_Practica = 5, Descripcion =  '),
(623, '2024-05-05 19:50:56', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 80, Id_Ficha = 7, Id_Productor = 14, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(624, '2024-05-05 19:50:56', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 81, Id_Ficha = 7, Id_Productor = 14, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(625, '2024-05-05 19:50:56', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 82, Id_Ficha = 7, Id_Productor = 14, Id_Tipo_Practica = 5, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(626, '2024-05-05 19:52:31', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 8, fecha_solicitud: 2024-05-05, anio_solicitud: 2023, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-05, nombre_encuestador: prueba', NULL, 'fichas', NULL),
(627, '2024-05-05 19:52:31', 'root@localhost', 'Se insertó', 'Información actual: Id_Manejo_Riego = 12, Id_Ficha = 8, Id_Ubicacion = 12, Id_Productor = 15, Tiene_Riego = S, Superficie_Riego = 12.00', NULL, 'tbl_manejo_riego', NULL),
(628, '2024-05-05 19:52:31', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 83, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(629, '2024-05-05 19:52:31', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 84, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(630, '2024-05-05 19:52:31', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 85, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 5, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(631, '2024-05-05 19:52:46', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 8, fecha_solicitud: 2024-05-05, anio_solicitud: 2024, descripcion:  prueba edicion, estado: A, fecha_entrevista: 2024-05-05, nombre_encuestador: pruebaedicion', 'Información anterior = id_ficha: 8, fecha_solicitud: 2024-05-05 anio_solicitud: 2023, descripcion:  pruebaA, fecha_entrevista: 2024-05-05, nombre_encuestador: prueba', 'fichas', NULL),
(632, '2024-05-05 19:54:23', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 12, Id_Ficha = 8, Id_Ubicacion = 12, Id_Productor = 15, Tiene_Riego = S, Superficie_Riego = 12.00', 'Información anterior: Id_Manejo_Riego = 12, Id_Ficha = 8, Id_Ubicacion = 12, Id_Productor = 15, Tiene_Riego = S, Superficie_Riego = 12.00', 'tbl_manejo_riego', NULL),
(633, '2024-05-05 19:56:06', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 83, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 3, Descripcion =  '),
(634, '2024-05-05 19:56:06', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 84, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 4, Descripcion =  '),
(635, '2024-05-05 19:56:06', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 85, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 5, Descripcion =  '),
(636, '2024-05-05 19:56:06', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 86, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(637, '2024-05-05 19:56:06', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 87, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(638, '2024-05-05 19:56:06', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 88, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 5, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(639, '2024-05-05 19:59:18', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 8, fecha_solicitud: 2024-05-05, anio_solicitud: 2024, descripcion:  prueba edicion, estado: A, fecha_entrevista: 2024-05-05, nombre_encuestador: pruebaedicion', 'Información anterior = id_ficha: 8, fecha_solicitud: 2024-05-05 anio_solicitud: 2024, descripcion:  prueba edicionA, fecha_entrevista: 2024-05-05, nombre_encuestador: pruebaedicion', 'fichas', NULL),
(640, '2024-05-05 19:59:35', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 12, Id_Ficha = 8, Id_Ubicacion = 12, Id_Productor = 15, Tiene_Riego = S, Superficie_Riego = 12.00', 'Información anterior: Id_Manejo_Riego = 12, Id_Ficha = 8, Id_Ubicacion = 12, Id_Productor = 15, Tiene_Riego = S, Superficie_Riego = 12.00', 'tbl_manejo_riego', NULL),
(641, '2024-05-05 19:59:58', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 86, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 3, Descripcion =  '),
(642, '2024-05-05 19:59:58', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 87, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 4, Descripcion =  '),
(643, '2024-05-05 19:59:58', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 88, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 5, Descripcion =  '),
(644, '2024-05-05 19:59:58', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 89, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(645, '2024-05-05 19:59:58', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 90, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(646, '2024-05-05 19:59:58', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 91, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 5, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(647, '2024-05-05 20:08:09', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 8, fecha_solicitud: 2024-05-05, anio_solicitud: 2024, descripcion:  prueba edicion, estado: A, fecha_entrevista: 2024-05-05, nombre_encuestador: pruebaedicion', 'Información anterior = id_ficha: 8, fecha_solicitud: 2024-05-05 anio_solicitud: 2024, descripcion:  prueba edicionA, fecha_entrevista: 2024-05-05, nombre_encuestador: pruebaedicion', 'fichas', NULL),
(648, '2024-05-05 20:08:28', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 12, Id_Ficha = 8, Id_Ubicacion = 12, Id_Productor = 15, Tiene_Riego = S, Superficie_Riego = 12.00', 'Información anterior: Id_Manejo_Riego = 12, Id_Ficha = 8, Id_Ubicacion = 12, Id_Productor = 15, Tiene_Riego = S, Superficie_Riego = 12.00', 'tbl_manejo_riego', NULL),
(649, '2024-05-05 20:09:37', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 89, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 3, Descripcion =  '),
(650, '2024-05-05 20:09:37', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 90, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 4, Descripcion =  '),
(651, '2024-05-05 20:09:37', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 91, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 5, Descripcion =  '),
(652, '2024-05-05 20:09:37', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 92, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(653, '2024-05-05 20:09:37', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 93, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(654, '2024-05-05 20:09:37', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 94, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 5, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(655, '2024-05-05 20:09:37', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 95, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 6, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(656, '2024-05-05 20:09:37', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 96, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 7, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(657, '2024-05-05 20:09:37', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 97, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 8, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(658, '2024-05-05 20:14:01', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_manejo_riego', 'Información eliminada: Id_Manejo_Riego = 5, Id_Ficha = 1, Id_Ubicacion = 5, Id_Productor = 8, Tiene_Riego = S, Superficie_Riego = 3.00'),
(659, '2024-05-05 20:14:01', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_manejo_riego', 'Información eliminada: Id_Manejo_Riego = 6, Id_Ficha = 2, Id_Ubicacion = 6, Id_Productor = 9, Tiene_Riego = S, Superficie_Riego = 2.00'),
(660, '2024-05-05 20:14:01', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_manejo_riego', 'Información eliminada: Id_Manejo_Riego = 7, Id_Ficha = 3, Id_Ubicacion = 7, Id_Productor = 10, Tiene_Riego = S, Superficie_Riego = 3.00'),
(661, '2024-05-05 20:14:01', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_manejo_riego', 'Información eliminada: Id_Manejo_Riego = 8, Id_Ficha = 4, Id_Ubicacion = 8, Id_Productor = 11, Tiene_Riego = S, Superficie_Riego = 3.00'),
(662, '2024-05-05 20:14:01', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_manejo_riego', 'Información eliminada: Id_Manejo_Riego = 9, Id_Ficha = 5, Id_Ubicacion = 9, Id_Productor = 12, Tiene_Riego = S, Superficie_Riego = 10.00'),
(663, '2024-05-05 20:14:01', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_manejo_riego', 'Información eliminada: Id_Manejo_Riego = 10, Id_Ficha = 6, Id_Ubicacion = 10, Id_Productor = 13, Tiene_Riego = S, Superficie_Riego = 10.00'),
(664, '2024-05-05 20:14:01', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_manejo_riego', 'Información eliminada: Id_Manejo_Riego = 11, Id_Ficha = 7, Id_Ubicacion = 11, Id_Productor = 14, Tiene_Riego = S, Superficie_Riego = 12.00'),
(665, '2024-05-05 20:14:01', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_manejo_riego', 'Información eliminada: Id_Manejo_Riego = 12, Id_Ficha = 8, Id_Ubicacion = 12, Id_Productor = 15, Tiene_Riego = S, Superficie_Riego = 12.00'),
(666, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 22, Id_Ficha = 2, Id_Productor = 9, Id_Tipo_Practica = 3, Descripcion =  '),
(667, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 23, Id_Ficha = 3, Id_Productor = 10, Id_Tipo_Practica = 3, Descripcion =  ');
INSERT INTO `bitacoras` (`id_bitacora`, `fecha`, `ejecutor`, `actividad_realizada`, `informacion_actual`, `informacion_anterior`, `tabla`, `informacion_eliminada`) VALUES
(668, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 26, Id_Ficha = 4, Id_Productor = 11, Id_Tipo_Practica = 3, Descripcion =  '),
(669, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 33, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 3, Descripcion =  '),
(670, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 34, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 28, Descripcion =  '),
(671, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 35, Id_Ficha = 5, Id_Productor = 12, Id_Tipo_Practica = 44, Descripcion =  '),
(672, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 57, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 3, Descripcion =  '),
(673, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 58, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 4, Descripcion =  '),
(674, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 71, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 3, Descripcion =  '),
(675, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 72, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 4, Descripcion =  '),
(676, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 73, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 5, Descripcion =  '),
(677, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 74, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 6, Descripcion =  '),
(678, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 75, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 28, Descripcion =  '),
(679, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 76, Id_Ficha = 6, Id_Productor = 13, Id_Tipo_Practica = 44, Descripcion =  '),
(680, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 80, Id_Ficha = 7, Id_Productor = 14, Id_Tipo_Practica = 3, Descripcion =  '),
(681, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 81, Id_Ficha = 7, Id_Productor = 14, Id_Tipo_Practica = 4, Descripcion =  '),
(682, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 82, Id_Ficha = 7, Id_Productor = 14, Id_Tipo_Practica = 5, Descripcion =  '),
(683, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 92, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 3, Descripcion =  '),
(684, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 93, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 4, Descripcion =  '),
(685, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 94, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 5, Descripcion =  '),
(686, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 95, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 6, Descripcion =  '),
(687, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 96, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 7, Descripcion =  '),
(688, '2024-05-05 20:14:56', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 97, Id_Ficha = 8, Id_Productor = 15, Id_Tipo_Practica = 8, Descripcion =  '),
(689, '2024-05-05 20:18:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 1, fecha_solicitud: 2024-05-02, anio_solicitud: 2023, descripcion:  Prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Prueba'),
(690, '2024-05-05 20:18:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 2, fecha_solicitud: 2024-05-02, anio_solicitud: 2020, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: prueba'),
(691, '2024-05-05 20:18:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 3, fecha_solicitud: 2024-05-02, anio_solicitud: 3333, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras'),
(692, '2024-05-05 20:18:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 4, fecha_solicitud: 2024-05-02, anio_solicitud: 3333, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-02, nombre_encuestador: Honduras'),
(693, '2024-05-05 20:18:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 5, fecha_solicitud: 2024-05-03, anio_solicitud: 2023, descripcion:  Francisco Morazan, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Honduras'),
(694, '2024-05-05 20:18:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 6, fecha_solicitud: 2024-05-03, anio_solicitud: 2024, descripcion:  Francisco MorazanFrancisco Morazan, estado: A, fecha_entrevista: 2024-05-03, nombre_encuestador: Hondurasjg'),
(695, '2024-05-05 20:18:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 7, fecha_solicitud: 2024-05-05, anio_solicitud: 2023, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-05, nombre_encuestador: prueba'),
(696, '2024-05-05 20:18:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 8, fecha_solicitud: 2024-05-05, anio_solicitud: 2024, descripcion:  prueba edicion, estado: A, fecha_entrevista: 2024-05-05, nombre_encuestador: pruebaedicion'),
(697, '2024-05-05 22:31:43', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 1, fecha_solicitud: 2024-05-05, anio_solicitud: 2020, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-05, nombre_encuestador: Honduras', NULL, 'fichas', NULL),
(698, '2024-05-05 22:33:53', 'root@localhost', 'Se insertó', 'Información actual: Id_Manejo_Riego = 13, Id_Ficha = 1, Id_Ubicacion = 13, Id_Productor = 8, Tiene_Riego = S, Superficie_Riego = 11.00', NULL, 'tbl_manejo_riego', NULL),
(699, '2024-05-05 22:35:24', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 98, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 5, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(700, '2024-05-05 22:35:24', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 99, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 7, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(701, '2024-05-05 22:35:24', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 100, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 8, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(702, '2024-05-05 22:35:24', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 101, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 12, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(703, '2024-05-05 22:35:24', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 102, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 29, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(704, '2024-05-05 22:39:42', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-05-05, anio_solicitud: 2020, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-05, nombre_encuestador: Honduras', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-05-05 anio_solicitud: 2020, descripcion:  pruebaA, fecha_entrevista: 2024-05-05, nombre_encuestador: Honduras', 'fichas', NULL),
(705, '2024-05-05 22:41:05', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 13, Id_Ficha = 1, Id_Ubicacion = 13, Id_Productor = 8, Tiene_Riego = S, Superficie_Riego = 22.00', 'Información anterior: Id_Manejo_Riego = 13, Id_Ficha = 1, Id_Ubicacion = 13, Id_Productor = 8, Tiene_Riego = S, Superficie_Riego = 11.00', 'tbl_manejo_riego', NULL),
(706, '2024-05-05 22:42:47', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 98, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 5, Descripcion =  '),
(707, '2024-05-05 22:42:47', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 99, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 7, Descripcion =  '),
(708, '2024-05-05 22:42:47', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 100, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 8, Descripcion =  '),
(709, '2024-05-05 22:42:47', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 101, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 12, Descripcion =  '),
(710, '2024-05-05 22:42:47', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 102, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 29, Descripcion =  '),
(711, '2024-05-05 22:42:47', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 103, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 3, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(712, '2024-05-05 22:42:47', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 104, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 4, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(713, '2024-05-05 22:42:47', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 105, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 5, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(714, '2024-05-05 22:42:47', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 106, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 6, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(715, '2024-05-05 22:42:47', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 107, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 7, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(716, '2024-05-05 22:42:47', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 108, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 8, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(717, '2024-05-05 22:42:47', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 109, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 12, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(718, '2024-05-05 22:46:58', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_manejo_riego', 'Información eliminada: Id_Manejo_Riego = 13, Id_Ficha = 1, Id_Ubicacion = 13, Id_Productor = 8, Tiene_Riego = S, Superficie_Riego = 22.00'),
(719, '2024-05-05 22:47:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 103, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 3, Descripcion =  '),
(720, '2024-05-05 22:47:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 104, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 4, Descripcion =  '),
(721, '2024-05-05 22:47:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 105, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 5, Descripcion =  '),
(722, '2024-05-05 22:47:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 106, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 6, Descripcion =  '),
(723, '2024-05-05 22:47:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 107, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 7, Descripcion =  '),
(724, '2024-05-05 22:47:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 108, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 8, Descripcion =  '),
(725, '2024-05-05 22:47:43', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 109, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 12, Descripcion =  '),
(726, '2024-05-05 22:49:41', 'root@localhost', 'Se eliminó', NULL, NULL, 'fichas', 'Información eliminada = id_ficha: 1, fecha_solicitud: 2024-05-05, anio_solicitud: 2020, descripcion:  prueba, estado: A, fecha_entrevista: 2024-05-05, nombre_encuestador: Honduras'),
(727, '2024-05-06 02:01:09', 'root@localhost', 'Se insertó', 'Información actual: id_etnia = 19, etnia = EtniaActiva, descripcion = EtniaActiva', NULL, 'tbl_etnias', NULL),
(728, '2024-05-06 02:01:45', 'root@localhost', 'Se insertó', 'Información actual: id_etnia = 20, etnia = EtniaInactiva, descripcion = EtniaInactiva', NULL, 'tbl_etnias', NULL),
(729, '2024-05-06 02:02:44', 'root@localhost', 'Se insertó', 'Información actual: Id_Cacerio = 9, Id_Aldea = 151, Id_Municipio = 91, Id_Departamento = 22, Nombre_Cacerio = CaceriosActivo, Descripcion = CaceriosActivo', NULL, 'tbl_cacerios', NULL),
(730, '2024-05-06 02:03:17', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Municipio = 91, Id_Departamento = 22, Nombre_Municipio = MunicipioActivo, Descripcion = Activo', 'Información anterior: Id_Municipio = 91, Id_Departamento = 22, Nombre_Municipio = Activo, Descripcion = Activo', 'tbl_municipios', NULL),
(731, '2024-05-06 02:04:49', 'root@localhost', 'Se insertó', 'Información actual: Id_Cacerio = 10, Id_Aldea = 151, Id_Municipio = 91, Id_Departamento = 22, Nombre_Cacerio = CaceriosInactivo, Descripcion = CaceriosInactivo', NULL, 'tbl_cacerios', NULL),
(732, '2024-05-06 02:04:54', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Cacerio = 10, Id_Aldea = 151, Id_Municipio = 91, Id_Departamento = 22, Nombre_Cacerio = CaceriosInactivo, Descripcion = CaceriosInactivo', 'Información anterior: Id_Cacerio = 10, Id_Aldea = 151, Id_Municipio = 91, Id_Departamento = 22, Nombre_Cacerio = CaceriosInactivo, Descripcion = CaceriosInactivo', 'tbl_cacerios', NULL),
(733, '2024-05-06 02:06:09', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_organizacion = 17, tipo_organizacion = TipoORGActivo, descripcion = TipoORGActivo', NULL, 'tbl_tipo_organizacion', NULL),
(734, '2024-05-06 02:06:20', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_organizacion = 18, tipo_organizacion = TipoORGInactiva, descripcion = TipoORGInactiva', NULL, 'tbl_tipo_organizacion', NULL),
(735, '2024-05-06 02:06:25', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_organizacion = 18, tipo_organizacion = TipoORGInactiva, descripcion = TipoORGInactiva', 'Información anterior: id_tipo_organizacion = 18, tipo_organizacion = TipoORGInactiva, descripcion = TipoORGInactiva', 'tbl_tipo_organizacion', NULL),
(736, '2024-05-06 02:06:48', 'root@localhost', 'Se insertó', 'Información actual: id_organizacion = 14, organizacion = OrganizacionActiva, id_tipo_organizacion = 17, descripcion = OrganizacionActiva', NULL, 'tbl_organizaciones', NULL),
(737, '2024-05-06 02:07:02', 'root@localhost', 'Se insertó', 'Información actual: id_organizacion = 15, organizacion = OrganizacionInactiva, id_tipo_organizacion = 17, descripcion = OrganizacionInactiva', NULL, 'tbl_organizaciones', NULL),
(738, '2024-05-06 02:07:07', 'root@localhost', 'Se actualizó', 'Información actualizada: id_organizacion = 15, organizacion = OrganizacionInactiva, id_tipo_organizacion = 17, descripcion = OrganizacionInactiva', 'Información anterior: id_organizacion = 15, organizacion = OrganizacionInactiva, id_tipo_organizacion = 17, descripcion = OrganizacionInactiva', 'tbl_organizaciones', NULL),
(739, '2024-05-06 02:07:37', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_motivo = 11, Motivo = MotivoMigracion, Descripcion = MotivoMigracionINac', 'Información anterior: Id_motivo = 11, Motivo = MotivoMigracion, Descripcion = MotivoMigracion', 'tbl_motivos_migracion', NULL),
(740, '2024-05-06 02:07:52', 'root@localhost', 'Se insertó', 'Información actual: Id_motivo = 14, Motivo = MotivoActivo, Descripcion = MotivoActivo', NULL, 'tbl_motivos_migracion', NULL),
(741, '2024-05-06 02:08:28', 'root@localhost', 'Se insertó', 'Información actual: id_medida = 21, medida = MedidaActiva, descripcion = MedidaActiva', NULL, 'tbl_medidas_tierra', NULL),
(742, '2024-05-06 02:08:45', 'root@localhost', 'Se insertó', 'Información actual: id_medida = 22, medida = MedidaInactiva, descripcion = MedidaInactiva', NULL, 'tbl_medidas_tierra', NULL),
(743, '2024-05-06 02:08:50', 'root@localhost', 'Se actualizó', 'Información actualizada: id_medida = 22, medida = MedidaInactiva, descripcion = MedidaInactiva', 'Información anterior: id_medida = 22, medida = MedidaInactiva, descripcion = MedidaInactiva', 'tbl_medidas_tierra', NULL),
(744, '2024-05-06 02:09:39', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_pecuario = 11, tipo_pecuario = ActivoPEA, raza_con_genero = s, descripcion = ActivoPEA', 'Información anterior: id_tipo_pecuario = 11, tipo_pecuario = PeActivo, raza_con_genero = s, descripcion = PeActivo', 'tbl_tipo_pecuarios', NULL),
(745, '2024-05-06 02:10:15', 'root@localhost', 'Se actualizó', 'Información actualizada: id_tipo_produccion = 6, tipo_produccion = Producto de Transformación, descripcion = Transformación', 'Información anterior: id_tipo_produccion = 6, tipo_produccion = Producto de Transformación, descripcion = Transformación', 'tbl_tipo_produccion', NULL),
(746, '2024-05-06 02:10:51', 'root@localhost', 'Se insertó', 'Información actual: id_periodo = 17, periodo = PeriodoPrueba, descripcion = PeriodoPrueba', NULL, 'tbl_periodicidad', NULL),
(747, '2024-05-06 02:11:22', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_negocio = 17, tipo_negocio = TNegocioActivo, descripcion = TNegocioActivo', NULL, 'tbl_tipo_negocios', NULL),
(748, '2024-05-06 02:11:55', 'root@localhost', 'Se actualizó', 'Información actualizada: id_motivos_no_credito = 7, motivo_no_credito = Tasas de interés muy altas , descripcion = Tasas de interés muy altas ', 'Información anterior: id_motivos_no_credito = 7, motivo_no_credito = Tasas de interés muy altas , descripcion = Tasas de interés muy altas ', 'tbl_motivos_no_creditos', NULL),
(749, '2024-05-06 02:13:21', 'root@localhost', 'Se insertó', 'Información actual: id_tipo_tomador = 9, tomador = TomaDActivo, descripcion = TomaDActivo', NULL, 'tbl_toma_decisiones', NULL),
(750, '2024-05-06 02:16:22', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 1, fecha_solicitud: 2024-05-05, anio_solicitud: 2023, descripcion:  PruebaFInalEvaluacion, estado: A, fecha_entrevista: 2024-05-05, nombre_encuestador: PruebaFInalEvaluacion', NULL, 'fichas', NULL),
(751, '2024-05-06 02:21:59', 'root@localhost', 'Se insertó', 'Información actual: Id_Manejo_Riego = 14, Id_Ficha = 1, Id_Ubicacion = 14, Id_Productor = 8, Tiene_Riego = S, Superficie_Riego = 100.00', NULL, 'tbl_manejo_riego', NULL),
(752, '2024-05-06 02:24:49', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 110, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(753, '2024-05-06 02:27:13', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 2, fecha_solicitud: 2024-05-05, anio_solicitud: 2023, descripcion:  PruebaFInalEvaluacion, estado: A, fecha_entrevista: 2024-05-05, nombre_encuestador: PruebaFInalEvaluacion', NULL, 'fichas', NULL),
(754, '2024-05-06 02:27:13', 'root@localhost', 'Se insertó', 'Información actual: Id_Manejo_Riego = 15, Id_Ficha = 2, Id_Ubicacion = 15, Id_Productor = 9, Tiene_Riego = S, Superficie_Riego = 100.00', NULL, 'tbl_manejo_riego', NULL),
(755, '2024-05-06 02:27:13', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 111, Id_Ficha = 2, Id_Productor = 9, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(756, '2024-05-06 02:27:22', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 2, fecha_solicitud: 2024-05-05, anio_solicitud: 2026, descripcion:  PruebaFInalEvaluacion, estado: A, fecha_entrevista: 2024-05-05, nombre_encuestador: PruebaFInalEvaluacion', 'Información anterior = id_ficha: 2, fecha_solicitud: 2024-05-05 anio_solicitud: 2023, descripcion:  PruebaFInalEvaluacionA, fecha_entrevista: 2024-05-05, nombre_encuestador: PruebaFInalEvaluacion', 'fichas', NULL),
(757, '2024-05-06 02:28:09', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 15, Id_Ficha = 2, Id_Ubicacion = 15, Id_Productor = 9, Tiene_Riego = S, Superficie_Riego = 100.00', 'Información anterior: Id_Manejo_Riego = 15, Id_Ficha = 2, Id_Ubicacion = 15, Id_Productor = 9, Tiene_Riego = S, Superficie_Riego = 100.00', 'tbl_manejo_riego', NULL),
(758, '2024-05-06 02:28:59', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 111, Id_Ficha = 2, Id_Productor = 9, Id_Tipo_Practica = 44, Descripcion =  '),
(759, '2024-05-06 02:28:59', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 112, Id_Ficha = 2, Id_Productor = 9, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL),
(760, '2024-05-07 03:42:33', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 3, fecha_solicitud: 2024-05-06, anio_solicitud: 2023, descripcion:  registro de ficha de productor 2023, estado: A, fecha_entrevista: 2024-05-06, nombre_encuestador: Kevin', NULL, 'fichas', NULL),
(761, '2024-05-07 03:43:39', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 4, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(762, '2024-05-07 03:55:47', 'root@localhost', 'Se insertó', 'Información actual = id_ficha: 5, fecha_solicitud: 0000-00-00, anio_solicitud: 0, descripcion:  , estado: A, fecha_entrevista: 0000-00-00, nombre_encuestador: ', NULL, 'fichas', NULL),
(763, '2024-05-07 04:00:57', 'root@localhost', 'Se actualizó', 'Información actualizada = id_ficha: 1, fecha_solicitud: 2024-05-05, anio_solicitud: 2023, descripcion:  PruebaFInalEvaluacion, estado: A, fecha_entrevista: 2024-05-05, nombre_encuestador: PruebaFInalEvaluacion', 'Información anterior = id_ficha: 1, fecha_solicitud: 2024-05-05 anio_solicitud: 2023, descripcion:  PruebaFInalEvaluacionA, fecha_entrevista: 2024-05-05, nombre_encuestador: PruebaFInalEvaluacion', 'fichas', NULL),
(764, '2024-05-07 04:02:02', 'root@localhost', 'Se actualizó', 'Información actualizada: Id_Manejo_Riego = 14, Id_Ficha = 1, Id_Ubicacion = 14, Id_Productor = 8, Tiene_Riego = S, Superficie_Riego = 100.00', 'Información anterior: Id_Manejo_Riego = 14, Id_Ficha = 1, Id_Ubicacion = 14, Id_Productor = 8, Tiene_Riego = S, Superficie_Riego = 100.00', 'tbl_manejo_riego', NULL),
(765, '2024-05-07 04:03:20', 'root@localhost', 'Se eliminó', NULL, NULL, 'tbl_practicas_por_produccion', 'Información eliminada: Id_Practica_Produccion = 110, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 44, Descripcion =  '),
(766, '2024-05-07 04:03:20', 'root@localhost', 'Se insertó', 'Información actual: Id_Practica_Produccion = 113, Id_Ficha = 1, Id_Productor = 8, Id_Tipo_Practica = 44, Descripcion =  ', NULL, 'tbl_practicas_por_produccion', NULL);

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
  `firma_supervisor` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fichas`
--

INSERT INTO `fichas` (`id_ficha`, `fecha_solicitud`, `anio_solicitud`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`, `fecha_entrevista`, `nombre_encuentrador`, `firma_productor`, `nombre_encuestador`, `firma_encuestador`, `nombre_supervisor`, `firma_supervisor`) VALUES
(1, '2024-05-05', 2023, ' PruebaFInalEvaluacion', 'HARU', '2024-05-06 02:16:22', 'HARU', '2024-05-07 04:00:57', 'A', '2024-05-05', 'PruebaFInalEvaluacion', NULL, 'PruebaFInalEvaluacion', NULL, 'PruebaFInalEvaluacion', NULL),
(2, '2024-05-05', 2026, ' PruebaFInalEvaluacion', 'HARU', '2024-05-06 02:16:22', 'HARU', '2024-05-06 02:27:22', 'A', '2024-05-05', 'PruebaFInalEvaluacion', NULL, 'PruebaFInalEvaluacion', NULL, 'PruebaFInalEvaluacion', NULL),
(3, '2024-05-06', 2023, ' registro de ficha de productor 2023', 'HARU', '2024-05-07 03:42:33', NULL, '2024-05-07 03:42:33', 'A', '2024-05-06', 'Manuel', NULL, 'Kevin', NULL, 'Joel', NULL),
(4, '0000-00-00', 0, ' ', 'HARU', '2024-05-07 03:43:39', NULL, '2024-05-07 03:43:39', 'A', '0000-00-00', '', NULL, '', NULL, '', NULL),
(5, '0000-00-00', 0, ' ', 'HARU', '2024-05-07 03:55:47', NULL, '2024-05-07 03:55:47', 'A', '0000-00-00', '', NULL, '', NULL, '', NULL);

--
-- Disparadores `fichas`
--
DELIMITER $$
CREATE TRIGGER `DeleteFichas` AFTER DELETE ON `fichas` FOR EACH ROW BEGIN
            INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)VALUES(
            CURRENT_USER, 'Se eliminó', concat('Información eliminada = id_ficha: ', OLD.id_ficha, ', fecha_solicitud: ',OLD.fecha_solicitud, ', anio_solicitud: ',OLD.anio_solicitud, ', descripcion: ', OLD.descripcion, ', estado: ',OLD.estado, ', fecha_entrevista: ',OLD.fecha_entrevista, ', nombre_encuestador: ',OLD.nombre_encuestador), 'fichas');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertFichas` AFTER INSERT ON `fichas` FOR EACH ROW BEGIN
            INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)VALUES(
            CURRENT_USER, 'Se insertó', concat('Información actual = id_ficha: ', NEW.id_ficha, ', fecha_solicitud: ',NEW.fecha_solicitud, ', anio_solicitud: ',NEW.anio_solicitud, ', descripcion: ', NEW.descripcion, ', estado: ',NEW.estado, ', fecha_entrevista: ',NEW.fecha_entrevista, ', nombre_encuestador: ',NEW.nombre_encuestador), 'fichas');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateFichas` AFTER UPDATE ON `fichas` FOR EACH ROW BEGIN
            INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)VALUES(CURRENT_USER, 'Se actualizó', concat('Información anterior = id_ficha: ', OLD.id_ficha, ', fecha_solicitud: ',OLD.fecha_solicitud, ' anio_solicitud: ',OLD.anio_solicitud, ', descripcion: ', OLD.descripcion, '',OLD.estado, ', fecha_entrevista: ',OLD.fecha_entrevista, ', nombre_encuestador: ',OLD.nombre_encuestador), concat('Información actualizada = id_ficha: ', NEW.id_ficha, ', fecha_solicitud: ',NEW.fecha_solicitud, ', anio_solicitud: ',NEW.anio_solicitud, ', descripcion: ', NEW.descripcion, ', estado: ',NEW.estado, ', fecha_entrevista: ',NEW.fecha_entrevista, ', nombre_encuestador: ',NEW.nombre_encuestador), 'fichas');
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_contrasenas`
--

CREATE TABLE `historial_contrasenas` (
  `id_historial` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  `contrasena_hash` varchar(255) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_contrasenas`
--

INSERT INTO `historial_contrasenas` (`id_historial`, `usuario_id`, `contrasena_hash`, `fecha_creacion`) VALUES
(1, 9, '$2y$10$o2I2ApYtBul2Yjm6j5sfL.kKOySMFtk3Yqb3uj6O0/iHwNGl8VfBi', '2024-04-28 04:38:00'),
(2, 9, '$2y$10$OYa/poBKf/7HvQAfg0nOdu3giNsH61cfE.PcsSW/MJfCkP8.csSLi', '2024-04-28 04:41:25'),
(3, 9, '$2y$10$zQ4V8DhqaznBKRXFXS33L.nDk0SWhvjdZ1fXadC7levKDnImsRpru', '2024-04-28 04:41:42'),
(4, 15, '$2y$10$EY0Z2Ro6taSicrlSDgKh2O7XvNL89AZ43NDkkwi7oKoPhePVT5a8.', '2024-04-28 22:06:22'),
(5, 9, '$2y$10$bqrIfn1INEBy25aFEoQD6eiGROE9tESDrt3ruuKWf/3MbnMgmlzbK', '2024-04-29 02:58:46'),
(6, 19, '$2y$10$gSEv304U//i/5DSmWI/y1.zq.MGDZtIZBUZGdSIdStWsE66F.J12S', '2024-05-01 16:08:43'),
(7, 18, '$2y$10$7qoO.iCvc3C4jI0BCKjNiOEa6yUr.N/90VpoO/6BQ/KH8U5KMk6tW', '2024-05-02 22:35:48');

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
  `Creado_Por` varchar(40) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Actualizado_Por` varchar(40) NOT NULL,
  `Fecha_Actualizacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `objetos`
--

INSERT INTO `objetos` (`Id_objetos`, `Objeto`, `Descripcion`, `tipo_objeto`, `Creado_Por`, `Fecha_Creacion`, `Actualizado_Por`, `Fecha_Actualizacion`, `Status`) VALUES
(1, 'Login', 'Login del sistema', 'Pantalla', '0', '2024-04-21 23:02:33', '0', '2024-04-21 23:02:33', 'A'),
(2, 'usuario', 'Pantalla de usuarios', 'Pantalla', 'PRUEBA1', '2024-04-21 23:04:00', 'PRUEBA1', '2024-04-21 23:04:00', 'A'),
(3, 'Permisos', 'Pantalla de permisos', 'Pantalla', 'HARU', '2024-04-21 23:05:15', 'HARU', '2024-04-21 23:05:15', 'A'),
(4, 'Preguntas', 'Pantalla de preguntas', 'Pantalla', 'HARU', '2024-04-21 23:05:42', 'HARU', '2024-04-21 23:05:42', 'A'),
(5, 'Objetos', 'Pantalla de los objetos', 'Pantalla', 'HARU', '2024-04-21 23:06:15', 'HARU', '2024-04-21 23:06:15', 'A'),
(6, 'Roles', 'Pantalla de roles', 'Pantalla', 'HARU', '2024-04-21 23:06:58', 'HARU', '2024-04-21 23:06:58', 'A'),
(7, 'Bitacora', 'Pantalla de la bitacora', 'Pantalla', 'HARU', '2024-04-21 23:07:38', 'HARU', '2024-04-21 23:07:38', 'A'),
(8, 'Backup', 'Pantalla para hacer el backup', 'Pantalla', 'HARU', '2024-04-21 23:08:21', 'HARU', '2024-04-21 23:08:21', 'A'),
(9, 'Llenar Formulario', 'Pantalla para llenar el formulario', 'Pantalla', 'HARU', '2024-04-21 23:11:07', 'HARU', '2024-04-21 23:11:07', 'A'),
(10, 'Ficha', 'Mantenimiento de fichas', 'Pantalla/Mantenimiento', 'HARU', '2024-04-21 23:13:04', 'HARU', '2024-04-21 23:13:04', 'A'),
(11, 'Datos Generales', 'Datos generales del agricultor', 'Pantalla', 'HARU', '2024-04-21 23:13:56', 'HARU', '2024-04-21 23:13:56', 'A'),
(12, 'Pertenencia a ORG', 'Pantalla para buscar los agricultores con organizacion', 'Pantalla', 'HARU', '2024-04-21 23:15:09', 'HARU', '2024-04-21 23:15:09', 'A'),
(13, 'Organizaciones Productor', 'Pantalla que muestras las organizaciones por productor', 'Pantalla', 'HARU', '2024-04-21 23:15:54', 'HARU', '2024-04-21 23:15:54', 'A'),
(14, 'Relevo Generacional', 'Pantalla que muestra los relevos que tiene un productor', 'Pantalla', 'HARU', '2024-04-21 23:16:50', 'HARU', '2024-04-21 23:16:50', 'A'),
(15, 'Ubicacion Greografica', 'Pantalla de la ubicacion del productor', 'Pantalla', 'HARU', '2024-04-21 23:17:42', 'HARU', '2024-04-21 23:17:42', 'A'),
(16, 'Composicion del hogar', 'pantalla de la Composicion del hogar', 'Pantalla', 'HARU', '2024-04-21 23:20:11', 'HARU', '2024-04-21 23:20:11', 'A'),
(17, 'Migracion familiar', 'pantalla sobre si hay migracion del productor', 'Pantalla', 'HARU', '2024-04-21 23:21:07', 'HARU', '2024-04-21 23:21:07', 'A'),
(18, 'Informacion Basica', 'pantalla de la informacion basica de la agricultura ', 'Pantalla', 'HARU', '2024-04-21 23:22:48', 'HARU', '2024-04-21 23:22:48', 'A'),
(19, 'Manejo de riego', 'Pantalla que muestra si el agricultor maneja de riego', 'Pantalla', 'HARU', '2024-04-21 23:24:17', 'HARU', '2024-04-21 23:24:17', 'A'),
(20, 'Produccion Agricola Año Anterior', 'Pantalla que muestra la Produccion Agricola del  Año Anterior', 'Pantalla', 'HARU', '2024-04-21 23:25:02', 'HARU', '2024-04-21 23:25:02', 'A'),
(21, 'Inventario', 'Pantalla que muestra el inventario del productor', 'Pantalla', 'HARU', '2024-04-21 23:27:50', 'HARU', '2024-04-21 23:27:50', 'A'),
(22, 'Produccion vendida', 'Pantalla que muestra la produccion que se vendio en el transcursos del año', 'Pantalla', 'HARU', '2024-04-21 23:28:39', 'HARU', '2024-04-21 23:28:39', 'A'),
(23, 'comercializacion', 'Pantalla que muestra la informcion de la comercializacion', 'Pantalla', 'HARU', '2024-04-21 23:30:09', 'HARU', '2024-04-21 23:30:09', 'A'),
(24, 'Otros ingresos', 'Pantalla que muestra los ingresos que genera el productor', 'Pantalla', 'HARU', '2024-04-21 23:32:30', 'HARU', '2024-04-21 23:32:30', 'A'),
(25, 'No Credito', 'Pantalla que muestra porque no tiene credito', 'Pantalla', 'HARU', '2024-04-21 23:40:53', 'HARU', '2024-04-21 23:40:53', 'A'),
(26, 'Credito', 'Pantalla que muestra los creditos que tiene el productor', 'Pantalla', 'HARU', '2024-04-21 23:41:34', 'HARU', '2024-04-21 23:41:34', 'A'),
(27, 'TRABEXT', 'Pantalla que muestra los trabajores externos que tiene el productor', 'Pantalla', 'HARU', '2024-04-21 23:42:37', 'HARU', '2024-04-21 23:42:37', 'A'),
(28, 'PAE', 'Pantalla de PAE', 'Pantalla', 'HARU', '2024-04-21 23:43:00', 'HARU', '2024-04-21 23:43:00', 'A'),
(29, 'Practicas para produccion', 'Pantalla que muestra las practicas que tiene el productor', 'Pantalla', 'HARU', '2024-04-21 23:43:53', 'HARU', '2024-04-21 23:43:53', 'A'),
(30, 'Tipos Apoyos', 'Pantalla que muestra los tipos de apoyos que tiene el productor', 'Pantalla', 'HARU', '2024-04-21 23:44:43', 'HARU', '2024-04-21 23:44:43', 'A'),
(31, 'Apoyo Productor', 'Pantalla que muestra los apoyos que recibe el productor', 'Pantalla', 'HARU', '2024-04-21 23:45:51', 'HARU', '2024-04-21 23:45:51', 'A'),
(32, 'Apoyos Externos', 'Pantallas que muestra los apoyos externos que tiene el productor', 'Pantalla', 'HARU', '2024-04-21 23:47:08', 'HARU', '2024-04-21 23:47:08', 'A'),
(33, 'Etnia', 'Etnias que existen', 'Pantalla', 'HARU', '2024-04-28 13:17:12', '', '2024-04-28 13:17:12', 'A'),
(34, 'Departamento', 'Mantenimiento donde esta cada departamento de HN', 'Pantalla', 'HARU', '2024-04-28 13:25:34', '', '2024-04-28 13:25:34', 'A'),
(35, 'Municipios', 'Los municipios de cada departamento', 'Pantalla', 'HARU', '2024-04-28 13:26:05', '', '2024-04-28 13:26:05', 'A'),
(36, 'Aldea', 'Aldea de los municipios', 'Pantalla', 'HARU', '2024-04-28 13:27:03', '', '2024-04-28 13:27:03', 'A'),
(37, 'Cacerios', 'son los cacerios de las aldeas', 'Pantalla', 'HARU', '2024-04-28 13:27:58', '', '2024-04-28 13:27:58', 'A'),
(38, 'Organizaciones', 'Son las organizaciones que existe', 'Pantalla', 'HARU', '2024-04-28 13:28:50', '', '2024-04-28 13:28:50', 'A'),
(39, 'Tipo de Organizacion', 'son los tipos de organizaciones', 'Pantalla', 'HARU', '2024-04-28 13:29:55', '', '2024-04-28 13:29:55', 'A'),
(40, 'Motivos Migracion', 'Son los motivos de migracion ', 'Pantalla', 'HARU', '2024-04-28 13:30:48', '', '2024-04-28 13:30:48', 'A'),
(41, 'Medidas', 'son las medidas que se pueden usar para diversos usos', 'Pantalla', 'HARU', '2024-04-28 13:31:31', '', '2024-04-28 13:31:31', 'A'),
(42, 'Riego', 'son los tipos de riegos que existen', 'Pantalla', 'HARU', '2024-04-28 13:31:56', '', '2024-04-28 13:31:56', 'A'),
(43, 'Cultivo', 'son los tipos de cultivos que se puede cultivar el productor', 'Pantalla', 'HARU', '2024-04-28 13:32:36', '', '2024-04-28 13:32:36', 'A'),
(44, 'Tipos pecuarios', 'Son los tipos de animales que se pueden meter', 'Pantalla', 'HARU', '2024-04-28 13:34:04', '', '2024-04-28 13:34:04', 'A'),
(45, 'Tipo de producción', 'Son los tipos de productos que el productor elabora', 'Pantalla', 'HARU', '2024-04-28 13:34:50', '', '2024-04-28 13:34:50', 'A'),
(46, 'Periodos', 'son los tiempos en periodos', 'Pantalla', 'HARU', '2024-04-28 13:40:50', '', '2024-04-28 13:40:50', 'A'),
(47, 'Negocio', 'Son los negocios que puede tener el productor', 'Pantalla', 'HARU', '2024-04-28 13:42:19', '', '2024-04-28 13:42:19', 'A'),
(48, 'Motivos no credito', 'son los motivos por el cual el productor no puede tener un credito', 'Pantalla', 'HARU', '2024-04-28 13:43:03', '', '2024-04-28 13:43:03', 'A'),
(49, 'Fuente de credito', 'son las fuentes de credito que le productor puede recibir', 'Pantalla', 'HARU', '2024-04-28 13:43:37', '', '2024-04-28 13:43:37', 'A'),
(50, 'Toma de desiciones ', 'es quien toma la decision de la finca', 'Pantalla', 'HARU', '2024-04-28 13:45:48', '', '2024-04-28 13:45:48', 'A'),
(51, 'Tipos de trabajadores', 'son los tipos de trabajadores que existen', 'Pantalla', 'HARU', '2024-04-28 13:47:09', '', '2024-04-28 13:47:09', 'A'),
(52, 'Practicas/Productivas', 'Pantalla que muestras las practicas que puede tener un productor', 'Pantalla', 'HARU', '2024-04-28 13:48:15', '', '2024-04-28 13:48:15', 'A'),
(53, 'Apoyo', 'pantalla que dice que apoyos puede tener un productor', 'Pantalla', 'HARU', '2024-04-28 13:48:50', '', '2024-04-28 13:48:50', 'A'),
(54, 'Tipos de apoyos', 'son los tipos de apoyos que puede recibir los productores', 'Pantalla', 'HARU', '2024-04-28 13:49:28', '', '2024-04-28 13:49:28', 'A'),
(55, 'ETNICIDAD', 'Pantalla donde muestra la informacion de la ETNICIDAD de los productores', 'Pantalla', 'HARU', '2024-04-28 23:10:16', '', '2024-04-28 23:10:16', 'A'),
(56, 'PRUEBA', 'SDA', 'Pantalla', 'HARU', '2024-05-02 07:31:57', '', '2024-05-02 07:31:57', 'A'),
(57, 'Siembra', 'Las tipos de siembras que puede tener un productor', 'Pantalla', 'HARU', '2024-05-02 19:55:16', '', '2024-05-02 19:55:16', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `Id_parametros` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `Parametro` varchar(255) NOT NULL,
  `Valor` varchar(255) NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`Id_parametros`, `id`, `Parametro`, `Valor`, `Fecha_Creacion`, `Fecha_Actualizacion`) VALUES
(2, 1, 'Intentos_Fallidos', '3', '2022-09-27 11:46:41', '2022-09-27 11:46:41'),
(3, 1, 'Admin_Preguntas', '2', '2022-10-18 03:11:00', NULL),
(4, 1, 'Vigencia_Usuario', '30', '2022-10-26 08:00:00', NULL),
(5, 1, 'Min_Contraseña', '5', '2022-10-26 08:00:00', NULL),
(6, 1, 'Max_Contraseña', '16', '2022-10-26 08:00:00', NULL),
(7, 1, 'Intentos_Preguntas', '3', '2022-10-26 08:00:00', NULL),
(8, 1, 'Min_Usuario', '5', '2022-10-26 19:00:00', NULL),
(12, 1, 'Max_Usuario', '15', '2022-11-22 06:39:05', NULL),
(13, 0, 'DSFSD', 'adasda', '2024-04-30 02:55:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permisos` bigint(20) NOT NULL,
  `Id_rol` bigint(20) NOT NULL,
  `permiso_eliminacion` int(11) NOT NULL,
  `id_objeto` int(10) NOT NULL,
  `permiso_actualizacion` int(11) NOT NULL,
  `permiso_insercion` int(11) NOT NULL,
  `permiso_consulta` int(11) DEFAULT NULL,
  `Actualizado_Por` varchar(255) NOT NULL,
  `Fecha_Actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permisos`, `Id_rol`, `permiso_eliminacion`, `id_objeto`, `permiso_actualizacion`, `permiso_insercion`, `permiso_consulta`, `Actualizado_Por`, `Fecha_Actualizacion`) VALUES
(1, 1, 1, 33, 1, 1, 1, 'HARU', '2024-04-28 13:20:44'),
(5, 1, 1, 35, 1, 1, NULL, 'HARU', '2024-04-28 15:21:51'),
(6, 1, 1, 36, 1, 1, NULL, 'HARU', '2024-04-28 15:21:51'),
(7, 1, 1, 38, 1, 1, NULL, 'HARU', '2024-04-28 15:21:51'),
(8, 1, 1, 2, 1, 1, NULL, 'HARU', '2024-04-28 23:01:51'),
(9, 1, 1, 5, 1, 1, NULL, 'HARU', '2024-04-28 23:09:34'),
(10, 1, 1, 4, 1, 1, NULL, 'HARU', '2024-04-28 20:33:51'),
(11, 1, 1, 3, 1, 1, NULL, 'HARU', '2024-04-28 22:14:03'),
(12, 18, 0, 33, 0, 0, 0, 'HARU', '2024-04-28 22:25:57'),
(13, 1, 1, 55, 1, 1, 1, 'HARU', '2024-05-02 06:03:10'),
(14, 1, 1, 16, 1, 1, 1, '0', '2024-05-02 12:22:46'),
(15, 1, 1, 34, 1, 1, 1, 'Hru', '2024-05-02 08:20:05'),
(16, 1, 1, 37, 1, 1, 1, 'HAru', '2024-05-02 08:34:18'),
(17, 1, 1, 39, 1, 1, 1, 'HAru', '2024-05-02 10:00:26'),
(18, 1, 1, 40, 1, 1, 1, 'HARU', '2024-05-02 10:17:41'),
(19, 1, 1, 41, 1, 1, 1, 'HAru', '2024-05-02 10:27:00'),
(23, 1, 1, 42, 1, 1, 1, 'HARU', '2024-05-02 16:20:45'),
(24, 1, 1, 43, 1, 1, 1, 'HARU', '2024-05-02 16:21:44'),
(25, 1, 1, 44, 1, 1, 1, 'HARU', '2024-05-02 16:23:12'),
(26, 1, 1, 45, 1, 1, 1, 'HARU', '2024-05-02 16:27:13'),
(27, 1, 1, 46, 1, 1, 1, 'HARU', '2024-05-02 16:39:24'),
(28, 1, 1, 47, 1, 1, 1, 'HARU', '2024-05-02 17:15:53'),
(29, 1, 1, 48, 1, 1, 1, 'HARU', '2024-05-02 17:25:11'),
(30, 1, 1, 49, 1, 1, 1, 'HARU', '2024-05-02 17:31:58'),
(31, 1, 1, 50, 1, 1, 1, 'HARU', '2024-05-02 19:36:58'),
(32, 1, 1, 52, 1, 1, 1, 'HARU', '2024-05-02 19:48:16'),
(33, 1, 1, 53, 1, 1, 1, 'HARU', '2024-05-02 19:54:25'),
(34, 1, 1, 54, 1, 1, 1, 'HARU', '2024-05-02 19:54:31'),
(35, 1, 1, 57, 1, 1, 1, 'HARU', '2024-05-02 19:55:29'),
(37, 1, 1, 10, 1, 1, 1, 'HARU', '2024-05-03 17:29:02'),
(39, 2, 1, 57, 1, 1, 1, 'HARU', '2024-05-05 23:21:26'),
(40, 27, 2, 33, 1, 2, 1, 'HARU', '2024-05-05 23:34:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `Id_pregunta` bigint(20) NOT NULL,
  `Pregunta` varchar(255) NOT NULL,
  `Creador_Por` varchar(40) NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT NULL,
  `Actualizado_Por` varchar(40) NOT NULL,
  `Fecha_Actualizacion` timestamp NULL DEFAULT NULL,
  `estado` enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`Id_pregunta`, `Pregunta`, `Creador_Por`, `Fecha_Creacion`, `Actualizado_Por`, `Fecha_Actualizacion`, `estado`) VALUES
(1, '¿Cuál es tu color favorito?', 'Haru', '2023-10-11 09:45:08', 'Haru', '2023-10-12 09:45:08', 'A'),
(2, '¿que equipo es tu favorito?', 'Haru', '2023-10-29 02:14:09', 'Haru', '2023-10-29 02:14:09', 'A'),
(6, '¿Comida Favorita?', 'HARU', '2024-04-28 20:49:50', 'HARU', '2024-04-28 20:55:23', 'A'),
(8, '¿Tu apodo de la infancia?', 'HARU', '2024-05-02 22:49:26', 'HARU', '2024-05-02 22:49:26', 'A');

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
(15, 1, 19, 'morado', '19', '2024-05-03 00:45:42', NULL, NULL),
(18, 6, 19, 'pizza', 'SIstem', '2024-05-03 09:16:58', NULL, NULL),
(19, 1, 19, 'azul', 'SIstem', '2024-05-03 09:17:06', NULL, NULL);

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
(2, 'NUEVO', 'Personal Nuevo', 1, '2023-10-29 05:42:09', 1, '2024-05-01 21:19:06', 'ACTIVO'),
(27, 'PRUEBA', 'Prueba de roles', 1, '2024-05-02 22:40:59', 1, '2024-05-02 22:40:59', 'ACTIVO');

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
  `Id_Departamento` bigint(20) NOT NULL,
  `Id_Municipio` bigint(20) NOT NULL,
  `Nombre_Aldea` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estado` enum('A','I') DEFAULT NULL,
  `Creado_Por` varchar(50) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(50) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_aldeas`
--

INSERT INTO `tbl_aldeas` (`Id_Aldea`, `Id_Departamento`, `Id_Municipio`, `Nombre_Aldea`, `Descripcion`, `Estado`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`) VALUES
(1, 1, 1, 'Pueblo Nuevo', 'Descripción de Pueblo Nuevo', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(2, 1, 1, 'La Unión', 'Descripción de La Unión', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(3, 1, 1, 'El Porvenir', 'Descripción de El Porvenir', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(4, 1, 1, 'La Masica', 'Descripción de La Masica', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(5, 1, 1, 'Esparta', 'Descripción de Esparta', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(6, 1, 2, 'El Porvenir', 'Descripción de El Porvenir', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(7, 1, 2, 'La Unión', 'Descripción de La Unión', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(8, 1, 2, 'Tela', 'Descripción de Tela', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(9, 1, 2, 'San Juan', 'Descripción de San Juan', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(10, 1, 2, 'La Ceibita', 'Descripción de La Ceibita', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(11, 1, 3, 'El Zapote', 'Descripción de El Zapote', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(12, 1, 3, 'La Libertad', 'Descripción de La Libertad', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(13, 1, 3, 'Los Horcones', 'Descripción de Los Horcones', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(14, 1, 3, 'Los Planes', 'Descripción de Los Planes', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(15, 1, 3, 'El Tamarindo', 'Descripción de El Tamarindo', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(16, 1, 4, 'Arizona', 'Descripción de Arizona', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(17, 1, 4, 'Choloma', 'Descripción de Choloma', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(18, 1, 4, 'La Masica', 'Descripción de La Masica', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(19, 1, 4, 'San Juan', 'Descripción de San Juan', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(20, 1, 4, 'La Ensenada', 'Descripción de La Ensenada', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(21, 1, 5, 'Arizona Centro', 'Descripción de Arizona Centro', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(22, 1, 5, 'El Triunfo', 'Descripción de El Triunfo', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(23, 1, 5, 'La Laguna', 'Descripción de La Laguna', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(24, 1, 5, 'Pimienta', 'Descripción de Pimienta', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(25, 1, 5, 'Valle de Ángeles', 'Descripción de Valle de Ángeles', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(26, 2, 6, 'Trujillo Centro', 'Descripción de Trujillo Centro', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(27, 2, 6, 'Barrio Inglés', 'Descripción de Barrio Inglés', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(28, 2, 6, 'Santa Fe', 'Descripción de Santa Fe', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(29, 2, 6, 'La Ceiba', 'Descripción de La Ceiba', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(30, 2, 6, 'Las Flores', 'Descripción de Las Flores', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(31, 2, 7, 'Tocoa Centro', 'Descripción de Tocoa Centro', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(32, 2, 7, 'El Paraíso', 'Descripción de El Paraíso', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(33, 2, 7, 'San Juan', 'Descripción de San Juan', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(34, 2, 7, 'Santa Teresa', 'Descripción de Santa Teresa', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(35, 2, 7, 'Saba', 'Descripción de Saba', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(36, 2, 8, 'Sonaguera Centro', 'Descripción de Sonaguera Centro', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(37, 2, 8, 'El Higueral', 'Descripción de El Higueral', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(38, 2, 8, 'San Jorge', 'Descripción de San Jorge', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(39, 2, 8, 'Las Mercedes', 'Descripción de Las Mercedes', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(40, 2, 8, 'La Unión', 'Descripción de La Unión', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(41, 2, 9, 'Iriona Centro', 'Descripción de Iriona Centro', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(42, 2, 9, 'Plan Grande', 'Descripción de Plan Grande', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(43, 2, 9, 'Santa María', 'Descripción de Santa María', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(44, 2, 9, 'Limón', 'Descripción de Limón', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(45, 2, 9, 'Trinidad', 'Descripción de Trinidad', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(46, 2, 10, 'Santa Fe Centro', 'Descripción de Santa Fe Centro', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(47, 2, 10, 'La Fe', 'Descripción de La Fe', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(48, 2, 10, 'El Pino', 'Descripción de El Pino', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(49, 2, 10, 'Santa Rosa', 'Descripción de Santa Rosa', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(50, 2, 10, 'La Esperanza', 'Descripción de La Esperanza', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(51, 3, 11, 'Barrio Guamilito', 'Descripción de Barrio Guamilito', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(52, 3, 11, 'Barrio Suyapa', 'Descripción de Barrio Suyapa', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(53, 3, 11, 'Barrio Cabañas', 'Descripción de Barrio Cabañas', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(54, 3, 11, 'Barrio Los Andes', 'Descripción de Barrio Los Andes', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(55, 3, 11, 'Barrio Barandillas', 'Descripción de Barrio Barandillas', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(56, 3, 12, 'Barrio El Porvenir', 'Descripción de Barrio El Porvenir', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(57, 3, 12, 'Barrio La Antorcha', 'Descripción de Barrio La Antorcha', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(58, 3, 12, 'Barrio La Guadalupe', 'Descripción de Barrio La Guadalupe', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(59, 3, 12, 'Barrio Las Mercedes', 'Descripción de Barrio Las Mercedes', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(60, 3, 12, 'Barrio Las Palmas', 'Descripción de Barrio Las Palmas', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(61, 3, 13, 'Barrio El Centro', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(62, 3, 13, 'Barrio El Edén', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(63, 3, 13, 'Barrio La Planeta', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(64, 3, 13, 'Barrio El Paraíso', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(65, 3, 13, 'Barrio La Esperanza', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 02:01:38', NULL, '2024-04-25 02:01:38'),
(66, 3, 14, 'Agua Salada', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(67, 3, 14, 'Cantoral', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(68, 3, 14, 'Comayagua', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(69, 3, 14, 'El Ciruelo', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(70, 3, 14, 'Cacahuapa', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(71, 3, 15, 'Flores', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(72, 3, 15, 'Las Botijas', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(73, 3, 15, 'Los Cimientos', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(74, 3, 15, 'Potrero Granda', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(75, 3, 15, 'Protección', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(76, 4, 16, 'Calzontes', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(77, 4, 16, 'El Callejón', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(78, 4, 16, 'Oromilaca', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(79, 4, 16, 'Quezailica', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(80, 4, 16, 'Santa Rosa de Copán', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(81, 4, 17, 'Agua Buena', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(82, 4, 17, 'Buenos Aires', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(83, 4, 17, 'La Unión', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(84, 4, 17, 'Los Pozos', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(85, 4, 17, 'Quebrada Seca', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(86, 4, 18, 'Barbasqueadero', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(87, 4, 18, 'Agua Caliente', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(88, 4, 18, 'Agua Buena Arriba', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(89, 4, 18, 'Carrizalón', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(90, 4, 18, 'Boca del Monte', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(91, 4, 19, 'Capucas', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(92, 4, 19, 'Jimilile', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(93, 4, 19, 'Gualme', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(94, 4, 19, 'Corquín', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(95, 4, 19, 'El Carrizal', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(96, 4, 20, 'La Cebratana', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(97, 4, 20, 'La Laguna Negra', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(98, 4, 20, 'La Majada', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(99, 4, 20, 'Las Sandías', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(100, 4, 20, 'Los Pozos', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(101, 5, 21, 'Artemisales', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(102, 5, 21, 'Bañaderos o Guadalupe', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(103, 5, 21, 'Berlín', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(104, 5, 21, 'Buena Vista', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(105, 5, 21, 'Chotepe', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 02:49:34', NULL, '2024-04-25 02:49:34'),
(106, 5, 22, 'Bajamar', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(107, 5, 22, 'Baracoa', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(108, 5, 22, 'Barra de Chamelecón', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(109, 5, 22, 'Calán', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(110, 5, 22, 'Chameleconcito', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(111, 5, 23, 'Banderas', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(112, 5, 23, 'Choloma', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(113, 5, 23, 'El Chorrerón', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(114, 5, 23, 'El Guanacaste', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(115, 5, 23, 'El Higuero', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(116, 5, 24, 'Calán Alto', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(117, 5, 24, 'Campo Dos Caminos', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(118, 5, 24, 'El Cuábano', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(119, 5, 24, 'El Marañó', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(120, 5, 24, 'El Milagro', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(121, 5, 25, 'La Lima', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(122, 5, 25, 'Cruz de Valencia', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(123, 5, 25, 'El Paraíso', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(124, 5, 25, 'Flor de Oriente', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(125, 5, 25, 'Flor de Oriente', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(126, 6, 26, 'Agua Caliente de Linaca', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(127, 6, 26, 'Choluteca', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(128, 6, 26, 'Copal Abajo', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(129, 6, 26, 'Copal Arriba', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(130, 6, 26, 'El Carrizo', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(131, 6, 27, 'Concepción El Brasilar', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(132, 6, 27, 'San Juan Bosco', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(133, 6, 27, 'San Antonio de Papua', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(134, 6, 27, 'La Ermita, Marilica', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(135, 6, 27, 'El Espinal', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(136, 6, 28, 'San Marcos de Colón', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(137, 6, 28, 'Cacamuya', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(138, 6, 28, 'Caire', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(139, 6, 28, 'Comalí', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(140, 6, 28, 'El Ojo de Agua', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(141, 6, 29, 'El Polvo', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(142, 6, 29, 'El Tular', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(143, 6, 29, 'El Chilcal', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(144, 6, 29, 'Paso de Vela', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(145, 6, 29, 'Buena Fe', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(146, 6, 30, 'Marcovia ', 'Descripción de Barrio El Centro', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(147, 6, 30, 'Cedeño', 'Descripción de Barrio El Edén', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(148, 6, 30, 'Colonia Buena Vista', 'Descripción de Barrio La Planeta', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(149, 6, 30, 'El Botadero', 'Descripción de Barrio El Paraíso', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(150, 6, 30, 'El Obraje', 'Descripción de Barrio La Esperanza', 'A', 'Admin', '2024-04-25 05:07:24', NULL, '2024-04-25 05:07:24'),
(151, 22, 91, 'AldeaActiva', 'AldeaActiva', 'A', 'HARU', '2024-04-26 01:28:09', NULL, '2024-04-26 01:28:09'),
(152, 23, 91, 'AldeaInactiva', 'AldeaInactiva', 'I', 'HARU', '2024-04-26 01:28:58', 'HARU', '2024-05-02 08:32:18');

--
-- Disparadores `tbl_aldeas`
--
DELIMITER $$
CREATE TRIGGER `DeleteAldeas` AFTER DELETE ON `tbl_aldeas` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: Id_Aldea = ', OLD.Id_Aldea, ', Id_Departamento = ', OLD.Id_Departamento, ', Id_Municipio = ', OLD.Id_Municipio, ', Nombre_Aldea = ', OLD.Nombre_Aldea, ', Descripcion = ', OLD.Descripcion, ', Estado = ', OLD.Estado), 'tbl_aldeas');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertAldeas` AFTER INSERT ON `tbl_aldeas` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: Id_Aldea = ', NEW.Id_Aldea, ', Id_Departamento = ', NEW.Id_Departamento, ', Id_Municipio = ', NEW.Id_Municipio, ', Nombre_Aldea = ', NEW.Nombre_Aldea, ', Descripcion = ', NEW.Descripcion, ', Estado = ', NEW.Estado), 'tbl_aldeas');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateAldeas` AFTER UPDATE ON `tbl_aldeas` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: Id_Aldea = ', OLD.Id_Aldea, ', Id_Departamento = ', OLD.Id_Departamento, ', Id_Municipio = ', OLD.Id_Municipio, ', Nombre_Aldea = ', OLD.Nombre_Aldea, ', Descripcion = ', OLD.Descripcion, ', Estado = ', OLD.Estado), 
                    CONCAT('Información actualizada: Id_Aldea = ', NEW.Id_Aldea, ', Id_Departamento = ', NEW.Id_Departamento, ', Id_Municipio = ', NEW.Id_Municipio, ', Nombre_Aldea = ', NEW.Nombre_Aldea, ', Descripcion = ', NEW.Descripcion, ', Estado = ', NEW.Estado), 
                    'tbl_aldeas'
                );
            END
$$
DELIMITER ;

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
(1, 'Gobierno', 'Ayuda que da el gobierno', NULL, '2024-04-25 20:17:17', NULL, '2024-04-25 20:17:17', 'ACTIVO'),
(2, 'ONG', 'Organismo internacional', 'Daniela', '2024-05-05 06:21:14', 'HARU', '2024-05-05 06:21:14', 'ACTIVO'),
(3, 'Amigo', 'Ayuda de un amigo', 'HAru', '2024-04-25 20:18:02', 'Haru', '2024-04-25 20:18:02', 'ACTIVO'),
(4, 'Cooperativa', 'Ayuda de alguna cooperativa', 'Haru', '2024-04-25 20:19:00', 'Haru', '2024-04-25 20:19:00', 'ACTIVO'),
(5, 'APActiva', 'APActiva', 'Daniela', '2024-04-26 01:50:54', 'Daniela', '2024-04-26 01:50:54', 'ACTIVO'),
(6, 'APInactiva', 'APInactiva', 'Daniela', '2024-05-02 22:19:02', 'HARU', '2024-05-02 22:19:02', 'INACTIVO');

--
-- Disparadores `tbl_apoyos`
--
DELIMITER $$
CREATE TRIGGER `DeleteApoyos` AFTER DELETE ON `tbl_apoyos` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_apoyo_produccion = ', OLD.id_apoyo_produccion, ', tipo_apoyo_produccion = ', OLD.tipo_apoyo_produccion, ', descripcion = ', OLD.descripcion), 'tbl_apoyos');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertApoyos` AFTER INSERT ON `tbl_apoyos` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_apoyo_produccion = ', NEW.id_apoyo_produccion, ', tipo_apoyo_produccion = ', NEW.tipo_apoyo_produccion, ', descripcion = ', NEW.descripcion), 'tbl_apoyos');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateApoyos` AFTER UPDATE ON `tbl_apoyos` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_apoyo_produccion = ', OLD.id_apoyo_produccion, ', tipo_apoyo_produccion = ', OLD.tipo_apoyo_produccion, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_apoyo_produccion = ', NEW.id_apoyo_produccion, ', tipo_apoyo_produccion = ', NEW.tipo_apoyo_produccion, ', descripcion = ', NEW.descripcion), 
                    'tbl_apoyos'
                );
            END
$$
DELIMITER ;

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
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_apoyos_produccion`
--

INSERT INTO `tbl_apoyos_produccion` (`id_apoyo_prod`, `id_ficha`, `id_productor`, `id_apoyo_produccion`, `otros_detalles`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(61, 2, 9, 5, NULL, NULL, 'HARU', '2024-05-06 02:29:10', NULL, '2024-05-06 02:29:10', 'A'),
(62, 1, 8, 5, NULL, NULL, 'HARU', '2024-05-07 04:03:31', NULL, '2024-05-07 04:03:31', 'A');

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
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_apoyo_actividad_externa`
--

INSERT INTO `tbl_apoyo_actividad_externa` (`id_apoyo_ext`, `id_ficha`, `id_productor`, `recibe_apoyo_prodagrícola`, `atencion_por_UAG`, `productos_vendidospor_pralesc`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(14, 1, 8, 'S', 'S', 'S', NULL, 'HARU', '2024-05-06 02:25:05', 'HARU', '2024-05-07 04:03:31', 'A'),
(15, 2, 9, 'S', 'S', 'S', NULL, 'HARU', '2024-05-06 02:25:05', 'HARU', '2024-05-06 02:29:10', 'A'),
(16, 5, 12, 'N', 'N', 'N', NULL, 'HARU', '2024-05-07 04:00:41', NULL, '2024-05-07 04:00:41', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_apoyo_tipo_organizacion`
--

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

--
-- Volcado de datos para la tabla `tbl_apoyo_tipo_organizacion`
--

INSERT INTO `tbl_apoyo_tipo_organizacion` (`id_ficha`, `id_productor`, `id_tipo_organizacion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(2, 9, 17, 'HARU', '2024-05-05 20:29:10', NULL, NULL, 'A'),
(1, 8, 17, 'HARU', '2024-05-06 22:03:31', NULL, NULL, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_base_organizacion`
--

CREATE TABLE `tbl_base_organizacion` (
  `id_pertenece_organizacion` bigint(20) NOT NULL,
  `id_ficha` bigint(20) NOT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `pertenece_a_organizacion` enum('S','N') DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_base_organizacion`
--

INSERT INTO `tbl_base_organizacion` (`id_pertenece_organizacion`, `id_ficha`, `id_productor`, `pertenece_a_organizacion`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(15, 1, 8, 'S', NULL, 'HARU', '2024-05-06 02:18:41', 'HARU', '2024-05-07 04:01:18', 'A'),
(16, 2, 9, 'S', NULL, 'HARU', '2024-05-06 02:18:41', 'HARU', '2024-05-06 02:27:45', 'A'),
(17, 5, 12, 'N', NULL, 'HARU', '2024-05-07 03:56:32', NULL, '2024-05-07 03:56:32', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cacerios`
--

CREATE TABLE `tbl_cacerios` (
  `Id_Cacerio` bigint(20) NOT NULL,
  `Id_Aldea` bigint(20) NOT NULL,
  `Id_Municipio` bigint(20) NOT NULL,
  `Id_Departamento` bigint(20) NOT NULL,
  `Nombre_Cacerio` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estado` enum('A','I') DEFAULT NULL,
  `Creado_Por` varchar(25) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Modificado_Por` varchar(25) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_cacerios`
--

INSERT INTO `tbl_cacerios` (`Id_Cacerio`, `Id_Aldea`, `Id_Municipio`, `Id_Departamento`, `Nombre_Cacerio`, `Descripcion`, `Estado`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`) VALUES
(1, 1, 1, 1, 'El Trapiche', 'Descripción de El Trapiche', 'A', 'Admin', '2024-04-25 05:15:03', NULL, '2024-04-25 05:15:03'),
(2, 2, 1, 1, 'La Laguneta', 'Descripción de La Laguneta', 'A', 'Admin', '2024-04-25 05:15:03', NULL, '2024-04-25 05:15:03'),
(3, 26, 6, 2, 'Caserío de Trujillo 1', 'Caserío de Trujillo 1', 'A', 'Haru', '2024-04-25 05:19:25', 'Haru', '2024-04-25 05:19:25'),
(4, 27, 6, 2, 'Caserío de Trujillo 2', 'Caserío de Trujillo 2', 'A', 'Haru', '2024-04-25 05:19:25', 'Haru', '2024-04-25 05:19:25'),
(5, 51, 11, 3, 'Col. INCEHSA', 'Col. INCEHSA', 'A', 'Haru', '2024-04-26 00:20:54', 'Haru', '2024-04-25 05:28:17'),
(6, 51, 11, 3, 'Bo. La Zarcita', 'Bo. La Zarcita', 'A', 'Haru', '2024-04-25 05:28:17', 'Haru', '2024-04-25 05:28:17'),
(9, 151, 91, 22, 'CaceriosActivo', 'CaceriosActivo', 'A', 'HARU', '2024-05-06 02:02:44', NULL, '2024-05-06 02:02:44'),
(10, 151, 91, 22, 'CaceriosInactivo', 'CaceriosInactivo', 'I', 'HARU', '2024-05-06 02:04:54', 'HARU', '2024-05-06 02:04:54');

--
-- Disparadores `tbl_cacerios`
--
DELIMITER $$
CREATE TRIGGER `DeleteCacerios` AFTER DELETE ON `tbl_cacerios` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: Id_Cacerio = ', OLD.Id_Cacerio, ', Id_Aldea = ', OLD.Id_Aldea, ', Id_Municipio = ', OLD.Id_Municipio, ', Id_Departamento = ', OLD.Id_Departamento, ', Nombre_Cacerio = ', OLD.Nombre_Cacerio, ', Descripcion = ', OLD.Descripcion), 'tbl_cacerios');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertCacerios` AFTER INSERT ON `tbl_cacerios` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: Id_Cacerio = ', NEW.Id_Cacerio, ', Id_Aldea = ', NEW.Id_Aldea, ', Id_Municipio = ', NEW.Id_Municipio, ', Id_Departamento = ', NEW.Id_Departamento, ', Nombre_Cacerio = ', NEW.Nombre_Cacerio, ', Descripcion = ', NEW.Descripcion), 'tbl_cacerios');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateCacerios` AFTER UPDATE ON `tbl_cacerios` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: Id_Cacerio = ', OLD.Id_Cacerio, ', Id_Aldea = ', OLD.Id_Aldea, ', Id_Municipio = ', OLD.Id_Municipio, ', Id_Departamento = ', OLD.Id_Departamento, ', Nombre_Cacerio = ', OLD.Nombre_Cacerio, ', Descripcion = ', OLD.Descripcion), 
                    CONCAT('Información actualizada: Id_Cacerio = ', NEW.Id_Cacerio, ', Id_Aldea = ', NEW.Id_Aldea, ', Id_Municipio = ', NEW.Id_Municipio, ', Id_Departamento = ', NEW.Id_Departamento, ', Nombre_Cacerio = ', NEW.Nombre_Cacerio, ', Descripcion = ', NEW.Descripcion), 
                    'tbl_cacerios'
                );
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_composicion`
--

CREATE TABLE `tbl_composicion` (
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_composicion` bigint(20) NOT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `genero` enum('Hombre','Mujer') DEFAULT NULL,
  `edad` varchar(10) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `creado_por` varchar(25) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(25) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_composicion`
--

INSERT INTO `tbl_composicion` (`id_ficha`, `id_composicion`, `id_productor`, `genero`, `edad`, `cantidad`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(2, 74, 9, 'Hombre', '41-50', 1, 'HARU', '2024-05-06 02:27:53', NULL, '2024-05-06 02:27:53', 'A'),
(2, 75, 9, 'Hombre', '11-20', 1, 'HARU', '2024-05-06 02:27:53', NULL, '2024-05-06 02:27:53', 'A'),
(2, 76, 9, 'Mujer', '0-10', 1, 'HARU', '2024-05-06 02:27:53', NULL, '2024-05-06 02:27:53', 'A'),
(1, 77, 8, 'Hombre', '41-50', 1, 'HARU', '2024-05-07 04:01:24', NULL, '2024-05-07 04:01:24', 'A'),
(1, 78, 8, 'Hombre', '11-20', 1, 'HARU', '2024-05-07 04:01:24', NULL, '2024-05-07 04:01:24', 'A'),
(1, 79, 8, 'Mujer', '0-10', 1, 'HARU', '2024-05-07 04:01:24', NULL, '2024-05-07 04:01:24', 'A');

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
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_credito_produccion`
--

INSERT INTO `tbl_credito_produccion` (`id_credpro`, `id_ficha`, `id_productor`, `ha_solicitado_creditos`, `id_fuente_credito`, `monto_credito`, `id_motivos_no_credito`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(70, 2, 9, 'S', 10, NULL, NULL, NULL, 'HARU', '2024-05-06 02:28:51', NULL, '2024-05-06 02:28:51', 'A'),
(71, 1, 8, 'S', 10, NULL, NULL, NULL, 'HARU', '2024-05-07 04:02:40', NULL, '2024-05-07 04:02:40', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_departamentos`
--

CREATE TABLE `tbl_departamentos` (
  `Id_Departamento` bigint(20) NOT NULL,
  `Nombre_Departamento` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Creado_Por` varchar(25) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(25) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_departamentos`
--

INSERT INTO `tbl_departamentos` (`Id_Departamento`, `Nombre_Departamento`, `Descripcion`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `Estado`) VALUES
(1, 'Atlántida', 'Departamento en la costa norte de Honduras', 'Admin', '2024-04-25 00:00:26', 'HARU', '2024-05-02 21:41:20', 'A'),
(2, 'Colón', 'Departamento en la costa norte de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(3, 'Comayagua', 'Departamento en la región central de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(4, 'Copán', 'Departamento en el occidente de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(5, 'Cortés', 'Departamento en la costa norte de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(6, 'Choluteca', 'Departamento en el sur de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(7, 'El Paraíso', 'Departamento en el oriente de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(8, 'Francisco Morazán', 'Departamento en la región central de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(9, 'Gracias a Dios', 'Departamento en el oriente de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(10, 'Intibucá', 'Departamento en el occidente de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(11, 'Islas de la Bahía', 'Departamento en el norte de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(12, 'La Paz', 'Departamento en la región central de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(13, 'Lempira', 'Departamento en el occidente de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(14, 'Ocotepeque', 'Departamento en el occidente de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(15, 'Olancho', 'Departamento en el oriente de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(16, 'Santa Bárbara', 'Departamento en el occidente de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(17, 'Valle', 'Departamento en el sur de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(18, 'Yoro', 'Departamento en el norte de Honduras', 'Admin', '2024-04-25 00:00:26', NULL, '2024-04-25 00:00:26', 'A'),
(22, 'DepartamentoACtivo', 'Activo', 'HARU', '2024-04-26 01:20:13', NULL, '2024-04-26 01:20:13', 'A'),
(23, 'DepartamentoInactivo', 'Inactivo', 'HARU', '2024-04-26 01:20:54', 'HARU', '2024-04-26 01:21:04', 'I');

--
-- Disparadores `tbl_departamentos`
--
DELIMITER $$
CREATE TRIGGER `DeleteDepartamentos` AFTER DELETE ON `tbl_departamentos` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: Id_Departamento = ', OLD.Id_Departamento, ', Nombre_Departamento = ', OLD.Nombre_Departamento, ', Descripcion = ', OLD.Descripcion), 'tbl_departamentos');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertDepartamentos` AFTER INSERT ON `tbl_departamentos` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: Id_Departamento = ', NEW.Id_Departamento, ', Nombre_Departamento = ', NEW.Nombre_Departamento, ', Descripcion = ', NEW.Descripcion), 'tbl_departamentos');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateDepartamentos` AFTER UPDATE ON `tbl_departamentos` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: Id_Departamento = ', OLD.Id_Departamento, ', Nombre_Departamento = ', OLD.Nombre_Departamento, ', Descripcion = ', OLD.Descripcion), 
                    CONCAT('Información actualizada: Id_Departamento = ', NEW.Id_Departamento, ', Nombre_Departamento = ', NEW.Nombre_Departamento, ', Descripcion = ', NEW.Descripcion), 
                    'tbl_departamentos'
                );
            END
$$
DELIMITER ;

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
  `estado` enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_etnias`
--

INSERT INTO `tbl_etnias` (`id_etnia`, `etnia`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Lenca', 'Prueba', 'Usuario1', '2023-12-11 20:37:01', 'Usuario1', '2023-12-11 20:37:01', 'A'),
(2, 'Pech', 'Descripción de Etnia 2', 'Usuario2', '2023-12-11 20:40:44', 'Usuario2', '2023-12-11 20:40:44', 'A'),
(3, 'Tolupanes', 'Descripción de Etnia 3', 'Usuario3', '2023-12-11 20:41:13', 'Usuario3', '2023-12-11 20:41:13', 'A'),
(4, 'Garífunas', 'Descripción de Etnia 4', 'Usuario4', '2023-12-11 20:38:19', 'Usuario4', '2023-12-11 20:38:19', 'A'),
(5, 'Maya Chortís', 'Descripción de Etnia 5', 'Usuario5', '2023-12-11 20:41:19', 'Usuario5', '2023-12-11 20:41:19', 'A'),
(6, 'Tawahkas', 'Descripción de Etnia 6', 'Usuario6', '2023-12-11 20:38:42', 'Usuario6', '2023-12-11 20:38:42', 'A'),
(7, 'Misquitos', 'Descripción de Etnia 7', 'Usuario7', '2023-12-11 20:38:52', 'Usuario7', '2023-12-11 20:38:52', 'A'),
(8, 'Nahua', 'Descripción de Etnia 8', 'Usuario8', '2023-12-11 20:41:25', 'Usuario8', '2023-12-11 20:41:25', 'A'),
(9, 'Ladino', 'Descripción de Etnia 9', 'Usuario9', '2023-12-11 20:39:08', 'Usuario9', '2023-12-11 20:39:08', 'A'),
(10, 'Negro habla inglesa', 'Descripción de Etnia 10', 'Usuario10', '2023-12-11 20:41:33', 'Usuario10', '2023-12-11 20:41:33', 'A'),
(11, 'Otros(Especifique)', 'Descripción de Etnia 11', 'Usuario11', '2024-05-05 05:01:10', 'HARU', '2024-05-05 05:01:10', 'I'),
(19, 'EtniaActiva', 'EtniaActiva', 'HARU', '2024-05-06 02:01:09', NULL, '2024-05-06 02:01:09', 'A'),
(20, 'EtniaInactiva', 'EtniaInactiva', 'HARU', '2024-05-06 02:01:45', NULL, '2024-05-06 02:01:45', 'A');

--
-- Disparadores `tbl_etnias`
--
DELIMITER $$
CREATE TRIGGER `DeleteEtnias` AFTER DELETE ON `tbl_etnias` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_etnia = ', OLD.id_etnia, ', etnia = ', OLD.etnia, ', descripcion = ', OLD.descripcion), 'tbl_etnias');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertEtnias` AFTER INSERT ON `tbl_etnias` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_etnia = ', NEW.id_etnia, ', etnia = ', NEW.etnia, ', descripcion = ', NEW.descripcion), 'tbl_etnias');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateEtnias` AFTER UPDATE ON `tbl_etnias` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_etnia = ', OLD.id_etnia, ', etnia = ', OLD.etnia, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_etnia = ', NEW.id_etnia, ', etnia = ', NEW.etnia, ', descripcion = ', NEW.descripcion), 
                    'tbl_etnias'
                );
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_etnias_por_productor`
--

CREATE TABLE `tbl_etnias_por_productor` (
  `Id_etnicidad` bigint(11) NOT NULL,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_etnia` bigint(20) NOT NULL,
  `detalle_de_otros` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_etnias_por_productor`
--

INSERT INTO `tbl_etnias_por_productor` (`Id_etnicidad`, `id_ficha`, `id_productor`, `id_etnia`, `detalle_de_otros`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(15, 1, 8, 1, '', NULL, 'HARU', '2024-05-06 02:20:09', 'HARU', '2024-05-07 04:01:32', 'A'),
(16, 2, 9, 1, '', NULL, 'HARU', '2024-05-06 02:20:09', 'HARU', '2024-05-06 02:27:56', 'A');

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
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_fuentes_credito`
--

INSERT INTO `tbl_fuentes_credito` (`id_fuente_credito`, `fuente_credito`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Banca', 'Bancos', 'usuario1', '2024-05-05 06:20:27', 'HARU', '2024-05-05 06:20:27', 'A'),
(2, 'Amigos', 'Amigos cercanos', 'usuario1', '2024-05-05 06:20:31', 'HARU', '2024-05-05 06:20:31', 'A'),
(3, 'Familia', 'Familiares', 'usuario1', '2024-05-05 06:20:37', 'HARU', '2024-05-05 06:20:37', 'A'),
(4, 'Cooperativa', 'Cooperativas', 'usuario1', '2024-05-05 06:20:42', 'HARU', '2024-05-05 06:20:42', 'A'),
(5, 'Prestamistas', 'Prestamistas', 'usuario1', '2024-05-02 17:53:19', 'HARU', '2024-05-02 17:53:19', 'A'),
(6, 'Microfinanciera', 'Microfinanciera', 'usuario1', '2024-05-02 17:53:14', 'HARU', '2024-05-02 17:53:14', 'A'),
(7, 'Fuente de credito', 'Fuente de credito', 'usuario1', '2024-04-27 03:21:19', 'usuario1', '2024-04-27 03:21:19', 'A'),
(10, 'FuenteCreActiva', 'FuenteCreActiva', 'HARU', '2024-05-06 02:12:36', NULL, '2024-05-06 02:12:36', 'A'),
(11, 'FuenteCreInactivas', 'FuenteCreInactivas', 'HARU', '2024-05-06 02:12:51', 'HARU', '2024-05-06 02:12:51', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ingreso_familiar`
--

CREATE TABLE `tbl_ingreso_familiar` (
  `Id_Ficha` bigint(20) DEFAULT NULL,
  `Id_Productor` bigint(20) DEFAULT NULL,
  `Id_Ingreso_Familiar` bigint(20) NOT NULL,
  `Id_Tipo_Negocio` bigint(20) DEFAULT NULL,
  `Total_Ingreso` decimal(10,2) DEFAULT NULL,
  `Id_Periodo_Ingreso` bigint(20) DEFAULT NULL,
  `Descripcion_Otros` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Creado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_ingreso_familiar`
--

INSERT INTO `tbl_ingreso_familiar` (`Id_Ficha`, `Id_Productor`, `Id_Ingreso_Familiar`, `Id_Tipo_Negocio`, `Total_Ingreso`, `Id_Periodo_Ingreso`, `Descripcion_Otros`, `Descripcion`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `estado`) VALUES
(2, 9, 70, 17, 1.00, NULL, NULL, NULL, 'HARU', '2024-05-06 02:28:47', 'HARU', '2024-05-06 02:28:47', 'A'),
(1, 8, 71, 17, 1.00, NULL, NULL, NULL, 'HARU', '2024-05-07 04:02:31', 'HARU', '2024-05-07 04:02:31', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_manejo_riego`
--

CREATE TABLE `tbl_manejo_riego` (
  `Id_Manejo_Riego` bigint(20) NOT NULL,
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
  `Estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_manejo_riego`
--

INSERT INTO `tbl_manejo_riego` (`Id_Manejo_Riego`, `Id_Ficha`, `Id_Ubicacion`, `Id_Productor`, `Tiene_Riego`, `Superficie_Riego`, `Id_Medida_Superficie_Riego`, `Id_Tipo_Riego`, `Fuente_Agua`, `Disponibilidad_Agua_Meses`, `Descripcion`, `Id_Usuario`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `Estado`) VALUES
(14, 1, 14, 8, 'S', 100.00, 21, 6, 'prueba', 12, NULL, NULL, 'HARU', '2024-05-06 02:21:59', NULL, '2024-05-06 02:21:59', 'A'),
(15, 2, 15, 9, 'S', 100.00, 21, 6, 'prueba', 12, NULL, NULL, 'HARU', '2024-05-06 02:21:59', NULL, '2024-05-06 02:21:59', 'A');

--
-- Disparadores `tbl_manejo_riego`
--
DELIMITER $$
CREATE TRIGGER `DeleteManejoRiego` AFTER DELETE ON `tbl_manejo_riego` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: Id_Manejo_Riego = ', OLD.Id_Manejo_Riego, ', Id_Ficha = ', OLD.Id_Ficha, ', Id_Ubicacion = ', OLD.Id_Ubicacion, ', Id_Productor = ', OLD.Id_Productor, ', Tiene_Riego = ', OLD.Tiene_Riego, ', Superficie_Riego = ', OLD.Superficie_Riego), 'tbl_manejo_riego');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertManejoRiego` AFTER INSERT ON `tbl_manejo_riego` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: Id_Manejo_Riego = ', NEW.Id_Manejo_Riego, ', Id_Ficha = ', NEW.Id_Ficha, ', Id_Ubicacion = ', NEW.Id_Ubicacion, ', Id_Productor = ', NEW.Id_Productor, ', Tiene_Riego = ', NEW.Tiene_Riego, ', Superficie_Riego = ', NEW.Superficie_Riego), 'tbl_manejo_riego');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateManejoRiego` AFTER UPDATE ON `tbl_manejo_riego` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: Id_Manejo_Riego = ', OLD.Id_Manejo_Riego, ', Id_Ficha = ', OLD.Id_Ficha, ', Id_Ubicacion = ', OLD.Id_Ubicacion, ', Id_Productor = ', OLD.Id_Productor, ', Tiene_Riego = ', OLD.Tiene_Riego, ', Superficie_Riego = ', OLD.Superficie_Riego), 
                    CONCAT('Información actualizada: Id_Manejo_Riego = ', NEW.Id_Manejo_Riego, ', Id_Ficha = ', NEW.Id_Ficha, ', Id_Ubicacion = ', NEW.Id_Ubicacion, ', Id_Productor = ', NEW.Id_Productor, ', Tiene_Riego = ', NEW.Tiene_Riego, ', Superficie_Riego = ', NEW.Superficie_Riego), 
                    'tbl_manejo_riego'
                );
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_medidas_tierra`
--

CREATE TABLE `tbl_medidas_tierra` (
  `id_medida` bigint(20) NOT NULL,
  `medida` varchar(25) DEFAULT NULL,
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
(1, 'TAREAS', 'Son 5 tareas', 'HARU', '2024-05-02 21:54:19', 'HARU', '2024-05-02 21:54:19', 'ACTIVO'),
(2, 'HA', 'Se compraron 2', 'Daniela', '2024-02-26 03:52:35', 'Daniela', '2024-02-26 03:52:35', 'ACTIVO'),
(3, 'MZ', 'desc', 'Daniela', '2023-12-11 01:56:55', 'Daniela', '2023-12-11 01:56:55', 'ACTIVO'),
(4, 'CM', 'CM (Centimetro)', 'manu', '2023-12-11 01:57:01', 'manu', '2023-12-11 01:57:01', 'ACTIVO'),
(5, 'Oz (onza)', 'Oz (onza)', 'Daniela', '2024-04-25 21:03:54', 'Daniela', '2024-04-25 21:03:54', 'ACTIVO'),
(6, 'Kg (kilogramo)', 'Kg (kilogramo)', 'Daniela', '2024-04-25 21:03:58', 'Daniela', '2024-04-25 21:03:58', 'ACTIVO'),
(7, 'Lb (Libra)', 'Lb (Libra)', 'Daniela', '2024-04-25 21:04:02', 'Daniela', '2024-04-25 21:04:02', 'ACTIVO'),
(8, 'KM (Kilómetro)', 'KM (Kilómetro)', 'Daniela', '2024-04-25 21:04:05', 'Daniela', '2024-04-25 21:04:05', 'ACTIVO'),
(9, 'L (Litro)', 'L (Litro)', 'Daniela', '2024-04-25 21:04:10', 'Daniela', '2024-04-25 21:04:10', 'ACTIVO'),
(10, 'Milla (MI)', 'Milla (MI)', 'Daniela', '2024-04-25 21:04:13', 'Daniela', '2024-04-25 21:04:13', 'ACTIVO'),
(11, 'Saco', 'Saco', 'Daniela', '2024-04-25 21:04:16', 'Daniela', '2024-04-25 21:04:16', 'ACTIVO'),
(12, 'Botella', 'Botella', 'Daniela', '2024-04-25 21:04:19', 'Daniela', '2024-04-25 21:04:19', 'ACTIVO'),
(13, 'semanal', 'semanal', 'Haru', '2024-04-25 21:04:28', 'Haru', '2024-04-25 21:04:28', 'ACTIVO'),
(14, 'mensual', 'mensual', 'Haru', '2024-04-25 21:04:28', 'Haru', '2024-04-25 21:04:28', 'ACTIVO'),
(15, 'anual', 'anual', 'Haru', '2024-04-25 21:05:35', 'Haru', '2024-04-25 21:05:35', 'ACTIVO'),
(21, 'MedidaActiva', 'MedidaActiva', 'HARU', '2024-05-06 02:08:28', NULL, '2024-05-06 02:08:28', 'ACTIVO'),
(22, 'MedidaInactiva', 'MedidaInactiva', 'HARU', '2024-05-06 02:08:50', 'HARU', '2024-05-06 02:08:50', 'INACTIVO');

--
-- Disparadores `tbl_medidas_tierra`
--
DELIMITER $$
CREATE TRIGGER `DeleteMedidasTierra` AFTER DELETE ON `tbl_medidas_tierra` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_medida = ', OLD.id_medida, ', medida = ', OLD.medida, ', descripcion = ', OLD.descripcion), 'tbl_medidas_tierra');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertMedidasTierra` AFTER INSERT ON `tbl_medidas_tierra` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_medida = ', NEW.id_medida, ', medida = ', NEW.medida, ', descripcion = ', NEW.descripcion), 'tbl_medidas_tierra');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateMedidasTierra` AFTER UPDATE ON `tbl_medidas_tierra` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_medida = ', OLD.id_medida, ', medida = ', OLD.medida, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_medida = ', NEW.id_medida, ', medida = ', NEW.medida, ', descripcion = ', NEW.descripcion), 
                    'tbl_medidas_tierra'
                );
            END
$$
DELIMITER ;

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
  `id_tipo_motivos` bigint(20) DEFAULT NULL,
  `remesas` enum('S','N') DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_migracion_familiar`
--

INSERT INTO `tbl_migracion_familiar` (`id_ficha`, `id_productor`, `id_migracion`, `tiene_migrantes`, `migracion_dentro_pais`, `migracion_fuera_pais`, `id_tipo_motivos`, `remesas`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(2, 9, 99, 'S', 'S', 'N', 14, 'S', NULL, 'HARU', '2024-05-06 02:28:02', NULL, '2024-05-06 02:28:02', 'A'),
(5, 12, 100, 'N', 'N', 'N', NULL, 'N', NULL, 'HARU', '2024-05-07 03:57:11', NULL, '2024-05-07 03:57:11', 'A'),
(1, 8, 102, 'S', 'S', 'N', 14, 'S', NULL, 'HARU', '2024-05-07 04:01:47', NULL, '2024-05-07 04:01:47', 'A');

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
  `Estado` enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_motivos_migracion`
--

INSERT INTO `tbl_motivos_migracion` (`Id_motivo`, `Motivo`, `Descripcion`, `Creado_por`, `Fecha_creacion`, `Modificado_por`, `Fecha_Actualizacion`, `Estado`) VALUES
(1, 'Estudio', 'por el Estudio', 'Manuel', '2023-10-31 03:56:32', 'HARU', '2024-05-05 06:17:35', 'A'),
(2, 'Trabajo', 'No encuentra Trabajo en el país.', 'manuel', '2023-10-31 04:58:55', 'HARU', '2024-05-05 06:17:40', 'A'),
(3, 'Violencia', 'Violencia familiar o amenazas', 'Manuel', '2023-10-31 05:07:18', 'HARU', '2024-05-05 06:17:43', 'A'),
(4, 'Cambio climático', 'Cambio climático o desastre natural', 'Manuel', '2023-10-31 05:15:26', 'HARU', '2024-05-05 06:17:47', 'A'),
(11, 'MotivoMigracion', 'MotivoMigracionINac', 'Manuel', '2024-04-27 01:34:31', 'HARU', '2024-05-06 02:07:37', 'I'),
(14, 'MotivoActivo', 'MotivoActivo', 'HARU', '2024-05-06 02:07:52', NULL, '2024-05-06 02:07:52', 'A');

--
-- Disparadores `tbl_motivos_migracion`
--
DELIMITER $$
CREATE TRIGGER `DeleteMotivosMigracion` AFTER DELETE ON `tbl_motivos_migracion` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: Id_motivo = ', OLD.Id_motivo, ', Motivo = ', OLD.Motivo, ', Descripcion = ', OLD.Descripcion), 'tbl_motivos_migracion');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertMotivosMigracion` AFTER INSERT ON `tbl_motivos_migracion` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: Id_motivo = ', NEW.Id_motivo, ', Motivo = ', NEW.Motivo, ', Descripcion = ', NEW.Descripcion), 'tbl_motivos_migracion');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateMotivosMigracion` AFTER UPDATE ON `tbl_motivos_migracion` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: Id_motivo = ', OLD.Id_motivo, ', Motivo = ', OLD.Motivo, ', Descripcion = ', OLD.Descripcion), 
                    CONCAT('Información actualizada: Id_motivo = ', NEW.Id_motivo, ', Motivo = ', NEW.Motivo, ', Descripcion = ', NEW.Descripcion), 
                    'tbl_motivos_migracion'
                );
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_motivos_no_creditos`
--

CREATE TABLE `tbl_motivos_no_creditos` (
  `id_motivos_no_credito` bigint(20) NOT NULL,
  `motivo_no_credito` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_motivos_no_creditos`
--

INSERT INTO `tbl_motivos_no_creditos` (`id_motivos_no_credito`, `motivo_no_credito`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Estoy en la central de riesgos', 'Estoy en la central de riesgos', 'HARU', '2024-04-13 15:23:57', 'HARU', '2024-05-02 17:30:46', 'A'),
(2, 'Son muchos los requisitos', 'Son muchos los requisitos', 'HARU', '2024-04-13 15:24:35', 'HARU', '2024-05-02 17:30:50', 'A'),
(3, 'No lo he necesitado', 'No lo he necesitado', 'Haru', '2024-04-25 20:29:27', 'HARU', '2024-05-02 17:30:54', 'A'),
(4, 'No tengo capacidad de pago', 'No tengo capacidad de pago', 'Haru', '2024-04-25 20:29:27', 'HARU', '2024-05-02 17:30:58', 'A'),
(5, 'Temor al rechazo ', 'Temor al rechazo ', 'Haru', '2024-04-25 20:31:10', 'HARU', '2024-05-02 17:31:02', 'A'),
(6, 'Temor a no pagarlo ', 'Temor a no pagarlo ', 'Haru', '2024-04-25 20:31:54', 'HARU', '2024-05-02 17:31:06', 'A'),
(7, 'Tasas de interés muy altas ', 'Tasas de interés muy altas ', 'Haru', '2024-04-25 20:32:24', 'HARU', '2024-05-06 02:11:55', 'I'),
(8, 'MNCreActivo', 'MNCreActivo', 'HARU', '2024-04-26 01:45:15', NULL, '2024-04-26 01:45:15', 'A'),
(9, 'MNCreInactivo', 'MNCreInactivo', 'HARU', '2024-04-26 01:45:29', NULL, '2024-04-27 03:22:45', 'I');

--
-- Disparadores `tbl_motivos_no_creditos`
--
DELIMITER $$
CREATE TRIGGER `DeleteMotivosNoCreditos` AFTER DELETE ON `tbl_motivos_no_creditos` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_motivos_no_credito = ', OLD.id_motivos_no_credito, ', motivo_no_credito = ', OLD.motivo_no_credito, ', descripcion = ', OLD.descripcion), 'tbl_motivos_no_creditos');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertMotivosNoCreditos` AFTER INSERT ON `tbl_motivos_no_creditos` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_motivos_no_credito = ', NEW.id_motivos_no_credito, ', motivo_no_credito = ', NEW.motivo_no_credito, ', descripcion = ', NEW.descripcion), 'tbl_motivos_no_creditos');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateMotivosNoCreditos` AFTER UPDATE ON `tbl_motivos_no_creditos` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_motivos_no_credito = ', OLD.id_motivos_no_credito, ', motivo_no_credito = ', OLD.motivo_no_credito, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_motivos_no_credito = ', NEW.id_motivos_no_credito, ', motivo_no_credito = ', NEW.motivo_no_credito, ', descripcion = ', NEW.descripcion), 
                    'tbl_motivos_no_creditos'
                );
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_municipios`
--

CREATE TABLE `tbl_municipios` (
  `Id_Municipio` bigint(20) NOT NULL,
  `Id_Departamento` bigint(20) NOT NULL,
  `Nombre_Municipio` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Creado_Por` varchar(25) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(25) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_municipios`
--

INSERT INTO `tbl_municipios` (`Id_Municipio`, `Id_Departamento`, `Nombre_Municipio`, `Descripcion`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `Estado`) VALUES
(1, 1, 'La Ceiba', 'Descripción de La Ceiba', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 07:31:01', 'A'),
(2, 1, 'Tela', 'Descripción de Tela', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 07:31:04', 'A'),
(3, 1, 'Jutiapa', 'Descripción de Jutiapa', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(4, 1, 'La Masica', 'Descripción de La Masica', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(5, 1, 'Arizona', 'Descripción de Arizona', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(6, 2, 'Trujillo', 'Descripción de Trujillo', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(7, 2, 'Tocoa', 'Descripción de Tocoa', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(8, 2, 'Sonaguera', 'Descripción de Sonaguera', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(9, 2, 'Iriona', 'Descripción de Iriona', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(10, 2, 'Santa Fe', 'Descripción de Santa Fe', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(11, 3, 'Comayagua', 'Descripción de Comayagua', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(12, 3, 'Siguatepeque', 'Descripción de Siguatepeque', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(13, 3, 'La Libertad', 'Descripción de La Libertad', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(14, 3, 'Ajuterique', 'Descripción de Ajuterique', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(15, 3, 'Villa de San Antonio', 'Descripción de Villa de San Antonio', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(16, 4, 'Santa Rosa de Copán', 'Descripción de Santa Rosa de Copán', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(17, 4, 'La Entrada', 'Descripción de La Entrada', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(18, 4, 'Copán Ruinas', 'Descripción de Copaán Ruinas', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 02:31:01', 'A'),
(19, 4, 'Corquín', 'Descripción de Corquín', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(20, 4, 'San Juan de Opoa', 'Descripción de San Juan de Opoa', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(21, 5, 'San Pedro Sula', 'Descripción de San Pedro Sula', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(22, 5, 'Puerto Cortés', 'Descripción de Puerto Cortés', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(23, 5, 'Choloma', 'Descripción de Choloma', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(24, 5, 'Villanueva', 'Descripción de Villanueva', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(25, 5, 'La Lima', 'Descripción de La Lima', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(26, 6, 'Choluteca', 'Descripción de Choluteca', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(27, 6, 'Pespire', 'Descripción de Pespire', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(28, 6, 'San Marcos de Colón', 'Descripción de San Marcos de Colón', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(29, 6, 'Nacaome', 'Descripción de Nacaome', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(30, 6, 'Marcovia', 'Descripción de Marcovia', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(31, 7, 'Yuscarán', 'Descripción de Yuscarán', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(32, 7, 'Danlí', 'Descripción de Danlí', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(33, 7, 'El Paraíso', 'Descripción de El Paraíso', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(34, 7, 'Texiguat', 'Descripción de Texiguat', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(35, 7, 'Jacaleapa', 'Descripción de Jacaleapa', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(36, 8, 'Tegucigalpa', 'Descripción de Tegucigalpa', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(37, 8, 'Comayagüela', 'Descripción de Comayagüela', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(38, 8, 'Valle de Ángeles', 'Descripción de Valle de Ángeles', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(39, 8, 'Santa Lucía', 'Descripción de Santa Lucía', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(40, 8, 'Ojojona', 'Descripción de Ojojona', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(41, 9, 'Puerto Lempira', 'Descripción de Puerto Lempira', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(42, 9, 'Brus Laguna', 'Descripción de Brus Laguna', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(43, 9, 'Ahuas', 'Descripción de Ahuas', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(44, 9, 'Juan Francisco Bulnes', 'Descripción de Juan Francisco Bulnes', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(45, 9, 'Wampusirpe', 'Descripción de Wampusirpe', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(46, 10, 'La Esperanza', 'Descripción de La Esperanza', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(47, 10, 'Intibucá', 'Descripción de Intibucá', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(48, 10, 'Dolores', 'Descripción de Dolores', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(49, 10, 'San Juan', 'Descripción de San Juan', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(50, 10, 'San Marcos de Sierra', 'Descripción de San Marcos de Sierra', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(51, 11, 'Roatán', 'Descripción de Roatán', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(52, 11, 'Utila', 'Descripción de Utila', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(53, 11, 'Guanaja', 'Descripción de Guanaja', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(54, 11, 'José Santos Guardiola', 'Descripción de José Santos Guardiola', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(55, 11, 'Santa Elena', 'Descripción de Santa Elena', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(56, 12, 'La Paz', 'Descripción de La Paz', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(57, 12, 'Marcala', 'Descripción de Marcala', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(58, 12, 'Santa Ana', 'Descripción de Santa Ana', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(59, 12, 'Yarula', 'Descripción de Yarula', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(60, 12, 'Ajuterique', 'Descripción de Ajuterique', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(61, 13, 'Gracias', 'Descripción de Gracias', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(62, 13, 'La Iguala', 'Descripción de La Iguala', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(63, 13, 'Las Flores', 'Descripción de Las Flores', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(64, 13, 'La Unión', 'Descripción de La Unión', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(65, 13, 'La Virtud', 'Descripción de La Virtud', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(66, 14, 'Ocotepeque', 'Descripción de Ocotepeque', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(67, 14, 'San Marcos', 'Descripción de San Marcos', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(68, 14, 'La Labor', 'Descripción de La Labor', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(69, 14, 'Sinuapa', 'Descripción de Sinuapa', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(70, 14, 'San Fernando', 'Descripción de San Fernando', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(71, 15, 'Juticalpa', 'Descripción de Juticalpa', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(72, 15, 'Campamento', 'Descripción de Campamento', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(73, 15, 'Catacamas', 'Descripción de Catacamas', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(74, 15, 'Guarizama', 'Descripción de Guarizama', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(75, 15, 'San Esteban', 'Descripción de San Esteban', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(76, 16, 'Santa Bárbara', 'Descripción de Santa Bárbara', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(77, 16, 'Arada', 'Descripción de Arada', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(78, 16, 'Atima', 'Descripción de Atima', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(79, 16, 'Azacualpa', 'Descripción de Azacualpa', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(80, 16, 'Ceguaca', 'Descripción de Ceguaca', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(81, 17, 'Nacaome', 'Descripción de Nacaome', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(82, 17, 'Alianza', 'Descripción de Alianza', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(83, 17, 'Amapala', 'Descripción de Amapala', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(84, 17, 'Aramecina', 'Descripción de Aramecina', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(85, 17, 'Caridad', 'Descripción de Caridad', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(86, 18, 'Yoro', 'Descripción de Yoro', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(87, 18, 'El Progreso', 'Descripción de El Progreso', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(88, 18, 'Morazán', 'Descripción de Morazán', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(89, 18, 'Olanchito', 'Descripción de Olanchito', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(90, 18, 'Santa Rita', 'Descripción de Santa Rita', 'Admin', '2024-04-25 00:10:12', NULL, '2024-04-25 00:10:12', 'A'),
(91, 22, 'MunicipioActivo', 'Activo', 'HARU', '2024-04-26 01:23:28', 'HARU', '2024-05-06 02:03:17', 'A'),
(92, 23, 'MunicipioInactivo', 'MunicipioInactivo', 'HARU', '2024-04-26 01:24:05', 'HARU', '2024-04-26 01:25:30', 'I');

--
-- Disparadores `tbl_municipios`
--
DELIMITER $$
CREATE TRIGGER `DeleteMunicipios` AFTER DELETE ON `tbl_municipios` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: Id_Municipio = ', OLD.Id_Municipio, ', Id_Departamento = ', OLD.Id_Departamento, ', Nombre_Municipio = ', OLD.Nombre_Municipio, ', Descripcion = ', OLD.Descripcion), 'tbl_municipios');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertMunicipios` AFTER INSERT ON `tbl_municipios` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: Id_Municipio = ', NEW.Id_Municipio, ', Id_Departamento = ', NEW.Id_Departamento, ', Nombre_Municipio = ', NEW.Nombre_Municipio, ', Descripcion = ', NEW.Descripcion), 'tbl_municipios');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateMunicipios` AFTER UPDATE ON `tbl_municipios` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: Id_Municipio = ', OLD.Id_Municipio, ', Id_Departamento = ', OLD.Id_Departamento, ', Nombre_Municipio = ', OLD.Nombre_Municipio, ', Descripcion = ', OLD.Descripcion), 
                    CONCAT('Información actualizada: Id_Municipio = ', NEW.Id_Municipio, ', Id_Departamento = ', NEW.Id_Departamento, ', Nombre_Municipio = ', NEW.Nombre_Municipio, ', Descripcion = ', NEW.Descripcion), 
                    'tbl_municipios'
                );
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_no_creditos`
--

CREATE TABLE `tbl_no_creditos` (
  `id_nocred` bigint(20) NOT NULL,
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_motivos_no_credito` bigint(20) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Asociación', 10, 'Cooperativa Sagrada familia', 'manuel', '2024-02-28 04:24:55', 'HARU', '2024-05-02 21:49:47', 'A'),
(2, 'Cooperativa', 2, 'Cooperativa Elga', 'manuel', '2024-02-28 04:26:28', 'HARU', '2024-05-05 06:16:24', 'A'),
(3, 'Caja rural', 1, 'sfsdfsdfs', 'Kevin', '2024-03-18 02:44:11', 'HARU', '2024-05-05 06:16:27', 'A'),
(4, 'Patronato', 6, 'Patrono', 'Haru', '2024-04-25 21:28:17', 'HARU', '2024-05-05 06:16:31', 'A'),
(5, 'Junta de agua', 7, 'Junta de agua', 'Haru', '2024-04-25 21:29:50', 'HARU', '2024-05-05 06:16:35', 'A'),
(8, 'Organizacion', 1, 'Organizacion', 'Organizacion', '2024-04-26 01:31:31', 'Organizacion', '2024-04-27 03:16:28', 'A'),
(14, 'OrganizacionActiva', 17, 'OrganizacionActiva', 'HARU', '2024-05-06 02:06:48', NULL, '2024-05-06 02:06:48', 'A'),
(15, 'OrganizacionInactiva', 17, 'OrganizacionInactiva', 'HARU', '2024-05-06 02:07:02', 'HARU', '2024-05-06 02:07:07', 'I');

--
-- Disparadores `tbl_organizaciones`
--
DELIMITER $$
CREATE TRIGGER `DeleteOrganizaciones` AFTER DELETE ON `tbl_organizaciones` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_organizacion = ', OLD.id_organizacion, ', organizacion = ', OLD.organizacion, ', id_tipo_organizacion = ', OLD.id_tipo_organizacion, ', descripcion = ', OLD.descripcion), 'tbl_organizaciones');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertOrganizaciones` AFTER INSERT ON `tbl_organizaciones` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_organizacion = ', NEW.id_organizacion, ', organizacion = ', NEW.organizacion, ', id_tipo_organizacion = ', NEW.id_tipo_organizacion, ', descripcion = ', NEW.descripcion), 'tbl_organizaciones');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateOrganizaciones` AFTER UPDATE ON `tbl_organizaciones` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_organizacion = ', OLD.id_organizacion, ', organizacion = ', OLD.organizacion, ', id_tipo_organizacion = ', OLD.id_tipo_organizacion, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_organizacion = ', NEW.id_organizacion, ', organizacion = ', NEW.organizacion, ', id_tipo_organizacion = ', NEW.id_tipo_organizacion, ', descripcion = ', NEW.descripcion), 
                    'tbl_organizaciones'
                );
            END
$$
DELIMITER ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_organizaciones_por_productor`
--

INSERT INTO `tbl_organizaciones_por_productor` (`id_ficha`, `id_productor`, `id_organizacion`, `Id_Organizacion_Productor`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(2, 9, 1, 66, NULL, 'HARU', '2024-05-06 02:27:45', NULL, '2024-05-06 02:27:45', 'A'),
(2, 9, 2, 67, NULL, 'HARU', '2024-05-06 02:27:45', NULL, '2024-05-06 02:27:45', 'A'),
(2, 9, 3, 68, NULL, 'HARU', '2024-05-06 02:27:45', NULL, '2024-05-06 02:27:45', 'A'),
(1, 8, 1, 69, NULL, 'HARU', '2024-05-07 04:01:18', NULL, '2024-05-07 04:01:18', 'A'),
(1, 8, 2, 70, NULL, 'HARU', '2024-05-07 04:01:18', NULL, '2024-05-07 04:01:18', 'A'),
(1, 8, 3, 71, NULL, 'HARU', '2024-05-07 04:01:18', NULL, '2024-05-07 04:01:18', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_parametros`
--

CREATE TABLE `tbl_parametros` (
  `id_parametros` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `parametro` varchar(30) NOT NULL,
  `valor` varchar(20) NOT NULL,
  `Fecha_Creacion` datetime NOT NULL,
  `Fecha_Modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_parametros`
--

INSERT INTO `tbl_parametros` (`id_parametros`, `id_usuario`, `parametro`, `valor`, `Fecha_Creacion`, `Fecha_Modificacion`) VALUES
(1, 1, 'admin_dias_vigencia', '360', '2023-12-09 23:48:41', '2023-12-08 23:48:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_periodicidad`
--

CREATE TABLE `tbl_periodicidad` (
  `id_periodo` bigint(20) NOT NULL,
  `periodo` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_periodicidad`
--

INSERT INTO `tbl_periodicidad` (`id_periodo`, `periodo`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'bimestral', 'bimestral', 'Manuel', '2023-10-31 19:41:24', 'Manuel', '2023-12-11 01:33:12', 'A'),
(2, 'Trimestral', 'Trimestral', NULL, '2023-10-31 21:03:54', NULL, '2023-12-11 01:33:07', 'A'),
(3, 'Cuatrimestral', 'Cuatrimestral', 'manu', '2023-12-11 01:31:47', 'manu', '2023-12-11 01:31:47', 'A'),
(4, 'Semestre', 'Semestre', 'manu', '2023-12-11 01:32:23', 'manu', '2023-12-11 01:32:23', 'A'),
(5, 'Semanal', 'Semanal', 'manu', '2023-12-11 01:33:15', 'manu', '2023-12-11 01:33:15', 'A'),
(6, 'Quincenal', 'Quincenal', 'manu', '2023-12-11 01:34:18', 'manu', '2023-12-11 01:34:18', 'A'),
(7, 'Mensual', 'Mensual', 'manu', '2023-12-11 01:35:19', 'manu', '2023-12-11 01:35:19', 'A'),
(14, 'PerInactivo', 'PerInactivo', 'Manuel', '2024-04-26 01:43:54', 'Manuel', '2024-04-27 03:20:11', 'I'),
(15, 'PerActivo', 'PerActivo', 'Manuel', '2024-05-02 16:39:58', 'HARU', '2024-05-02 17:15:05', 'A'),
(17, 'PeriodoPrueba', 'PeriodoPrueba', 'HARU', '2024-05-06 02:10:51', NULL, '2024-05-06 02:10:51', 'A');

--
-- Disparadores `tbl_periodicidad`
--
DELIMITER $$
CREATE TRIGGER `DeletePeriodicidad` AFTER DELETE ON `tbl_periodicidad` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_periodo = ', OLD.id_periodo, ', periodo = ', OLD.periodo, ', descripcion = ', OLD.descripcion), 'tbl_periodicidad');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertPeriodicidad` AFTER INSERT ON `tbl_periodicidad` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_periodo = ', NEW.id_periodo, ', periodo = ', NEW.periodo, ', descripcion = ', NEW.descripcion), 'tbl_periodicidad');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdatePeriodicidad` AFTER UPDATE ON `tbl_periodicidad` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_periodo = ', OLD.id_periodo, ', periodo = ', OLD.periodo, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_periodo = ', NEW.id_periodo, ', periodo = ', NEW.periodo, ', descripcion = ', NEW.descripcion), 
                    'tbl_periodicidad'
                );
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_practicas_por_produccion`
--

CREATE TABLE `tbl_practicas_por_produccion` (
  `Id_Practica_Produccion` bigint(20) NOT NULL,
  `Id_Ficha` bigint(20) DEFAULT NULL,
  `Id_Productor` bigint(20) DEFAULT NULL,
  `Id_Tipo_Practica` bigint(20) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Id_Usuario` bigint(20) DEFAULT NULL,
  `Creado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_practicas_por_produccion`
--

INSERT INTO `tbl_practicas_por_produccion` (`Id_Practica_Produccion`, `Id_Ficha`, `Id_Productor`, `Id_Tipo_Practica`, `Descripcion`, `Id_Usuario`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `estado`) VALUES
(112, 2, 9, 44, ' ', NULL, 'HARU', '2024-05-06 02:28:59', NULL, '2024-05-06 02:28:59', 'A'),
(113, 1, 8, 44, ' ', NULL, 'HARU', '2024-05-07 04:03:20', NULL, '2024-05-07 04:03:20', 'A');

--
-- Disparadores `tbl_practicas_por_produccion`
--
DELIMITER $$
CREATE TRIGGER `DeletePracticasPorProduccion` AFTER DELETE ON `tbl_practicas_por_produccion` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: Id_Practica_Produccion = ', OLD.Id_Practica_Produccion, ', Id_Ficha = ', OLD.Id_Ficha, ', Id_Productor = ', OLD.Id_Productor, ', Id_Tipo_Practica = ', OLD.Id_Tipo_Practica, ', Descripcion = ', OLD.Descripcion), 'tbl_practicas_por_produccion');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertPracticasPorProduccion` AFTER INSERT ON `tbl_practicas_por_produccion` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: Id_Practica_Produccion = ', NEW.Id_Practica_Produccion, ', Id_Ficha = ', NEW.Id_Ficha, ', Id_Productor = ', NEW.Id_Productor, ', Id_Tipo_Practica = ', NEW.Id_Tipo_Practica, ', Descripcion = ', NEW.Descripcion), 'tbl_practicas_por_produccion');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdatePracticasPorProduccion` AFTER UPDATE ON `tbl_practicas_por_produccion` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: Id_Practica_Produccion = ', OLD.Id_Practica_Produccion, ', Id_Ficha = ', OLD.Id_Ficha, ', Id_Productor = ', OLD.Id_Productor, ', Id_Tipo_Practica = ', OLD.Id_Tipo_Practica, ', Descripcion = ', OLD.Descripcion), 
                    CONCAT('Información actualizada: Id_Practica_Produccion = ', NEW.Id_Practica_Produccion, ', Id_Ficha = ', NEW.Id_Ficha, ', Id_Productor = ', NEW.Id_Productor, ', Id_Tipo_Practica = ', NEW.Id_Tipo_Practica, ', Descripcion = ', NEW.Descripcion), 
                    'tbl_practicas_por_produccion'
                );
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_produccion_agricola_anterior`
--

CREATE TABLE `tbl_produccion_agricola_anterior` (
  `Id_Produccion_Anterior` bigint(20) NOT NULL,
  `Id_Ficha` bigint(20) DEFAULT NULL,
  `Id_Ubicacion` bigint(20) DEFAULT NULL,
  `Id_Productor` bigint(20) DEFAULT NULL,
  `Id_Tipo_Cultivo` bigint(20) DEFAULT NULL,
  `Superficie_Primera_Postrera` int(11) DEFAULT NULL,
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
  `Estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_produccion_agricola_anterior`
--

INSERT INTO `tbl_produccion_agricola_anterior` (`Id_Produccion_Anterior`, `Id_Ficha`, `Id_Ubicacion`, `Id_Productor`, `Id_Tipo_Cultivo`, `Superficie_Primera_Postrera`, `Id_Medida_Primera_Postrera`, `Produccion_Obtenida`, `Id_Medida_Produccion_Obtenida`, `Cantidad_Vendida`, `Id_Medida_Vendida`, `Precio_Venta`, `A_Quien_Se_Vendio`, `Descripcion`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `Estado`) VALUES
(23, 1, 14, 8, 12, 7, 21, 100.00, 21, 100.00, 21, 100.00, 'prueba', NULL, 'HARU', '2024-05-06 02:22:38', NULL, '2024-05-06 02:22:38', 'A'),
(24, 2, 15, 9, 12, 7, 21, 100.00, 21, 100.00, 21, 100.00, 'prueba', NULL, 'HARU', '2024-05-06 02:22:38', NULL, '2024-05-06 02:22:38', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_produccion_comercializacion`
--

CREATE TABLE `tbl_produccion_comercializacion` (
  `Id_Produccion_Comercio` bigint(20) NOT NULL,
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
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_produccion_comercializacion`
--

INSERT INTO `tbl_produccion_comercializacion` (`Id_Produccion_Comercio`, `Id_Ficha`, `Id_Ubicacion`, `Id_Productor`, `Id_Tipo_Produccion`, `Cantidad_Produccion`, `Id_Medida_Produccion`, `Cantidad_Vendida`, `Id_Medida_Venta`, `Precio_Venta`, `A_Quien_Se_Vendio`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `estado`) VALUES
(44, 2, 15, 9, 13, NULL, 15, 100.00, 21, 100.00, 'prueba', 'HARU', '2024-05-06 02:28:44', NULL, '2024-05-06 02:28:44', 'A'),
(45, 1, 14, 8, 13, NULL, 15, 100.00, 21, 100.00, 'prueba', 'HARU', '2024-05-07 04:02:25', NULL, '2024-05-07 04:02:25', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_produccion_pecuaria`
--

CREATE TABLE `tbl_produccion_pecuaria` (
  `Id_Produccion_Pecuaria` bigint(20) NOT NULL,
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
  `Estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_produccion_pecuaria`
--

INSERT INTO `tbl_produccion_pecuaria` (`Id_Produccion_Pecuaria`, `Id_Ficha`, `Id_Ubicacion`, `Id_Productor`, `Año_Produccion`, `Id_Tipo_Pecuario`, `Cantidad_Hembras`, `Cantidad_Machos`, `Cantidad_Total`, `Descripcion_Otros`, `Descripcion`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `Estado`) VALUES
(85, 2, 15, 9, 0, 11, 0, 100, 100, NULL, NULL, NULL, '2024-05-06 02:28:39', NULL, '2024-05-06 02:28:39', 'A'),
(86, 2, 15, 9, 0, 11, 100, 0, 100, NULL, NULL, NULL, '2024-05-06 02:28:39', NULL, '2024-05-06 02:28:39', 'A'),
(87, 1, 14, 8, 0, 11, 0, 100, 100, NULL, NULL, NULL, '2024-05-07 04:02:17', NULL, '2024-05-07 04:02:17', 'A'),
(88, 1, 14, 8, 0, 11, 100, 0, 100, NULL, NULL, NULL, '2024-05-07 04:02:17', NULL, '2024-05-07 04:02:17', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_produccion_vendida`
--

CREATE TABLE `tbl_produccion_vendida` (
  `Id_Produccion_Vendida` bigint(20) NOT NULL,
  `Año_Venta` int(11) DEFAULT NULL,
  `Id_Tipo_Pecuario` bigint(20) DEFAULT NULL,
  `Precio_Venta` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Venta` bigint(20) DEFAULT NULL,
  `Cantidad_Mercado` int(11) DEFAULT NULL,
  `Creado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productor`
--

CREATE TABLE `tbl_productor` (
  `id_ficha` varchar(50) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_productor`
--

INSERT INTO `tbl_productor` (`id_ficha`, `id_productor`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `identificacion`, `fecha_nacimiento`, `genero`, `estado_civil`, `nivel_escolaridad`, `ultimo_grado_escolar_aprobado`, `telefono_1`, `telefono_2`, `telefono_3`, `email_1`, `email_2`, `email_3`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
('1', 8, 'PruebaFInalEvaluacion', 'PruebaFInalEvaluacion', 'PruebaFInalEvaluacion', 'PruebaFInalEvaluacion', 801200105125, '2024-03-12', 'Masculino', 'Soltero(a)', 'secundaria', '6', 31673917, 22222222, 33333333, 'manubara200128@gmail.com', 'prueba@ds.com', 'md@gmail.com', NULL, 'HARU', '2024-05-07 04:01:04', '0', '2024-05-07 04:01:04', 'A'),
('2', 9, 'prueba', 'Manuel', 'prueba', 'Figueroa Barahona', 801200105125, '2024-04-24', 'Masculino', 'Casado(a)', 'primaria', '4', 31673917, 31673917, 31673917, 'manubara200128@gmail.com', 'manubara200128@gmail.com', 'manubara200128@gmail.com', NULL, 'HARU', '2024-05-06 02:27:34', '0', '2024-05-06 02:27:34', 'A'),
('3', 10, 'prueba', 'Manuel', 'prueba', 'Figueroa Barahona', 801200105125, '2024-04-30', 'Femenino', 'Soltero(a)', 'secundaria', '4', 31673917, 31673917, 31673917, 'prueba@ds.com', 'prueba@ds.com', 'prueba@ds.com', NULL, 'HARU', '2024-05-03 02:25:53', NULL, '2024-05-03 02:25:53', 'A'),
('4', 11, 'prueba', 'Manuel', 'prueba', 'Figueroa Barahona', 801200105125, '2024-04-30', 'Femenino', 'Soltero(a)', 'secundaria', '4', 31673917, 31673917, 31673917, 'prueba@ds.com', 'prueba@ds.com', 'prueba@ds.com', NULL, 'HARU', '2024-05-03 17:34:40', '0', '2024-05-03 17:34:40', 'A'),
('5', 12, 'Francisco Morazan', 'jesus', 'figueroa', 'barahona', 23131654, '2021-12-27', 'Masculino', 'Unión libre', 'primaria', '4', 31313131, 31673917, 32058341, 'manubara200128@gmail.com', 'manubara200128@gmail.com', 'manubara200128@gmail.com', NULL, 'HARU', '2024-05-03 23:26:43', '0', '2024-05-03 23:26:43', 'A'),
('6', 13, 'Francisco Morazan', 'jesus', 'figueroa', 'barahona', 23131654, '2021-12-27', 'Masculino', 'Casado(a)', 'secundaria', '4', 31313131, 31673917, 32058341, 'manubara200128@gmail.com', 'manubara200128@gmail.com', 'manubara200128@gmail.com', NULL, 'HARU', '2024-05-05 06:21:22', '0', '2024-05-05 06:21:22', 'A'),
('7', 14, 'Francisco Morazan', 'jesus', 'figueroa', 'barahona', 23131654, '2022-11-08', 'Masculino', 'Casado(a)', 'primaria', '4', 31313131, 31673917, 32058341, 'manubara200128@gmail.com', 'manubara200128@gmail.com', 'manubara200128@gmail.com', NULL, 'HARU', '2024-05-05 19:49:49', '0', '2024-05-05 19:49:49', 'A'),
('8', 15, 'Francisco Morazan', 'jesus', 'figueroa', 'barahona', 23131654, '2022-11-08', 'Masculino', 'Casado(a)', 'primaria', '4', 31313131, 31673917, 32058341, 'manubara200128@gmail.com', 'manubara200128@gmail.com', 'manubara200128@gmail.com', NULL, 'HARU', '2024-05-05 20:08:09', '0', '2024-05-05 20:08:09', 'A'),
('1', 16, 'PruebaFInalEvaluacion', 'PruebaFInalEvaluacion', 'PruebaFInalEvaluacion', 'PruebaFInalEvaluacion', 801200105125, '2024-03-12', 'Masculino', 'Soltero(a)', 'secundaria', '6', 31673917, 22222222, 33333333, 'manubara200128@gmail.com', 'prueba@ds.com', 'md@gmail.com', NULL, 'HARU', '2024-05-07 04:01:04', '0', '2024-05-07 04:01:04', 'A'),
('1', 17, 'PruebaFInalEvaluacion', 'PruebaFInalEvaluacion', 'PruebaFInalEvaluacion', 'PruebaFInalEvaluacion', 801200105125, '2024-03-12', 'Masculino', 'Soltero(a)', 'secundaria', '6', 31673917, 22222222, 33333333, 'manubara200128@gmail.com', 'prueba@ds.com', 'md@gmail.com', NULL, 'HARU', '2024-05-07 04:01:04', '0', '2024-05-07 04:01:04', 'A'),
('2', 18, 'prueba', 'Manuel', 'prueba', 'Figueroa Barahona', 801200105125, '2024-04-24', 'Masculino', 'Casado(a)', 'primaria', '4', 31673917, 31673917, 31673917, 'manubara200128@gmail.com', 'manubara200128@gmail.com', 'manubara200128@gmail.com', NULL, 'HARU', '2024-05-06 02:27:34', '0', '2024-05-06 02:27:34', 'A'),
('4', 19, 'manuel', 'jesus', 'Figueroa ', 'Barahona', 801200105125, '2024-05-06', 'Masculino', 'Casado(a)', 'universitaria', '4', 31673917, 31673917, 31673917, 'manubara200128@gmail.com', 'manubara200128@gmail.com', 'manubara200128@gmail.com', NULL, 'HARU', '2024-05-07 03:44:01', NULL, '2024-05-07 03:44:01', 'A'),
('5', 20, '', '', '', '', 0, '0000-00-00', '', '', '', '', 0, 0, 0, '', '', '', NULL, 'HARU', '2024-05-07 03:56:02', NULL, '2024-05-07 03:56:02', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productor_actividad_externa`
--

CREATE TABLE `tbl_productor_actividad_externa` (
  `id_actividad_ext` bigint(20) NOT NULL,
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
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_productor_actividad_externa`
--

INSERT INTO `tbl_productor_actividad_externa` (`id_actividad_ext`, `id_ficha`, `id_productor`, `miembros_realizan_actividades_fuera_finca`, `cuantos_miembros`, `trabajadores_temporales`, `trabajadores_permanentes`, `id_tomador_decisiones`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(55, 2, 9, 'S', 100, 100, 100, 9, NULL, 'HARU', '2024-05-06 02:28:54', NULL, '2024-05-06 02:28:54', 'A'),
(56, 1, 8, 'S', 100, 100, 100, 9, NULL, 'HARU', '2024-05-07 04:02:48', NULL, '2024-05-07 04:02:48', 'A');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_relevo_organizacion`
--

INSERT INTO `tbl_relevo_organizacion` (`id_ficha`, `id_productor`, `Id_Relevo`, `tendra_relevo`, `cuantos_relevos`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 8, 15, 'S', 12, NULL, 'HARU', '2024-05-06 02:20:17', 'HARU', '2024-05-07 04:01:40', 'A'),
(2, 9, 16, 'S', 12, NULL, 'HARU', '2024-05-06 02:20:17', 'HARU', '2024-05-06 02:27:59', 'A'),
(5, 12, 17, 'N', 0, NULL, 'HARU', '2024-05-07 03:57:04', NULL, '2024-05-07 03:57:04', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_siembra`
--

CREATE TABLE `tbl_siembra` (
  `Id_siembra` bigint(20) NOT NULL,
  `Tipo_siembra` varchar(50) NOT NULL,
  `Creado_Por` varchar(50) NOT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Actualizado_Por` varchar(50) NOT NULL,
  `Fecha_Actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_siembra`
--

INSERT INTO `tbl_siembra` (`Id_siembra`, `Tipo_siembra`, `Creado_Por`, `Fecha_Creacion`, `Actualizado_Por`, `Fecha_Actualizacion`, `Estado`) VALUES
(1, 'Primera', 'Haru', '2024-04-29 06:08:41', 'Haru', '2024-04-29 06:08:41', 'A'),
(2, 'Postrera', 'Haru', '2024-04-29 06:09:15', 'Haru', '2024-04-29 06:09:15', 'A'),
(6, 'sdfdsf', 'HARU', '2024-05-01 21:17:33', '', '2024-05-02 02:31:39', 'I'),
(7, 'ACtiva', 'HARU', '2024-05-06 02:00:07', '', '2024-05-06 02:00:07', 'A'),
(8, 'SiembreInactiva', 'HARU', '2024-05-06 02:00:41', '', '2024-05-06 02:00:41', 'I');

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
  `estado` enum('ACTIVO','INACTIVO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipos_apoyos`
--

INSERT INTO `tbl_tipos_apoyos` (`id_tipo_apoyos`, `tipo_apoyos`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Crédito', 'Descripción del apoyo de Crédito', 'admin', '2023-12-12 20:53:05', NULL, '2023-12-12 20:53:05', 'ACTIVO'),
(2, 'Semilla', 'Descripción del apoyo de Semilla', 'admin', '2023-12-12 20:53:05', NULL, '2023-12-12 20:53:05', 'ACTIVO'),
(3, 'Fertilizante', 'Descripción del apoyo de Fertilizante', 'admin', '2023-12-12 20:53:05', NULL, '2023-12-12 20:53:05', 'ACTIVO'),
(4, 'Capacitación', 'Descripción del apoyo de Capacitación', 'admin', '2023-12-12 20:53:05', NULL, '2023-12-12 20:53:05', 'ACTIVO'),
(5, 'Asistencia técnica', 'Descripción del apoyo de Asistencia técnica', 'admin', '2023-12-12 20:53:05', NULL, '2023-12-12 20:53:05', 'ACTIVO'),
(6, 'Herramientas de trabajo', 'Descripción del apoyo de Herramientas de trabajo', 'admin', '2023-12-12 20:53:05', NULL, '2023-12-12 20:53:05', 'ACTIVO'),
(7, 'Sistema de riego', 'Descripción del apoyo de Sistema de riego', 'admin', '2023-12-12 20:53:05', NULL, '2023-12-12 20:53:05', 'ACTIVO'),
(8, 'Equipo agrícola', 'Descripción del apoyo de Equipo agrícola', 'admin', '2023-12-12 20:53:05', NULL, '2023-12-12 20:53:05', 'ACTIVO'),
(9, 'Silos', 'Descripción del apoyo de Silos', 'admin', '2023-12-12 20:53:05', NULL, '2023-12-12 20:53:05', 'ACTIVO'),
(10, 'Cosechadoras de agua', 'Descripción del apoyo de Cosechadoras de agua', 'admin', '2023-12-12 20:53:05', NULL, '2023-12-12 20:53:05', 'ACTIVO'),
(11, 'Pie de cría', 'Descripción del apoyo de Pie de cría', 'admin', '2023-12-12 20:53:05', NULL, '2023-12-12 20:53:05', 'ACTIVO'),
(12, 'Información de precios', 'Descripción del apoyo de Información de precios', 'admin', '2023-12-12 20:53:05', NULL, '2023-12-12 20:53:05', 'ACTIVO'),
(13, 'Comercialización/mercados', 'Descripción del apoyo de Comercialización/mercados', 'admin', '2023-12-12 20:53:05', NULL, '2023-12-12 20:53:05', 'ACTIVO'),
(14, 'Organización rural', 'Descripción del apoyo de Organización rural', 'admin', '2023-12-12 20:53:05', NULL, '2023-12-12 20:53:05', 'ACTIVO'),
(15, 'Transformación de productos', 'Descripción del apoyo de Transformación de productos', 'admin', '2023-12-12 20:53:05', NULL, '2023-12-12 20:53:05', 'ACTIVO'),
(17, 'TPActivo', 'TPActivo', 'Daniela', '2024-04-26 01:51:45', 'Daniela', '2024-04-26 01:51:45', 'ACTIVO'),
(18, 'TPInactivo', 'TPInactivo', 'Daniela', '2024-04-26 01:52:16', 'Daniela', '2024-04-26 01:52:16', 'INACTIVO');

--
-- Disparadores `tbl_tipos_apoyos`
--
DELIMITER $$
CREATE TRIGGER `DeleteTiposApoyos` AFTER DELETE ON `tbl_tipos_apoyos` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_apoyos = ', OLD.id_tipo_apoyos, ', tipo_apoyos = ', OLD.tipo_apoyos, ', descripcion = ', OLD.descripcion), 'tbl_tipos_apoyos');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertTiposApoyos` AFTER INSERT ON `tbl_tipos_apoyos` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_apoyos = ', NEW.id_tipo_apoyos, ', tipo_apoyos = ', NEW.tipo_apoyos, ', descripcion = ', NEW.descripcion), 'tbl_tipos_apoyos');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateTiposApoyos` AFTER UPDATE ON `tbl_tipos_apoyos` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_apoyos = ', OLD.id_tipo_apoyos, ', tipo_apoyos = ', OLD.tipo_apoyos, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_apoyos = ', NEW.id_tipo_apoyos, ', tipo_apoyos = ', NEW.tipo_apoyos, ', descripcion = ', NEW.descripcion), 
                    'tbl_tipos_apoyos'
                );
            END
$$
DELIMITER ;

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
  `id_tipo_cultivo` bigint(20) NOT NULL,
  `tipo_cultivo` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('ACTIVO','INACTIVO','','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipo_cultivo`
--

INSERT INTO `tbl_tipo_cultivo` (`id_tipo_cultivo`, `tipo_cultivo`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Maiz', 'Maiz amarillo', 'Manuel', '2023-12-01 04:18:29', 'HARU', '2024-05-02 21:56:32', 'ACTIVO'),
(2, 'Cafe', 'Cafe de palo', 'Haru', '2024-04-26 00:30:34', 'Haru', '2024-04-26 00:30:34', 'ACTIVO'),
(3, 'Frijol', 'Frijol', 'Haru', '2024-04-26 00:31:10', 'Haru', '2024-04-26 00:31:10', 'ACTIVO'),
(4, 'Palma', 'Palma', 'Manuel', '2023-11-02 05:10:49', 'Manuel', '2024-04-26 00:33:17', 'ACTIVO'),
(5, 'Caña de Azúcar', 'Caña de Azúcar', 'manu', '2023-12-11 07:44:45', 'manu', '2023-12-11 07:44:45', 'ACTIVO'),
(6, 'Sorgo', 'Sorgo', 'manu', '2023-12-11 07:45:19', 'manu', '2023-12-11 07:45:19', 'ACTIVO'),
(7, 'Naranja', 'Naranja', 'manu', '2023-12-11 07:45:19', 'manu', '2023-12-11 07:45:19', 'ACTIVO'),
(8, 'Banano', 'Banano', 'manu', '2023-12-11 07:46:35', 'manu', '2023-12-11 07:46:35', 'ACTIVO'),
(9, 'Melón', 'Melón', 'manu', '2023-12-11 07:47:49', 'manu', '2023-12-11 07:47:49', 'ACTIVO'),
(10, 'sandía', 'prueba', 'Kevin', '2024-02-26 10:01:58', 'Kevin', '2024-02-26 10:01:58', 'ACTIVO'),
(11, 'CultivoInactivo', 'CultivoInactivo', 'Manuel', '2024-04-26 01:39:42', 'Manuel', '2024-04-26 01:40:04', 'INACTIVO'),
(12, 'CultivoActivo', 'CultivoActivo', 'Manuel', '2024-04-26 01:39:54', 'Manuel', '2024-04-26 01:39:54', 'ACTIVO');

--
-- Disparadores `tbl_tipo_cultivo`
--
DELIMITER $$
CREATE TRIGGER `DeleteTipoCultivo` AFTER DELETE ON `tbl_tipo_cultivo` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_cultivo = ', OLD.id_tipo_cultivo, ', tipo_cultivo = ', OLD.tipo_cultivo, ', descripcion = ', OLD.descripcion), 'tbl_tipo_cultivo');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertTipoCultivo` AFTER INSERT ON `tbl_tipo_cultivo` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_cultivo = ', NEW.id_tipo_cultivo, ', tipo_cultivo = ', NEW.tipo_cultivo, ', descripcion = ', NEW.descripcion), 'tbl_tipo_cultivo');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateTipoCultivo` AFTER UPDATE ON `tbl_tipo_cultivo` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_cultivo = ', OLD.id_tipo_cultivo, ', tipo_cultivo = ', OLD.tipo_cultivo, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_cultivo = ', NEW.id_tipo_cultivo, ', tipo_cultivo = ', NEW.tipo_cultivo, ', descripcion = ', NEW.descripcion), 
                    'tbl_tipo_cultivo'
                );
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_negocios`
--

CREATE TABLE `tbl_tipo_negocios` (
  `id_tipo_negocio` bigint(20) NOT NULL,
  `tipo_negocio` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipo_negocios`
--

INSERT INTO `tbl_tipo_negocios` (`id_tipo_negocio`, `tipo_negocio`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Venta de servicio', 'Venta de servicios', 'Kevin', '2024-05-02 17:18:30', 'Kevin', '2024-05-02 17:18:30', 'A'),
(2, 'Jornal agricola', 'Jornal agricola', 'Kevin', '2024-05-02 17:18:30', 'Kevin', '2024-05-02 17:18:30', 'A'),
(3, 'Corte de café', 'Café', NULL, '2024-05-02 17:18:30', NULL, '2024-05-02 17:18:30', 'A'),
(4, 'Jornal no agrícola', 'Jornal no agrícola', NULL, '2024-05-02 17:18:30', NULL, '2024-05-02 17:18:30', 'A'),
(5, 'Alquileres', 'Alquileres', NULL, '2024-05-02 17:18:30', NULL, '2024-05-02 17:18:30', 'A'),
(6, 'Remesa del exterior', 'Remesa del exterior', NULL, '2024-05-02 17:18:30', NULL, '2024-05-02 17:18:30', 'A'),
(7, 'Remesa nacional', 'Remesa nacional', NULL, '2024-05-02 17:18:30', NULL, '2024-05-02 17:18:30', 'A'),
(8, 'Bono (10 mil, 3ra edad, escolar)', 'Bono(10 mil, 3ra edad, escolar)', NULL, '2024-05-02 17:18:30', NULL, '2024-05-02 17:18:30', 'A'),
(9, 'Salario profesional', 'Salario profesional', NULL, '2024-05-02 17:18:30', NULL, '2024-05-02 17:18:30', 'A'),
(10, 'Artesanía', 'Artesanía', NULL, '2024-05-02 17:18:30', NULL, '2024-05-02 17:18:30', 'A'),
(11, 'Negocio', 'Negocio', 'Kevin', '2024-05-02 17:18:30', 'Kevin', '2024-05-02 17:18:30', 'A'),
(14, 'NegInactivo', 'NegInactivo', 'Kevin', '2024-05-02 17:24:53', 'HARU', '2024-05-02 17:24:53', 'I'),
(17, 'TNegocioActivo', 'TNegocioActivo', 'HARU', '2024-05-06 02:11:22', NULL, '2024-05-06 02:11:22', 'A');

--
-- Disparadores `tbl_tipo_negocios`
--
DELIMITER $$
CREATE TRIGGER `DeleteTipoNegocios` AFTER DELETE ON `tbl_tipo_negocios` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_negocio = ', OLD.id_tipo_negocio, ', tipo_negocio = ', OLD.tipo_negocio, ', descripcion = ', OLD.descripcion), 'tbl_tipo_negocios');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertTipoNegocios` AFTER INSERT ON `tbl_tipo_negocios` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_negocio = ', NEW.id_tipo_negocio, ', tipo_negocio = ', NEW.tipo_negocio, ', descripcion = ', NEW.descripcion), 'tbl_tipo_negocios');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateTipoNegocios` AFTER UPDATE ON `tbl_tipo_negocios` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_negocio = ', OLD.id_tipo_negocio, ', tipo_negocio = ', OLD.tipo_negocio, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_negocio = ', NEW.id_tipo_negocio, ', tipo_negocio = ', NEW.tipo_negocio, ', descripcion = ', NEW.descripcion), 
                    'tbl_tipo_negocios'
                );
            END
$$
DELIMITER ;

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
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipo_organizacion`
--

INSERT INTO `tbl_tipo_organizacion` (`id_tipo_organizacion`, `tipo_organizacion`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Crédito', 'Gobierno', 'Haru', '2024-05-05 06:15:56', 'HARU', '2024-05-05 06:15:56', 'A'),
(2, 'Capacitación', 'ONG', 'manu', '2024-05-05 06:15:51', 'HARU', '2024-05-05 06:15:51', 'A'),
(5, 'Sistema de riego', 'Sistema de riego', 'Kevin', '2024-05-05 06:16:00', 'HARU', '2024-05-05 06:16:00', 'A'),
(6, 'Cosechadoras de agua', 'Cosechadoras de agua', 'Kevin', '2024-05-05 06:16:04', 'HARU', '2024-05-05 06:16:04', 'A'),
(7, 'Semilla', 'Semilla', 'Kevin', '2024-05-05 06:16:08', 'HARU', '2024-05-05 06:16:08', 'A'),
(8, 'Asistencia técnica', 'Asistencia técnica', 'Kevin', '2024-05-05 06:12:42', 'HARU', '2024-05-05 06:12:42', 'A'),
(9, 'Equipo agrícola', 'Equipo agrícola', 'tbl_tipo_organizacion', '2024-05-05 06:12:56', 'HARU', '2024-05-05 06:12:56', 'A'),
(10, 'Preuena', 'TierrasSana', 'Kevin', '2024-05-02 10:15:57', 'HARU', '2024-05-02 10:15:57', 'A'),
(12, 'Pie de cría', 'Pie de cría', 'HARU', '2024-05-05 06:13:13', NULL, '2024-05-05 06:13:13', 'A'),
(13, 'Fertilizante', 'Fertilizante', 'HARU', '2024-05-05 06:13:24', NULL, '2024-05-05 06:13:24', 'A'),
(14, 'Herramientas de trabajo', 'Herramientas de trabajo', 'HARU', '2024-05-05 06:13:36', NULL, '2024-05-05 06:13:36', 'A'),
(15, 'Silos', 'Silos', 'HARU', '2024-05-05 06:13:44', NULL, '2024-05-05 06:13:44', 'A'),
(16, 'Información de precios', 'Información de precios', 'HARU', '2024-05-05 06:13:58', NULL, '2024-05-05 06:13:58', 'A'),
(17, 'TipoORGActivo', 'TipoORGActivo', 'HARU', '2024-05-06 02:06:09', NULL, '2024-05-06 02:06:09', 'A'),
(18, 'TipoORGInactiva', 'TipoORGInactiva', 'HARU', '2024-05-06 02:06:25', 'HARU', '2024-05-06 02:06:25', 'I');

--
-- Disparadores `tbl_tipo_organizacion`
--
DELIMITER $$
CREATE TRIGGER `DeleteTipoOrganizacion` AFTER DELETE ON `tbl_tipo_organizacion` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_organizacion = ', OLD.id_tipo_organizacion, ', tipo_organizacion = ', OLD.tipo_organizacion, ', descripcion = ', OLD.descripcion), 'tbl_tipo_organizacion');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertTipoOrganizacion` AFTER INSERT ON `tbl_tipo_organizacion` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_organizacion = ', NEW.id_tipo_organizacion, ', tipo_organizacion = ', NEW.tipo_organizacion, ', descripcion = ', NEW.descripcion), 'tbl_tipo_organizacion');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateTipoOrganizacion` AFTER UPDATE ON `tbl_tipo_organizacion` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_organizacion = ', OLD.id_tipo_organizacion, ', tipo_organizacion = ', OLD.tipo_organizacion, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_organizacion = ', NEW.id_tipo_organizacion, ', tipo_organizacion = ', NEW.tipo_organizacion, ', descripcion = ', NEW.descripcion), 
                    'tbl_tipo_organizacion'
                );
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_pecuarios`
--

CREATE TABLE `tbl_tipo_pecuarios` (
  `id_tipo_pecuario` bigint(20) NOT NULL,
  `tipo_pecuario` varchar(25) NOT NULL,
  `raza_con_genero` enum('s','n') DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipo_pecuarios`
--

INSERT INTO `tbl_tipo_pecuarios` (`id_tipo_pecuario`, `tipo_pecuario`, `raza_con_genero`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Bovinos', 's', 'asasa', 'manu', '2023-11-26 06:00:00', 'manu', '2023-12-11 01:15:58', 'A'),
(2, 'Ovinos', 's', 'prueba', 'manu', '2023-11-26 06:13:32', 'manu', '2023-12-11 01:15:45', 'A'),
(3, 'Caprinos', 's', 'Caprinos', 'manu', '2023-11-26 06:29:31', 'manu', '2023-12-11 01:15:30', 'A'),
(4, 'Cerdo', 's', 'Cerdos', 'Mfigue', '2023-12-11 01:11:16', NULL, '2023-12-11 01:11:49', 'A'),
(5, 'Pollo de Engorde', 's', 'Pollo de Engorde', 'manu', '2023-12-11 01:11:57', 'manu', '2023-12-11 01:11:57', 'A'),
(6, 'Aves', 'n', 'Aves', 'manu', '2023-12-11 01:12:58', 'manu', '2023-12-11 01:12:58', 'A'),
(7, 'Peces', 'n', 'Peces', 'manu', '2023-12-11 01:13:38', 'manu', '2024-04-25 21:14:23', 'A'),
(8, 'Camarones', 'n', 'Camarones', 'manu', '2023-12-11 01:14:08', 'manu', '2023-12-11 01:14:08', 'A'),
(9, 'Otros', 'n', 'Otras especies', 'manu', '2023-12-11 01:14:44', 'manu', '2024-04-25 23:43:20', 'I'),
(11, 'ActivoPEA', 's', 'ActivoPEA', 'HARU', '2024-04-26 01:41:07', 'HARU', '2024-05-06 02:09:39', 'A'),
(12, 'PeInactivo', 's', 'PeInactivo', 'HARU', '2024-04-26 01:41:22', 'HARU', '2024-05-02 16:26:03', 'I');

--
-- Disparadores `tbl_tipo_pecuarios`
--
DELIMITER $$
CREATE TRIGGER `DeleteTipoPecuarios` AFTER DELETE ON `tbl_tipo_pecuarios` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_pecuario = ', OLD.id_tipo_pecuario, ', tipo_pecuario = ', OLD.tipo_pecuario, ', raza_con_genero = ', OLD.raza_con_genero, ', descripcion = ', OLD.descripcion), 'tbl_tipo_pecuarios');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertTipoPecuarios` AFTER INSERT ON `tbl_tipo_pecuarios` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_pecuario = ', NEW.id_tipo_pecuario, ', tipo_pecuario = ', NEW.tipo_pecuario, ', raza_con_genero = ', NEW.raza_con_genero, ', descripcion = ', NEW.descripcion), 'tbl_tipo_pecuarios');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateTipoPecuarios` AFTER UPDATE ON `tbl_tipo_pecuarios` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_pecuario = ', OLD.id_tipo_pecuario, ', tipo_pecuario = ', OLD.tipo_pecuario, ', raza_con_genero = ', OLD.raza_con_genero, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_pecuario = ', NEW.id_tipo_pecuario, ', tipo_pecuario = ', NEW.tipo_pecuario, ', raza_con_genero = ', NEW.raza_con_genero, ', descripcion = ', NEW.descripcion), 
                    'tbl_tipo_pecuarios'
                );
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_practicas_productivas`
--

CREATE TABLE `tbl_tipo_practicas_productivas` (
  `id_tipo_practica` bigint(20) NOT NULL,
  `tipo_practica` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipo_practicas_productivas`
--

INSERT INTO `tbl_tipo_practicas_productivas` (`id_tipo_practica`, `tipo_practica`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Quema', 'Quema', 'haru', '2024-05-02 22:20:13', NULL, '2024-05-02 22:20:13', 'I'),
(2, 'Riega', NULL, NULL, '2024-04-27 03:25:21', NULL, '2024-04-27 03:25:21', 'I'),
(3, 'Manejo de rastrojo', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(4, 'Cero labranzas', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(5, 'Labranza mínima', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(6, 'Siembra en hileras o surcos', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(7, 'Curvas a nivel', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(8, 'Cultivos en asoci', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(9, 'Desparasitantes', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(10, 'Preparación de suelo con tractor', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(11, 'Cultivo en relevo', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(12, 'Tierra en descanso', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(13, 'Barreras vivas', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(14, 'Barreras muertas', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(15, 'Abono orgánico', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(16, 'Abono sintético', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(17, 'Cosecha de agua', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(18, 'Manejo de humedad', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(19, 'Semilla criolla', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(20, 'Semilla mejorada', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(21, 'Huerto familiar', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(22, 'Almacenamiento de grano', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(23, 'Agricultura protegida', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(24, 'Secadora solar', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(25, 'Uso de insecticidas', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(26, 'Uso de fungicidas', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(27, 'Uso de acaricidas', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(28, 'Uso de herbicidas', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(29, 'Podas', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(30, 'Sistema agroforestal', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(31, 'Control de sombra', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(32, 'Sistema silvopastoril', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(33, 'Terrazas', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(34, 'Cultivo de cobertura', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(35, 'Banco de proteína', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(36, 'Pastos mejorados', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(37, 'Aplicación de vacunas', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(38, 'Vitaminas', 'Vitaminas', NULL, '2024-04-25 23:26:06', NULL, '2024-04-25 23:26:06', 'I'),
(39, 'Preparación de suelo con tracción animal', NULL, NULL, '2023-12-12 17:05:48', NULL, '2023-12-12 17:05:48', 'A'),
(41, 'PPInactivas', 'PPInactivas', 'Manuel', '2024-04-26 01:50:26', 'Manuel', '2024-04-26 01:50:26', ''),
(44, 'PPActivas', 'PPActivas', 'HARU', '2024-05-02 19:54:06', NULL, '2024-05-02 19:54:06', 'A'),
(45, 'InactivaPP', 'InactivaPP', 'HARU', '2024-05-06 02:14:13', 'HARU', '2024-05-06 02:14:13', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_produccion`
--

CREATE TABLE `tbl_tipo_produccion` (
  `id_tipo_produccion` bigint(20) NOT NULL,
  `tipo_produccion` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipo_produccion`
--

INSERT INTO `tbl_tipo_produccion` (`id_tipo_produccion`, `tipo_produccion`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Producción de leche', 'Leche', 'HARU', '2024-05-02 21:58:50', 'HARU', '2024-05-02 21:58:50', 'A'),
(2, 'Producción de carne', 'Carne', 'Kevin', '2024-05-02 16:33:42', 'Kevin', '2024-05-02 16:33:42', 'A'),
(3, 'Producción de derivados de leche', 'Derivados de la leche', 'Kevin', '2024-05-02 16:33:42', 'Kevin', '2024-05-02 16:33:42', 'A'),
(4, 'Producción de huevos', 'Huevos', 'Kevin', '2024-05-02 16:33:42', 'Kevin', '2024-05-02 16:33:42', 'A'),
(5, 'Producción apícola ', 'Apicola', 'manu', '2024-05-02 16:33:42', 'manu', '2024-05-02 16:33:42', 'A'),
(6, 'Producto de Transformación', 'Transformación', 'manu', '2024-05-06 02:10:15', 'HARU', '2024-05-06 02:10:15', 'I'),
(12, 'ProInactivo', 'ProInactivo', 'Kevin', '2024-05-02 16:33:51', 'Kevin', '2024-05-02 16:33:51', 'I'),
(13, 'ProActivo', 'TierrasSana1', 'HARU', '2024-05-02 16:38:53', 'HARU', '2024-05-02 16:38:53', 'A');

--
-- Disparadores `tbl_tipo_produccion`
--
DELIMITER $$
CREATE TRIGGER `DeleteTipoProduccion` AFTER DELETE ON `tbl_tipo_produccion` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_produccion = ', OLD.id_tipo_produccion, ', tipo_produccion = ', OLD.tipo_produccion, ', descripcion = ', OLD.descripcion), 'tbl_tipo_produccion');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertTipoProduccion` AFTER INSERT ON `tbl_tipo_produccion` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_produccion = ', NEW.id_tipo_produccion, ', tipo_produccion = ', NEW.tipo_produccion, ', descripcion = ', NEW.descripcion), 'tbl_tipo_produccion');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateTipoProduccion` AFTER UPDATE ON `tbl_tipo_produccion` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_produccion = ', OLD.id_tipo_produccion, ', tipo_produccion = ', OLD.tipo_produccion, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_produccion = ', NEW.id_tipo_produccion, ', tipo_produccion = ', NEW.tipo_produccion, ', descripcion = ', NEW.descripcion), 
                    'tbl_tipo_produccion'
                );
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_riego`
--

CREATE TABLE `tbl_tipo_riego` (
  `id_tipo_riego` bigint(20) NOT NULL,
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
(1, 'Pozo', 'Pozo', 'Manuel', '2023-11-02 05:23:18', 'Manuel', '2023-11-02 05:23:18', 'ACTIVO'),
(2, 'riego por goteo', 'riego por goteo', 'Manuel', '2024-04-25 14:49:46', 'Manuel', '2024-04-25 14:49:46', 'ACTIVO'),
(3, 'riego por aspersión', 'riego por aspersión', 'Manuel', '2024-04-25 14:51:45', 'Manuel', '2024-04-25 14:51:45', 'ACTIVO'),
(4, 'Riego por bombeo', 'Riego por bombeo', 'Manuel', '2024-04-25 14:52:13', 'Manuel', '2024-04-25 14:52:13', 'ACTIVO'),
(5, 'Riego por gravedad', 'Riego por gravedad', 'Manuel', '2024-04-25 14:52:47', 'Manuel', '2024-04-25 14:52:47', 'ACTIVO'),
(6, 'RiegoActivo', 'RiegoActivo', 'Manuel', '2024-04-26 01:38:30', 'Manuel', '2024-04-26 01:38:30', 'ACTIVO'),
(7, 'RiegoInactivo', 'RiegoInactivo', 'Manuel', '2024-04-26 01:38:50', 'Manuel', '2024-04-26 01:38:58', 'INACTIVO');

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
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipo_trabajadores`
--

INSERT INTO `tbl_tipo_trabajadores` (`id_tipo_trabajador`, `tipo_trabajador`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Ganadero', 'kkka', 'Daniela', '2023-11-22 06:17:22', 'Daniela', '2023-11-22 06:17:22', 'I'),
(2, 'Agricultor', '3 cultivos de papa', 'Daniela', '2023-11-22 06:17:27', 'Daniela', '2023-11-22 06:17:27', 'A'),
(5, 'TraInactivo', 'TraInactivo', 'Daniela', '2024-04-26 01:49:13', 'Daniela', '2024-04-26 01:49:13', '');

--
-- Disparadores `tbl_tipo_trabajadores`
--
DELIMITER $$
CREATE TRIGGER `DeleteTipoTrabajadores` AFTER DELETE ON `tbl_tipo_trabajadores` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_trabajador = ', OLD.id_tipo_trabajador, ', tipo_trabajador = ', OLD.tipo_trabajador, ', descripcion = ', OLD.descripcion), 'tbl_tipo_trabajadores');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertTipoTrabajadores` AFTER INSERT ON `tbl_tipo_trabajadores` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_trabajador = ', NEW.id_tipo_trabajador, ', tipo_trabajador = ', NEW.tipo_trabajador, ', descripcion = ', NEW.descripcion), 'tbl_tipo_trabajadores');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateTipoTrabajadores` AFTER UPDATE ON `tbl_tipo_trabajadores` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_trabajador = ', OLD.id_tipo_trabajador, ', tipo_trabajador = ', OLD.tipo_trabajador, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_trabajador = ', NEW.id_tipo_trabajador, ', tipo_trabajador = ', NEW.tipo_trabajador, ', descripcion = ', NEW.descripcion), 
                    'tbl_tipo_trabajadores'
                );
            END
$$
DELIMITER ;

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
(1, 'Esposo', 'Esposo', 'Daniela', '2024-05-02 19:47:39', 'HARU', '2024-05-02 19:47:39', 'A'),
(2, 'Esposa', 'Esposa', 'Daniela', '2024-05-02 19:47:43', 'HARU', '2024-05-02 19:47:43', 'A'),
(3, 'Consenso en Familia', 'Consenso en Familia', 'Daniela', '2024-05-02 19:47:46', 'HARU', '2024-05-02 19:47:46', 'A'),
(4, 'Un familiar', 'Un familiar toma las deciones', 'Haru', '2024-05-02 19:47:51', 'HARU', '2024-05-02 19:47:51', 'A'),
(5, 'Un administrador', 'El administrador toma la decision', 'Haru', '2024-05-02 19:47:56', 'HARU', '2024-05-02 19:47:56', 'A'),
(6, 'TomaDInactivo', 'TomaDInactivo', 'Daniela', '2024-05-02 19:47:11', 'HARU', '2024-05-02 19:47:11', 'I'),
(9, 'TomaDActivo', 'TomaDActivo', 'HARU', '2024-05-06 02:13:21', NULL, '2024-05-06 02:13:21', 'A');

--
-- Disparadores `tbl_toma_decisiones`
--
DELIMITER $$
CREATE TRIGGER `DeleteTomaDecisiones` AFTER DELETE ON `tbl_toma_decisiones` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_tomador = ', OLD.id_tipo_tomador, ', tomador = ', OLD.tomador, ', descripcion = ', OLD.descripcion), 'tbl_toma_decisiones');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `InsertTomaDecisiones` AFTER INSERT ON `tbl_toma_decisiones` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_tomador = ', NEW.id_tipo_tomador, ', tomador = ', NEW.tomador, ', descripcion = ', NEW.descripcion), 'tbl_toma_decisiones');
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateTomaDecisiones` AFTER UPDATE ON `tbl_toma_decisiones` FOR EACH ROW BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_tomador = ', OLD.id_tipo_tomador, ', tomador = ', OLD.tomador, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_tomador = ', NEW.id_tipo_tomador, ', tomador = ', NEW.tomador, ', descripcion = ', NEW.descripcion), 
                    'tbl_toma_decisiones'
                );
            END
$$
DELIMITER ;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ubicacion_productor`
--

CREATE TABLE `tbl_ubicacion_productor` (
  `id_ficha` bigint(20) DEFAULT NULL,
  `id_productor` bigint(20) DEFAULT NULL,
  `id_ubicacion` bigint(20) NOT NULL,
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
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_ubicacion_productor`
--

INSERT INTO `tbl_ubicacion_productor` (`id_ficha`, `id_productor`, `id_ubicacion`, `Id_Departamento`, `Id_Municipio`, `Id_Aldea`, `Id_Cacerio`, `ubicacion_geografica`, `distancia_parcela_vivienda`, `latitud_parcela`, `longitud_parcela`, `msnm`, `direccion_1`, `direccion_2`, `direccion_3`, `vive_en_finca`, `nombre_finca`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 8, 14, 22, 91, 151, 9, 'PruebaFInalEvaluacion', 12.00, '12', '12', 12.00, ' PruebaFInalEvaluacion', 'PruebaFInalEvaluacion2', 'PruebaFInalEvaluacion3', 'S', 'PruebaFInalEvaluacion', NULL, 'HARU', '2024-05-06 02:18:29', 'HARU', '2024-05-07 04:01:13', 'A'),
(2, 9, 15, 22, 91, 151, 9, 'PruebaFInalEvaluacion', 12.00, '12', '12', 12.00, ' PruebaFInalEvaluacion', 'PruebaFInalEvaluacion2', 'PruebaFInalEvaluacion3', 'S', 'PruebaFInalEvaluacion', NULL, 'HARU', '2024-05-06 02:18:29', 'HARU', '2024-05-06 02:27:42', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_unidad_productora`
--

CREATE TABLE `tbl_unidad_productora` (
  `Id_Ubicacion` bigint(20) NOT NULL,
  `Id_Ficha` bigint(20) DEFAULT NULL,
  `Id_Unidad_Productiva` bigint(20) NOT NULL,
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
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_unidad_productora`
--

INSERT INTO `tbl_unidad_productora` (`Id_Ubicacion`, `Id_Ficha`, `Id_Unidad_Productiva`, `Id_Productor`, `Tipo_De_Manejo`, `Superficie_Produccion`, `Id_Medida_Produccion`, `Superficie_Agricultura`, `Id_Medida_Agricultura`, `rubro_agricultura`, `Superficie_Ganaderia`, `Id_Medida_Ganaderia`, `rubro_ganaderia`, `Superficie_Apicultura`, `Id_Medida_Apicultura`, `Superficie_Forestal`, `Id_Medida_Forestal`, `rubro_forestal`, `Id_Superficie_Acuacultura`, `Superficie_Acuacultura`, `Numero_Estanques`, `Id_Superficie_Agroturismo`, `Superficie_Agroturismo`, `Superficie_Otros`, `Otros_Descripcion`, `Descripcion`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `estado`) VALUES
(14, 1, 14, 8, 'Propia', NULL, 21, 21.00, 100, 'prueba', 100.00, 21, 'prueba', 100.00, 21, 100.00, 21, 'prueba', 21, 100.00, 100, 21, 100.00, NULL, 'prueba', NULL, 'HARU', '2024-05-06 02:21:59', 'HARU', '2024-05-07 04:02:02', 'A'),
(15, 2, 15, 9, 'Propia', NULL, 21, 21.00, 100, 'prueba', 100.00, 21, 'prueba', 100.00, 21, 100.00, 21, 'prueba', 21, 100.00, 100, 21, 100.00, NULL, 'prueba', NULL, 'HARU', '2024-05-06 02:21:59', 'HARU', '2024-05-06 02:28:09', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_venta_pecuario`
--

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
  `Estado` enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_venta_pecuario`
--

INSERT INTO `tbl_venta_pecuario` (`Id_ficha`, `Id_productor`, `Tipo_pecurio`, `Precio_venta`, `Unidad_medida`, `Mercado`, `Creado_Por`, `Fecha_creacion`, `Actualizado_por`, `Fecha_Actualizacion`, `Estado`) VALUES
(2, 9, 11, 100, 21, 'prueba', 'HARU', '2024-05-06 02:28:39', NULL, '2024-05-06 02:28:39', 'A'),
(1, 8, 11, 100, 21, 'prueba', 'HARU', '2024-05-07 04:02:17', NULL, '2024-05-07 04:02:17', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_Usuario` bigint(20) NOT NULL,
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
  `Intentos_Fallidos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id_Usuario`, `id_rol`, `nombre_completo`, `correo`, `usuario`, `contrasena`, `Token`, `Fecha_Vencimiento_Token`, `fecha_creacion`, `Actualizado_Por`, `Fecha_Actualizacion`, `Preguntas_Contestadas`, `Estado`, `id_estado`, `Primera_Vez`, `fecha_vencimiento`, `Intentos_Preguntas`, `Preguntas_Correctas`, `Intentos_Fallidos`) VALUES
(1, 1, 'manuel', 'manuel@gmail.com', 'manu', '123', '1', NULL, '2023-10-29 01:48:15', 1, '2023-10-30 01:48:15', 1, 'ACTIVO', 1, 'SI', '2023-10-31 06:00:00', NULL, NULL, 1),
(9, 1, 'MANUEL FIGUEROA', 'manuelfigueroa2818@gmail.com', 'HARU', '$2y$10$zRXi8ImgUMfdkZsNdySI9ewwh2FyTNdzZiFWux.DdA7g/33DnadOW', NULL, NULL, '2023-12-10 14:00:24', 0, '2023-12-10 07:00:24', 0, 'ACTIVO', 1, 'SI', '1970-01-01 07:00:00', NULL, NULL, 0),
(11, 2, 'MANUEL FIGUEROA BARAHONA', 'mdfigueroa@unah.hn', 'MANUBARA', '$2y$10$UF/ahTJn5okUojk8aTN/uOiuWNJ2AnDdySKNNewLKLaC7WtZORzTu', NULL, NULL, '2023-12-10 22:25:54', 0, '2023-12-10 15:25:54', 0, 'ACTIVO', 1, 'SI', '2024-12-04 22:25:54', NULL, NULL, 0),
(13, 1, 'Enrique', 'manuelfigueroa2818@gmail.com', 'Enri', '$2y$10$pwhObKfogmDRxnB57iSfr.ux6s2E3HJYB6snkAg8LXmRaxrOAfiK6', NULL, NULL, '2024-02-18 20:26:49', 0, '2024-02-18 20:26:49', 0, 'ACTIVO', 4, 'SI', '2024-02-18 20:26:49', NULL, NULL, NULL),
(14, 1, 'USUARIO', 'usuario@usuario.com', 'USUARIO', '$2y$10$LVE7hGMrlZWH/HaRI5HBi.LZRKjNwUzXVvBUnEDpvQeZoZi78DTHS', NULL, NULL, '2024-04-29 01:25:52', 0, '2024-04-28 17:25:52', 0, 'ACTIVO', 1, 'SI', '2025-04-24 01:25:52', NULL, NULL, 0),
(19, 27, 'PRUEBAS DEL SISTEMA', 'manufigue@gmail.com', 'SIstem', '$2y$10$vJsLSh/KcL4QnGYEOxTrb.g4cXnsSiw3zSs2lVitIqZegX4is5t3.', NULL, NULL, '2024-05-02 22:43:12', 0, '2024-05-02 22:43:12', 0, 'ACTIVO', 1, 'SI', '2024-05-02 22:43:12', NULL, NULL, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacoras`
--
ALTER TABLE `bitacoras`
  ADD PRIMARY KEY (`id_bitacora`);

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
-- Indices de la tabla `historial_contrasenas`
--
ALTER TABLE `historial_contrasenas`
  ADD PRIMARY KEY (`id_historial`),
  ADD UNIQUE KEY `usuario_contraseña_unico` (`usuario_id`,`contrasena_hash`);

--
-- Indices de la tabla `objetos`
--
ALTER TABLE `objetos`
  ADD PRIMARY KEY (`Id_objetos`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`Id_parametros`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permisos`),
  ADD KEY `id_rol` (`Id_rol`) USING BTREE,
  ADD KEY `id_objeto` (`id_objeto`),
  ADD KEY `Id_rol_2` (`Id_rol`);

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
  ADD KEY `fk_municipio_aldeas` (`Id_Municipio`),
  ADD KEY `fk_departamento_aldeas` (`Id_Departamento`);

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
-- Indices de la tabla `tbl_base_organizacion`
--
ALTER TABLE `tbl_base_organizacion`
  ADD PRIMARY KEY (`id_pertenece_organizacion`),
  ADD KEY `fk_id_productor_base_organizacion` (`id_productor`),
  ADD KEY `fk_id_ficha_base_organizacion` (`id_ficha`);

--
-- Indices de la tabla `tbl_cacerios`
--
ALTER TABLE `tbl_cacerios`
  ADD PRIMARY KEY (`Id_Cacerio`),
  ADD KEY `fk_aldea_cacerios` (`Id_Aldea`),
  ADD KEY `fk_municipio_cacerios` (`Id_Municipio`),
  ADD KEY `fk_departamento_cacerios` (`Id_Departamento`);

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
  ADD KEY `fk_id_fuente_credito` (`id_fuente_credito`),
  ADD KEY `fk_id_ficha_credito_produccion` (`id_ficha`),
  ADD KEY `fk_id_productor_credito_produccion` (`id_productor`),
  ADD KEY `fk_id_motivos_no_credito` (`id_motivos_no_credito`);

--
-- Indices de la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  ADD PRIMARY KEY (`Id_Departamento`);

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
-- Indices de la tabla `tbl_ingreso_familiar`
--
ALTER TABLE `tbl_ingreso_familiar`
  ADD PRIMARY KEY (`Id_Ingreso_Familiar`),
  ADD KEY `FK_Id_Productor_Ingreso_Familiar` (`Id_Productor`),
  ADD KEY `FK_Id_Tipo_Negocio_Ingreso_Familiar` (`Id_Tipo_Negocio`),
  ADD KEY `FK_Id_Periodo_Ingreso_Ingreso_Familiar` (`Id_Periodo_Ingreso`),
  ADD KEY `FK_Id_Ficha_Ingreso_Familiar` (`Id_Ficha`);

--
-- Indices de la tabla `tbl_manejo_riego`
--
ALTER TABLE `tbl_manejo_riego`
  ADD PRIMARY KEY (`Id_Manejo_Riego`),
  ADD KEY `FK_Id_Ficha_Manejo_Riego` (`Id_Ficha`),
  ADD KEY `FK_Id_Ubicacion_Manejo_Riego` (`Id_Ubicacion`),
  ADD KEY `FK_Id_Productor_Manejo_Riego` (`Id_Productor`),
  ADD KEY `FK_Id_Medida_Superficie_Riego` (`Id_Medida_Superficie_Riego`),
  ADD KEY `FK_Id_Tipo_Riego` (`Id_Tipo_Riego`);

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
-- Indices de la tabla `tbl_motivos_no_creditos`
--
ALTER TABLE `tbl_motivos_no_creditos`
  ADD PRIMARY KEY (`id_motivos_no_credito`);

--
-- Indices de la tabla `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  ADD PRIMARY KEY (`Id_Municipio`),
  ADD KEY `fk_municipios_departamento` (`Id_Departamento`);

--
-- Indices de la tabla `tbl_no_creditos`
--
ALTER TABLE `tbl_no_creditos`
  ADD PRIMARY KEY (`id_nocred`),
  ADD KEY `fk_id_fichal_no_creditos` (`id_ficha`),
  ADD KEY `fk_id_productorl_no_creditos` (`id_productor`),
  ADD KEY `fk_id_motivos_no_credito1` (`id_motivos_no_credito`);

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
-- Indices de la tabla `tbl_parametros`
--
ALTER TABLE `tbl_parametros`
  ADD PRIMARY KEY (`id_parametros`);

--
-- Indices de la tabla `tbl_periodicidad`
--
ALTER TABLE `tbl_periodicidad`
  ADD PRIMARY KEY (`id_periodo`);

--
-- Indices de la tabla `tbl_practicas_por_produccion`
--
ALTER TABLE `tbl_practicas_por_produccion`
  ADD PRIMARY KEY (`Id_Practica_Produccion`),
  ADD KEY `FK_Id_Ficha_Practica_Produccion` (`Id_Ficha`),
  ADD KEY `FK_Id_Productor_Practica_Produccion` (`Id_Productor`),
  ADD KEY `FK_Id_Tipo_Practica_Practica_Produccion` (`Id_Tipo_Practica`);

--
-- Indices de la tabla `tbl_produccion_agricola_anterior`
--
ALTER TABLE `tbl_produccion_agricola_anterior`
  ADD PRIMARY KEY (`Id_Produccion_Anterior`),
  ADD KEY `FK_Id_Ficha_Produccion_Anterior` (`Id_Ficha`),
  ADD KEY `FK_Id_Ubicacion_Produccion_Anterior` (`Id_Ubicacion`),
  ADD KEY `FK_Id_Productor_Produccion_Anterior` (`Id_Productor`),
  ADD KEY `FK_Id_Tipo_Cultivo_Produccion_Anterior` (`Id_Tipo_Cultivo`),
  ADD KEY `FK_Id_Medida_Primera_Postrera` (`Id_Medida_Primera_Postrera`),
  ADD KEY `FK_Id_Medida_Produccion_Obtenida` (`Id_Medida_Produccion_Obtenida`),
  ADD KEY `FK_Id_Medida_Vendida` (`Id_Medida_Vendida`);

--
-- Indices de la tabla `tbl_produccion_comercializacion`
--
ALTER TABLE `tbl_produccion_comercializacion`
  ADD PRIMARY KEY (`Id_Produccion_Comercio`),
  ADD KEY `FK_Id_Ficha_Produccion_Comercio` (`Id_Ficha`),
  ADD KEY `FK_Id_Ubicacion_Produccion_Comercio` (`Id_Ubicacion`),
  ADD KEY `FK_Id_Productor_Produccion_Comercio` (`Id_Productor`),
  ADD KEY `FK_Id_Tipo_Produccion_Produccion_Comercio` (`Id_Tipo_Produccion`),
  ADD KEY `FK_Id_Medida_Produccion_Produccion_Comercio` (`Id_Medida_Produccion`),
  ADD KEY `FK_Id_Medida_Venta_Produccion_Comercio` (`Id_Medida_Venta`);

--
-- Indices de la tabla `tbl_produccion_pecuaria`
--
ALTER TABLE `tbl_produccion_pecuaria`
  ADD PRIMARY KEY (`Id_Produccion_Pecuaria`),
  ADD KEY `FK_Id_Ubicacion_Produccion_Pecuaria` (`Id_Ubicacion`),
  ADD KEY `FK_Id_Productor_Produccion_Pecuaria` (`Id_Productor`),
  ADD KEY `FK_Id_Tipo_Pecuario_Produccion_Pecuaria` (`Id_Tipo_Pecuario`),
  ADD KEY `FK_Id_Ficha_Produccion_Pecuaria` (`Id_Ficha`);

--
-- Indices de la tabla `tbl_produccion_vendida`
--
ALTER TABLE `tbl_produccion_vendida`
  ADD PRIMARY KEY (`Id_Produccion_Vendida`),
  ADD KEY `FK_Id_Tipo_Pecuario_Produccion_Vendida` (`Id_Tipo_Pecuario`),
  ADD KEY `FK_Id_Medida_Venta_Produccion_Vendida` (`Id_Medida_Venta`);

--
-- Indices de la tabla `tbl_productor`
--
ALTER TABLE `tbl_productor`
  ADD PRIMARY KEY (`id_productor`) USING BTREE;

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
-- Indices de la tabla `tbl_siembra`
--
ALTER TABLE `tbl_siembra`
  ADD PRIMARY KEY (`Id_siembra`);

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
-- Indices de la tabla `tbl_tipo_pecuarios`
--
ALTER TABLE `tbl_tipo_pecuarios`
  ADD PRIMARY KEY (`id_tipo_pecuario`);

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
  ADD KEY `id_productor` (`id_productor`),
  ADD KEY `fk_id_ficha_ubicacion` (`id_ficha`),
  ADD KEY `fk_departamento_ubicacion_productor` (`Id_Departamento`),
  ADD KEY `fk_municipio_ubicacion_productor` (`Id_Municipio`),
  ADD KEY `fk_aldea_ubicacion_productor` (`Id_Aldea`),
  ADD KEY `fk_cacerio_ubicacion_productor` (`Id_Cacerio`);

--
-- Indices de la tabla `tbl_unidad_productora`
--
ALTER TABLE `tbl_unidad_productora`
  ADD PRIMARY KEY (`Id_Unidad_Productiva`),
  ADD KEY `FK_Id_Ficha_Unidad_Productora` (`Id_Ficha`),
  ADD KEY `FK_Id_Ubicacion_Unidad_Productora` (`Id_Ubicacion`),
  ADD KEY `FK_Id_Productor_Unidad_Productora` (`Id_Productor`),
  ADD KEY `FK_Id_Medida_Produccion` (`Id_Medida_Produccion`),
  ADD KEY `FK_Id_Medida_Agricultura` (`Id_Medida_Agricultura`),
  ADD KEY `FK_Id_Medida_Ganaderia` (`Id_Medida_Ganaderia`),
  ADD KEY `FK_Id_Medida_Apicultura` (`Id_Medida_Apicultura`),
  ADD KEY `FK_Id_Medida_Forestal` (`Id_Medida_Forestal`);

--
-- Indices de la tabla `tbl_venta_pecuario`
--
ALTER TABLE `tbl_venta_pecuario`
  ADD KEY `fk_tipo_pecuario` (`Tipo_pecurio`),
  ADD KEY `fk_unidad_medida` (`Unidad_medida`),
  ADD KEY `fk_id_ficha_tbl_venta_pecuario` (`Id_ficha`),
  ADD KEY `fk_id_productor_tbl_venta_pecuario` (`Id_productor`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_Usuario`),
  ADD KEY `Estado` (`id_estado`),
  ADD KEY `Rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacoras`
--
ALTER TABLE `bitacoras`
  MODIFY `id_bitacora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=767;

--
-- AUTO_INCREMENT de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  MODIFY `id_estado` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `historial_contrasenas`
--
ALTER TABLE `historial_contrasenas`
  MODIFY `id_historial` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `objetos`
--
ALTER TABLE `objetos`
  MODIFY `Id_objetos` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `Id_parametros` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permisos` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `Id_pregunta` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `preguntas_usuario`
--
ALTER TABLE `preguntas_usuario`
  MODIFY `Id_Pregunta_U` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `Id_rol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `tbl_aldeas`
--
ALTER TABLE `tbl_aldeas`
  MODIFY `Id_Aldea` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT de la tabla `tbl_apoyos`
--
ALTER TABLE `tbl_apoyos`
  MODIFY `id_apoyo_produccion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_apoyos_produccion`
--
ALTER TABLE `tbl_apoyos_produccion`
  MODIFY `id_apoyo_prod` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `tbl_apoyo_actividad_externa`
--
ALTER TABLE `tbl_apoyo_actividad_externa`
  MODIFY `id_apoyo_ext` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tbl_base_organizacion`
--
ALTER TABLE `tbl_base_organizacion`
  MODIFY `id_pertenece_organizacion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tbl_cacerios`
--
ALTER TABLE `tbl_cacerios`
  MODIFY `Id_Cacerio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbl_composicion`
--
ALTER TABLE `tbl_composicion`
  MODIFY `id_composicion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `tbl_credito_produccion`
--
ALTER TABLE `tbl_credito_produccion`
  MODIFY `id_credpro` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  MODIFY `Id_Departamento` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `tbl_etnias`
--
ALTER TABLE `tbl_etnias`
  MODIFY `id_etnia` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tbl_etnias_por_productor`
--
ALTER TABLE `tbl_etnias_por_productor`
  MODIFY `Id_etnicidad` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tbl_fuentes_credito`
--
ALTER TABLE `tbl_fuentes_credito`
  MODIFY `id_fuente_credito` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tbl_ingreso_familiar`
--
ALTER TABLE `tbl_ingreso_familiar`
  MODIFY `Id_Ingreso_Familiar` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `tbl_manejo_riego`
--
ALTER TABLE `tbl_manejo_riego`
  MODIFY `Id_Manejo_Riego` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tbl_medidas_tierra`
--
ALTER TABLE `tbl_medidas_tierra`
  MODIFY `id_medida` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `tbl_migracion_familiar`
--
ALTER TABLE `tbl_migracion_familiar`
  MODIFY `id_migracion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de la tabla `tbl_motivos_migracion`
--
ALTER TABLE `tbl_motivos_migracion`
  MODIFY `Id_motivo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tbl_motivos_no_creditos`
--
ALTER TABLE `tbl_motivos_no_creditos`
  MODIFY `id_motivos_no_credito` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  MODIFY `Id_Municipio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT de la tabla `tbl_no_creditos`
--
ALTER TABLE `tbl_no_creditos`
  MODIFY `id_nocred` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_organizaciones`
--
ALTER TABLE `tbl_organizaciones`
  MODIFY `id_organizacion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tbl_organizaciones_por_productor`
--
ALTER TABLE `tbl_organizaciones_por_productor`
  MODIFY `Id_Organizacion_Productor` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `tbl_parametros`
--
ALTER TABLE `tbl_parametros`
  MODIFY `id_parametros` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_periodicidad`
--
ALTER TABLE `tbl_periodicidad`
  MODIFY `id_periodo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tbl_practicas_por_produccion`
--
ALTER TABLE `tbl_practicas_por_produccion`
  MODIFY `Id_Practica_Produccion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de la tabla `tbl_produccion_agricola_anterior`
--
ALTER TABLE `tbl_produccion_agricola_anterior`
  MODIFY `Id_Produccion_Anterior` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tbl_produccion_comercializacion`
--
ALTER TABLE `tbl_produccion_comercializacion`
  MODIFY `Id_Produccion_Comercio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `tbl_produccion_pecuaria`
--
ALTER TABLE `tbl_produccion_pecuaria`
  MODIFY `Id_Produccion_Pecuaria` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `tbl_produccion_vendida`
--
ALTER TABLE `tbl_produccion_vendida`
  MODIFY `Id_Produccion_Vendida` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_productor`
--
ALTER TABLE `tbl_productor`
  MODIFY `id_productor` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tbl_productor_actividad_externa`
--
ALTER TABLE `tbl_productor_actividad_externa`
  MODIFY `id_actividad_ext` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `tbl_relevo_organizacion`
--
ALTER TABLE `tbl_relevo_organizacion`
  MODIFY `Id_Relevo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tbl_siembra`
--
ALTER TABLE `tbl_siembra`
  MODIFY `Id_siembra` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_tipos_apoyos`
--
ALTER TABLE `tbl_tipos_apoyos`
  MODIFY `id_tipo_apoyos` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tbl_tipos_apoyo_produccion`
--
ALTER TABLE `tbl_tipos_apoyo_produccion`
  MODIFY `id_apoyo_produccion` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_cultivo`
--
ALTER TABLE `tbl_tipo_cultivo`
  MODIFY `id_tipo_cultivo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_negocios`
--
ALTER TABLE `tbl_tipo_negocios`
  MODIFY `id_tipo_negocio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_organizacion`
--
ALTER TABLE `tbl_tipo_organizacion`
  MODIFY `id_tipo_organizacion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_pecuarios`
--
ALTER TABLE `tbl_tipo_pecuarios`
  MODIFY `id_tipo_pecuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_practicas_productivas`
--
ALTER TABLE `tbl_tipo_practicas_productivas`
  MODIFY `id_tipo_practica` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_produccion`
--
ALTER TABLE `tbl_tipo_produccion`
  MODIFY `id_tipo_produccion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_riego`
--
ALTER TABLE `tbl_tipo_riego`
  MODIFY `id_tipo_riego` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_trabajadores`
--
ALTER TABLE `tbl_tipo_trabajadores`
  MODIFY `id_tipo_trabajador` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_toma_decisiones`
--
ALTER TABLE `tbl_toma_decisiones`
  MODIFY `id_tipo_tomador` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tbl_trabajadores_externos`
--
ALTER TABLE `tbl_trabajadores_externos`
  MODIFY `id_trabajador_ext` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_ubicacion_productor`
--
ALTER TABLE `tbl_ubicacion_productor`
  MODIFY `id_ubicacion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tbl_unidad_productora`
--
ALTER TABLE `tbl_unidad_productora`
  MODIFY `Id_Unidad_Productiva` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Usuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

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
  ADD CONSTRAINT `fk_departamento_aldeas` FOREIGN KEY (`Id_Departamento`) REFERENCES `tbl_departamentos` (`Id_Departamento`),
  ADD CONSTRAINT `fk_municipio_aldeas` FOREIGN KEY (`Id_Municipio`) REFERENCES `tbl_municipios` (`Id_Municipio`);

--
-- Filtros para la tabla `tbl_apoyos_produccion`
--
ALTER TABLE `tbl_apoyos_produccion`
  ADD CONSTRAINT `fk_id_ficha_apoyos_produccion` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `fk_id_productor_apoyos_produccion` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`);

--
-- Filtros para la tabla `tbl_apoyo_actividad_externa`
--
ALTER TABLE `tbl_apoyo_actividad_externa`
  ADD CONSTRAINT `fk_id_ficha_apoyo_actividad_extern` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `fk_id_productor_apoyo_actividad_extern` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`);

--
-- Filtros para la tabla `tbl_cacerios`
--
ALTER TABLE `tbl_cacerios`
  ADD CONSTRAINT `fk_aldea_cacerios` FOREIGN KEY (`Id_Aldea`) REFERENCES `tbl_aldeas` (`Id_Aldea`),
  ADD CONSTRAINT `fk_departamento_cacerios` FOREIGN KEY (`Id_Departamento`) REFERENCES `tbl_departamentos` (`Id_Departamento`),
  ADD CONSTRAINT `fk_municipio_cacerios` FOREIGN KEY (`Id_Municipio`) REFERENCES `tbl_municipios` (`Id_Municipio`);

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
  ADD CONSTRAINT `fk_id_motivos_no_credito` FOREIGN KEY (`id_motivos_no_credito`) REFERENCES `tbl_motivos_no_creditos` (`id_motivos_no_credito`),
  ADD CONSTRAINT `fk_id_productor_credito_produccion` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`);

--
-- Filtros para la tabla `tbl_etnias_por_productor`
--
ALTER TABLE `tbl_etnias_por_productor`
  ADD CONSTRAINT `fk_etnias_fichas` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `tbl_etnias_por_productor_ibfk_1` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `tbl_etnias_por_productor_ibfk_2` FOREIGN KEY (`id_etnia`) REFERENCES `tbl_etnias` (`id_etnia`);

--
-- Filtros para la tabla `tbl_ingreso_familiar`
--
ALTER TABLE `tbl_ingreso_familiar`
  ADD CONSTRAINT `FK_Id_Ficha_Ingreso_Familiar` FOREIGN KEY (`Id_Ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `FK_Id_Productor_Ingreso_Familiar` FOREIGN KEY (`Id_Productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `FK_Id_Tipo_Negocio_Ingreso_Familiar` FOREIGN KEY (`Id_Tipo_Negocio`) REFERENCES `tbl_tipo_negocios` (`id_tipo_negocio`);

--
-- Filtros para la tabla `tbl_manejo_riego`
--
ALTER TABLE `tbl_manejo_riego`
  ADD CONSTRAINT `FK_Id_Ficha_Manejo_Riego` FOREIGN KEY (`Id_Ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `FK_Id_Productor_Manejo_Riego` FOREIGN KEY (`Id_Productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `FK_Id_Tipo_Riego` FOREIGN KEY (`Id_Tipo_Riego`) REFERENCES `tbl_tipo_riego` (`id_tipo_riego`),
  ADD CONSTRAINT `FK_Id_Ubicacion_Manejo_Riego` FOREIGN KEY (`Id_Ubicacion`) REFERENCES `tbl_ubicacion_productor` (`id_ubicacion`);

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
  ADD CONSTRAINT `fk_municipios_departamento` FOREIGN KEY (`Id_Departamento`) REFERENCES `tbl_departamentos` (`Id_Departamento`);

--
-- Filtros para la tabla `tbl_no_creditos`
--
ALTER TABLE `tbl_no_creditos`
  ADD CONSTRAINT `fk_id_fichal_no_creditos` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `fk_id_motivos_no_credito1` FOREIGN KEY (`id_motivos_no_credito`) REFERENCES `tbl_motivos_no_creditos` (`id_motivos_no_credito`),
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
-- Filtros para la tabla `tbl_practicas_por_produccion`
--
ALTER TABLE `tbl_practicas_por_produccion`
  ADD CONSTRAINT `FK_Id_Ficha_Practica_Produccion` FOREIGN KEY (`Id_Ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `FK_Id_Productor_Practica_Produccion` FOREIGN KEY (`Id_Productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `FK_Id_Tipo_Practica_Practica_Produccion` FOREIGN KEY (`Id_Tipo_Practica`) REFERENCES `tbl_tipo_practicas_productivas` (`id_tipo_practica`);

--
-- Filtros para la tabla `tbl_produccion_agricola_anterior`
--
ALTER TABLE `tbl_produccion_agricola_anterior`
  ADD CONSTRAINT `FK_Id_Ficha_Produccion_Anterior` FOREIGN KEY (`Id_Ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `FK_Id_Medida_Primera_Postrera` FOREIGN KEY (`Id_Medida_Primera_Postrera`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  ADD CONSTRAINT `FK_Id_Medida_Produccion_Obtenida` FOREIGN KEY (`Id_Medida_Produccion_Obtenida`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  ADD CONSTRAINT `FK_Id_Medida_Vendida` FOREIGN KEY (`Id_Medida_Vendida`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  ADD CONSTRAINT `FK_Id_Tipo_Cultivo_Produccion_Anterior` FOREIGN KEY (`Id_Tipo_Cultivo`) REFERENCES `tbl_tipo_cultivo` (`id_tipo_cultivo`),
  ADD CONSTRAINT `FK_Id_Ubicacion_Produccion_Anterior` FOREIGN KEY (`Id_Ubicacion`) REFERENCES `tbl_ubicacion_productor` (`id_ubicacion`);

--
-- Filtros para la tabla `tbl_produccion_comercializacion`
--
ALTER TABLE `tbl_produccion_comercializacion`
  ADD CONSTRAINT `FK_Id_Ficha_Produccion_Comercio` FOREIGN KEY (`Id_Ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `FK_Id_Medida_Venta_Produccion_Comercio` FOREIGN KEY (`Id_Medida_Venta`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  ADD CONSTRAINT `FK_Id_Productor_Produccion_Comercio` FOREIGN KEY (`Id_Productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `FK_Id_Tipo_Produccion_Produccion_Comercio` FOREIGN KEY (`Id_Tipo_Produccion`) REFERENCES `tbl_tipo_produccion` (`id_tipo_produccion`),
  ADD CONSTRAINT `FK_Id_Ubicacion_Produccion_Comercio` FOREIGN KEY (`Id_Ubicacion`) REFERENCES `tbl_ubicacion_productor` (`id_ubicacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
