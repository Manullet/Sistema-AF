<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los valores del formulario o de donde los estés obteniendo
    $Id_Ubicacion = $_POST["Id_Ubicacion"];
    $Id_Ficha = $_POST["Id_Ficha"];
    $Id_Productor = $_POST["Id_Productor"];
    $Tipo_De_Manejo = $_POST["Tipo_De_Manejo"];
    $Superficie_Produccion = $_POST["Superficie_Produccion"];
    $Id_Medida_Produccion = $_POST["Id_Medida_Produccion"];
    $Superficie_Agricultura = $_POST["Superficie_Agricultura"];
    $Id_Medida_Agricultura = $_POST["Id_Medida_Agricultura"];
    $Superficie_Ganaderia = $_POST["Superficie_Ganaderia"];
    $Id_Medida_Ganaderia = $_POST["Id_Medida_Ganaderia"];
    $Superficie_Apicultura = $_POST["Superficie_Apicultura"];
    $Id_Medida_Apicultura = $_POST["Id_Medida_Apicultura"];
    $Superficie_Forestal = $_POST["Superficie_Forestal"];
    $Id_Medida_Forestal = $_POST["Id_Medida_Forestal"];
    $Superficie_Acuacultura = $_POST["Superficie_Acuacultura"];
    $Numero_Estanques = $_POST["Numero_Estanques"];
    $Superficie_Agroturismo = $_POST["Superficie_Agroturismo"];
    $Superficie_Otros = $_POST["Superficie_Otros"];
    $Otros_Descripcion = $_POST["Otros_Descripcion"];
    $Descripcion = $_POST["Descripcion"];
    $Creado_Por = $_POST["Creado_Por"];

    // Llamar al procedimiento almacenado
    $sql = "CALL InsertarUnidadProductora(
        '$Id_Ubicacion',
        '$Id_Ficha',
        '$Id_Productor',
        '$Tipo_De_Manejo',
        '$Superficie_Produccion',
        '$Id_Medida_Produccion',
        '$Superficie_Agricultura',
        '$Id_Medida_Agricultura',
        '$Superficie_Ganaderia',
        '$Id_Medida_Ganaderia',
        '$Superficie_Apicultura',
        '$Id_Medida_Apicultura',
        '$Superficie_Forestal',
        '$Id_Medida_Forestal',
        '$Superficie_Acuacultura',
        '$Numero_Estanques',
        '$Superficie_Agroturismo',
        '$Superficie_Otros',
        '$Otros_Descripcion',
        '$Descripcion',
        '$Creado_Por'
    );";

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
