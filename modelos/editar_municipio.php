<?php
ob_start();
include "../php/conexion_be.php";
session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Municipio = $_POST["Id_Municipio"];
    $Id_Departamento = $_POST["Id_Departamento"];
    $Nombre_Municipio = $_POST["Nombre_Municipio"];
    $Descripcion = $_POST["Descripcion"];
    $Modificado_Por = $_SESSION["usuario"]["usuario"];
    $Estado = $_POST["Estado"];
    
     // Verifica si ya existe una categoría de cultivo con el mismo nombre
   $sql_verificar = "SELECT * FROM tbl_municipios WHERE Nombre_Municipio = '$Nombre_Municipio' AND Id_Municipio != '$Id_Municipio'";
   $resultado_verificar = $conexion->query($sql_verificar);
   if ($resultado_verificar->num_rows > 0) {
       // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
       echo "existe";

   } else {

    $sql = "CALL ActualizarMunicipio('$Id_Municipio','$Id_Departamento' ,'$Nombre_Municipio', '$Descripcion', '$Modificado_Por','$Estado');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el municipio: " . mysqli_error($conexion);
    }
}
    mysqli_close($conexion);
}
?>