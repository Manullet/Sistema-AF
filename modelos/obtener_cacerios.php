<?php
include '../php/conexion_be.php';

if (isset($_POST['aldea_id'])) {
    $aldea_id = $_POST['aldea_id'];

    $sql = "SELECT Id_Cacerio, Nombre_Cacerio FROM tbl_cacerios WHERE Id_Aldea = $aldea_id";
    $result = mysqli_query($conexion, $sql);

    $cacerios = array();
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $cacerios[] = $row;
        }
    }

    echo json_encode($cacerios);
}

mysqli_close($conexion);
?>
