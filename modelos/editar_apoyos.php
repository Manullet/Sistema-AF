<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_apoyo_produccion  = $_POST["id_apoyo_produccion"];
    $tipo_apoyo_produccion = $_POST["tipo_apoyo_produccion"];
    $descripcion = $_POST["descripcion"];
    $modificado_por = $_SESSION["usuario"]["usuario"];
    $estado = $_POST["estado"];
    // Verifica si ya existe una categoría de cultivo con el mismo nombre
    $sql_verificar = "SELECT * FROM tbl_apoyos WHERE tipo_apoyo_produccion = '$tipo_apoyo_produccion' AND id_apoyo_produccion != '$id_apoyo_produccion'";
    $resultado_verificar = $conexion->query($sql_verificar);
    if ($resultado_verificar->num_rows > 0) {
        // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
        echo "existe";
    } else {

        $sql = "CALL ActualizarApoyos('$id_apoyo_produccion', '$tipo_apoyo_produccion', '$descripcion','$modificado_por' ,'$estado');";

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
?>