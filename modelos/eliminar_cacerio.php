<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $Id_Cacerio = $_POST["Id_Cacerio"];

    $sql = "CALL EliminarCacerio($Id_Cacerio)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el cacerio: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>