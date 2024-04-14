<?php
ob_start();
include "../../php/conexion_be.php";
session_start();

// Verifica si se ha enviado un formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $idFicha=$_SESSION['id_ficha'];

    $sql = "SELECT id_productor from tbl_productor where id_ficha='$idFicha' limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();
   
    $idProductor = $row['id_productor'];

    // Obtener datos del formulario
    $creado_por = $_SESSION["usuario"]["usuario"]; // Reemplaza con la lógica adecuada para obtener el nombre de usuario

    // Consulta DELETE
    $sql = "DELETE FROM tbl_migracion_familiar WHERE id_ficha = '$idFicha' and id_productor = '$idProductor'";
    $result = $conexion->query($sql);

    // Verifica si se seleccionó "Si" para migración
    if (isset($_POST['migra']) && $_POST['migra'] == 'S') {
        $tiene_migrantes = 'S';
    } else {
        $tiene_migrantes = 'N';
    }

    if( $tiene_migrantes =='S'){
        // Obtiene el destino de migración
        $migracion_dentro_pais = isset($_POST['destino']) && $_POST['destino'] == 'dentro_del_pais' ? 'S' : 'N';
        $migracion_fuera_pais = isset($_POST['destino']) && $_POST['destino'] == 'otro_pais' ? 'S' : 'N';

        // Verifica si se envían remesas
        $remesas = isset($_POST['remesas']) && $_POST['remesas'] == 'si' ? 'S' : 'N';

        // Obtiene los motivos de migración
        $motivos_seleccionados = isset($_POST['razon']) ? $_POST['razon'] : array();

        // Obtener los ID de los motivos seleccionados
        $id_tipo_motivos = array();
        foreach ($motivos_seleccionados as $motivo) {
            // Escapar el motivo para evitar inyección de SQL
            $motivo_escapado = mysqli_real_escape_string($conexion, $motivo);

            // Consulta para obtener el ID del motivo seleccionado
            $query = "SELECT Id_motivo FROM tbl_motivos_migracion WHERE Motivo = '$motivo_escapado'";
            $result = mysqli_query($conexion, $query);

            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $id_tipo_motivos[] = $row['Id_motivo'];
                }
            } else {
                echo "Error al obtener ID del motivo: " . mysqli_error($conexion);
            }

        }

        foreach($id_tipo_motivos as $id_motivo){
            // Llamar al procedimiento almacenado
            $sql = "CALL InsertMigracionFamiliarData($idFicha, $idProductor, '$tiene_migrantes', '$migracion_dentro_pais', '$migracion_fuera_pais', '$id_motivo', '$remesas', '$creado_por')";
            $result = mysqli_query($conexion, $sql);
        }

        if ($result) {
            // Redirige a la siguiente página
            //header("Location: siguiente_pagina.php");
            //exit(); // Detener la ejecución del script
        } else {
            echo "Error al guardar los datos: " . mysqli_error($conexion);
        }

    }else{
        $sql = "CALL InsertMigracionFamiliarData($idFicha, $idProductor, '$tiene_migrantes', 'N', 'N', null, 'N', '$creado_por')";
        $result = mysqli_query($conexion, $sql);

        if ($result) {
            // Redirige a la siguiente página
            //header("Location: siguiente_pagina.php");
            //exit(); // Detener la ejecución del script
        } else {
            echo "Error al guardar los datos: " . mysqli_error($conexion);
        }
    }
    
    // Cierra la conexión a la base de datos
    mysqli_close($conexion);
}
?>
<!-- Tu formulario HTML sigue aquí -->
