<?php
// Incluye el archivo de conexión a la base de datos
include 'conexion_be.php';

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    $Nombre = $_POST["Nombre"];
    $Nombre_Guard = $_POST["Nombre_Guard"];

    // Llama al procedimiento almacenado
    $sql = "CALL InsertRoles('$Nombre', '$Nombre_Guard')";

    if (mysqli_query($conexion, $sql)) {
        header("Location: ../vistas/Mantenimiento_roles.php?success=true");
        exit(); // Detener la ejecución del script
    } else {
            echo "Error al insertar el nuevo rol: " . mysqli_error($conexion);
        }
    mysqli_close($conexion);
}
?>

