<?php
// Incluye el archivo de conexión a la base de datos
include 'php/conexion_be.php';

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    $Id_rol = $_POST["Id_rol"];
    $Nombre = $_POST["Nombre"];
    $Status = $_POST["Status"];
    
    // Obtener la fecha y hora actual en el formato deseado (YYYY-MM-DD HH:MM:SS)
  //  $Fecha_Actualizacion = date("Y-m-d H:i:s");

    // Llama al procedimiento almacenado con 4 argumentos
    $sql = "CALL UpdateRole('$Id_rol', '$Nombre', '$Status')";

    if (mysqli_query($conexion, $sql)) {
        header("Location: roles.php?success=true&message=El rol se actualizó correctamente");
        exit(); // Detener la ejecución del script
    } else {
        echo "Error al actualizar el rol: " . mysqli_error($conexion);
    }
    mysqli_close($conexion);
}
?>



