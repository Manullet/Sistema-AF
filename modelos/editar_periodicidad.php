<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_periodo = $_POST["id_periodo"];
    $periodo = $_POST["periodo"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];

    $sql = "CALL EditarPeriodicidad('$id_periodo', '$periodo', '$descripcion', '$estado');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el periodo: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>