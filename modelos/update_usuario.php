<?php

include "Modelo/conexion.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id=$_POST["id"];
    $nombre=$_POST["nombre"];
    $usuario=$_POST["usuario"];
    $contraseña=$_POST["contraseña"];
    $correo=$_POST["correo"];
    $estado=$_POST["estado"];

    $sql = "CALL UpdateUsuario($id,'$nombre', '$usuario', '$contraseña', '$correo', $estado)";

    if (mysqli_query($conexion,$sql)) {
        header("Location: Actualizar_Usuario.php?success=true&message= El Usuario Se Actualizo Correctamente");
        exit();
        } else {
            echo '<div class="alert alert-danger text-center">Error Al Actualizar El Usuario</div>';
        }

        mysqli_close($conexion);  
    }

?>