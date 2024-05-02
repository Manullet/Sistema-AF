<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $idFicha=$_SESSION['id_ficha'];
    $fecha_solicitud=$_POST["fecha_solicitud"];
    $anio_solicitud=$_POST["anio_solicitud"];

    $descripcion=$_POST["descripcion"];
    $fecha_entrevista=$_POST["fecha_entrevista"];

    $nombre_encuestador=$_POST["nombre_encuestador"];
    $nombre_encuestado=$_POST["nombre_encuestado"];
    $nombre_supervisor=$_POST["nombre_supervisor"];

    $creado_por = $_SESSION["usuario"]["usuario"];


    $sql = "CALL InsertarFicha($idFicha,'$fecha_solicitud', '$anio_solicitud', '$descripcion','$creado_por','$fecha_entrevista','$nombre_encuestador', '$nombre_encuestado','$nombre_supervisor')";

    if (mysqli_query($conexion,$sql)) {
        //header("Location: ../bienvenida.php?success=true");
        exit();
    } else {
        if (mysqli_errno($conexion) == 1062) {
            echo '<div class="alert alert-danger text-center">Error ID Ya Existente</div>';
        } else {
            echo '<div class="alert alert-warning text-center">Algunos Campos Estan Vacios</div>';
        }
        
    }
    
    mysqli_close($conexion);
}

?>