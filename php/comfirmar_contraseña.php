<?php

include 'conexion_be.php';
$contrasenaActual = $_POST['contrasenaActual'];
$nuevaContrasena = $_POST['nuevaContrasena'];
$confirmarContrasena =$_POST['confirmarContrasena'];

$validar_contrasenaActual = mysqli_query($conexion, "SELECT * FROM usuario WHERE 
contraseña='$contrasenaActual'");


if(mysqli_num_rows($validar_contrasenaActual) > 0){

   $validar_nuevaContrasena = mysqli_query($conexion, "SELECT * FROM usuario WHERE contraseña='$contrasenaActual'");

   if (mysqli_num_rows($validar_nuevaContrasena)>0) {

    $cambio_contraseña = mysqli_query($conexion, "UPDATE usuario SET contraseña='$confirmarContrasena'");
    echo '

        <script>
         alert("contraseña cambiada");
         window.location = "../index.php";

         </script>

        ';
   }




//cookies cache
//$_SESSION['usuario']= $correo;
//header("location: ../bienvenida.php");

//si el correo y la contraseña no existen enviara una alerta
}else{
echo '

<script>
alert("usuario o contraseña no existe");
window.location = "../index.php";

</script>

';
exit();
}


?>