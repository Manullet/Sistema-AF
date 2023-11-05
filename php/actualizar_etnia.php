<?php
ob_start();

include 'conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_etnia = $_POST["id_etnia"];
    $etnia = $_POST["etnia"];
    $descripcion = $_POST["descripcion"];
    $estado = $_POST["estado"];
 
    $sql = "CALL UpdateEtnia('$id_etnia', '$etnia', '$descripcion', '$estado')";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al actualizar el la etnia: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>