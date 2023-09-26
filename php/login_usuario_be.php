<?php
session_start();
//conexion a la base de datoa
    include 'conexion_be.php';

    $correo = $_POST['correo'];
    $contrasena = $_POST['contrasena'];
    //encriptacion de contraseña
    $contrasena = hash('sha512', $contrasena);

    //validar correo y contraseña
    $validar_login = mysqli_query($conexion, "SELECT * FROM usuario WHERE 
                    correo='$correo' and contrasena = '$contrasena'");

    if(mysqli_num_rows($validar_login) > 0){
        //cookies cache
        $_SESSION['usuario']= $correo;
        header("location: ../bienvenida.php");

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