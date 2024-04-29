<?php 
    session_start();
    $_SESSION['url'] = 'vistas/Mantenimiento_permisos.php';
    $_SESSION['content-wrapper'] = 'content-wrapper';

// Incluir el archivo de conexión a la base de datos
include "../php/conexion_be.php";

// Definir permisos predeterminados
$permiso_insercion = 2;
$permiso_actualizacion = 2;
$permiso_eliminacion = 2;

// Verificar si la sesión 'usuario' está definida y no es un array
if(isset($_SESSION['usuario'])) {
    $idRolUsuario = $_SESSION['usuario']['id_rol'];

    // Consultar los permisos del usuario para el objeto de usuarios (ID de objeto = 3)
    $sqlPermisos = "SELECT * FROM permisos WHERE Id_rol = $idRolUsuario AND id_objeto = 3";
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
    <link  href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">


    <div class="containertable">
        <div class="d-flex justify-content-between align-items-end mb-4">
            <div>
                <h1 class="poppins-font mb-2">MANTENIMIENTO PERMISOS</h1>
                <br>
                <?php if ($permiso_insercion == 1) : ?>
                <a href="#" data-bs-toggle="modal" data-bs-target="#modalForm" class="btn btn-info">
                    <i class="nav-icon bi bi-people-fill"></i> Crear
                </a>
                <?php endif; ?>
            </div>

       
        </div>

        <div class="table-responsive">
        <!--El diseño de la table cuando ya esté todo unido 
    <table id="tablax" class="table table-striped table-bordered" style="width:100%"> -->
    <table id="tablax" class="table table-hover">
                <thead class="table-dark text-center" style="background-color: #343A40;">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Objeto</th>
                        <th scope="col">Rol</th>
                        <th scope="col">Permiso ELIMINAR</th>
                        <th scope="col">Permiso ACTUALIZAR</th>
                        <th scope="col">Permiso INSERTAR</th>       
                        <th scope="col">Permiso CONSULTAR</th>               
                        <th scope="col">Actualizado Por</th>
                        <th scope="col">Fecha Actualización</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    <?php
                    include "../php/conexion_be.php";
                    $sql = $conexion->query("
                        SELECT 
                            permisos.id_permisos,
                            objetos.Objeto,
                            roles.id_rol,
                            roles.nombre,
                            permisos.permiso_eliminacion,
                            permisos.permiso_actualizacion,
                            permisos.permiso_insercion,
                            permisos.permiso_consulta,
                            permisos.Actualizado_Por,
                            permisos.Fecha_Actualizacion
                        FROM permisos
                        INNER JOIN roles ON permisos.id_rol = roles.Id_rol
                        INNER JOIN objetos on objetos.Id_Objetos = permisos.id_objeto
                    ");

                    while ($datos = $sql->fetch_object()) { ?>
                        <tr>
                            <td><?= $datos->id_permisos ?></td>
                            <td><?= $datos->Objeto ?></td>
                            <td><?= $datos->nombre ?></td>
                            <td><?= ($datos->permiso_eliminacion == 1) ? 'SI' : 'NO' ?></td>
                            <td><?= ($datos->permiso_actualizacion == 1) ? 'SI' : 'NO' ?></td>
                            <td><?= ($datos->permiso_insercion == 1) ? 'SI' : 'NO' ?></td>
                            <td><?= ($datos->permiso_consulta == 1) ? 'SI' : 'NO' ?></td>
                            <td><?= $datos->Actualizado_Por ?></td>
                            <td><?= $datos->Fecha_Actualizacion ?></td>
                            <td>
                            <?php if ($permiso_actualizacion == 1) : ?>
                                <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar(
                                    '<?= $datos->id_permisos ?>', '<?= $datos->id_rol ?>', '<?= $datos->permiso_eliminacion ?>', '<?= $datos->permiso_actualizacion ?>', '<?= $datos->permiso_insercion ?>', '<?= $datos->permiso_consulta ?>', '<?= $datos->Actualizado_Por ?>', '<?= $datos->Fecha_Actualizacion ?>'
                                )">
                                    <i class="bi bi-pencil-square"></i> Editar
                                </button>
                                <?php endif; ?>

                                <?php if ($permiso_eliminacion == 1) : ?>
                                <form id="deleteForm" method="POST" action="modelos/delete_permiso.php" style="display: inline;">
                                    <input type="hidden" name="id" value="<?= $datos->id_permisos ?>">
                                    <button type="submit" class="btn btn-eliminar">
                                        <i class="bi bi-trash"></i> Eliminar
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

    <!-- Modal para editar usuario -->
    <div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">EDITAR PERMISOS</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="modelos/update_permiso.php">
                <div class="form-group" style="display: none;">>
                <label for="id_permisos">ID Permiso:</label>
                 <input type="text" class="form-control" id="id_permisos" name="id_permisos" readonly>
                </div>
                    <div class="form-group">
                        <label for="id_rol">Rol:</label>
                        <select class="form-control" id="id_rol" name="id_rol" required>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de id_sector desde tbl_sector
                            $sqlRoles = "SELECT Id_rol , Nombre FROM roles";

                            // Ejecutar la consulta
                            $resultRoles = mysqli_query($conexion, $sqlRoles);

                            if (mysqli_num_rows($resultRoles) > 0) {
                                while ($rowRoles = mysqli_fetch_assoc($resultRoles)) {
                                    // Genera opciones para cada valor de id_sector
                                    echo '<option value="' . $rowRoles["Id_rol"] . '">' . $rowRoles["Nombre"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay Roles disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="permiso_eliminacion">Permiso Eliminar:</label>
                        <select class="form-control" id="permiso_eliminacion" name="permiso_eliminacion" required>
                            <option value="1">SI</option>
                            <option value="0">NO</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="permiso_actualizacion">Permiso Actualizar:</label>
                        <select class="form-control" id="permiso_actualizacion" name="permiso_actualizacion" required>
                            <option value="1">SI</option>
                            <option value="0">NO</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="permiso_insercion">Permiso Insertar:</label>
                        <select class="form-control" id="permiso_insercion" name="permiso_insercion" required>
                            <option value="1">SI</option>
                            <option value="0">NO</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="permiso_insercion">Permiso Consulta:</label>
                        <select class="form-control" id="permiso_consulta" name="permiso_consulta" required>
                            <option value="1">SI</option>
                            <option value="0">NO</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Actualizar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

    <!-- Modal para crear usuario -->
    <div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" role="document">
                <div class="modal-header" style="background-color: #17A2B8;">
                    <h5 class="poppins-modal mb-2" id="exampleModalLabel">Crear Usuario</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="POST" action="modelos\insert_permisos.php">
                    <div class="form-group">
                            <label for="id_rol">Rol:</label>
                            <select class="form-control" id="id_rol" name="id_rol" required>
                                <?php
                                // Conexión a la base de datos
                                include '../php/conexion_be.php';

                                // Consulta SQL para obtener los valores disponibles de id_sector desde tbl_sector
                                $sql = "SELECT Id_rol , Nombre FROM roles";

                                // Ejecutar la consulta
                                $result = mysqli_query($conexion, $sql);

                                if (mysqli_num_rows($result) > 0) {
                                    while ($row = mysqli_fetch_assoc($result)) {
                                        // Genera opciones para cada valor de id_sector
                                        echo '<option value="' . $row["Id_rol"] . '">' . $row["Nombre"] . '</option>';
                                    }
                                } else {
                                    echo '<option value="">No hay Categorias disponibles</option>';
                                }

                                // Cierra la conexión a la base de datos
                                mysqli_close($conexion);
                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="permiso_eliminacion">Permiso Eliminar:</label>
                            <select class="form-control" id="permiso_eliminacion" name="permiso_eliminacion" required>
                            <option value="1">SI</option>
                            <option value="2">NO</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="permiso_actualizacion">Permiso Actualizar:</label>
                            <select class="form-control" id="permiso_actualizacion" name="permiso_actualizacion" required>
                            <option value="1">SI</option>
                            <option value="2">NO</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="permiso_insercion">Permiso Insertar:</label>
                            <select class="form-control" id="permiso_insercion" name="permiso_insercion" required>
                            <option value="1">SI</option>
                            <option value="2">NO</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="permiso_insercion">Permiso Consulta:</label>
                            <select class="form-control" id="permiso_consulta" name="permiso_consulta" required>
                            <option value="1">SI</option>
                            <option value="2">NO</option>
                            </select>
                        </div>
                        <!-- Agregar más campos si es necesario -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <button type="submit" class="btn btn-primary">Crear Permiso</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript para manejar la edición de usuarios -->
    <script>
    // Función para abrir el modal de edición
    function abrirModalEditar(id_permisos, id_rol, permiso_eliminacion, permiso_actualizacion, permiso_insercion, permiso_consulta, actualizado_por, fecha_actualizacion) {
        document.getElementById("id_permisos").value = id_permisos; // Modificado a "id_permisos"
        document.getElementById("id_rol").value = id_rol;
        document.getElementById("permiso_eliminacion").value = permiso_eliminacion;
        document.getElementById("permiso_actualizacion").value = permiso_actualizacion;
        document.getElementById("permiso_insercion").value = permiso_insercion;
        document.getElementById("permiso_consulta").value = permiso_consulta;
        document.getElementById("actualizado_por").value = actualizado_por;
        document.getElementById("fecha_actualizacion").value = fecha_actualizacion;

        $('#modalEditar').modal('show'); // Mostrar el modal de edición
    }
</script>


    <!--------------------------------------------------------------------------------------
    ---------------------------------ALERTAS----------------------------------------------
    ---------------------------------------------------------------------------------------->

    <!-- Script para mostrar el mensaje al momento de editar un usuario-->
    <script>
        $(document).ready(function() {
            $("#formularioEditar").on("submit", function(event) {
                event.preventDefault();

                $.ajax({
                    url: "modelos/update_permiso.php",
                    method: "POST",
                    data: $(this).serialize(),
                    success: function(response) {
                        if (response == "success") {
                            Swal.fire({
                                title: "Error",
                                text: "Hubo un problema al actualizar.",
                                icon: "error",
                                confirmButtonText: "Cerrar"
                            }).then(function() {
                                location.reload(); // Recarga la página
                            });
                        } else {
                            Swal.fire({
                                title: "Actualizado correctamente",
                                text: "se ha actualizado correctamente.",
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
                    text: "Esta acción eliminará la gestion. Esta acción no se puede deshacer.",
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
                                        text: "Hubo un problema al eliminar.",
                                        icon: "error",
                                        confirmButtonText: "Cerrar"
                                    }).then(function() {
                                        location.reload(); // Recarga la página
                                    });
                                    
                                } else {
                                    Swal.fire({
                                        title: "Eliminado correctamente",
                                        text: "Se ha eliminado correctamente.",
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
                    info: "Mostrando del elemento START al END de un total de TOTAL elementos",
                    infoEmpty: "No existen datos.",
                    infoFiltered: "(filtrado de MAX elementos en total)",
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