<?php
include "../php/conexion_be.php";

$tokenValido = false;
$mensajeError = '';

if (isset($_GET['token'])) {
    $token = $_GET['token'];

    $stmt = $conexion->prepare("SELECT * FROM usuario WHERE Token = ? AND Fecha_Vencimiento_Token > NOW()");
    $stmt->bind_param("s", $token);
    $stmt->execute();
    $resultado = $stmt->get_result();

    if ($resultado->num_rows > 0) {
        $tokenValido = true;
    } else {
        $mensajeError = 'El token es inválido o ha expirado.';
    }

    $stmt->close();
}

if (!$tokenValido) {

    header('Location: ../index.php');
    exit();
}

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contraseña</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/estilos.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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

        .contenedor__todo {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        input[type=email],
        input[type=password],
        input[type=text] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background: #52C6DA;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background: #0097A7;
        }

        a {
            color: #52C6DA;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .caja__trasera-login {
            padding: 20px;
            text-align: center;
        }
    </style>
</head>

<body>
    <div class="contenedor__todo">
        <div class="caja__trasera-login">
            <!-- VALIDAR ESTADO DE USUARIO NO SEA INACTIVO -->
            <h2>Cambiar Contraseña</h2>
            <form id="formCambiarPass" name="formCambiarPass" class="forget-form" action="">
                <input type="password" id="txtPassword" name="txtPassword" placeholder="Nueva contraseña" required>
                <span style="position: absolute; top: 45.5%; right: 42%; transform: translateY(-50%); cursor: pointer;" onclick="togglePasswordVisibility(this.previousElementSibling, this)">🔒</span>
                <input type="password" id="txtPasswordConfirm" name="txtPasswordConfirm" placeholder="Confirmar contraseña" required>
                <span style="position: absolute; top: 51.5%; right: 42%; transform: translateY(-50%); cursor: pointer;" onclick="togglePasswordVisibility(this.previousElementSibling, this)">🔒</span>
                <button type="submit">Cambiar Contraseña</button>
                <a href="../index.php">INICIO</a>
            </form>
        </div>
    </div>

    <script type="text/javascript">
        document.getElementById('formCambiarPass').addEventListener('submit', function(event) {
            event.preventDefault();

            var contrasena = document.getElementById("txtPassword").value;
            var confirmacionContrasena = document.getElementById("txtPasswordConfirm").value;

            var regexMayuscula = /[A-Z]/;
            var regexMinuscula = /[a-z]/;
            var regexNumero = /[0-9]/;
            var regexEspecial = /[!@#$%^&*(),.?":{}|<>]/;

            var esContrasenaValida = regexMayuscula.test(contrasena) &&
                regexMinuscula.test(contrasena) &&
                regexNumero.test(contrasena) &&
                regexEspecial.test(contrasena) &&
                contrasena.length >= 8 &&
                contrasena.length <= 15;

            var contrasenasCoinciden = contrasena === confirmacionContrasena;

            if (!esContrasenaValida || !contrasenasCoinciden) {
                var errores = [];

                if (!regexMayuscula.test(contrasena)) errores.push("Una mayúscula");
                if (!regexMinuscula.test(contrasena)) errores.push("Una minúscula");
                if (!regexNumero.test(contrasena)) errores.push("Un número");
                if (!regexEspecial.test(contrasena)) errores.push("Un carácter especial");
                if (contrasena.length < 8 || contrasena.length > 15) errores.push("Entre 8 y 15 caracteres");
                if (!contrasenasCoinciden) errores.push("Las contraseñas deben coincidir");

                var mensajeError = "La clave debe contener: " + errores.join(", ") + ".";

                Swal.fire({
                    title: 'Error en la validación',
                    text: mensajeError,
                    icon: 'error',
                    confirmButtonText: 'Ok'
                });
                return;
            }

            const datos = {
                password: contrasena,
                token: new URLSearchParams(window.location.search).get('token')
            };

            $.ajax({
                type: 'POST',
                url: 'update_password.php', 
                data: datos,
                success: function(response) {
                    if (response === 'Tu contraseña ha sido actualizada.') {
                        Swal.fire({
                            title: 'Éxito',
                            text: 'Tu contraseña ha sido actualizada correctamente.',
                            icon: 'success',
                            confirmButtonText: 'Ok'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = '../index.php'; 
                            }
                        });
                    } else {
                        Swal.fire({
                            title: 'Error',
                            text: 'No se pudo cambiar la contraseña.',
                            icon: 'error',
                            confirmButtonText: 'Ok'
                        });
                    }
                },
                error: function(xhr, status, error) {
                    Swal.fire({
                        title: 'Error',
                        text: 'Hubo un problema al enviar la solicitud: ' + error,
                        icon: 'error',
                        confirmButtonText: 'Ok'
                    });
                }
            });
        });
    </script>
<script type="text/javascript">
            function togglePasswordVisibility(inputField, eyeIcon) {
                var fieldType = inputField.type;
                if (fieldType === "password") {
                    inputField.type = "text";
                    eyeIcon.textContent = "👁️"; // Cambia el ícono de ojo abierto
                } else {
                    inputField.type = "password";
                    eyeIcon.textContent = "🔒"; // Cambia el ícono de ojo cerrado
                }
            }
        </script>

</body>

</html>