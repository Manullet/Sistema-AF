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
            <h1 class="poppins-font mb-2">OTROS INGRESOS</h1>
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
                    <input class="form-control" id="searchInput" type="search" placeholder="Buscar Ingresos..." aria-label="Search">
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
                    <th scope="col">Tipo de negocio</th>
                    <th scope="col">Ingreso total</th>
                    <th scope="col">Periodo</th>
                    <th scope="col">Otros descripción</th>
                    <th scope="col">Creado Por</th>
                    <th scope="col">Fecha Creación</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Acciones</th> <!-- Added text-center class here -->
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT * FROM tbl_Ingreso_Familiar");
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                        <td><?= $datos->Id_Ingreso_Familiar ?></td>
                        <td><?= $datos->Id_Tipo_Negocio ?></td>
                        <td><?= $datos->Total_Ingreso ?></td>
                        <td><?= $datos->Id_Periodo ?></td>
                        <td><?= $datos->Descripcion_Otros ?></td>
                        <td><?= $datos->Creado_Por ?></td>
                        <td><?= $datos->Fecha_Creacion ?></td>
                        <td><?php
                            if ($datos->Estado == "A") {
                                echo '<span class="badge bg-success">Activo</span>';
                            } else {
                                echo '<span class="badge bg-danger">Inactivo</span>';
                            }
                            ?></td>
                        <td>
                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar
                            ('<?= $datos->Id_Ingreso_Familiar ?>', '<?= $datos->Id_Tipo_Negocio ?>', '<?= $datos->Total_Ingreso ?>', '<?= $datos->Id_Periodo ?>''<?= $datos->Descripcion_Otros ?>', '<?= $datos->Estado ?>', '<?= $datos->Creado_Por ?>', '<?= $datos->Fecha_Creacion ?>')">
                                <i class="bi bi-pencil-square"></i>
                                Editar
                            </button>
                            <form id="deleteForm" method="POST" action="modelos/eliminar_ingreso_familiar.php" style="display: inline;">
                                <input type="hidden" name="Id_Ingreso_Familiar" value="<?= $datos->Id_Ingreso_Familiar
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
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">EDITAR PRODUCCION PECUARIA INVENTARIO</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="#">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Id_Ingreso_Familiar">Código</label>
                                <input type="text" class="form-control" id="Id_Ingreso_Familiar" name="Id_Ingreso_Familiar" readonly>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Id_Tipo_Negocio">Tipo de negocio</label>
                                <input type="text" class="form-control" id="Id_Tipo_Negocio" name="Id_Tipo_Negocio" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Total_Ingreso">Ingreso total</label>
                                <input type="text" class="form-control" id="Total_Ingreso" name="Total_Ingreso" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Id_Periodo">Periodo</label>
                                <input type="text" class="form-control" id="Id_Periodo" name="Id_Periodo" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Descripcion_Otros">Otros descripción</label>
                                <input type="text" class="form-control" id="Descripcion_Otros" name="Descripcion_Otros" required>
                            </div>
                        </div>
                    <div class="form-row">
                             <div class="form-group col-md-15">
                                <label for="estado">Estado</label>
                                <select class="form-control" id="estado" name="estado" required>
                                    <option value="" disabled selected>Selecciona un estado</option>
                                    <option value="ACTIVO">Activo</option>
                                    <option value="INACTIVO">Inactivo</option>
                                </select>
                                </div>
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
    <div class="modal-dialog"  role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">Otros Ingresos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos/agregar_Ingreso_Familiar.php" method="POST">
                    <div class="row mb-3">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Id_Tipo_Negocio">Tipo de negocio</label>
                                <input type="text" class="form-control" id="Id_Tipo_Negocio" name="Id_Tipo_Negocio" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Total_Ingreso">Ingreso total</label>
                                <input type="text" class="form-control" id="Total_Ingreso" name="Total_Ingreso" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Id_Periodo">Periodo</label>
                                <input type="text" class="form-control" id="Id_Periodo" name="Id_Periodo" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Descripcion_Otros">Otros descripción</label>
                                <input type="text" class="form-control" id="Descripcion_Otros" name="Descripcion_Otros" required>
                            </div>
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
    function abrirModalEditar(Id_Ingreso_Familiar, Id_Tipo_Negocio, Total_Ingreso, Id_Periodo, Descripcion_Otros, Estado) {
        document.getElementById("Id_Ingreso_Familiar").value = Id_Ingreso_Familiar;
        document.getElementById("Id_Tipo_Negocio").value = Id_Tipo_Negocio;
        document.getElementById("Total_Ingreso").value = Total_Ingreso;
        document.getElementById("Id_Periodo").value = Id_Periodo;
        document.getElementById("Descripcion_Otros").value = Descripcion_Otros;
        document.getElementById("Estado").value = Estado;

        $('#modalEditar').modal('show'); // Mostrar el modal de edición
    }
</script>

<script>
    $(document).ready(function() {
        $("#formularioEditar").on("submit", function(event) {
            event.preventDefault();

            $.ajax({
                url: "modelos/editar_ingreso_familiar.php",
                method: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Ingreso familiar actualizado correctamente",
                            text: "El ingreso familiar se ha actualizado correctamente.",
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
                            text: "Hubo un problema al actualizar el ingreso familiar.",
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
                text: "Esta acción eliminará el ingreso familiar. Esta acción no se puede deshacer.",
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
                                    title: "Ingreso familiar eleminado correctamente",
                                    text: "El ingreso familiar se ha eliminado correctamente.",
                                    icon: "success",
                                    showCancelButton: false,
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: "Hubo un problema al eliminar el ingreso familiar.",
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