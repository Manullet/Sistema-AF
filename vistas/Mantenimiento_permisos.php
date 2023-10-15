<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Mantenimiento Permisos</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                    <li class="breadcrumb-item active">Mantenimiento Permisos</li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->


        <h1 class="text-center p-3">Permisos</h1> 
    <div class="cl-2 p-1">
        <a href="php\crear_permiso.php"><i class="btn btn btn-primary" style="color: #fafcff;">Crear</i></a>

        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Buscar</button>
                </form>
            </div>
        </nav>

        <div class="col-10 p-4">
            <table class="table">
                <thead class="bg-info">
                    <tr>
                        <th scope="col">Id_Permisos</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Nombre_Guard</th>
                        <th scope="col">Fecha_Creacion</th>
                        <th scope="col">Fecha_Actualizacion</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    include "../php/conexion_be.php";
                    $sql = $conexion->query("SELECT * FROM permisos");
                    while ($datos = $sql->fetch_object()) { ?>
                        <tr>
                            <td><?= $datos->Id_Permisos ?></td>
                            <td><?= $datos->Nombre ?></td>
                            <td><?= $datos->Nombre_Guard ?></td>
                            <td><?= $datos->Fecha_Creacion ?></td>
                            <td><?= $datos->Fecha_Actualizacion ?></td>
                            <td>
                                <button class="btn btn-primary btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar('<?= $datos->Id_Permisos ?>', '<?= $datos->Nombre ?>', '<?= $datos->Nombre_Guard ?>', '<?= $datos->Fecha_Creacion ?>', '<?= $datos->Fecha_Actualizacion ?>')">Editar</button>
                                <form method="POST" action="../SISTEMA-AF/modelos/delete_permiso.php" style="display: inline;">
                                <input type="hidden" name="Id_Permisos" value="<?= $datos->Id_Permisos ?>">
                                <button type="submit" class="btn btn-danger btn-eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?')">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    <?php }
                    ?>
                </tbody>
            </table> 

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
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Editar Permiso</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="formularioEditar" method="POST" action="../SISTEMA-AF/modelos/update_permiso.php">
                            <div class="form-group">
                                <label for="Id_Permisos">ID del Permiso:</label>
                                <input type="text" class="form-control" id="Id_Permisos" name="Id_Permisos" readonly>
                            </div>
                            <div class="form-group">
                                <label for="Nombre">Nombre:</label>
                                <input type="text" class="form-control" id="Nombre" name="Nombre" required>
                            </div>
                            <div class="form-group">
                                <label for="Nombre_Guard">Nombre_Guard:</label>
                                <input type="text" class="form-control" id="Nombre_Guard" name="Nombre_Guard" required>
                            </div>
                         <!--    <div class="form-group">
                                <label for="Fecha_Creacion">Fecha_Creacion:</label>
                                <input type="date" class="form-control" id="Fecha_Creacion" name="Fecha_Creacion" required>
                            </div> -->
                            <div class="form-group">
                                <label for="Fecha_Actualizacion">Fecha_Actualizacion:</label>
                                <input type="date" class="form-control" id="Fecha_Actualizacion" name="Fecha_Actualizacion" required>
                            </div>
                      <!--      <div class="form-group">
                                <label for="estado">Estado:</label>
                                <input type="text" class="form-control" id="estado" name="estado" required>
                            </div>    -->
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
                        <h4 class="modal-title">Permiso actualizado correctamente</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>El Permiso se ha actualizado correctamente.</p>
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
            function abrirModalEditar(Id_Permisos, Nombre, Nombre_Guard, Fecha_Creacion, Fecha_Actualizacion) {
                document.getElementById("Id_Permisos").value = Id_Permisos;
                document.getElementById("Nombre").value = Nombre;
                document.getElementById("Nombre_Guard").value = Nombre_Guard;
                document.getElementById("Fecha_Creacion").value = Fecha_Creacion;
                document.getElementById("Fecha_Actualizacion").value = Fecha_Actualizacion;
                
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

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>




    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<div class="content">
    <div class="container-fluid">

        <!-- /.row -->
    </div><!-- /.container-fluid -->
</div>