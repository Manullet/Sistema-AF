<?php
// Incluye el archivo de conexión a la base de datos
include 'Modelo/conexion.php';

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    $id = $_POST["id"];
    $nombre = $_POST["nombre"];
    $usuario = $_POST["usuario"];
    $contraseña = $_POST["contraseña"];
    $correo = $_POST["correo"];
    $estado = $_POST["estado"];
    
    // Llama al procedimiento almacenado con 4 argumentos
    $sql = "CALL UpdateUsuario('$id', '$nombre', '$usuario','$contraseña','$correo','$estado')";

    if (mysqli_query($conexion, $sql)) {
      header("Location: index.php?success=true"); // Redirige a index.php con el parámetro success=true
      exit(); // Detiene la ejecución del script
  } else {
      echo "Error al actualizar el usuario: " . mysqli_error($conexion);
  }
  
    mysqli_close($conexion);
}
?>

