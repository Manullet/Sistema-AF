<?php
session_start();
$_SESSION['url'] = 'vistas/Mantenimiento_apoyos_produccion.php';
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
            <h1 class="poppins-font mb-2">APOYOS PROD</h1>
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
                    <th scope="col">Código</th>
                    <th scope="col">Ficha</th>
                    <th scope="col">Productor</th>

                    <th scope="col">Tipo de Apoyos Productor</th>
                    <th scope="col">Otros Detalles</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Estado</th>

                    <th scope="col">Acciones</th> <!-- Added text-center class here -->
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT
                AP.*,
                TAP.tipo_apoyo_produccion,
                F.id_ficha,
                P.primer_nombre
            FROM
                tbl_apoyos_produccion AP
                LEFT JOIN tbl_apoyos TAP ON AP.id_apoyo_produccion = TAP.id_apoyo_produccion
                LEFT JOIN fichas F ON AP.id_ficha = F.id_ficha
                LEFT JOIN tbl_productor P ON AP.id_productor = P.id_productor;
            ");
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                        <td><?= $datos->id_apoyo_prod  ?></td>
                        <td><?= $datos->id_ficha ?></td>
                        <td><?= $datos->primer_nombre ?></td>
                        <td><?= $datos->tipo_apoyo_produccion ?></td>
                        <td><?= $datos->otros_detalles ?></td>
                        <td><?= $datos->descripcion ?></td>

                        <td><?php
                            if ($datos->estado == "A") {
                                echo '<span class="badge bg-success">Activo</span>';
                            } else {
                                echo '<span class="badge bg-danger">Inactivo</span>';
                            }
                            ?></td>
                        <td>
                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar
                            ('<?= $datos->id_apoyo_prod?>', '<?= $datos->id_ficha ?>', '<?= $datos->id_productor ?>', '<?= $datos->otros_detalles ?>','<?= $datos->id_apoyo_produccion ?>', '<?= $datos->descripcion ?>', '<?= $datos->estado ?>')">
                                <i class="bi bi-pencil-square"></i>
                                Editar
                            </button>
                            <form id="deleteForm" method="POST" action="modelos/eliminar_apoyos_prod.php" style="display: inline;">
                                <input type="hidden" name="id_apoyo_prod" value="<?= $datos->id_apoyo_prod ?>">
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

<!-- Modal para editar Apoyos Prod -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">EDITAR APOYOS PROD</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="#">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="id_apoyo_prod">id_apoyo_prod </label>
                                <input type="text" class="form-control" id="id_apoyo_prod" name="id_apoyo_prod" readonly>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="id_ficha">Ficha:</label>
                                <select class="form-control" id="id_ficha" name="id_ficha" readonly>
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
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="id_productor">Nombre Agricultor:</label>
                                <select class="form-control" id="id_productor" name="id_productor" readonly>
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
                        <div class="col-6">
                            <div class="form-group">
                                <label for="otros_detalles">otros_detalles</label>
                                <input type="text" class="form-control" id="otros_detalles" name="otros_detalles" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="id_apoyo_produccion">Tipo apoyos :</label>
                                <select class="form-control" id="id_apoyo_produccion" name="id_apoyo_produccion" required>
                                    <?php
                                    // Conexión a la base de datos
                                    include '../php/conexion_be.php';
                                    // Consulta SQL para obtener los valores disponibles de ID y Nombre de Aldea
                                    $sql = "SELECT id_apoyo_produccion , tipo_apoyo_produccion FROM tbl_apoyos";
                                    // Ejecutar la consulta
                                    $result = mysqli_query($conexion, $sql);
                                    if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            // Genera opciones con el nombre del aldea como etiqueta y el ID como valor
                                            echo '<option value="' . $row["id_apoyo_produccion"] . '">' . $row["tipo_apoyo_produccion"] . '</option>';
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
                                <label for="descripcion">descripcion</label>
                                <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                            </div>
                        </div>
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

<!-- Modal para crear Apoyos Prod -->
<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" role="document">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">CREAR APOYOS PROD </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos/agregar_apoyos_prod.php" method="POST">
                    <div class="row mb-3">
                    <div class="col">
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
                        <div class="col">
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
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="otros_detalles">otros_detalles</label>
                                <input type="text" class="form-control" id="otros_detalles" name="otros_detalles" required>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="id_apoyo_produccion">Tipo apoyos :</label>
                                <select class="form-control" id="id_apoyo_produccion" name="id_apoyo_produccion" required>
                                    <?php
                                    // Conexión a la base de datos
                                    include '../php/conexion_be.php';
                                    // Consulta SQL para obtener los valores disponibles de ID y Nombre de Aldea
                                    $sql = "SELECT id_apoyo_produccion , tipo_apoyo_produccion FROM tbl_apoyos";
                                    // Ejecutar la consulta
                                    $result = mysqli_query($conexion, $sql);
                                    if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            // Genera opciones con el nombre del aldea como etiqueta y el ID como valor
                                            echo '<option value="' . $row["id_apoyo_produccion"] . '">' . $row["tipo_apoyo_produccion"] . '</option>';
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
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="descripcion">descripcion</label>
                                <input type="text" class="form-control" id="descripcion" name="descripcion" required>
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

<!-- JavaScript para manejar la edición de Apoyos Prod -->
<script>
    // Función para abrir el modal de edición
    function abrirModalEditar(id_apoyo_prod, id_ficha, id_productor, otros_detalles, id_apoyo_produccion,descripcion, estado) {
        document.getElementById("id_apoyo_prod").value = id_apoyo_prod;
        document.getElementById("id_ficha").value = id_ficha;
        document.getElementById("id_productor").value = id_productor;
        document.getElementById("otros_detalles").value = otros_detalles;
        document.getElementById("id_apoyo_produccion").value = id_apoyo_produccion;
        document.getElementById("descripcion").value = descripcion;
        document.getElementById("estado").value = estado;

        $('#modalEditar').modal('show'); // Mostrar el modal de edición 
    }
</script>

<!-- Script para mostrar el mensaje al momento de editar un Apoyo Prod-->
<script>
    $(document).ready(function() {
        $("#formularioEditar").on("submit", function(event) {
            event.preventDefault();

            $.ajax({
                url: "modelos/editar_apoyos_prod.php",
                method: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Apoyo Produccion actualizado correctamente",
                            text: "El Apoyo Produccion se ha actualizado correctamente.",
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
                            text: "Hubo un problema al actualizar el Apoyo Produccion.",
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

<!-- Script para mostrar el mensaje al momento de eliminar un Apoyo Prod-->
<script>
    $(document).ready(function() {
        $("form#deleteForm").on("submit", function(event) {
            event.preventDefault();

            var form = $(this);

            Swal.fire({
                title: "¿Estás seguro?",
                text: "Esta acción eliminará el Apoyo Produccion. Esta acción no se puede deshacer.",
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
                                    title: "Apoyo Produccion eliminado correctamente",
                                    text: "El Apoyo Produccion se ha eliminado correctamente.",
                                    icon: "success",
                                    showCancelButton: false,
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: "Hubo un problema al eliminar el Apoyo Produccion.",
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