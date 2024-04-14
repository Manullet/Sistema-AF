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
    $sql = "DELETE FROM tbl_productor_actividad_externa WHERE id_ficha = '$idFicha' 
    and id_productor = '$idProductor'";
    $result = $conexion->query($sql);

    // Verifica si se seleccionó "Si" para prestamo
    $miembrosRealizanActividad = trim($_POST['actividadesFuera'] == 'Yes' ? 'S' : 'N');
    $miembrosQueTrabajan = $_POST['cuantosActividadesFuera'];
        $trabajadoresTemporales = $_POST['trabajadoresTemporales'];
        $trabajadoresPermanentes =$_POST['trabajadoresPermanentes'];

        $tomadoresDecisiones = isset($_POST['tomador']) ? $_POST['tomador'] : array();
        $id_tomador_decision = array();

    if($miembrosRealizanActividad=='S'){
    
        foreach ($tomadoresDecisiones as $tomador) {
            // Escapar el motivo para evitar inyección de SQL
            $tomador_escapado = mysqli_real_escape_string($conexion, $tomador);
    
            // Consulta para obtener el ID del motivo seleccionado
            $query = "SELECT id_tipo_tomador FROM tbl_toma_decisiones WHERE descripcion = '$tomador_escapado'";
            $result = mysqli_query($conexion, $query);
    
            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $id_tomador_decision[] = $row['id_tipo_tomador'];
                }
            } else {
                echo "Error al obtener ID del motivo: " . mysqli_error($conexion);
            }
    
        }
    
        foreach($id_tomador_decision as $id_tomador){
            // Llamar al procedimiento almacenado
            $sql = "INSERT INTO tbl_productor_actividad_externa(id_ficha, id_productor,miembros_realizan_actividades_fuera_finca,
            id_tomador_decisiones,cuantos_miembros, trabajadores_temporales, trabajadores_permanentes, creado_por)
            VALUES($idFicha, $idProductor, '$miembrosRealizanActividad', $id_tomador, $miembrosQueTrabajan,
            $trabajadoresTemporales,$trabajadoresPermanentes, '$creado_por')";
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
        foreach ($tomadoresDecisiones as $tomador) {
            // Escapar el motivo para evitar inyección de SQL
            $tomador_escapado = mysqli_real_escape_string($conexion, $tomador);
    
            // Consulta para obtener el ID del motivo seleccionado
            $query = "SELECT id_tipo_tomador FROM tbl_toma_decisiones WHERE descripcion = '$tomador_escapado'";
            $result = mysqli_query($conexion, $query);
    
            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $id_tomador_decision[] = $row['id_tipo_tomador'];
                }
            } else {
                echo "Error al obtener ID del motivo: " . mysqli_error($conexion);
            }
    
        }
    
        foreach($id_tomador_decision as $id_tomador){
            // Llamar al procedimiento almacenado
            $sql = "INSERT INTO tbl_productor_actividad_externa(id_ficha, id_productor,miembros_realizan_actividades_fuera_finca,
            id_tomador_decisiones,cuantos_miembros, trabajadores_temporales, trabajadores_permanentes, creado_por)
            VALUES($idFicha, $idProductor, '$miembrosRealizanActividad', $id_tomador, null,
            null,null, '$creado_por')";
            $result = mysqli_query($conexion, $sql);
        }
    }
        
    


    // Cierra la conexión a la base de datos
    mysqli_close($conexion);
}
?>
