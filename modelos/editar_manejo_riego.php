<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Manejo_Riego = $_POST["Id_Manejo_Riego"];
    $Id_Ficha = $_POST["Id_Ficha"];
    $Id_Ubicacion = $_POST["Id_Ubicacion"];
    $Id_Productor = $_POST["Id_Productor"];
    $Tiene_Riego = $_POST["Tiene_Riego"];
    $Superficie_Riego = $_POST["Superficie_Riego"];
    $Id_Medida_Superficie_Riego = $_POST["Id_Medida_Superficie_Riego"];
    $Id_Tipo_Riego = $_POST["Id_Tipo_Riego"];
    $Fuente_Agua = $_POST["Fuente_Agua"];
    $Disponibilidad_Agua_Meses = $_POST["Disponibilidad_Agua_Meses"];
    $Descripcion = $_POST["Descripcion"];
    $Modificado_Por = $_SESSION["usuario"]["usuario"];
    $Estado = $_POST["Estado"];
 

    $sql = "CALL ActualizarManejoRiego('$Id_Manejo_Riego', '$Id_Ficha', '$Id_Ubicacion' , '$Id_Productor','$Tiene_Riego', '$Superficie_Riego', '$Id_Medida_Superficie_Riego' , '$Id_Tipo_Riego','$Fuente_Agua', '$Disponibilidad_Agua_Meses', '$Descripcion', '$Modificado_Por','$Estado');";

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