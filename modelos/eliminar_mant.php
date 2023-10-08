<?php
session_start();
//para validar si inicio sesion
if(!isset($_SESSION['usuario'])){
    echo'

    <script> 
        alert("Debes iniciar sesion");
        window.location = "index.php";
    </script>
    
    ';

    //header("location: index.php");
    //destruye cualquier session
    session_destroy();
    //para el codigo
    die();
    
}

?>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Objeto</title>
    <link rel="stylesheet" type="text/css" href="../dist/css/diseño.css">
</head>
<body>
    <header>
        <h1>Eliminar Objeto</h1>
    </header>

    <div class="confirmation">
        <p>¿Estás seguro de que quieres eliminar este objeto?</p>
        <form  action="../php/mantenimiento_be.php" method="post">
            <button type="submit" name="confirmar">Sí, eliminar</button>
            <a href="../bienvenida.php">Cancelar</a>
        </form>
    </div>
</body>
</html>