<?php
// Incluye el archivo de conexión a la base de datos
include '../php/conexion_be.php';

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    //$Id_objetos = $_POST["Id_objetos"];
    $Pregunta = $_POST["Pregunta"];
    $Actualizado_Por = $_POST["Actualizado_Por"];
    $Creador_Por = $_POST["Creador_Por"];
    //$Status = $_POST["Status"];
  

    // Llama al procedimiento almacenado con 5 argumentos
    $sql = "CALL InsertPreguntas('$Pregunta', '$Actualizado_Por', '$Creador_Por')";

    if (mysqli_query($conexion, $sql)) {
        header("Location: ../bienvenida.php?success=true&message=El rol se actualizó correctamente");
        exit(); // Detener la ejecución del script
    } else {
        echo "Error al actualizar el rol: " . mysqli_error($conexion);
    }
    mysqli_close($conexion);
}
?>
