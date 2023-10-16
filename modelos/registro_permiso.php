<?php
// Incluye el archivo de conexión a la base de datos
include '../php/conexion_be.php';

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    $Nombre = $_POST["Nombre"];
    $Nombre_Guard = $_POST["Nombre_Guard"];
  /*  $Fecha_Creacion = $_POST["Fecha_Creacion"];
    $Fecha_Actualizacion = $_POST["Fecha_Actualizacion"]; */

    // Llama al procedimiento almacenado
    $sql = "CALL InsertPermisos('$Nombre', '$Nombre_Guard')";

    if (mysqli_query($conexion, $sql)) {
        header("Location: ../bienvenida.php");
        exit(); // Detener la ejecución del script
    } else {
            echo "Error al insertar el nuevo rol: " . mysqli_error($conexion);
        }
    mysqli_close($conexion);
}
?>
