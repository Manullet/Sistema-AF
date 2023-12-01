<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_ficha = $_POST["id_ficha"];

    $sql = "CALL EliminarFicha($id_ficha)";
/**este esta bueno msg */
    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar LA FICHA: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>