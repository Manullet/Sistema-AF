<?php

include "../php/conexion_be.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $periodo=$_POST["periodo"];
    $descripcion=$_POST["descripcion"];

    $sql_verificar = "SELECT * FROM tbl_motivos_migracion WHERE Motivo = '$Motivo' ";
    $resultado_verificar = $conexion->query($sql_verificar);
    if ($resultado_verificar->num_rows > 0) {
        // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
        echo '
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    Swal.fire({
                        title: "Error!",
                        text: "Ya existe un periodo con el mismo nombre.",
                        icon: "error",
                        confirmButtonText: "Cerrar"
                    }).then(function() {
                        window.history.back(); // Regresa a la página anterior
                    });
                });
            </script>
        ';
    } else {


    $sql = "CALL InsertarPeriodicidad('$periodo', '$descripcion')";

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