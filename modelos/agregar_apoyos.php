<?php

include "../php/conexion_be.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $tipo_apoyo_produccion=$_POST["tipo_apoyo_produccion"];
    $descripcion=$_POST["descripcion"];


    $sql = "CALL InsertarApoyo('$tipo_apoyo_produccion', '$descripcion')";

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