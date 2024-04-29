<?php
// Incluye el archivo de conexión a la base de datos
include '../php/conexion_be.php';
session_start();

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    $Id_pregunta = $_POST["Id_pregunta"];
    $Pregunta = $_POST["Pregunta"];
    $Actualizado_Por = $_SESSION["usuario"]["usuario"];
    $estado = $_POST["estado"];

   

    // Llama al procedimiento almacenado con 7 argumentos
    $sql = "CALL ActualizarPregunta('$Id_pregunta', '$Pregunta', '$Actualizado_Por', '$estado')";

    if (mysqli_query($conexion, $sql)) {
        header("Location: ../bienvenida.php?success=true&message=La Pregunta se actualizó correctamente");
        exit(); // Detener la ejecución del script
    } else {
        echo "Error al actualizar el Pregunta: " . mysqli_error($conexion);
    }
    mysqli_close($conexion);
}
?>
