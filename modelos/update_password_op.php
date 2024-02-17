<?php
session_start();
include "../php/conexion_be.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_SESSION['id_usuario']) && isset($_POST['password'])) {
    $idUsuario = $_SESSION['id_usuario']; 
    $nuevaContrasena = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $stmt = $conexion->prepare("UPDATE usuario SET contrasena = ? WHERE id_usuario = ?");
    $stmt->bind_param("si", $nuevaContrasena, $idUsuario);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo 'Tu contraseña ha sido actualizada.';
    } else {
        echo 'No se pudo actualizar la contraseña. Por favor, inténtalo de nuevo.';
    }

    $stmt->close();
} else {
    echo 'Solicitud no válida.';
}
?>
