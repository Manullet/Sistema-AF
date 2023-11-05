<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_medida = $_POST["id_medida"];

    $sql = "CALL EliminarMedidaTierra($id_medida)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar la toma de decisión: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>