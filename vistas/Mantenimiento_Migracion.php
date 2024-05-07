<?php 
session_start();
 $_SESSION['url'] = 'vistas/Mantenimiento_Migracion.php';
 $_SESSION['content-wrapper'] = 'content-wrapper';
 include "../php/conexion_be.php";
 // Definir permisos predeterminados
 $permiso_insercion = 2;
 $permiso_actualizacion = 2;
 $permiso_eliminacion = 2;
 
 // Verificar si la sesión 'usuario' está definida y no es un array
 if(isset($_SESSION['usuario'])) {
     $idRolUsuario = $_SESSION['usuario']['id_rol'];
 
     // Consultar los permisos del usuario para el objeto de usuarios (ID de objeto = 3)
     $sqlPermisos = "SELECT * FROM permisos WHERE Id_rol = $idRolUsuario AND id_objeto = 40";
     $resultadoPermisos = $conexion->query($sqlPermisos);
 
     if ($resultadoPermisos->num_rows > 0) {
         // Si se encuentran registros de permisos para el usuario y el objeto
         $filaPermisos = $resultadoPermisos->fetch_assoc();
         $permiso_insercion= $filaPermisos['permiso_insercion'];
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
            <h1 class="poppins-font mb-2">MIGRACION</h1>
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
                    <th scope="col">Motivo</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Estado</th>
                    <th scope="col" class="hidden">Creado Por</th>
                    <th scope="col" class="hidden">Fecha Creación</th>
                    <th scope="col" class="hidden">Modificado Por</th>
                    <th scope="col" class="hidden">Fecha Modificacion</th>
                    
                    <th scope="col">Acciones</th> <!-- Added text-center class here -->
                 
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT * FROM tbl_motivos_migracion");
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                    <td><button class="btn btn-primary"onclick="toggleColumns(this)"><i class="fas fa-eye" style="color:white"></i></button></td>
                        <td><?= $datos->Id_motivo ?></td>
                        <td><?= $datos->Motivo ?></td>
                        <td><?= $datos->Descripcion ?></td>
                        <td><?php
                            if ($datos->Estado == "A") {
                                echo '<span class="badge bg-success">Activo</span>';
                            } else {
                                echo '<span class="badge bg-danger">Inactivo</span>';
                            }
                            ?></td>
                                   <td class="hidden"><?= $datos->Creado_por?></td>
                            <td class="hidden"><?= $datos->Fecha_creacion?></td>
                            <td class="hidden"><?= $datos->Modificado_por?></td>
                            <td class="hidden"><?= $datos->Fecha_Actualizacion?></td>
                        <td>
                        <?php if ($permiso_actualizacion == 1) : ?>
                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar
                            ('<?= $datos->Id_motivo ?>', '<?= $datos->Motivo ?>', '<?= $datos->Descripcion ?>', '<?= $datos->Estado ?>')">
                                <i class="bi bi-pencil-square"></i>
                                Editar
                            </button>
                            <?php endif; ?>
 				<?php if ($permiso_eliminacion == 1) : ?>
                            <form id="deleteForm" method="POST" action="modelos/eliminar_migracion.php" style="display: inline;">
                                <input type="hidden" name="Id_motivo" value="<?= $datos->Id_motivo ?>">
                                <button type="submit" class="btn btn-eliminar">
                                    <i class="bi bi-trash"></i>
                                    Eliminar
                                </button>
                            </form>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php }
                ?>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal para editar usuarios -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">EDITAR MIGRACION</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="#">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Id_motivo">Código</label>
                                <input type="text" class="form-control" id="Id_motivo" name="Id_motivo" readonly>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Motivo"> Motivo</label>
                                <input type="text" class="form-control" id="Motivo" name="Motivo" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                            <label for="Descripcion">Descripción</label>
                            <input type="text" class="form-control" id="Descripcion" name="Descripcion" required>   
                            </div>
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

<!-- Modal para crear usuarios -->
<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" role="document">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">Motivo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos/agregar_migracion.php" method="POST">
                    <div class="row mb-3">
                        <div class="col">
                            <label for="Motivo" class="form-label">Motivo</label>
                            <input type="text" class="form-control" id="Motivo" name="Motivo">
                            <span id="error_message" style="color: red;"></span>
                        </div>
                        <div class="col">
                            <label for="Descripcion" class="form-label">Descripción </label>
                            <input type="text" class="form-control" id="Descripcion" name="Descripcion" >
                            <span id="error_message" style="color: red;"></span>
                        </div>
                    </div>
                   <!--  <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="Status">Estado</label>
                            <select class="form-control" id="Status" name="Status" required>
                                <option value="activo">Activo</option>
                                <option value="inactivo">Inactivo</option>
                            </select>
                        </div>
                    </div>-->
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
    function abrirModalEditar(Id_motivo, Motivo, Descripcion, Estado) {
        document.getElementById("Id_motivo").value = Id_motivo;
        document.getElementById("Motivo").value = Motivo;
        document.getElementById("Descripcion").value = Descripcion;
        document.getElementById("Estado").value = Estado;

        $('#modalEditar').modal('show'); // Mostrar el modal de edición
    }
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

<!-- Script para mostrar el mensaje al momento de editar un usuario-->
<script>
    $(document).ready(function() {
        $("#formularioEditar").on("submit", function(event) {
            event.preventDefault();

            $.ajax({
                url: "modelos/editar_migracion.php",
                method: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Motivo actualizado correctamente",
                            text: "El motivo se ha actualizado correctamente.",
                            icon: "success",
                            showCancelButton: false,
                            confirmButtonText: "Cerrar"
                        }).then(function() {
                            $("#modalEditar").modal("hide");
                            location.reload(); // Recarga la página
                        });
                    }else if (response == "existe") {
                        Swal.fire({
                            title: "Error",
                            text: "Ya existe un motivo de migracaion con el mismo nombre.",
                            icon: "error",
                            confirmButtonText: "Cerrar"
                        }).then(function() {
                            location.reload(); // Recarga la página
                        });
                    }
                     else {
                        Swal.fire({
                            title: "Error",
                            text: "Hubo un problema al actualizar el motivo.",
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
                text: "Esta acción eliminará el motivo. Esta acción no se puede deshacer.",
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
                                    title: "Motivo eliminado correctamente",
                                    text: "El motivo se ha eliminado correctamente.",
                                    icon: "success",
                                    showCancelButton: false,
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: "Hubo un problema al eliminar el Motivo.",
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