<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambio de Contraseña</title>
    <link rel="stylesheet" href="../dist/css/style.css">
</head>
<body>
    <div class="container">
        <form action="../php/comfirmar_contraseña.php" method="post">
            <h2>Cambio de Contraseña</h2>
            <label for="contrasenaActual">Contraseña Actual:</label>
            <input type="password" name="contrasenaActual" required>

            <label for="nuevaContrasena">Nueva Contraseña:</label>
            <input type="password" name="nuevaContrasena" required>

            <label for="confirmarContrasena">Confirmar Nueva Contraseña:</label>
            <input type="password" name="confirmarContrasena" required>

            <div class="button-container">
                <button type="submit">Cambiar Contraseña</button>
                <a href="../bienvenida.php" class="cancel-button">Cancelar</a>
            </div>
        </form>
    </div>
</body>
</html>

