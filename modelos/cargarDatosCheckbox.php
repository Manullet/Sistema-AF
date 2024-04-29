<?php
ob_start();
include "../php/conexion_be.php";
session_start();

$generarCheckbox=$_GET['checkbox'];

switch($generarCheckbox){
    case 'Migracion': 
        $query = "SELECT Motivo FROM tbl_motivos_migracion WHERE Estado='A'";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $motivos = array();

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $motivo = array(
                    'motivo' => $row['Motivo']
                );
                $motivos[] = $motivo;
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($motivos);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron motivos";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;


    case 'MotivoNoPrestamo': 
        $query = "SELECT motivo_no_credito FROM tbl_motivos_no_creditos WHERE Estado='A'";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $motivos = array();

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $motivo = array(
                    'nombre' => $row['motivo_no_credito']
                );
                $motivos[] = $motivo;
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($motivos);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron motivos";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;


    case 'OpcionesPrestamo': 
        $query = "SELECT fuente_credito FROM tbl_fuentes_credito WHERE Estado='A'";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $fuentes = array();

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $fuente = array(
                    'nombre' => $row['fuente_credito']
                );
                $fuentes[] = $fuente;
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($fuentes);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron motivos";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;


    case 'Practicas': 
        $query = "SELECT tipo_practica FROM tbl_tipo_practicas_productivas WHERE Estado='A'";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $practicas = array();

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $practica = array(
                    'nombre' => $row['tipo_practica']
                );
                $practicas[] = $practica;
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($practicas);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron motivos";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;


    case 'Apoyo': 
        $query = "SELECT tipo_apoyos FROM tbl_tipos_apoyos WHERE Estado='ACTIVO'";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $apoyos = array();

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $apoyo = array(
                    'nombre' => $row['tipo_apoyos']
                );
                $apoyos[] = $apoyo;
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($apoyos);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron motivos";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;


    case 'Organizacion': 
        $query = "SELECT id_organizacion, organizacion FROM tbl_organizaciones WHERE Estado='A'";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $organizaciones = array();

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $organizacion = array(
                    'nombre' => $row['organizacion'],
                    'id' => $row['id_organizacion']
                );
                $organizaciones[] = $organizacion;
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($organizaciones);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron motivos";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;


    case 'OrganizacionDetalle': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT Id_Organizacion_Productor from tbl_organizaciones_por_productor WHERE id_ficha = $id
        AND id_productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $organizaciones = array();

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $organizacion = array(
                    'Id_Organizacion' => $row['Id_Organizacion_Productor'],
                );
                $organizaciones[] = $organizacion;
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($organizaciones);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron motivos";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;


    case 'TomadorDecisiones': 
        $query = "SELECT descripcion FROM tbl_toma_decisiones WHERE Estado='A'";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $tomadores = array();

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $tomador = array(
                    'nombre' => $row['descripcion']
                );
                $tomadores[] = $tomador;
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($tomadores);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron motivos";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;


    case 'TipoOrganizacion': 
        $query = "SELECT tipo_organizacion FROM tbl_tipo_organizacion WHERE Estado='A'";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $tomadores = array();

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $tomador = array(
                    'nombre' => $row['tipo_organizacion']
                );
                $tomadores[] = $tomador;
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($tomadores);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron motivos";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;
   
}

?>