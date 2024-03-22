<?php
ob_start();
include "../php/conexion_be.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_organizacion = $_POST["id_organizacion"];
    $organizacion = $_POST["organizacion"];
    $id_tipo_organizacion = $_POST["id_tipo_organizacion"];
    $descripcion = $_POST["descripcion"];


     // Verifica si ya existe una categoría de cultivo con el mismo nombre
   $sql_verificar = "SELECT * FROM tbl_organizaciones WHERE organizacion = '$organizacion' AND id_organizacion != '$id_organizacion'";
   $resultado_verificar = $conexion->query($sql_verificar);
   if ($resultado_verificar->num_rows > 0) {
       // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
       echo "existe";

   } else {

    $sql = "CALL EditarOrganizacion('$id_organizacion', '$organizacion', '$id_tipo_organizacion', '$descripcion');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar la Organizacion: " . mysqli_error($conexion);
    }
}  
    mysqli_close($conexion);
}
?>