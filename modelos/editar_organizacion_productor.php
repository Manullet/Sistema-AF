<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Organizacion_Productor = $_POST["Id_Organizacion_Productor"];
    $id_ficha = $_POST["id_ficha"];
    $id_productor = $_POST["id_productor"];
    $id_organizacion = $_POST["id_organizacion"];
    $descripcion = $_POST["descripcion"];
    $modificado_por = $_SESSION["usuario"]['usuario'];
    $estado = $_POST["estado"];


    $sql = "CALL ActualizarOrganizacionPorProductor('$Id_Organizacion_Productor', '$id_ficha', '$id_productor', '$id_organizacion', '$descripcion',  '$modificado_por','$estado');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el departamento: " . mysqli_error($conexion);
    }

    mysqli_close($conexion);
}
?>
