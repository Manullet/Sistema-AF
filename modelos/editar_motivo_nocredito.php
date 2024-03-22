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

    // Verifica si ya existe una categoría de cultivo con el mismo nombre
    $sql_verificar = "SELECT * FROM tbl_motivos_no_creditos WHERE motivo_no_credito = '$motivo_no_credito' AND id_motivos_no_credito != '$id_motivos_no_credito'";
    $resultado_verificar = $conexion->query($sql_verificar);
    if ($resultado_verificar->num_rows > 0) {
        // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
        echo "existe";
    } else {

        $sql = "CALL ActualizarMotivoNoCredito('$id_motivos_no_credito', '$motivo_no_credito', '$descripcion', '$estado', '$modificado_por');";

        if (mysqli_query($conexion, $sql)) {
            ob_end_flush();
            echo "success";
        } else {
            ob_end_clean();
            echo "Error al actualizar el mptivo de credito: " . mysqli_error($conexion);
        }
    }

    mysqli_close($conexion);
}
