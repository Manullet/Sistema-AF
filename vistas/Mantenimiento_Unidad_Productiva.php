<?php
session_start();
$_SESSION['url'] = 'vistas/Mantenimiento_Unidad_Productiva.php';
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
            <h1 class="poppins-font mb-2">UNIDAD PRODUCTIVA</h1>
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
                    <input class="form-control" id="searchInput" type="search" placeholder="Buscar Unidad..." aria-label="Search">
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
                    <th scope="col">Tipo de Manejo</th>
                    <th scope="col">Superficie Produccion</th>
                    <th scope="col">Superficie Agricultura</th>
                    <th scope="col">Superficie Ganaderia</th>
                    <th scope="col">Superficie Apicultura</th>
                    <th scope="col">Superficie Forestal</th>
                    <th scope="col">Superficie Acuacultura</th>
                    <th scope="col">Nº Estanques</th>
                    <th scope="col">Superficie Agroturismo</th>
                    <th scope="col">Otra Descripcion</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Acciones</th> <!-- Added text-center class here -->
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT
                UP.*,
                P.primer_nombre,
                F.id_ficha,
                MT.id_medida
            FROM
                tbl_unidad_productora UP
                INNER JOIN tbl_productor P ON UP.Id_Productor = P.id_productor
                INNER JOIN fichas F ON UP.Id_Ficha = F.id_ficha
                LEFT JOIN tbl_medidas_tierra MT ON UP.Id_Medida_Produccion = MT.id_medida;
            ");
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                        <td><?= $datos->Id_Unidad_Productiva ?></td>
                        <td><?= $datos->Tipo_De_Manejo ?></td>
                        <td><?= $datos->Superficie_Produccion ?></td>
                        <td><?= $datos->Superficie_Agricultura ?></td>
                        <td><?= $datos->Superficie_Ganaderia ?></td>
                        <td><?= $datos->Superficie_Apicultura ?></td>
                        <td><?= $datos->Superficie_Forestal ?></td>
                        <td><?= $datos->Superficie_Acuacultura ?></td>
                        <td><?= $datos->Numero_Estanques ?></td>
                        <td><?= $datos->Superficie_Agroturismo ?></td>
                        <td><?= $datos->Otros_Descripcion ?></td>
                        <td><?= $datos->Descripcion ?></td>

                        <td><?php
                            if ($datos->estado == "A") {
                                echo '<span class="badge bg-success">Activo</span>';
                            } else {
                                echo '<span class="badge bg-danger">Inactivo</span>';
                            }
                            ?></td>
                        <td>
                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar
                            ('<?= $datos->Id_Unidad_Productiva ?>', '<?= $datos->Tipo_De_Manejo ?>', '<?= $datos->Numero_Estanques ?>', '<?= $datos->Estado ?>', '<?= $datos->Creado_Por ?>', '<?= $datos->Fecha_Creacion ?>')">
                                <i class="bi bi-pencil-square"></i>
                                Editar
                            </button>
                            <form id="deleteForm" method="POST" action="modelos/eliminar_unidad_productiva.php" style="display: inline;">
                                <input type="hidden" name="Id_Unidad_Productiva" value="<?= $datos->Id_Unidad_Productiva ?>">
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

<!-- Modal para editar Unidades Productras -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">EDITAR UNIDAD PRODUCTIVA</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="#">
                    <div class="row mb-3">
                        <div class="col">
                            <label for="Id_Ubicacion" class="form-label">ID Ubicación</label>
                            <input type="text" class="form-control" id="Id_Ubicacion" name="Id_Ubicacion" readonly>
                        </div>
                        <div class="col">
                            <label for="Id_Ficha" class="form-label">ID Ficha</label>
                            <input type="text" class="form-control" id="Id_Ficha" name="Id_Ficha" readonly>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Id_Productor" class="form-label">ID Productor</label>
                            <input type="text" class="form-control" id="Id_Productor" name="Id_Productor" readonly>
                        </div>
                        <div class="col">
                            <label for="Tipo_De_Manejo" class="form-label">Tipo de Manejo</label>
                            <select class="form-control" id="Tipo_De_Manejo" name="Tipo_De_Manejo">
                                <option value="Propia">Propia</option>
                                <option value="Alquilada">Alquilada</option>
                                <option value="Prestada">Prestada</option>
                                <option value="Ejidal">Ejidal</option>
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Produccion" class="form-label">Superficie de Producción</label>
                            <input type="text" class="form-control" id="Superficie_Produccion" name="Superficie_Produccion">
                        </div>
                        <div class="col">
                            <label for="Id_Medida_Produccion" class="form-label">Medida de Producción</label>
                            <select class="form-control" id="Id_Medida_Produccion" name="Id_Medida_Produccion">
                                <!-- Opciones para la medida de producción -->
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Agricultura" class="form-label">Superficie de Agricultura</label>
                            <input type="text" class="form-control" id="Superficie_Agricultura" name="Superficie_Agricultura">
                        </div>
                        <div class="col">
                            <label for="Id_Medida_Agricultura" class="form-label">Medida de Agricultura</label>
                            <select class="form-control" id="Id_Medida_Agricultura" name="Id_Medida_Agricultura">
                                <!-- Opciones para la medida de agricultura -->
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Ganaderia" class="form-label">Superficie de Ganadería</label>
                            <input type="text" class="form-control" id="Superficie_Ganaderia" name="Superficie_Ganaderia">
                        </div>
                        <div class="col">
                            <label for="Id_Medida_Ganaderia" class="form-label">Medida de Ganadería</label>
                            <select class="form-control" id="Id_Medida_Ganaderia" name="Id_Medida_Ganaderia">
                                <!-- Opciones para la medida de ganadería -->
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Apicultura" class="form-label">Superficie de Apicultura</label>
                            <input type="text" class="form-control" id="Superficie_Apicultura" name="Superficie_Apicultura">
                        </div>
                        <div class="col">
                            <label for="Id_Medida_Apicultura" class="form-label">Medida de Apicultura</label>
                            <select class="form-control" id="Id_Medida_Apicultura" name="Id_Medida_Apicultura">
                                <!-- Opciones para la medida de apicultura -->
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Forestal" class="form-label">Superficie Forestal</label>
                            <input type="text" class="form-control" id="Superficie_Forestal" name="Superficie_Forestal">
                        </div>
                        <div class="col">
                            <label for="Id_Medida_Forestal" class="form-label">Medida Forestal</label>
                            <select class="form-control" id="Id_Medida_Forestal" name="Id_Medida_Forestal">
                                <!-- Opciones para la medida forestal -->
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Acuacultura" class="form-label">Superficie Acuacultura</label>
                            <input type="text" class="form-control" id="Superficie_Acuacultura" name="Superficie_Acuacultura">
                        </div>
                        <div class="col">
                            <label for="Numero_Estanques" class="form-label">Número de Estanques</label>
                            <input type="text" class="form-control" id="Numero_Estanques" name="Numero_Estanques">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Agroturismo" class="form-label">Superficie de Agroturismo</label>
                            <input type="text" class="form-control" id="Superficie_Agroturismo" name="Superficie_Agroturismo">
                        </div>
                        <div class="col">
                            <label for="Superficie_Otros" class="form-label">Superficie de Otros</label>
                            <input type="text" class="form-control" id="Superficie_Otros" name="Superficie_Otros">
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="Otros_Descripcion">Descripción de Otros</label>
                                <textarea class="form-control" id="Otros_Descripcion" name="Otros_Descripcion" rows="3"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="descripcion">Descripción</label>
                                <textarea class="form-control" id="descripcion" name="descripcion" rows="3"></textarea>
                            </div>
                        </div>
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
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">Unidad Productiva</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos\agregar_unidad_productiva.php" method="POST">
                    <div class="row mb-3">
                        <div class="col">
                            <label for="Id_Ubicacion" class="form-label">ID Ubicación</label>
                            <input type="text" class="form-control" id="Id_Ubicacion" name="Id_Ubicacion">
                        </div>
                        <div class="col">
                            <label for="Id_Ficha" class="form-label">ID Ficha</label>
                            <input type="text" class="form-control" id="Id_Ficha" name="Id_Ficha">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Id_Productor" class="form-label">ID Productor</label>
                            <input type="text" class="form-control" id="Id_Productor" name="Id_Productor">
                        </div>
                        <div class="col">
                            <label for="Tipo_De_Manejo" class="form-label">Tipo de Manejo</label>
                            <select class="form-control" id="Tipo_De_Manejo" name="Tipo_De_Manejo">
                                <option value="Propia">Propia</option>
                                <option value="Alquilada">Alquilada</option>
                                <option value="Prestada">Prestada</option>
                                <option value="Ejidal">Ejidal</option>
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Produccion" class="form-label">Superficie de Producción</label>
                            <input type="text" class="form-control" id="Superficie_Produccion" name="Superficie_Produccion">
                        </div>
                        <div class="col">
                            <label for="Id_Medida_Produccion" class="form-label">Medida de Producción</label>
                            <select class="form-control" id="Id_Medida_Produccion" name="Id_Medida_Produccion">
                                <!-- Opciones para la medida de producción -->
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Agricultura" class="form-label">Superficie de Agricultura</label>
                            <input type="text" class="form-control" id="Superficie_Agricultura" name="Superficie_Agricultura">
                        </div>
                        <div class="col">
                            <label for="Id_Medida_Agricultura" class="form-label">Medida de Agricultura</label>
                            <select class="form-control" id="Id_Medida_Agricultura" name="Id_Medida_Agricultura">
                                <!-- Opciones para la medida de agricultura -->
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Ganaderia" class="form-label">Superficie de Ganadería</label>
                            <input type="text" class="form-control" id="Superficie_Ganaderia" name="Superficie_Ganaderia">
                        </div>
                        <div class="col">
                            <label for="Id_Medida_Ganaderia" class="form-label">Medida de Ganadería</label>
                            <select class="form-control" id="Id_Medida_Ganaderia" name="Id_Medida_Ganaderia">
                                <!-- Opciones para la medida de ganadería -->
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Apicultura" class="form-label">Superficie de Apicultura</label>
                            <input type="text" class="form-control" id="Superficie_Apicultura" name="Superficie_Apicultura">
                        </div>
                        <div class="col">
                            <label for="Id_Medida_Apicultura" class="form-label">Medida de Apicultura</label>
                            <select class="form-control" id="Id_Medida_Apicultura" name="Id_Medida_Apicultura">
                                <!-- Opciones para la medida de apicultura -->
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Forestal" class="form-label">Superficie Forestal</label>
                            <input type="text" class="form-control" id="Superficie_Forestal" name="Superficie_Forestal">
                        </div>
                        <div class="col">
                            <label for="Id_Medida_Forestal" class="form-label">Medida Forestal</label>
                            <select class="form-control" id="Id_Medida_Forestal" name="Id_Medida_Forestal">
                                <!-- Opciones para la medida forestal -->
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Acuacultura" class="form-label">Superficie Acuacultura</label>
                            <input type="text" class="form-control" id="Superficie_Acuacultura" name="Superficie_Acuacultura">
                        </div>
                        <div class="col">
                            <label for="Numero_Estanques" class="form-label">Número de Estanques</label>
                            <input type="text" class="form-control" id="Numero_Estanques" name="Numero_Estanques">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="Superficie_Agroturismo" class="form-label">Superficie de Agroturismo</label>
                            <input type="text" class="form-control" id="Superficie_Agroturismo" name="Superficie_Agroturismo">
                        </div>
                        <div class="col">
                            <label for="Superficie_Otros" class="form-label">Superficie de Otros</label>
                            <input type="text" class="form-control" id="Superficie_Otros" name="Superficie_Otros">
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="Otros_Descripcion">Descripción de Otros</label>
                                <textarea class="form-control" id="Otros_Descripcion" name="Otros_Descripcion" rows="3"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="descripcion">Descripción</label>
                                <textarea class="form-control" id="descripcion" name="descripcion" rows="3"></textarea>
                            </div>
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

<!-- JavaScript para manejar la edición de aldeas -->
<script>
    // Función para abrir el modal de edición
    function abrirModalEditar(Id_Unidad_Productiva, Tipo_De_Manejo, Numero_Estanques, Estado) {
        document.getElementById("Id_Unidad_Productiva").value = Id_Unidad_Productiva;
        document.getElementById("Tipo_De_Manejo").value = Tipo_De_Manejo;
        document.getElementById("Numero_Estanques").value = Numero_Estanques;
        document.getElementById("Estado").value = Estado;

        $('#modalEditar').modal('show'); // Mostrar el modal de edición
    }
</script>

<!-- Script para mostrar el mensaje al momento de editar una aldea-->
<script>
    $(document).ready(function() {
        $("#formularioEditar").on("submit", function(event) {
            event.preventDefault();

            $.ajax({
                url: "modelos/editar_unidad_productiva.php",
                method: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Unidad Productiva actualizada correctamente",
                            text: "La unidad productiva se ha actualizado correctamente.",
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
                            text: "Hubo un problema al actualizar la unidad productiva.",
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
                text: "Esta acción eliminará la unidad productiva. Esta acción no se puede deshacer.",
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
                                    title: "Unidad productiva eleminada correctamente",
                                    text: "la unidad productiva se ha eliminado correctamente.",
                                    icon: "success",
                                    showCancelButton: false,
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: "Hubo un problema al eliminar la unidad productiva.",
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>