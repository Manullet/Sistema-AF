<?php

include 'Modelo/conexion.php';

// Verifica si se ha enviado un formulario y si se proporcionó un ID de rol válido
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["id"])) {
    // Obtiene el ID del usuario desde el formulario
    $id = $_POST["id"];

    // Crea una consulta SQL para eliminar el rol con el ID proporcionado
    $sql = "CALL DeleteUsuario($id)";

    
    if (mysqli_query($conexion, $sql)) {
        // Éxito en la eliminación
        header("Location: index.php?success=true&message=El rol se eliminó correctamente");
        exit();
    } else {
        // Error en la eliminación
        header("Location: index.php?success=false&message=Hubo un error al eliminar el rol");
        exit();
    }
} else {
    // Si no se proporcionó un ID de rol válido o no se envió un formulario, redirige a la página roles.php
    header("Location: index.php");
    exit();
}
?>
