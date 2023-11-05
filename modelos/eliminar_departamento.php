<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $Id_Departamento = $_POST["Id_Departamento"];

    $sql = "CALL EliminarDepartamento($Id_Departamento)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el departamento: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>