<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_apoyo_produccion = $_POST["id_apoyo_produccion"];

    $sql = "CALL EliminarTipoApoyoProduccion($id_apoyo_produccion)";
/**este esta bueno msg */
    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el Tipo Apoyos por Productor: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>