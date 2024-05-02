<?php
ob_start();
include "../php/conexion_be.php";
session_start();


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre=$_POST["nombre_edit"];
    $valor=$_POST["valor_edit"];
    $id=$_POST["Id_Parametro"];


    $sql = "UPDATE parametros set Parametro = '$nombre',  Valor = '$valor', Fecha_Actualizacion = now()
    where Id_parametros = $id";

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
}
    mysqli_close($conexion);

?>