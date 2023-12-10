<?php
ob_start();
include "../php/conexion_be.php";
session_start();


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Nombre_Departamento=$_POST["Nombre_Departamento"];
    $Descripcion=$_POST["Descripcion"];
    $Creado_Por = $_SESSION["usuario"]["usuario"];


    $sql = "CALL InsertarDepartamento('$Nombre_Departamento', '$Descripcion', '$Creado_Por')";

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