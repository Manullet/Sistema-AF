<?php
session_start();
$_SESSION['url'] = 'vistas/Mantenimiento_Ficha.php';
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
<!-- DATATABLES -->
 <!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"> -->
    <!-- BOOTSTRAP -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">


<div class="containertable">
    <div class="d-flex justify-content-between align-items-end mb-4">
        <div>
            <h1 class="poppins-font mb-2">FICHA</h1>
            <br>
            <a href="#" data-bs-toggle="modal" data-bs-target="#modalForm" class="btn btn-info">
                <i class="bi bi-plus-square icono-grande"></i> Crear
            </a>
        </div>

    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.8/xlsx.full.min.js"></script>
    <!--  seleccion de registros -->

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


        <!--El diseño de la table cuando ya esté todo unido 
    <table id="tablax" class="table table-striped table-bordered" style="width:100%"> -->
    <table id="tablax" class="table table-hover">
            <thead class="table-dark text-center" style="background-color: #343A40;">
                <tr>
                    <th scope="col">Nº Ficha</th>
                    <th scope="col">Fecha Solicitud</th>
                    <th scope="col">Año Solicitud</th>
                    <th scope="col">Fecha Entrevista</th>
                    <th scope="col">Nombre Encuestador</th>
                    <th scope="col">Nombre Encuestado</th>
                    <th scope="col">Nombre Supervisor</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Estado</th>

                    <th scope="col">Acciones</th> <!-- Added text-center class here -->
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT * FROM fichas");
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                        <td><?= $datos->id_ficha  ?></td>
                        <td><?= $datos->fecha_solicitud ?></td>
                        <td><?= $datos->anio_solicitud ?></td>
                        <td><?= $datos->fecha_entrevista  ?></td>
                        <td><?= $datos->nombre_encuentrador ?></td>
                        <td><?= $datos->nombre_encuestador ?></td>
                        <td><?= $datos->nombre_supervisor  ?></td>

                        <td><?= $datos->descripcion ?></td>
                        <td><?php
                            if ($datos->estado == "A") {
                                echo '<span class="badge bg-success">Activo</span>';
                            } else {
                                echo '<span class="badge bg-danger">Inactivo</span>';
                            }
                            ?></td>
                        <td>
                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar
                            ('<?= $datos->id_ficha ?>', '<?= $datos->fecha_solicitud ?>', '<?= $datos->anio_solicitud ?>','<?= $datos->fecha_entrevista ?>', '<?= $datos->nombre_encuentrador ?>', '<?= $datos->nombre_encuestador ?>', '<?= $datos->nombre_supervisor ?>',  '<?= $datos->descripcion ?>',  '<?= $datos->estado ?>')">
                                <i class="bi bi-pencil-square"></i>
                                
                            </button>
                            <form id="deleteForm" method="POST" action="modelos/eliminar_ficha.php" style="display: inline;">
                                <input type="hidden" name="id_ficha" value="<?= $datos->id_ficha ?>">
                                <button type="submit" class="btn btn-eliminar">
                                    <i class="bi bi-trash"></i>
                                    
                                </button>
                            </form>
                            <button type="button" class="btn btn-warning" onclick=" CargarContenido('vistas/ver_ficha.php','content-wrapper',<?= $datos->id_ficha ?>)">
                                    <i class="bi bi-eye"></i>
                                    
                                </button>
                           
                            <p></p>
                            <form id="duplicar" method="POST" action="" style="display: inline;">
                                <input type="hidden" name="id_ficha" id="id_ficha_act" value="<?= $datos->id_ficha ?>">
                                <button type="button" class="btn btn-primary" onclick="duplicarFicha(<?= $datos->id_ficha ?>)">
                                    <i class="bi bi-clipboard2-check"></i>
                                    Crear Registro para nuevo año
                                </button>
                            </form>
                            <p></p>
                            
                                <button type="button" class="btn btn-primary" onclick=" CargarContenido('vistas/editar_ficha.php','content-wrapper',<?= $datos->id_ficha ?>)">
                                    <i class="bi bi-pencil-square"></i>
                                    Editar Ficha
                                </button>
                               
                                
                        </td>
                    </tr>
                <?php }
                ?>
            </tbody>
        </table>
    </div>

</div>

<!-- Modal para editar apoyo -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">EDITAR APOYOS</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="#">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="id_ficha">Código</label>
                                <input type="text" class="form-control" id="id_ficha" name="id_ficha" readonly>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="fecha_solicitud">Fecha Solicitud</label>
                                <input type="date" class="form-control" id="fecha_solicitud" name="fecha_solicitud" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="anio_solicitud">Año de Solicitud</label>
                                <input type="text" class="form-control" id="anio_solicitud" name="anio_solicitud" required>
                                <span id="error_message" style="color: red;"></span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="fecha_entrevista">Fecha Entrevista</label>
                                <input type="date" class="form-control" id="fecha_entrevista" name="fecha_entrevista" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    <div class="col-6">
                            <div class="form-group">
                                <label for="nombre_supervisor">Nombre Supervisor</label>
                                <input type="text" class="form-control" id="nombre_supervisor" name="nombre_supervisor" required>
                            </div>
                        </div>

                        


                        <div class="col-6">
                            <div class="form-group">
                                <label for="nombre_encuestador">Nombre Encuestado</label>
                                <input type="text" class="form-control" id="nombre_encuestador" name="nombre_encuestador" required>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                    <div class="col-6">
                            <div class="form-group">
                                <label for="nombre_encuentrador">Nombre Encuestador</label>
                                <input type="text" class="form-control" id="nombre_encuentrador" name="nombre_encuentrador" required>
                            </div>
                        </div>

                        


                        <div class="col-6">
                            <div class="form-group">
                                <label for="descripcion">Descripción</label>
                                <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                            </div>
                        </div>

                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="estado">Estado</label>
                            <select class="form-control" id="estado" name="estado" required>
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

<!-- FALTA AGREGAR LO DE EDITAR Y ELIMINAR PROCEDIMIENTO -->


<!-- Modal para crear apoyo -->
<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel"> CREAR APOYO</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos/agregar_ficha.php" method="POST">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group ">
                                <label for="codigo">Código Ficha</label>
                                <input type="text" class="form-control" id="codigo" placeholder="Código Ficha" value="<?php echo obtenerNumeroFicha($conexion); ?>" readonly>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="fecha_solicitud">Fecha Solicitud</label>
                                <input type="date" class="form-control" id="fecha_solicitud" name="fecha_solicitud" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="anio_solicitud">Año de Solicitud</label>
                                <input type="text" class="form-control" id="anio_solicitud" name="anio_solicitud" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="fecha_entrevista">Fecha Entrevista</label>
                                <input type="date" class="form-control" id="fecha_entrevista" name="fecha_entrevista" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="nombre_encuentrador">Nombre Encuentador</label>
                                <input type="text" class="form-control" id="nombre_encuentrador" name="nombre_encuentrador" pattern="[A-Za-z]+" title="Solo se permiten letras en este campo." oninput="validateInput(this)" required>
                                <span id="error_message" style="color: red;"></span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="nombre_encuestador">Nombre Encuestador</label>
                                <input type="text" class="form-control" id="nombre_encuestador" name="nombre_encuestador" pattern="[A-Za-z]+" title="Solo se permiten letras en este campo." oninput="validateInput(this)" required>
                                <span id="error_message" style="color: red;"></span>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="nombre_supervisor">Nombre Supervisor</label>
                                <input type="text" class="form-control" id="nombre_supervisor" name="nombre_supervisor" pattern="[A-Za-z]+" title="Solo se permiten letras en este campo." oninput="validateInput(this)" required>
                                <span id="error_message" style="color: red;"></span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="descripcion">Descripción</label>
                                <input type="text" class="form-control" id="descripcion" name="descripcion" pattern="[A-Za-z]+" title="Solo se permiten letras en este campo." oninput="validateInput(this)" required>
                                <span id="error_message" style="color: red;"></span>
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

<!-- JavaScript para manejar la edición de apoyo -->
<script>
    // Función para abrir el modal de edición
    function abrirModalEditar(
    id_ficha, fecha_solicitud, anio_solicitud,
    fecha_entrevista, nombre_encuentrador, nombre_encuestador,
    nombre_supervisor, descripcion, estado
) {
    document.getElementById("id_ficha").value = id_ficha;
    document.getElementById("fecha_solicitud").value = fecha_solicitud;
    document.getElementById("anio_solicitud").value = anio_solicitud;
    document.getElementById("fecha_entrevista").value = fecha_entrevista;
    document.getElementById("nombre_encuentrador").value = nombre_encuentrador;
    document.getElementById("nombre_encuestador").value = nombre_encuestador;
    document.getElementById("nombre_supervisor").value = nombre_supervisor;
    document.getElementById("descripcion").value = descripcion;
    document.getElementById("estado").value = estado;

    $('#modalEditar').modal('show'); // Mostrar el modal de edición
}
</script>

<script>
        function duplicarFicha(id){
            //let id= document.getElementById('id_ficha_act').value
            

            // Realizar la solicitud AJAX
            $.ajax({
                type: 'GET',
                url: 'modelos/duplicar_ficha.php',
                data: {ficha: id},
                success: function(response) {
                    const datos = JSON.parse(response)
                    console.log(datos.id)

                    CargarContenido('vistas/editar_ficha.php','content-wrapper',datos.id);
                    //location.reload()
                },
                error: function(error) {
                    // Manejar el error si es necesario
                    console.error(error);
                }
            });
        }

</script>

<!-- Script para mostrar el mensaje al momento de editar un apoyo-->
<script>
    $(document).ready(function() {
        $("#formularioEditar").on("submit", function(event) {
            event.preventDefault();

            $.ajax({
                url: "modelos/editar_ficha.php",
                method: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Apoyo actualizado correctamente",
                            text: "El apoyo se ha actualizado correctamente.",
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
                            text: "Hubo un problema al actualizar el apoyo.",
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
                text: "Esta acción eliminará el apoyo. Esta acción no se puede deshacer.",
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
                                    title: "Apoyo eliminado correctamente",
                                    text: "El apoyo se ha eliminado correctamente.",
                                    icon: "success",
                                    showCancelButton: false,
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: "Hubo un problema al eliminar el apoyo.",
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
<?php
include "../php/conexion_be.php";
function obtenerNumeroFicha($conexion)
{
    // Obtener el número actual de fichas
    $sql = "SELECT COUNT(*) as id_ficha FROM fichas";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();
    $numeroFicha = $row['id_ficha'] + 1;

    return $numeroFicha;
}

?>

<!-- JQUERY -->
<!-- <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script> -->

    <!-- DATATABLES -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
    </script>

    <!-- BOOTSTRAP -->
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
    </script>





<script>
    $(document).ready(function(){
        $('#tablax').DataTable({
            language: {
                    processing: "Tratamiento en curso...",
                    search: "Buscar&nbsp;:",
                    lengthMenu: "Agrupar de _MENU_ elementos",
                    info: "Mostrando del elemento _START_ al _END_ de un total de _TOTAL_ elementos",
                    infoEmpty: "No existen datos.",
                    infoFiltered: "(filtrado de _MAX_ elementos en total)",
                    infoPostFix: "",
                    loadingRecords: "Cargando...",
                    zeroRecords: "No se encontraron datos con tu busqueda",
                    emptyTable: "No hay datos disponibles en la tabla.",
                    paginate: {
                        first: "Primero",
                        previous: "Anterior",
                        next: "Siguiente",
                        last: "Ultimo"
                    },
                    aria: {
                        sortAscending: ": active para ordenar la columna en orden ascendente",
                        sortDescending: ": active para ordenar la columna en orden descendente"
                    }
                },
            
        });
    })


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