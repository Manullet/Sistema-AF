<?php

include "../php/conexion_be.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Tipo_Negocio = $_POST["Id_Tipo_Negocio"];
    $Total_Ingreso = $_POST["Total_Ingreso"];
    $Id_Periodo = $_POST["Id_Periodo"];
    $Descripcion_Otros = $_POST["Descripcion_Otros"];

    $sql = "CALL InsertarIngresoFamiliar(
        '$Id_Tipo_Negocio',
        '$Total_Ingreso',
        '$Id_Periodo',
        '$Descripcion_Otros'
    )";

    if (mysqli_query($conexion, $sql)) {
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