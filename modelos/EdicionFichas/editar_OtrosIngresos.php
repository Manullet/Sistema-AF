<?php
ob_start();
include "../../php/conexion_be.php";
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

    if ($data !== null) {
        // Bandera para verificar si hubo algún error en las inserciones
        $error = false;

        // Consulta DELETE
        $sql = "DELETE FROM tbl_ingreso_familiar WHERE Id_Ficha = '$idFicha' 
        and Id_Productor = '$idProductor'";
        $result = $conexion->query($sql);
        

        foreach ($data as $fila) {
            $tipoIngreso = mysqli_real_escape_string($conexion, $fila[0]);
            $cantidad = mysqli_real_escape_string($conexion, $fila[1]);

            $query = "SELECT id_tipo_negocio FROM tbl_tipo_negocios WHERE tipo_negocio = '$tipoIngreso' limit 1";
            $result = mysqli_query($conexion, $query);

            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $idTipoNegocio = $row['id_tipo_negocio'];
                }
            }


            // Consulta SQL para insertar los datos en la tabla
            $sql = "CALL InsertarIngresoFamiliar($idFicha, $idProductor,$idTipoNegocio, $cantidad,null,null,null,'$creado_por')";
        
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