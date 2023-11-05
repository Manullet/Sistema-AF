<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_apoyo_produccion  = $_POST["id_apoyo_produccion"];

    $sql = "CALL EliminarApoyo($id_apoyo_produccion)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el apoyo: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>