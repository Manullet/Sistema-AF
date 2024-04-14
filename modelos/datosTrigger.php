<?php
ob_start();
include "../php/conexion_be.php";
session_start();

$contenedor=$_GET['tipo'];

switch($contenedor){
    case 'Eliminar': 
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
            echo "No hay triggers en la base de datos.";
        }

        // Cierra la conexión
        $conexion->close();

    break;

    case 'Crear': 
            // Código para recrear los triggers
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
            ";
            
            // Ejecuta el código para recrear los triggers
            if ($conexion->multi_query($codigo_triggers)) {
                echo "Triggers recreados correctamente.";
            } else {
                echo "Error al recrear los triggers: " . $conexion->error . "<br>";
            }
    break;
}