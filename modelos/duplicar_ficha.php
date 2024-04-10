<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_ficha = $_POST["id_ficha"];

    $sql = "CALL DuplicarFicha($id_ficha)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "<script>CargarContenido('vistas/Llenar_ficha.php','content-wrapper')</script>";
    } else {
        ob_end_clean(); 
        echo "Error al duplicar LA FICHA: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>