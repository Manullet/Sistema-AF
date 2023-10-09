<!DOCTYPE html>
<html>

<head>
    <title>Recuperar Contraseña</title>
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">


    <link rel="stylesheet" href="../assets/css/estilos.css"><!-- cambiar la direcion de los estilos-->
</head>

<body>


    <div class="contenedor__todo">
        <div class="caja__trasera">
            <div class="caja__trasera-login">
                
                <h2>Recuperar Contraseña</h2>
                <p></p>
                <form action="../php/recuperar_contrasena_be.php" method="POST">
                
                    <label for="correo">Correo Electrónico:</label>
                    <input type="email" id="correo" name="correo" required><br><br>
                    <label for="text">¿cual es su color favorito?</label><br><br>

                    <label for="respuesta">Respuesta Secreta:</label>
                    <input type="password" id="respuesta" name="respuesta" required><br><br>

                    <label for="respuesta">nueva contraseña:</label>
                    <input type="text" id="contraseña" name="contraseña" required><br>  

                    <button type="submit">Recuperar Contraseña</button><br>
                    <br>
                    <a href="../index.php">ATRAS</a><br>
                    
                </form>

</body>

</html>
<main>