<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_ficha=$_POST["id_ficha"];
    $id_productor=$_POST["id_productor"];

    $tiene_migrantes=$_POST["tiene_migrantes"];
    $migracion_dentro_pais=$_POST["migracion_dentro_pais"];

    $migracion_fuera_pais=$_POST["migracion_fuera_pais"];
    $id_tipo_motivos=$_POST["id_tipo_motivos"];
    $remesas=$_POST["remesas"];



    $descripcion=$_POST["descripcion"];
    $creado_por = $_SESSION["usuario"]["usuario"];


    $sql = "CALL InsertarMigracionFamiliar('$id_ficha', '$id_productor', '$tiene_migrantes','$migracion_dentro_pais','$migracion_fuera_pais', '$id_tipo_motivos','$remesas','$descripcion', '$creado_por')";

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