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
    <div class="container">
        <div class="row">
            <div class="col-sm">
                <button type="button" class="btn btn-success" id="excelButton"><i class="fas fa-file-excel"></i>&nbsp;Generar Reporte de Bítacora</button>
            </div>
            <div class="col-sm">
                <form action="" method="post" id="eliminarTrigger">
                    <button type="submit" class="btn btn-danger" name="tipo" value="Eliminar Triggers"><i class="fas fa-ban"></i>&nbsp;Desactivar Bitácora</button>
                </form>
            </div>
            <div class="col-sm">
                <form action="" method="post" id="crearTrigger">
                    <button type="submit" class="btn btn-primary"name="tipo" value="Eliminar Triggers"><i class="fas fa-check-circle"></i>&nbsp;Reactivar Bitácora</button>
                </form>
            </div>
        </div>
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
        $sql = $conexion->query("SELECT * FROM bitacoras order by id_bitacora desc");
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
<!-- JavaScript para manejar la edición de usuarios -->
<script>
    $(document).ready(function() {
        $('#eliminarTrigger').submit(function(e) {
            e.preventDefault(); // Evitar la recarga de la página

            // Realizar la solicitud AJAX
            $.ajax({
                type: 'GET',
                url: 'modelos/datosTrigger.php',
                data: {tipo: 'Eliminar'},
                success: function(response) {
                    console.error(response);
                    CargarContenido('vistas/Bitacora.php','content-wrapper');
                    //location.reload()
                },
                error: function(error) {
                    // Manejar el error si es necesario
                    console.error(error);
                }
            });
        });
    });


    $(document).ready(function() {
        $('#crearTrigger').submit(function(e) {
            e.preventDefault(); // Evitar la recarga de la página

            // Realizar la solicitud AJAX
            $.ajax({
                type: 'GET',
                url: 'modelos/datosTrigger.php',
                data: {tipo: 'Crear'},
                success: function(response) {
                    console.error(response);
                    //location.reload()
                },
                error: function(error) {
                    // Manejar el error si es necesario
                    console.error(error);
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