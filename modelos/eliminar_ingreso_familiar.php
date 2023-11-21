<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $Id_Ingreso_Familiar = $_POST["Id_Ingreso_Familiar"];

    $sql = "CALL EliminarIngresoFamiliar($Id_Ingreso_Familiar)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el ingreso familiar: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>