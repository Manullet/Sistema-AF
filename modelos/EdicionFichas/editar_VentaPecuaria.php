<?php
ob_start();
include "../../php/conexion_be.php";
session_start();

// Se guarda el dato del usuario creador
$creado_por = $_SESSION["usuario"]["usuario"]; // Reemplaza con la lógica adecuada para obtener el nombre de usuario

// Obtener datos del formulario
$jsonData = file_get_contents('php://input');

// Verificar si se recibieron datos
if (!empty($jsonData)) {
    $idFicha=$_SESSION['id_ficha'];

    $sql = "SELECT id_productor from tbl_productor where id_ficha='$idFicha' limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();
   
    $idProductor = $row['id_productor'];

    // Decodificar los datos JSON a un array PHP
    $data = json_decode($jsonData, true);

        // Bandera para verificar si hubo algún error en las inserciones
        $error = false;

        // Consulta DELETE
        $sql = "DELETE FROM tbl_venta_pecuario WHERE Id_Ficha = '$idFicha' 
        and Id_productor = '$idProductor'";
        $result = $conexion->query($sql);

        foreach ($data as $fila) {
            $tipoPecuario = mysqli_real_escape_string($conexion, $fila[0]);
            $precioVenta = mysqli_real_escape_string($conexion, $fila[1]);
            $unidadMedida = mysqli_real_escape_string($conexion, $fila[2]);
            $mercado = mysqli_real_escape_string($conexion, $fila[3]);

            $query = "SELECT id_tipo_pecuario FROM tbl_tipo_pecuarios WHERE tipo_pecuario = '$tipoPecuario' limit 1";
            $result = mysqli_query($conexion, $query);

            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $idTipo = $row['id_tipo_pecuario'];
                }
            }

            $query = "SELECT id_medida FROM tbl_medidas_tierra WHERE medida = '$unidadMedida' limit 1";
            $result = mysqli_query($conexion, $query);

            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $idMedida = $row['id_medida'];
                }
            }

            // Consulta SQL para insertar los datos en la tabla
            $sql = "INSERT INTO tbl_venta_pecuario(Id_ficha,Id_productor,Tipo_pecurio,Precio_venta,Unidad_medida,
            Mercado,Creado_Por,Fecha_creacion) VALUES($idFicha,$idProductor,$idTipo,$precioVenta, $idMedida,'$mercado',  
            '$creado_por', NOW())";
        
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
            //header("Location: siguiente_pagina.php");
            exit(); // Detener la ejecución del script
        }

        // Cierra la conexión a la base de datos
        mysqli_close($conexion);
        
        // Puedes enviar una respuesta al cliente si es necesario
        echo "Datos recibidos correctamente.";
} 


?>