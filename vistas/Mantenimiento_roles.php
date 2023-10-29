<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/estilos.css">

<div class="containertable">
    <div class="d-flex justify-content-between align-items-end mb-4">
        <div>
            <h1 class="poppins-font mb-2">MANTENIMIENTO ROLES</h1>
            <br>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#miModal">
            <i class="nav-icon bi bi-shield-lock"></i> Crear nuevo rol
            </button>
        </div>

        <div class="mb-4 border-bottom">
            <form class="d-flex" role="search">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-search"></i></span>
                    </div>
                    <input class="form-control" id="searchInput" type="search" placeholder="Buscar Rol..." aria-label="Search">
                </div>
            </form>
        </div>
    </div>
    <div class="modal fade" id="miModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Agregar Rol</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="POST" action="php/insert_roles.php">
                        <div class="form-group">
                            <label for="Nombre">Nombre:</label>
                            <input type="text" class="form-control" id="Nombre" name="Nombre" required>
                        </div>
                        <div class="form-group">
                            <label for="Descripcion">Descripcion:</label>
                            <input type="text" class="form-control" id="Descripcion" name="Descripcion" required>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <button type="submit" class="btn btn-primary">Confirmar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-hover">
            <thead class="table-dark text-center" style="background-color: #343A40;">
            <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Acciones</th>
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT * FROM roles");
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                        <td><?= $datos->Id_rol ?></td>
                        <td><?= $datos->Nombre ?></td>
                        <td><?= $datos->Descripcion ?></td>
                        <td><?= $datos->STATUS ?></td>
                        <td>
                        <button class="btn btn-primary btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar('<?= $datos->Id_rol ?>', '<?= $datos->Nombre ?>', '<?= $datos->Descripcion ?>', '<?= $datos->STATUS ?>')">Editar</button>

                                <form method="POST" action="php/delete_roles.php" style="display: inline;"> 
                                <input type="hidden" name="Id_rol" value="<?= $datos->Id_rol ?>">
                                <button type="submit" class="btn btn-danger btn-eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar este rol?')">Eliminar</button>
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


<!-- Modal para editar ROLES -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar Roles</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="php/update_roles.php">
                    <div class="form-group">
                    <label for="Id_rol">ID del Rol:</label>
                            <input type="text" class="form-control" id="Id_rol" name="Id_rol" readonly>
                        </div>
                        <div class="form-group">
                            <label for="Nombre">Nombre:</label>
                            <input type="text" class="form-control" id="Nombre" name="Nombre" required>
                        </div>
                        <div class="form-group">
                            <label for="Descripcion">Descripcion:</label>
                            <input type="text" class="form-control" id="Descripcion" name="Descripcion" required>
                        </div>
                        <div class="form-group">
                            <label for="STATUS">Status:</label>
                            <select class="form-control" id="STATUS" name="STATUS" required>
                                <option value="ACTIVO">Activo</option>
                                <option value="INACTIVO">Inactivo</option>
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

<!-- Modal de éxito -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <!-- Contenido del modal -->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Rol actualizado correctamente</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <p>El Rol se ha actualizado correctamente.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <a href="bienvenida.php" class="btn btn-primary">Ir a la página principal</a>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript para manejar la edición de usuarios -->
<script>
    // Función para abrir el modal de edición
    function abrirModalEditar(Id_rol, Nombre, Descripcion ,STATUS) {
        document.getElementById("Id_rol").value = Id_rol;
        document.getElementById("Nombre").value = Nombre;
        document.getElementById("Descripcion").value = Descripcion;
        document.getElementById("STATUS").value = STATUS;

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