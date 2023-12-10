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

// Obtener la información del usuario de la sesión
$usuario = $_SESSION['usuario'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nueva_contrasena = trim($_POST['nueva_contrasena']);
    $confirmar_contrasena = trim($_POST['confirmar_contrasena']);

    // Validar longitud entre 8 y 15 caracteres
    $longitudValida = strlen($nueva_contrasena) >= 8 && strlen($nueva_contrasena) <= 15;

    // Validar caracteres especiales (puedes personalizar la expresión regular según tus necesidades)
    $caracteresEspeciales = preg_match('/[-_!@#$%^&*(),.?":{}|<>]/', $nueva_contrasena);

    // Mostrar mensaje de error si la longitud o caracteres no son válidos
    if (!$longitudValida || !$caracteresEspeciales) {
        $error_message = 'La contraseña debe tener entre 8 y 15 caracteres y contener caracteres especiales.';
    }

    // Validar que la contraseña y la confirmación sean iguales
    if ($nueva_contrasena !== $confirmar_contrasena) {
        $error_message = 'Las contraseñas no coinciden.';
    }

    if (!isset($error_message)) {
        // Actualizar la contraseña del usuario autenticado
        $updateContrasenaQuery = "UPDATE usuario SET contrasena = ?, id_estado = 1 WHERE Id_Usuario = ?";
        $nueva_contrasena_hashed = password_hash($nueva_contrasena, PASSWORD_DEFAULT);
        $stmt = mysqli_prepare($conexion, $updateContrasenaQuery);
        mysqli_stmt_bind_param($stmt, "si", $nueva_contrasena_hashed, $usuario['Id_Usuario']);
        mysqli_stmt_execute($stmt);

        // Mensaje de éxito y redirección
        echo '
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    Swal.fire({
                        title: "Contraseña actualizada!",
                        text: "Tu contraseña ha sido actualizada correctamente.",
                        icon: "success",
                        confirmButtonText: "Ok"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // Puedes redirigir a cualquier página después de cambiar la contraseña
                            window.location = "../bienvenida.php";
                        }
                    });
                });
            </script>
        ';
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambiar Contraseña</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #555;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4caf50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>
    <form action="" method="POST">
        <h2>Cambiar Contraseña</h2>
        <?php if (isset($error_message)) : ?>
            <p style="color: red;"><?php echo $error_message; ?></p>
        <?php endif; ?>
        <label for="nueva_contrasena">Nueva Contraseña:</label>
        <input type="password" Id_Usuario="nueva_contrasena" name="nueva_contrasena" required>
        <label for="confirmar_contrasena">Confirmar Contraseña:</label>
        <input type="password" Id_Usuario="confirmar_contrasena" name="confirmar_contrasena" required>
        <button type="submit">Cambiar Contraseña</button>
    </form>
</body>

</html>

