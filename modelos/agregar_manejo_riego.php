<?php

include "../php/conexion_be.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Tiene_Riego = $_POST["Tiene_Riego"];
    $Fuente_Agua = $_POST["Fuente_Agua"];
    $Disponibilidad_Agua_Meses = $_POST["Disponibilidad_Agua_Meses"];

    $sql = "CALL InsertarManejoRiego(
        '$Tiene_Riego',
        '$Superficie_Riego',
        '$Id_Medida_Superficie_Riego'
        
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