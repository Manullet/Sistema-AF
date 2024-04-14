<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "GET") {

    $id_ficha = $_GET["ficha"];

    $sql = "CALL DuplicarFicha($id_ficha)";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
    } else {
        ob_end_clean(); 
        echo "Error al duplicar LA FICHA: " . mysqli_error($conexion);
    }

    $sql = "SELECT id_ficha from fichas order by id_ficha desc limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();
   
    $id_ficha = $row['id_ficha'];

    $datos = array('id' => $row['id_ficha']);

    // Convertir el array a formato JSON
    $json_response = json_encode($datos);

    // Retornar el JSON como respuesta
    echo $json_response;
    
    mysqli_close($conexion);
}
?>