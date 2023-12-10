<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Aldea = $_POST["Id_Aldea"];
    $Id_Departamento=$_POST["Id_Departamento"];

    $Id_Municipio = $_POST["Id_Municipio"];
    $Nombre_Aldea = $_POST["Nombre_Aldea"];
    $Descripcion = $_POST["Descripcion"];
    
    $Modificado_Por = $_SESSION["usuario"] ['usuario'];
    $Estado = $_POST["Estado"];

    $sql = "CALL ActualizarAldea('$Id_Aldea', '$Id_Departamento', '$Id_Municipio', '$Nombre_Aldea','$Descripcion', '$Modificado_Por', '$Estado');";

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