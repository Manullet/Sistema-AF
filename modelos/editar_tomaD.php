<?php
session_start();
include "../php/conexion_be.php";
ob_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_tipo_tomador  = $_POST["id_tipo_tomador"];
    $tomador = $_POST["tomador"];
    $descripcion = $_POST["descripcion"];
    $modificado_por = $_SESSION["usuario"]["usuario"];
    $estado = $_POST["estado"];

    // Verifica si ya existe una categoría de cultivo con el mismo nombre
    $sql_verificar = "SELECT * FROM tbl_toma_decisiones WHERE tomador = '$tomador' AND id_tipo_tomador != '$id_tipo_tomador'";
    $resultado_verificar = $conexion->query($sql_verificar);
    if ($resultado_verificar->num_rows > 0) {
        // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
        echo "existe";
    } else {

        $sql = "CALL ActualizarTomadorDecisiones('$id_tipo_tomador', '$tomador', '$descripcion', '$modificado_por','$estado');";

        if (mysqli_query($conexion, $sql)) {
            ob_end_flush();
            echo "success";
        } else {
            ob_end_clean();
            echo "Error al actualizar el periodo: " . mysqli_error($conexion);
        }
    }

    mysqli_close($conexion);
}
