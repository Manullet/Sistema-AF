<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST["id"];
    $nombre=$_POST["Nombre"];
    $estado=$_POST["estado"];
    
    $Modificado_Por = $_SESSION["usuario"] ['usuario'];

    $sql = "UPDATE tbl_siembra SET Tipo_siembra = '$nombre', Estado = '$estado', Modificado_Por = '$Modificado_Por'
    where Id_siembra = $id";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar la aldea: " . mysqli_error($conexion);
    }
} 
    mysqli_close($conexion);
?>