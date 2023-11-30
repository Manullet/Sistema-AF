<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") { 
    $id_motivos_no_credito  = $_POST["id_motivos_no_credito"];
    $motivo_no_credito = $_POST["motivo_no_credito"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];
    $modificado_por = $_SESSION["usuario"]["usuario"];

    $sql = "CALL ActualizarMotivoNoCredito('$id_motivos_no_credito', '$motivo_no_credito', '$descripcion', '$estado', '$modificado_por');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el mptivo de credito: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?> 