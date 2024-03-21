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

    // Verifica si se seleccionó "Si" para prestamo
    $recibeApoyo = trim($_POST['recibeApoyo'] == 'SiApoyo' ? 'S' : 'N');

    // Obtiene los motivos de migración
    $atendidoUnidadAgricultura = trim($_POST['atendidoUnidadAgricultura'] == 'Si' ? 'S' : 'N');
    $productosVendidosProgramaAlimentacion = trim($_POST['productosVendidosProgramaAlimentacion'] == 'Siyes' ? 'S' : 'N');

    if($recibeApoyo == 'S'){
        $tipoApoyo = isset($_POST['apoyo']) ? $_POST['apoyo'] : array();
        $id_tipo_apoyo = array();

        // Llamar al procedimiento almacenado
        $sql = "CALL InsertarApoyoActividadExterna($idFicha, $idProductor, '$recibeApoyo', '$atendidoUnidadAgricultura', '$productosVendidosProgramaAlimentacion', null, '$creado_por')";
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
            $query = "SELECT id_tipo_apoyos FROM tbl_tipos_apoyos WHERE tipo_apoyos = '$apoyo_escapado'";
            $result = mysqli_query($conexion, $query);
    
            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $id_tipo_apoyo[] = $row['id_tipo_apoyos'];
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
    }else{
        // Llamar al procedimiento almacenado
        $sql = "CALL InsertarApoyoActividadExterna($idFicha, $idProductor, '$recibeApoyo', '$atendidoUnidadAgricultura', '$productosVendidosProgramaAlimentacion', null, '$creado_por')";
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