<?php 
session_start();
 $_SESSION['url'] = 'vistas/Mantenimiento_Cacerio.php';
 $_SESSION['content-wrapper'] = 'content-wrapper';
?>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/estilos.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<div class="containertable">
    <div class="d-flex justify-content-between align-items-end mb-4">
        <div>
            <h1 class="poppins-font mb-2">CACERIOS</h1>
            <br>
            <a href="#" data-bs-toggle="modal" data-bs-target="#modalForm" class="btn btn-info">
                <i class="bi bi-plus-square icono-grande"></i> Crear
            </a>
        </div>

        <div class="mb-4 border-bottom">
            <form class="d-flex" role="search">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-search"></i></span>
                    </div>
                    <input class="form-control" id="searchInput" type="search" placeholder="Buscar cacerio..." aria-label="Search">
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.8/xlsx.full.min.js"></script>
    <!--  seleccion de registros -->
    <div class="formulario-registros">
        <label for="cantidadRegistros" style="margin-left: 1350px;">Mostrar
            <select id="cantidadRegistros">
                <option value="10">10</option>
                <option value="20">20</option>
                <option value="30">30</option>
            </select>
            <span class="registros-text">Registros</span></label>
    </div>
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

        <table class="table table-hover">
            <thead class="table-dark text-center" style="background-color: #343A40;">
                <tr>
                    <th scope="col">Código</th>
                    <th scope="col">Departamento</th>
                    <th scope="col">Municipio</th>
                    <th scope="col">Aldea</th>
                    <th scope="col">Cacerio</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Fecha Creación</th>
                    <th scope="col">Estado</th>

                    <th scope="col">Acciones</th> <!-- Added text-center class here -->
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT C.*, D.Nombre_Departamento, M.Nombre_Municipio, A.Nombre_Aldea
                FROM tbl_cacerios C
                INNER JOIN tbl_aldeas A ON C.Id_Aldea = A.Id_Aldea
                INNER JOIN tbl_municipios M ON C.Id_Municipio = M.Id_Municipio
                INNER JOIN tbl_departamentos D ON C.Id_Departamento = D.Id_Departamento;
                ");
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                        <td><?= $datos->Id_Cacerio ?></td>
                        <td><?= $datos->Nombre_Departamento ?></td>
                        <td><?= $datos->Nombre_Municipio ?></td>
                        <td><?= $datos->Nombre_Aldea ?></td>
                        <td><?= $datos->Nombre_Cacerio ?></td>
                        <td><?= $datos->Descripcion ?></td>
                        <td><?= $datos->Fecha_Creacion ?></td>
                        <td><?php
                            if ($datos->Estado == "A") {
                                echo '<span class="badge bg-success">Activo</span>';
                            } else {
                                echo '<span class="badge bg-danger">Inactivo</span>';
                            }
                            ?></td>
                        <td>
                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar
                            ('<?= $datos->Id_Cacerio ?>', '<?= $datos->Nombre_Cacerio ?>', '<?= $datos->Descripcion ?>', '<?= $datos->Estado ?>', '<?= $datos->Id_Aldea ?>')">
                                <i class="bi bi-pencil-square"></i>
                                Editar
                            </button>
                            <form id="deleteForm" method="POST" action="modelos/eliminar_cacerio.php" style="display: inline;">
                                <input type="hidden" name="Id_Cacerio" value="<?= $datos->Id_Cacerio ?>">
                                <button type="submit" class="btn btn-eliminar">
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

<!-- Modal para editar departamentos -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">EDITAR CACERIOS</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="#">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Id_Cacerio">Código</label>
                                <input type="text" class="form-control" id="Id_Cacerio" name="Id_Cacerio" readonly>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Nombre_Cacerio"> Nombre </label>
                                <input type="text" class="form-control" id="Nombre_Cacerio" name="Nombre_Cacerio" required>
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

                    <div class="form-group">
                        <label for="Id_Aldea">Aldea:</label>
                        <select class="form-control" id="Id_Aldea" name="Id_Aldea" required>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Aldea
                            $sql = "SELECT Id_Aldea, Nombre_Aldea FROM Tbl_Aldeas";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del aldea como etiqueta y el ID como valor
                                    echo '<option value="' . $row["Id_Aldea"] . '">' . $row["Nombre_Aldea"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay aldeas disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
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

<!-- Modal para crear cacerios -->
<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" role="document">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">Caceria</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos/agregar_cacerio.php" method="POST">
                    <div class="row mb-3">
                        <div class="col">
                            <label for="Nombre_Cacerio" class="form-label">Nombre Cacerio</label>
                            <input type="text" class="form-control" id="Nombre_Cacerio" name="Nombre_Cacerio">
                        </div>
                        <div class="col">
                            <label for="Descripcion" class="form-label">Descripción</label>
                            <input type="text" class="form-control" id="Descripcion" name="Descripcion">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="Id_Aldea">Aldea</label>
                        <select class="form-control" id="Id_Aldea" name="Id_Aldea" required>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Aldea
                            $sql = "SELECT Id_Aldea, Nombre_Aldea FROM Tbl_Aldeas";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del aldea como etiqueta y el ID como valor
                                    echo '<option value="' . $row["Id_Aldea"] . '">' . $row["Nombre_Aldea"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay aldeas disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
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

<!-- JavaScript para manejar la edición de cacerios -->
<script>
    // Función para abrir el modal de edición
    function abrirModalEditar(Id_Cacerio, Nombre_Cacerio, Descripcion, Estado, Id_Aldea) {
        document.getElementById("Id_Cacerio").value = Id_Cacerio;
        document.getElementById("Nombre_Cacerio").value = Nombre_Cacerio;
        document.getElementById("Descripcion").value = Descripcion;
        document.getElementById("Estado").value = Estado;
        document.getElementById("Id_Aldea").value = Id_Aldea;

        $('#modalEditar').modal('show'); // Mostrar el modal de edición
    }
</script>

<!-- Script para mostrar el mensaje al momento de editar un cacerio-->
<script>
    $(document).ready(function() {
        $("#formularioEditar").on("submit", function(event) {
            event.preventDefault();

            $.ajax({
                url: "modelos/editar_cacerio.php",
                method: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Departamento actualizado correctamente",
                            text: "El Departamento se ha actualizado correctamente.",
                            icon: "success",
                            showCancelButton: false,
                            confirmButtonText: "Cerrar"
                        }).then(function() {
                            $("#modalEditar").modal("hide");
                            location.reload(); // Recarga la página
                        });
                    } else {
                        Swal.fire({
                            title: "Error",
                            text: "Hubo un problema al actualizar el departamento.",
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

<!-- Script para mostrar el mensaje al momento de eliminar un departamento-->
<script>
    $(document).ready(function() {
        $("form#deleteForm").on("submit", function(event) {
            event.preventDefault();

            var form = $(this);

            Swal.fire({
                title: "¿Estás seguro?",
                text: "Esta acción eliminará el departamento. Esta acción no se puede deshacer.",
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
                                    title: "Departamento eliminado correctamente",
                                    text: "El departamento se ha eliminado correctamente.",
                                    icon: "success",
                                    showCancelButton: false,
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: "Hubo un problema al eliminar el departamento.",
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>