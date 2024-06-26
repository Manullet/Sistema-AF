<?php
session_start();
$_SESSION['url'] = 'vistas/Mantenimiento_Siembra.php';
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
    $sqlPermisos = "SELECT * FROM permisos WHERE Id_rol = $idRolUsuario AND id_objeto = 57";//crear el objeto y ponerle el numero correspondiente
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
            <h1 class="poppins-font mb-2">SIEMBRA</h1>
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
                    <th scope="col">Codigo</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Estado</th>
                    <th scope="col" class="hidden">Creado Por</th>
                    <th scope="col" class="hidden">Fecha Creacion</th>
                    <th scope="col" class="hidden">Modificado Por</th>
                    <th scope="col" class="hidden">Fecha Modificacion</th>

                    
                    <th scope="col">Acciones</th> <!-- Added text-center class here -->
                  
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT * FROM tbl_siembra");
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                    <td><button class="btn btn-primary"onclick="toggleColumns(this)"><i class="fas fa-eye" style="color:white"></i></button></td>
                        <td><?= $datos->Id_siembra ?></td>
                        <td><?= $datos->Tipo_siembra ?></td>
                        <td><?php
                            if ($datos->Estado == "A") {
                                echo '<span class="badge bg-success">Activo</span>';
                            } else {
                                echo '<span class="badge bg-danger">Inactivo</span>';
                            }
                            ?></td>
                            <td class="hidden"><?= $datos->Creado_Por?></td>
                            <td class="hidden"><?= $datos->Fecha_Creacion?></td>
                            <td class="hidden"><?= $datos->Actualizado_Por?></td>
                            <td class="hidden"><?= $datos->Fecha_Actualizacion?></td>

                        <td>
                            
<?php if ($permiso_actualizacion == 1) : ?>

                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar
                            ('<?= $datos->Id_siembra ?>', '<?= $datos->Tipo_siembra ?>','<?= $datos->Estado ?>')">
                                <i class="bi bi-pencil-square"></i>
                                Editar
                            </button>
                            <?php endif; ?>
 				<?php if ($permiso_eliminacion == 1) : ?>
                            <form id="deleteForm" method="POST" action="modelos/delete_siembra.php" style="display: inline;">
                                <input type="hidden" name="Id_Siembra" value="<?= $datos->Id_siembra ?>">
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


<!-- Modal para editar aldeas -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">EDITAR SIEMBRA</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="#">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="id">ID:</label>
                                <input type="text" class="form-control" id="id" name="id"  readonly>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Id_Departamento">Nombre:</label>
                                <input type="text" class="form-control" id="NombreEdit" name="Nombre">
                            </div>
                        </div>
                       
                        <div class="col-6">
                            <label for="estado" class="form-label">Estado</label>
                            <select name="estado" id="estadoEdit" class="form-control">
                                <option value=""disabled selected>Seleccione una opción</option>
                                <option value="A">ACTIVO</option>
                                <option value="I">INACTIVO</option>
                            </select>
                            </div>
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
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">Siembra</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos/agregar_siembra.php" method="POST">
                    <div class="row mb-3">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Id_Departamento">Nombre:</label>
                                <input type="text" class="form-control" id="Nombre" name="Nombre">
                            </div>
                        </div>
                       
                        <div class="col-6">
                            <label for="estado" class="form-label">Estado</label>
                            <select name="estado" id="estado" class="form-control">
                                <option value=""disabled selected>Seleccione una opción</option>
                                <option value="A">ACTIVO</option>
                                <option value="I">INACTIVO</option>
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
<script>
    function toggleColumns(button) {
        var row = button.parentNode.parentNode;
        var creado = row.querySelector("td:nth-child(5)");
        var fechaCreacion = row.querySelector("td:nth-child(6)");
        var actualizado = row.querySelector("td:nth-child(7)");
        var fechaAct = row.querySelector("td:nth-child(8)");

  
        var creadoColumn = document.querySelector("th:nth-child(5)");
        var fechaCreacionColumn = document.querySelector("th:nth-child(6)");
        var actualizadoColumn = document.querySelector("th:nth-child(7)");
        var fechaActColumn = document.querySelector("th:nth-child(8)");

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
<!-- JavaScript para manejar la edición de aldeas -->
<script>
    // Función para abrir el modal de edición
    function abrirModalEditar(Id, Nombre, Estado) {
        document.getElementById("id").value = Id;
        document.getElementById("NombreEdit").value = Nombre;
        document.getElementById("estadoEdit").value = Estado;

        $('#modalEditar').modal('show'); // Mostrar el modal de edición
    }
</script>

<!-- Script para mostrar el mensaje al momento de editar una aldea-->
<script>
    $(document).ready(function() {
        $("#formularioEditar").on("submit", function(event) {
            event.preventDefault();
            console.log('hola')

            $.ajax({
                url: "modelos/editar_siembra.php",
                method: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Siembra actualizada correctamente",
                            text: "La siembra se ha actualizado correctamente.",
                            icon: "success",
                            showCancelButton: false,
                            confirmButtonText: "Cerrar"
                        }).then(function() {
                            $("#modalEditar").modal("hide");
                            location.reload(); // Recarga la página
                        });
                    }  
                     else {
                        Swal.fire({
                            title: "Error",
                            text: "Hubo un problema al actualizar la siembra.",
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
                text: "Esta acción eliminará la siembra. Esta acción no se puede deshacer.",
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
                        dataType: "json",
                        success: function(response) {
                            if (response.success) {
                                Swal.fire({
                                    title: "Siembra eliminada correctamente",
                                    text: "La siembra se ha eliminado correctamente.",
                                    icon: "success",
                                    showCancelButton: false,
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: "Hubo un problema al eliminar la siembra.",
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

<!-- Agrega esto al final del archivo HTML que contiene el campo de texto -->
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