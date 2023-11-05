<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_organizacion = $_POST["id_organizacion"];
    $organizacion = $_POST["organizacion"];
    $id_tipo_organizacion = $_POST["id_tipo_organizacion"];
    $descripcion = $_POST["descripcion"];

    $sql = "CALL EditarOrganizacion('$id_organizacion', '$organizacion', '$id_tipo_organizacion', '$descripcion');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar la Organizacion: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>