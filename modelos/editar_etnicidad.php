<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtén los datos del formulario
    $Id_etnicidad = $_POST["Id_etnicidad"];
    $id_ficha = $_POST["id_ficha"];
    $id_productor = $_POST["id_productor"];
    $id_etnia = $_POST["id_etnia"];
    $detalle_de_otros = $_POST["detalle_de_otros"];
    $descripcion = $_POST["descripcion"];
    $modificado_por = $_SESSION["usuario"]["usuario"]; // Ajusta según tu estructura de sesión
    $estado = $_POST["estado"];

    // Llama al procedimiento almacenado
    $sql = "CALL ActualizarEtniasPorProductor(
        '$Id_etnicidad',
        '$id_ficha',
        '$id_productor',
        '$id_etnia',
        '$detalle_de_otros',
        '$descripcion',
        '$modificado_por',
        '$estado'
    );";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush();
        echo "success";
    } else {
        ob_end_clean();
        echo "Error al actualizar etnia por productor: " . mysqli_error($conexion);
    }

    mysqli_close($conexion);
}
?>
