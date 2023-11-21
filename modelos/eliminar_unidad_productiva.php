<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $Id_Unidad_Productiva = $_POST["Id_Unidad_Productiva"];

    $sql = "CALL EliminarUnidadProductora($Id_Unidad_Productiva)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar la unidad productiva: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>