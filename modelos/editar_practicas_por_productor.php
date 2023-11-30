<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Practica_Produccion = $_POST["Id_Practica_Produccion"];
    $Id_Ficha = $_POST["Id_Ficha"];
    $Id_Productor = $_POST["Id_Productor"];
    $Id_Tipo_Practica = $_POST["Id_Tipo_Practica"];
    $Descripcion = $_POST["Descripcion"];
    $Modificado_Por = $_SESSION["usuario"]["usuario"];
    $estado = $_POST["estado"];
 

    $sql = "CALL ActualizarPracticaProduccion('$Id_Practica_Produccion', '$Id_Ficha', '$Id_Productor' , '$Id_Tipo_Practica', '$Descripcion', '$Modificado_Por','$estado');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el Tipo de produccion: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>