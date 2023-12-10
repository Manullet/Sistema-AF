<?php

ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Aldea = $_POST["Id_Aldea"];
    $Id_Municipio = $_POST["Id_Municipio"];
    $Id_Departamento = $_POST["Id_Departamento"];




    $Nombre_Cacerio=$_POST["Nombre_Cacerio"];
    $Descripcion=$_POST["Descripcion"];
    $Creado_Por = $_SESSION["usuario"]["usuario"];


    $sql = "CALL InsertarCacerio('$Id_Aldea','$Id_Municipio','$Id_Departamento','$Nombre_Cacerio', '$Descripcion','$Creado_Por')";

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