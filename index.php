<?php

session_start();
if (isset($_SESSION['usuario'])) {
    header("location: bienvenida.php");
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/x-icon" href="/assets/logo-vt.svg" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <title>Iniciar sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />

    <style>
        .custom-info-bg-color {
            background-color: #52C6DA !important;
        }

        .custom-info-text-color {
            color: #52C6DA !important;
        }
    </style>
</head>

<body style="background-color: #e0e2e5;" class="d-flex justify-content-center align-items-center vh-100">
    <div class="bg-white p-5 rounded-5 text-secondary shadow" style="width: 25rem">
        <div class="d-flex justify-content-center">
            <img src="./assets/images/Recurso 3.png" alt="login-icon" style="height: 7rem" />
        </div>
        <br>
        <form action="../Sistema-AF/php/login_usuario_be.php" method="post" onsubmit="validarContrasena();">
            <div class="input-group mt-4">
                <div class="input-group-prepend">
                    <div class="input-group-text custom-info-bg-color">
                        <img src="./assets/images/username-icon.svg" alt="username-icon" style="height: 1rem" />
                    </div>
                </div>
                <input class="form-control bg-light" type="email" placeholder="Correo" name="correo" required oninput="noespacio(this, event)" />
            </div>
            <div class="input-group mt-1">
                <div class="input-group-prepend">
                    <div class="input-group-text custom-info-bg-color">
                        <img src="./assets/images/password-icon.svg" alt="password-icon" style="height: 1rem" />
                    </div>
                </div>
                <div style="position: relative; flex: 1;">
                    <input class="form-control bg-light" type="password" placeholder="Contraseña" name="contrasena" required maxlength="15" oninput="sinespacio(this)" />
                    <span style="position: absolute; top: 50%; right: 10px; transform: translateY(-50%); cursor: pointer;" onclick="togglePasswordVisibility(this.previousElementSibling, this)">🔒</span>
                </div>
            </div>
            <div class="d-flex justify-content-between mt-1">
                <div class="d-flex align-items-center gap-1">
                    <input class="form-check-input" type="checkbox" />
                    <div class="pt-1" style="font-size: 0.9rem">Recordar Usuario</div>
                </div>
                <div class="pt-1">
                    <a href="modelos/reiniciar_contrasena.php" class="text-decoration-none text-info fw-semibold fst-italic" style="font-size: 0.9rem">¿Olvidaste tu contraseña?</a>
                </div>
            </div>
            <button type="submit" class="btn custom-info-bg-color text-white w-100 mt-4 fw-semibold shadow-sm">INGRESAR</button>
            <div class="d-flex gap-1 justify-content-center mt-1">
                <div>¿No tienes una cuenta?</div>
                <a href="./crearUsuario.php" class="text-decoration-none text-info fw-semibold">Registrate</a>
            </div>
        </form>


           <!--  Validacion que no se permiten espacios en el correo-->  
        <script language="javascript">
            function noespacio(campo, event) {
                CadenaaReemplazar = " ";
                CadenaReemplazo = "";
                CadenaTexto = campo.value;
                CadenaTextoNueva = CadenaTexto.split(CadenaaReemplazar).join(CadenaReemplazo);
                campo.value = CadenaTextoNueva;
            }
        </script>
   

   <!--  Validacion que no se permiten espacios en el usuario-->  
        <script type="text/javascript">
            function sinespacio(e) {
                var cadena = e.value;
                var limpia = "";
                var parts = cadena.split(" ");
                var length = parts.length;
                for (var i = 0; i < length; i++) {
                    nuevacadena = parts[i];
                    subcadena = nuevacadena.trim();
                    if (subcadena != "") {
                        limpia += subcadena + " ";
                    }
                }
                limpia = limpia.trim();
                e.value = limpia;
            };
        </script>

<!--  Validacion que no se permiten contraseña sin mayuscula numeros y un caracter  

            function validarContrasena() {
                var contrasena = document.getElementsByName("contrasena")[0].value;

                // Expresiones regulares para validar la contraseña
                var regexMayuscula = /[A-Z]/;
                var regexMinuscula = /[a-z]/;
                var regexNumero = /[0-9]/;
                var regexEspecial = /[-_!@#$%^&*(),.?":{}|<>]/;

                // Verifica las condiciones
                var esContrasenaValida = regexMayuscula.test(contrasena) &&
                                         regexMinuscula.test(contrasena) &&
                                         regexNumero.test(contrasena) &&
                                         regexEspecial.test(contrasena) &&
                                         contrasena.length >= 8 && // Mínimo 8 caracteres
                                         contrasena.length <= 15;  // Máximo 15 caracteres

                if (!esContrasenaValida) {
                    // Muestra un mensaje de error o realiza alguna acción adicional
                    alert("La contraseña debe contener al menos una mayúscula, una minúscula, un número, un carácter especial y tener entre 8 y 15 caracteres.");
                    event.preventDefault(); // Evita que el formulario se envíe si la contraseña no es válida
                }
            }
-->
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
