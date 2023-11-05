<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_tipo_cultivo = $_POST["id_tipo_cultivo"];
    $tipo_cultivo = $_POST["tipo_cultivo"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];

    $sql = "CALL EditarCultivo('$id_tipo_cultivo', '$tipo_cultivo', '$descripcion', '$estado');";

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