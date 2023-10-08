<?php

    session_start();
    if(isset($_SESSION['usuario'])){
        header("location: bienvenida.php");
    }

 /*   session_start();
if(!isset($_SESSION['usuario'])) {
    header("Location:usuario.php");
}
*/

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Cambio Climatico</title>
    <link rel="stylesheet" href="assets/css/CCestilos.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="image-container">
        <a><img src="assets/images/Recurso 2.png"></a>
        <a><img src="assets/images/Recurso 3.png"></a>
        <a><img src="assets/images/Recurso 5.png"></a>
    </div>

    <div class="contenedor">
        <form action="/SISTAMA-CC/php/login_usuario_be.php" method="post">
            <h1>INICIAR SESIÓN</h1>
            <div class="input-box">
                <input type="text" placeholder="Usuario" name="correo">
                <i class='bx bxs-user'></i>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Contraseña" name="contrasena">
                <i class='bx bxs-lock-alt'></i>
            </div>

            <div class="recordar">
                <label><input type="checkbox">Recordar Usuario</label>
                <a href="../Sistama-CC/modelos/cambio_contrasena_respuesta_S.php">¿Olvidates tu contraseña?</a><!--cambiar la direcion para cambiar la contraseña -->
            </div>

            <button type="submit" class="btn">INGRESAR</button>
            <div class="link-registro">
                <p>¿Aun no tienes una cuenta? 
                    <a href="crearUsuario.php">Registrate</a>
                </p>
            </div>
        </form>

    </div>

    <script src="assets/js/script.js"></script>


</body>
</html>

