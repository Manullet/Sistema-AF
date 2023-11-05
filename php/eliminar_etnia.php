<?php
ob_start();

include 'conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verifica si se ha enviado un valor para "id_etnia"
    if (isset($_POST["id_etnia"])) {
        $id = $_POST["id_etnia"];
        
        // Llama al procedimiento almacenado con el argumento "id_etnia"
        $sql = "CALL DeleteEtnia($id)";
        
        if (mysqli_query($conexion, $sql)) {
            ob_end_flush();
            echo "success";
        } else {
            ob_end_clean();
            echo "Error al eliminar la Etnia: " . mysqli_error($conexion);
        }
    } else {
        ob_end_clean();
        echo "Error: El parámetro 'id_etnia' no se proporcionó.";
    }
    
    mysqli_close($conexion);
}
?>
