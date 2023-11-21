<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $Id_Manejo_Riego = $_POST["Id_Manejo_Riego"];

    $sql = "CALL EliminarManejoRiego($Id_Manejo_Riego)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el manejo de riego: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>