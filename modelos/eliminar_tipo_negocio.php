<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_tipo_negocio = $_POST["id_tipo_negocio"];

    $sql = "CALL EliminarTipo_Negocio($id_tipo_negocio)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el Tipo de negocio: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>