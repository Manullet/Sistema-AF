<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_tipo_negocio = $_POST["id_tipo_negocio"];
    $tipo_negocio = $_POST["tipo_negocio"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];

    $sql = "CALL EditarTipo_Negocio('$id_tipo_negocio', '$tipo_negocio', '$descripcion', '$estado');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el Tipo de negocio: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>