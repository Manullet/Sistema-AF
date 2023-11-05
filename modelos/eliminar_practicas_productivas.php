<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_tipo_practica = $_POST["id_tipo_practica"];

    $sql = "CALL EliminarPracticas($id_tipo_practica)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el PERIODO: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>