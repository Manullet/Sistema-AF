<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Cacerio = $_POST["Id_Cacerio"];
    $Id_Aldea = $_POST["Id_Aldea"];
    $Id_Municipio = $_POST["Id_Municipio"];
    $Id_Departamento = $_POST["Id_Departamento"];


    $Nombre_Cacerio = $_POST["Nombre_Cacerio"];
    $Descripcion = $_POST["Descripcion"];
    $Modificado_Por = $_SESSION["usuario"]["usuario"];
    $Estado = $_POST["Estado"];
   
     // Verifica si ya existe una categoría de cultivo con el mismo nombre
   $sql_verificar = "SELECT * FROM tbl_cacerios WHERE Nombre_Cacerio = '$Nombre_Cacerio' AND Id_Cacerio != '$Id_Cacerio'";
   $resultado_verificar = $conexion->query($sql_verificar);
   if ($resultado_verificar->num_rows > 0) {
       // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
       echo "existe";

   } else {
    

    $sql = "CALL ActualizarCacerio('$Id_Cacerio','$Id_Aldea','$Id_Municipio','$Id_Departamento' ,'$Nombre_Cacerio', '$Descripcion','$Modificado_Por' ,'$Estado');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el cacerio: " . mysqli_error($conexion);
    }
} 
    mysqli_close($conexion);
}
?>