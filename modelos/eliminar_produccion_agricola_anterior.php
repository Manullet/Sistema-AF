<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $Id_Produccion_Anterior = $_POST["Id_Produccion_Anterior"];

    $sql = "CALL EliminarProduccionAgricolaAnterior($Id_Produccion_Anterior)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar la producción agricola anterior: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>