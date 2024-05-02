<?php
// Incluye el archivo de conexión a la base de datos
include '../php/conexion_be.php';
session_start();

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    $id_rol = $_POST["id_rol"];
    $id_objeto = $_POST["id_objeto"];
    $permiso_eliminacion = $_POST["permiso_eliminacion"];
    $permiso_actualizacion = $_POST["permiso_actualizacion"];
    $permiso_insercion = $_POST["permiso_insercion"];
    $permiso_consulta = $_POST["permiso_consulta"];
    $actualizado_por = $_SESSION["usuario"]['usuario'];

    // Llama al procedimiento almacenado
    $sql = "CALL InsertPermisos('$id_rol', $id_objeto, '$permiso_eliminacion', '$permiso_actualizacion', '$permiso_insercion', $permiso_consulta, '$actualizado_por')";

    if (mysqli_query($conexion, $sql)) {
        header("Location: ../bienvenida.php?success=true");
        exit();
    } else {
        if (mysqli_errno($conexion) == 1062) {
            echo '<div class="alert alert-danger text-center">Error ID Ya Existente</div>';
        } else {
            echo '<div class="alert alert-warning text-center">Algunos Campos Estan Vacios</div>';
        }
    }

    mysqli_close($conexion);
}
?>
