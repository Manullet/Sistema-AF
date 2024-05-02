<?php
session_start();
$_SESSION['url'] = 'vistas/Mantenimiento_FuentesCredito.php';
$_SESSION['content-wrapper'] = 'content-wrapper';
include "../php/conexion_be.php";
// Definir permisos predeterminados
$permiso_insercion = 2;
$permiso_actualizacion = 2;
$permiso_eliminacion = 2;

// Verificar si la sesión 'usuario' está definida y no es un array
if (isset($_SESSION['usuario'])) {
    $idRolUsuario = $_SESSION['usuario']['id_rol'];

    // Consultar los permisos del usuario para el objeto de usuarios (ID de objeto = 3)
    $sqlPermisos = "SELECT * FROM permisos WHERE Id_rol = $idRolUsuario AND id_objeto = 49";
    $resultadoPermisos = $conexion->query($sqlPermisos);

    if ($resultadoPermisos->num_rows > 0) {
        // Si se encuentran registros de permisos para el usuario y el objeto
        $filaPermisos = $resultadoPermisos->fetch_assoc();
        $permiso_insercion = $filaPermisos['permiso_insercion'];
        $permiso_actualizacion = $filaPermisos['permiso_actualizacion'];
        $permiso_eliminacion = $filaPermisos['permiso_eliminacion'];
    }
}
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
            <h1 class="poppins-font mb-2">FUENTES DE CREDITO</h1>
            <br>
            <?php if ($permiso_insercion == 1) : ?>
                <a href="#" data-bs-toggle="modal" data-bs-target="#modalForm" class="btn btn-info">
                    <i class="bi bi-plus-square icono-grande"></i> Crear

                </a>
            <?php endif; ?>
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
                    <th scope="col"></th>
                    <th scope="col">Código</th>
                    <th scope="col">Fuente de crédito</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Estado</th>
                    <td class="hidden"><?= $datos->creado_por?></td>
                            <td class="hidden"><?= $datos->fecha_creacion?></td>
                            <td class="hidden"><?= $datos->modificado_por?></td>
                            <td class="hidden"><?= $datos->fecha_modificacion?></td>
                    <?php if ($permiso_insercion == 1) : ?>
                        <th scope="col">Acciones</th> <!-- Added text-center class here -->
                    <?php endif; ?>
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT * FROM tbl_fuentes_credito");
                while ($datos = $sql->fetch_object()) {
                ?>
                    <tr>
                    <td><button class="btn btn-primary"onclick="toggleColumns(this)"><i class="fas fa-eye" style="color:white"></i></button></td>
                        <td><?= $datos->id_fuente_credito ?></td>
                        <td><?= $datos->fuente_credito ?></td>
                        <td><?= $datos->descripcion ?></td>
                        <td>
                            <?php
                            if ($datos->estado == "A") {
                                echo '<span class="badge bg-success">Activo</span>';
                            } else {
                                echo '<span class="badge bg-danger">Inactivo</span>';
                            }
                            ?>
                        </td>
                        <td class="hidden"><?= $datos->creado_por?></td>
                            <td class="hidden"><?= $datos->fecha_creacion?></td>
                            <td class="hidden"><?= $datos->modificado_por?></td>
                            <td class="hidden"><?= $datos->fecha_modificacion?></td>
                        <td>
                            <?php if ($permiso_actualizacion == 1) : ?>
                                <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar('<?= $datos->id_fuente_credito ?>', '<?= $datos->fuente_credito ?>', '<?= $datos->descripcion ?>', '<?= $datos->estado ?>')">
                                    <i class="bi bi-pencil-square"></i>
                                    Editar
                                </button>
                            <?php endif; ?>
                            <?php if ($permiso_eliminacion == 1) : ?>
                                <form id="deleteForm" method="POST" action="./php/eliminar_fuentecredito.php" style="display: inline;">
                                    <input type="hidden" name="id_fuente_credito" value="<?= $datos->id_fuente_credito ?>">
                                    <button type="submit" class="btn btn-eliminar">
                                        <i class="bi bi-trash"></i>
                                        Eliminar
                                    </button>
                                </form>

                            <?php endif; ?>
                    </tr>
                <?php }
                ?>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal para editar etnia -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">EDITAR FUENTE DE CREDITO</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="#">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="id_fuente_credito">Código</label>
                                <input type="text" class="form-control" id="id_fuente_credito" name="id_fuente_credito" readonly>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="fuente_credito">Fuente de crédito</label>
                                <input type="text" class="form-control" id="fuente_credito" name="fuente_credito" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="descripcion">Descripción</label>
                                <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                            </div>
                        </div>
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





<!-- Modal para crear Motivo No Credito -->
<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" role="document">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">CREAR MOTIVO NO CREDITO</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos/agregar_fuente_credito.php" method="POST">
                    <div class="row mb-3">
                        <div class="col">
                            <label for="fuente_credito" class="form-label">Fuente Credito</label>
                            <input type="text" class="form-control" id="fuente_credito" name="fuente_credito">
                        </div>
                        <div class="col">
                            <label for="descripcion" class="form-label">descripcion</label>
                            <input type="text" class="form-control" id="descripcion" name="descripcion">
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
    // Función para abrir el modal de edición
    function abrirModalEditar(id_fuente_credito, fuente_credito, descripcion, estado) {
        document.getElementById("id_fuente_credito").value = id_fuente_credito;
        document.getElementById("fuente_credito").value = fuente_credito;
        document.getElementById("descripcion").value = descripcion;
        document.getElementById("estado").value = estado;

        $('#modalEditar').modal('show'); // Mostrar el modal de edición
    }
</script>

<!-- Script para mostrar el mensaje al momento de editar-->
<script>
    $(document).ready(function() {
        $("#formularioEditar").on("submit", function(event) {
            event.preventDefault();

            $.ajax({
                url: "php/actualizar_fuentecredito.php",
                method: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Registro actualizado correctamente",
                            text: "Fuente de Credito actualizada correctamente.",
                            icon: "success",
                            showCancelButton: false,
                            confirmButtonText: "Cerrar"
                        }).then(function() {
                            $("#modalEditar").modal("hide");
                            location.reload(); // Recarga la página
                        });
                    } else if (response == "existe") {
                        Swal.fire({
                            title: "Error",
                            text: "Ya existe un registro con el mismo nombre.",
                            icon: "error",
                            confirmButtonText: "Cerrar"
                        }).then(function() {
                            location.reload(); // Recarga la página
                        });
                    } else {
                        Swal.fire({
                            title: "Error",
                            text: "Hubo un problema al actualizar la Fuente de Credito.",
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
<script>
    function toggleColumns(button) {
        var row = button.parentNode.parentNode;
        var creado = row.querySelector("td:nth-child(6)");
        var fechaCreacion = row.querySelector("td:nth-child(7)");
        var actualizado = row.querySelector("td:nth-child(8)");
        var fechaAct = row.querySelector("td:nth-child(9)");

  
        var creadoColumn = document.querySelector("th:nth-child(6)");
        var fechaCreacionColumn = document.querySelector("th:nth-child(7)");
        var actualizadoColumn = document.querySelector("th:nth-child(8)");
        var fechaActColumn = document.querySelector("th:nth-child(9)");

        creado.classList.toggle("hidden");
        fechaCreacion.classList.toggle("hidden");
        actualizado.classList.toggle("hidden");
        fechaAct.classList.toggle("hidden");

        creadoColumn.classList.toggle("hidden");   
        fechaCreacionColumn.classList.toggle("hidden");
        actualizadoColumn.classList.toggle("hidden");
        fechaActColumn.classList.toggle("hidden");
    }
</script>
<!-- Script para mostrar el mensaje al momento de eliminar un registro -->
<script>
    $(document).ready(function() {
        // Función para guardar la posición de desplazamiento en localStorage
        function saveScrollPosition() {
            localStorage.setItem("scrollPosition", $(window).scrollTop());
        }

        // Función para restaurar la posición de desplazamiento desde localStorage
        function restoreScrollPosition() {
            var scrollPosition = localStorage.getItem("scrollPosition");
            if (scrollPosition !== null) {
                $(window).scrollTop(scrollPosition);
                localStorage.removeItem("scrollPosition");
            }
        }

        $("form#deleteForm").on("submit", function(event) {
            event.preventDefault();

            var form = $(this);

            Swal.fire({
                title: "¿Estás seguro?",
                text: "Esta acción eliminará la Fuente de Credito. Esta acción no se puede deshacer.",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Sí, eliminar",
                cancelButtonText: "Cancelar"
            }).then(function(result) {
                if (result.isConfirmed) {
                    saveScrollPosition(); // Guarda la posición de desplazamiento antes de la recarga
                    $.ajax({
                        url: form.attr("action"),
                        method: "POST",
                        data: form.serialize(),
                        success: function(response) {
                            if (response == "success") {
                                Swal.fire({
                                    title: "Registro eliminado correctamente",
                                    text: "Fuente de Credito eliminada.",
                                    icon: "success",
                                    showCancelButton: false,
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: "Hubo un problema al eliminar el registro.",
                                    icon: "error",
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload();
                                });
                            }
                        }
                    });
                }
            });
        });

        // Restaura la posición de desplazamiento después de la recarga
        restoreScrollPosition();
    });
</script>

<script>
    // Función para establecer la fecha actual en los campos de fecha
    function setFechaActual() {
        var fechaActual = new Date();
        var dia = fechaActual.getDate();
        var mes = fechaActual.getMonth() + 1;
        var anio = fechaActual.getFullYear();

        var fecha = anio + '-' + (mes < 10 ? '0' : '') + mes + '-' + (dia < 10 ? '0' : '') + dia;

        // Establece la fecha actual en el campo de fecha de creación
        var inputFechaCreacion = document.getElementById('fechaCreacion');
        inputFechaCreacion.value = fecha;
    }

    // Agrega un evento para cuando el modal "modalForm" se muestra
    $('#modalForm').on('shown.bs.modal', function() {
        setFechaActual();
    });
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
    $(document).ready(function() {
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