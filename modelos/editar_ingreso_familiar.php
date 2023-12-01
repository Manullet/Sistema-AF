<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {


    $Id_Ingreso_Familiar=$_POST["Id_Ingreso_Familiar"];
    $Id_Ficha=$_POST["Id_Ficha"];
    
    $Id_Productor=$_POST["Id_Productor"];

    $Id_Tipo_Negocio=$_POST["Id_Tipo_Negocio"];
    $Total_Ingreso=$_POST["Total_Ingreso"];


    $Id_Periodo_Ingreso=$_POST["Id_Periodo_Ingreso"];
    $Descripcion_Otros=$_POST["Descripcion_Otros"];



    $Descripcion=$_POST["Descripcion"];
    

    $Modificado_Por = $_SESSION["usuario"]["usuario"];
    $estado=$_POST["estado"];


    $sql = "CALL ActualizarIngresoFamiliar('$Id_Ingreso_Familiar','$Id_Ficha', '$Id_Productor', '$Id_Tipo_Negocio','$Total_Ingreso', '$Id_Periodo_Ingreso','$Descripcion_Otros','$Descripcion', '$Modificado_Por','$estado')";

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