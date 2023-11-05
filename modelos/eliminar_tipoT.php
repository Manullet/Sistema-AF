<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_tipo_trabajador = $_POST["id_tipo_trabajador"];

    $sql = "CALL EliminarTipoTrabajador($id_tipo_trabajador)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el tipo de trabajador: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>