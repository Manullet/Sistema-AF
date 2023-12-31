<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Ficha = $_POST["Id_Ficha"];
    $Id_Ubicacion = $_POST["Id_Ubicacion"];
    $Id_Productor = $_POST["Id_Productor"];
    $Id_Tipo_Produccion = $_POST["Id_Tipo_Produccion"];
    $Cantidad_Produccion = $_POST["Cantidad_Produccion"];
    $Id_Medida_Produccion = $_POST["Id_Medida_Produccion"];
    $Cantidad_Vendida = $_POST["Cantidad_Vendida"];
    $Id_Medida_Venta = $_POST["Id_Medida_Venta"];
    $Precio_Venta = $_POST["Precio_Venta"];
    $A_Quien_Se_Vendio = $_POST["A_Quien_Se_Vendio"];
    $Creado_Por = $_SESSION["usuario"]["usuario"];
    

    $sql = "CALL InsertarProduccionComercializacion(
        '$Id_Ficha',
        '$Id_Ubicacion',
        '$Id_Productor',
        '$Id_Tipo_Produccion',
        '$Cantidad_Produccion',
        '$Id_Medida_Produccion',
        '$Cantidad_Vendida',
        '$Id_Medida_Venta',
        '$Precio_Venta',
        '$A_Quien_Se_Vendio',
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