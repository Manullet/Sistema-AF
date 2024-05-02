<?php
require '../php/conexion_be.php';
require '../vendor/autoload.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Obtener los valores de los campos (ajusta según cómo obtienes los datos)
$nombre_completo = $_POST['nombre_completo'];
$correo = $_POST['correo'];
$usuario = $_POST['usuario'];
$Id_rol = $_POST['Id_rol'];
$estado = $_POST['id_estado'];


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
    $sql = "CALL CrearUsuario('$nombre_completo', '$correo', '$usuario', '$hash', '$Id_rol', '$estado')";

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
            $mail->Body = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
            <html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
              <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                  <meta name="viewport" content="width=device-width, initial-scale=1.0">
                  <meta name="x-apple-disable-message-reformatting">
                  <title></title>
                        
                  <style type="text/css">
          
                      @media only screen and (min-width: 620px) {
                      .u-row {
                        width: 600px !important;
                      }
                      .u-row .u-col {
                        vertical-align: top;
                        }
                      
                        .u-row .u-col-36p67 {
                          width: 220.02px !important;
                        }
                      
                        .u-row .u-col-48p17 {
                          width: 289.02px !important;
                        }
                      
                        .u-row .u-col-51p83 {
                          width: 310.98px !important;
                        }
                      
                        .u-row .u-col-63p33 {
                          width: 379.98px !important;
                        }
                      
                        .u-row .u-col-100 {
                          width: 600px !important;
                        }
                      
                      }
                      
                      @media (max-width: 620px) {
                        .u-row-container {
                          max-width: 100% !important;
                          padding-left: 0px !important;
                          padding-right: 0px !important;
                        }
                        .u-row .u-col {
                          min-width: 320px !important;
                          max-width: 100% !important;
                          display: block !important;
                        }
                        .u-row {
                          width: 100% !important;
                        }
                        .u-col {
                          width: 100% !important;
                        }
                        .u-col > div {
                          margin: 0 auto;
                        }
                      }
                      
                      body {
                        margin: 0;
                        padding: 0;
                        font-family: "Hamlin";
                      }
                      
                      table,
                      tr,
                      td {
                        vertical-align: top;
                        border-collapse: collapse;
                      }
                      
                      p {
                        margin: 0;
                      }
                      
                      .ie-container table,
                      .mso-container table {
                        table-layout: fixed;
                      }
                      
                      * {
                        line-height: inherit;
                      }
                      
                      
                      table, td { color: #000000; } #u_body a { color: #0000ee; text-decoration: underline; } @media (max-width: 480px) { #u_content_image_1 .v-container-padding-padding { padding: 40px 10px 30px !important; } #u_column_2 .v-col-border { border-top: 0px solid transparent !important;border-left: 0px solid transparent !important;border-right: 0px solid transparent !important;border-bottom: 0px solid transparent !important; } #u_content_text_11 .v-container-padding-padding { padding: 30px 20px !important; } #u_content_text_1 .v-container-padding-padding { padding: 20px 20px 50px !important; } #u_content_text_14 .v-container-padding-padding { padding: 10px 15px 0px !important; } #u_content_text_14 .v-text-align { text-align: center !important; } #u_content_social_1 .v-container-padding-padding { padding: 30px 0px 20px 75px !important; } #u_content_divider_8 .v-container-padding-padding { padding: 10px !important; } #u_content_text_15 .v-container-padding-padding { padding: 10px 0px !important; } #u_content_text_15 .v-font-size { font-size: 13px !important; } #u_content_text_15 .v-text-align { text-align: center !important; } #u_content_image_2 .v-container-padding-padding { padding: 10px 0px 20px !important; } #u_content_image_2 .v-src-width { width: auto !important; } #u_content_image_2 .v-src-max-width { max-width: 49% !important; } #u_content_image_2 .v-text-align { text-align: center !important; } }
                          </style>
              </head>
                      
              <body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000">
                <table id="u_body" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%" cellpadding="0" cellspacing="0">
                    <tbody>
                      <tr style="vertical-align: top">
                        <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
                          <div class="u-row-container" style="padding: 0px;background-color: transparent">
                          <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
                          <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
                          <div style="background-color: #ffffff;height: 100%;width: 100% !important;">
                          <div class="v-col-border" style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;">
                        
                          <table id="u_content_image_1" style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                            <tbody>
                          <tr>
                            <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:50px 10px 40px;font-family:arial,helvetica,sans-serif;" align="left">
                              
                      <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                          <td class="v-text-align" style="padding-right: 0px;padding-left: 0px; background-color;:black" align="center">
                            <h2>Sistema de Agricultura Familiar</h2>
                            <hr>
                            
                          </td>
                        </tr>
                      </table>
                      
                            </td>
                          </tr>
                        </tbody>
                      </table>
                      
                        </div>
                      </div>
                          </div>
                        </div>
                        </div>
                        
                      
                        <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
                          <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
          
                          </div>
                        </div>
                        </div>
                        
                      <div class="u-row-container" style="padding: 0px;background-color: transparent">
                        <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
                          <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
                           
                      <div class="u-col u-col-100" style="max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;">
                        <div style="background-color: #ffffff;height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
                        <div class="v-col-border" style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
                        
                      <table id="u_content_text_11" style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tbody>
                          <tr>
                            <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:30px 65px;font-family:arial,helvetica,sans-serif;" align="left">
                              
                        <div class="v-text-align v-font-size" style="font-size: 16px; line-height: 140%; text-align: center; word-wrap: break-word;">
                          <p style="line-height: 140<span style="line-height: 22.4px;">Hola, <strong>'.$usuario.'</strong>, bienvenido(a) al Sistema de Agricultura Familiar</span></p>
                      <p style="line-height: 140%;"> </p>
                      <p style="line-height: 140%;"><span style="line-height: 22.4px;">Tu contraseña es la siguiente:</span></p>
                        </div>
                      
                            </td>
                          </tr>
                        </tbody>
                      </table>
                      
                        </div>
                        </div>
                      </div>
                          </div>
                        </div>
                        </div>
                        
                      <div class="u-row-container" style="padding: 0px;background-color: transparent">
                        <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
                          <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
          
                      <div class="u-col u-col-100" style="max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;">
                        <div style="background-color: #ffffff;height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
                        <!--[if (!mso)&(!IE)]><!--><div class="v-col-border" style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
                        
                      <table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tbody>
                          <tr>
                            <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
                              
                        <div class="v-text-align v-font-size" style="font-size: 26px; line-height: 140%; text-align: center; word-wrap: break-word;">
                          <p style="line-height: 140%;"><strong>'.$contrasena_aleatoria.'</strong></p>
                        </div>
                      
                            </td>
                          </tr>
                        </tbody>
                      </table>
                      
                        <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
                        </div>
                      </div>
          
                          </div>
                        </div>
                        </div>
                        
                      
                      
                        
                        
                      <div class="u-row-container" style="padding: 0px;background-color: transparent">
                        <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
                          <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
                            
                      <div class="u-col u-col-100" style="max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;">
                        <div style="background-color: #ffffff;height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
                        <!--[if (!mso)&(!IE)]><!--><div class="v-col-border" style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
                        
                      <table id="u_content_text_1" style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tbody>
                          <tr>
                            <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:30px 65px 50px;font-family:arial,helvetica,sans-serif;" align="left">
                              
                        <div class="v-text-align v-font-size" style="font-size: 15px; line-height: 140%; text-align: left; word-wrap: break-word;">
                      <p style="line-height: 140%;"> </p>
                      <p style="line-height: 140%;">Esta es una contraseña generada automáticamente por lo que debes cambiarla cuando ingreses a la plataforma.</p>
                        </div>
                      
                            </td>
                          </tr>
                        </tbody>
                      </table>
                      
                        <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
                        </div>
                      </div>
          
                          </div>
                        </div>
                        </div>
                        
                      <div class="u-row-container" style="padding: 0px;background-color: transparent">
                        <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
                          <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
          
                      <div class="u-col u-col-100" style="max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;">
                        <div style="background-color: #232323;height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
                        <!--[if (!mso)&(!IE)]><!--><div class="v-col-border" style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
                        
                      <table id="u_content_text_14" style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tbody>
                          <tr>
                            <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px 60px 25px 40px;font-family:arial,helvetica,sans-serif;" align="left">
                              
                        <div class="v-text-align v-font-size" style="font-size: 14px; color: #b8b8b8; line-height: 170%; text-align: left; word-wrap: break-word;">
                          <p style="line-height: 170%;">© 2023 - 2024 Sistema AF.</p>
                          <br>
                          <br>
                        </div>
                      
                            </td>
                          </tr>
                        </tbody>
                      </table>
                      
                  
                      </div>
                        </div>
                      </div>
                          </div>
                        </div>
                        </div>
            </body>
            </html>';

            $mail->send();

            echo json_encode(array("success" => true));
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
