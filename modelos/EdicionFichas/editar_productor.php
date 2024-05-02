<?php
ob_start();
// Incluye el archivo de conexión
include "../../php/conexion_be.php";
session_start();

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $idFicha=$_SESSION['id_ficha'];

    $primerNombre = $_POST['primerNombre'];
    $segundoNombre = $_POST['segundoNombre'];
    $primerApellido = $_POST['primerApellido'];
    $segundoApellido = $_POST['segundoApellido'];
    $identidadProductor = $_POST['identidadProductor'];
    $sexoProductor = $_POST['sexoProductor'];
    $fechaNacimiento = $_POST['fechaNacimiento'];
    $estadoCivilProductor = $_POST['estadoCivilProductor'];
    $telefonoPrincipal = $_POST['telefonoPrincipal'];
    $telefonoSecundario = $_POST['telefonoSecundario'];
    $telefonoOpcional = $_POST['telefonoOpcional'];
    $escolaridadProductor = $_POST['escolaridadProductor'];
    $ultimoGradoEscolar = $_POST['ultimoGradoEscolar'];
    $correoPrincipal = $_POST['correoPrincipal'];
    $correoSecundario = $_POST['correoSecundario'];
    $correoOpcional = $_POST['correoOpcional'];
    $modificado_por = $_SESSION["usuario"]["usuario"];

    $stmt = $conexion->prepare("SELECT fecha_nacimiento FROM tbl_productor WHERE id_ficha = ?");
    $stmt->bind_param("i", $idFicha);
    $stmt->execute();
    $resultado = $stmt->get_result();
    $datos_usuario = $resultado->fetch_assoc();
    $fecha_nacimiento_actual = date('Y-m-d');

    // Comparar las fechas
    if ($fecha_ingresada > $fecha_nacimiento_actual) {
        echo "La fecha ingresada es mayor que la fecha de hoy.";
        die();
    } else {
        echo "La fecha ingresada es válida.";
    }

    // Llamar al procedimiento almacenado
    $sql = "CALL ActualizarProductor(
        '$idFicha',
        '$primerNombre',
        '$segundoNombre',
        '$primerApellido',
        '$segundoApellido',
        '$identidadProductor',
        '$fechaNacimiento',
        '$sexoProductor',
        '$estadoCivilProductor',
        '$escolaridadProductor',
        '$ultimoGradoEscolar',
        '$telefonoPrincipal',
        '$telefonoSecundario',
        '$telefonoOpcional',
        '$correoPrincipal',
        '$correoSecundario',
        '$correoOpcional',
        '$modificado_por'
    )";

    if (mysqli_query($conexion, $sql)) {
        // Redirige a la siguiente página
        //header("Location: ../bienvenida.php?success=true&message=La Pregunta se actualizó correctamente#datosUbiForm");
        exit(); // Detener la ejecución del script
    } else {
        echo "Error al guardar los datos: " . mysqli_error($conexion);
    }

    mysqli_close($conexion);
}
?>

