<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los valores del formulario o de donde los estés obteniendo
    $id_ficha = $_POST["id_ficha"];
    $id_productor = $_POST["id_productor"];
    $genero = $_POST["genero"];
    $edad = $_POST["edad"];
    $descripcion = $_POST["descripcion"];
    $creado_por = $_SESSION["usuario"]['usuario'];

    // Llamar al procedimiento almacenado
    $sql = "CALL InsertarComposicion(
        '$id_ficha',
        '$id_productor',
        '$genero',
        '$edad',
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
