<?php
session_start();
$_SESSION['url'] = 'vistas/dashboard.php';
$_SESSION['content-wrapper'] = 'content-wrapper';
?>
<style>
    .centrado {
        text-align: center;
            margin-top: 10px; /* Ajusta el margen superior según sea necesario */
            margin-bottom: 20px; /* Ajusta el margen inferior según sea necesario */
            color: white; /* Cambia el color del texto a blanco */
    }
    #contenedor-texto {
            background-color: #343a40; /* Cambia el color de fondo del contenedor a azul */
            padding: 10px; /* Agrega un relleno al contenedor para separar el texto del borde */
        }
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .slider {
        width: 100%;
        height: 750px;
        overflow: hidden;
    }

    .slider ul {
        display: flex;
        animation: cambio 20s infinite alternate linear;
        width: 400%;
    }

    .slider li {
        width: 25%;
        list-style: none;
    }

    .slider img {
        width: 100%;
        height: 100%;
    }

    @keyframes cambio {
        0% {
            margin-left: 0;
        }

        20% {
            margin-left: 0;
        }

        25% {
            margin-left: -100%;
        }

        45% {
            margin-left: -100%;
        }

        50% {
            margin-left: -200%;
        }

        70% {
            margin-left: -200%;
        }

        75% {
            margin-left: -300%;
        }

        100% {
            margin-left: -300%;
        }
    }

    @media only screen and (min-width:320px) and (max-width:768px) {

        .slider,
        .slider ul,
        .slider img {
            height: 100vh;
        }
    }
</style>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema-AF</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/estilos.css">
</head>

<body >
    <div class="content-header" id="contenedor-texto">
        <div class="container-fluid" >
            <p></p>
            <p></p>
        <h1 class="centrado" >Sistema de Agricultura y Ganaderia</h1>
            <div class="row mb-2">
                <div class="col-sm-6">
               
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                       
                        <li class="breadcrumb-item active"></li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>

    <div class="slider">
        <ul>
            <li>
                <img src="dist/img/img1.jpg">
            </li>
            <li>
                <img src="dist/img/agriculture-animal-animal-photography-422218.jpg">
            </li>
            <li>
                <img src="dist/img/img2.jpg">
            </li>
            <li>
                <img src="dist/img/img3.jpg">
            </li>
        </ul>
    </div>
</body>

</html>

<script>
    $(document).ready(function() {

        $.ajax({
            url: "ajax/dashboard .ajax.php",
            dataType: 'json',
            success: function(respuesta) {
                console.log("respuesta", respuesta);
            }
        });
    })
</script>