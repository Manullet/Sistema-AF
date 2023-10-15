<?php
include '../php/conexion_be.php';

// Verifica si se ha enviado un formulario y si se proporcionó un ID de objeto válido
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["Id_pregunta"])) {
    // Obtiene el ID de obejto desde el formulario
    $Id_pregunta = $_POST["Id_pregunta"];

    // Crea una consulta SQL para eliminar el objeto con el ID proporcionado
    $sql = "DELETE FROM Preguntas WHERE Id_pregunta = '$Id_pregunta'";
    
    if (mysqli_query($conexion, $sql)) {
        // Éxito en la eliminación
        header("Location: ../bienvenida.php?success=true&message=La Pregunta se eliminó correctamente");
        exit();
    } else {
        // Error en la eliminación
        header("Location: ../bienvenida.php?success=false&message=Hubo un error al eliminar Pregunta");
        exit();
    }
} else {
    // Si no se proporcionó un ID de objeto válido o no se envió un formulario, redirige a la página pregunta.php
    header("Location: ../vistas/Mantenimiento_preguntas.php");
    exit();
}
?>