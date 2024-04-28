<?php
session_start(); 
include "../php/conexion_be.php";

$preguntaId = $_POST['preguntaId'];
$respuesta = $_POST['respuesta'];
$id_usuario = $_POST['id'];
$fecha = date('Y-m-d H:i:s');

$stmt = $conexion->prepare("INSERT INTO preguntas_usuario (Id_pregunta, Id_Usuario, Respuestas, Creado_Por, Fecha_Creacion)
VALUES(?,?,?,?,?)");
$stmt->bind_param("iisis", $preguntaId, $id_usuario, $respuesta, $id_usuario,$fecha);
$success = $stmt->execute();

header('Content-Type: application/json');

if($success == true) {
    echo json_encode(['valid' => true]);
} else {
    echo json_encode(['valid' => false]);
}

$conexion->close();

?>

