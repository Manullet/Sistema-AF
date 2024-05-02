<?php 
session_start();
 $_SESSION['url'] = 'vistas/Mantenimiento_parametro.php';
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
                <h1 class="poppins-font mb-2">MANTENIMIENTO PARAMETROS</h1>
                <br>
                <a href="#" data-bs-toggle="modal" data-bs-target="#modalForm" class="btn btn-info">
                    <i class="nav-icon bi bi-people-fill"></i> Crear
                </a>
            </div>

        <div class="mb-4 border-bottom">
            <form class="d-flex" role="search">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-search"></i></span>
                    </div>
                    <input class="form-control" id="searchInput" type="search" placeholder="Buscar..." aria-label="Search">
                </div>
            </form>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-hover">
            <thead class="table-dark text-center" style="background-color: #343A40;">
                <tr>
                    <th scope="col">Id Parámetro</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Valor</th>
                    <th scope="col">Fecha Creación</th>
                    <th scope="col">Fecha Actualización</th>
                    <th scope="col">Acciones</th>
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT * FROM parametros");
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                        <td><?= $datos->Id_parametros ?></td>
                        <td><?= $datos->Parametro?></td>
                        <td><?= $datos->Valor ?></td>
                        <td><?= $datos->Fecha_Creacion ?></td>
                        <td><?= $datos->Fecha_Actualizacion ?></td>
                        <td>
                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar
                            ('<?= $datos->Id_parametros ?>', '<?= $datos->Parametro ?>', '<?= $datos->Valor ?>')">
                                <i class="bi bi-pencil-square"></i>
                                Editar
                            </button>
                            <form id="deleteForm" method="POST" action="modelos/deleteParametro.php" style="display: inline;">
                                <input type="hidden" name="Id_parametro" value="<?= $datos->Id_parametros ?>">
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


<!-- Modal para editar -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">EDITAR</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="modelos/editarParametro.php">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Id_parametro">Id Parámetro</label>
                                <input type="text" class="form-control" id="Id_Parametro" name="Id_Parametro" readonly>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="nombre">Nombre </label>
                                <input type="text" class="form-control" id="nombre_edit" name="nombre_edit" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-8">
                        <label for="Descripcion" class="form-label">Valor</label>
                        <textarea class="form-control" id="valor_edit" name="valor_edit" rows="4"></textarea>
                      </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary" id="actualizarBtn">Actualizar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal para crear -->
<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" role="document">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">CREAR</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos/insertarParametro.php" method="POST">
                        <div class="col-8">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre">
                        </div>
                        <div class="col-8">
                        <label for="Descripcion" class="form-label">Valor</label>
                        <textarea class="form-control" id="valor" name="valor" rows="4"></textarea>
                      </div>
                    <br>
                    <button type="submit" class="btn btn-success" name="btnnuevo" value="ok">Crear</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript para manejar la edición de usuarios -->
<script>
    // Función para abrir el modal de edición
    function abrirModalEditar(Id, nombre, valor) {
        console.log(Id)

        document.getElementById("Id_Parametro").value = Id;
        document.getElementById("nombre_edit").value = nombre;
        document.getElementById("valor_edit").value = valor;
        $('#modalEditar').modal('show'); // Mostrar el modal de edición
    }
</script>



<script>
    $(document).ready(function() {
        // Validación para el formulario de edición
        $("#formularioEditar").on("submit", function(event) {
            event.preventDefault();
            validarEdicion($(this));
        });

        // Validación para el formulario de creación
        $("form[action='modelos/insertarParametro.php']").on("submit", function(event) {
            event.preventDefault();
            validarCreacion($(this));
        });

        function validarEdicion(formulario) {
            // Convertir el valor del campo de nombre a mayúsculas antes de enviar el formulario
            var nombreEditInput = formulario.find("input[name='nombre_edit']");
            nombreEditInput.val(nombreEditInput.val().toUpperCase());

            $.ajax({
                url: formulario.attr("action"),
                method: "POST",
                data: formulario.serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Registro actualizado correctamente",
                            text: "El Registro se ha actualizado correctamente.",
                            icon: "success",
                            showCancelButton: false,
                            confirmButtonText: "Cerrar"
                        }).then(function() {
                            $("#modalEditar").modal("hide");
                            location.reload(); // Recarga la página
                        });
                    } else {
                        Swal.fire({
                            title: "Registro actualizado correctamente",
                            text: "El Registro se ha actualizado correctamente.",
                            icon: "success",
                            showCancelButton: false,
                            confirmButtonText: "Cerrar"
                        }).then(function() {
                            $("#modalEditar").modal("hide");
                            location.reload(); // Recarga la página
                        });
                    }
                }
            });
        }

        function validarCreacion(formulario) {
            // Convertir el valor del campo de nombre a mayúsculas antes de enviar el formulario
            var nombreInput = formulario.find("input[name='nombre']");
            nombreInput.val(nombreInput.val().toUpperCase());

            $.ajax({
                url: formulario.attr("action"),
                method: "POST",
                data: formulario.serialize(),
                success: function(response) {
                    if (response == "success") {
                        $("#modalForm").modal("hide");
                        location.reload(); // Recarga la página
                    } else {
                        location.reload(); // Recarga la página
                    }
                }
            });
        }
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
                                    title: "Error",
                                    text: "Hubo un problema al eliminar el Registro.",
                                    icon: "error",
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Registro eliminado correctamente",
                                    text: "El Registro se ha eliminado correctamente.",
                                    icon: "success",
                                    showCancelButton: false,
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
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
    $(document).ready(function() {
        $('.table').DataTable({
            "lengthChange": false,
            "pageLength": 10
        });
    });
</script>




