<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_ficha=$_POST["id_ficha"];
    $fecha_solicitud=$_POST["fecha_solicitud"];
    $anio_solicitud=$_POST["anio_solicitud"];

    $descripcion=$_POST["descripcion"];
    $fecha_entrevista=$_POST["fecha_entrevista"];

    $nombre_encuentrador=$_POST["nombre_encuentrador"];
    $nombre_encuestador=$_POST["nombre_encuestador"];
    $nombre_supervisor=$_POST["nombre_supervisor"];



    
    $modificado_por = $_SESSION["usuario"]["usuario"];
    $estado=$_POST["estado"];


    $sql = "CALL ActualizarFicha('$id_ficha','$fecha_solicitud', '$anio_solicitud', '$descripcion','$fecha_entrevista','$nombre_encuentrador', '$nombre_encuestador','$nombre_supervisor','$modificado_por','$estado')";

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