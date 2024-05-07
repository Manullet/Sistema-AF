<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tu título</title>
    <!-- Agrega tus enlaces a las hojas de estilo aquí -->
    <style>
        .user-info {
            color: #333; /* color del texto */
            font-weight: bold; /* texto en negrita */
        }

        .role-info {
            color: #666; /* color del texto */
            font-style: italic; /* texto en cursiva */
            margin-left: 20px; /* espacio a la izquierda */
        }
        .center-class-user {
           align-items: center;
            display: flex;
            justify-content: center;
        }

    </style>
    <link rel="stylesheet" href="tu-estilo.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link"></a> <!-- cambiar la direccion  -->
            </li>
            <li class="center-class-user">
                <?php
                // Verifica si el usuario está autenticado
                if (isset($_SESSION['usuario'])) {
                    $usuario = $_SESSION['usuario'];
                    // Muestra el nombre de usuario con etiquetas HTML y estilos CSS
                    echo "<span class='user-info'>Usuario: <strong>{$usuario['usuario']}</strong></span>";
                    // Agregamos el contenedor para el reloj junto al nombre de usuario
                    echo "<span id='reloj' class='ml-3'></span>";
                }
                ?>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                    <i class="fas fa-user-alt"></i>
                </a>   
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Tu contenido adicional aquí -->

    <!-- JavaScript para el reloj -->
    <script>
        function actualizarReloj() {
            var ahora = new Date();

            var horas = ahora.getHours();
            var minutos = ahora.getMinutes();
            var segundos = ahora.getSeconds();
            var dia = ahora.getDate();
            var nombreDia = obtenerNombreDia(ahora.getDay());
            var nombreMes = obtenerNombreMes(ahora.getMonth());
            var año = ahora.getFullYear();

            // Formateamos los números para asegurarnos de que siempre tengan dos dígitos
            horas = pad(horas);
            minutos = pad(minutos);
            segundos = pad(segundos);
            dia = pad(dia);

            // Construimos la cadena de texto para mostrar
            var horaActual = horas + ":" + minutos + ":" + segundos;
            var fechaActual = nombreDia + ", " + dia + " de " + nombreMes + " de " + año;

            // Actualizamos el contenido del elemento con id "reloj"
            document.getElementById('reloj').innerHTML = horaActual + " - " + fechaActual;

            // Llamamos a esta función nuevamente cada segundo
            setTimeout(actualizarReloj, 1000);
        }

        function pad(numero) {
            // Esta función agrega un cero delante de un número si es necesario para que siempre tenga dos dígitos
            if (numero < 10) {
                return "0" + numero;
            } else {
                return numero;
            }
        }

        function obtenerNombreDia(numeroDia) {
            // Array con los nombres de los días de la semana
            var dias = ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"];
            // Retornamos el nombre del día correspondiente al número recibido
            return dias[numeroDia];
        }

        function obtenerNombreMes(numeroMes) {
            // Array con los nombres de los meses
            var meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
            // Retornamos el nombre del mes correspondiente al número recibido
            return meses[numeroMes];
        }

        // Llamamos a la función para iniciar el reloj
        actualizarReloj();
    </script>
</body>
</html>
