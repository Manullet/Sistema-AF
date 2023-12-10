<?php
ob_start();
include "../php/conexion_be.php";
session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Departamento = $_POST["Id_Departamento"];
    $Nombre_Departamento = $_POST["Nombre_Departamento"];
    $Descripcion = $_POST["Descripcion"];
    $Modificado_Por = $_SESSION["usuario"]["usuario"];
    $Estado = $_POST["Estado"];

    $sql = "CALL ActualizarDepartamento('$Id_Departamento', '$Nombre_Departamento', '$Descripcion', '$Modificado_Por','$Estado');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el departamento: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>