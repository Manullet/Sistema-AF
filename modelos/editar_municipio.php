<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Municipio = $_POST["Id_Municipio"];
    $Nombre_Municipio = $_POST["Nombre_Municipio"];
    $Descripcion = $_POST["Descripcion"];
    $Estado = $_POST["Estado"];
    $Id_Departamento = $_POST["Id_Departamento"];

    $sql = "CALL EditarMunicipio('$Id_Municipio', '$Nombre_Municipio', '$Descripcion', '$Estado', '$Id_Departamento');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el municipio: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>