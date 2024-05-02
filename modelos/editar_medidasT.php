<?php
ob_start();
session_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_medida  = $_POST["id_medida"];
    $medida = $_POST["medida"];
    $descripcion = $_POST["descripcion"];
    $Modificado_Por = $_SESSION["usuario"] ['usuario'];
    $estado = $_POST["estado"];



    $sql_verificar = "SELECT * FROM tbl_medidas_tierra WHERE medida = '$medida' AND id_medida != '$id_medida'";
   $resultado_verificar = $conexion->query($sql_verificar);
   if ($resultado_verificar->num_rows > 0) {
    // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
    echo "existe";

} else {



    $sql = "CALL ActualizarMedidaTierra('$id_medida', '$medida', '$descripcion','$Modificado_Por' ,'$estado');";

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