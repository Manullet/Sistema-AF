<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_tipo_organizacion = $_POST["id_tipo_organizacion"];

    $sql = "CALL EliminarTipo_Organizacion($id_tipo_organizacion)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el Tipo de Organizacion: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>