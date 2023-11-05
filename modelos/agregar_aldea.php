<?php

include "../php/conexion_be.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Nombre_Aldea=$_POST["Nombre_Aldea"];
    $Descripcion=$_POST["Descripcion"];
    $Id_Municipio=$_POST["Id_Municipio"];


    $sql = "CALL InsertarAldea('$Nombre_Aldea', '$Descripcion', '$Id_Municipio')";

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