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
    $solicitaPrestamos = trim($_POST['prestamo'] == 'Si' ? 'S' : 'N');

    // Obtiene los motivos de migración
    $fuentesPrestamo = isset($_POST['fuentePrestamo']) ? $_POST['fuentePrestamo'] : array();
    $motivosNoPrestamo = isset($_POST['motivoNoPrestamo']) ? $_POST['motivoNoPrestamo'] : array();

    if($solicitaPrestamos == 'S'){
        $id_fuentes_prestamos = array();

        foreach ($fuentesPrestamo as $fuente) {
            // Escapar el motivo para evitar inyección de SQL
            $fuente_escapada = mysqli_real_escape_string($conexion, $fuente);
    
            // Consulta para obtener el ID del motivo seleccionado
            $query = "SELECT id_fuente_credito FROM tbl_fuentes_credito WHERE fuente_credito = '$fuente_escapada'";
            $result = mysqli_query($conexion, $query);
    
            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $id_fuentes_prestamos[] = $row['id_fuente_credito'];
                }
            } else {
                echo "Error al obtener ID del motivo: " . mysqli_error($conexion);
            }
    
        }
    
        foreach($id_fuentes_prestamos as $id_fuente){
            // Llamar al procedimiento almacenado
            $sql = "CALL InsertarCreditoProduccion($idFicha, $idProductor, '$solicitaPrestamos', '$id_fuente', null, null, null, '$creado_por')";
            $result = mysqli_query($conexion, $sql);
        }
    }else{
        $id_motivos_no_prestamos = array();

        foreach ($motivosNoPrestamo as $motivo) {
            // Escapar el motivo para evitar inyección de SQL
            $motivo_escapado = mysqli_real_escape_string($conexion, $motivo);
    
            // Consulta para obtener el ID del motivo seleccionado
            $query = "SELECT id_motivos_no_credito FROM tbl_motivos_no_creditos WHERE motivo_no_credito = '$motivo_escapado'";
            $result = mysqli_query($conexion, $query);
    
            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $id_motivos_no_prestamos[] = $row['id_motivos_no_credito'];
                }
            } else {
                echo "Error al obtener ID del motivo: " . mysqli_error($conexion);
            }
    
        }
    
        foreach($id_motivos_no_prestamos as $id_motivo){
            // Llamar al procedimiento almacenado
            $sql = "CALL InsertarCreditoProduccion($idFicha, $idProductor, '$solicitaPrestamos', null, null, $id_motivo, null, '$creado_por')";
            $result = mysqli_query($conexion, $sql);
        }
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