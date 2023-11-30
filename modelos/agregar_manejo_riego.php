<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Ficha = $_POST["Id_Ficha"];
    $Id_Ubicacion = $_POST["Id_Ubicacion"];
    $Id_Productor = $_POST["Id_Productor"];
    $Tiene_Riego = $_POST["Tiene_Riego"];
    $Superficie_Riego = $_POST["Superficie_Riego"];
    $Id_Medida_Superficie_Riego = $_POST["Id_Medida_Superficie_Riego"];
    $Id_Tipo_Riego = $_POST["Id_Tipo_Riego"];
    $Fuente_Agua = $_POST["Fuente_Agua"];
    $Disponibilidad_Agua_Meses = $_POST["Disponibilidad_Agua_Meses"];
    $Descripcion = $_POST["Descripcion"];
    $Creado_Por = $_SESSION["usuario"]["usuario"];

    $sql = "CALL InsertarManejoRiego(
        $Id_Ficha,
        $Id_Ubicacion,
        $Id_Productor,
        '$Tiene_Riego',
        $Superficie_Riego,
        $Id_Medida_Superficie_Riego,
        $Id_Tipo_Riego,
        '$Fuente_Agua',
        $Disponibilidad_Agua_Meses,
        '$Descripcion',
        '$Creado_Por'
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
