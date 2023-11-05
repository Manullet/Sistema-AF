<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_tipo_organizacion = $_POST["id_tipo_organizacion"];
    $tipo_organizacion = $_POST["tipo_organizacion"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];

    $sql = "CALL EditarTipo_Organizacion('$id_tipo_organizacion', '$tipo_organizacion', '$descripcion', '$estado');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el Tipo de Organizacion: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>