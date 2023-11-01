<?php
include "../php/conexion_be.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_motivo=$_POST["Id_motivo"];
    $Motivo=$_POST["Motivo"];
    $Descripcion=$_POST["Descripcion"];
    $Estado=$_POST["Estado"];


    $sql = "CALL EditarMotivo('$Id_motivo', '$Motivo', '$Descripcion', '$Estado');    ";

    if (mysqli_query($conexion,$sql)) {
        header("Location: editar_migracion.php?success=true&message= El Motivo Se Actualizo Correctamente");
        exit();
        } else {
            echo '<div class="alert alert-danger text-center">Error Al Actualizar El Motivo</div>';
        }

        mysqli_close($conexion);  
    }

?>