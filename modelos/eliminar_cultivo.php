<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_tipo_cultivo = $_POST["id_tipo_cultivo"];

    $sql = "CALL EliminarCultivo($id_tipo_cultivo)";

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