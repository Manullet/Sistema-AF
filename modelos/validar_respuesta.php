<?php
session_start(); 
include "../php/conexion_be.php";

$preguntaId = $_POST['preguntaId'];
$respuesta = $_POST['respuesta'];

$stmt = $conexion->prepare("SELECT Respuestas, id_usuario FROM preguntas_usuario WHERE id_pregunta = ?");
$stmt->bind_param("s", $preguntaId);
$stmt->execute();
$resultado = $stmt->get_result();
$respuestaCorrecta = $resultado->fetch_assoc();

header('Content-Type: application/json');

if($respuestaCorrecta && $respuestaCorrecta['Respuestas'] === $respuesta) {
    $_SESSION['id_usuario'] = $respuestaCorrecta['id_usuario'];
    echo json_encode(['valid' => true]);
} else {

    echo json_encode(['valid' => false]);
}

$conexion->close();
?>

