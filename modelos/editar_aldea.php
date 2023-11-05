<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Aldea = $_POST["Id_Aldea"];
    $Nombre_Aldea = $_POST["Nombre_Aldea"];
    $Descripcion = $_POST["Descripcion"];
    $Estado = $_POST["Estado"];
    $Id_Municipio = $_POST["Id_Municipio"];

    $sql = "CALL EditarAldea('$Id_Aldea', '$Nombre_Aldea', '$Descripcion', '$Estado', '$Id_Municipio');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar la aldea: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>