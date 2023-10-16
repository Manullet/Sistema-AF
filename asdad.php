<?php
// Incluye el archivo de conexión a la base de datos
include '../php/conexion_be.php';

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    $Id_Permisos = $_POST["Id_Permisos"];
    $Nombre = $_POST["Nombre"];
    $Nombre_Guard = $_POST["Nombre_Guard"];
    $Fecha_Creacion = $_POST["Fecha_Creacion"];
    $Fecha_Actualizacion = $_POST["Fecha_Actualizacion"];
    // Obtener la fecha y hora actual en el formato deseado (YYYY-MM-DD HH:MM:SS)
  //  $Fecha_Actualizacion = date("Y-m-d H:i:s");

    // Llama al procedimiento almacenado con 4 argumentos
    $sql = "CALL UpdatePermiso('$Nombre', '$Nombre_Guard', '$Fecha_Creacion', '$Fecha_Actualizacion')";

    if (mysqli_query($conexion, $sql)) {
        header("Location: ../bienvenida.php?success=true&message=El rol se actualizó correctamente");
        exit(); // Detener la ejecución del script
    } else {
        echo "Error al actualizar el rol: " . mysqli_error($conexion);
    }
    mysqli_close($conexion);
}
?>