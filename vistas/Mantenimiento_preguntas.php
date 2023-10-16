<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/estilos.css">

<div class="containertable">
    <div class="d-flex justify-content-between align-items-end mb-4">
        <div>
            <h1 class="poppins-font mb-2">MANTENIMIENTO PREGUNTAS</h1>
            <br>
            <a href="php\mant_preguntas.php" class="btn btn-info">
                <i class="nav-icon bi bi-question-circle"></i></i> Agregar pregunta
            </a>
        </div>

        <div class="mb-4 border-bottom">
            <form class="d-flex" role="search">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-search"></i></span>
                    </div>
                    <input class="form-control" id="searchInput" type="search" placeholder="Buscar objeto..." aria-label="Search">
                </div>
            </form>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-hover">
            <thead class="table-dark text-center" style="background-color: #343A40;">
                <tr>
                    <!--  AQUI PONEN LAS CABECERAS DE SU TABLA  -->
                    <th scope="col">Id</th>
                    <th scope="col">Pregunta</th>
                    <th scope="col">Actualizado por</th>
                    <th scope="col">Creado Por</th>
                    <th scope="col">Fecha Creación</th>
                    <th scope="col">Fecha Actualización</th>
                    <th scope="col">Acciones</th>
                </tr>
            </thead>
            <tbody class="text-center">
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

                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar
                            ('<?= $datos->Id_pregunta ?>', '<?= $datos->Pregunta ?>', '<?= $datos->Actualizado_Por ?>', '<?= $datos->Creador_Por ?>', '<?= $datos->Fecha_Creacion ?>','<?= $datos->Fecha_Actualizacion ?>')">
                                <i class="bi bi-pencil-square"></i>
                                Editar
                            </button>
                            <form method="POST" action="modelos/delete_objeto.php" style="display: inline;">
                                <input type="hidden" name="Id_pregunta" value="<?= $datos->Id_pregunta ?>">
                                <button type="button" class="btn btn-danger btn-eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar esta pregunta?')">
                                    <i class="bi bi-trash"></i>
                                    Eliminar
                                </button>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
