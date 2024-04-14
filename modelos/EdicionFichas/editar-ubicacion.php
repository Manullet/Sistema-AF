<?php
ob_start();
include "../../php/conexion_be.php";
session_start();


// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Obtener datos del formulario
    $idFicha=$_SESSION['id_ficha'];

    $sql = "SELECT id_productor from tbl_productor where id_ficha='$idFicha' limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();

    $idProductor = $row['id_productor'];

    $sql = "SELECT id_ubicacion from tbl_ubicacion_productor where id_ficha='$idFicha' 
    and id_productor = '$idProductor' limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();

    $idUbicacion = $row['id_ubicacion'];

    $Id_Departamento = $_POST['Id_Departamento'];
    $Id_Municipio = $_POST['Id_Municipio'];
    $Id_Aldea = $_POST['Id_Aldea'];
    $Id_Cacerio = $_POST['Id_Cacerio'];
    $ubicacion = $_POST['ubicacion'];
    $distanciaVivienda = $_POST['distanciaVivienda'];
    $latitudParcela = $_POST['latitudParcela'];
    $longitudParcela = $_POST['longitudParcela'];
    $msnm = $_POST['msnm'];
    $direccionPrincipal = $_POST['direccionPrincipal'];
    $direccionSecundario = $_POST['direccionSecundario'];
    $direccionOpcional = $_POST['direccionOpcional'];
    $viveFinca = $_POST['viveFinca'];
    $nombreFinca = $_POST['nombreFinca'];
    $modificado_por = $_SESSION["usuario"]["usuario"];

    // Llamar al procedimiento almacenado
    $sql = "CALL ActualizarUbicacionProductor(
        $idUbicacion,
        $idFicha,
        $idProductor,
        '$Id_Departamento', 
        '$Id_Municipio', 
        '$Id_Aldea', 
        '$Id_Cacerio', 
        '$ubicacion', 
        '$distanciaVivienda', 
        '$latitudParcela', 
        '$longitudParcela', 
        '$msnm', 
        '$direccionPrincipal', 
        '$direccionSecundario', 
        '$direccionOpcional', 
        '$viveFinca', 
        '$nombreFinca',
        '$modificado_por' 
    )";

    if (mysqli_query($conexion, $sql)) {
        // Redirige a la siguiente página
        
        exit(); // Detener la ejecución del script
    } else {
        echo "Error al guardar los datos: " . mysqli_error($conexion);
    }

    mysqli_close($conexion);
}
?>
