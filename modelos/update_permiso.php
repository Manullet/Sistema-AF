<?php
// Incluye el archivo de conexión a la base de datos
include '../php/conexion_be.php';

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    $Id_Permisos = $_POST["Id_Permisos"]; 
    $permiso_eliminacion = $_POST["permiso_eliminacion"];
    $permiso_actualizacion = $_POST["permiso_actualizacion"];
    $permiso_consulta = $_POST["permiso_consulta"];
    $permiso_insercion = $_POST["permiso_insercion"];
    $Actualizado_Por = $_POST["Actualizado_Por"];
    $Estado = $_POST["Estado"];
    // Obtener la fecha y hora actual en el formato deseado (YYYY-MM-DD HH:MM:SS)
  //  $Fecha_Actualizacion = date("Y-m-d H:i:s");

    // Llama al procedimiento almacenado con 4 argumentos
    $sql = "CALL UpdatePermiso('$Id_Permisos','$permiso_eliminacion', '$permiso_actualizacion','$permiso_consulta','$permiso_insercion','$Actualizado_Por','$Estado')";

    if (mysqli_query($conexion, $sql)) {
        header("Location: ../bienvenida.php?success=true&message=El Permiso se actualizó correctamente");
        exit(); // Detener la ejecución del script
    } else {
        echo "Error al actualizar el rol: " . mysqli_error($conexion);
    }
    mysqli_close($conexion);
}
?>
