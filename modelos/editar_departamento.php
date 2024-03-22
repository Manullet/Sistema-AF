<?php
ob_start();
include "../php/conexion_be.php";
session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Departamento = $_POST["Id_Departamento"];
    $Nombre_Departamento = $_POST["Nombre_Departamento"];
    $Descripcion = $_POST["Descripcion"];
    $Modificado_Por = $_SESSION["usuario"]["usuario"];
    $Estado = $_POST["Estado"];

    // Verifica si ya existe una categoría de cultivo con el mismo nombre
   $sql_verificar = "SELECT * FROM tbl_departamentos WHERE Nombre_Departamento = '$Nombre_Departamento' AND Id_Departamento != '$Id_Departamento'";
   $resultado_verificar = $conexion->query($sql_verificar);
   if ($resultado_verificar->num_rows > 0) {
    // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
    echo "existe";

} else {

    $sql = "CALL ActualizarDepartamento('$Id_Departamento', '$Nombre_Departamento', '$Descripcion', '$Modificado_Por','$Estado');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el departamento: " . mysqli_error($conexion);
    }
}  
    mysqli_close($conexion);
}
?>