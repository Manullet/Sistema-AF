<?php
    
    include 'conexion_be.php';

    $nombre_completo = $_POST['nombre_completo'];
    $correo = $_POST['correo'];
    $usuario = $_POST['usuario'];
    $contrasena =$_POST['contrasena'];
    //encriptar contraseña
    $contrasena = hash('sha512', $contrasena);


    $query = "INSERT INTO usuario(nombre_completo, correo, usuario, contrasena)
              VALUES('$nombre_completo', '$correo', '$usuario', '$contrasena')";


    //verificar que el correo no se repita en la base de datos
    $verificar_correo = mysqli_query($conexion, "SELECT * FROM usuario WHERE correo ='$correo'");
    //condicion para validar si hay un correo repetido
    if(mysqli_num_rows($verificar_correo) >0 ){
        echo'
        <script>
        alert("correo ya existen, intente con otro correo");
        window.location = "../index.php"
        </script>
        ';
        //para finalizar el script
        exit();
        
    }


     //verificar que el usuario no se repita en la base de datos
     $verificar_usuario = mysqli_query($conexion, "SELECT * FROM usuario WHERE usuario ='$usuario'");
     //condicion para validar si hay un usuario repetido
     if(mysqli_num_rows($verificar_usuario) >0 ){
         echo'
         <script>
         alert("usuario ya existe, intente con otro usuario");
         window.location = "../index.php"
         </script>
         ';
         //para finalizar el script
         exit();
         
     }
    

    $ejecutar = mysqli_query($conexion, $query);


    if($ejecutar){
        echo'
        <script>
        alert("usuario almacenado exitosamente");
        window.location = "../index.php"
        </script>

        ';
    }else{

        echo'
        <script>
        alert("usuario no regristrado, intente denuevo");
        window.location = "../index.php"
        </script>

        ';

    }

    mysqli_close($conexion);

?>