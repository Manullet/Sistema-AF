-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2023 a las 10:28:41
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteObjeto` (IN `newId_objetos` VARCHAR(255))   BEGIN
     DELETE FROM objetos WHERE Id_objetos = newId_objetos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePregunta` (IN `preguntaId` INT)   BEGIN
    DELETE FROM Preguntas WHERE Id_pregunta = preguntaId;
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
(2, '¿que animal te gusta?', 1, '2023-10-29 02:14:09', 1, '2023-10-29 02:14:09');

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
(11, 'Seguridad', '', 0, '2023-10-29 08:35:20', 0, '2023-10-29 08:35:20', 'ACTIVO'),
(12, 'Seg', '', 1, '2023-10-29 08:39:06', 1, '2023-10-29 08:39:06', 'ACTIVO');

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
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_Usuario` bigint(20) NOT NULL,
  `Id_rol` bigint(20) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Correo` varchar(255) NOT NULL,
  `Usuario` varchar(255) NOT NULL,
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

INSERT INTO `usuario` (`Id_Usuario`, `Id_rol`, `Nombre`, `Correo`, `Usuario`, `Contraseña`, `Token`, `Fecha_Creacion`, `Actualizado_Por`, `Fecha_Actualizacion`, `Preguntas_Contestadas`, `Estado`, `Id_estado`, `Primera_Vez`, `Fecha_Vencimiento`, `Intentos_Preguntas`, `Preguntas_Correctas`, `Intentos_Fallidos`) VALUES
(1, 1, 'manuel', 'manuel@gmail.com', 'manu', '123', '1', '2023-10-29 01:48:15', 1, '2023-10-30 01:48:15', 1, 1, 1, 1, '2023-10-31', NULL, NULL, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  ADD PRIMARY KEY (`id_estado`);

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
  MODIFY `Id_pregunta` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `preguntas_usuario`
--
ALTER TABLE `preguntas_usuario`
  MODIFY `Id_Pregunta_U` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `Id_rol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Usuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `Estado` FOREIGN KEY (`Id_estado`) REFERENCES `estado_usuario` (`id_estado`),
  ADD CONSTRAINT `Rol` FOREIGN KEY (`Id_rol`) REFERENCES `roles` (`Id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
