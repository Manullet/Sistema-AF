<?php
ob_start();
include "../php/conexion_be.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_motivo=$_POST["Id_motivo"];
    $Motivo=$_POST["Motivo"];
    $Descripcion=$_POST["Descripcion"];
    $Estado=$_POST["Estado"];


    $sql = "CALL EditarMotivo('$Id_motivo', '$Motivo', '$Descripcion', '$Estado');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el periodo: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);  
    }

?>