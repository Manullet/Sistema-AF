<?php 
session_start();
 $_SESSION['url'] = 'vistas/Bitacora.php';
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
            <h1 class="poppins-font mb-2">Bítacora</h1>
            <br>
        </div>

        <div class="mb-4 border-bottom">
            <form class="d-flex" role="search">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-search"></i></span>
                    </div>
                    <input class="form-control" id="searchInput" type="search" placeholder="Buscar ..." aria-label="Search">
                    
                </div>
                
            </form>

        </div>
    </div>  
    <div class="mt-3">
            <button type="button" class="btn btn-success" id="excelButton">Generar Reporte de Bítacora</button>
        </div>
<div>
    <p></p>
</div>

    <div class="table-responsive">
        

<table class="table table-hover">
    <thead class="table-dark text-center" style="background-color: #343A40;">
        <tr>
            <th scope="col">Id Bitacora</th>
            <th scope="col">Fecha</th>
            <th scope="col">Ejecutor</th>
            <th scope="col">Actividad Realizada</th>
            <th scope="col">Información Actual</th>
            <th scope="col">Información Anterior</th>
            <th scope="col">Tabla</th>
            <th scope="col">Información Eliminada</th>
            <th scope="col"></th>

        </tr>
    </thead>
    <tbody class="text-center">
        <?php
        include "../php/conexion_be.php";
        $sql = $conexion->query("SELECT * FROM bitacoras");
        while ($datos = $sql->fetch_object()) { ?>
            <tr>
                <td><?= $datos->id_bitacora ?></td>
                <td><?= $datos->fecha ?></td>
                <td><?= $datos->ejecutor ?></td>
                <td><?= $datos->actividad_realizada ?></td>
                <td><?= $datos->informacion_actual ?></td>
                <td><?= $datos->informacion_anterior ?></td>
                <td><?= $datos->tabla ?></td>
                <td><?= $datos->informacion_eliminada?></td>
                <td>
                    
                </td>
            </tr>
        <?php }
        ?>
    </tbody>
</table>
</div>
     <!-- Botón debajo de la imagen -->
     
    </div>
    

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
    <!-- ... (resto de tus scripts) ... -->

    <script>
        document.getElementById("excelButton").addEventListener("click", function() {
            // Redirigir a excel.php al hacer clic en el botón de Excel
            window.location.href = "reportes/bitacora_reporte.php";
        });
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.8/xlsx.full.min.js"></script>
    <!-- ... (resto de tus scripts) ... -->

    <script>
        document.getElementById("excelButton").addEventListener("click", function() {
            // Código para generar el archivo Excel usando SheetJS
            const data = [
                ["Nombre", "Edad"],
                ["Juan", 30],
                ["María", 25],
                ["Pedro", 28]
            ];
            const ws = XLSX.utils.aoa_to_sheet(data);
            const wb = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(wb, ws, "Hoja1");
            XLSX.writeFile(wb, "datos.xlsx");
        });
    </script>



   

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

<!-- Modal para editar -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">EDITAR</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="modelos/update_sector.php">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="id_sector">Id Sector</label>
                                <input type="text" class="form-control" id="id_sector" name="id_sector" readonly>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="sector">Sector </label>
                                <input type="text" class="form-control" id="sector_edit" name="sector" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-8">
                        <label for="descripcion" class="form-label">Descripción</label>
                        <textarea class="form-control" id="descripcion_edit" name="descripcion" rows="4"></textarea>
                      </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="estado">Estado</label>
                            <select class="form-control" id="estado_edit" name="estado" required>
                            <option value="" disabled selected>Selecciona un estado</option>
                                <option value="A">Activo</option>
                                <option value="I">Inactivo</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary" id="actualizarBtn">Actualizar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal para crear -->
<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" role="document">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">CREAR SECTOR</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos/insert_sector.php" method="POST">
                        <div class="col-8">
                            <label for="sector" class="form-label">Sector</label>
                            <input type="text" class="form-control" id="sector" name="sector">
                        </div>
                        <div class="col-8">
                        <label for="descripcion" class="form-label">Descripción</label>
                        <textarea class="form-control" id="descripcion" name="descripcion" rows="4"></textarea>
                      </div>
                        <div class="col-8">
                            <label for="estado">Estado</label>
                            <select class="form-control" id="estado" name="estado" required>
                            <option value="" disabled selected>Selecciona un estado</option>
                                <option value="A">Activo</option>
                                <option value="I">Inactivo</option>
                            </select>
                        </div>
                    <br>
                    <button type="submit" class="btn btn-success" name="btnnuevo" value="ok">Crear</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript para manejar la edición de usuarios -->
<script>
    // Función para abrir el modal de edición
    function abrirModalEditar(id_sector, sector, descripcion, creado_por, fecha_creacion, actualizado_por, fecha_actualizacion, estado) {
        document.getElementById("id_sector").value = id_sector;
        document.getElementById("sector_edit").value = sector;
        document.getElementById("descripcion_edit").value = descripcion;
        document.getElementById("creado_por").value = creado_por;
        document.getElementById("fecha_creacion").value = fecha_creacion;
        document.getElementById("actualizado_por").value = actualizado_por;
        document.getElementById("fecha_actualizacion").value = descripcion;
        document.getElementById("estado_edit").value = estado;

        $('#modalEditar').modal('show'); // Mostrar el modal de edición
    }
</script>



<script>
    $(document).ready(function() {
        $("#formularioEditar").on("submit", function(event) {
            event.preventDefault();

            $.ajax({
                url: "modelos/update_sector.php",
                method: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Registro actualizado correctamente",
                            text: "El Registro se ha actualizado correctamente.",
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
                            text: "Hubo un problema al actualizar el registro.",
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



<!-- Script para mostrar el mensaje al momento de eliminar un usuario-->
<script>
    $(document).ready(function() {
        $("form#deleteForm").on("submit", function(event) {
            event.preventDefault();

            var form = $(this);

            Swal.fire({
                title: "¿Estás seguro?",
                text: "Esta acción eliminará el periodo. Esta acción no se puede deshacer.",
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
                                    title: "Registro eliminado correctamente",
                                    text: "El Registro se ha eliminado correctamente.",
                                    icon: "success",
                                    showCancelButton: false,
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: "Hubo un problema al eliminar el Registro.",
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