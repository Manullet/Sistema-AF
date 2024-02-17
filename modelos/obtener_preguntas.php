<?php
// obtener_preguntas.php
include "../php/conexion_be.php";

try {
    $preguntas = array();
    $consulta = "SELECT id_pregunta, Pregunta FROM preguntas";
    $resultado = $conexion->query($consulta);

    while ($fila = $resultado->fetch_assoc()) {
        $preguntas[] = $fila;
    }

    echo json_encode($preguntas);
} catch (Exception $e) {
    echo 'Excepción capturada: ',  $e->getMessage(), "\n";
}
?>
