<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_tipo_negocio = $_POST["id_tipo_negocio"];
    $tipo_negocio = $_POST["tipo_negocio"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];

    // Verifica si ya existe una categoría de cultivo con el mismo nombre
    $sql_verificar = "SELECT * FROM tbl_tipo_negocios WHERE tipo_negocio = '$tipo_negocio' AND id_tipo_negocio != '$id_tipo_negocio'";
    $resultado_verificar = $conexion->query($sql_verificar);
    if ($resultado_verificar->num_rows > 0) {
        // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
        echo "existe";
    } else {

        $sql = "CALL EditarTipo_Negocio('$id_tipo_negocio', '$tipo_negocio', '$descripcion', '$estado');";

        if (mysqli_query($conexion, $sql)) {
            ob_end_flush();
            echo "success";
        } else {
            ob_end_clean();
            echo "Error al actualizar el Tipo de negocio: " . mysqli_error($conexion);
        }
    }

    mysqli_close($conexion);
}
