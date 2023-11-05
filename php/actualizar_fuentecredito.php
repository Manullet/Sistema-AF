<?php
ob_start();

include 'conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_fuente_credito = $_POST["id_fuente_credito"];
    $fuente_credito = $_POST["fuente_credito"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];
 
    $sql = "CALL UpdateFuenteCredito('$id_fuente_credito', '$fuente_credito', '$descripcion', '$estado')";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el la etnia: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>