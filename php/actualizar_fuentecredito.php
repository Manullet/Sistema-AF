<?php
ob_start();

include 'conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_fuente_credito = $_POST["id_fuente_credito"];
    $fuente_credito = $_POST["fuente_credito"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];

    // Verifica si ya existe una categoría de cultivo con el mismo nombre
    $sql_verificar = "SELECT * FROM tbl_fuentes_credito WHERE fuente_credito = '$fuente_credito' AND id_fuente_credito != '$id_fuente_credito'";
    $resultado_verificar = $conexion->query($sql_verificar);
    if ($resultado_verificar->num_rows > 0) {
        // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
        echo "existe";
    } else {

        $sql = "CALL UpdateFuenteCredito('$id_fuente_credito', '$fuente_credito', '$descripcion', '$estado')";

        if (mysqli_query($conexion, $sql)) {
            ob_end_flush();
            echo "success";
        } else {
            ob_end_clean();
            echo "Error al actualizar el la etnia: " . mysqli_error($conexion);
        }
    }
    mysqli_close($conexion);
}
