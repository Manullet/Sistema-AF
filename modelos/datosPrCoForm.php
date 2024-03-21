<?php
ob_start();
include "../php/conexion_be.php";
session_start();

//Se guarda el dato del usuario creador
$creado_por = $_SESSION["usuario"]["usuario"]; // Reemplaza con la lógica adecuada para obtener el nombre de usuario

// Obtener datos del formulario
$jsonData = file_get_contents('php://input');

// Verificar si se recibieron datos
if (!empty($jsonData)) {
    // Decodificar los datos JSON a un array PHP
    $data = json_decode($jsonData, true);

    $idFicha=$_SESSION['id_ficha'];

    $sql = "SELECT id_productor from tbl_productor where id_ficha='$idFicha' limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();
   
    $idProductor = $row['id_productor'];

    $sql = "SELECT id_ubicacion from tbl_ubicacion_productor where id_productor=$idProductor limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();
   
    $idUbicacion = $row['id_ubicacion'];

    if ($data !== null) {
        // Bandera para verificar si hubo algún error en las inserciones
        $error = false;

        foreach ($data as $fila) {
            $tipoProduccion = mysqli_real_escape_string($conexion, $fila[0]);
            $periodo = mysqli_real_escape_string($conexion, $fila[1]);
            $unidad = mysqli_real_escape_string($conexion, $fila[2]);
            $cantidad = mysqli_real_escape_string($conexion, $fila[3]);
            $precio = mysqli_real_escape_string($conexion, $fila[4]);
            $comprador = mysqli_real_escape_string($conexion, $fila[5]);

            $query = "SELECT id_tipo_produccion FROM tbl_tipo_produccion WHERE tipo_produccion = '$tipoProduccion' limit 1";
            $result = mysqli_query($conexion, $query);

            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $idTipoProduccion = $row['id_tipo_produccion'];
                }
            }

            $query = "SELECT id_periodo FROM tbl_periodicidad WHERE periodo = '$periodo' limit 1";
            $result = mysqli_query($conexion, $query);

            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $idPeriodo = $row['id_periodo'];
                }
            }

            $query = "SELECT id_medida FROM tbl_medidas_tierra WHERE medida = '$unidad' limit 1";
            $result = mysqli_query($conexion, $query);

            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $idMedida = $row['id_medida'];
                }
            }

            // Consulta SQL para insertar los datos en la tabla
            $sql = "CALL InsertarProduccionComercializacion($idFicha,$idUbicacion,$idProductor,'$idTipoProduccion', $idPeriodo, $cantidad, '$idMedida',
            $precio, '$comprador','$creado_por')";
        
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
