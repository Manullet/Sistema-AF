<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_ficha=$_POST["id_ficha"];
    $id_productor=$_POST["id_productor"];
    $ha_solicitado_creditos=$_POST["ha_solicitado_creditos"];
    $id_fuente_credito=$_POST["id_fuente_credito"];
    $monto_credito=$_POST["monto_credito"];
    $id_motivos_no_credito=$_POST["id_motivos_no_credito"];
    $descripcion=$_POST["descripcion"];
    $creado_por = $_SESSION["usuario"]["usuario"];


    $sql = "CALL InsertarCreditoProduccion('$id_ficha', '$id_productor','$ha_solicitado_creditos', '$id_fuente_credito','$monto_credito', '$id_motivos_no_credito','$descripcion', '$creado_por')";

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
    
    mysqli_close($conexion);
}

?>