<?php 
session_start();
 $_SESSION['url'] = 'vistas/Mantenimiento_obejetos.php';
 $_SESSION['content-wrapper'] = 'content-wrapper';
 include "../php/conexion_be.php";
 // Definir permisos predeterminados
 $permiso_insercion = 2;
 $permiso_actualizacion = 2;
 $permiso_eliminacion = 2;
 
 // Verificar si la sesión 'usuario' está definida y no es un array
 if(isset($_SESSION['usuario'])) {
     $idRolUsuario = $_SESSION['usuario']['id_rol'];
 
     // Consultar los permisos del usuario para el objeto de usuarios (ID de objeto = 3)
     $sqlPermisos = "SELECT * FROM permisos WHERE Id_rol = $idRolUsuario AND id_objeto = 5";
     $resultadoPermisos = $conexion->query($sqlPermisos);
 
     if ($resultadoPermisos->num_rows > 0) {
         // Si se encuentran registros de permisos para el usuario y el objeto
         $filaPermisos = $resultadoPermisos->fetch_assoc();
         $permiso_insercion= $filaPermisos['permiso_insercion'];
         $permiso_actualizacion = $filaPermisos['permiso_actualizacion'];
         $permiso_eliminacion = $filaPermisos['permiso_eliminacion'];
     } 
 }



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
            <h1 class="poppins-font mb-2">MANTENIMIENTO OBJETOS</h1>
            <br>
            <?php if ($permiso_insercion == 1) : ?>
            <a href="#" data-bs-toggle="modal" data-bs-target="#modalForm" class="btn btn-info">
                <i class="nav-icon bi bi-people-fill"></i> Crear
            </a>
            <?php endif; ?>
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

     <!--  descargar excel -->
     <div class="center-vertical">
            </div>
            <!--  fin de descargar -->

             <!-- descargar PDF-->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>

            <script>
                document.getElementById("pdfButton").addEventListener("click", function() {
                    // Código para generar el PDF usando jsPDF
                    const pdf = new jsPDF();
                    pdf.text("Contenido del PDF", 10, 10);
                    pdf.save("documento.pdf");
                });
            </script>
             <!--  fin de descargar PDF-->

                 <!-- descargar EXCEL -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.8/xlsx.full.min.js"></script>

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

                  <!-- Fin descargar EXCEL-->



    <div class="table-responsive">

        <table class="table table-hover">
            <thead class="table-dark text-center" style="background-color: #343A40;">
                <tr>
                    <th scope="col">Id Objeto</th>
                    <th scope="col">Objeto</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Tipo de Objeto</th>
                    <th scope="col">Creado Por</th>
                    <th scope="col">Fecha Creación</th>
                    <th scope="col">Actualizado Por</th>
                    <th scope="col">Fecha Actualizacion</th>
                    <th scope="col">Estado</th>
                  
                    <th scope="col">Acciones</th> <!-- Added text-center class here -->
                   
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT * FROM objetos");
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                        <td><?= $datos->Id_objetos ?></td>
                        <td><?= $datos->Objeto ?></td>
                        <td><?= $datos->Descripcion ?></td>
                        <td><?= $datos->tipo_objeto ?></td>
                        <td><?= $datos->Creado_Por ?></td>
                        <td><?= $datos->Fecha_Creacion ?></td>
                        <td><?= $datos->Actualizado_Por ?></td>
                        <td><?= $datos->Fecha_Actualizacion ?></td>
                        <td><?php
                            if ($datos->Status == "A") {
                                echo '<span class="badge bg-success">Activo</span>';
                            } else {
                                echo '<span class="badge bg-danger">Inactivo</span>';
                            }
                            ?></td>
                        <td>
                        <?php if ($permiso_actualizacion == 1) : ?>
                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar
                            ('<?= $datos->Id_objetos ?>', '<?= $datos->Objeto ?>', '<?= $datos->Descripcion ?>', '<?= $datos->tipo_objeto ?>', '<?= $datos->Creado_Por ?>', '<?= $datos->Fecha_Creacion ?>', '<?= $datos->Actualizado_Por ?>', '<?= $datos->Fecha_Actualizacion ?>', '<?= $datos->estado ?>'  )">
                                <i class="bi bi-pencil-square"></i>
                                
                                Editar
                            </button>
                            <?php endif; ?>
 				<?php if ($permiso_eliminacion == 1) : ?>
                            <p></p>
                            
                            <form id="deleteForm" method="POST" action="modelos/delete_objeto.php" style="display: inline;">
                                <input type="hidden" name="Id_objetos" value="<?= $datos->Id_objetos ?>">
                                <button type="submit" class="btn btn-eliminar">
                                    <i class="bi bi-trash"></i>
                                    Eliminar
                                </button>
                            </form>
                            <?php endif; ?>
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
                <form id="formularioEditar" method="POST" action="modelos/update_objeto.php">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Id_objetos">Id Objeto</label>
                                <input type="text" class="form-control" id="Id_objetos" name="Id_objetos" readonly>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Objeto">Objeto </label>
                                <input type="text" class="form-control" id="Objeto_edit" name="Objeto" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-8">
                        <label for="Descripcion" class="form-label">Descripción</label>
                        <textarea class="form-control" id="Descripcion_edit" name="Descripcion" rows="4"></textarea>
                      </div>
                      <div class="col-6">
                            <div class="form-group">
                                <label for="tipo_objeto">Tipo de Objeto </label>
                                <input type="text" class="form-control" id="tipo_objeto_edit" name="tipo_objeto" required>
                            </div>
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
                <form action="modelos/insert_objeto.php" method="POST">
                        <div class="col-8">
                            <label for="Objeto" class="form-label">Objeto</label>
                            <input type="text" class="form-control" id="Objeto" name="Objeto">
                        </div>
                        <div class="col-8">
                        <label for="Descripcion" class="form-label">Descripción</label>
                        <textarea class="form-control" id="Descripcion" name="Descripcion" rows="4"></textarea>
                      </div>
                      <div class="col-8">
                            <label for="tipo_objeto" class="form-label">Tipo de Objeto</label>
                            <input type="text" class="form-control" id="tipo_objeto" name="tipo_objeto">
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
    function abrirModalEditar(Id_objetos, Objeto, Descripcion, tipo_objeto, Creado_Por, Fecha_Creacion, Actualizado_Por, Fecha_Actualizacion, Status) {
        document.getElementById("Id_objetos").value = Id_objetos;
        document.getElementById("Objeto_edit").value = Objeto;
        document.getElementById("Descripcion_edit").value = Descripcion;
        document.getElementById("tipo_objeto_edit").value = tipo_objeto;
        document.getElementById("Creado_Por").value = Creado_Por;
        document.getElementById("Fecha_Creacion").value = Fecha_Creacion;
        document.getElementById("Actualizado_Por").value = Actualizado_Por;
        document.getElementById("Fecha_Actualizacion").value = Fecha_Actualizacion;
        document.getElementById("Status").value = Status;

        $('#modalEditar').modal('show'); // Mostrar el modal de edición
    }
</script>



<script>
    $(document).ready(function() {
        $("#formularioEditar").on("submit", function(event) {
            event.preventDefault();

            $.ajax({
                url: "modelos/update_objeto.php",
                method: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Error",
                            text: "Hubo un problema al actualizar el registro.",
                            icon: "error",
                            confirmButtonText: "Cerrar"
                        }).then(function() {
                            $("#modalEditar").modal("hide");
                            location.reload(); // Recarga la página
                        });
                    } else if (response == "existe") {
                        Swal.fire({
                            title: "Error",
                            text: "Ya existe un objeto con el mismo nombre.",
                            icon: "error",
                            confirmButtonText: "Cerrar"
                        }).then(function() {
                            location.reload(); // Recarga la página
                        });
                    } else {
                        Swal.fire({
                            title: "Registro actualizado correctamente",
                            text: "El Registro se ha actualizado correctamente.",
                            icon: "success",
                            showCancelButton: false,
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
                                    title: "Error",
                                    text: "Hubo un problema al eliminar el Registro.",
                                    icon: "error",
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Registro eliminado correctamente",
                                    text: "El Registro se ha eliminado correctamente.",
                                    icon: "success",
                                    showCancelButton: false,
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