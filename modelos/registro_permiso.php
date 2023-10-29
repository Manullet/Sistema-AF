<?php
// Incluye el archivo de conexión a la base de datos
include '../php/conexion_be.php';

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    $Id_rol = $_POST["Id_rol"];
    $Id_objetos = $_POST["Id_objetos"];
    $permiso_eliminacion = $_POST["permiso_eliminacion"];
    $permiso_actualizacion = $_POST["permiso_actualizacion"];
    $permiso_consulta = $_POST["permiso_consulta"];
    $permiso_insercion = $_POST["permiso_insercion"];
    $Creado_Por = $_POST["Creado_Por"];
    $Estado = $_POST["Estado"];
  /*  $Fecha_Creacion = $_POST["Fecha_Creacion"];
    $Fecha_Actualizacion = $_POST["Fecha_Actualizacion"]; */

    // Llama al procedimiento almacenado
    $sql = "CALL InsertPermisos('$Id_rol', '$Id_objetos','$permiso_eliminacion','$permiso_actualizacion','$permiso_consulta','$permiso_insercion','$Creado_Por','$Estado' )";

    if (mysqli_query($conexion, $sql)) {
        header("Location: ../bienvenida.php");
        exit(); // Detener la ejecución del script
    } else {
            echo "Error al insertar el nuevo rol: " . mysqli_error($conexion);
        }
    mysqli_close($conexion);
}
?>
