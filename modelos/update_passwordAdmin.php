<?php
include "../php/conexion_be.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $token = $_POST['token'];
    $nuevaContrasena = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $id = $_POST['id'];

    $stmt = $conexion->prepare("UPDATE usuario SET contrasena = ?, Token = NULL , Fecha_Vencimiento_Token = NULL WHERE Id_Usuario = ? ");
    $stmt->bind_param("si", $nuevaContrasena, $id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo 'Tu contraseña ha sido actualizada.';
    } else {
        echo 'El token es inválido o la contraseña no pudo ser actualizada.';
    }

    $stmt->close();
}
?>
