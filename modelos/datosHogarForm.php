<?php
ob_start();
include "../php/conexion_be.php";
session_start();

//Se guarda el dato del usuario creador
$creado_por = $_SESSION["usuario"]["usuario"]; // Reemplaza con la lógica adecuada para obtener el nombre de usuario

 // Obtener datos del formulario
 $idFicha=$_SESSION['id_ficha'];

 $sql = "SELECT id_productor from tbl_productor where id_ficha='$idFicha' limit 1";
 $result = $conexion->query($sql);
 $row = $result->fetch_assoc();

 $idProductor = $row['id_productor'];
// Obtener datos del formulario
$jsonData = file_get_contents('php://input');

// Verificar si se recibieron datos
if (!empty($jsonData)) {
    // Decodificar los datos JSON a un array PHP
    $data = json_decode($jsonData, true);

    if ($data !== null) {
        // Bandera para verificar si hubo algún error en las inserciones
        $error = false;

        foreach ($data as $fila) {
            $edad = mysqli_real_escape_string($conexion, $fila[0]);
            $genero = mysqli_real_escape_string($conexion, $fila[1]);
            $cantidad = (int)$fila[2];
        
            // Consulta SQL para insertar los datos en la tabla
            $sql = "CALL InsertarComposicion($idFicha, $idProductor, '$genero', '$edad', $cantidad, '$creado_por')";
        
            // Ejecutar la consulta
            if (!mysqli_query($conexion, $sql)) {
                // Si hay un error en alguna de las inserciones, establece la bandera a true
                $error = true;
                echo "Error al guardar los datos: " . mysqli_error($conexion);
                break;
            }
        }

        // Si no hubo errores en las inserciones, redirige a la siguiente página
        if (!$error) {
            // Redirige a la siguiente página
            header("Location: siguiente_pagina.php");
            exit(); // Detener la ejecución del script
        }

        // Cierra la conexión a la base de datos
        mysqli_close($conexion);
        
        // Puedes enviar una respuesta al cliente si es necesario
        echo "Datos recibidos correctamente.";

    } else {
        echo "Error al decodificar los datos JSON.";
    }
} else {
    echo "No se recibieron datos.";
}

?>
