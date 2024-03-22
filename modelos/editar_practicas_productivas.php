<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_tipo_practica = $_POST["id_tipo_practica"];
    $tipo_practica = $_POST["tipo_practica"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];

    // Verifica si ya existe una categoría de cultivo con el mismo nombre
    $sql_verificar = "SELECT * FROM tbl_tipo_practicas_productivas WHERE tipo_practica = '$tipo_practica' AND id_tipo_practica != '$id_tipo_practica'";
    $resultado_verificar = $conexion->query($sql_verificar);
    if ($resultado_verificar->num_rows > 0) {
        // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
        echo "existe";
    } else {

        $sql = "CALL EditarPracticas('$id_tipo_practica', '$tipo_practica', '$descripcion', '$estado');";

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
