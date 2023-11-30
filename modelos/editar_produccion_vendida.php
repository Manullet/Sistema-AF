<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Produccion_Vendida = $_POST["Id_Produccion_Vendida"];
    $Año_Venta = $_POST["Año_Venta"];
    $Id_Tipo_Pecuario = $_POST["Id_Tipo_Pecuario"];
    $Precio_Venta = $_POST["Precio_Venta"];
    $Id_Medida_Venta = $_POST["Id_Medida_Venta"];
    $Cantidad_Mercado = $_POST["Cantidad_Mercado"];
    $Modificado_Por = $_SESSION["usuario"]["usuario"];
    $Estado = $_POST["Estado"];


    $sql = "CALL ActualizarProduccionVendida(
        '$Id_Produccion_Vendida',
        '$Año_Venta',
        '$Id_Tipo_Pecuario',
        '$Precio_Venta',
        '$Id_Medida_Venta',
        '$Cantidad_Mercado',
        '$Modificado_Por',
        '$Estado'
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
