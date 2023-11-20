<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los valores del formulario o de donde los estés obteniendo
    $id_productor = $_POST["id_productor"];
    $id_ficha = $_POST["id_ficha"];
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
    $modificado_por = $_SESSION["usuario"]['usuario'];
    $estado = $_POST["estado"];

    // Llamar al procedimiento almacenado
    $sql = "CALL ActualizarProductor(
        '$id_productor',
        '$id_ficha',
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
        '$modificado_por',
        '$estado'
    );";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush();
        echo "success";
    } else {
        ob_end_clean();
        echo "Error al actualizar el productor: " . mysqli_error($conexion);
    }

    mysqli_close($conexion);
}
?>
