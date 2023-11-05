<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_tipo_tomador = $_POST["id_tipo_tomador"];

    $sql = "CALL EliminarTomaDecisiones($id_tipo_tomador)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar al encargado: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>