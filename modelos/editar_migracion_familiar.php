<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_migracion=$_POST["id_migracion"];
    $id_ficha=$_POST["id_ficha"];
    $id_productor=$_POST["id_productor"];

    $tiene_migrantes=$_POST["tiene_migrantes"];
    $migracion_dentro_pais=$_POST["migracion_dentro_pais"];

    $migracion_fuera_pais=$_POST["migracion_fuera_pais"];
    $id_tipo_motivos=$_POST["id_tipo_motivos"];
    $remesas=$_POST["remesas"];



    $descripcion=$_POST["descripcion"];
    
    $modificado_por = $_SESSION["usuario"]["usuario"];
    $estado=$_POST["estado"];


    $sql = "CALL ActualizarMigracionFamiliar('$id_migracion','$id_ficha', '$id_productor', '$tiene_migrantes','$migracion_dentro_pais','$migracion_fuera_pais', '$id_tipo_motivos','$remesas','$descripcion', '$modificado_por','$estado')";
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
?>