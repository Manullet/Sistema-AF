<?php 
session_start();
 $_SESSION['url'] = 'vistas/Mantenimiento_permisos.php';
 $_SESSION['content-wrapper'] = 'content-wrapper';
?>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/estilos.css">

<div class="containertable">
    <div class="d-flex justify-content-between align-items-end mb-4">
        <div>
            <h1 class="poppins-font mb-2">MANTENIMIENTO PERMISOS</h1>
            <br>
            <a href="php/crear_permiso.php" class="btn btn-info">
                <i class="nav-icon bi bi-gear"></i></i> Crear Permiso
            </a>
        </div>

        <div class="mb-4 border-bottom">
            <form class="d-flex" role="search">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-search"></i></span>
                    </div>
                    <input class="form-control" id="searchInput" type="search" placeholder="Buscar Permiso..." aria-label="Search">
                </div>
            </form>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-hover">
            <thead class="table-dark text-center" style="background-color: #343A40;">
                <tr>
                    <th scope="col">ID PERMISO</th>
                    <th scope="col">ROL</th>
                    <th scope="col">OBJETO</th>
                    <th scope="col">PERMISO ELIMINAR</th>
                    <th scope="col">PERMISO ACTUALIZAR</th>
                    <th scope="col">PERMISO CONSULTA</th>
                    <th scope="col">PERMISO INSERTAR</th>
                    <th scope="col">CREADO POR</th>
                    <th scope="col">FECHA CREACIÓN</th>
                    <th scope="col">ACTUALIZADO POR</th>
                    <th scope="col">FECHA ACTUALIZACIÓN</th>
                    <th scope="col">ESTADO</th>
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT * FROM permisos");
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                        <td><?= $datos->Id_Permisos ?></td>
                        <td><?= $datos->Id_rol ?></td>
                        <td><?= $datos->Id_objetos ?></td>
                        <td><?= $datos->permiso_eliminacion ?></td>
                        <td><?= $datos->permiso_actualizacion ?></td>
                        <td><?= $datos->permiso_consulta ?></td>
                        <td><?= $datos->permiso_insercion ?></td>
                        <td><?= $datos->Creado_Por ?></td>
                        <td><?= $datos->Fecha_Creacion ?></td>
                        <td><?= $datos->Actualizado_Por ?></td>
                        <td><?= $datos->Fecha_Actualizacion ?></td>
                        <td><?= $datos->Estado ?></td>
                        <td>
                        <button class="btn btn-primary btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar('<?= $datos->Id_Permisos ?>', '<?= $datos->Id_rol ?>', '<?= $datos->Id_objetos ?>', '<?= $datos->permiso_eliminacion ?>', '<?= $datos->permiso_actualizacion ?>', '<?= $datos->permiso_consulta ?>', '<?= $datos->permiso_insercion ?>', '<?= $datos->Creado_Por ?>', '<?= $datos->Fecha_Creacion ?>', '<?= $datos->Actualizado_Por ?>', '<?= $datos->Fecha_Actualizacion ?>', '<?= $datos->Estado ?>')">Editar</button>
                                <form method="POST" action="../SISTEMA-AF/modelos/delete_permiso.php" style="display: inline;">
                                <input type="hidden" name="Id_Permisos" value="<?= $datos->Id_Permisos ?>">
                                <button type="submit" class="btn btn-danger btn-eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?')">Eliminar</button>
                                </form>

                          <!--  <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar
                            ('<?= $datos->Id_Permisos ?>', '<?= $datos->Nombre ?>', '<?= $datos->Nombre_Guard ?>', '<?= $datos->Fecha_Creacion ?>', '<?= $datos->Fecha_Actualizacion ?>')">
                                <i class="bi bi-pencil-square"></i>
                                Editar
                            </button>

                            <form method="POST" action="../SISTEMA-AF/modelos/delete_permiso.php" style="display: inline;">
                            <input type="hidden" name="Id_Permisos" value="<?= $datos->Id_Permisos ?>">
                                <button type="button" class="btn btn-danger btn-eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar este permiso??')">
                                    <i class="bi bi-trash"></i>
                                    Eliminar
                                </button>
                            </form>      -->

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


<!-- Modal para editar permisos -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar Permiso</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="modelos/update_permiso.php">
                    <div class="form-group">
                        <label for="Id_Permisos">ID del Permiso:</label>
                        <input type="text" class="form-control" id="Id_Permisos" name="Id_Permisos" readonly>
                    </div>
                    <div class="form-group">
                        <label for="Id_rol">ROL:</label>
                        <input type="text" class="form-control" id="Id_rol" name="Id_rol" readonly>
                    </div>
                    <div class="form-group">
                        <label for="Id_objetos">OBJETOS:</label>
                        <input type="text" class="form-control" id="Id_objetos" name="Id_objetos" readonly>
                    </div>
                    <div class="form-group">
                        <label for="permiso_eliminacion">Permiso Eliminación:</label>
                        <input type="text" class="form-control" id="permiso_eliminacion" name="permiso_eliminacion" required>
                    </div>
                    <div class="form-group">
                        <label for="permiso_actualizacion">Permiso Actualizar:</label>
                        <input type="text" class="form-control" id="permiso_actualizacion" name="permiso_actualizacion" required>
                    </div>
                    <div class="form-group">
                        <label for="permiso_consulta">Permiso Consulta:</label>
                        <input type="text" class="form-control" id="permiso_consulta" name="permiso_consulta" required>
                    </div>
                    <div class="form-group">
                        <label for="permiso_insercion">Permiso Insertar:</label>
                        <input type="text" class="form-control" id="permiso_insercion" name="permiso_insercion" required>
                    </div>
                    <div class="form-group">
                        <label for="Actualizado_Por">Actualizado Por:</label>
                        <input type="text" class="form-control" id="Actualizado_Por" name="Actualizado_Por" required>
                    </div>
                 <!--   <div class="form-group">
                        <label for="Fecha_Actualizacion">Fecha_Actualizacion:</label>
                        <input type="date" class="form-control" id="Fecha_Actualizacion" name="Fecha_Actualizacion" required>
                    </div>  -->
                    <div class="form-group">
                        <label for="Estado">Estado:</label>
                        <input type="text" class="form-control" id="Estado" name="Estado" required>
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

<!-- Modal de éxito -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <!-- Contenido del modal -->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Objeto actualizado correctamente</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <p>El Objeto se ha actualizado correctamente.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <a href="../index.php" class="btn btn-primary">Ir a la página principal</a>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript para manejar la edición de usuarios -->
<script>
    // Función para abrir el modal de edición
    function abrirModalEditar(Id_Permisos, Id_rol, Id_objetos, permiso_eliminacion, permiso_actualizacion, permiso_consulta, permiso_insercion, Creado_Por, Fecha_Creacion, Actualizado_Por, Fecha_Actualizacion, Estado) {
        document.getElementById("Id_Permisos").value = Id_Permisos;
        document.getElementById("Id_rol").value = Id_rol;
        document.getElementById("Id_objetos").value = Id_objetos;
        document.getElementById("permiso_eliminacion").value = permiso_eliminacion;
        document.getElementById("permiso_actualizacion").value = permiso_actualizacion;
        document.getElementById("permiso_consulta").value = permiso_consulta;
        document.getElementById("permiso_insercion").value = permiso_insercion;
        document.getElementById("Creado_Por").value = Creado_Por;
        document.getElementById("Fecha_Creacion").value = Fecha_Creacion;
        document.getElementById("Actualizado_Por").value = Actualizado_Por;
        document.getElementById("Fecha_Actualizacion").value = Fecha_Actualizacion;
        document.getElementById("Fecha_Actualizacion").value = Fecha_Actualizacion;
        document.getElementById("Estado").value = Estado;
        $('#modalEditar').modal('show'); // Mostrar el modal de edición
    }
</script>

<!-- Código JavaScript para mostrar el modal de éxito después de actualizar -->
<?php
if (isset($_GET['success']) && $_GET['success'] === 'true') {
    echo '<script>
                    $(document).ready(function(){
                        $("#myModal").modal("show");
                    });
                  </script>';
}
?>



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