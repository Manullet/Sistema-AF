<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_tipo_pecuario = $_POST["id_tipo_pecuario"];
    $tipo_pecuario = $_POST["tipo_pecuario"];
    $raza_con_genero = $_POST["raza_con_genero"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];
    $modificado_por = $_SESSION["usuario"]["usuario"];

    $sql_verificar = "SELECT * FROM tbl_tipo_pecuarios WHERE tipo_pecuario = '$tipo_pecuario' AND id_tipo_pecuario != '$id_tipo_pecuario'";
   $resultado_verificar = $conexion->query($sql_verificar);
   if ($resultado_verificar->num_rows > 0) {
    // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
    echo "existe";

} else {

 
    $sql = "CALL ActualizarTipoPecuario('$id_tipo_pecuario', '$tipo_pecuario', '$raza_con_genero', '$descripcion', '$modificado_por','$estado')";

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
?>