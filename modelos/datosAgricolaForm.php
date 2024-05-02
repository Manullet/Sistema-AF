<?php
ob_start();
include "../php/conexion_be.php";
session_start();

    // Obtener los datos del formulario
    $idFicha= $_SESSION['id_ficha'];
    $Creado_por = $_SESSION["usuario"]["usuario"];

    $sql = "SELECT id_productor from tbl_productor where id_ficha='$idFicha' limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();
   
    $idProductor = $row['id_productor'];

    $sql = "SELECT id_ubicacion from tbl_ubicacion_productor where id_productor=$idProductor limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();
   
    $idUbicacion = $row['id_ubicacion'];

    $jsonData = file_get_contents('php://input');
    //var_dump($jsonData);

    // Verificar si se recibieron datos
    if (!empty($jsonData)) {
        // Decodificar los datos JSON a un array PHP
        $data = json_decode($jsonData, true);

        if ($data !== null) {
            // Bandera para verificar si hubo algún error en las inserciones
            $error = false;

            foreach ($data as $fila) {
                $Tipo_Cultivo = mysqli_real_escape_string($conexion, $fila[0]);
                $p_Superficie_Primera_Postrera = mysqli_real_escape_string($conexion, $fila[1]);
                $Medida_Primera_Postrera = mysqli_real_escape_string($conexion, $fila[2]);
                $p_Produccion_Obtenida = mysqli_real_escape_string($conexion, $fila[3]);
                $Medida_Produccion_Obtenida = mysqli_real_escape_string($conexion, $fila[4]);
                $p_Cantidad_Vendida = mysqli_real_escape_string($conexion, $fila[5]);
                $Medida_Vendida = mysqli_real_escape_string($conexion, $fila[6]);
                $p_Precio_Venta = mysqli_real_escape_string($conexion, $fila[7]);
                $p_A_Quien_Se_Vendio = mysqli_real_escape_string($conexion, $fila[8]);

                $query = "SELECT id_tipo_cultivo FROM tbl_tipo_cultivo WHERE tipo_cultivo = '$Tipo_Cultivo' limit 1";
                $result = mysqli_query($conexion, $query);

                if ($result) {
                    // Verificar si se encontró el ID del motivo
                    if ($row = mysqli_fetch_assoc($result)) {
                        $p_Id_Tipo_Cultivo = $row['id_tipo_cultivo'];
                    }
                }

                $query = "SELECT id_medida FROM tbl_medidas_tierra WHERE medida = '$Medida_Primera_Postrera' limit 1";
                $result = mysqli_query($conexion, $query);

                if ($result) {
                    // Verificar si se encontró el ID del motivo
                    if ($row = mysqli_fetch_assoc($result)) {
                        $p_Id_Medida_Primera_Postrera = $row['id_medida'];
                    }
                }

                $query = "SELECT id_medida FROM tbl_medidas_tierra WHERE medida = '$Medida_Produccion_Obtenida' limit 1";
                $result = mysqli_query($conexion, $query);

                if ($result) {
                    // Verificar si se encontró el ID del motivo
                    if ($row = mysqli_fetch_assoc($result)) {
                        $p_Id_Medida_Produccion_Obtenida = $row['id_medida'];
                    }
                }

                $query = "SELECT id_medida FROM tbl_medidas_tierra WHERE medida = '$Medida_Vendida' limit 1";
                $result = mysqli_query($conexion, $query);

                if ($result) {
                    // Verificar si se encontró el ID del motivo
                    if ($row = mysqli_fetch_assoc($result)) {
                        $p_Id_Medida_Vendida = $row['id_medida'];
                    }
                }

                $query = "SELECT Id_siembra FROM tbl_siembra WHERE Tipo_siembra = '$p_Superficie_Primera_Postrera' limit 1";
                $result = mysqli_query($conexion, $query);

                if ($result) {
                    // Verificar si se encontró el ID del motivo
                    if ($row = mysqli_fetch_assoc($result)) {
                        $p_Id_siembra = $row['Id_siembra'];
                    }
                }
            
                // Consulta SQL para insertar los datos en la tabla
                // Llamar al procedimiento almacenado
                $query = "CALL INSERTProduccion_AgrAnterior(
                    $idUbicacion,
                    $idFicha,
                    $idProductor,
                    $p_Id_Tipo_Cultivo,
                    $p_Id_siembra,
                    $p_Id_Medida_Primera_Postrera,
                    $p_Produccion_Obtenida,
                    $p_Id_Medida_Produccion_Obtenida,
                    $p_Cantidad_Vendida,
                    $p_Id_Medida_Vendida,
                    $p_Precio_Venta,
                    '$p_A_Quien_Se_Vendio',
                    '$Creado_por'
                )";
                // Ejecutar la consulta
                if (!mysqli_query($conexion, $query)) {
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
