<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $Id_Produccion_Comercio = $_POST["Id_Produccion_Comercio"];

    $sql = "CALL EliminarProduccionComercializacion($Id_Produccion_Comercio)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar la produccion y comercializacion: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>