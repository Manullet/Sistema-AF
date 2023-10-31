<?php
// Incluye el archivo de conexión a la base de datos
include 'conexion_be.php';

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    $Id_rol = $_POST["Id_rol"];
    $Nombre = $_POST["Nombre"];
    $Descripcion = $_POST["Descripcion"];
    $STATUS = $_POST["STATUS"];
    


    // Llama al procedimiento almacenado con 4 argumentos
    $sql = "CALL UpdateRole('$Id_rol', '$Nombre', '$Descripcion','$STATUS')";

    if (mysqli_query($conexion, $sql)) {
        header("Location: ../bienvenida.php?success=true&message=El rol se actualizó correctamente");
        exit(); // Detener la ejecución del script
    } else {
        echo "Error al actualizar el rol: " . mysqli_error($conexion);
    }
    mysqli_close($conexion);
}
?>



