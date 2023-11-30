<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_trabajador_ext=$_POST["id_trabajador_ext"];
    $id_ficha=$_POST["id_ficha"];
    $id_productor=$_POST["id_productor"];

    $id_tipo_trabajador=$_POST["id_tipo_trabajador"];
    $cantidad_trabajador=$_POST["cantidad_trabajador"];



    $descripcion=$_POST["descripcion"];
    $modificado_por = $_SESSION["usuario"]["usuario"];
    $estado=$_POST["estado"];


    $sql = "CALL ActualizarTrabajadorExterno('$id_trabajador_ext','$id_ficha', '$id_productor', '$id_tipo_trabajador','$cantidad_trabajador','$descripcion', '$modificado_por','$estado')";
/**este si tira bien el msg  */
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