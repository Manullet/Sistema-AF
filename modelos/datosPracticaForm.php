<?php
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

    // Obtiene los tipos de practicas
    $practicas_seleccionadas = isset($_POST['practicas']) ? $_POST['practicas'] : array();

    // Obtener los ID de los motivos seleccionados
    $id_tipo_practica = array();
    foreach ($practicas_seleccionadas as $practica) {
        // Escapar el motivo para evitar inyección de SQL
        $practica_escapada = mysqli_real_escape_string($conexion, $practica);

        // Consulta para obtener el ID del motivo seleccionado
        $query = "SELECT id_tipo_practica FROM tbl_tipo_practicas_productivas WHERE tipo_practica = '$practica_escapada'";
        $result = mysqli_query($conexion, $query);

        if ($result) {
            // Verificar si se encontró el ID del motivo
            if ($row = mysqli_fetch_assoc($result)) {
                $id_tipo_practica[] = $row['id_tipo_practica'];
            }
        } else {
            echo "Error al obtener ID del motivo: " . mysqli_error($conexion);
        }

    }

    foreach($id_tipo_practica as $id_pratica){
        // Llamar al procedimiento almacenado
        $sql = "CALL InsertarPracticaProduccion($idFicha, $idProductor, $id_pratica, ' ', '$creado_por')";
        $result = mysqli_query($conexion, $sql);
    }
    
    if ($result) {
        // Redirige a la siguiente página
        //header("Location: siguiente_pagina.php");
        //exit(); // Detener la ejecución del script
    } else {
        echo "Error al guardar los datos: " . mysqli_error($conexion);
    }

    // Cierra la conexión a la base de datos
    mysqli_close($conexion);
}
?>