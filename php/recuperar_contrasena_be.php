<?php

include 'conexion_be.php';
$correo = $_POST['correo'];
$respuesta = $_POST['respuesta'];
$contrasena =$_POST['contraseña'];

$validar_correo = mysqli_query($conexion, "SELECT * FROM tbl_usuario WHERE 
correo='$correo'");


if(mysqli_num_rows($validar_correo) > 0){

   $validar_respuesta = mysqli_query($conexion, "SELECT * FROM tbl_respuestas WHERE respuesta='$respuesta'");

   if (mysqli_num_rows($validar_respuesta)>0) {

    $cambio_contraseña = mysqli_query($conexion, "UPDATE tbl_usuario SET contraseña='$contrasena'");
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