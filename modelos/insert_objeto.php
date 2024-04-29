<?php
// Incluye el archivo de conexión a la base de datos
include '../php/conexion_be.php';
session_start();

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los valores del formulario
    // Obtiene los valores del formulario
    $Objeto = $_POST["Objeto"];
    $Descripcion = $_POST["Descripcion"];
    $tipo_objeto = $_POST["tipo_objeto"];
    $Creado_Por = $_SESSION["usuario"] ['usuario'];


 // Verifica si ya existe una categoría de cultivo con el mismo nombre
 $sql_verificar = "SELECT * FROM objetos WHERE Objeto = '$Objeto' ";
 $resultado_verificar = $conexion->query($sql_verificar);
 if ($resultado_verificar->num_rows > 0) {
     // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
     echo '
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
         <script>
             document.addEventListener("DOMContentLoaded", function() {
                 Swal.fire({
                     title: "Error!",
                     text: "Ya existe un sector con el mismo nombre.",
                     icon: "error",
                     confirmButtonText: "Cerrar"
                 }).then(function() {
                     window.history.back(); // Regresa a la página anterior
                 });
             });
         </script>
     ';
 } else {
   // Llama al procedimiento almacenado
   $sql = "CALL InsertObjeto('$Objeto', '$Descripcion', '$tipo_objeto', '$Creado_Por' )";
   if (mysqli_query($conexion,$sql)) {
       header("Location: ../bienvenida.php?success=true");
       exit();
   } else {
       if (mysqli_errno($conexion) == 1062) {
           echo '<div class="alert alert-danger text-center">Error ID Ya Existente</div>';
       } else {
           echo '<div class="alert alert-warning text-center">Algunos Campos Estan Vacios</div>';
       }
       
   }
 }

    mysqli_close($conexion);
}
?>