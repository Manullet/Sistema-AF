<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtén los datos del formulario
    $id_ficha = $_POST["id_ficha"];
    $id_productor = $_POST["id_productor"];
    $primer_nombre = $_POST["primer_nombre"];
    $segundo_nombre = $_POST["segundo_nombre"];
    $primer_apellido = $_POST["primer_apellido"];
    $segundo_apellido = $_POST["segundo_apellido"];
    $identificacion = $_POST["identificacion"];
    $fecha_nacimiento = $_POST["fecha_nacimiento"];
    $genero = $_POST["genero"];
    $estado_civil = $_POST["estado_civil"];
    $nivel_escolaridad = $_POST["nivel_escolaridad"];
    $ultimo_grado_escolar_aprobado = $_POST["ultimo_grado_escolar_aprobado"];
    $telefono_1 = $_POST["telefono_1"];
    $telefono_2 = $_POST["telefono_2"];
    $telefono_3 = $_POST["telefono_3"];
    $email_1 = $_POST["email_1"];
    $email_2 = $_POST["email_2"];
    $email_3 = $_POST["email_3"];
    $descripcion = $_POST["descripcion"];
    $creado_por = $_SESSION["usuario"]["usuario"]; // Ajusta según tu estructura de sesión

    // Llama al procedimiento almacenado
    $sql = "CALL InsertarProductor(
        '$id_ficha',
        '$id_productor',
        '$primer_nombre',
        '$segundo_nombre',
        '$primer_apellido',
        '$segundo_apellido',
        '$identificacion',
        '$fecha_nacimiento',
        '$genero',
        '$estado_civil',
        '$nivel_escolaridad',
        '$ultimo_grado_escolar_aprobado',
        '$telefono_1',
        '$telefono_2',
        '$telefono_3',
        '$email_1',
        '$email_2',
        '$email_3',
        '$descripcion',
        '$creado_por'
    );";

    if (mysqli_query($conexion,$sql)) {
        header("Location: ../bienvenida.php?success=true");
        exit();
    } else {
        if (mysqli_errno($conexion) == 1062) {
            echo '<div class="alert alert-danger text-center">Error ID Ya Existente</div>';
        } else {
            echo '<div class="alert alert-warning text-center">Algunos Campos Estan Vacios</div>';
        }
        
    }
    
    mysqli_close($conexion);
}
?>
