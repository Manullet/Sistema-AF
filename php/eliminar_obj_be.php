<?php
include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["Id_objetos"])) {
    // Validación del ID de objeto
    $Id_objetos = intval($_POST["Id_objetos"]);
    
    if ($Id_objetos <= 0) {
        // ID de objeto no válido
        header("Location: ../bienvenida.php?success=false&message=ID de objeto no válido");
        exit();
    }

    // Consulta SQL preparada
    $delete_query = "DELETE FROM objetos WHERE Id_objetos = ?";
    
    // Preparar la declaración
    if ($stmt = mysqli_prepare($conexion, $delete_query)) {
        // Vincular el ID de objeto a la declaración
        mysqli_stmt_bind_param($stmt, "i", $Id_objetos);

        // Ejecutar la declaración
        if (mysqli_stmt_execute($stmt)) {
            // Éxito en la eliminación
            header("Location: ../bienvenida.php?success=true&message=El objeto se eliminó correctamente");
            exit();
        } else {
            // Error en la eliminación
            header("Location: ../bienvenida.php?success=false&message=Hubo un error al eliminar el objeto");
            exit();
        }

        // Cerrar la declaración
        //mysqli_stmt_close($stmt);
    } else {
        // Error en la preparación de la consulta
        header("Location: ../bienvenida.php?success=false&message=Error en la preparación de la consulta");
        exit();
    }
} else {
    // Redirige si no se proporcionó un ID de objeto válido o no se envió un formulario
    header("Location: ../bienvenida.php");
    exit();
}
?>
