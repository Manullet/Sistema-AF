<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Ficha = $_POST["Id_Ficha"];
    $Id_Ubicacion = $_POST["Id_Ubicacion"];
    $Id_Productor = $_POST["Id_Productor"];

    $Año_Produccion = $_POST["Año_Produccion"];
    $Id_Tipo_Pecuario = $_POST["Id_Tipo_Pecuario"];
    $Cantidad_Hembras = $_POST["Cantidad_Hembras"];
    $Cantidad_Machos = $_POST["Cantidad_Machos"];
    $Descripcion_Otros = $_POST["Descripcion_Otros"];
    $Precio_Venta = $_POST["Precio_Venta"];
    $Id_Medida_Venta = $_POST["Id_Medida_Venta"];
    $Cantidad_Mercado = $_POST["Cantidad_Mercado"];
    $Descripcion = $_POST["Descripcion"];
    $Creado_Por = $_SESSION["usuario"]["usuario"];

    $sql = "CALL InsertarProduccionPecuaria(
        '$Id_Ficha',
        '$Id_Ubicacion',
        '$Id_Productor',
        '$Año_Produccion',
        '$Id_Tipo_Pecuario',
        '$Cantidad_Hembras',
        '$Cantidad_Machos',
        '$Descripcion_Otros',
        '$Precio_Venta',
        '$Id_Medida_Venta',
        '$Cantidad_Mercado',
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
