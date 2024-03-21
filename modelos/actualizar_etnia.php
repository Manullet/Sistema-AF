<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_etnia_to_update = $_POST["id_etnia"];
    $nombre_etnia = $_POST["etnia"];
    $descripcion_etnia = $_POST["descripcion"];
    $usuario = $_SESSION["usuario"]["usuario"];
    $estado = $_POST["estado"];

    // Llamada al procedimiento almacenado adaptado
    $sql = "CALL ActualizarEtnia('$id_etnia_to_update', '$nombre_etnia', '$descripcion_etnia', '$usuario', '$estado')";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush();
        echo "success";
    } else {
        ob_end_clean();
        echo "Error al actualizar la etnia: " . mysqli_error($conexion);
    }

    mysqli_close($conexion);
}
?>
