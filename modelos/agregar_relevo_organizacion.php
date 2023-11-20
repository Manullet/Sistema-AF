<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtén los datos del formulario
    $id_ficha = $_POST["id_ficha"];
    $id_productor = $_POST["id_productor"];
    $tendra_relevo = $_POST["tendra_relevo"];
    $cuantos_relevos = $_POST["cuantos_relevos"];
    $descripcion = $_POST["descripcion"];
    $creado_por = $_SESSION["usuario"]["usuario"]; // Asegúrate de ajustar esto según tu estructura de sesión

    // Llama al procedimiento almacenado
    $sql = "CALL InsertarRelevoOrganizacion('$id_ficha', '$id_productor', '$tendra_relevo', '$cuantos_relevos', '$descripcion','$creado_por');";

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
