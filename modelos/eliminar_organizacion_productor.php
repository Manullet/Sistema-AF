<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_Organizacion_Productor = $_POST["Id_Organizacion_Productor"];

    $sql = "CALL EliminarOrganizacionPorProductor('$Id_Organizacion_Productor');";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush();
        echo "success";
    } else {
        ob_end_clean();
        echo "Error al eliminar la organización por productor: " . mysqli_error($conexion);
    }

    mysqli_close($conexion);
}
?>
