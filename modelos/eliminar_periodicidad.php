<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_periodo = $_POST["id_periodo"];

    $sql = "CALL EliminarPeriodicidad($id_periodo)";

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