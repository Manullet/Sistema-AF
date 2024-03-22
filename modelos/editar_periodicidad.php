<?php
ob_start();
include "../php/conexion_be.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_periodo = $_POST["id_periodo"];
    $periodo = $_POST["periodo"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];
    
    $sql_verificar = "SELECT * FROM tbl_periodicidad WHERE periodo = '$periodo' AND id_periodo != '$id_periodo'";
   $resultado_verificar = $conexion->query($sql_verificar);
   if ($resultado_verificar->num_rows > 0) {
    // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
    echo "existe";

} else {

    $sql = "CALL EditarPeriodicidad('$id_periodo', '$periodo', '$descripcion', '$estado');";

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