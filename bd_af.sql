-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2023 a las 18:32:28
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarApoyoActividadExterna` (IN `p_Id_Apoyo_Externo` BIGINT, IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Recibe_Apoyo_Produccion_Agricola` ENUM('S','N'), IN `p_Atencion_Por_UAG` ENUM('S','N'), IN `p_Productos_Vendidos_Por_Pralesc` ENUM('S','N'), IN `p_Descripcion` TEXT, IN `p_Modificado_Por` VARCHAR(255), IN `p_Nuevo_Estado` VARCHAR(50))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_apoyo_actividad_externa
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_apoyo_actividad_externa
        WHERE id_apoyo_ext = p_Id_Apoyo_Externo
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_apoyo_actividad_externa';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_apoyo_actividad_externa`
        SET
            `id_ficha` = p_Id_Ficha,
            `id_productor` = p_Id_Productor,
            `recibe_apoyo_prodagrícola` = p_Recibe_Apoyo_Produccion_Agricola,
            `atencion_por_UAG` = p_Atencion_Por_UAG,
            `productos_vendidospor_pralesc` = p_Productos_Vendidos_Por_Pralesc,
            `descripcion` = p_Descripcion,
            `modificado_por` = p_Modificado_Por,
            `fecha_modificacion` = CURRENT_TIMESTAMP(),
            `estado` = p_Nuevo_Estado
        WHERE
            `id_apoyo_ext` = p_Id_Apoyo_Externo;
    END IF;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarBaseOrganizacion` (IN `p_Id_Pertenece_Organizacion` BIGINT, IN `p_Id_Ficha` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Pertenece_A_Organizacion` ENUM('S','N'), IN `p_Descripcion` TEXT, IN `p_Modificado_Por` VARCHAR(50), IN `p_Nuevo_Estado` ENUM('A','I'))   BEGIN
    -- Verificar si el registro a actualizar existe en la tabla tbl_base_organizacion
    IF NOT EXISTS (
        SELECT 1
        FROM tbl_base_organizacion
        WHERE id_pertenece_organizacion = p_Id_Pertenece_Organizacion
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro a actualizar no existe en la tabla tbl_base_organizacion';
    ELSE
        -- Realizar la actualización
        UPDATE `tbl_base_organizacion`
        SET
            `id_ficha` = p_Id_Ficha,
            `id_productor` = p_Id_Productor,
            `pertenece_a_organizacion` = p_Pertenece_A_Organizacion,
            `descripcion` = p_Descripcion,
            `modificado_por` = p_Modificado_Por,
            `fecha_modificacion` = CURRENT_TIMESTAMP(),
            `estado` = p_Nuevo_Estado
        WHERE
            `id_pertenece_organizacion` = p_Id_Pertenece_Organizacion;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarMotivoNoCredito` (IN `id_motivo_no_credito_param` INT, IN `nuevo_motivo_no_credito` VARCHAR(255), IN `nueva_descripcion` TEXT, IN `modificado_por_param` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de modificación
    UPDATE `tbl_motivos_no_creditos`
    SET
        `motivo_no_credito` = nuevo_motivo_no_credito,
        `descripcion` = nueva_descripcion,
        `modificado_por` = modificado_por_param,
        `fecha_modificacion` = CURRENT_TIMESTAMP
    WHERE
        `id_motivos_no_credito` = id_motivo_no_credito_param;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarTipoPecuario` (IN `id_tipo_pecuario_param` BIGINT, IN `nuevo_tipo_pecuario` ENUM('b','o','c'), IN `nueva_raza_con_genero` ENUM('s','n'), IN `nueva_descripcion` TEXT, IN `modificado_por_param` VARCHAR(50), IN `nuevo_estado` ENUM('A','I'))   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAldea` (IN `p_Nombre_Aldea` VARCHAR(255), IN `p_Descripcion` VARCHAR(255), IN `p_Id_Municipio` BIGINT(20))   BEGIN
    INSERT INTO tbl_aldeas (Nombre_Aldea, Descripcion, Estado, Id_Municipio, Id_Usuario,
        Creado_Por, Fecha_Creacion, Modificado_Por, Fecha_Modificacion)
    VALUES (p_Nombre_Aldea, p_Descripcion, 'A', p_Id_Municipio, '1','1',CURRENT_TIMESTAMP(),'1',CURRENT_TIMESTAMP());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarApoyo` (IN `tipo_apoyo_produccion_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_apoyos` (`tipo_apoyo_produccion`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_apoyo_produccion_param, descripcion_param, 'Daniela', 'Daniela', 'ACTIVO');
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarFicha` (IN `p_Fecha_Solicitud` DATE, IN `p_Anio_Solicitud` INT, IN `p_Descripcion` VARCHAR(255), IN `p_Creado_Por` VARCHAR(50), IN `p_Fecha_Entrevista` DATE, IN `p_Nombre_Encuentrador` VARCHAR(50), IN `p_Nombre_Encuestador` VARCHAR(50), IN `p_Nombre_Supervisor` VARCHAR(50))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMedidaTierra` (IN `medida_param` ENUM('MZ','HA','TAREAS'), IN `descripcion_param` TEXT)   BEGIN
    
    
    INSERT INTO tbl_medidas_tierra (medida, descripcion, creado_por, modificado_por, estado) 
    VALUES (medida_param, descripcion_param, 'Daniela', 'Daniela', 'ACTIVO');

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMotivo` (IN `motivo_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_motivos_migracion` (`Motivo`, `Descripcion`,`Creado_por`,`Modificado_por` ,`Estado`) 
  VALUES (motivo_param, descripcion_param,'Manuel','Manuel','ACTIVO');
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMunicipio` (IN `p_Nombre_Municipio` VARCHAR(255), IN `p_Descripcion` VARCHAR(255), IN `p_Id_Departamento` BIGINT(20))   BEGIN
    INSERT INTO tbl_municipios (Nombre_Municipio, Descripcion, Estado, Id_Departamento, Id_Usuario,
        Creado_Por, Fecha_Creacion, Modificado_Por, Fecha_Modificacion)
    VALUES (p_Nombre_Municipio, p_Descripcion, 'A', p_Id_Departamento, '1','1',CURRENT_TIMESTAMP(),'1',CURRENT_TIMESTAMP());
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPracticas` (IN `tipo_practica_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_practicas_productivas` (`tipo_practica`, `descripcion`,`creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_practica_param, descripcion_param, 'Manuel', 'Manuel', 'ACTIVO');
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProduccionComercializacion` (IN `p_Id_Ficha` BIGINT, IN `p_Id_Ubicacion` BIGINT, IN `p_Id_Productor` BIGINT, IN `p_Id_Tipo_Produccion` BIGINT, IN `p_Cantidad_Produccion` DECIMAL(10,2), IN `p_Id_Medida_Produccion` BIGINT, IN `p_Cantidad_Vendida` DECIMAL(10,2), IN `p_Id_Medida_Venta` BIGINT, IN `p_Precio_Venta` DECIMAL(10,2), IN `p_A_Quien_Se_Vendio` VARCHAR(255), IN `p_Creado_Por` VARCHAR(255))   BEGIN
    -- Utiliza CURRENT_TIMESTAMP para la fecha de creación y modificación
    INSERT INTO `tbl_produccion_comercializacion` (
        `Id_Ficha`,
        `Id_Ubicacion`,
        `Id_Productor`,
        `Id_Tipo_Produccion`,
        `Cantidad_Produccion`,
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
        p_Cantidad_Produccion,
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoOrganizacion` (IN `tipo_organizacion_param` VARCHAR(255), IN `descripcion_param` TEXT)   BEGIN
  INSERT INTO `tbl_tipo_organizacion` (`tipo_organizacion`, `descripcion`, `creado_por`,`modificado_por` , `estado`) 
  VALUES (tipo_organizacion_param, descripcion_param, 'Kevin', 'Kevin', 'ACTIVO');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTipoPecuario` (IN `p_tipo_pecuario` ENUM('b','o','c'), IN `p_raza_con_genero` ENUM('s','n'), IN `p_descripcion` TEXT, IN `p_creado_por` VARCHAR(50))   BEGIN
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
(1, '2023-11-17', 2023, 'Prueba', 'manu', '2023-11-17 20:43:05', 'manu', '2023-12-01 04:16:28', 'I', '2023-11-17', 'manu', NULL, 'manu', NULL, 'manu', NULL),
(2, '2023-11-17', 2023, 'Prueba', 'manu', '2023-11-17 20:57:36', 'manu', '2023-12-01 04:17:22', 'A', '2023-11-17', 'manu', NULL, 'manu', NULL, 'manu', NULL),
(3, '2023-11-17', 2023, 'Creado', 'manu', '2023-11-20 06:00:21', 'manu', '2023-12-01 04:17:06', 'A', '2023-11-17', 'manu', NULL, 'manu', NULL, 'manu', NULL);

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
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_apoyos_produccion`
--

INSERT INTO `tbl_apoyos_produccion` (`id_apoyo_prod`, `id_ficha`, `id_productor`, `id_apoyo_produccion`, `otros_detalles`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 1, 1, 'otros detalles', 'descrip', 'manu', '2023-11-30 17:42:02', 'manu', '2023-11-30 17:42:02', 'A');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_apoyo_actividad_externa`
--

INSERT INTO `tbl_apoyo_actividad_externa` (`id_apoyo_ext`, `id_ficha`, `id_productor`, `recibe_apoyo_prodagrícola`, `atencion_por_UAG`, `productos_vendidospor_pralesc`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 1, 'S', 'S', 'S', 'descrip', 'manu', '2023-11-30 18:40:29', 'amnu', '2023-11-30 18:40:29', 'A');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_base_organizacion`
--

INSERT INTO `tbl_base_organizacion` (`id_pertenece_organizacion`, `id_ficha`, `id_productor`, `pertenece_a_organizacion`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 1, 'S', 'descrt', 'manu', '2023-11-30 23:00:51', 'manu', '2023-11-30 23:00:51', 'A');

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
  `id_motivos_no_credito` bigint(20) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_credito_produccion`
--

INSERT INTO `tbl_credito_produccion` (`id_credpro`, `id_ficha`, `id_productor`, `ha_solicitado_creditos`, `id_fuente_credito`, `monto_credito`, `id_motivos_no_credito`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 1, 'S', 1, 10000.00, 1, 'descrip', 'manu', '2023-11-30 06:36:23', 'manu', '2023-11-30 06:36:23', 'A');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_ingreso_familiar`
--

INSERT INTO `tbl_ingreso_familiar` (`Id_Ficha`, `Id_Productor`, `Id_Ingreso_Familiar`, `Id_Tipo_Negocio`, `Total_Ingreso`, `Id_Periodo_Ingreso`, `Descripcion_Otros`, `Descripcion`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `estado`) VALUES
(1, 1, 1, 1, 10000.00, 1, 'otros', 'descr', 'manu', '2023-11-30 20:41:42', 'manu', '2023-11-30 20:41:42', 'A');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_manejo_riego`
--

INSERT INTO `tbl_manejo_riego` (`Id_Manejo_Riego`, `Id_Ficha`, `Id_Ubicacion`, `Id_Productor`, `Tiene_Riego`, `Superficie_Riego`, `Id_Medida_Superficie_Riego`, `Id_Tipo_Riego`, `Fuente_Agua`, `Disponibilidad_Agua_Meses`, `Descripcion`, `Id_Usuario`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `Estado`) VALUES
(1, 1, 1, 1, 'S', 10.20, 2, 1, 'pozo', 4, 'prueba', NULL, 'manu', '2023-11-27 06:38:13', 'manu', '2023-11-27 06:38:13', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_medidas_tierra`
--

CREATE TABLE `tbl_medidas_tierra` (
  `id_medida` bigint(20) NOT NULL,
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
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_migracion_familiar`
--

INSERT INTO `tbl_migracion_familiar` (`id_ficha`, `id_productor`, `id_migracion`, `tiene_migrantes`, `migracion_dentro_pais`, `migracion_fuera_pais`, `id_tipo_motivos`, `remesas`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 1, 'S', 'N', 'S', 4, 'N', 'no tengo familiares en el extrajero', 'manu', '2023-12-01 02:35:42', 'manu', '2023-12-01 03:21:30', 'A'),
(2, 2, 2, 'N', 'S', 'S', 3, 'S', 'TierrasSana', 'manu', '2023-12-01 03:15:19', 'manu', '2023-12-01 03:21:39', 'A'),
(1, 1, 4, 'S', 'N', 'S', 1, 'N', 'TierrasSana1', 'manu', '2023-12-01 03:21:59', 'manu', '2023-12-01 03:22:16', 'A');

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
(8, 'edi', 'E3QERRR3E', 'Manuel', '2023-10-31 07:55:37', 'Manuel', '2023-11-22 06:04:15', 'A'),
(9, 's', 'asd', 'Manuel', '2023-11-01 05:51:35', 'Manuel', '2023-11-22 06:03:23', 'A');

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
(1, 'Estado de crédito critico', 'por no pagar ', 'manu', '2023-11-26 05:44:41', 'manu', '2023-11-26 05:46:17', 'I'),
(2, 'lista negra', 'por falta de pagos', 'manu', '2023-11-30 05:53:46', 'manu', '2023-11-30 05:53:46', 'A');

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
  `id_motivos_no_credito` bigint(20) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_no_creditos`
--

INSERT INTO `tbl_no_creditos` (`id_nocred`, `id_ficha`, `id_productor`, `id_motivos_no_credito`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 1, 1, 'no se', 'manu', '2023-11-30 05:18:26', 'manu', '2023-11-30 05:18:26', 'A');

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
(1, 'marzo', 'descr', 'Manuel', '2023-10-31 19:41:24', 'Manuel', '2023-11-22 06:06:30', 'A'),
(2, 'se', 'se', NULL, '2023-10-31 21:03:54', NULL, '2023-10-31 21:03:54', ''),
(3, 'e', 'e', NULL, '2023-10-31 21:17:57', NULL, '2023-10-31 21:33:04', ''),
(4, 'adsda', 'dfa', NULL, '2023-10-31 21:36:39', NULL, '2023-11-01 04:46:23', ''),
(9, 'rwewe', 'gdgd', 'Manuel', '2023-11-01 04:45:38', 'Manuel', '2023-11-01 06:07:37', ''),
(10, '', '', 'Manuel', '2023-11-07 04:42:54', 'Manuel', '2023-11-07 04:42:54', ''),
(11, '', '', 'Manuel', '2023-11-13 04:28:49', 'Manuel', '2023-11-13 04:28:49', ''),
(12, '', '', 'Manuel', '2023-11-16 04:35:41', 'Manuel', '2023-11-16 04:35:41', '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_practicas_por_produccion`
--

INSERT INTO `tbl_practicas_por_produccion` (`Id_Practica_Produccion`, `Id_Ficha`, `Id_Productor`, `Id_Tipo_Practica`, `Descripcion`, `Id_Usuario`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `estado`) VALUES
(1, 1, 1, 1, 'Siembre de Miaz', NULL, 'manu', '2023-11-27 04:18:18', 'manu', '2023-11-27 04:18:18', 'A');

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
  `Superficie_Primera_Postrera` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Primera_Postrera` bigint(20) DEFAULT NULL,
  `Produccion_Obtenida` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Produccion_Obtenida` bigint(20) DEFAULT NULL,
  `Cantidad_Vendida` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Vendida` bigint(20) DEFAULT NULL,
  `Precio_Venta` decimal(10,2) DEFAULT NULL,
  `A_Quien_Se_Vendio` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Id_Usuario` bigint(20) DEFAULT NULL,
  `Creado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_produccion_agricola_anterior`
--

INSERT INTO `tbl_produccion_agricola_anterior` (`Id_Produccion_Anterior`, `Id_Ficha`, `Id_Ubicacion`, `Id_Productor`, `Id_Tipo_Cultivo`, `Superficie_Primera_Postrera`, `Id_Medida_Primera_Postrera`, `Produccion_Obtenida`, `Id_Medida_Produccion_Obtenida`, `Cantidad_Vendida`, `Id_Medida_Vendida`, `Precio_Venta`, `A_Quien_Se_Vendio`, `Descripcion`, `Id_Usuario`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `Estado`) VALUES
(1, 1, 1, 1, 1, 12.00, 2, 100.00, 1, 10.00, 1, 1000.00, 'ale', 'descr', NULL, 'manu', '2023-11-27 08:58:20', 'manu', '2023-11-27 08:58:20', 'A'),
(2, 2, 1, 2, 1, 12.00, 1, 12.00, 1, 12.00, 1, 12.00, 'sdxsf', 'desc1', NULL, 'manu', '2023-11-28 08:31:23', NULL, '2023-11-28 08:31:23', 'A');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_produccion_comercializacion`
--

INSERT INTO `tbl_produccion_comercializacion` (`Id_Produccion_Comercio`, `Id_Ficha`, `Id_Ubicacion`, `Id_Productor`, `Id_Tipo_Produccion`, `Cantidad_Produccion`, `Id_Medida_Produccion`, `Cantidad_Vendida`, `Id_Medida_Venta`, `Precio_Venta`, `A_Quien_Se_Vendio`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `estado`) VALUES
(1, 1, 1, 1, 1, 12.00, 1, 10.00, 1, 1000.00, 'ale gomez', 'manu', '2023-11-29 09:00:16', 'manu', '2023-11-29 09:00:16', 'A');

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
  `Precio_Venta` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Venta` bigint(20) DEFAULT NULL,
  `Cantidad_Mercado` int(11) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Creado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_produccion_pecuaria`
--

INSERT INTO `tbl_produccion_pecuaria` (`Id_Produccion_Pecuaria`, `Id_Ficha`, `Id_Ubicacion`, `Id_Productor`, `Año_Produccion`, `Id_Tipo_Pecuario`, `Cantidad_Hembras`, `Cantidad_Machos`, `Cantidad_Total`, `Descripcion_Otros`, `Precio_Venta`, `Id_Medida_Venta`, `Cantidad_Mercado`, `Descripcion`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `Estado`) VALUES
(1, 1, 1, 1, 2023, 1, 10, 20, 30, 'asdased', 1000.00, 1, 12, 'descr', 'manu', '2023-11-29 04:58:38', 'manu', '2023-11-29 07:35:54', 'A');

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

--
-- Volcado de datos para la tabla `tbl_produccion_vendida`
--

INSERT INTO `tbl_produccion_vendida` (`Id_Produccion_Vendida`, `Año_Venta`, `Id_Tipo_Pecuario`, `Precio_Venta`, `Id_Medida_Venta`, `Cantidad_Mercado`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `Estado`) VALUES
(1, 2000, 1, 1000.00, 2, 12, 'manu', '2023-11-29 08:14:11', 'manu', '2023-11-29 08:14:11', 'A');

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
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_productor_actividad_externa`
--

INSERT INTO `tbl_productor_actividad_externa` (`id_actividad_ext`, `id_ficha`, `id_productor`, `miembros_realizan_actividades_fuera_finca`, `id_tomador_decisiones`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 1, 'S', 1, 'desvr', 'manu', '2023-11-30 08:03:46', 'manu', '2023-11-30 08:03:46', 'A');

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

--
-- Volcado de datos para la tabla `tbl_tipos_apoyo_produccion`
--

INSERT INTO `tbl_tipos_apoyo_produccion` (`id_apoyo_produccion`, `id_ficha`, `id_productor`, `id_tipos_apoyos`, `otros_detalles`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 1, 1, 1, 'banano', 'descrip', 'manu', '2023-11-30 09:45:30', 'manu', '2023-11-30 09:45:30', 'A');

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
  `id_tipo_negocio` bigint(20) NOT NULL,
  `tipo_negocio` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creado_por` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado_por` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipo_negocios`
--

INSERT INTO `tbl_tipo_negocios` (`id_tipo_negocio`, `tipo_negocio`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Granja', 'venta de huevos', '1', '2023-11-22 06:09:26', '1', '2023-11-22 06:09:26', 'A');

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
-- Estructura de tabla para la tabla `tbl_tipo_pecuarios`
--

CREATE TABLE `tbl_tipo_pecuarios` (
  `id_tipo_pecuario` bigint(20) NOT NULL,
  `tipo_pecuario` enum('b','o','c') NOT NULL,
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
(1, 'b', 's', 'asasa', 'manu', '2023-11-26 06:00:00', 'manu', NULL, 'A'),
(2, 'o', 's', 'prueba', 'manu', '2023-11-26 06:13:32', 'manu', '2023-11-26 06:13:32', 'I'),
(3, 'c', 's', 'desc', 'manu', '2023-11-26 06:29:31', NULL, '2023-11-26 06:30:00', 'A');

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
(1, 'Siembra', 'Maiz', '1', '2023-11-22 06:14:52', '1', '2023-11-22 06:14:52', 'A');

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
  `estado` enum('A','I') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_tipo_trabajadores`
--

INSERT INTO `tbl_tipo_trabajadores` (`id_tipo_trabajador`, `tipo_trabajador`, `descripcion`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `estado`) VALUES
(1, 'Ganadero', 'kkka', 'Daniela', '2023-11-22 06:17:22', 'Daniela', '2023-11-22 06:17:22', 'I'),
(2, 'Agricultor', '3 cultivos de papa', 'Daniela', '2023-11-22 06:17:27', 'Daniela', '2023-11-22 06:17:27', 'A');

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
(1, 'SAG', 'Se decidio por voto', 'Daniela', '2023-11-22 06:16:04', 'Daniela', '2023-11-22 06:16:04', 'A'),
(2, 'SAG 1', 'Creacion de base 1', 'Daniela', '2023-11-22 06:15:53', 'Daniela', '2023-11-22 06:15:53', 'A'),
(3, 'UPEG1', 'Pagos1', 'Daniela', '2023-11-22 06:15:58', 'Daniela', '2023-11-22 06:15:58', 'I');

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
  `Superficie_Ganaderia` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Ganaderia` bigint(20) DEFAULT NULL,
  `Superficie_Apicultura` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Apicultura` bigint(20) DEFAULT NULL,
  `Superficie_Forestal` decimal(10,2) DEFAULT NULL,
  `Id_Medida_Forestal` bigint(20) DEFAULT NULL,
  `Superficie_Acuacultura` decimal(10,2) DEFAULT NULL,
  `Numero_Estanques` int(11) DEFAULT NULL,
  `Superficie_Agroturismo` decimal(10,2) DEFAULT NULL,
  `Superficie_Otros` decimal(10,2) DEFAULT NULL,
  `Otros_Descripcion` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Id_Usuario` bigint(20) DEFAULT NULL,
  `Creado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modificado_Por` varchar(255) DEFAULT NULL,
  `Fecha_Modificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('A','I') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tbl_unidad_productora`
--

INSERT INTO `tbl_unidad_productora` (`Id_Ubicacion`, `Id_Ficha`, `Id_Unidad_Productiva`, `Id_Productor`, `Tipo_De_Manejo`, `Superficie_Produccion`, `Id_Medida_Produccion`, `Superficie_Agricultura`, `Id_Medida_Agricultura`, `Superficie_Ganaderia`, `Id_Medida_Ganaderia`, `Superficie_Apicultura`, `Id_Medida_Apicultura`, `Superficie_Forestal`, `Id_Medida_Forestal`, `Superficie_Acuacultura`, `Numero_Estanques`, `Superficie_Agroturismo`, `Superficie_Otros`, `Otros_Descripcion`, `Descripcion`, `Id_Usuario`, `Creado_Por`, `Fecha_Creacion`, `Modificado_Por`, `Fecha_Modificacion`, `estado`) VALUES
(1, 1, 1, 1, 'Propia', 10.10, 1, 21.00, 2, 10.00, 2, 25.00, 1, 10.00, 2, 45.00, 50, 41.00, 14.00, 'otros descripcion', 'desc', NULL, 'manu', '2023-11-23 06:16:24', 'manu', '2023-11-23 06:16:24', 'A'),
(2, 2, 2, 2, 'Propia', 10.20, 2, 12.00, 1, 13.00, 1, 14.00, 1, 15.00, 2, 10.00, 50, 21.00, 0.00, 'Descripción de Otros', 'Descripción ', NULL, 'manu', '2023-11-25 06:30:55', NULL, '2023-11-25 06:30:55', 'A'),
(2, 3, 3, 3, 'Alquilada', 10.20, 1, 12.00, 1, 13.00, 1, 14.00, 1, 15.00, 1, 10.00, 50, 21.00, 0.00, 'Descripción de Otros', 'Descripción', NULL, 'manu', '2023-11-25 06:48:11', NULL, '2023-11-25 06:48:11', 'A');

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
  ADD KEY `fk_id_fuente_credito` (`id_fuente_credito`),
  ADD KEY `fk_id_ficha_credito_produccion` (`id_ficha`),
  ADD KEY `fk_id_productor_credito_produccion` (`id_productor`),
  ADD KEY `fk_id_motivos_no_credito` (`id_motivos_no_credito`);

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
  ADD KEY `FK_Municipio_Usuario` (`Id_Usuario`),
  ADD KEY `FK_Municipio_Departamento` (`Id_Departamento`);

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
  ADD KEY `FK_Id_Medida_Venta_Produccion_Pecuaria` (`Id_Medida_Venta`),
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
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_municipio` (`id_municipio`),
  ADD KEY `id_aldea` (`id_aldea`),
  ADD KEY `id_caserio` (`id_caserio`),
  ADD KEY `id_productor` (`id_productor`),
  ADD KEY `fk_id_ficha_ubicacion` (`id_ficha`);

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
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_Usuario`),
  ADD KEY `Estado` (`Id_estado`),
  ADD KEY `Rol` (`Id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
ALTER TABLE `fichas`
  MODIFY `id_ficha` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
-- AUTO_INCREMENT de la tabla `tbl_apoyos_produccion`
--
ALTER TABLE `tbl_apoyos_produccion`
  MODIFY `id_apoyo_prod` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_apoyo_actividad_externa`
--
ALTER TABLE `tbl_apoyo_actividad_externa`
  MODIFY `id_apoyo_ext` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_base_organizacion`
--
ALTER TABLE `tbl_base_organizacion`
  MODIFY `id_pertenece_organizacion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_cacerios`
--
ALTER TABLE `tbl_cacerios`
  MODIFY `Id_Cacerio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tbl_credito_produccion`
--
ALTER TABLE `tbl_credito_produccion`
  MODIFY `id_credpro` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT de la tabla `tbl_ingreso_familiar`
--
ALTER TABLE `tbl_ingreso_familiar`
  MODIFY `Id_Ingreso_Familiar` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_manejo_riego`
--
ALTER TABLE `tbl_manejo_riego`
  MODIFY `Id_Manejo_Riego` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_medidas_tierra`
--
ALTER TABLE `tbl_medidas_tierra`
  MODIFY `id_medida` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_migracion_familiar`
--
ALTER TABLE `tbl_migracion_familiar`
  MODIFY `id_migracion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_motivos_migracion`
--
ALTER TABLE `tbl_motivos_migracion`
  MODIFY `Id_motivo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tbl_motivos_no_creditos`
--
ALTER TABLE `tbl_motivos_no_creditos`
  MODIFY `id_motivos_no_credito` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  MODIFY `Id_Municipio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbl_no_creditos`
--
ALTER TABLE `tbl_no_creditos`
  MODIFY `id_nocred` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_organizaciones`
--
ALTER TABLE `tbl_organizaciones`
  MODIFY `id_organizacion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_organizaciones_por_productor`
--
ALTER TABLE `tbl_organizaciones_por_productor`
  MODIFY `Id_Organizacion_Productor` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tbl_periodicidad`
--
ALTER TABLE `tbl_periodicidad`
  MODIFY `id_periodo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tbl_practicas_por_produccion`
--
ALTER TABLE `tbl_practicas_por_produccion`
  MODIFY `Id_Practica_Produccion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_produccion_agricola_anterior`
--
ALTER TABLE `tbl_produccion_agricola_anterior`
  MODIFY `Id_Produccion_Anterior` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_produccion_comercializacion`
--
ALTER TABLE `tbl_produccion_comercializacion`
  MODIFY `Id_Produccion_Comercio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_produccion_pecuaria`
--
ALTER TABLE `tbl_produccion_pecuaria`
  MODIFY `Id_Produccion_Pecuaria` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_produccion_vendida`
--
ALTER TABLE `tbl_produccion_vendida`
  MODIFY `Id_Produccion_Vendida` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_productor`
--
ALTER TABLE `tbl_productor`
  MODIFY `id_productor` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_productor_actividad_externa`
--
ALTER TABLE `tbl_productor_actividad_externa`
  MODIFY `id_actividad_ext` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT de la tabla `tbl_tipos_apoyo_produccion`
--
ALTER TABLE `tbl_tipos_apoyo_produccion`
  MODIFY `id_apoyo_produccion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_cultivo`
--
ALTER TABLE `tbl_tipo_cultivo`
  MODIFY `id_tipo_cultivo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_negocios`
--
ALTER TABLE `tbl_tipo_negocios`
  MODIFY `id_tipo_negocio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_organizacion`
--
ALTER TABLE `tbl_tipo_organizacion`
  MODIFY `id_tipo_organizacion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_pecuarios`
--
ALTER TABLE `tbl_tipo_pecuarios`
  MODIFY `id_tipo_pecuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_practicas_productivas`
--
ALTER TABLE `tbl_tipo_practicas_productivas`
  MODIFY `id_tipo_practica` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_produccion`
--
ALTER TABLE `tbl_tipo_produccion`
  MODIFY `id_tipo_produccion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_riego`
--
ALTER TABLE `tbl_tipo_riego`
  MODIFY `id_tipo_riego` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT de la tabla `tbl_trabajadores_externos`
--
ALTER TABLE `tbl_trabajadores_externos`
  MODIFY `id_trabajador_ext` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_unidad_productora`
--
ALTER TABLE `tbl_unidad_productora`
  MODIFY `Id_Unidad_Productiva` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Filtros para la tabla `tbl_base_organizacion`
--
ALTER TABLE `tbl_base_organizacion`
  ADD CONSTRAINT `fk_id_ficha_base_organizacion` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `fk_id_productor_base_organizacion` FOREIGN KEY (`id_productor`) REFERENCES `tbl_productor` (`id_productor`);

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
  ADD CONSTRAINT `fk_id_motivos_no_credito` FOREIGN KEY (`id_motivos_no_credito`) REFERENCES `tbl_motivos_no_creditos` (`id_motivos_no_credito`),
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
-- Filtros para la tabla `tbl_ingreso_familiar`
--
ALTER TABLE `tbl_ingreso_familiar`
  ADD CONSTRAINT `FK_Id_Ficha_Ingreso_Familiar` FOREIGN KEY (`Id_Ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `FK_Id_Periodo_Ingreso_Ingreso_Familiar` FOREIGN KEY (`Id_Periodo_Ingreso`) REFERENCES `tbl_periodicidad` (`id_periodo`),
  ADD CONSTRAINT `FK_Id_Productor_Ingreso_Familiar` FOREIGN KEY (`Id_Productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `FK_Id_Tipo_Negocio_Ingreso_Familiar` FOREIGN KEY (`Id_Tipo_Negocio`) REFERENCES `tbl_tipo_negocios` (`id_tipo_negocio`);

--
-- Filtros para la tabla `tbl_manejo_riego`
--
ALTER TABLE `tbl_manejo_riego`
  ADD CONSTRAINT `FK_Id_Ficha_Manejo_Riego` FOREIGN KEY (`Id_Ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `FK_Id_Medida_Superficie_Riego` FOREIGN KEY (`Id_Medida_Superficie_Riego`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
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
  ADD CONSTRAINT `FK_Municipio_Departamento` FOREIGN KEY (`Id_Departamento`) REFERENCES `tbl_departamentos` (`Id_Departamento`),
  ADD CONSTRAINT `FK_Municipio_Usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`);

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
  ADD CONSTRAINT `FK_Id_Productor_Produccion_Anterior` FOREIGN KEY (`Id_Productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `FK_Id_Tipo_Cultivo_Produccion_Anterior` FOREIGN KEY (`Id_Tipo_Cultivo`) REFERENCES `tbl_tipo_cultivo` (`id_tipo_cultivo`),
  ADD CONSTRAINT `FK_Id_Ubicacion_Produccion_Anterior` FOREIGN KEY (`Id_Ubicacion`) REFERENCES `tbl_ubicacion_productor` (`id_ubicacion`);

--
-- Filtros para la tabla `tbl_produccion_comercializacion`
--
ALTER TABLE `tbl_produccion_comercializacion`
  ADD CONSTRAINT `FK_Id_Ficha_Produccion_Comercio` FOREIGN KEY (`Id_Ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `FK_Id_Medida_Produccion_Produccion_Comercio` FOREIGN KEY (`Id_Medida_Produccion`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  ADD CONSTRAINT `FK_Id_Medida_Venta_Produccion_Comercio` FOREIGN KEY (`Id_Medida_Venta`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  ADD CONSTRAINT `FK_Id_Productor_Produccion_Comercio` FOREIGN KEY (`Id_Productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `FK_Id_Tipo_Produccion_Produccion_Comercio` FOREIGN KEY (`Id_Tipo_Produccion`) REFERENCES `tbl_tipo_produccion` (`id_tipo_produccion`),
  ADD CONSTRAINT `FK_Id_Ubicacion_Produccion_Comercio` FOREIGN KEY (`Id_Ubicacion`) REFERENCES `tbl_ubicacion_productor` (`id_ubicacion`);

--
-- Filtros para la tabla `tbl_produccion_pecuaria`
--
ALTER TABLE `tbl_produccion_pecuaria`
  ADD CONSTRAINT `FK_Id_Ficha_Produccion_Pecuaria` FOREIGN KEY (`Id_Ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `FK_Id_Medida_Venta_Produccion_Pecuaria` FOREIGN KEY (`Id_Medida_Venta`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  ADD CONSTRAINT `FK_Id_Productor_Produccion_Pecuaria` FOREIGN KEY (`Id_Productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `FK_Id_Tipo_Pecuario_Produccion_Pecuaria` FOREIGN KEY (`Id_Tipo_Pecuario`) REFERENCES `tbl_tipo_pecuarios` (`id_tipo_pecuario`),
  ADD CONSTRAINT `FK_Id_Ubicacion_Produccion_Pecuaria` FOREIGN KEY (`Id_Ubicacion`) REFERENCES `tbl_ubicacion_productor` (`id_ubicacion`);

--
-- Filtros para la tabla `tbl_produccion_vendida`
--
ALTER TABLE `tbl_produccion_vendida`
  ADD CONSTRAINT `FK_Id_Medida_Venta_Produccion_Vendida` FOREIGN KEY (`Id_Medida_Venta`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  ADD CONSTRAINT `FK_Id_Tipo_Pecuario_Produccion_Vendida` FOREIGN KEY (`Id_Tipo_Pecuario`) REFERENCES `tbl_tipo_pecuarios` (`id_tipo_pecuario`);

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
-- Filtros para la tabla `tbl_unidad_productora`
--
ALTER TABLE `tbl_unidad_productora`
  ADD CONSTRAINT `FK_Id_Ficha_Unidad_Productora` FOREIGN KEY (`Id_Ficha`) REFERENCES `fichas` (`id_ficha`),
  ADD CONSTRAINT `FK_Id_Medida_Agricultura` FOREIGN KEY (`Id_Medida_Agricultura`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  ADD CONSTRAINT `FK_Id_Medida_Apicultura` FOREIGN KEY (`Id_Medida_Apicultura`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  ADD CONSTRAINT `FK_Id_Medida_Forestal` FOREIGN KEY (`Id_Medida_Forestal`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  ADD CONSTRAINT `FK_Id_Medida_Ganaderia` FOREIGN KEY (`Id_Medida_Ganaderia`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  ADD CONSTRAINT `FK_Id_Medida_Produccion` FOREIGN KEY (`Id_Medida_Produccion`) REFERENCES `tbl_medidas_tierra` (`id_medida`),
  ADD CONSTRAINT `FK_Id_Productor_Unidad_Productora` FOREIGN KEY (`Id_Productor`) REFERENCES `tbl_productor` (`id_productor`),
  ADD CONSTRAINT `FK_Id_Ubicacion_Unidad_Productora` FOREIGN KEY (`Id_Ubicacion`) REFERENCES `tbl_ubicacion_productor` (`id_ubicacion`);

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
