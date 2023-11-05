<?php
ob_start(); // Inicia el almacenamiento en búfer de salida

// Incluye el archivo de conexión a la base de datos
include 'conexion_be.php';

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    $Id_motivo = $_POST["Id_motivo"];
    
    // Llama al procedimiento almacenado con un solo argumento (ID del usuario)
    $sql = "DELETE FROM `tbl_motivos_migracion` WHERE Id_motivo = '$Id_motivo'";
    
    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el PERIODO: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>



