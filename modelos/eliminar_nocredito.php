<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_nocred=$_POST["id_nocred"];

    $sql = "CALL EliminarNoCredito($id_nocred)";

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