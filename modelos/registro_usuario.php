<?php

include "Modelo/conexion.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre=$_POST["nombre"];
    $usuario=$_POST["usuario"];
    $contraseña=$_POST["contraseña"];
    $correo=$_POST["correo"];
    $estado=$_POST["estado"];

    $sql = "CALL InsertUsuario('$nombre', '$usuario', '$contraseña', '$correo', $estado)";

    if (mysqli_query($conexion,$sql)) {
        header("Location: crear.php?success=true");
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