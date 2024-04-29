<?php
session_start();
$_SESSION['url'] = 'vistas/Mantenimiento_Unidad_Productiva.php';
$_SESSION['content-wrapper'] = 'content-wrapper';
?>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/estilos.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- DATATABLES -->
 <!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"> -->
    <!-- BOOTSTRAP -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">



<div class="containertable">
    <div class="d-flex justify-content-between align-items-end mb-4">
        <div>
            <h1 class="poppins-font mb-2">UNIDAD PRODUCTIVA</h1>
            <br>
            <a href="#" data-bs-toggle="modal" data-bs-target="#modalForm" class="btn btn-info">
                <i class="bi bi-plus-square icono-grande"></i> Crear
            </a>
        </div>


    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.8/xlsx.full.min.js"></script>
    <!--  seleccion de registros -->

    <!--  funcion para mostrar registros -->
    <script>
        // Obtiene referencias a los elementos HTML
        const selectCantidadRegistros = document.getElementById("cantidadRegistros");

        selectCantidadRegistros.addEventListener("change", function() {
            const cantidadSeleccionada = parseInt(selectCantidadRegistros.value);
            console.log(`Se seleccionaron ${cantidadSeleccionada} registros.`);
        });
    </script>

    <div class="table-responsive">

        <!--El diseño de la table cuando ya esté todo unido 
    <table id="tablax" class="table table-striped table-bordered" style="width:100%"> -->
    <table id="tablax" class="table table-hover">
            <thead class="table-dark text-center" style="background-color: #343A40;">
                <tr>
                    <th scope="col">Nº Ficha</th>
                    <th scope="col">Tipo Manejo</th>

                    <th scope="col">Superficie Agricultura</th>
                    <th scope="col">Superficie Ganaderia</th>
                    <th scope="col">Superficie Apicultura</th>
                    <th scope="col">Superficie Forestal</th>
                    <th scope="col">Superficie Acuacultura</th>
                    <th scope="col">Nº Estanques</th>
                    <th scope="col">Superficie Agroturismo</th>
                    <th scope="col">Otra Descripcion</th>

                    <th scope="col">Estado</th>
                    <th scope="col">Acciones</th> <!-- Added text-center class here -->
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT
                UP.*,
                P.primer_nombre,
                F.id_ficha,
                MT.id_medida
            FROM
                tbl_unidad_productora UP
                INNER JOIN tbl_productor P ON UP.Id_Productor = P.id_productor
                INNER JOIN fichas F ON UP.Id_Ficha = F.id_ficha
                LEFT JOIN tbl_medidas_tierra MT ON UP.Id_Medida_Produccion = MT.id_medida;
            ");
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                        <td><?= $datos->id_ficha ?></td>
                        <td><?= $datos->Tipo_De_Manejo ?></td>

                        <td><?= $datos->Superficie_Agricultura ?></td>
                        <td><?= $datos->Superficie_Ganaderia ?></td>
                        <td><?= $datos->Superficie_Apicultura ?></td>
                        <td><?= $datos->Superficie_Forestal ?></td>
                        <td><?= $datos->Superficie_Acuacultura ?></td>
                        <td><?= $datos->Numero_Estanques ?></td>
                        <td><?= $datos->Superficie_Agroturismo ?></td>
                        <td><?= $datos->Otros_Descripcion ?></td>


                        <td><?php
                            if ($datos->estado == "A") {
                                echo '<span class="badge bg-success">Activo</span>';
                            } else {
                                echo '<span class="badge bg-danger">Inactivo</span>';
                            }
                            ?></td>
                        <td>
                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar('<?= $datos->Id_Unidad_Productiva?>',  '<?= $datos->Id_Ubicacion ?>','<?= $datos->Id_Ficha ?>', '<?= $datos->Id_Productor ?>','<?= $datos->Tipo_De_Manejo ?>', '<?= $datos->Superficie_Produccion ?>','<?= $datos->Id_Medida_Produccion ?>', '<?= $datos->Superficie_Agricultura ?>','<?= $datos->Id_Medida_Agricultura ?>', '<?= $datos->Superficie_Ganaderia ?>','<?= $datos->Id_Medida_Ganaderia ?>', '<?= $datos->Superficie_Apicultura ?>','<?= $datos->Id_Medida_Apicultura ?>', '<?= $datos->Superficie_Forestal ?>', '<?= $datos->Id_Medida_Forestal ?>', '<?= $datos->Superficie_Acuacultura ?>','<?= $datos->Numero_Estanques ?>',  '<?= $datos->Superficie_Agroturismo ?>','<?= $datos->Superficie_Otros ?>', '<?= $datos->Otros_Descripcion ?>', '<?= $datos->Descripcion ?>', '<?= $datos->Modificado_Por ?>', '<?= $datos->Estado ?>')">
                                <i class="bi bi-pencil-square"></i>
                                
                            </button>
<p></p>
                            <form id="deleteForm" method="POST" action="modelos/eliminar_unidad_productiva.php" style="display: inline;">
                                <input type="hidden" name="Id_Unidad_Productiva" value="<?= $datos->Id_Unidad_Productiva ?>">
                                <button type="submit" class="btn btn-eliminar">
                                    <i class="bi bi-trash"></i>
                                    
                                </button>
                            </form>
                        </td>
                    </tr>
                <?php }
                ?>
            </tbody>
        </table>
    </div>


</div>

<!-- Modal para editar Unidades Productras -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">EDITAR UBICACION</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="#">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Id_Unidad_Productiva">Nº Id_Unidad_Productiva</label>
                                <input type="text" class="form-control" id="Id_Unidad_Productiva" name="Id_Unidad_Productiva" readonly>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="id_ficha">Ficha:</label>
                                <select class="form-control" id="id_ficha" name="id_ficha" required>
                                    <?php
                                    // Conexión a la base de datos
                                    include '../php/conexion_be.php';

                                    // Consulta SQL para obtener los valores disponibles de ID y Nombre de Aldea
                                    $sql = "SELECT id_ficha FROM fichas";

                                    // Ejecutar la consulta
                                    $result = mysqli_query($conexion, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            // Genera opciones con el nombre del aldea como etiqueta y el ID como valor
                                            echo '<option value="' . $row["id_ficha"] . '">' . $row["id_ficha"] . '</option>';
                                        }
                                    } else {
                                        echo '<option value="">No hay aldeas disponibles</option>';
                                    }

                                    // Cierra la conexión a la base de datos
                                    mysqli_close($conexion);
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="id_productor">Nombre Agricultor:</label>
                                <select class="form-control" id="id_productor" name="id_productor" required>
                                    <?php
                                    // Conexión a la base de datos
                                    include '../php/conexion_be.php';
                                    // Consulta SQL para obtener los valores disponibles de ID y Nombre de Aldea
                                    $sql = "SELECT id_productor , primer_nombre FROM tbl_productor";
                                    // Ejecutar la consulta
                                    $result = mysqli_query($conexion, $sql);
                                    if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            // Genera opciones con el nombre del aldea como etiqueta y el ID como valor
                                            echo '<option value="' . $row["id_productor"] . '">' . $row["primer_nombre"] . '</option>';
                                        }
                                    } else {
                                        echo '<option value="">No hay aldeas disponibles</option>';
                                    }
                                    // Cierra la conexión a la base de datos
                                    mysqli_close($conexion);
                                    ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="id_departamento">Departamento </label>
                        <select class="form-control" id="id_departamento" name="id_departamento" required>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';
                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Departamento
                            $sql = "SELECT Id_Departamento, Nombre_Departamento FROM tbl_departamentos";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del departamento como etiqueta y el ID como valor
                                    echo '<option value="' . $row["Id_Departamento"] . '">' . $row["Nombre_Departamento"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay departamentos disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="id_municipio">Municipio:</label>
                        <select class="form-control" id="id_municipio" name="id_municipio" required>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                            $sql = "SELECT Id_Municipio, Nombre_Municipio FROM Tbl_Municipios";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                    echo '<option value="' . $row["Id_Municipio"] . '">' . $row["Nombre_Municipio"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay municipios disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="id_aldea">Aldea:</label>
                        <select class="form-control" id="id_aldea" name="id_aldea" required>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                            $sql = "SELECT Id_Aldea, Nombre_Aldea FROM Tbl_Aldeas";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                    echo '<option value="' . $row["Id_Aldea"] . '">' . $row["Nombre_Aldea"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay municipios disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="id_cacerio">Cacerio:</label>
                        <select class="form-control" id="id_cacerio" name="id_cacerio" required>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Aldea
                            $sql = "SELECT Id_Cacerio, Nombre_Cacerio FROM tbl_cacerios";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del aldea como etiqueta y el ID como valor
                                    echo '<option value="' . $row["Id_Cacerio"] . '">' . $row["Nombre_Cacerio"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay aldeas disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="ubicacion_geografica">Ubicacion Geografica</label>
                        <input type="text" class="form-control" id="ubicacion_geografica" name="ubicacion_geografica" required>
                    </div>
                    <div class="form-group">
                        <label for="distancia_parcela_vivienda">Distancia Parcela-Vivienda</label>
                        <input type="text" class="form-control" id="distancia_parcela_vivienda" name="distancia_parcela_vivienda" required>
                    </div>
                    <div class="form-group">
                        <label for="latitud_parcela">Latitud Parcela</label>
                        <input type="text" class="form-control" id="latitud_parcela" name="latitud_parcela" required>
                    </div>
                    <div class="form-group">
                        <label for="longitud_parcela">Longitud Parcela</label>
                        <input type="text" class="form-control" id="longitud_parcela" name="longitud_parcela" required>
                    </div>
                    <div class="form-group">
                        <label for="msnm">Msnm</label>
                        <input type="text" class="form-control" id="msnm" name="msnm" required>
                    </div>
                    <div class="form-group">
                        <label for="direccion_1">Dirección </label>
                        <input type="text" class="form-control" id="direccion_1" name="direccion_1" required>
                    </div>
                    <div class="form-group">
                        <label for="direccion_2">Dirección 2</label>
                        <input type="text" class="form-control" id="direccion_2" name="direccion_2" required>
                    </div>
                    <div class="form-group">
                        <label for="direccion_3">Dirección 3</label>
                        <input type="text" class="form-control" id="direccion_3" name="direccion_3" required>
                    </div>

                    <label class="form-label">¿Vive en finca?</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="vive_en_finca" id="vive_en_finca_S" value="S">
                        <label class="form-check-label" for="vive_en_finca_S">Sí</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="vive_en_finca" id="vive_en_finca_N" value="N">
                        <label class="form-check-label" for="vive_en_finca_N">No</label>
                    </div>

                    <div class="form-group">
                        <label for="nombre_finca">Nombre de la Finca</label>
                        <input type="text" class="form-control" id="nombre_finca" name="nombre_finca" required>
                    </div>
                    <div class="form-group">
                        <label for="descripcion">Descripcion </label>
                        <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="estado">Estado</label>
                            <select class="form-control" id="estado" name="estado" required>
                                <option value="" disabled selected>Selecciona un estado</option>
                                <option value="A">Activo</option>
                                <option value="I">Inactivo</option>
                            </select>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-actualizar">Actualizar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"></i>Cerrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Modal para crear aldeas -->
<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">Unidad Productiva</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos/agregar_unidad_productiva.php" method="POST">
                    <div class="row mb-3">
                        <div class="col">
                            <label for="Id_Ubicacion">Ubicacion:</label>
                            <select class="form-control" id="Id_Ubicacion" name="Id_Ubicacion" required>
                                <?php
                                // Conexión a la base de datos
                                include '../php/conexion_be.php';

                                // Consulta SQL para obtener los valores disponibles de ID y Nombre de Aldea
                                $sql = "SELECT id_ubicacion, direccion_1 FROM tbl_ubicacion_productor";

                                // Ejecutar la consulta
                                $result = mysqli_query($conexion, $sql);

                                if (mysqli_num_rows($result) > 0) {
                                    while ($row = mysqli_fetch_assoc($result)) {
                                        // Genera opciones con el nombre del aldea como etiqueta y el ID como valor
                                        echo '<option value="' . $row["id_ubicacion"] . '">' . $row["direccion_1"] . '</option>';
                                    }
                                } else {
                                    echo '<option value="">No hay aldeas disponibles</option>';
                                }

                                // Cierra la conexión a la base de datos
                                mysqli_close($conexion);
                                ?>
                            </select>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Ficha">Ficha:</label>
                                <select class="form-control" id="Id_Ficha" name="Id_Ficha" required>
                                    <?php
                                    // Conexión a la base de datos
                                    include '../php/conexion_be.php';

                                    // Consulta SQL para obtener los valores disponibles de ID y Nombre de Aldea
                                    $sql = "SELECT id_ficha FROM fichas";

                                    // Ejecutar la consulta
                                    $result = mysqli_query($conexion, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            // Genera opciones con el nombre del aldea como etiqueta y el ID como valor
                                            echo '<option value="' . $row["id_ficha"] . '">' . $row["id_ficha"] . '</option>';
                                        }
                                    } else {
                                        echo '<option value="">No hay aldeas disponibles</option>';
                                    }

                                    // Cierra la conexión a la base de datos
                                    mysqli_close($conexion);
                                    ?>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Productor">Nombre Agricultor:</label>
                                <select class="form-control" id="Id_Productor" name="Id_Productor" required>
                                    <?php
                                    // Conexión a la base de datos
                                    include '../php/conexion_be.php';
                                    // Consulta SQL para obtener los valores disponibles de ID y Nombre de Aldea
                                    $sql = "SELECT id_productor , primer_nombre FROM tbl_productor";
                                    // Ejecutar la consulta
                                    $result = mysqli_query($conexion, $sql);
                                    if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            // Genera opciones con el nombre del aldea como etiqueta y el ID como valor
                                            echo '<option value="' . $row["id_productor"] . '">' . $row["primer_nombre"] . '</option>';
                                        }
                                    } else {
                                        echo '<option value="">No hay aldeas disponibles</option>';
                                    }
                                    // Cierra la conexión a la base de datos
                                    mysqli_close($conexion);
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="col">
                            <label for="Tipo_De_Manejo" class="form-label">Tipo de Manejo</label>
                            <select class="form-control" id="Tipo_De_Manejo" name="Tipo_De_Manejo">
                                <option value="Propia">Propia</option>
                                <option value="Alquilada">Alquilada</option>
                                <option value="Prestada">Prestada</option>
                                <option value="Ejidal">Ejidal</option>
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Produccion" class="form-label">Superficie de Producción</label>
                            <input type="text" class="form-control" id="Superficie_Produccion" name="Superficie_Produccion">
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Medida_Produccion">Medida:</label>
                                <select class="form-control" id="Id_Medida_Produccion" name="Id_Medida_Produccion" required>
                                    <?php
                                    // Conexión a la base de datos
                                    include '../php/conexion_be.php';

                                    // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                                    $sql = "SELECT id_medida, medida FROM tbl_medidas_tierra";

                                    // Ejecutar la consulta
                                    $result = mysqli_query($conexion, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                            echo '<option value="' . $row["id_medida"] . '">' . $row["medida"] . '</option>';
                                        }
                                    } else {
                                        echo '<option value="">No hay municipios disponibles</option>';
                                    }

                                    // Cierra la conexión a la base de datos
                                    mysqli_close($conexion);
                                    ?>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Agricultura" class="form-label">Superficie de Agricultura</label>
                            <input type="text" class="form-control" id="Superficie_Agricultura" name="Superficie_Agricultura">
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Medida_Agricultura">Medida:</label>
                                <select class="form-control" id="Id_Medida_Agricultura" name="Id_Medida_Agricultura" required>
                                    <?php
                                    // Conexión a la base de datos
                                    include '../php/conexion_be.php';

                                    // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                                    $sql = "SELECT id_medida, medida FROM tbl_medidas_tierra";

                                    // Ejecutar la consulta
                                    $result = mysqli_query($conexion, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                            echo '<option value="' . $row["id_medida"] . '">' . $row["medida"] . '</option>';
                                        }
                                    } else {
                                        echo '<option value="">No hay municipios disponibles</option>';
                                    }

                                    // Cierra la conexión a la base de datos
                                    mysqli_close($conexion);
                                    ?>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Ganaderia" class="form-label">Superficie de Ganadería</label>
                            <input type="text" class="form-control" id="Superficie_Ganaderia" name="Superficie_Ganaderia">
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Medida_Ganaderia">Medida:</label>
                                <select class="form-control" id="Id_Medida_Ganaderia" name="Id_Medida_Ganaderia" required>
                                    <?php
                                    // Conexión a la base de datos
                                    include '../php/conexion_be.php';

                                    // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                                    $sql = "SELECT id_medida, medida FROM tbl_medidas_tierra";

                                    // Ejecutar la consulta
                                    $result = mysqli_query($conexion, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                            echo '<option value="' . $row["id_medida"] . '">' . $row["medida"] . '</option>';
                                        }
                                    } else {
                                        echo '<option value="">No hay municipios disponibles</option>';
                                    }

                                    // Cierra la conexión a la base de datos
                                    mysqli_close($conexion);
                                    ?>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Apicultura" class="form-label">Superficie de Apicultura</label>
                            <input type="text" class="form-control" id="Superficie_Apicultura" name="Superficie_Apicultura">
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Medida_Apicultura">Medida:</label>
                                <select class="form-control" id="Id_Medida_Apicultura" name="Id_Medida_Apicultura" required>
                                    <?php
                                    // Conexión a la base de datos
                                    include '../php/conexion_be.php';

                                    // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                                    $sql = "SELECT id_medida, medida FROM tbl_medidas_tierra";

                                    // Ejecutar la consulta
                                    $result = mysqli_query($conexion, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                            echo '<option value="' . $row["id_medida"] . '">' . $row["medida"] . '</option>';
                                        }
                                    } else {
                                        echo '<option value="">No hay municipios disponibles</option>';
                                    }

                                    // Cierra la conexión a la base de datos
                                    mysqli_close($conexion);
                                    ?>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Forestal" class="form-label">Superficie Forestal</label>
                            <input type="text" class="form-control" id="Superficie_Forestal" name="Superficie_Forestal">
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Medida_Forestal">Medida:</label>
                                <select class="form-control" id="Id_Medida_Forestal" name="Id_Medida_Forestal" required>
                                    <?php
                                    // Conexión a la base de datos
                                    include '../php/conexion_be.php';

                                    // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                                    $sql = "SELECT id_medida, medida FROM tbl_medidas_tierra";

                                    // Ejecutar la consulta
                                    $result = mysqli_query($conexion, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                            echo '<option value="' . $row["id_medida"] . '">' . $row["medida"] . '</option>';
                                        }
                                    } else {
                                        echo '<option value="">No hay municipios disponibles</option>';
                                    }

                                    // Cierra la conexión a la base de datos
                                    mysqli_close($conexion);
                                    ?>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Acuacultura" class="form-label">Superficie Acuacultura</label>
                            <input type="text" class="form-control" id="Superficie_Acuacultura" name="Superficie_Acuacultura">
                        </div>
                        <div class="col">
                            <label for="Numero_Estanques" class="form-label">Número de Estanques</label>
                            <input type="text" class="form-control" id="Numero_Estanques" name="Numero_Estanques">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Agroturismo" class="form-label">Superficie de Agroturismo</label>
                            <input type="text" class="form-control" id="Superficie_Agroturismo" name="Superficie_Agroturismo">
                        </div>
                        <div class="col">
                            <label for="Superficie_Otros" class="form-label">Superficie de Otros</label>
                            <input type="text" class="form-control" id="Superficie_Otros" name="Superficie_Otros">
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="Otros_Descripcion">Descripción de Otros</label>
                                <textarea class="form-control" id="Otros_Descripcion" name="Otros_Descripcion" rows="3"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="Descripcion">Descripción</label>
                                <textarea class="form-control" id="Descripcion" name="Descripcion" rows="3"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-actualizar">Crear</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"></i>Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript para manejar la edición de aldeas -->
<script>
    // Función para abrir el modal de edición
    function abrirModalEditar(Id_Unidad_Productiva, Id_Ubicacion, Id_Ficha, Id_Productor, Tipo_De_Manejo,
        Superficie_Produccion, Id_Medida_Produccion, Superficie_Agricultura,
        Id_Medida_Agricultura, Superficie_Ganaderia, Id_Medida_Ganaderia,
        Superficie_Apicultura, Id_Medida_Apicultura, Superficie_Forestal,
        Id_Medida_Forestal, Superficie_Acuacultura, Numero_Estanques,
        Superficie_Agroturismo, Superficie_Otros, Otros_Descripcion,
        Descripcion, Modificado_Por, Estado
    ) {
        document.getElementById("Id_Unidad_Productiva").value = Id_Unidad_Productiva;
        document.getElementById("Id_Ubicacion").value = Id_Ubicacion;
        document.getElementById("Id_Ficha").value = Id_Ficha;
        document.getElementById("Id_Productor").value = Id_Productor;
        document.getElementById("Tipo_De_Manejo").value = Tipo_De_Manejo;
        document.getElementById("Superficie_Produccion").value = Superficie_Produccion;
        document.getElementById("Id_Medida_Produccion").value = Id_Medida_Produccion;
        document.getElementById("Superficie_Agricultura").value = Superficie_Agricultura;
        document.getElementById("Id_Medida_Agricultura").value = Id_Medida_Agricultura;
        document.getElementById("Superficie_Ganaderia").value = Superficie_Ganaderia;
        document.getElementById("Id_Medida_Ganaderia").value = Id_Medida_Ganaderia;
        document.getElementById("Superficie_Apicultura").value = Superficie_Apicultura;
        document.getElementById("Id_Medida_Apicultura").value = Id_Medida_Apicultura;
        document.getElementById("Superficie_Forestal").value = Superficie_Forestal;
        document.getElementById("Id_Medida_Forestal").value = Id_Medida_Forestal;
        document.getElementById("Superficie_Acuacultura").value = Superficie_Acuacultura;
        document.getElementById("Numero_Estanques").value = Numero_Estanques;
        document.getElementById("Superficie_Agroturismo").value = Superficie_Agroturismo;
        document.getElementById("Superficie_Otros").value = Superficie_Otros;
        document.getElementById("Otros_Descripcion").value = Otros_Descripcion;
        document.getElementById("Descripcion").value = Descripcion;
        document.getElementById("Modificado_Por").value = Modificado_Por;
        document.getElementById("Estado").value = Estado;

        $('#modalEditar').modal('show'); // Mostrar el modal de edición
    }
</script>

<!-- Script para mostrar el mensaje al momento de editar una aldea-->
<script>
    $(document).ready(function() {
        $("#formularioEditar").on("submit", function(event) {
            event.preventDefault();

            $.ajax({
                url: "modelos/editar_unidad_productiva.php",
                method: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Unidad Productiva actualizada correctamente",
                            text: "La unidad productiva se ha actualizado correctamente.",
                            icon: "success",
                            showCancelButton: false,
                            confirmButtonText: "Cerrar"
                        }).then(function() {
                            $("#modalEditar").modal("hide");
                            location.reload(); // Recarga la página
                        });
                    } else {
                        Swal.fire({
                            title: "Error",
                            text: "Hubo un problema al actualizar la unidad productiva.",
                            icon: "error",
                            confirmButtonText: "Cerrar"
                        }).then(function() {
                            location.reload(); // Recarga la página
                        });
                    }
                }
            });
        });
    });
</script>

<!-- Script para mostrar el mensaje al momento de eliminar un aldea-->
<script>
    $(document).ready(function() {
        $("form#deleteForm").on("submit", function(event) {
            event.preventDefault();

            var form = $(this);

            Swal.fire({
                title: "¿Estás seguro?",
                text: "Esta acción eliminará la unidad productiva. Esta acción no se puede deshacer.",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Sí, eliminar",
                cancelButtonText: "Cancelar"
            }).then(function(result) {
                if (result.isConfirmed) {
                    $.ajax({
                        url: form.attr("action"),
                        method: "POST",
                        data: form.serialize(),
                        success: function(response) {
                            if (response == "success") {
                                Swal.fire({
                                    title: "Unidad productiva eleminada correctamente",
                                    text: "la unidad productiva se ha eliminado correctamente.",
                                    icon: "success",
                                    showCancelButton: false,
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: "Hubo un problema al eliminar la unidad productiva.",
                                    icon: "error",
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            }
                        }
                    });
                }
            });
        });
    });
</script>


<script>
    $(document).ready(function() {
        $("#searchInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $(".table tbody tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>
<script>
    function validateInput(input) {
        var regex = /^[A-Za-z]+$/;
        var error_message = document.getElementById('error_message');

        if (!regex.test(input.value)) {
            error_message.textContent = 'Solo se permiten letras en este campo.';
        } else {
            error_message.textContent = '';
        }
    }
</script>

<!-- JQUERY -->
<!-- <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script> -->

    <!-- DATATABLES -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
    </script>

    <!-- BOOTSTRAP -->
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
    </script>





<script>
    $(document).ready(function(){
        $('#tablax').DataTable({
            language: {
                    processing: "Tratamiento en curso...",
                    search: "Buscar&nbsp;:",
                    lengthMenu: "Agrupar de _MENU_ elementos",
                    info: "Mostrando del elemento _START_ al _END_ de un total de _TOTAL_ elementos",
                    infoEmpty: "No existen datos.",
                    infoFiltered: "(filtrado de _MAX_ elementos en total)",
                    infoPostFix: "",
                    loadingRecords: "Cargando...",
                    zeroRecords: "No se encontraron datos con tu busqueda",
                    emptyTable: "No hay datos disponibles en la tabla.",
                    paginate: {
                        first: "Primero",
                        previous: "Anterior",
                        next: "Siguiente",
                        last: "Ultimo"
                    },
                    aria: {
                        sortAscending: ": active para ordenar la columna en orden ascendente",
                        sortDescending: ": active para ordenar la columna en orden descendente"
                    }
                },
            
        });
    })


</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>