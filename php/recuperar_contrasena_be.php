<?php

include 'conexion_be.php';
$correo = $_POST['correo'];
$respuesta = $_POST['respuesta'];
$contrasena =$_POST['contraseña'];

$validar_correo = mysqli_query($conexion, "SELECT * FROM usuario WHERE 
correo='$correo'");


if(mysqli_num_rows($validar_correo) > 0){

   $validar_respuesta = mysqli_query($conexion, "SELECT * FROM preguntas_usuario WHERE Respuestas='$respuesta'");

   if (mysqli_num_rows($validar_respuesta)>0) {

    $cambio_contraseña = mysqli_query($conexion, "UPDATE usuario SET contraseña='$contrasena'");
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