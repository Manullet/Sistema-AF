<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_tipo_trabajador  = $_POST["id_tipo_trabajador"];
    $tipo_trabajador = $_POST["tipo_trabajador"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];

    // Verifica si ya existe una categoría de cultivo con el mismo nombre
    $sql_verificar = "SELECT * FROM tbl_tipo_trabajadores WHERE tipo_trabajador = '$tipo_trabajador' AND id_tipo_trabajador != '$id_tipo_trabajador'";
    $resultado_verificar = $conexion->query($sql_verificar);
    if ($resultado_verificar->num_rows > 0) {
        // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
        echo "existe";
    } else {

        $sql = "CALL EditarTipoTrabajador('$id_tipo_trabajador', '$tipo_trabajador', '$descripcion', '$estado');";

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
