<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtén los datos del formulario
    $Id_Relevo = $_POST["Id_Relevo"];
    $id_ficha = $_POST["id_ficha"];
    $id_productor = $_POST["id_productor"];
    $tendra_relevo = $_POST["tendra_relevo"];
    $cuantos_relevos = $_POST["cuantos_relevos"];
    $descripcion = $_POST["descripcion"];
    $modificado_por = $_SESSION["usuario"]["usuario"]; // Asegúrate de ajustar esto según tu estructura de sesión
    $estado = $_POST["estado"]; // Agregado estado

    // Llama al procedimiento almacenado
    $sql = "CALL ActualizarRelevoOrganizacion('$Id_Relevo', '$id_ficha', '$id_productor', '$tendra_relevo', '$cuantos_relevos', '$descripcion', '$modificado_por', '$estado');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar Relevo: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>