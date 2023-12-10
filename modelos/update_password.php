<?php
include "../php/conexion_be.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['token']) && isset($_POST['password'])) {
    $token = $_POST['token'];
    $nuevaContrasena = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $stmt = $conexion->prepare("UPDATE usuario SET contrasena = ?, Token = NULL, Fecha_Vencimiento_Token = NULL WHERE Token = ? AND Fecha_Vencimiento_Token > NOW()");
    $stmt->bind_param("ss", $nuevaContrasena, $token);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo 'Tu contraseña ha sido actualizada.';
    } else {
        echo 'El token es inválido o la contraseña no pudo ser actualizada.';
    }

    $stmt->close();
}
?>
