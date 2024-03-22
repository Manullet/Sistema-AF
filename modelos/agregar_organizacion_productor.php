<?php
ob_start();
include "../php/conexion_be.php";
session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_ficha = $_POST["id_ficha"];
    $id_organizacion = $_POST["id_organizacion"];
    $id_productor = $_POST["id_productor"];
    $descripcion = $_POST["descripcion"];
    $creado_por = $_SESSION["usuario"] ['usuario'];

    // Utilizando una consulta preparada para evitar la inyección de SQL
    $sql = "CALL InsertarRegistro('$id_ficha', '$id_organizacion','$id_productor' ,'$descripcion', '$creado_por')";

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