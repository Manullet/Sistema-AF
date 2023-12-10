<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
    body {
        margin: 0;
        padding: 0;
        background-color: #f9f9ff;
        font-family: 'Arial', sans-serif;
        color: #000000;
    }
    .container {
        width: 100%;
        max-width: 600px;
        margin: auto;
        background-color: #ffffff;
    }
    .header img {
        width: 35%;
        display: block;
        margin: auto;
        padding-top: 60px;
    }
    .header h1 {
        text-align: center;
        font-weight: 400;
        padding: 10px;
    }
    .content {
        padding: 0 60px 40px;
    }
    .content p {
        font-size: 16px;
        line-height: 1.5;
    }
    .button {
        background-color: #fdb441;
        color: #000000; 
        text-align: center;
        display: block;
        margin: auto;
        padding: 10px 20px;
        border-radius: 25px;
        text-decoration: none;
        width: auto;
        max-width: fit-content;
    }


    .button:link, .button:visited, .button:hover, .button:active {
        color: #000000; 
        text-decoration: none; 
    }

    .footer {
        background-color: #ffffff;
        text-align: center;
        padding: 40px 10px;
    }
    .footer img {
        margin: 0 10px;
        width: 32px;
        height: 32px;
    }
    .footer p {
        border-top: 1px solid #BBBBBB;
        padding-top: 20px;
    }
</style>

</head>
<body>
    <div class="container">
        <div class="header">
            <img src="images/image-5.png" alt="Lock Image" />
            <h1>¿Olvido su contraseña?</h1>
        </div>
        <div class="content">
            <p>Le hemos enviado este correo electrónico en respuesta a su solicitud para restablecer su contraseña.</p>
            <p>Para restablecer su contraseña, siga el siguiente enlace:</p>
            <a href="" target="_blank" class="button">Restablece tu contraseña</a>
        </div>
        <div class="footer">
            <a href="https://www.facebook.com" target="_blank">
                <img src="images/image-1.png" alt="Facebook" />
            </a>
            <a href="https://twitter.com" target="_blank">
                <img src="images/image-4.png" alt="Twitter" />
            </a>
            <a href="https://www.linkedin.com" target="_blank">
                <img src="images/image-2.png" alt="LinkedIn" />
            </a>
            <a href="https://www.instagram.com" target="_blank">
                <img src="images/image-3.png" alt="Instagram" />
            </a>
            <p>&copy; All Rights Reserved</p>
        </div>
    </div>
</body>
</html>
