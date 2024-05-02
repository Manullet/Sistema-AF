<?php
// Incluye el archivo de conexión a la base de datos
include '../php/conexion_be.php';
session_start();

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    $id_permiso = $_POST["id_permisos"];
    $id_rol = $_POST["id_rol"];
    $id_objeto = $_POST["id_objeto"];
    $permiso_eliminacion = $_POST["permiso_eliminacion"];
    $permiso_actualizacion = $_POST["permiso_actualizacion"];
    $permiso_consulta = $_POST["permiso_consulta"];
    $permiso_insercion = $_POST["permiso_insercion"];
    $Actualizado_Por = $_SESSION["usuario"]['usuario'];
    // Obtener la fecha y hora actual en el formato deseado (YYYY-MM-DD HH:MM:SS)
  //  $Fecha_Actualizacion = date("Y-m-d H:i:s");

    // Llama al procedimiento almacenado con 4 argumentos
    $sql = "CALL UpdatePermiso($id_permiso, '$id_rol',$id_objeto, '$permiso_eliminacion', '$permiso_actualizacion','$permiso_consulta','$permiso_insercion','$Actualizado_Por')";

    if (mysqli_query($conexion, $sql)) {
        header("Location: ../bienvenida.php?success=true&message=El Permiso se actualizó correctamente");
        exit(); // Detener la ejecución del script
    } else {
        echo "Error al actualizar el rol: " . mysqli_error($conexion);
    }
    mysqli_close($conexion);
}
?>
