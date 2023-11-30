<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Ficha = $_POST["Id_Ficha"];
    $Id_Ubicacion = $_POST["Id_Ubicacion"];
    $Id_Productor = $_POST["Id_Productor"];
    $Id_Tipo_Cultivo = $_POST["Id_Tipo_Cultivo"];
    $Superficie_Primera_Postrera = $_POST["Superficie_Primera_Postrera"];
    $Id_Medida_Primera_Postrera = $_POST["Id_Medida_Primera_Postrera"];
    $Produccion_Obtenida = $_POST["Produccion_Obtenida"];
    $Id_Medida_Produccion_Obtenida = $_POST["Id_Medida_Produccion_Obtenida"];
    $Cantidad_Vendida = $_POST["Cantidad_Vendida"];
    $Id_Medida_Vendida = $_POST["Id_Medida_Vendida"];
    $Precio_Venta = $_POST["Precio_Venta"];
    $A_Quien_Se_Vendio = $_POST["A_Quien_Se_Vendio"];
    $Descripcion = $_POST["Descripcion"];
    $Creado_Por = $_SESSION["usuario"]["usuario"];

    $sql = "CALL InsertarProduccionAgricolaAnterior(
        '$Id_Ficha',
        '$Id_Ubicacion',
        '$Id_Productor',
        '$Id_Tipo_Cultivo',
        '$Superficie_Primera_Postrera',
        '$Id_Medida_Primera_Postrera',
        '$Produccion_Obtenida',
        '$Id_Medida_Produccion_Obtenida',
        '$Cantidad_Vendida',
        '$Id_Medida_Vendida',
        '$Precio_Venta',
        '$A_Quien_Se_Vendio',
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
