<?php
include "../php/conexion_be.php";

// Obtener fuentes de crédito
function obtenerTiposIngreso() {
    global $conexion;
    $tiposIngreso = array();
    
    // Consulta a la base de datos para obtener los tipos de ingreso
    $consulta = "SELECT id_tipo_negocio, tipo_negocio FROM tbl_tipo_negocios ORDER BY id_tipo_negocio ASC";
    if ($resultado = $conexion->query($consulta)) {
        while ($fila = $resultado->fetch_assoc()) {
            $tiposIngreso[] = $fila;
        }
        $resultado->free();
    }
    
    return $tiposIngreso;
}

// Obtener motivos por los cuales no se solicitó crédito
$queryMotivosNoCredito = "SELECT * FROM tbl_motivos_no_creditos WHERE estado = 'A'";
$resultMotivosNoCredito = mysqli_query($conexion, $queryMotivosNoCredito);
$motivosNoCredito = mysqli_fetch_all($resultMotivosNoCredito, MYSQLI_ASSOC);
?>