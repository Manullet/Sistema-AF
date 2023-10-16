
<?php
// Incluye el archivo de conexión a la base de datos
include '../php/conexion_be.php';

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    //$Id_objetos = $_POST["Id_objetos"];
    $Objeto = $_POST["Objeto"];
    $Descripcion = $_POST["Descripcion"];
    $Actualizado_Por = $_POST["Actualizado_Por"];
    $Creado_Por = $_POST["Creado_Por"];
    //$Status = $_POST["Status"];
  

    // Llama al procedimiento almacenado con 5 argumentos
    $sql = "CALL InsertObejtos('$Objeto', '$Descripcion', '$Actualizado_Por', '$Creado_Por')";

    if (mysqli_query($conexion, $sql)) {
        header("Location: ../bienvenida.php?success=true&message=El rol se actualizó correctamente");
        exit(); // Detener la ejecución del script
    } else {
        echo "Error al actualizar el rol: " . mysqli_error($conexion);
    }
    mysqli_close($conexion);
}
?>
