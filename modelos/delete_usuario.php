<?php
include '../php/conexion_be.php';

// Obtener el ID del usuario que deseas eliminar
$id_usuario = $_POST['id'];

// Preparar la llamada al procedimiento almacenado
$sql = "CALL EliminarUsuario(?)";
$stmt = mysqli_prepare($conexion, $sql);
mysqli_stmt_bind_param($stmt, "i", $id_usuario);
mysqli_stmt_execute($stmt);

$resultado = mysqli_stmt_get_result($stmt);

if ($resultado) {
    header("Location: ../bienvenida.php?delete_success=true");
} else {
    echo "Error al ejecutar la consulta: " . mysqli_error($conexion);
}

// Cerrar la conexión
mysqli_close($conexion);
?>
