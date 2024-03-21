<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_tipo_produccion = $_POST["id_tipo_produccion"];
    $tipo_produccion = $_POST["tipo_produccion"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];

    $sql = "CALL EditarTipo_Produccion('$id_tipo_produccion', '$tipo_produccion', '$descripcion', '$estado');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el Tipo de produccion: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>