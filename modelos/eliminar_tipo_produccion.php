<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_tipo_produccion = $_POST["id_tipo_produccion"];

    $sql = "CALL EliminarTipoProduccion($id_tipo_produccion)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar la practica por producción: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>