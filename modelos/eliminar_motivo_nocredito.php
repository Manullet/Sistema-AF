<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_motivos_no_credito = $_POST["id_motivos_no_credito"];

    $sql = "CALL EliminarMONCRED($id_motivos_no_credito)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el Motivo de Credito: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?> 