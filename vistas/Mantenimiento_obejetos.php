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
        <a href="php\mantenimiento_be.php"><i class="btn btn btn-primary" style="color: #fafcff;">Crear</i></a>

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
                        <th scope="col">Objeto</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Actualizado Por</th>
                        <th scope="col">Creado</th>
                        <th scope="col">Fecha Creacion</th>
                        <th scope="col">Fecha Actualizacon</th>
                        <th scope="col">Estado</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    include "../php/conexion_be.php";
                    $sql = $conexion->query("SELECT * FROM objetos");
                    while ($datos = $sql->fetch_object()) { ?>
                        <tr>
                            <td><?= $datos->Id_objetos?></td>
                            <td><?= $datos->Objeto ?></td>
                            <td><?= $datos->Descripcion ?></td>
                            <td><?= $datos->Actualizado_Por  ?></td>
                            <td><?= $datos->Creado_Por ?></td>
                            <td><?= $datos->Fecha_Creacion ?></td>
                            <td><?= $datos->Fecha_Actualizacon ?></td>
                            <td><?= $datos->Status ?></td>
                            <td>
                                <button class="btn btn-primary btn-editar" data-toggle="modal" data-target="#modalEditar"
                                 onclick="abrirModalEditar('<?= $datos->Id_objetos ?>', '<?= $datos->Objeto ?>', '<?= $datos->Descripcion ?>', '<?= $datos->Actualizado_Por ?>', '<?= $datos->Creado_Por ?>', '<?= $datos->Status ?>')">Editar</button>
                                <form method="POST" action="modelos/delete_objeto.php" style="display: inline;">
                                <input type="hidden" name="Id_objetos" value="<?= $datos->Id_objetos?>">
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
                        <h5 class="modal-title" id="exampleModalLabel">Editar Objeto</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="formularioEditar" method="POST" action="modelos/update_objeto.php">
                            <div class="form-group">
                                <label for="Id_objetos">ID del Objeto:</label>
                                <input type="text" class="form-control" id="Id_objetos" name="Id_objetos" readonly>
                            </div>
                            <div class="form-group">
                                <label for="Objeto">Objeto:</label>
                                <input type="text" class="form-control" id="Objeto" name="Objeto" required>
                            </div>
                            <div class="form-group">
                                <label for="Descripcion">Descripcion:</label>
                                <input type="text" class="form-control" id="Descripcion" name="Descripcion" required>
                            </div>
                            <div class="form-group">
                                <label for="Actualizado_Por">Actualizado_Por:</label>
                                <input type="text" class="form-control" id="Actualizado_Por" name="Actualizado_Por" required>
                            </div>
                            <div class="form-group">
                                <label for="Creado_Por">Creado_Por:</label>
                                <input type="text" class="form-control" id="Creado_Por" name="Creado_Por" readonly>
                            </div>
                            
                            <div class="form-group">
                                <label for="Fecha_Actualizacon">Fecha_Actualizacion:</label>
                                <input type="date" class="form-control" id="Fecha_Actualizacon" name="Fecha_Actualizacon" required>
                            </div>
                            <div class="form-group">
                                <label for="Status">Status:</label>
                                <input type="text" class="form-control" id="Status" name="Status" required>
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
                        <a href="index.php" class="btn btn-primary">Ir a la página principal</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- JavaScript para manejar la edición de usuarios -->
        <script>
            // Función para abrir el modal de edición
            function abrirModalEditar(Id_objetos, Objeto, Descripcion, Actualizado_Por, Creado_Por, Fecha_Creacion, Fecha_Actualizacon,Status) {
                document.getElementById("Id_objetos").value = Id_objetos;
                document.getElementById("Objeto").value = Objeto;
                document.getElementById("Descripcion").value = Descripcion;
                document.getElementById("Actualizado_Por").value = Actualizado_Por;
                document.getElementById("Creado_Por").value = Creado_Por;
                document.getElementById("Fecha_Creacion").value = Fecha_Creacion;
                document.getElementById(">Fecha_Actualizacon").value = Fecha_Actualizacon;
                document.getElementById("Status ").value = Status;
                
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