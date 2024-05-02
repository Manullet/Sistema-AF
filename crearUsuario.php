<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario</title>
    <link rel="stylesheet" href="assets/css/crearUsuarioEstilos.css">
    <style>
        /* Añade estilos personalizados si es necesario */
        .password-container {
            position: relative;
        }

        input, a {
            width: 100%;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        .password-input {
            padding-right: 30px; /* Ajusta el padding derecho según tus necesidades */
        }

        .eye-icon {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
        }

        a {
            color: black;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <form action="../Sistema-AF/php/registro_usuario_be.php" method="post" onsubmit="return submitForm()">
        <h2>CREAR USUARIO</h2>
        <input type="text" placeholder="Nombre completo" name="nombre_completo" id="nombreCompleto" oninput="mayusculas(this)" required>
        <input type="text" placeholder="Usuario" name="usuario" id="usuario" oninput="mayusculas(this)" required>
        <input type="email" placeholder="Correo Electronico" name="correo" id="correo" oninput="noespacio(this, event)" required>
        <div class="password-container">
            <input type="password" placeholder="Contraseña" name="contrasena" id="contrasena" oninput="validarContrasena(this)" class="password-input" required>
            <span class="eye-icon" onclick="togglePassword('contrasena')">&#128065;</span>
        </div>
        <div class="password-container">
            <input type="password" placeholder="Confirmar Contraseña" name="confirmar_contrasena" id="confirmarContrasena" oninput="validarContrasena(this)" class="password-input" required>
            <span class="eye-icon" onclick="togglePassword('confirmarContrasena')">&#128065;</span>
        </div>
        <input type="submit" class="btn" value="Registrarse">

        <a href="index.php" class="btn btn-link text-info" style="padding:1rem;"><i class="fa fa-angle-left"></i> Regresar</a>
    </form>

    

    <!-- Scripts para las funciones de validación -->

    <script language="javascript">
        function noespacio(campo, event) {
            CadenaaReemplazar = " ";
            CadenaReemplazo = "";
            CadenaTexto = campo.value;
            CadenaTextoNueva = CadenaTexto.split(CadenaaReemplazar).join(CadenaReemplazo);
            campo.value = CadenaTextoNueva;
        }

        function mayusculas(campo) {
            campo.value = campo.value.toUpperCase();
        }

        function validarContrasena(campo) {
            const contrasena = campo.value;
            const contrasenaConfirmar = document.getElementById('confirmarContrasena').value;

            // Validar longitud entre 8 y 15 caracteres
            const longitudValida = contrasena.length >= 8 && contrasena.length <= 15;

            // Validar caracteres especiales (puedes personalizar la expresión regular según tus necesidades)
            const caracteresEspeciales = /[-_!@#$%^&*(),.?":{}|<>]/.test(contrasena);

            // Mostrar mensaje de error si la longitud o caracteres no son válidos
            if (!longitudValida || !caracteresEspeciales) {
                campo.setCustomValidity('La contraseña debe tener entre 8 y 15 caracteres y contener caracteres especiales.');
            } else {
                campo.setCustomValidity('');
            }

            // Validar que la contraseña y la confirmación sean iguales
            if (contrasena !== contrasenaConfirmar) {
                document.getElementById('confirmarContrasena').setCustomValidity('Las contraseñas no coinciden.');
            } else {
                document.getElementById('confirmarContrasena').setCustomValidity('');
            }
        }

        function togglePassword(inputId) {
            const input = document.getElementById(inputId);
            input.type = input.type === 'password' ? 'text' : 'password';
        }

        function submitForm() {
            // Llama a la función noespacio en el campo de correo antes de enviar el formulario
            noespacio(document.getElementById('correo'));
            // Puedes agregar más validaciones u operaciones aquí si es necesario

            // Devuelve true para enviar el formulario, o false para detener el envío
            return true;
        }
    </script>

</body>

</html>