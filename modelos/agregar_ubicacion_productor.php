<?php
ob_start();
include "../php/conexion_be.php";
session_start();


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los valores del formulario o de donde los estés obteniendo
    $id_ficha = $_POST["id_ficha"];
    $id_productor = $_POST["id_productor"];
    $id_ubicacion = $_POST["id_ubicacion"];//esta es el id principal
    $id_departamento = $_POST["id_departamento"];
    $id_municipio = $_POST["id_municipio"];
    $id_aldea = $_POST["id_aldea"];
    $id_caserio = $_POST["id_caserio"];//error aqui no se
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
    $creado_por = $_SESSION["usuario"]["usuario"];

    // Llamar al procedimiento almacenado
    $sql = "CALL InsertarUbicacionProductor(
        '$id_ficha',
        '$id_productor',
        '$id_ubicacion',
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
        '$creado_por'
    );";

    if (mysqli_query($conexion,$sql)) {
        header("Location: ../bienvenida.php?success=true");
        exit();
    } else {
        if (mysqli_errno($conexion) == 1062) {
            echo '<div class="alert alert-danger text-center">Error ID Ya Existente</div>';
        } else {
            echo '<div class="alert alert-warning text-center">Algunos Campos Estan Vacios</div>';
        }
        
    }
    
    mysqli_close($conexion);
}
?>
