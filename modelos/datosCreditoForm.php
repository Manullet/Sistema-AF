<?php
include "../php/conexion_be.php";

// Obtener fuentes de crédito
$query = "SELECT * FROM tbl_fuentes_credito WHERE estado = 'A'";
$result = mysqli_query($conexion, $query);
$fuentesCredito = mysqli_fetch_all($result, MYSQLI_ASSOC);

// Obtener motivos por los cuales no se solicitó crédito
$queryMotivosNoCredito = "SELECT * FROM tbl_motivos_no_creditos WHERE estado = 'A'";
$resultMotivosNoCredito = mysqli_query($conexion, $queryMotivosNoCredito);
$motivosNoCredito = mysqli_fetch_all($resultMotivosNoCredito, MYSQLI_ASSOC);
?>