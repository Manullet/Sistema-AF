<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $Id_Produccion_Vendida = $_POST["Id_Produccion_Vendida"];

    $sql = "CALL EliminarProduccionVendida($Id_Produccion_Vendida)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar la producción vendida: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>