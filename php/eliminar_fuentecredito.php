<?php
ob_start();

include 'conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verifica si se ha enviado un valor para "id_etnia"
    if (isset($_POST["id_fuente_credito"])) {
        $id = $_POST["id_fuente_credito"];
        
        // Llama al procedimiento almacenado con el argumento "id_etnia"
        $sql = "CALL EliminarFuenteCredito($id)";
        
        if (mysqli_query($conexion, $sql)) {
            ob_end_flush();
            echo "success";
        } else {
            ob_end_clean();
            echo "Error al eliminar la Fuente de Credito: " . mysqli_error($conexion);
        }
    } else {
        ob_end_clean();
        echo "Error: El parámetro 'id_fuente_credito' no se proporcionó.";
    }
    
    mysqli_close($conexion);
}
?>
