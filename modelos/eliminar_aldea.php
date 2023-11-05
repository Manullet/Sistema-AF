<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $Id_Aldea = $_POST["Id_Aldea"];

    $sql = "CALL EliminarAldea($Id_Aldea)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar la aldea: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>