<?php
include '../php/conexion_be.php';

// Verifica si se ha enviado un formulario y si se proporcionó un ID de objeto válido
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["Id_parametro"])) {
    // Obtiene el ID de obejto desde el formulario
    $Id_parametro = $_POST["Id_parametro"];

    // Crea una consulta SQL para eliminar el objeto con el ID proporcionado
    $sql = "DELETE FROM parametros WHERE Id_parametros = '$Id_parametro'";
    
    if (mysqli_query($conexion, $sql)) {
        // Éxito en la eliminación
        //header("Location: ../bienvenida.php?success=true&message=El objeto se eliminó correctamente");
        exit();
    } else {
        // Error en la eliminación
        //header("Location: ../bienvenida.php?success=false&message=Hubo un error al eliminar el objeto");
        exit();
    }
} else {
    // Si no se proporcionó un ID de objeto válido o no se envió un formulario, redirige a la página objeto.php
    //header("Location: ../vistas/Mantenimiento_permisos.php");
    exit();
}
?>