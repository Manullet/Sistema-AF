<?php
ob_start();
include "../../php/conexion_be.php";
session_start();

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $idFicha=$_SESSION['id_ficha'];

    $sql = "SELECT id_productor from tbl_productor where id_ficha='$idFicha' limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();
   
    $idProductor = $row['id_productor'];

    // Obtener datos del formulario
    $modificado_por = $_SESSION["usuario"]["usuario"];

    // Verifica si la etnia es "Otros"
    if (isset($_POST['etnia']) && $_POST['etnia'] == 'Otros') {
        $id_etnia = 11;
        $otraEtnia = $_POST['otrasEtn'];
    } else {
        $id_etnia = $_POST['etnia'];
        $otraEtnia = null;
    }
    var_dump($idFicha);

    // Llamar al procedimiento almacenado
    $sql = "CALL ActualizarEtniasPorProductor($idFicha,$idProductor,'$id_etnia', '$otraEtnia', '$modificado_por')";

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
