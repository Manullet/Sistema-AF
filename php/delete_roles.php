<?php
include 'conexion_be.php';

// Verifica si se ha enviado un formulario y si se proporcionó un ID de rol válido
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["Id_rol"])) {
    // Obtiene el ID de rol desde el formulario
    $Id_rol = $_POST["Id_rol"];

    // Crea una consulta SQL para eliminar el rol con el ID proporcionado
    $delete_query = "DELETE FROM roles WHERE Id_rol = '$Id_rol'";
    
    if (mysqli_query($conexion, $delete_query)) {
        // Éxito en la eliminación
        header("Location: ../vistas/Mantenimiento_roles.php?success=true&message=El rol se eliminó correctamente");
        exit();
    } else {
        // Error en la eliminación
        header("Location: ../vistas/Mantenimiento_roles.php?success=false&message=Hubo un error al eliminar el rol");
        exit();
    }
}
?>
