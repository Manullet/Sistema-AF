<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Cacerio = $_POST["Id_Cacerio"];
    $Nombre_Cacerio = $_POST["Nombre_Cacerio"];
    $Descripcion = $_POST["Descripcion"];
    $Estado = $_POST["Estado"];
    $Id_Aldea = $_POST["Id_Aldea"];

    $sql = "CALL EditarCacerio('$Id_Cacerio', '$Nombre_Cacerio', '$Descripcion', '$Estado', '$Id_Aldea');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el cacerio: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>