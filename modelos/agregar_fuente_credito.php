<?php

ob_start();
include "../php/conexion_be.php";
session_start();


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fuente_credito = $_POST["fuente_credito"];
    $descripcion = $_POST["descripcion"];
    $usuario = $_SESSION["usuario"]["usuario"];

    // Llamada al procedimiento almacenado adaptado
    $sql = "CALL InsertarFuenteCredito('$fuente_credito', '$descripcion', '$usuario')";

    if (mysqli_query($conexion, $sql)) {
        header("Location: ../bienvenida.php?success=true");
        exit();
    } else {
        if (mysqli_errno($conexion) == 1062) {
            echo '<div class="alert alert-danger text-center">Error: La fuente de crédito ya existe</div>';
        } else {
            echo '<div class="alert alert-warning text-center">Error al insertar la fuente de crédito</div>';
        }
    }
    
    mysqli_close($conexion);
}

?>
