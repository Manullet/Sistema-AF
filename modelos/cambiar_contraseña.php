<?php
// Iniciar la sesión (asegúrate de haber iniciado sesión en tu script principal)
session_start();

// Verificar si el usuario está autenticado
if (isset($_SESSION['usuario'])) {
    $usuario_actual = $_SESSION['usuario'];
?>
    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cambiar Contraseña</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/estilos.css">
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
            width: 350px;
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

        input[type="password"], input[type="text"] {
            width: calc(100% - 30px); /* Considerando el espacio ocupado por el icono */
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .password-input-container {
            position: relative;
        }

        .eye-icon {
            position: absolute;
            top: 50%;
            right: 5px;
            cursor: pointer;
            transform: translateY(-50%);
            width: 20px; /* Ajusta el tamaño del icono según lo necesites */
            height: 20px;
        }

        input[type="submit"], .back-button {
            background: #52C6DA;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        input[type="submit"]:hover, .back-button:hover {
            background: #0097A7;
        }

        .section {
            margin-bottom: 20px;
        }
    </style>
    </head>
    <body>
        <div class="contenedor__todo">
            <h2>Cambiar Contraseña</h2>
            

            <form action="../php/comfirmar_contraseña.php" method="post">
    <input type="hidden" name="usuario" value="<?php echo htmlspecialchars($usuario_actual['usuario']); ?>">

    <label for="contrasena_actual">Contraseña Actual:</label>
    <div style="position: relative;">
        <input type="password" id="contrasena_actual" name="contrasena_actual" required>
        <span style="position: absolute; top: 27%; right: 7%; transform: translateY(-50%); cursor: pointer;" onclick="togglePasswordVisibility(this.previousElementSibling, this)">🔒</span>
    </div>

    <label for="nueva_contrasena">Nueva Contraseña:</label> 
    
    <div style="position: relative;">
        <input type="password" id="nueva_contrasena" name="nueva_contrasena" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*-_?&])[A-Za-z\d@$!-_%*?&]{8,32}$" title="Debe contener al menos 8 caracteres, una mayúscula, un número y un carácter especial" required>
        <span style="position: absolute; top: 15%; right: 7%; transform: translateY(-50%); cursor: pointer;" onclick="togglePasswordVisibility(this.previousElementSibling, this)">🔒</span>
        <div class="section">
    <a href="../bienvenida.php" class="back-button" style="background: #52C6DA; color: white; border: none; padding: 10px 0px; border-radius: 5px; cursor: pointer; width: 100%; display: block; text-align: center; margin-top: 20px; text-decoration: none; font-size: 14px;">Volver</a>
</div>
    </div>
    <input type="submit" value="Cambiar Contraseña">
</form>

        <script>
            function mostrarContrasena() {
                var contraseñaInput = document.getElementById("nueva_contrasena");
                if (contraseñaInput.type === "password") {
                    contraseñaInput.type = "text";
                } else {
                    contraseñaInput.type = "password";
                }
            }
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
<?php
} else {
    echo "Usuario no autenticado. Contenido de SESSION: ";
    var_dump($_SESSION); // Imprime el contenido de la sesión para depuración
}
?>
