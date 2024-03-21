<?php
ob_start();
include "../php/conexion_be.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_motivo=$_POST["Id_motivo"];
    $Motivo=$_POST["Motivo"];
    $Descripcion=$_POST["Descripcion"];
    $Estado=$_POST["Estado"];



    // Verifica si ya existe una categoría de cultivo con el mismo nombre
   $sql_verificar = "SELECT * FROM tbl_motivos_migracion WHERE Motivo = '$Motivo' AND Id_motivo != '$Id_motivo'";
   $resultado_verificar = $conexion->query($sql_verificar);
   if ($resultado_verificar->num_rows > 0) {
    // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
    echo "existe";

} else {


    $sql = "CALL EditarMotivo('$Id_motivo', '$Motivo', '$Descripcion', '$Estado');";

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