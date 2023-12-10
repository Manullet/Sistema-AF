<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.9/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <title>Recuperar Contraseña</title>
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

        h4 {
            font-weight: bold;
        }

        .contenedor {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 100%;
            max-width: 340px;
            text-align: center;
            color: #666;
        }

        .form-group {
            margin-bottom: 20px;
            font-family: "Lato", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            font-size: 14px;
            font-weight: 500;
        }

        .custom-control {
            text-align: left;
            display: block;
        }

        .custom-control-input {
            position: absolute;
            z-index: -1;
            opacity: 0;
        }

        .custom-control-label {
            margin-bottom: 0;
            vertical-align: top;
            position: relative;
            padding-left: 30px;
            cursor: pointer;
            color: #666;
        }

        .custom-control-label::before {
            position: absolute;
            top: 0.25rem;
            left: 0;
            display: block;
            width: 1rem;
            height: 1rem;
            pointer-events: none;
            content: "";
            background-color: #fff;
            border: #adb5bd solid 1px;
        }

        .custom-control-label::after {
            position: absolute;
            top: 0.25rem;
            left: 0;
            display: block;
            width: 1rem;
            height: 1rem;
            content: "";
            background: no-repeat 50% / 50% 50%;
        }

        .custom-radio .custom-control-input:checked~.custom-control-label::after {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 16 16' fill='%230073df' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M16 8c0-4.418-3.582-8-8-8-4.418 0-8 3.582-8 8s3.582 8 8 8c4.418 0 8-3.582 8-8zM7.646 11.354l-3.293-3.293 1.414-1.414L7.646 8.525l4.646-4.647 1.414 1.414-6.06 6.062z'/%3E%3C/svg%3E");
        }

        .btn {
            font-size: 14px;
            padding: 8px 16px;
            border-radius: 4px;
            width: auto;
            background-color: #52C6DA;
        }

        a.btn {
            padding: 0;
            background: none;
            box-shadow: none;
        }

        .custom-info-bg-color {
            background-color: #17a2b8;
            transition: background-color 0.3s;
        }

        .custom-info-bg-color:hover {
            background-color: #339DAF;
        }

        .fa-angle-left {
            margin-right: 5px;
        }
    </style>
</head>

<body>
    <div class="contenedor">
        <div class="d-flex justify-content-center">
            <img src="../assets/images/Recurso 3.png" alt="login-icon" style="height: 7rem" />
        </div>
        <br>
        <h4>¿Olvidaste tu contraseña?</h4>
        <br>
        <form id="formResetPass" name="formResetPass" action="" method="POST">
            <div class="form-group" style="text-align: left;">
                <label for="usuario">EMAIL</label>
                <input type="email" id="txtEmailReset" name="txtEmailReset" class="form-control">
            </div>
            <div class="form-group">
                <label>Elige el método de recuperación:</label>
                <div class="custom-control custom-radio">
                    <input type="radio" id="op_correo" name="recuperacion" class="custom-control-input" value="correo">
                    <label class="custom-control-label" for="op_correo">Correo electrónico</label>
                </div>
                <div class="custom-control custom-radio">
                    <input type="radio" id="op_preguntas" name="recuperacion" class="custom-control-input" value="preguntas">
                    <label class="custom-control-label" for="op_preguntas">Preguntas secretas</label>
                </div>
            </div>
            <button type="submit" class="btn custom-info-bg-color text-white w-100 mt-4 fw-semibold shadow-sm">ACEPTAR</button>
            <br>
            <br>
            <a href="../index.php" class="btn btn-link text-info"><i class="fa fa-angle-left"></i> Regresar</a>
        </form>
    </div>
    <script>
        document.getElementById('formResetPass').addEventListener('submit', function(event) {
            event.preventDefault();

            const email = document.getElementById('txtEmailReset').value;
            const opcionCorreo = document.getElementById('op_correo').checked;
            const opcionPreguntas = document.getElementById('op_preguntas').checked;

            if (!email) {
                Swal.fire(
                    'Campo Requerido',
                    'Por favor, ingresa tu correo electrónico.',
                    'error'
                );
                return;
            }

            if (!opcionCorreo && !opcionPreguntas) {
                Swal.fire(
                    'Opción no seleccionada',
                    'Por favor, elige una opción de recuperación.',
                    'warning'
                );
                return;
            }

            // Verificar si la opción seleccionada es preguntas secretas
            if (opcionPreguntas) {
                Swal.fire(
                    'Método en Desarrollo',
                    'La opción de recuperación por preguntas secretas está en desarrollo. Por favor, utiliza el método de correo electrónico.',
                    'warning'
                );
                return; // Finaliza la ejecución del script aquí
            }

            // Continúa con la ejecución solo si la opción de correo está seleccionada
            const datos = {
                email: email,
                metodoRecuperacion: 'correo' // Solo se utilizará el método correo
            };

            $.ajax({
                type: 'POST',
                url: 'procesarCorreo.php',
                data: datos,
                dataType: 'text',
                success: function(response) {
                    if (response.includes('Información procesada correctamente y token generado')) {
                        Swal.fire({
                            title: 'Enviado',
                            text: 'Se ha enviado un enlace de recuperación a tu correo electrónico.',
                            icon: 'success'
                        }).then((result) => {
                            if (result.value) {
                                window.location.href = '../index.php';
                            }
                        });
                    } else if (response.includes('Correo no encontrado en la base de datos')) {
                        Swal.fire(
                            'Error',
                            'No se encontró una cuenta con ese correo electrónico.',
                            'error'
                        );
                    } else {
                        Swal.fire(
                            'Error',
                            'Hubo un problema al procesar tu solicitud.',
                            'error'
                        );
                    }
                },
                error: function(xhr, status, error) {
                    Swal.fire(
                        'Error',
                        'Hubo un problema al enviar la información: ' + error,
                        'error'
                    );
                }
            });
        });
    </script>

</body>

</html>