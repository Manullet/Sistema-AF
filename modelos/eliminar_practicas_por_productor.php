<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $Id_Practica_Produccion = $_POST["Id_Practica_Produccion"];

    $sql = "CALL EliminarPracticaProduccion($Id_Practica_Produccion)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar la practica: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?> 