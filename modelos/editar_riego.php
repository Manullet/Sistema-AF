<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_tipo_riego = $_POST["id_tipo_riego"];
    $tipo_riego = $_POST["tipo_riego"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];


    $sql_verificar = "SELECT * FROM tbl_tipo_riego WHERE tipo_riego = '$tipo_riego' AND id_tipo_riego != '$id_tipo_riego'";
   $resultado_verificar = $conexion->query($sql_verificar);
   if ($resultado_verificar->num_rows > 0) {
    // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
    echo "existe";

} else {

    $sql = "CALL EditarRiego('$id_tipo_riego', '$tipo_riego', '$descripcion', '$estado');";

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