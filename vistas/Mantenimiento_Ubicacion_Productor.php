<?php
session_start();
$_SESSION['url'] = 'vistas/Mantenimiento_Ubicacion_Productor.php';
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


<div class="containertable">
    <div class="d-flex justify-content-between align-items-end mb-4">
        <div>
            <h1 class="poppins-font mb-2">UBICACIÓN GEOGRAFICA</h1>
            <br>
            <a href="#" data-bs-toggle="modal" data-bs-target="#modalForm" class="btn btn-info">
                <i class="bi bi-plus-square icono-grande"></i> Crear
            </a>
        </div>

        <div class="mb-4 border-bottom">
            <form class="d-flex" role="search">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-search"></i></span>
                    </div>
                    <input class="form-control" id="searchInput" type="search" placeholder="Buscar periodos..." aria-label="Search">
                </div>
            </form>
        </div>
    </div>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.8/xlsx.full.min.js"></script>
    <!--  seleccion de registros -->
    <div class="formulario-registros">
        <label for="cantidadRegistros" style="margin-left: 1350px;">Mostrar
            <select id="cantidadRegistros">
                <option value="10">10</option>
                <option value="20">20</option>
                <option value="30">30</option>
            </select>
            <span class="registros-text">Registros</span></label>
    </div>
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

        <table class="table table-hover">
            <thead class="table-dark text-center" style="background-color: #343A40;">
                <tr>
                    <th scope="col">Nº Ficha</th>
                    <th scope="col">Productor</th>
                    <th scope="col">Nº ubicación</th>
                    <th scope="col">Departamento</th>
                    <th scope="col">Municipio</th>
                    <th scope="col">Aldea</th>
                    <th scope="col">Caserio</th>
                    <th scope="col">Ubicacion Geografica</th>
                    <th scope="col">Direccion</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Estado</th>

                    <th scope="col">Acciones</th> <!-- Added text-center class here -->
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT
                up.*,
                p.primer_nombre AS nombre_productor,
                d.Nombre_Departamento AS nombre_departamento,
                m.Nombre_Municipio AS nombre_municipio,
                a.Nombre_Aldea AS nombre_aldea,
                c.Nombre_Cacerio AS nombre_caserio
            FROM tbl_ubicacion_productor up
            LEFT JOIN tbl_departamentos d ON up.id_departamento = d.Id_Departamento
            LEFT JOIN tbl_municipios m ON up.id_municipio = m.Id_Municipio
            LEFT JOIN tbl_aldeas a ON up.id_aldea = a.Id_Aldea
            LEFT JOIN tbl_cacerios c ON up.Id_Cacerio = c.Id_Cacerio
            LEFT JOIN tbl_productor p ON up.id_productor = p.id_productor;
            ");

                while ($datos = $sql->fetch_object()) {
                ?>
                    <tr>
                        <td><?= $datos->id_ficha ?></td>
                        <td><?= $datos->nombre_productor ?></td>
                        <td><?= $datos->id_ubicacion ?></td>
                        <td><?= $datos->nombre_departamento ?></td>
                        <td><?= $datos->nombre_municipio ?></td>
                        <td><?= $datos->nombre_aldea ?></td>
                        <td><?= $datos->nombre_caserio ?></td>
                        <td><?= $datos->ubicacion_geografica ?></td>
                        <td><?= $datos->direccion_1 ?></td>
                        <td><?= $datos->descripcion ?></td>
                        <td>
                            <?php
                            if ($datos->estado == "A") {
                                echo '<span class="badge bg-success">Activo</span>';
                            } else {
                                echo '<span class="badge bg-danger">Inactivo</span>';
                            }
                            ?></td>
                        <td>
                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar('<?= $datos->id_ubicacion ?>','<?= $datos->id_ficha ?>','<?= $datos->id_productor ?>',    '<?= $datos->id_departamento ?>','<?= $datos->id_municipio ?>', '<?= $datos->id_aldea ?>','<?= $datos->id_caserio ?>', '<?= $datos->ubicacion_geografica ?>','<?= $datos->distancia_parcela_vivienda ?>', '<?= $datos->latitud_parcela ?>','<?= $datos->longitud_parcela ?>', '<?= $datos->msnm ?>','<?= $datos->direccion_1 ?>', '<?= $datos->direccion_2 ?>','<?= $datos->direccion_3 ?>', '<?= $datos->vive_en_finca ?>','<?= $datos->nombre_finca ?>','<?= $datos->descripcion ?>','<?= $datos->estado ?>')">
                                <i class="bi bi-pencil-square"></i>
                                Editar
                            </button>

                            <form id="deleteForm" method="POST" action="modelos/eliminar_periodicidad.php" style="display: inline;">
                                <input type="hidden" name="id_ubicacion" value="<?= $datos->id_ubicacion ?>">
                                <button type="submit" class="btn btn-eliminar">
                                    <i class="bi bi-trash"></i>
                                    Eliminar
                                </button>
                            </form>
                        </td>
                    </tr>
                <?php }
                ?>
            </tbody>
        </table>
    </div>

    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-end">
            <li class="page-item disabled">
                <a class="page-link">Anterior</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Siguiente</a>
            </li>
        </ul>
    </nav>
</div>

<!-- Modal para editar UBICACION -->

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
                                <label for="id_ubicacion">Nº Ubicacion</label>
                                <input type="text" class="form-control" id="id_ubicacion" name="id_ubicacion" readonly>
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


<!-- Modal para crear usuarios -->
<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" role="document">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">CREAR UBICACIÓN GEOGRAFICA </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos/agregar_ubicacion_productor.php" method="POST">
                <div class="row">
                        
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
                    <div class="form-group ">
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
                        <button type="submit" class="btn btn-actualizar">Crear</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"></i>Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript para manejar la edición de usuarios -->
<script>
    function abrirModalEditar(
        id_ficha, id_productor, id_ubicacion, id_departamento, id_municipio,
        id_aldea, id_caserio, ubicacion_geografica, distancia_parcela_vivienda,
        latitud_parcela, longitud_parcela, msnm, direccion_1, direccion_2,
        direccion_3, vive_en_finca, nombre_finca, descripcion, estado
    ) {
        $("#id_ficha").val(id_ficha);
        $("#id_productor").val(id_productor);
        $("#id_ubicacion").val(id_ubicacion);
        $("#id_departamento").val(id_departamento);
        $("#id_municipio").val(id_municipio);
        $("#id_aldea").val(id_aldea);
        $("#id_cacerio").val(id_caserio);
        $("#ubicacion_geografica").val(ubicacion_geografica);
        $("#distancia_parcela_vivienda").val(distancia_parcela_vivienda);
        $("#latitud_parcela").val(latitud_parcela);
        $("#longitud_parcela").val(longitud_parcela);
        $("#msnm").val(msnm);
        $("#direccion_1").val(direccion_1);
        $("#direccion_2").val(direccion_2);
        $("#direccion_3").val(direccion_3);
        if (vive_en_finca === 'S') {
            document.getElementById("vive_en_finca_S").checked = true;
        } else if (vive_en_finca === 'N') {
            document.getElementById("vive_en_finca_N").checked = true;
        }
        $("#nombre_finca").val(nombre_finca);
        $("#descripcion").val(descripcion);
        $("#estado").val(estado);

        $('#modalEditar').modal('show');
    }
</script>

<!-- Script para mostrar el mensaje al momento de editar un usuario-->
<script>
    $(document).ready(function() {
        $("#formularioEditar").on("submit", function(event) {
            event.preventDefault();

            $.ajax({
                url: "modelos/editar_ubicacion_productor.php",
                method: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Periodo actualizado correctamente",
                            text: "El periodo se ha actualizado correctamente.",
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
                            text: "Hubo un problema al actualizar el periodo.",
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

<!-- Script para mostrar el mensaje al momento de eliminar un usuario-->
<script>
    $(document).ready(function() {
        $("form#deleteForm").on("submit", function(event) {
            event.preventDefault();

            var form = $(this);

            Swal.fire({
                title: "¿Estás seguro?",
                text: "Esta acción eliminará el periodo. Esta acción no se puede deshacer.",
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
                                    title: "Periodo eliminado correctamente",
                                    text: "El periodo se ha eliminado correctamente.",
                                    icon: "success",
                                    showCancelButton: false,
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: "Hubo un problema al eliminar el periodo.",
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>