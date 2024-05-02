<?php
ob_start();
include "../php/conexion_be.php";
session_start();

        // Consulta para obtener los nombres de los triggers
        $sql = "SHOW TRIGGERS";
        $result = $conexion->query($sql);

        if ($result->num_rows > 0) {
            // Itera sobre los resultados y elimina cada trigger
            while($row = $result->fetch_assoc()) {
                $trigger_name = $row["Trigger"];
                $sql_drop_trigger = "DROP TRIGGER IF EXISTS $trigger_name";
                if ($conexion->query($sql_drop_trigger) === TRUE) {
                    echo "El trigger $trigger_name ha sido eliminado.<br>";
                } else {
                    echo "Error al eliminar el trigger $trigger_name: " . $conexion->error . "<br>";
                }
            }

        } else {
            $codigo_triggers = "
            CREATE TRIGGER `DeleteFichas` AFTER DELETE ON `fichas` FOR EACH ROW BEGIN
            INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)VALUES(
            CURRENT_USER, 'Se eliminó', concat('Información eliminada = id_ficha: ', OLD.id_ficha, ', fecha_solicitud: ',OLD.fecha_solicitud, ', anio_solicitud: ',OLD.anio_solicitud, ', descripcion: ', OLD.descripcion, ', estado: ',OLD.estado, ', fecha_entrevista: ',OLD.fecha_entrevista, ', nombre_encuestador: ',OLD.nombre_encuestador), 'fichas');
            END;

            CREATE TRIGGER `InsertFichas` AFTER INSERT ON `fichas` FOR EACH ROW BEGIN
            INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)VALUES(
            CURRENT_USER, 'Se insertó', concat('Información actual = id_ficha: ', NEW.id_ficha, ', fecha_solicitud: ',NEW.fecha_solicitud, ', anio_solicitud: ',NEW.anio_solicitud, ', descripcion: ', NEW.descripcion, ', estado: ',NEW.estado, ', fecha_entrevista: ',NEW.fecha_entrevista, ', nombre_encuestador: ',NEW.nombre_encuestador), 'fichas');
            END;

            CREATE TRIGGER `UpdateFichas` AFTER UPDATE ON `fichas` FOR EACH ROW BEGIN
            INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)VALUES(CURRENT_USER, 'Se actualizó', concat('Información anterior = id_ficha: ', OLD.id_ficha, ', fecha_solicitud: ',OLD.fecha_solicitud, ' anio_solicitud: ',OLD.anio_solicitud, ', descripcion: ', OLD.descripcion, '',OLD.estado, ', fecha_entrevista: ',OLD.fecha_entrevista, ', nombre_encuestador: ',OLD.nombre_encuestador), concat('Información actualizada = id_ficha: ', NEW.id_ficha, ', fecha_solicitud: ',NEW.fecha_solicitud, ', anio_solicitud: ',NEW.anio_solicitud, ', descripcion: ', NEW.descripcion, ', estado: ',NEW.estado, ', fecha_entrevista: ',NEW.fecha_entrevista, ', nombre_encuestador: ',NEW.nombre_encuestador), 'fichas');
            END;

            CREATE TRIGGER `DeleteAldeas` AFTER DELETE ON `tbl_aldeas` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: Id_Aldea = ', OLD.Id_Aldea, ', Id_Departamento = ', OLD.Id_Departamento, ', Id_Municipio = ', OLD.Id_Municipio, ', Nombre_Aldea = ', OLD.Nombre_Aldea, ', Descripcion = ', OLD.Descripcion, ', Estado = ', OLD.Estado), 'tbl_aldeas');
            END;

            CREATE TRIGGER `InsertAldeas` AFTER INSERT ON `tbl_aldeas` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: Id_Aldea = ', NEW.Id_Aldea, ', Id_Departamento = ', NEW.Id_Departamento, ', Id_Municipio = ', NEW.Id_Municipio, ', Nombre_Aldea = ', NEW.Nombre_Aldea, ', Descripcion = ', NEW.Descripcion, ', Estado = ', NEW.Estado), 'tbl_aldeas');
            END;

            CREATE TRIGGER `UpdateAldeas` AFTER UPDATE ON `tbl_aldeas` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: Id_Aldea = ', OLD.Id_Aldea, ', Id_Departamento = ', OLD.Id_Departamento, ', Id_Municipio = ', OLD.Id_Municipio, ', Nombre_Aldea = ', OLD.Nombre_Aldea, ', Descripcion = ', OLD.Descripcion, ', Estado = ', OLD.Estado), 
                    CONCAT('Información actualizada: Id_Aldea = ', NEW.Id_Aldea, ', Id_Departamento = ', NEW.Id_Departamento, ', Id_Municipio = ', NEW.Id_Municipio, ', Nombre_Aldea = ', NEW.Nombre_Aldea, ', Descripcion = ', NEW.Descripcion, ', Estado = ', NEW.Estado), 
                    'tbl_aldeas'
                );
            END;





            CREATE TRIGGER `DeleteDepartamentos` AFTER DELETE ON `tbl_departamentos` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: Id_Departamento = ', OLD.Id_Departamento, ', Nombre_Departamento = ', OLD.Nombre_Departamento, ', Descripcion = ', OLD.Descripcion), 'tbl_departamentos');
            END;

            CREATE TRIGGER `InsertDepartamentos` AFTER INSERT ON `tbl_departamentos` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: Id_Departamento = ', NEW.Id_Departamento, ', Nombre_Departamento = ', NEW.Nombre_Departamento, ', Descripcion = ', NEW.Descripcion), 'tbl_departamentos');
            END;

            CREATE TRIGGER `UpdateDepartamentos` AFTER UPDATE ON `tbl_departamentos` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: Id_Departamento = ', OLD.Id_Departamento, ', Nombre_Departamento = ', OLD.Nombre_Departamento, ', Descripcion = ', OLD.Descripcion), 
                    CONCAT('Información actualizada: Id_Departamento = ', NEW.Id_Departamento, ', Nombre_Departamento = ', NEW.Nombre_Departamento, ', Descripcion = ', NEW.Descripcion), 
                    'tbl_departamentos'
                );
            END;





            CREATE TRIGGER `DeleteCacerios` AFTER DELETE ON `tbl_cacerios` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: Id_Cacerio = ', OLD.Id_Cacerio, ', Id_Aldea = ', OLD.Id_Aldea, ', Id_Municipio = ', OLD.Id_Municipio, ', Id_Departamento = ', OLD.Id_Departamento, ', Nombre_Cacerio = ', OLD.Nombre_Cacerio, ', Descripcion = ', OLD.Descripcion), 'tbl_cacerios');
            END;

            CREATE TRIGGER `InsertCacerios` AFTER INSERT ON `tbl_cacerios` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: Id_Cacerio = ', NEW.Id_Cacerio, ', Id_Aldea = ', NEW.Id_Aldea, ', Id_Municipio = ', NEW.Id_Municipio, ', Id_Departamento = ', NEW.Id_Departamento, ', Nombre_Cacerio = ', NEW.Nombre_Cacerio, ', Descripcion = ', NEW.Descripcion), 'tbl_cacerios');
            END;

            CREATE TRIGGER `UpdateCacerios` AFTER UPDATE ON `tbl_cacerios` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: Id_Cacerio = ', OLD.Id_Cacerio, ', Id_Aldea = ', OLD.Id_Aldea, ', Id_Municipio = ', OLD.Id_Municipio, ', Id_Departamento = ', OLD.Id_Departamento, ', Nombre_Cacerio = ', OLD.Nombre_Cacerio, ', Descripcion = ', OLD.Descripcion), 
                    CONCAT('Información actualizada: Id_Cacerio = ', NEW.Id_Cacerio, ', Id_Aldea = ', NEW.Id_Aldea, ', Id_Municipio = ', NEW.Id_Municipio, ', Id_Departamento = ', NEW.Id_Departamento, ', Nombre_Cacerio = ', NEW.Nombre_Cacerio, ', Descripcion = ', NEW.Descripcion), 
                    'tbl_cacerios'
                );
            END;





            CREATE TRIGGER `DeleteMunicipios` AFTER DELETE ON `tbl_municipios` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: Id_Municipio = ', OLD.Id_Municipio, ', Id_Departamento = ', OLD.Id_Departamento, ', Nombre_Municipio = ', OLD.Nombre_Municipio, ', Descripcion = ', OLD.Descripcion), 'tbl_municipios');
            END;

            CREATE TRIGGER `InsertMunicipios` AFTER INSERT ON `tbl_municipios` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: Id_Municipio = ', NEW.Id_Municipio, ', Id_Departamento = ', NEW.Id_Departamento, ', Nombre_Municipio = ', NEW.Nombre_Municipio, ', Descripcion = ', NEW.Descripcion), 'tbl_municipios');
            END;

            CREATE TRIGGER `UpdateMunicipios` AFTER UPDATE ON `tbl_municipios` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: Id_Municipio = ', OLD.Id_Municipio, ', Id_Departamento = ', OLD.Id_Departamento, ', Nombre_Municipio = ', OLD.Nombre_Municipio, ', Descripcion = ', OLD.Descripcion), 
                    CONCAT('Información actualizada: Id_Municipio = ', NEW.Id_Municipio, ', Id_Departamento = ', NEW.Id_Departamento, ', Nombre_Municipio = ', NEW.Nombre_Municipio, ', Descripcion = ', NEW.Descripcion), 
                    'tbl_municipios'
                );
            END;





            CREATE TRIGGER `DeleteEtnias` AFTER DELETE ON `tbl_etnias` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_etnia = ', OLD.id_etnia, ', etnia = ', OLD.etnia, ', descripcion = ', OLD.descripcion), 'tbl_etnias');
            END;

            CREATE TRIGGER `InsertEtnias` AFTER INSERT ON `tbl_etnias` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_etnia = ', NEW.id_etnia, ', etnia = ', NEW.etnia, ', descripcion = ', NEW.descripcion), 'tbl_etnias');
            END;

            CREATE TRIGGER `UpdateEtnias` AFTER UPDATE ON `tbl_etnias` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_etnia = ', OLD.id_etnia, ', etnia = ', OLD.etnia, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_etnia = ', NEW.id_etnia, ', etnia = ', NEW.etnia, ', descripcion = ', NEW.descripcion), 
                    'tbl_etnias'
                );
            END;





            CREATE TRIGGER `DeleteOrganizaciones` AFTER DELETE ON `tbl_organizaciones` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_organizacion = ', OLD.id_organizacion, ', organizacion = ', OLD.organizacion, ', id_tipo_organizacion = ', OLD.id_tipo_organizacion, ', descripcion = ', OLD.descripcion), 'tbl_organizaciones');
            END;

            CREATE TRIGGER `InsertOrganizaciones` AFTER INSERT ON `tbl_organizaciones` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_organizacion = ', NEW.id_organizacion, ', organizacion = ', NEW.organizacion, ', id_tipo_organizacion = ', NEW.id_tipo_organizacion, ', descripcion = ', NEW.descripcion), 'tbl_organizaciones');
            END;

            CREATE TRIGGER `UpdateOrganizaciones` AFTER UPDATE ON `tbl_organizaciones` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_organizacion = ', OLD.id_organizacion, ', organizacion = ', OLD.organizacion, ', id_tipo_organizacion = ', OLD.id_tipo_organizacion, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_organizacion = ', NEW.id_organizacion, ', organizacion = ', NEW.organizacion, ', id_tipo_organizacion = ', NEW.id_tipo_organizacion, ', descripcion = ', NEW.descripcion), 
                    'tbl_organizaciones'
                );
            END;





            CREATE TRIGGER `DeleteTipoOrganizacion` AFTER DELETE ON `tbl_tipo_organizacion` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_organizacion = ', OLD.id_tipo_organizacion, ', tipo_organizacion = ', OLD.tipo_organizacion, ', descripcion = ', OLD.descripcion), 'tbl_tipo_organizacion');
            END;

            CREATE TRIGGER `InsertTipoOrganizacion` AFTER INSERT ON `tbl_tipo_organizacion` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_organizacion = ', NEW.id_tipo_organizacion, ', tipo_organizacion = ', NEW.tipo_organizacion, ', descripcion = ', NEW.descripcion), 'tbl_tipo_organizacion');
            END;

            CREATE TRIGGER `UpdateTipoOrganizacion` AFTER UPDATE ON `tbl_tipo_organizacion` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_organizacion = ', OLD.id_tipo_organizacion, ', tipo_organizacion = ', OLD.tipo_organizacion, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_organizacion = ', NEW.id_tipo_organizacion, ', tipo_organizacion = ', NEW.tipo_organizacion, ', descripcion = ', NEW.descripcion), 
                    'tbl_tipo_organizacion'
                );
            END;





            CREATE TRIGGER `DeleteMotivosMigracion` AFTER DELETE ON `tbl_motivos_migracion` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: Id_motivo = ', OLD.Id_motivo, ', Motivo = ', OLD.Motivo, ', Descripcion = ', OLD.Descripcion), 'tbl_motivos_migracion');
            END;

            CREATE TRIGGER `InsertMotivosMigracion` AFTER INSERT ON `tbl_motivos_migracion` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: Id_motivo = ', NEW.Id_motivo, ', Motivo = ', NEW.Motivo, ', Descripcion = ', NEW.Descripcion), 'tbl_motivos_migracion');
            END;

            CREATE TRIGGER `UpdateMotivosMigracion` AFTER UPDATE ON `tbl_motivos_migracion` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: Id_motivo = ', OLD.Id_motivo, ', Motivo = ', OLD.Motivo, ', Descripcion = ', OLD.Descripcion), 
                    CONCAT('Información actualizada: Id_motivo = ', NEW.Id_motivo, ', Motivo = ', NEW.Motivo, ', Descripcion = ', NEW.Descripcion), 
                    'tbl_motivos_migracion'
                );
            END;





            CREATE TRIGGER `DeleteMedidasTierra` AFTER DELETE ON `tbl_medidas_tierra` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_medida = ', OLD.id_medida, ', medida = ', OLD.medida, ', descripcion = ', OLD.descripcion), 'tbl_medidas_tierra');
            END;

            CREATE TRIGGER `InsertMedidasTierra` AFTER INSERT ON `tbl_medidas_tierra` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_medida = ', NEW.id_medida, ', medida = ', NEW.medida, ', descripcion = ', NEW.descripcion), 'tbl_medidas_tierra');
            END;

            CREATE TRIGGER `UpdateMedidasTierra` AFTER UPDATE ON `tbl_medidas_tierra` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_medida = ', OLD.id_medida, ', medida = ', OLD.medida, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_medida = ', NEW.id_medida, ', medida = ', NEW.medida, ', descripcion = ', NEW.descripcion), 
                    'tbl_medidas_tierra'
                );
            END;





            CREATE TRIGGER `DeleteManejoRiego` AFTER DELETE ON `tbl_manejo_riego` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: Id_Manejo_Riego = ', OLD.Id_Manejo_Riego, ', Id_Ficha = ', OLD.Id_Ficha, ', Id_Ubicacion = ', OLD.Id_Ubicacion, ', Id_Productor = ', OLD.Id_Productor, ', Tiene_Riego = ', OLD.Tiene_Riego, ', Superficie_Riego = ', OLD.Superficie_Riego), 'tbl_manejo_riego');
            END;

            CREATE TRIGGER `InsertManejoRiego` AFTER INSERT ON `tbl_manejo_riego` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: Id_Manejo_Riego = ', NEW.Id_Manejo_Riego, ', Id_Ficha = ', NEW.Id_Ficha, ', Id_Ubicacion = ', NEW.Id_Ubicacion, ', Id_Productor = ', NEW.Id_Productor, ', Tiene_Riego = ', NEW.Tiene_Riego, ', Superficie_Riego = ', NEW.Superficie_Riego), 'tbl_manejo_riego');
            END;

            CREATE TRIGGER `UpdateManejoRiego` AFTER UPDATE ON `tbl_manejo_riego` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: Id_Manejo_Riego = ', OLD.Id_Manejo_Riego, ', Id_Ficha = ', OLD.Id_Ficha, ', Id_Ubicacion = ', OLD.Id_Ubicacion, ', Id_Productor = ', OLD.Id_Productor, ', Tiene_Riego = ', OLD.Tiene_Riego, ', Superficie_Riego = ', OLD.Superficie_Riego), 
                    CONCAT('Información actualizada: Id_Manejo_Riego = ', NEW.Id_Manejo_Riego, ', Id_Ficha = ', NEW.Id_Ficha, ', Id_Ubicacion = ', NEW.Id_Ubicacion, ', Id_Productor = ', NEW.Id_Productor, ', Tiene_Riego = ', NEW.Tiene_Riego, ', Superficie_Riego = ', NEW.Superficie_Riego), 
                    'tbl_manejo_riego'
                );
            END;





            CREATE TRIGGER `DeleteTipoCultivo` AFTER DELETE ON `tbl_tipo_cultivo` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_cultivo = ', OLD.id_tipo_cultivo, ', tipo_cultivo = ', OLD.tipo_cultivo, ', descripcion = ', OLD.descripcion), 'tbl_tipo_cultivo');
            END;

            CREATE TRIGGER `InsertTipoCultivo` AFTER INSERT ON `tbl_tipo_cultivo` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_cultivo = ', NEW.id_tipo_cultivo, ', tipo_cultivo = ', NEW.tipo_cultivo, ', descripcion = ', NEW.descripcion), 'tbl_tipo_cultivo');
            END;

            CREATE TRIGGER `UpdateTipoCultivo` AFTER UPDATE ON `tbl_tipo_cultivo` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_cultivo = ', OLD.id_tipo_cultivo, ', tipo_cultivo = ', OLD.tipo_cultivo, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_cultivo = ', NEW.id_tipo_cultivo, ', tipo_cultivo = ', NEW.tipo_cultivo, ', descripcion = ', NEW.descripcion), 
                    'tbl_tipo_cultivo'
                );
            END;





            CREATE TRIGGER `DeleteTipoPecuarios` AFTER DELETE ON `tbl_tipo_pecuarios` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_pecuario = ', OLD.id_tipo_pecuario, ', tipo_pecuario = ', OLD.tipo_pecuario, ', raza_con_genero = ', OLD.raza_con_genero, ', descripcion = ', OLD.descripcion), 'tbl_tipo_pecuarios');
            END;

            CREATE TRIGGER `InsertTipoPecuarios` AFTER INSERT ON `tbl_tipo_pecuarios` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_pecuario = ', NEW.id_tipo_pecuario, ', tipo_pecuario = ', NEW.tipo_pecuario, ', raza_con_genero = ', NEW.raza_con_genero, ', descripcion = ', NEW.descripcion), 'tbl_tipo_pecuarios');
            END;

            CREATE TRIGGER `UpdateTipoPecuarios` AFTER UPDATE ON `tbl_tipo_pecuarios` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_pecuario = ', OLD.id_tipo_pecuario, ', tipo_pecuario = ', OLD.tipo_pecuario, ', raza_con_genero = ', OLD.raza_con_genero, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_pecuario = ', NEW.id_tipo_pecuario, ', tipo_pecuario = ', NEW.tipo_pecuario, ', raza_con_genero = ', NEW.raza_con_genero, ', descripcion = ', NEW.descripcion), 
                    'tbl_tipo_pecuarios'
                );
            END;





            CREATE TRIGGER `DeleteTipoProduccion` AFTER DELETE ON `tbl_tipo_produccion` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_produccion = ', OLD.id_tipo_produccion, ', tipo_produccion = ', OLD.tipo_produccion, ', descripcion = ', OLD.descripcion), 'tbl_tipo_produccion');
            END;

            CREATE TRIGGER `InsertTipoProduccion` AFTER INSERT ON `tbl_tipo_produccion` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_produccion = ', NEW.id_tipo_produccion, ', tipo_produccion = ', NEW.tipo_produccion, ', descripcion = ', NEW.descripcion), 'tbl_tipo_produccion');
            END;

            CREATE TRIGGER `UpdateTipoProduccion` AFTER UPDATE ON `tbl_tipo_produccion` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_produccion = ', OLD.id_tipo_produccion, ', tipo_produccion = ', OLD.tipo_produccion, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_produccion = ', NEW.id_tipo_produccion, ', tipo_produccion = ', NEW.tipo_produccion, ', descripcion = ', NEW.descripcion), 
                    'tbl_tipo_produccion'
                );
            END;





            CREATE TRIGGER `DeletePeriodicidad` AFTER DELETE ON `tbl_periodicidad` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_periodo = ', OLD.id_periodo, ', periodo = ', OLD.periodo, ', descripcion = ', OLD.descripcion), 'tbl_periodicidad');
            END;

            CREATE TRIGGER `InsertPeriodicidad` AFTER INSERT ON `tbl_periodicidad` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_periodo = ', NEW.id_periodo, ', periodo = ', NEW.periodo, ', descripcion = ', NEW.descripcion), 'tbl_periodicidad');
            END;

            CREATE TRIGGER `UpdatePeriodicidad` AFTER UPDATE ON `tbl_periodicidad` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_periodo = ', OLD.id_periodo, ', periodo = ', OLD.periodo, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_periodo = ', NEW.id_periodo, ', periodo = ', NEW.periodo, ', descripcion = ', NEW.descripcion), 
                    'tbl_periodicidad'
                );
            END;





            CREATE TRIGGER `DeleteTipoNegocios` AFTER DELETE ON `tbl_tipo_negocios` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_negocio = ', OLD.id_tipo_negocio, ', tipo_negocio = ', OLD.tipo_negocio, ', descripcion = ', OLD.descripcion), 'tbl_tipo_negocios');
            END;

            CREATE TRIGGER `InsertTipoNegocios` AFTER INSERT ON `tbl_tipo_negocios` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_negocio = ', NEW.id_tipo_negocio, ', tipo_negocio = ', NEW.tipo_negocio, ', descripcion = ', NEW.descripcion), 'tbl_tipo_negocios');
            END;

            CREATE TRIGGER `UpdateTipoNegocios` AFTER UPDATE ON `tbl_tipo_negocios` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_negocio = ', OLD.id_tipo_negocio, ', tipo_negocio = ', OLD.tipo_negocio, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_negocio = ', NEW.id_tipo_negocio, ', tipo_negocio = ', NEW.tipo_negocio, ', descripcion = ', NEW.descripcion), 
                    'tbl_tipo_negocios'
                );
            END;





            CREATE TRIGGER `DeleteMotivosNoCreditos` AFTER DELETE ON `tbl_motivos_no_creditos` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_motivos_no_credito = ', OLD.id_motivos_no_credito, ', motivo_no_credito = ', OLD.motivo_no_credito, ', descripcion = ', OLD.descripcion), 'tbl_motivos_no_creditos');
            END;

            CREATE TRIGGER `InsertMotivosNoCreditos` AFTER INSERT ON `tbl_motivos_no_creditos` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_motivos_no_credito = ', NEW.id_motivos_no_credito, ', motivo_no_credito = ', NEW.motivo_no_credito, ', descripcion = ', NEW.descripcion), 'tbl_motivos_no_creditos');
            END;

            CREATE TRIGGER `UpdateMotivosNoCreditos` AFTER UPDATE ON `tbl_motivos_no_creditos` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_motivos_no_credito = ', OLD.id_motivos_no_credito, ', motivo_no_credito = ', OLD.motivo_no_credito, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_motivos_no_credito = ', NEW.id_motivos_no_credito, ', motivo_no_credito = ', NEW.motivo_no_credito, ', descripcion = ', NEW.descripcion), 
                    'tbl_motivos_no_creditos'
                );
            END;





            CREATE TRIGGER `DeleteTomaDecisiones` AFTER DELETE ON `tbl_toma_decisiones` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_tomador = ', OLD.id_tipo_tomador, ', tomador = ', OLD.tomador, ', descripcion = ', OLD.descripcion), 'tbl_toma_decisiones');
            END;

            CREATE TRIGGER `InsertTomaDecisiones` AFTER INSERT ON `tbl_toma_decisiones` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_tomador = ', NEW.id_tipo_tomador, ', tomador = ', NEW.tomador, ', descripcion = ', NEW.descripcion), 'tbl_toma_decisiones');
            END;

            CREATE TRIGGER `UpdateTomaDecisiones` AFTER UPDATE ON `tbl_toma_decisiones` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_tomador = ', OLD.id_tipo_tomador, ', tomador = ', OLD.tomador, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_tomador = ', NEW.id_tipo_tomador, ', tomador = ', NEW.tomador, ', descripcion = ', NEW.descripcion), 
                    'tbl_toma_decisiones'
                );
            END;





            CREATE TRIGGER `DeleteTipoTrabajadores` AFTER DELETE ON `tbl_tipo_trabajadores` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_trabajador = ', OLD.id_tipo_trabajador, ', tipo_trabajador = ', OLD.tipo_trabajador, ', descripcion = ', OLD.descripcion), 'tbl_tipo_trabajadores');
            END;

            CREATE TRIGGER `InsertTipoTrabajadores` AFTER INSERT ON `tbl_tipo_trabajadores` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_trabajador = ', NEW.id_tipo_trabajador, ', tipo_trabajador = ', NEW.tipo_trabajador, ', descripcion = ', NEW.descripcion), 'tbl_tipo_trabajadores');
            END;

            CREATE TRIGGER `UpdateTipoTrabajadores` AFTER UPDATE ON `tbl_tipo_trabajadores` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_trabajador = ', OLD.id_tipo_trabajador, ', tipo_trabajador = ', OLD.tipo_trabajador, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_trabajador = ', NEW.id_tipo_trabajador, ', tipo_trabajador = ', NEW.tipo_trabajador, ', descripcion = ', NEW.descripcion), 
                    'tbl_tipo_trabajadores'
                );
            END;





            CREATE TRIGGER `DeletePracticasPorProduccion` AFTER DELETE ON `tbl_practicas_por_produccion` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: Id_Practica_Produccion = ', OLD.Id_Practica_Produccion, ', Id_Ficha = ', OLD.Id_Ficha, ', Id_Productor = ', OLD.Id_Productor, ', Id_Tipo_Practica = ', OLD.Id_Tipo_Practica, ', Descripcion = ', OLD.Descripcion), 'tbl_practicas_por_produccion');
            END;

            CREATE TRIGGER `InsertPracticasPorProduccion` AFTER INSERT ON `tbl_practicas_por_produccion` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: Id_Practica_Produccion = ', NEW.Id_Practica_Produccion, ', Id_Ficha = ', NEW.Id_Ficha, ', Id_Productor = ', NEW.Id_Productor, ', Id_Tipo_Practica = ', NEW.Id_Tipo_Practica, ', Descripcion = ', NEW.Descripcion), 'tbl_practicas_por_produccion');
            END;

            CREATE TRIGGER `UpdatePracticasPorProduccion` AFTER UPDATE ON `tbl_practicas_por_produccion` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: Id_Practica_Produccion = ', OLD.Id_Practica_Produccion, ', Id_Ficha = ', OLD.Id_Ficha, ', Id_Productor = ', OLD.Id_Productor, ', Id_Tipo_Practica = ', OLD.Id_Tipo_Practica, ', Descripcion = ', OLD.Descripcion), 
                    CONCAT('Información actualizada: Id_Practica_Produccion = ', NEW.Id_Practica_Produccion, ', Id_Ficha = ', NEW.Id_Ficha, ', Id_Productor = ', NEW.Id_Productor, ', Id_Tipo_Practica = ', NEW.Id_Tipo_Practica, ', Descripcion = ', NEW.Descripcion), 
                    'tbl_practicas_por_produccion'
                );
            END;





            CREATE TRIGGER `DeleteApoyos` AFTER DELETE ON `tbl_apoyos` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_apoyo_produccion = ', OLD.id_apoyo_produccion, ', tipo_apoyo_produccion = ', OLD.tipo_apoyo_produccion, ', descripcion = ', OLD.descripcion), 'tbl_apoyos');
            END;

            CREATE TRIGGER `InsertApoyos` AFTER INSERT ON `tbl_apoyos` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_apoyo_produccion = ', NEW.id_apoyo_produccion, ', tipo_apoyo_produccion = ', NEW.tipo_apoyo_produccion, ', descripcion = ', NEW.descripcion), 'tbl_apoyos');
            END;

            CREATE TRIGGER `UpdateApoyos` AFTER UPDATE ON `tbl_apoyos` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_apoyo_produccion = ', OLD.id_apoyo_produccion, ', tipo_apoyo_produccion = ', OLD.tipo_apoyo_produccion, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_apoyo_produccion = ', NEW.id_apoyo_produccion, ', tipo_apoyo_produccion = ', NEW.tipo_apoyo_produccion, ', descripcion = ', NEW.descripcion), 
                    'tbl_apoyos'
                );
            END;





            CREATE TRIGGER `DeleteTiposApoyos` AFTER DELETE ON `tbl_tipos_apoyos` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_eliminada, tabla)
                VALUES (CURRENT_USER, 'Se eliminó', CONCAT('Información eliminada: id_tipo_apoyos = ', OLD.id_tipo_apoyos, ', tipo_apoyos = ', OLD.tipo_apoyos, ', descripcion = ', OLD.descripcion), 'tbl_tipos_apoyos');
            END;

            CREATE TRIGGER `InsertTiposApoyos` AFTER INSERT ON `tbl_tipos_apoyos` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_actual, tabla)
                VALUES (CURRENT_USER, 'Se insertó', CONCAT('Información actual: id_tipo_apoyos = ', NEW.id_tipo_apoyos, ', tipo_apoyos = ', NEW.tipo_apoyos, ', descripcion = ', NEW.descripcion), 'tbl_tipos_apoyos');
            END;

            CREATE TRIGGER `UpdateTiposApoyos` AFTER UPDATE ON `tbl_tipos_apoyos` FOR EACH ROW 
            BEGIN
                INSERT INTO bitacoras(ejecutor, actividad_realizada, informacion_anterior, informacion_actual, tabla)
                VALUES (
                    CURRENT_USER, 
                    'Se actualizó', 
                    CONCAT('Información anterior: id_tipo_apoyos = ', OLD.id_tipo_apoyos, ', tipo_apoyos = ', OLD.tipo_apoyos, ', descripcion = ', OLD.descripcion), 
                    CONCAT('Información actualizada: id_tipo_apoyos = ', NEW.id_tipo_apoyos, ', tipo_apoyos = ', NEW.tipo_apoyos, ', descripcion = ', NEW.descripcion), 
                    'tbl_tipos_apoyos'
                );
            END;
            ";
            
            // Ejecuta el código para recrear los triggers
            if ($conexion->multi_query($codigo_triggers)) {
                echo "Triggers recreados correctamente.";
            } else {
                echo "Error al recrear los triggers: " . $conexion->error . "<br>";
            }

        }

        // Cierra la conexión
        $conexion->close();
