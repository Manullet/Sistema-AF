<?php
ob_start();
include "../php/conexion_be.php";
session_start();

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Obtener datos del formulario
    $creado_por = $_SESSION["usuario"]["usuario"];

    // Verifica si la etnia es "Otros"
    if (isset($_POST['etnia']) && $_POST['etnia'] == 'Otros') {
        $id_etnia = 11; // Cambia con el ID correcto para la opción "Otros"
    } else {
        $id_etnia = $_POST['etnia'];
    }

    // Llamar al procedimiento almacenado
    $sql = "CALL InsertarEtniaProductor('$id_etnia', '$creado_por')";

    if (mysqli_query($conexion, $sql)) {
        // Redirige a la siguiente página
        header("Location: ../bienvenida.php?success=true&message=La Pregunta se actualizó correctamente#datosRelevoForm");
        exit(); // Detener la ejecución del script
    } else {
        echo "Error al guardar los datos: " . mysqli_error($conexion);
    }

    // Cierra la conexión a la base de datos
    mysqli_close($conexion);
}
?>
