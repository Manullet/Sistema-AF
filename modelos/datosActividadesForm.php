<?php
include "../php/conexion_be.php";

// Obtener los tomadores de decisiones
$queryTomadores = "SELECT * FROM tbl_toma_decisiones WHERE estado = 'A'";
$resultTomadores = mysqli_query($conexion, $queryTomadores);
$tomadoresDecisiones = mysqli_fetch_all($resultTomadores, MYSQLI_ASSOC);
?>
