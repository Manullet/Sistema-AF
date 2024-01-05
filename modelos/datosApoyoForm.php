<?php
include "../php/conexion_be.php";

// Obtener los tipos de apoyo para la producción
$queryApoyosProduccion = "SELECT * FROM tbl_apoyos WHERE estado = 'ACTIVO'";
$resultApoyosProduccion = mysqli_query($conexion, $queryApoyosProduccion);
$tiposApoyosProduccion = mysqli_fetch_all($resultApoyosProduccion, MYSQLI_ASSOC);

// Obtener los tipos de apoyo
$queryApoyos = "SELECT * FROM tbl_tipos_apoyos WHERE estado = 'ACTIVO'";
$resultApoyos = mysqli_query($conexion, $queryApoyos);
$tiposApoyos = mysqli_fetch_all($resultApoyos, MYSQLI_ASSOC);

?>
