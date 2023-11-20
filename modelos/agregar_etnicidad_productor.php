<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtén los datos del formulario
    $id_ficha = $_POST["id_ficha"];
    $id_productor = $_POST["id_productor"];
    $id_etnia = $_POST["id_etnia"];
    $detalle_de_otros = $_POST["detalle_de_otros"];
    $descripcion = $_POST["descripcion"];
    $creado_por = $_SESSION["usuario"]["usuario"]; // Ajusta según tu estructura de sesión

    // Llama al procedimiento almacenado
    $sql = "CALL InsertarEtniasPorProductor(
        '$id_ficha',
        '$id_productor',
        '$id_etnia',
        '$detalle_de_otros',
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
