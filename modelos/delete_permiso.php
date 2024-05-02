<?php

include '../php/conexion_be.php';

// Verifica si se ha enviado un formulario y si se proporcionó un ID de rol válido
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["id"])) {
    // Obtiene el ID de rol desde el formulario
    $Id_Permisos = $_POST["id"];
    var_dump($Id_Permisos);

    // Crea una consulta SQL para eliminar el rol con el ID proporcionado
    $delete_query = "DELETE FROM permisos WHERE id_permisos = $Id_Permisos";
    
    if (mysqli_query($conexion, $delete_query)) {
        // Éxito en la eliminación
        header("Location: ../bienvenida.php?success=true&message=El permiso se eliminó correctamente");
        exit();
    } else {
        // Error en la eliminación
        header("Location: ../bienvenida.php?success=false&message=Hubo un error al eliminar el permiso");
        exit();
    }
} else {
    // Si no se proporcionó un ID de rol válido o no se envió un formulario, redirige a la página roles.php
    header("Location: ../vistas/Mantenimiento_permisos.php");
    exit();
}
?>