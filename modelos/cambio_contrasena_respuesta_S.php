<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contraseña</title>
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

        input[type=email], input[type=password], input[type=text] {
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
            <h2>Recuperar Contraseña</h2>
            <form action="../php/recuperar_contrasena_be.php" method="POST">
                <label for="correo">Correo Electrónico:</label>
                <input type="email" id="correo" name="correo" required>
                <label for="respuesta">Respuesta Secreta:</label>
                <input type="password" id="respuesta" name="respuesta" required>
                <label for="contraseña">Nueva contraseña:</label>
                <input type="password" id="contraseña" name="contraseña" required>  
                <button type="submit">Recuperar Contraseña</button>
                <a href="../index.php">ATRÁS</a>
            </form>
        </div>
    </div>
</body>
</html>
