<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Ficha=$_POST["Id_Ficha"];
    $Id_Productor=$_POST["Id_Productor"];
    $Id_Tipo_Practica=$_POST["Id_Tipo_Practica"];
    $Descripcion=$_POST["Descripcion"];
    $Creado_Por = $_SESSION["usuario"]["usuario"];


    $sql = "CALL InsertarPracticaProduccion('$Id_Ficha', '$Id_Productor','$Id_Tipo_Practica','$Descripcion' ,'$Creado_Por')";

    if (mysqli_query($conexion,$sql)) {
        header("Location: ../bienvenida.php?success=true");
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