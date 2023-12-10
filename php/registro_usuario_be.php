<?php
session_start();

include 'conexion_be.php';


$nombre_completo = $_POST['nombre_completo'];
$correo = $_POST['correo'];
$usuario = $_POST['usuario'];
$contrasena = $_POST['contrasena'];

// Encriptar la contraseña
$contrasena_encriptada = password_hash($contrasena, PASSWORD_DEFAULT);

// Obtener la fecha actual
$fecha_creacion = date('Y-m-d H:i:s');

// Obtener la cantidad de días de vigencia desde la tabla parametros
$query_dias_vigencia = "SELECT valor FROM tbl_parametros WHERE parametro = 'admin_dias_vigencia'";
$resultado_dias_vigencia = mysqli_query($conexion, $query_dias_vigencia);

if ($resultado_dias_vigencia) {
    $fila_dias_vigencia = mysqli_fetch_assoc($resultado_dias_vigencia);
    $dias_vigencia = $fila_dias_vigencia['valor'];

    // Calcular la fecha de vencimiento sumando los días de vigencia a la fecha de creación
    $fecha_vencimiento = date('Y-m-d H:i:s', strtotime($fecha_creacion . " + $dias_vigencia days"));

    // Verificar que el correo no se repita en la base de datos
    $verificar_correo = mysqli_query($conexion, "SELECT * FROM usuario WHERE correo ='$correo'");
    if(mysqli_num_rows($verificar_correo) > 0) {
        echo '<script>alert("Correo ya existe, intente con otro correo"); window.location = "../index.php";</script>';
        exit();
    }

    // Verificar que el usuario no se repita en la base de datos
    $verificar_usuario = mysqli_query($conexion, "SELECT * FROM usuario WHERE usuario ='$usuario'");
    if(mysqli_num_rows($verificar_usuario) > 0) {
        echo '<script>alert("Usuario ya existe, intente con otro usuario"); window.location = "../index.php";</script>';
        exit();
    }

    // Establecer directamente el ID del estado como 1 ('ACTIVO')
    $id_estado = 1;

    // Establecer directamente el ID del rol como 2
    $id_rol = 2;

    $query = "INSERT INTO usuario(nombre_completo, correo, usuario, contrasena, id_estado, id_rol, fecha_creacion, fecha_vencimiento)
              VALUES('$nombre_completo', '$correo', '$usuario', '$contrasena_encriptada', '$id_estado', '$id_rol', '$fecha_creacion', '$fecha_vencimiento')";

    $ejecutar = mysqli_query($conexion, $query);

    if($ejecutar) {
        $_SESSION['usuario_creado'] = true;
        echo '<script>alert("Usuario registrado correctamente"); window.location = "../index.php";</script>';
        exit();
    } else {
        echo '<script>alert("Error al registrar el usuario: ' . mysqli_error($conexion) . '"); window.location = "../index.php";</script>';
    }
} else {
    echo '<script>alert("Error al obtener la cantidad de días de vigencia: ' . mysqli_error($conexion) . '"); window.location = "../index.php";</script>';
}

mysqli_close($conexion);
?>