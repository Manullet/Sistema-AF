<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_tipo_apoyos = $_POST["id_tipo_apoyos"];

    $sql = "CALL EliminarTipoApoyo($id_tipo_apoyos)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el tipo de apoyo: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>