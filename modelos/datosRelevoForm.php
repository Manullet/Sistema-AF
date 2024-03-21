<?php
// Incluye el archivo de conexión a la base de datos
ob_start();
include "../php/conexion_be.php";
session_start();

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $idFicha=$_SESSION['id_ficha'];

    $sql = "SELECT id_productor from tbl_productor where id_ficha='$idFicha' limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();
   
    $idProductor = $row['id_productor'];

    // Obtener datos del formulario
    $creado_por = $_SESSION["usuario"]["usuario"]; // Reemplaza con la lógica adecuada para obtener el nombre de usuario

    // Verifica si se seleccionó "Si" para relevo generacional
    if (isset($_POST['relevo']) && $_POST['relevo'] == 'Si') {
        $tendra_relevo = 'S';
        $cuantos_relevos = isset($_POST['cuantos']) ? $_POST['cuantos'] : 0;
    } else {
        $tendra_relevo = 'N';
        $cuantos_relevos = 0;
    }

    // Llamar al procedimiento almacenado
    $sql = "CALL InsertRelevoData($idFicha, $idProductor, '$tendra_relevo', '$cuantos_relevos', '$creado_por')";

    if (mysqli_query($conexion, $sql)) {
        // Redirige a la siguiente página
        header("Location: siguiente_pagina.php");
        exit(); // Detener la ejecución del script
    } else {
        echo "Error al guardar los datos: " . mysqli_error($conexion);
    }

    // Cierra la conexión a la base de datos
    mysqli_close($conexion);
}
?>
