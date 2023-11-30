<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_apoyo_ext = $_POST["id_apoyo_ext"];

    $sql = "CALL EliminarApoyoActividadExterna($id_apoyo_ext)";
/**este esta bueno msg */
    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el trabajador externos: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>