<?php
session_start();
$_SESSION['url'] = 'vistas/Mantenimiento_Manejo_Riego.php';
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
            <h1 class="poppins-font mb-2">MANEJO DE RIEGO</h1>
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
                    <input class="form-control" id="searchInput" type="search" placeholder="Buscar manejo..." aria-label="Search">
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
                    <th scope="col">Productor</th>
                    <th scope="col">Tiene Riego</th>
                    <th scope="col">Fuente de Agua</th>
                    <th scope="col">Disponibilidad del Agua(Meses)</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Acciones</th> <!-- Added text-center class here -->
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT
                MR.*,
                P.primer_nombre
            FROM
                tbl_manejo_riego MR
                INNER JOIN tbl_productor P ON MR.Id_Productor = P.id_productor;
            ");
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                        <td><?= $datos->Id_Manejo_Riego ?></td>
                        <td><?= $datos->primer_nombre ?></td>
                        <td><?php
                            if ($datos->Tiene_Riego == "S") {
                                echo '<span class="badge bg-success">SI</span>';
                            } else {
                                echo '<span class="badge bg-danger">NO</span>';
                            }
                            ?>
                        </td>
                        <td><?= $datos->Fuente_Agua ?></td>
                        <td><?= $datos->Disponibilidad_Agua_Meses ?></td>


                        <td><?php
                            if ($datos->Estado == "A") {
                                echo '<span class="badge bg-success">Activo</span>';
                            } else {
                                echo '<span class="badge bg-danger">Inactivo</span>';
                            }
                            ?></td>
                        <td>
                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar ('<?= $datos->Id_Manejo_Riego ?>', '<?= $datos->Id_Ficha ?>', '<?= $datos->Id_Ubicacion ?>' , '<?= $datos->Id_Productor ?>','<?= $datos->Tiene_Riego ?>' , '<?= $datos->Superficie_Riego ?>','<?= $datos->Id_Medida_Superficie_Riego ?>' , '<?= $datos->Id_Tipo_Riego ?>', '<?= $datos->Fuente_Agua ?>', '<?= $datos->Disponibilidad_Agua_Meses ?>', '<?= $datos->Descripcion ?>','<?= $datos->Estado ?>')">
                                <i class="bi bi-pencil-square"></i>
                                Editar
                            </button>
                            <form id="deleteForm" method="POST" action="modelos/eliminar_manejo_riego.php" style="display: inline;">
                                <input type="hidden" name="Id_Manejo_Riego" value="<?= $datos->Id_Manejo_Riego ?>">
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

<!-- Modal para editar Unidades Productras -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">EDITAR MANEJO DE RIEGO</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="#">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Manejo_Riego">Código</label>
                                <input type="text" class="form-control" id="Id_Manejo_Riego" name="Id_Manejo_Riego" readonly>
                            </div>
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
                            <div class="col">
                                <label for="Tiene_Riego" class="form-label">¿Tiene Riego?</label>
                                <select class="form-control" id="Tiene_Riego" name="Tiene_Riego">
                                    <option value="S">Sí</option>
                                    <option value="N">No</option>
                                </select>
                            </div>

                        </div>
                        <div class="col">
                            <label for="Superficie_Riego" class="form-label">Superficie_Riego</label>
                            <input type="text" class="form-control" id="Superficie_Riego" name="Superficie_Riego" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Medida_Superficie_Riego">Id_Medida_Superficie_Riego:</label>
                                <select class="form-control" id="Id_Medida_Superficie_Riego" name="Id_Medida_Superficie_Riego" required>
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
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Tipo_Riego">Id_Tipo_Riego:</label>
                                <select class="form-control" id="Id_Tipo_Riego" name="Id_Tipo_Riego" required>
                                    <?php
                                    // Conexión a la base de datos
                                    include '../php/conexion_be.php';

                                    // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                                    $sql = "SELECT id_tipo_riego, tipo_riego FROM tbl_tipo_riego";

                                    // Ejecutar la consulta
                                    $result = mysqli_query($conexion, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                            echo '<option value="' . $row["id_tipo_riego"] . '">' . $row["tipo_riego"] . '</option>';
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
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Fuente_Agua">Fuente de Agua</label>
                                <input type="text" class="form-control" id="Fuente_Agua" name="Fuente_Agua" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Disponibilidad_Agua_Meses">Disponibilidad Agua(Meses)</label>
                                <input type="text" class="form-control" id="Disponibilidad_Agua_Meses" name="Disponibilidad_Agua_Meses" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col">
                            <label for="Descripcion" class="form-label">Descripcion</label>
                            <input type="text" class="form-control" id="Descripcion" name="Descripcion">
                        </div>
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
                        <button type="submit" class="btn btn-primary" id="actualizarBtn">Actualizar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
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
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">Manejo de Riego</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos/agregar_manejo_riego.php" method="POST">
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
                            <div class="col">
                                <label for="Tiene_Riego" class="form-label">¿Tiene Riego?</label>
                                <select class="form-control" id="Tiene_Riego" name="Tiene_Riego">
                                    <option value="S">Sí</option>
                                    <option value="N">No</option>
                                </select>
                            </div>

                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Riego" class="form-label">Superficie_Riego</label>
                            <input type="text" class="form-control" id="Superficie_Riego" name="Superficie_Riego" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="Id_Medida_Superficie_Riego">Id_Medida_Superficie_Riego:</label>
                                <select class="form-control" id="Id_Medida_Superficie_Riego" name="Id_Medida_Superficie_Riego" required>
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
                            <div class="form-group">
                                <label for="Id_Tipo_Riego">Id_Tipo_Riego:</label>
                                <select class="form-control" id="Id_Tipo_Riego" name="Id_Tipo_Riego" required>
                                    <?php
                                    // Conexión a la base de datos
                                    include '../php/conexion_be.php';

                                    // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                                    $sql = "SELECT id_tipo_riego, tipo_riego FROM tbl_tipo_riego";

                                    // Ejecutar la consulta
                                    $result = mysqli_query($conexion, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                            echo '<option value="' . $row["id_tipo_riego"] . '">' . $row["tipo_riego"] . '</option>';
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
                        <div class="col">
                            <label for="Fuente_Agua" class="form-label">Fuente de Agua </label>
                            <input type="text" class="form-control" id="Fuente_Agua" name="Fuente_Agua">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="Disponibilidad_Agua_Meses" class="form-label">Disponibilidad_Agua_Meses</label>
                            <input type="text" class="form-control" id="Disponibilidad_Agua_Meses" name="Disponibilidad_Agua_Meses" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </div>

                        <div class="col">
                            <label for="Descripcion" class="form-label">Descripcion</label>
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
    function abrirModalEditar(Id_Manejo_Riego, Id_Ficha, Id_Ubicacion, Id_Productor, Tiene_Riego, Superficie_Riego, Id_Medida_Superficie_Riego, Id_Tipo_Riego, Fuente_Agua, Disponibilidad_Agua_Meses, Descripcion, Estado) {
        document.getElementById("Id_Manejo_Riego").value = Id_Manejo_Riego;
        document.getElementById("Id_Ficha").value = Id_Ficha;
        document.getElementById("Id_Ubicacion").value = Id_Ubicacion;
        document.getElementById("Id_Productor").value = Id_Productor;
        document.getElementById("Tiene_Riego").value = Tiene_Riego;
        document.getElementById("Superficie_Riego").value = Superficie_Riego;
        document.getElementById("Id_Medida_Superficie_Riego").value = Id_Medida_Superficie_Riego;
        document.getElementById("Id_Tipo_Riego").value = Id_Tipo_Riego;
        document.getElementById("Fuente_Agua").value = Fuente_Agua;
        document.getElementById("Disponibilidad_Agua_Meses").value = Disponibilidad_Agua_Meses;
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
                url: "modelos/editar_manejo_riego.php",
                method: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Manejo de Riego actualizado correctamente",
                            text: "El manejo de riego se ha actualizado correctamente.",
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
                            text: "Hubo un problema al actualizar el manejo de riego.",
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
                text: "Esta acción eliminará el manejo de riego. Esta acción no se puede deshacer.",
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
                                    title: "Manejo de riego eleminado correctamente",
                                    text: "El manejo de riego se ha eliminado correctamente.",
                                    icon: "success",
                                    showCancelButton: false,
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: "Hubo un problema al eliminar el manejo de riego.",
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