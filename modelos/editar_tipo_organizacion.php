<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_tipo_organizacion = $_POST["id_tipo_organizacion"];
    $tipo_organizacion = $_POST["tipo_organizacion"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];

     // Verifica si ya existe una categoría de cultivo con el mismo nombre
   $sql_verificar = "SELECT * FROM tbl_tipo_organizacion WHERE tipo_organizacion = '$tipo_organizacion' AND id_tipo_organizacion != '$id_tipo_organizacion'";
   $resultado_verificar = $conexion->query($sql_verificar);
   if ($resultado_verificar->num_rows > 0) {
       // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
       echo "existe";

   } else {

    $sql = "CALL EditarTipo_Organizacion('$id_tipo_organizacion', '$tipo_organizacion', '$descripcion', '$estado');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el Tipo de Organizacion: " . mysqli_error($conexion);
    }
} 
    mysqli_close($conexion);
}
?>