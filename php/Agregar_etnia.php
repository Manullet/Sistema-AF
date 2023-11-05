<?php
ob_start();

include 'conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $etnia = $_POST["etnia"];
    $descripcion = $_POST["descripcion"];
    $fecha_creacion = $_POST["fechaCreacion"];
    
    // Verificamos y convertimos el estado a 1 si es "Activo" o 0 si es "Inactivo"
    $estado = ($_POST["estado"] === "Activo") ? 1 : 0;
    
    $fecha_creacion = date("Y-m-d H:i:s", strtotime($fecha_creacion));

    $sql = "CALL InsertarEtnia('$etnia', '$descripcion', '$fecha_creacion', '$estado')";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush();
        echo "success";
    } else {
        ob_end_clean();
        echo "Error al agregar la etnia: " . mysqli_error($conexion);
    }

    mysqli_close($conexion);
}
?>
