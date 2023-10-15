<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Mantenimiento Objetos</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">inicio</a></li>
                    <li class="breadcrumb-item active">Mantenimiento Objetos</li>
                    
                </ol>
            </div><!-- /.col -->   
    <!-- <div class="actions">
        <a class="btn btn-primary" href='modelos/agregar_mant.php' >Nuevo Objeto</a>-->  
    </div>   
        </div><!-- /.row -->



        
        <h1 class="text-center p-3">Objetos</h1> 
    <div class="cl-2 p-1">
        <a href="php\crear.php"><i class="btn btn btn-primary" style="color: #fafcff;">Crear</i></a>

        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </nav>

        <div class="col-10 p-4">
            <table class="table">
                <thead class="bg-info">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Correo</th>
                        <th scope="col">Contraseña</th>
                        <th scope="col">Usuario</th>
                        <th scope="col">Estado Creacion</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    include "../php/conexion_be.php";
                    $sql = $conexion->query("SELECT * FROM usuario");
                    while ($datos = $sql->fetch_object()) { ?>
                        <tr>
                            <td><?= $datos->Id_Usuario?></td>
                            <td><?= $datos->Nombre ?></td>
                            <td><?= $datos->Correo ?></td>
                            <td><?= $datos->Contraseña  ?></td>
                            <td><?= $datos->Usuario ?></td>
                            <td><?= $datos->Estado ?></td>
                            <td>
                                <button class="btn btn-primary btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar('<?= $datos->Id_Usuario ?>', '<?= $datos->Nombre ?>', '<?= $datos->Correo ?>', '<?= $datos->Usuario ?>', '<?= $datos->Estado ?>')">Editar</button>
                                <form method="POST" action="modelos/delete_usuario.php" style="display: inline;">
                                <input type="hidden" name="Id_Usuario" value="<?= $datos->Id_Usuario?>">
                                <button type="submit" class="btn btn-danger btn-eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar este objeto?')">Eliminar</button>
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
                        <h5 class="modal-title" id="exampleModalLabel">Editar usuario</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="formularioEditar" method="POST" action="modelos/update_usuario.php">
                            <div class="form-group">
                                <label for="Id_Usuario">Id_Usuario:</label>
                                <input type="text" class="form-control" id="Id_Usuario" name="Id_Usuario" readonly>
                            </div>
                            <div class="form-group">
                                <label for="Nombre">Nombre:</label>
                                <input type="text" class="form-control" id="Nombre" name="Nombre" required>
                            </div>
                            <div class="form-group">
                                <label for="Correo">Correo:</label>
                                <input type="text" class="form-control" id="Correo" name="Correo" required>
                            </div>
                            <div class="form-group">
                                <label for="Usuario">Usuario:</label>
                                <input type="text" class="form-control" id="Usuario" name="Usuario" required>
                            </div>
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
                        <h4 class="modal-title">usuario actualizado correctamente</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>El usuario se ha actualizado correctamente.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <a href="index.php" class="btn btn-primary">Ir a la página principal</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- JavaScript para manejar la edición de usuarios -->
        <script>
            // Función para abrir el modal de edición
            function abrirModalEditar(Id_Usuario, Nombre, Correo, Usuario, Estado) {
                document.getElementById("Id_Usuario").value = Id_Usuario;
                document.getElementById("Nombre").value = Nombre;
                document.getElementById("Correo").value = Correo;
                //document.getElementById("Contraseña").value = Contraseña;
                document.getElementById("Usuario").value = Usuario;
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