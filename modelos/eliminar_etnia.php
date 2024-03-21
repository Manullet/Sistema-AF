
<?php
ob_start(); 

include '../php/conexion_be.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_etnia = $_POST["id_etnia"];

    $sql = "CALL EliminarEtnia($id_etnia)";
/**este esta bueno msg */
    if (mysqli_query($conexion, $sql)) {
        ob_end_flush(); 
        echo "success"; 
    } else {
        ob_end_clean(); 
        echo "Error al eliminar el registro: " . mysqli_error($conexion);
    }
    
    mysqli_close($conexion);
}
?>