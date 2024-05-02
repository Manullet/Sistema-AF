<?php
include '../php/conexion_be.php';

// Verifica si se ha enviado un formulario y si se proporcionó un ID de objeto válido
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["Id_Siembra"])) {
    // Obtiene el ID de obejto desde el formulario
    $Id_Siembra = $_POST["Id_Siembra"];

    // Crea una consulta SQL para eliminar el objeto con el ID proporcionado
    $sql = "DELETE FROM tbl_siembra WHERE Id_siembra = '$Id_Siembra'";
    
    if (mysqli_query($conexion, $sql)) {
        echo json_encode(array("success" => true));
        // Éxito en la eliminación
        //header("Location: ../bienvenida.php?success=true&message=La Pregunta se eliminó correctamente");
        exit();
    } else {
        echo json_encode(array("success" => false));
        // Error en la eliminación
        //header("Location: ../bienvenida.php?success=false&message=Hubo un error al eliminar Pregunta");
        exit();
    }
} else {
    // Si no se proporcionó un ID de objeto válido o no se envió un formulario, redirige a la página pregunta.php
    //header("Location: ../vistas/Mantenimiento_preguntas.php");
    exit();
}
?>