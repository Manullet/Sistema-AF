<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_pertenece_organizacion=$_POST["id_pertenece_organizacion"];
    $id_ficha=$_POST["id_ficha"];
    $id_productor=$_POST["id_productor"];

    $pertenece_a_organizacion=$_POST["pertenece_a_organizacion"];
    $descripcion=$_POST["descripcion"];

    $modificado_por = $_SESSION["usuario"]["usuario"];
    $estado=$_POST["estado"];


    $sql = "CALL ActualizarBaseOrganizacion('$id_pertenece_organizacion','$id_ficha', '$id_productor', '$pertenece_a_organizacion','$descripcion', '$modificado_por','$estado')";

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