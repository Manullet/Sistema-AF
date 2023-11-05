<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $Id_Municipio = $_POST["Id_Municipio"];

    $sql = "CALL EliminarMunicipio($Id_Municipio)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el municipio: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>