<?php
require '../php/conexion_be.php';
require '../vendor/autoload.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Obtener los valores de los campos (ajusta según cómo obtienes los datos)
$nombre_completo = $_POST['nombre_completo'];
$correo = $_POST['correo'];
$usuario = $_POST['usuario'];

// Generar una contraseña aleatoria de 8 caracteres
$caracteres = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+';
$longitud = 8;
$contrasena_aleatoria = '';

while ($longitud > 0) {
    $contrasena_aleatoria .= $caracteres[rand(0, strlen($caracteres) - 1)];
    $longitud--;
}

// Validar la dirección de correo electrónico
$correo = filter_var($correo, FILTER_SANITIZE_EMAIL);

if (filter_var($correo, FILTER_VALIDATE_EMAIL)) {
    // Encriptar la contraseña
    $hash = password_hash($contrasena_aleatoria, PASSWORD_BCRYPT);

    // Preparar la consulta SQL para llamar al procedimiento almacenado
    $sql = "CALL InsertarUsuario('$nombre_completo', '$correo', '$usuario', '$hash')";

    $resultado = mysqli_query($conexion, $sql);

    if ($resultado) {
        // Envío de correo electrónico con la contraseña generada
        $mail = new PHPMailer(true);

        try {
            $mail->isSMTP();
            $mail->Host       = 'smtp.gmail.com';
            $mail->SMTPAuth   = true;
            $mail->Username   = 'sistemacc.unah@gmail.com';
            $mail->Password   = 'lizvyeanbesifzvc';
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            $mail->Port       = 587;
            $mail->CharSet    = 'UTF-8';

            $mail->setFrom('sistemacc.unah@gmail.com', 'Sistema-CC');
            $mail->addAddress($correo);

            $mail->isHTML(true);
            $mail->Subject = 'Contraseña generada para Sistema-CC';
            $mail->Body = 'Tu contraseña generada es: ' . $contrasena_aleatoria;

            $mail->send();
            header("Location: ../bienvenida.php?success=true");
        } catch (Exception $e) {
            echo "El mensaje no se pudo enviar. Mailer Error: {$mail->ErrorInfo}";
        }
    } else {
        echo "Error al ejecutar la consulta: " . mysqli_error($conexion);
    }
} else {
    echo 'La dirección de correo electrónico no es válida.';
}

// Cerrar la conexión
mysqli_close($conexion);
?>
