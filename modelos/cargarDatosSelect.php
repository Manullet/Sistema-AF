<?php
ob_start();
include "../php/conexion_be.php";
session_start();

$generarSelect=$_GET['select'];

switch($generarSelect){
    case 'Municipios': 
        $id=$_GET['id'];
        $query = "SELECT Id_Municipio, Nombre_Municipio FROM tbl_municipios WHERE Id_Departamento = $id AND Estado = 'A'";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $municipios = array();

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $municipio = array(
                    'id' => $row['Id_Municipio'],
                    'nombre' => $row['Nombre_Municipio']
                );
                $municipios[] = $municipio;
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($municipios);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron municipios para el departamento con ID $id.";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;

    case 'Aldeas': 
        $id=$_GET['id'];
        $query = "SELECT Id_Aldea, Nombre_Aldea FROM tbl_aldeas WHERE Id_Municipio = $id AND Estado = 'A'";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $aldeas = array();

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $aldea = array(
                    'id' => $row['Id_Aldea'],
                    'nombre' => $row['Nombre_Aldea']
                );
                $aldeas[] = $aldea;
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($aldeas);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron municipios para el departamento con ID $id.";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;


    case 'Caserios': 
        $id=$_GET['id'];
        $query = "SELECT Id_Cacerio, Nombre_Cacerio FROM tbl_cacerios WHERE Id_Municipio = $id AND Estado = 'A'";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $caserios = array();

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $caserio = array(
                    'id' => $row['Id_Cacerio'],
                    'nombre' => $row['Nombre_Cacerio']
                );
                $caserios[] = $caserio;
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($caserios);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron municipios para el departamento con ID $id.";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;


    case 'MunicipiosSinFiltro': 
        $query = "SELECT Id_Municipio, Nombre_Municipio FROM tbl_municipios WHERE Estado='A'";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $municipios = array();

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $municipio = array(
                    'id' => $row['Id_Municipio'],
                    'nombre' => $row['Nombre_Municipio']
                );
                $municipios[] = $municipio;
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($municipios);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron municipios para el departamento con ID $id.";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;

    case 'AldeasSinFiltro': 
        $query = "SELECT Id_Aldea, Nombre_Aldea FROM tbl_aldeas WHERE Estado='A'";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $aldeas = array();

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $aldea = array(
                    'id' => $row['Id_Aldea'],
                    'nombre' => $row['Nombre_Aldea']
                );
                $aldeas[] = $aldea;
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($aldeas);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron municipios para el departamento con ID $id.";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;


    case 'CaseriosSinFiltro': 
        $query = "SELECT Id_Cacerio, Nombre_Cacerio FROM tbl_cacerios WHERE Estado='A'";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $caserios = array();

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $caserio = array(
                    'id' => $row['Id_Cacerio'],
                    'nombre' => $row['Nombre_Cacerio']
                );
                $caserios[] = $caserio;
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($caserios);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron municipios para el departamento con ID $id.";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;


    case 'GeneroAnimales': 
        $id=$_GET['id'];
        $query = "SELECT raza_con_genero FROM tbl_tipo_pecuarios WHERE id_tipo_pecuario = $id AND Estado = 'A'";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            // Array para almacenar los datos de los municipios
            $resultado = '';

            // Iterar sobre los resultados y guardar los datos en el array
            while ($row = mysqli_fetch_assoc($result)) {
                $resultado=$row['raza_con_genero'];
            }

            // Convertir el array a formato JSON
            $json_response = json_encode($resultado);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron municipios para el departamento con ID $id.";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;

}




?>