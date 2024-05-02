<?php
// Incluye el archivo de conexión a la base de datos
include '../php/conexion_be.php';
session_start();

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    //$Id_objetos = $_POST["Id_objetos"];
    $Pregunta = $_POST["Pregunta"];
    $respuesta = $_POST["Respuesta"];
    $Creador_Por = $_SESSION["usuario"]["usuario"];
    $id = $_SESSION["usuario"]["Id_Usuario"];


    $sql = "INSERT INTO preguntas_usuario(Id_pregunta, Id_Usuario, Respuestas, Creado_Por, Fecha_Creacion)
    values('$Pregunta', $id, '$respuesta', '$Creador_Por', NOW())";

    if (mysqli_query($conexion, $sql)) {
        header("Location: ../bienvenida.php?success=true&message=El rol se actualizó correctamente");
        exit(); // Detener la ejecución del script
    } else {
        echo "Error al actualizar el rol: " . mysqli_error($conexion);
    }
    mysqli_close($conexion);
}
?>
