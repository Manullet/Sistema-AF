<?php

include "../php/conexion_be.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Usuario =$_POST["Id_Usuario"];
    $Nombre=$_POST["Nombre"];
    $Correo=$_POST["Correo"];
    $Contraseña=$_POST["Contraseña"];
    $Usuario=$_POST["Usuario"];
    $Estado=$_POST["Estado"];

    $sql = "CALL UpdateUsuario('$Id_Usuario','$Nombre', '$Correo',  '$Usuario', $Estado)";

    if (mysqli_query($conexion,$sql)) {
        header("Location: ../bienvenida.php?success=true&message= El Usuario Se Actualizo Correctamente");
        exit();
        } else {
            echo '<div class="alert alert-danger text-center">Error Al Actualizar El Usuario</div>';
        }

        mysqli_close($conexion);  
    }

?>