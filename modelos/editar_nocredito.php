<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_nocred=$_POST["id_nocred"];
    $id_ficha=$_POST["id_ficha"];
    $id_productor=$_POST["id_productor"];
    $id_motivos_no_credito=$_POST["id_motivos_no_credito"];
    $descripcion=$_POST["descripcion"];
    $modificado_por = $_SESSION["usuario"]["usuario"];
    $estado=$_POST["estado"];


    $sql = "CALL ActualizarNoCredito('$id_nocred','$id_ficha', '$id_productor', '$id_motivos_no_credito', '$descripcion','$modificado_por','$estado')";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush();
        echo "success";
    } else {
        ob_end_clean();
        echo "Error al actualizar el productor: " . mysqli_error($conexion);
    }

    mysqli_close($conexion);
}
?>