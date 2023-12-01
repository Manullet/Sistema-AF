<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_migracion = $_POST["id_migracion"];

    $sql = "CALL EliminarMigracionFamiliar($id_migracion)";
/**este esta bueno msg */
    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el registro: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>