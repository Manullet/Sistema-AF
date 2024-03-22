<?php

ob_start();
include "../php/conexion_be.php";
session_start();


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fuente_credito = $_POST["fuente_credito"];
    $descripcion = $_POST["descripcion"];
    $usuario = $_SESSION["usuario"]["usuario"];

    // Verifica si ya existe una categoría de cultivo con el mismo nombre
    $sql_verificar = "SELECT * FROM tbl_fuentes_credito WHERE fuente_credito = '$fuente_credito' ";
    $resultado_verificar = $conexion->query($sql_verificar);
    if ($resultado_verificar->num_rows > 0) {
        // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
        echo '
          <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
          <script>
              document.addEventListener("DOMContentLoaded", function() {
                  Swal.fire({
                      title: "Error!",
                      text: "Ya existe un registro con el mismo nombre.",
                      icon: "error",
                      confirmButtonText: "Cerrar"
                  }).then(function() {
                      window.history.back(); // Regresa a la página anterior
                  });
              });
          </script>
      ';
    } else {

        // Llamada al procedimiento almacenado adaptado
        $sql = "CALL InsertarFuenteCredito('$fuente_credito', '$descripcion', '$usuario')";

        if (mysqli_query($conexion, $sql)) {
            header("Location: ../bienvenida.php?success=true");
            exit();
        } else {
            if (mysqli_errno($conexion) == 1062) {
                echo '<div class="alert alert-danger text-center">Error: La fuente de crédito ya existe</div>';
            } else {
                echo '<div class="alert alert-warning text-center">Error al insertar la fuente de crédito</div>';
            }
        }
    }

    mysqli_close($conexion);
}
