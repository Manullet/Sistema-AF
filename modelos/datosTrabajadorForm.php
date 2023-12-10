<?php
// Incluye el archivo de conexión a la base de datos
include 'conexion_be.php';

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Obtener datos del formulario (ajusta los nombres según tus campos)
    $primerNombre = $_POST['primerNombre'];
    $segundoNombre = $_POST['segundoNombre'];
    $primerApellido = $_POST['primerApellido'];
    $segundoApellido = $_POST['segundoApellido'];
    $identidadProductor = $_POST['identidadProductor'];
    $sexoProductor = $_POST['sexoProductor'];
    $fechaNacimiento = $_POST['fechaNacimiento'];
    $estadoCivilProductor = $_POST['estadoCivilProductor'];
    $telefonoPrincipal = $_POST['telefonoPrincipal'];
    $telefonoSecundario = $_POST['telefonoSecundario'];
    $telefonoOpcional = $_POST['telefonoOpcional'];
    $escolaridadProductor = $_POST['escolaridadProductor'];
    $ultimoGradoEscolar = $_POST['ultimoGradoEscolar'];
    $correoPrincipal = $_POST['correoPrincipal'];
    $correoSecundario = $_POST['correoSecundario'];
    $correoOpcional = $_POST['correoOpcional'];

    // Llamar al procedimiento almacenado
    $sql = "CALL Temp_Insertar_Productor(
        '$primerNombre',
        '$segundoNombre',
        '$primerApellido',
        '$segundoApellido',
        '$identidadProductor',
        '$fechaNacimiento',
        '$sexoProductor',
        '$estadoCivilProductor',
        '$escolaridadProductor',
        '$ultimoGradoEscolar',
        '$telefonoPrincipal',
        '$telefonoSecundario',
        '$telefonoOpcional',
        '$correoPrincipal',
        '$correoSecundario',
        '$correoOpcional',
        
    )";

    if (mysqli_query($conexion, $sql)) {
        // Redirige a la siguiente página
        header("Location: siguiente_pagina.php");
        exit(); // Detener la ejecución del script
    } else {
        echo "Error al guardar los datos: " . mysqli_error($conexion);
    }

    mysqli_close($conexion);
}
?>
