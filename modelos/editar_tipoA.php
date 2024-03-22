<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_tipo_apoyos  = $_POST["id_tipo_apoyos"];
    $tipo_apoyos = $_POST["tipo_apoyos"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];

    // Verifica si ya existe una categoría de cultivo con el mismo nombre
    $sql_verificar = "SELECT * FROM tbl_tipos_apoyos WHERE tipo_apoyos = '$tipo_apoyos' AND id_tipo_apoyos != '$id_tipo_apoyos'";
    $resultado_verificar = $conexion->query($sql_verificar);
    if ($resultado_verificar->num_rows > 0) {
        // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
        echo "existe";
    } else {

        $sql = "CALL EditarTipoApoyo('$id_tipo_apoyos', '$tipo_apoyos', '$descripcion', '$estado');";

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
