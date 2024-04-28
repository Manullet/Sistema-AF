<?php

require '../vendor/autoload.php'; 

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

include "../php/conexion_be.php"; 

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'] ?? '';
    $metodoRecuperacion = $_POST['metodoRecuperacion'] ?? '';

    $stmt = $conexion->prepare("SELECT * FROM usuario WHERE correo = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $resultado = $stmt->get_result();

    if ($resultado->num_rows > 0) {

        if($metodoRecuperacion == 'correo'){
            $token = bin2hex(random_bytes(32));
            $fecha_expiracion = date("Y-m-d H:i:s", strtotime('+1 day'));
    
            $update_stmt = $conexion->prepare("UPDATE usuario SET Token = ?, Fecha_Vencimiento_Token = ? WHERE Correo = ?");
            $update_stmt->bind_param("sss", $token, $fecha_expiracion, $email);
            $update_stmt->execute();
    
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
                $mail->addAddress($email); 
    
                $mail->isHTML(true);
                $mail->Subject = 'Restablecer contraseña de Sistema-CC';
                
                ob_start();
                include 'email_cambiopass.php';
                $mail->Body = ob_get_clean();
                
                $mail->Body = str_replace('href=""', 'href="http://localhost/Sistema-AF/modelos/reset_contrasena.php?token=' . $token . '"', $mail->Body);
    
                $mail->send();
                echo 'Información procesada correctamente y token generado';
            } catch (Exception $e) {
                echo "El mensaje no se pudo enviar. Mailer Error: {$mail->ErrorInfo}";
            }
        }else{
            echo 'Información procesada correctamente y token generado';
        }
        
    } else {
        echo 'Correo no encontrado en la base de datos.';
    }

    $stmt->close();
    $update_stmt->close();
}
?>
