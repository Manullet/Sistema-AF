<?php
session_start(); 
include "../php/conexion_be.php";

$preguntaId = $_POST['preguntaId'];
$respuesta = $_POST['respuesta'];
$email = $_POST['email'];

$sql = "SELECT Id_Usuario FROM usuario WHERE correo = '$email'";
$result = $conexion->query($sql);
$row = $result->fetch_assoc();
$id_usuario = $row['Id_Usuario'];

$stmt = $conexion->prepare("SELECT * FROM preguntas_usuario WHERE id_pregunta = ? and Id_Usuario = ?
and Respuestas = ?");
$stmt->bind_param("iis", $preguntaId, $id_usuario, $respuesta);
$stmt->execute();
$resultado = $stmt->get_result();
$respuestaCorrecta = $resultado->fetch_assoc();

header('Content-Type: application/json');

if($respuestaCorrecta != null) {
    $_SESSION['id_usuario'] = $respuestaCorrecta['Id_Usuario'];
    echo json_encode(['valid' => true]);
} else {

    echo json_encode(['valid' => false]);
}

$conexion->close();

?>

