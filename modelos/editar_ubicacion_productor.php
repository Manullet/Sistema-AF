<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los valores del formulario o de donde los estés obteniendo
    $id_ubicacion = $_POST["id_ubicacion"];
    $id_ficha = $_POST["id_ficha"];
    $id_productor = $_POST["id_productor"];
    $id_departamento = $_POST["id_departamento"];
    $id_municipio = $_POST["id_municipio"];
    $id_aldea = $_POST["id_aldea"];
    $id_caserio = $_POST["id_caserio"];
    $ubicacion_geografica = $_POST["ubicacion_geografica"];
    $distancia_parcela_vivienda = $_POST["distancia_parcela_vivienda"];
    $latitud_parcela = $_POST["latitud_parcela"];
    $longitud_parcela = $_POST["longitud_parcela"];
    $msnm = $_POST["msnm"];
    $direccion_1 = $_POST["direccion_1"];
    $direccion_2 = $_POST["direccion_2"];
    $direccion_3 = $_POST["direccion_3"];
    $vive_en_finca = $_POST["vive_en_finca"];
    $nombre_finca = $_POST["nombre_finca"];
    $descripcion = $_POST["descripcion"];
    $modificado_por = $_SESSION["usuario"]['usuario'];
    $estado = $_POST["estado"];

    // Llamar al procedimiento almacenado
    $sql = "CALL ActualizarUbicacionProductor(
        '$id_ubicacion',
        '$id_ficha',
        '$id_productor',
        '$id_departamento',
        '$id_municipio',
        '$id_aldea',
        '$id_caserio',
        '$ubicacion_geografica',
        '$distancia_parcela_vivienda',
        '$latitud_parcela',
        '$longitud_parcela',
        '$msnm',
        '$direccion_1',
        '$direccion_2',
        '$direccion_3',
        '$vive_en_finca',
        '$nombre_finca',
        '$descripcion',
        '$modificado_por',
        '$estado'
    );";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush();
        echo "success";
    } else {
        ob_end_clean();
        echo "Error al actualizar el productor: " . mysqli_error($conexion);
    }

    mysqli_close($conexion);
}
?>
