<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Mantenimiento Preguntas</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                    <li class="breadcrumb-item active">Mantenimiento Preguntas</li>
                    
                </ol>
            </div><!-- /.col -->   
    <!-- <div class="actions">
        <a class="btn btn-primary" href='modelos/agregar_mant.php' >Nueva Pregunta</a>-->  
    </div>   
        </div><!-- /.row -->



        
        <h1 class="text-center p-3">Preguntas</h1> 
    <div class="cl-2 p-1">
        <a href="php\mant_preguntas.php"><i class="btn btn btn-primary" style="color: #fafcff;">Crear Pregunta</i></a>
        
	<!--  AQUI EDITAN ADONDE SE VA A DIRIGIR CUANDO ABRAN EL DOCUMENTO DE AGREGAR   -->
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
<!--  AQUI PONEN LAS CABECERAS DE SU TABLA  -->
                        <th scope="col">Id</th>
                        <th scope="col">Pregunta</th>
                        <th scope="col">Actualizado por</th>
                        <th scope="col">creado Por</th>
                        <th scope="col">Fecha Creacion</th>
                        <th scope="col">Fecha Actualizacion</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    include "../php/conexion_be.php";
                    $sql = $conexion->query("SELECT * FROM preguntas");
                    while ($datos = $sql->fetch_object()) { ?>
                        <tr>
<!--  AQUI PONEN SUS VARIABLES COMO ESTAN EN LA BASE DE DATOS    -->
                            <td><?= $datos->Id_pregunta ?></td>
                            <td><?= $datos->Pregunta ?></td>
                            <td><?= $datos->Actualizado_Por  ?></td>
                            <td><?= $datos->Creador_Por ?></td>
                            <td><?= $datos->Fecha_Creacion ?></td>
                            <td><?= $datos->Fecha_Actualizacion ?></td>
                            <td>
                                
<!--  AQUI PONEN SUS VARIABLES COMO ESTAN EN LA BASE DE DATOS    -->
                                <button class="btn btn-primary btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar('<?= $datos->Id_pregunta ?>', '<?= $datos->Pregunta ?>', '<?= $datos->Actualizado_Por ?>', '<?= $datos->Creador_Por ?>', '<?= $datos->Fecha_Creacion ?>','<?= $datos->Fecha_Actualizacion ?>')">Editar</button>
                                <form method="POST" action="modelos/delete_preg.php" style="display: inline;">
                                <input type="hidden" name="Id_pregunta" value="<?= $datos->Id_pregunta?>">
                                <button type="submit" class="btn btn-danger btn-eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar esta pregunta?')">Eliminar</button>
                                    
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
                        <h5 class="modal-title" id="exampleModalLabel">Editar Pregunta</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <!-- Agregar un atributo data-* para pasar los datos desde la fila a la función abrirModalEditar -->

<!-- ... -->

<!-- Dentro del modal, ajusta los campos para reflejar los nombres de las variables y sus valores -->
<div class="modal-body">
    <form id="formularioEditar" method="POST" action="modelos/update_preg.php">
        <div class="form-group">
            <label for="Id_pregunta">ID Pregunta:</label>
            <input type="text" class="form-control" id="Id_pregunta" name="Id_pregunta" readonly>
        </div>
        <div class="form-group">
            <label for="Pregunta">Pregunta:</label>
            <input type="text" class="form-control" id="Pregunta" name="Pregunta" required>
        </div>
        <div class="form-group">
            <label for="Actualizado_Por">Actualizado Por:</label>
            <input type="text" class="form-control" id="Actualizado_Por" name="Actualizado_Por" required>
        </div>
        <div class="form-group">
            <label for="Creador_Por">Creado Por:</label>
            <input type="text" class="form-control" id="Creador_Por" name="Creador_Por" readonly>
        </div>
        <div class="form-group">
            <label for="Fecha_Creacion">Fecha Creacion:</label>
            <input type="date" class="form-control" id="Fecha_Creacion" name="Fecha_Creacion" readonly>
        </div>
        <div class="form-group">
            <label for="Fecha_Actualizacion">Fecha Actualizacion:</label>
            <input type="date" class="form-control" id="Fecha_Actualizacion" name="Fecha_Actualizacion" required>
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
                        <h4 class="modal-title">Pregunta actualizada correctamente</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>La pregunta se ha actualizado correctamente.</p>
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

		//AQUI NO HE TRABAJADO YO PERO AQUI PONEN LAS VARIABLES SU TABLA
            // Función para abrir el modal de edición
            function abrirModalEditar(Id_pregunta, Pregunta, Actualizado_Por, Creador_Por, Fecha_Creacion, Fecha_Actualizacion) {
                document.getElementById("Id_pregunta").value = Id_pregunta;
                document.getElementById("Pregunta").value = Pregunta;
                document.getElementById("Actualizado_Por").value = Actualizado_Por;
                document.getElementById("Creador_Por").value = Creador_Por;
                document.getElementById("Fecha_Creacion").value = Fecha_creacion;
                document.getElementById("Fecha_Actualizacion").value = Fecha_actualizacion;
                
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

<!-- Main content -->
<div class="content">
    <div class="container-fluid">

        <!-- /.row -->
    </div><!-- /.container-fluid -->
</div>