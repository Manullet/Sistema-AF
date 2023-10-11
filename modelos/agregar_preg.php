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


<html>
<head>
    <link rel="stylesheet" type="text/css" href="../dist/css/MantPermisos.css">
    <title>Agregar Pregunta</title>
</head>
<body>


<h1>Agregar Nueva Pregunta</h1>
    <form action="../php/mant_pregunta.php" method="post">
        <label>Pregunta</label>
        <input type="text" name="Pregunta"> <br>
        <label>Fecha Creación</label>
        <input type="text" name="Fecha_Creacion"> <br>
        <label>Fecha Actualización</label>
        <input type="text" name="Fecha_Actualizacion"> <br>
        <input type="submit" name="Agregar" value="AGREGAR">
        <a href="../bienvenida.php" >Regresar</a>
    </form>
</body>
</html>

