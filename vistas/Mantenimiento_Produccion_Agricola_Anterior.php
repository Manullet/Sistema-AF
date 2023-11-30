<?php
session_start();
$_SESSION['url'] = 'vistas/Mantenimiento_Produccion_Agricola_Anterior.php';
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
            <h1 class="poppins-font mb-2">PRODUCCION AGRICOLA ANTERIOR</h1>
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
                    <input class="form-control" id="searchInput" type="search" placeholder="Buscar Anterioridad..." aria-label="Search">
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
                    <th scope="col">Código</th>
                    <th scope="col">Tipo Cultivo</th>
                    <th scope="col">Produccion Obtenida </th>
                    <th scope="col">Precio de venta</th>
                    <th scope="col">Cantidad Vendida</th>
                    <th scope="col">Se le vendio a</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Acciones</th> <!-- Added text-center class here -->
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT
                PA.*,
                TC.tipo_cultivo
            FROM
                tbl_produccion_agricola_anterior PA
                INNER JOIN tbl_tipo_cultivo TC ON PA.Id_Tipo_Cultivo = TC.id_tipo_cultivo;
            ");
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                        <td><?= $datos->Id_Produccion_Anterior ?></td>
                        <td><?= $datos->tipo_cultivo ?></td>
                        <td><?= $datos->Produccion_Obtenida ?></td>
                        <td><?= $datos->Precio_Venta ?></td>
                        <td><?= $datos->Cantidad_Vendida ?></td>
                        <td><?= $datos->A_Quien_Se_Vendio ?></td>
                        <td><?php
                            if ($datos->Estado == "A") {
                                echo '<span class="badge bg-success">Activo</span>';
                            } else {
                                echo '<span class="badge bg-danger">Inactivo</span>';
                            }
                            ?></td>
                        <td>
                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar('<?= $datos->Id_Produccion_Anterior ?>', '<?= $datos->Id_Ficha ?>', '<?= $datos->Id_Productor ?>', '<?= $datos->Id_Ubicacion ?>', '<?= $datos->Id_Tipo_Cultivo ?>','<?= $datos->Superficie_Primera_Postrera ?>', '<?= $datos->Id_Medida_Primera_Postrera ?>','<?= $datos->Produccion_Obtenida ?>', '<?= $datos->Id_Medida_Produccion_Obtenida ?>','<?= $datos->Cantidad_Vendida ?>', '<?= $datos->Id_Medida_Vendida ?>','<?= $datos->Precio_Venta ?>', '<?= $datos->A_Quien_Se_Vendio ?>','<?= $datos->Descripcion ?>','<?= $datos->Estado ?>')">
                                <i class="bi bi-pencil-square"></i>
                                Editar
                            </button>
                            <form id="deleteForm" method="POST" action="modelos/eliminar_produccion_agricola_anterior.php" style="display: inline;">
                                <input type="hidden" name="Id_Produccion_Anterior" value="<?= $datos->Id_Produccion_Anterior
                                                                                            ?>">
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

<!-- Modal para editar usuarios -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">EDITAR PRODUCCION AGRICOLA ANTERIOR</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="#">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Produccion_Anterior">Código</label>
                                <input type="text" class="form-control" id="Id_Produccion_Anterior" name="Id_Produccion_Anterior" readonly>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Ficha">Ficha:</label>
                                <select class="form-control" id="Id_Ficha" name="Id_Ficha" readonly>
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
                                <select class="form-control" id="Id_Productor" name="Id_Productor" readonly>
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
                            <label for="Id_Ubicacion">Ubicacion:</label>
                            <select class="form-control" id="Id_Ubicacion" name="Id_Ubicacion" readonly>
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
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="Id_Tipo_Cultivo">tipo_cultivo:</label>
                            <select class="form-control" id="Id_Tipo_Cultivo" name="Id_Tipo_Cultivo" required>
                                <?php
                                // Conexión a la base de datos
                                include '../php/conexion_be.php';

                                // Consulta SQL para obtener los valores disponibles de ID y Nombre de Aldea
                                $sql = "SELECT id_tipo_cultivo, tipo_cultivo FROM tbl_tipo_cultivo";

                                // Ejecutar la consulta
                                $result = mysqli_query($conexion, $sql);

                                if (mysqli_num_rows($result) > 0) {
                                    while ($row = mysqli_fetch_assoc($result)) {
                                        // Genera opciones con el nombre del aldea como etiqueta y el ID como valor
                                        echo '<option value="' . $row["id_tipo_cultivo"] . '">' . $row["tipo_cultivo"] . '</option>';
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
                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Primera_Postrera" class="form-label">Superficie_Primera_Postrera</label>
                            <input type="text" class="form-control" id="Superficie_Primera_Postrera" name="Superficie_Primera_Postrera" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Medida_Primera_Postrera">Medida_Primera_Postrera:</label>
                                <select class="form-control" id="Id_Medida_Primera_Postrera" name="Id_Medida_Primera_Postrera" required>
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
                            <label for="Produccion_Obtenida" class="form-label">Produccion_Obtenida</label>
                            <input type="text" class="form-control" id="Produccion_Obtenida" name="Produccion_Obtenida" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Medida_Produccion_Obtenida">Medida_Produccion_Obtenida:</label>
                                <select class="form-control" id="Id_Medida_Produccion_Obtenida" name="Id_Medida_Produccion_Obtenida" required>
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
                            <label for="Cantidad_Vendida" class="form-label">Cantidad_Vendida</label>
                            <input type="text" class="form-control" id="Cantidad_Vendida" name="Cantidad_Vendida" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Medida_Vendida">Medida_Vendida:</label>
                                <select class="form-control" id="Id_Medida_Vendida" name="Id_Medida_Vendida" required>
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
                            <label for="Precio_Venta" class="form-label">Precio_Venta</label>
                            <input type="text" class="form-control" id="Precio_Venta" name="Precio_Venta" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </div>
                        <div class="col">
                            <label for="A_Quien_Se_Vendio" class="form-label">A_Quien_Se_Vendio </label>
                            <input type="text" class="form-control" id="A_Quien_Se_Vendio" name="A_Quien_Se_Vendio">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="Descripcion" class="form-label">Descripcion </label>
                            <input type="text" class="form-control" id="Descripcion" name="Descripcion">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="Estado">Estado</label>
                            <select class="form-control" id="Estado" name="Estado" required>
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

<!-- Falta el MODAL EDITAR y los procedimientos -->


<!-- Modal para crear aldeas -->
<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">Producción Agricola Anterior</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos/agregar_produccion_agricola_anterior.php" method="POST">
                    <div class="row mb-3">
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
                            <label for="Id_Tipo_Cultivo">tipo_cultivo:</label>
                            <select class="form-control" id="Id_Tipo_Cultivo" name="Id_Tipo_Cultivo" required>
                                <?php
                                // Conexión a la base de datos
                                include '../php/conexion_be.php';

                                // Consulta SQL para obtener los valores disponibles de ID y Nombre de Aldea
                                $sql = "SELECT id_tipo_cultivo, tipo_cultivo FROM tbl_tipo_cultivo";

                                // Ejecutar la consulta
                                $result = mysqli_query($conexion, $sql);

                                if (mysqli_num_rows($result) > 0) {
                                    while ($row = mysqli_fetch_assoc($result)) {
                                        // Genera opciones con el nombre del aldea como etiqueta y el ID como valor
                                        echo '<option value="' . $row["id_tipo_cultivo"] . '">' . $row["tipo_cultivo"] . '</option>';
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
                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Primera_Postrera" class="form-label">Superficie_Primera_Postrera</label>
                            <input type="text" class="form-control" id="Superficie_Primera_Postrera" name="Superficie_Primera_Postrera" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Medida_Primera_Postrera">Medida_Primera_Postrera:</label>
                                <select class="form-control" id="Id_Medida_Primera_Postrera" name="Id_Medida_Primera_Postrera" required>
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
                            <label for="Produccion_Obtenida" class="form-label">Produccion_Obtenida</label>
                            <input type="text" class="form-control" id="Produccion_Obtenida" name="Produccion_Obtenida" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Medida_Produccion_Obtenida">Medida_Produccion_Obtenida:</label>
                                <select class="form-control" id="Id_Medida_Produccion_Obtenida" name="Id_Medida_Produccion_Obtenida" required>
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
                            <label for="Cantidad_Vendida" class="form-label">Cantidad_Vendida</label>
                            <input type="text" class="form-control" id="Cantidad_Vendida" name="Cantidad_Vendida" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Medida_Vendida">Medida_Vendida:</label>
                                <select class="form-control" id="Id_Medida_Vendida" name="Id_Medida_Vendida" required>
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
                            <label for="Precio_Venta" class="form-label">Precio_Venta</label>
                            <input type="text" class="form-control" id="Precio_Venta" name="Precio_Venta" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </div>
                        <div class="col">
                            <label for="A_Quien_Se_Vendio" class="form-label">A_Quien_Se_Vendio </label>
                            <input type="text" class="form-control" id="A_Quien_Se_Vendio" name="A_Quien_Se_Vendio">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="Descripcion" class="form-label">Descripcion </label>
                            <input type="text" class="form-control" id="Descripcion" name="Descripcion">
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
    function abrirModalEditar(Id_Produccion_Anterior,Id_Ficha,Id_Productor, Id_Ubicacion,
    Id_Tipo_Cultivo,Superficie_Primera_Postrera,Id_Medida_Primera_Postrera,Produccion_Obtenida,
    Id_Medida_Produccion_Obtenida,Cantidad_Vendida,Id_Medida_Vendida,Precio_Venta,A_Quien_Se_Vendio,Descripcion,Estado) {
        document.getElementById("Id_Produccion_Anterior").value = Id_Produccion_Anterior;
        document.getElementById("Id_Ficha").value = Id_Ficha;
        document.getElementById("Id_Productor").value = Id_Productor;
        document.getElementById("Id_Ubicacion").value = Id_Ubicacion;
        document.getElementById("Id_Tipo_Cultivo").value = Id_Tipo_Cultivo;
        document.getElementById("Superficie_Primera_Postrera").value = Superficie_Primera_Postrera;
        document.getElementById("Id_Medida_Primera_Postrera").value = Id_Medida_Primera_Postrera;
        document.getElementById("Produccion_Obtenida").value = Produccion_Obtenida;
        document.getElementById("Id_Medida_Produccion_Obtenida").value = Id_Medida_Produccion_Obtenida;
        document.getElementById("Cantidad_Vendida").value = Cantidad_Vendida;
        document.getElementById("Id_Medida_Vendida").value = Id_Medida_Vendida;
        document.getElementById("Precio_Venta").value = Precio_Venta;
        document.getElementById("A_Quien_Se_Vendio").value = A_Quien_Se_Vendio;
        document.getElementById("Descripcion").value = Descripcion;
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
                url: "modelos/editar_produccion_agricola_anterior.php",
                method: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Producción agricola anterior actualizada correctamente",
                            text: "La producción agricola anterior se ha actualizado correctamente.",
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
                            text: "Hubo un problema al actualizar la producción agricola anterior.",
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
                text: "Esta acción eliminará la producción agricola anterior. Esta acción no se puede deshacer.",
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
                                    title: "Producción agricola anterior eleminada correctamente",
                                    text: "La producción agricola anterior se ha eliminado correctamente.",
                                    icon: "success",
                                    showCancelButton: false,
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: "Hubo un problema al eliminar la producción agricola anterior.",
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>