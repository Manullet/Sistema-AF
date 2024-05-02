<?php
session_start();
include 'conexion_be.php';

// Verificar si el usuario está autenticado
if (!isset($_SESSION['usuario'])) {
    // Redirigir o mostrar un mensaje de error si el usuario no está autenticado
    // Ejemplo de redirección:
    header("Location: ../index.php");
    exit();
}

$usuario = $_SESSION['usuario'];


?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Configuración de Pregunta de Seguridad</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: #E0E2E5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .contenedor {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 100%;
            max-width: 300px;
            text-align: center;
            color: #666;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type=text],
        select {
            width: 100%;
            padding: 8px 0px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            margin-bottom: 20px;
        }

        input[type=text]:focus,
        select:focus {
            outline: none;
            border-color: #52C6DA;
            box-shadow: 0 0 5px rgba(82, 198, 218, 0.5);
        }

        button {
            background-color: #52C6DA;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 14px;
            margin-top: 20px;
        }

        button:hover {
            background-color: #0097A7;
        }

        a {
            color: #52C6DA;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="contenedor">
        <h2>Cambiar Pregunta de Seguridad</h2>
        <h5>Seleccione una pregunta de seguridad e ingrese una respuesta que considere conveniente.
             Esa respuesta le servirá en caso de necesitar recuperar su contraseña
        </h5>
        <input type="hidden" value="<?php echo  $usuario['Id_Usuario']; ?>" id="idUsuario">
        <form id="formPreguntasSeguridad" name="formPreguntasSeguridad" action="reiniciar_contrasena_op.php" method="post">
            <div class="form-group">
                <label for="selectPregunta">Seleccione su pregunta de seguridad</label>
                <br>
                <br>
                <select id="selectPregunta" name="selectPregunta" required>
                    <!-- Las opciones se llenarán mediante JavaScript/AJAX -->
                </select>
            </div>
            <div class="form-group">
                <input type="text" id="respuestaPregunta" name="respuestaPregunta" placeholder="Respuesta a la pregunta de seguridad">
            </div>
            <button type="submit">Verificar Respuestas</button>
        </form>
    </div>
<script>

    $(document).ready(function() {
        $.ajax({
                url: '../modelos/obtener_preguntas.php', 
                type: 'GET',
                dataType: 'json',
                success: function(preguntas) {
                    console.log(preguntas)

                    var select = $('#selectPregunta');
                    preguntas.forEach(function(pregunta) {
                        select.append($('<option>', {
                            value: pregunta.id_pregunta,
                            text: pregunta.Pregunta
                        }));
                    });
                },
                error: function() {
                    alert('Error al obtener las preguntas de seguridad.');
                }
            });

        $('#formPreguntasSeguridad').on('submit', function(e) {
            e.preventDefault(); // Detiene el envío normal del formulario

            var preguntaId = $('#selectPregunta').val();
            var respuesta = $('#respuestaPregunta').val();
            var id = $('#idUsuario').val();

            if(respuesta === '') {
                Swal.fire(
                    'Error',
                    'Por favor, ingrese su respuesta.',
                    'error'
                );
                return false;
            }

            // Realizar una solicitud AJAX al servidor para validar la respuesta
            $.ajax({
                url: '../modelos/guardar_respuesta.php',
                type: 'POST',
                data: {
                    preguntaId: preguntaId,
                    respuesta: respuesta,
                    id:id
                },
                success: function(data) {
                    // Si la respuesta del servidor indica que la validación es correcta, redirigir al usuario
                    if(data.valid === true) {
                        Swal.fire({
                            title: 'Cambio Realizado',
                            text: 'Pregunta de seguridad cambiada exitosamente',
                            icon: 'success',
                            confirmButtonText: 'Ok'
                        }).then((result) => {
                            // Aquí puedes realizar la funcionalidad que desees cuando el usuario haga clic en el botón "Ok"
                            if (result.isConfirmed) {
                                // Por ejemplo, redirigir a otra página
                                window.location.href = '../bienvenida.php';
                            }
                        });
                        
                    } else {
                        // Si la validación falla, mostrar un mensaje de error
                        Swal.fire(
                            'Error',
                            'No se pudo guardar la respuesta.',
                            'error'
                        );
                    }
                },
                error: function() {
                    Swal.fire(
                        'Error',
                        'Hubo un error al procesar su solicitud.',
                        'error'
                    );
                }
            });
        });
    });
</script>


</body>
</html>