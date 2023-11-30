<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_apoyo_ext=$_POST["id_apoyo_ext"];
    $id_ficha=$_POST["id_ficha"];
    $id_productor=$_POST["id_productor"];

    $recibe_apoyo_prodagrícola=$_POST["recibe_apoyo_prodagrícola"];
    $atencion_por_UAG=$_POST["atencion_por_UAG"];
    $productos_vendidospor_pralesc=$_POST["productos_vendidospor_pralesc"];
    



    $descripcion=$_POST["descripcion"];
    $modificado_por = $_SESSION["usuario"]["usuario"];
    $estado=$_POST["estado"];


    $sql = "CALL ActualizarApoyoActividadExterna('$id_apoyo_ext','$id_ficha', '$id_productor', '$recibe_apoyo_prodagrícola', '$atencion_por_UAG', '$productos_vendidospor_pralesc','$descripcion', '$modificado_por','$estado')";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el Tipo de produccion: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>