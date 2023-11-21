<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $Id_Produccion_Pecuaria_Inventario = $_POST["Id_Produccion_Pecuaria_Inventario"];

    $sql = "CALL EliminarProduccionPecuariaInventario($Id_Produccion_Pecuaria_Inventario)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar la producción pecuaria inventario: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>