<?php
include '../php/conexion_be.php';

// Obtener los valores de los campos (ajusta según cómo obtienes los datos)
$id = isset($_POST['Id_Usuario']) ? $_POST['Id_Usuario'] : null;
$nombre_completo = isset($_POST['nombre_completo']) ? $_POST['nombre_completo'] : null;
$correo = isset($_POST['correo']) ? $_POST['correo'] : null;
$usuario = isset($_POST['usuario']) ? $_POST['usuario'] : null;
$Id_rol = isset($_POST['id_rol']) ? $_POST['id_rol'] : null;
$id_estado = isset($_POST['id_estado']) ? $_POST['id_estado'] : null;

// Verificar que los datos esenciales estén presentes
if ($id !== null && $nombre_completo !== null && $correo !== null && $usuario !== null && $id_estado !== null) {
    // Preparar la consulta SQL utilizando sentencias preparadas
    $sql = "CALL ActualizarUsuario(?, ?, ?, ?, ?)";

    $stmt = mysqli_prepare($conexion, $sql);

    if ($stmt) {
        // Vincular parámetros
        mysqli_stmt_bind_param($stmt, "isssi", $id, $nombre_completo, $correo, $usuario, $id_estado);

        // Ejecutar la consulta
        $resultado = mysqli_stmt_execute($stmt);

        if ($resultado) {
            header("Location: ../bienvenida.php?success=true");
            exit();
        } else {
            echo "Error al ejecutar la consulta: " . mysqli_stmt_error($stmt);
        }

        // Cerrar la sentencia preparada
        mysqli_stmt_close($stmt);
    } else {
        echo "Error al preparar la consulta: " . mysqli_error($conexion);
    }
} else {
    echo "Datos incompletos. Verifica el formulario.";
}

// Cerrar la conexión
mysqli_close($conexion);
?>
