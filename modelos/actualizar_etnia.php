<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_etnia_to_update = $_POST["id_etnia"];
    $nombre_etnia = $_POST["etnia"];
    $descripcion_etnia = $_POST["descripcion"];
    $usuario = $_SESSION["usuario"]["usuario"];
    $estado = $_POST["estado"];



    $sql_verificar = "SELECT * FROM tbl_etnias WHERE etnia = '$nombre_etnia' AND id_etnia != '$id_etnia_to_update'";
   $resultado_verificar = $conexion->query($sql_verificar);
   if ($resultado_verificar->num_rows > 0) {
    // Muestra un mensaje de error si ya existe una categoría de cultivo con el mismo nombre
    echo "existe";

} else {
    // Llamada al procedimiento almacenado adaptado
    $sql = "CALL ActualizarEtnia('$id_etnia_to_update', '$nombre_etnia', '$descripcion_etnia', '$usuario', '$estado')";

    if (mysqli_query($conexion, $sql)) {
        ob_end_flush();
        echo "success";
    } else {
        ob_end_clean();
        echo "Error al actualizar la etnia: " . mysqli_error($conexion);
    }
}
    mysqli_close($conexion);
}
?>
