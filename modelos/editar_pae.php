<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_actividad_ext=$_POST["id_actividad_ext"];
    $id_ficha=$_POST["id_ficha"];
    $id_productor=$_POST["id_productor"];

    $miembros_realizan_actividades_fuera_finca=$_POST["miembros_realizan_actividades_fuera_finca"];
    $id_tomador_decisiones=$_POST["id_tomador_decisiones"];



    $descripcion=$_POST["descripcion"];
    $modificado_por = $_SESSION["usuario"]["usuario"];
    $estado=$_POST["estado"];


    $sql = "CALL ActualizarActividadExterna('$id_actividad_ext','$id_ficha', '$id_productor', '$miembros_realizan_actividades_fuera_finca','$id_tomador_decisiones','$descripcion', '$modificado_por','$estado')";

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