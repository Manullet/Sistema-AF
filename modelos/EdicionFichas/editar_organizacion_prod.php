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
    $modificado_por = $_SESSION["usuario"]["usuario"]; // Reemplaza con la lógica adecuada para obtener el nombre de usuario

    // Verifica si se seleccionó "Si" para prestamo
    $perteneceOrganizacion = trim($_POST['pertenece'] == 'si' ? 'S' : 'N');

    if($perteneceOrganizacion == 'S'){
        $organizacionProductor = isset($_POST['organizacion']) ? $_POST['organizacion'] : array();
        $id_tipo_organizacion = array();

        // Llamar al procedimiento almacenado
        $sql = "CALL ActualizarBaseOrganizacion($idFicha, $idProductor, '$perteneceOrganizacion', null, '$modificado_por')";
        $result = mysqli_query($conexion, $sql);

        if ($result) {
            // Redirige a la siguiente página
            //header("Location: siguiente_pagina.php");
            //exit(); // Detener la ejecución del script
        } else {
            echo "Error al guardar los datos: " . mysqli_error($conexion);
        }

        foreach ($organizacionProductor as $organizacion) {
            // Escapar el motivo para evitar inyección de SQL
            $org_escapada = mysqli_real_escape_string($conexion, $organizacion);
    
            // Consulta para obtener el ID del motivo seleccionado
            $query = "SELECT id_organizacion FROM tbl_organizaciones WHERE organizacion = '$org_escapada'";
            $result = mysqli_query($conexion, $query);
    
            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $id_tipo_organizacion[] = $row['id_organizacion'];
                }
            } else {
                echo "Error al obtener ID del motivo: " . mysqli_error($conexion);
            }
    
        }
    
        foreach($id_tipo_organizacion as $id_organizacion){
            // Llamar al procedimiento almacenado
            $sql = "CALL InsertarOrganizacionProductor($idFicha, $id_organizacion,$idProductor, null, '$modificado_por')";
            $result = mysqli_query($conexion, $sql);
        }
    }else{
        // Llamar al procedimiento almacenado
        $sql = "CALL ActualizarBaseOrganizacion($idFicha, $idProductor, '$perteneceOrganizacion', null, '$modificado_por')";
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