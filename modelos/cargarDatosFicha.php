<?php
ob_start();
include "../php/conexion_be.php";
session_start();

$contenedor=$_GET['contenedor'];

switch($contenedor){
    case 'Ficha': 
        $id=$_GET['id'];
        $query = "SELECT * from fichas WHERE id_ficha = $id";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'fecha_solicitud' => $row['fecha_solicitud'],
                    'anio_solicitud' => $row['anio_solicitud'],
                    'descripcion' => $row['descripcion'],
                    'fecha_entrevista' => $row['fecha_entrevista'],
                    'nombre_encuentrador' => $row['nombre_encuentrador'],
                    'nombre_encuestador' => $row['nombre_encuestador'],
                    'nombre_supervisor' => $row['nombre_supervisor']
                );
            }
            

            // Convertir el array a formato JSON
            $json_response = json_encode($datos);

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

    case 'Productor': 
        $id=$_GET['id'];
        $query = "SELECT * from tbl_productor WHERE id_ficha = $id";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'primer_nombre' => $row['primer_nombre'],
                    'segundo_nombre' => $row['segundo_nombre'],
                    'primer_apellido' => $row['primer_apellido'],
                    'segundo_apellido' => $row['segundo_apellido'],
                    'identificacion' => $row['identificacion'],
                    'fecha_nacimiento' => $row['fecha_nacimiento'],
                    'genero' => $row['genero'],
                    'estado_civil' => $row['estado_civil'],
                    'nivel_escolaridad' => $row['nivel_escolaridad'],
                    'ultimo_grado_escolar_aprobado' => $row['ultimo_grado_escolar_aprobado'],
                    'telefono_1' => $row['telefono_1'],
                    'telefono_2' => $row['telefono_2'],
                    'telefono_3' => $row['telefono_3'],
                    'email_1' => $row['email_1'],
                    'email_2' => $row['email_2'],
                    'email_3' => $row['email_3']
                );
            }
            

            // Convertir el array a formato JSON
            $json_response = json_encode($datos);

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

    case 'Ubicacion': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT * from tbl_ubicacion_productor WHERE id_ficha = $id
        AND id_productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'id_departamento' => $row['Id_Departamento'],
                    'id_municipio' => $row['Id_Municipio'],
                    'id_aldea' => $row['Id_Aldea'],
                    'id_cacerio' => $row['Id_Cacerio'],
                    'ubicacion_geografica' => $row['ubicacion_geografica'],
                    'distancia_parcela_vivienda' => $row['distancia_parcela_vivienda'],
                    'latitud_parcela' => $row['latitud_parcela'],
                    'longitud_parcela' => $row['longitud_parcela'],
                    'msnm' => $row['msnm'],
                    'direccion_1' => $row['direccion_1'],
                    'direccion_2' => $row['direccion_2'],
                    'direccion_3' => $row['direccion_3'],
                    'vive_en_finca' => $row['vive_en_finca'],
                    'nombre_finca' => $row['nombre_finca'],
                );
            }
            

            // Convertir el array a formato JSON
            $json_response = json_encode($datos);

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


    case 'Organizacion': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT pertenece_a_organizacion from tbl_base_organizacion WHERE id_ficha = $id
        AND id_productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'pertenece_a_organizacion' => $row['pertenece_a_organizacion'],
                );
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($datos);

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


    case 'Etnia': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT id_etnia from tbl_etnias_por_productor WHERE id_ficha = $id
        AND id_productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'id_etnia' => $row['id_etnia']
                );
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($datos);

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


    case 'Relevo': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT tendra_relevo, cuantos_relevos from tbl_relevo_organizacion WHERE id_ficha = $id
        AND id_productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'relevo' => $row['tendra_relevo'],
                    'cantidad' => $row['cuantos_relevos'],
                );
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($datos);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron registros de relevos";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;

    case 'Migracion': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT tiene_migrantes, migracion_dentro_pais, remesas  from tbl_migracion_familiar 
        WHERE id_ficha = $id AND id_productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'tiene_migrantes' => $row['tiene_migrantes'],
                    'migracion_dentro_pais' => $row['migracion_dentro_pais'],
                    'remesas' => $row['remesas'],
                );
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($datos);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron registros de relevos";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;


    case 'UnidadProductiva': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $sql = "SELECT id_ubicacion from tbl_ubicacion_productor where id_productor=$idProductor and id_ficha = $id limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();
    
        $idUbicacion = $row['id_ubicacion'];

        $query = "SELECT * from tbl_unidad_productora WHERE Id_Ficha = $id AND Id_Productor = $idProductor 
        AND Id_Ubicacion = $idUbicacion";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                        'Tipo_De_Manejo' => $row['Tipo_De_Manejo'],
                        'Superficie_Produccion' => $row['Superficie_Produccion'],
                        'Id_Medida_Produccion' => $row['Id_Medida_Produccion'],
                        'Superficie_Agricultura' => $row['Superficie_Agricultura'],
                        'Id_Medida_Agricultura' => $row['Id_Medida_Agricultura'],
                        'Superficie_Ganaderia' => $row['Superficie_Ganaderia'],
                        'Id_Medida_Ganaderia' => $row['Id_Medida_Ganaderia'],
                        'Superficie_Apicultura' => $row['Superficie_Apicultura'],
                        'Id_Medida_Apicultura' => $row['Id_Medida_Apicultura'],
                        'Superficie_Forestal' => $row['Superficie_Forestal'],
                        'Id_Medida_Forestal' => $row['Id_Medida_Forestal'],
                        'Superficie_Acuacultura' => $row['Superficie_Acuacultura'],
                        'Numero_Estanques' => $row['Numero_Estanques'],
                        'Superficie_Agroturismo' => $row['Superficie_Agroturismo'],
                        'Superficie_Otros' => $row['Superficie_Otros'],
                        'Otros_Descripcion' => $row['Otros_Descripcion']
                    );
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($datos);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron registros de relevos";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;


    case 'Riego': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $sql = "SELECT id_ubicacion from tbl_ubicacion_productor where id_productor=$idProductor and id_ficha = $id limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();
    
        $idUbicacion = $row['id_ubicacion'];

        $query = "SELECT * from tbl_manejo_riego WHERE Id_Ficha = $id AND Id_Productor = $idProductor 
        AND Id_Ubicacion = $idUbicacion";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                        'Tiene_Riego' => $row['Tiene_Riego'],
                        'Superficie_Riego' => $row['Superficie_Riego'],
                        'Id_Medida_Superficie_Riego' => $row['Id_Medida_Superficie_Riego'],
                        'Id_Tipo_Riego' => $row['Id_Tipo_Riego'],
                        'Fuente_Agua' => $row['Fuente_Agua'],
                        'Disponibilidad_Agua_Meses' => $row['Disponibilidad_Agua_Meses']
                    );
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($datos);

            // Retornar el JSON como respuesta
            echo $json_response;
        } else {
            // No se encontraron resultados
            echo "No se encontraron registros de relevos";
        }

        // Liberar el resultado y cerrar la conexión a la base de datos
        mysqli_free_result($result);
        mysqli_close($conexion);
    break;
}

?>