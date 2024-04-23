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


    case 'OrganizacionesNombres': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT o.organizacion 
        from tbl_organizaciones_por_productor op
        INNER JOIN tbl_organizaciones o ON o.id_organizacion = op.id_organizacion
        WHERE op.id_ficha =$id
        AND op.id_productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        $organizaciones = array();

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'organizacion' => $row['organizacion'],
                );

                $organizaciones[] = $datos;
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($organizaciones);

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


    case 'MotivosMigracion': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT mm.Motivo 
        from tbl_migracion_familiar mf
        INNER JOIN tbl_motivos_migracion mm ON mf.id_tipo_motivos = mm.Id_motivo
        WHERE mf.id_ficha = $id
        AND mf.id_productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        $motivos = array();

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'Motivo' => $row['Motivo'],
                );

                $motivos[] = $datos;
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($motivos);

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
                        'Id_Superficie_Acuacultura' => $row['Id_Superficie_Acuacultura'],
                        'Superficie_Acuacultura' => $row['Superficie_Acuacultura'],
                        'Numero_Estanques' => $row['Numero_Estanques'],
                        'Superficie_Agroturismo' => $row['Superficie_Agroturismo'],
                        'Superficie_Otros' => $row['Superficie_Otros'],
                        'Otros_Descripcion' => $row['Otros_Descripcion'],
                        'rubro_agricultura' => $row['rubro_agricultura'],
                        'rubro_ganaderia' => $row['rubro_ganaderia'],
                        'rubro_forestal' => $row['rubro_forestal'],
                        'Id_Superficie_Agroturismo'=> $row['Id_Superficie_Agroturismo'],
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


    case 'Credito': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT ha_solicitado_creditos from tbl_credito_produccion WHERE Id_Ficha = $id AND Id_Productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                        'ha_solicitado_creditos' => $row['ha_solicitado_creditos']
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


    case 'CreditoNombres': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT fc.fuente_credito 
        from tbl_credito_produccion cc
        INNER JOIN tbl_fuentes_credito fc ON fc.id_fuente_credito = cc.id_fuente_credito
        WHERE cc.id_ficha = $id
        AND cc.id_productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        $fuentesCredito = array();

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'fuente_credito' => $row['fuente_credito'],
                );

                $fuentesCredito[] = $datos;
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($fuentesCredito);

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


    case 'motivoNoPrestamo': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT mc.motivo_no_credito 
        from tbl_credito_produccion cc
        INNER JOIN tbl_motivos_no_creditos mc ON mc.id_motivos_no_credito = cc.id_motivos_no_credito
        WHERE cc.id_ficha = $id
        AND cc.id_productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        $motivosNoPrestamos = array();

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'motivo_no_credito' => $row['motivo_no_credito'],
                );

                $motivosNoPrestamos[] = $datos;
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($motivosNoPrestamos);

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




    case 'ActividadesExternas': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT miembros_realizan_actividades_fuera_finca,trabajadores_temporales,
        trabajadores_permanentes, cuantos_miembros from tbl_productor_actividad_externa WHERE id_ficha = $id AND id_productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                        'miembros_realizan_actividades_fuera_finca' => $row['miembros_realizan_actividades_fuera_finca'],
                        'trabajadores_temporales' => $row['trabajadores_temporales'],
                        'trabajadores_permanentes' => $row['trabajadores_permanentes'],
                        'cuantos_miembros' => $row['cuantos_miembros'],
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


    case 'tomadorDecisiones': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT td.descripcion 
        from tbl_productor_actividad_externa pa
        INNER JOIN tbl_toma_decisiones td ON td.id_tipo_tomador = pa.id_tomador_decisiones
        WHERE pa.id_ficha = $id
        AND pa.id_productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        $tomadores = array();

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'descripcion' => $row['descripcion'],
                );

                $tomadores[] = $datos;
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($tomadores);

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


    case 'practicasNombres': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT tp.tipo_practica 
        from tbl_practicas_por_produccion pp
        INNER JOIN tbl_tipo_practicas_productivas tp ON tp.id_tipo_practica = pp.Id_Tipo_Practica
        WHERE pp.id_ficha = $id
        AND pp.id_productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        $practicas = array();

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'tipo_practica' => $row['tipo_practica'],
                );

                $practicas[] = $datos;
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($practicas);

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


    case 'Apoyos': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT recibe_apoyo_prodagrícola, atencion_por_UAG, productos_vendidospor_pralesc 
        from tbl_apoyo_actividad_externa WHERE id_ficha = $id AND id_productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                        'recibe_apoyo_prodagrícola' => $row['recibe_apoyo_prodagrícola'],
                        'atencion_por_UAG' => $row['atencion_por_UAG'],
                        'productos_vendidospor_pralesc' => $row['productos_vendidospor_pralesc']
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


    case 'ApoyosNombre': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT ta.tipo_apoyos 
        from tbl_apoyos_produccion ap
        INNER JOIN tbl_tipos_apoyos ta ON ta.id_tipo_apoyos = ap.id_apoyo_produccion
        WHERE ap.id_ficha = $id
        AND ap.id_productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        $apoyos = array();

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'tipo_apoyos' => $row['tipo_apoyos'],
                );

                $apoyos[] = $datos;
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($apoyos);

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


    case 'tipoOrgNombres': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT tp.tipo_organizacion 
        from tbl_apoyo_tipo_organizacion ato
        INNER JOIN tbl_tipo_organizacion tp ON tp.id_tipo_organizacion = ato.id_tipo_organizacion
        WHERE ato.id_ficha = $id
        AND ato.id_productor = $idProductor
        ";
        $result = mysqli_query($conexion, $query);

        $apoyos = array();

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'tipo_organizacion' => $row['tipo_organizacion'],
                );

                $apoyos[] = $datos;
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($apoyos);

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


    case 'TablaComposicion': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT genero, edad, cantidad from tbl_composicion WHERE id_ficha = $id
        AND id_productor = $idProductor
        ";
        $result = mysqli_query($conexion, $query);

        $apoyos = array();

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'genero' => $row['genero'],
                    'edad' => $row['edad'],
                    'cantidad' => $row['cantidad'],
                );

                $apoyos[] = $datos;
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($apoyos);

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


    case 'TablaProdAgricolaAnterior': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $sql = "SELECT id_ubicacion from tbl_ubicacion_productor where id_productor=$idProductor and id_ficha = $id limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();
    
        $idUbicacion = $row['id_ubicacion'];

        $query = "SELECT tc.tipo_cultivo, pa.Superficie_Primera_Postrera, m.medida as MedidaSuperficie,
        pa.Produccion_Obtenida, n.medida as MedidaProduccion, pa.Cantidad_Vendida, o.medida as medidaCantidad,
        pa.Precio_Venta, pa.A_Quien_Se_Vendio
        FROM tbl_produccion_agricola_anterior pa
        INNER JOIN tbl_tipo_cultivo tc ON tc.id_tipo_cultivo = pa.Id_Tipo_Cultivo
        INNER JOIN tbl_medidas_tierra m ON m.id_medida = pa.Id_Medida_Primera_Postrera
        INNER JOIN tbl_medidas_tierra n ON n.id_medida = pa.Id_Medida_Produccion_Obtenida
        INNER JOIN tbl_medidas_tierra o ON o.id_medida = pa.Id_Medida_Vendida
        WHERE pa.Id_Ficha = $id AND pa.Id_Ubicacion = $idUbicacion AND pa.Id_Productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        $apoyos = array();

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'tipo_cultivo' => $row['tipo_cultivo'],
                    'Superficie_Primera_Postrera' => $row['Superficie_Primera_Postrera'],
                    'MedidaSuperficie' => $row['MedidaSuperficie'],
                    'Produccion_Obtenida' => $row['Produccion_Obtenida'],
                    'MedidaProduccion' => $row['MedidaProduccion'],
                    'Cantidad_Vendida' => $row['Cantidad_Vendida'],
                    'medidaCantidad' => $row['medidaCantidad'],
                    'Precio_Venta' => $row['Precio_Venta'],
                    'A_Quien_Se_Vendio' => $row['A_Quien_Se_Vendio'],
                );

                $apoyos[] = $datos;
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($apoyos);

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


    case 'TablaProdComercializacion': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $sql = "SELECT id_ubicacion from tbl_ubicacion_productor where id_productor=$idProductor and id_ficha = $id limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();
    
        $idUbicacion = $row['id_ubicacion'];

        $query = "SELECT tp.tipo_produccion, m.periodo, n.medida, pc.Cantidad_Vendida, pc.Precio_Venta,
        pc.A_Quien_Se_Vendio
        FROM tbl_produccion_comercializacion pc
        INNER JOIN tbl_tipo_produccion tp ON tp.id_tipo_produccion = pc.Id_Tipo_Produccion
        INNER JOIN tbl_periodicidad m ON m.id_periodo = pc.Id_Medida_Produccion
        INNER JOIN tbl_medidas_tierra n ON n.id_medida = pc.Id_Medida_Venta
        WHERE pc.Id_Ficha = $id AND pc.Id_Ubicacion = $idUbicacion AND pc.Id_Productor = $idProductor";
        $result = mysqli_query($conexion, $query);

        $apoyos = array();

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'tipo_produccion' => $row['tipo_produccion'],
                    'periodo' => $row['periodo'],
                    'medida' => $row['medida'],
                    'Cantidad_Vendida' => $row['Cantidad_Vendida'],
                    'Precio_Venta' => $row['Precio_Venta'],
                    'A_Quien_Se_Vendio' => $row['A_Quien_Se_Vendio']
                );

                $apoyos[] = $datos;
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($apoyos);

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


    case 'TablaIngresoFamiliar': 
        $id=$_GET['id'];

        $sql = "SELECT id_productor from tbl_productor where id_ficha='$id' order by id_productor asc limit 1";
        $result = $conexion->query($sql);
        $row = $result->fetch_assoc();

        $idProductor = $row['id_productor'];

        $query = "SELECT tn.tipo_negocio, i.Total_Ingreso
        FROM tbl_ingreso_familiar i
        INNER JOIN tbl_tipo_negocios tn ON tn.id_tipo_negocio = i.Id_Tipo_Negocio
        WHERE i.Id_Ficha = $id AND i.Id_Productor =  $idProductor";
        $result = mysqli_query($conexion, $query);

        $apoyos = array();

        // Verificar si hay resultados
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                // Array para almacenar los datos de los municipios
                    $datos = array(
                    'tipo_negocio' => $row['tipo_negocio'],
                    'Total_Ingreso' => $row['Total_Ingreso']
                );

                $apoyos[] = $datos;
            }
            
            // Convertir el array a formato JSON
            $json_response = json_encode($apoyos);

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