<?php
// Incluye el archivo de conexión a la base de datos
include '../php/conexion_be.php';

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Obtener datos del formulario (ajusta los nombres según tus campos)
    $fecha_solicitud = $_POST['fecha_solicitud'];
    $anio_solicitud = $_POST['anio_solicitud'];
    $descripcion = $_POST['descripcion'];
    $fecha_entrevista = $_POST['fecha_entrevista'];
    $nombre_encuestador = $_POST['nombre_encuestador'];
    $nombre_encuestado = $_POST['nombre_encuestado'];
    $nombre_supervisor = $_POST['nombre_supervisor'];

    // Llamar al procedimiento almacenado
    $sql = "CALL Temp_Insertar_Ficha(
        '$fecha_solicitud', 
        '$anio_solicitud', 
        '$descripcion', 
        '$fecha_entrevista', 
        '$nombre_encuestador', 
        '$nombre_encuestado', 
        '$nombre_supervisor'
    )";

    if (mysqli_query($conexion, $sql)) {
        // Redirige al formulario con ID #datosTrabajadorForm
        header("Location: ../bienvenida.php?success=true&message=La Pregunta se actualizó correctamente#datosTrabajadorForm");
        exit(); // Detener la ejecución del script
    } else {
        echo "Error al guardar los datos: " . mysqli_error($conexion);
    }

    mysqli_close($conexion);
}
?>