<?php
include "../php/conexion_be.php";

// Obtener las prácticas productivas
$queryPracticas = "SELECT * FROM tbl_tipo_practicas_productivas WHERE estado = 'A'";
$resultPracticas = mysqli_query($conexion, $queryPracticas);
$practicasProductivas = mysqli_fetch_all($resultPracticas, MYSQLI_ASSOC);
?>
