<?php
// Incluye el archivo de conexión a la base de datos
include 'conexion_be.php';

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    $Id_Usuario = $_POST["Id_Usuario"];
    $Nombre = $_POST["Nombre"];
    $Usuario = $_POST["Usuario"];
    $Correo = $_POST["Correo"];
    $Estado = $_POST["Estado"];
  
    
    // Llama al procedimiento almacenado con 4 argumentos
    $sql = "CALL UpdateUsuario('$Id_Usuario', '$Nombre', '$Usuario','$Correo','$Estado')";

    if (mysqli_query($conexion, $sql)) {
      header("Location: ../bienvenida.php?success=true"); // Redirige a index.php con el parámetro success=true
      exit(); // Detiene la ejecución del script
  } else {
      echo "Error al actualizar el usuario: " . mysqli_error($conexion);
  }
  
    mysqli_close($conexion);
}
?>

