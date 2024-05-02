<?php
ob_start();
include "../../php/conexion_be.php";
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

    // Verifica si se seleccionó "Si" para prestamo
    $recibeApoyo = trim($_POST['recibeApoyo'] == 'SiApoyo' ? 'S' : 'N');

    // Obtiene los motivos de migración
    $atendidoUnidadAgricultura = trim($_POST['atendidoUnidadAgricultura'] == 'Si' ? 'S' : 'N');
    $productosVendidosProgramaAlimentacion = trim($_POST['productosVendidosProgramaAlimentacion'] == 'Siyes' ? 'S' : 'N');

    if($recibeApoyo == 'S'){
        $tipoApoyo = isset($_POST['apoyo']) ? $_POST['apoyo'] : array();
        $id_tipo_apoyo = array();

        // Consulta DELETE
        $sql = "DELETE FROM tbl_apoyos_produccion WHERE id_ficha = '$idFicha' and id_productor = '$idProductor'";
        $result = $conexion->query($sql);


        // Llamar al procedimiento almacenado
        $sql = "CALL ActualizarApoyoActividadExterna($idFicha, $idProductor, '$recibeApoyo', '$atendidoUnidadAgricultura', '$productosVendidosProgramaAlimentacion', null, '$creado_por')";
        $result = mysqli_query($conexion, $sql);

        if ($result) {
            // Redirige a la siguiente página
            //header("Location: siguiente_pagina.php");
            //exit(); // Detener la ejecución del script
        } else {
            echo "Error al guardar los datos: " . mysqli_error($conexion);
        }

        foreach ($tipoApoyo as $apoyo) {
            // Escapar el motivo para evitar inyección de SQL
            $apoyo_escapado = mysqli_real_escape_string($conexion, $apoyo);
    
            // Consulta para obtener el ID del motivo seleccionado
            $query = "SELECT id_apoyo_produccion FROM tbl_apoyos WHERE tipo_apoyo_produccion = '$apoyo_escapado'";
            $result = mysqli_query($conexion, $query);
    
            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $id_tipo_apoyo[] = $row['id_apoyo_produccion'];
                }
            } else {
                echo "Error al obtener ID del motivo: " . mysqli_error($conexion);
            }
    
        }
    
        foreach($id_tipo_apoyo as $id_apoyo){
            // Llamar al procedimiento almacenado
            $sql = "CALL InsertarApoyoProduccion($idFicha, $idProductor, $id_apoyo, null, null, '$creado_por')";
            $result = mysqli_query($conexion, $sql);
        }


        $tipoOrganizacion = isset($_POST['fuenteApoyo']) ? $_POST['fuenteApoyo'] : array();
        $id_tipo_organizacion = array();

        // Consulta DELETE
        $sql = "DELETE FROM tbl_apoyo_tipo_organizacion WHERE id_ficha = '$idFicha' and id_productor = '$idProductor'";
        $result = $conexion->query($sql);


        foreach ($tipoOrganizacion as $organizacion) {
            // Escapar el motivo para evitar inyección de SQL
            $organizacion_escapado = mysqli_real_escape_string($conexion, $organizacion);
    
            // Consulta para obtener el ID del motivo seleccionado
            $query = "SELECT id_tipo_organizacion FROM tbl_tipo_organizacion WHERE tipo_organizacion = '$organizacion_escapado'";
            $result = mysqli_query($conexion, $query);
    
            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $id_tipo_organizacion[] = $row['id_tipo_organizacion'];
                }
            } else {
                echo "Error al obtener ID del motivo: " . mysqli_error($conexion);
            }
    
        }

        foreach($id_tipo_organizacion as $id_organizacion){
            // Llamar al procedimiento almacenado
            $sql = "INSERT INTO tbl_apoyo_tipo_organizacion VALUES
            ($idFicha, $idProductor, $id_organizacion, '$creado_por', NOW(), null, null, 'A')";
            $result = mysqli_query($conexion, $sql);
        } 

    }else{
        
        // Llamar al procedimiento almacenado
        $sql = "CALL ActualizarApoyoActividadExterna($idFicha, $idProductor, '$recibeApoyo', '$atendidoUnidadAgricultura', '$productosVendidosProgramaAlimentacion', null, '$creado_por')";
        $result = mysqli_query($conexion, $sql);

        if ($result) {
            // Redirige a la siguiente página
            //header("Location: siguiente_pagina.php");
            //exit(); // Detener la ejecución del script
        } else {
            echo "Error al guardar los datos: " . mysqli_error($conexion);
        }
    }
    
    


    // Cierra la conexión a la base de datos
    mysqli_close($conexion);
}
?>