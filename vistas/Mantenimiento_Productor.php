<?php
session_start();
$_SESSION['url'] = 'vistas/Mantenimiento_Productor.php';
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
    $sqlPermisos = "SELECT * FROM permisos WHERE Id_rol = $idRolUsuario AND id_objeto = 11";
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
<!-- DATATABLES -->
 <!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"> -->
    <!-- BOOTSTRAP -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">


<div class="containertable">
    <div class="d-flex justify-content-between align-items-end mb-4">
        <div>
            <h1 class="poppins-font mb-2">DATOS GENERALES</h1>
            <br>
            <?php if ($permiso_insercion == 1) : ?>
            <a href="#" data-bs-toggle="modal" data-bs-target="#modalForm" class="btn btn-info">
                <i class="bi bi-plus-square icono-grande"></i> Crear
            </a>
            <?php endif; ?>
        </div>
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

        <!--El diseño de la table cuando ya esté todo unido 
    <table id="tablax" class="table table-striped table-bordered" style="width:100%"> -->
    <table id="tablax" class="table table-hover">
            <thead class="table-dark text-center" style="background-color: #343A40;">
                <tr>
                    <th scope="col">Nº Ficha</th>
                    <th scope="col">Nº Productor</th>
                    <th scope="col">Primer Nombre</th>
                    <th scope="col">Primer Apellido</th>
                    <th scope="col">Identificacion</th>
                    <th scope="col">Genero</th>
                    <th scope="col">Estado civil</th>
                    <th scope="col">Telefono</th>
                    <th scope="col">Email</th>

                    <th scope="col">Estado</th>

                    <th scope="col">Acciones</th> <!-- Added text-center class here -->
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("SELECT tbl_productor.*, fichas.id_ficha FROM tbl_productor INNER JOIN fichas ON tbl_productor.id_ficha = fichas.id_ficha;");
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                        <td><?= $datos->id_ficha ?></td>
                        <td><?= $datos->id_productor ?></td>
                        <td><?= $datos->primer_nombre ?></td>
                        <td><?= $datos->primer_apellido ?></td>
                        <td><?= $datos->identificacion ?></td>
                        <td><?= $datos->genero ?></td>
                        <td><?= $datos->estado_civil ?></td>
                        <td><?= $datos->telefono_1 ?></td>
                        <td><?= $datos->email_1 ?></td>
                        
                        <td><?php
                            if ($datos->estado == "A") {
                                echo '<span class="badge bg-success">Activo</span>';
                            } else {
                                echo '<span class="badge bg-danger">Inactivo</span>';
                            }
                            ?></td>
                        <td>
                        <?php if ($permiso_actualizacion == 1) : ?>
                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar
                            ('<?= $datos->id_productor ?>', '<?= $datos->id_ficha ?>', '<?= $datos->primer_nombre ?>', '<?= $datos->segundo_nombre ?>', '<?= $datos->primer_apellido ?>', '<?= $datos->segundo_apellido ?>', '<?= $datos->identificacion ?>', '<?= $datos->fecha_nacimiento ?>', '<?= $datos->genero ?>', '<?= $datos->estado_civil ?>', '<?= $datos->nivel_escolaridad ?>', '<?= $datos->ultimo_grado_escolar_aprobado ?>', '<?= $datos->telefono_1 ?>', '<?= $datos->telefono_2 ?>', '<?= $datos->telefono_3 ?>', '<?= $datos->email_1 ?>', '<?= $datos->email_2 ?>', '<?= $datos->email_3 ?>', '<?= $datos->descripcion ?>', '<?= $datos->estado ?>')">
                                <i class="bi bi-pencil-square"></i>
                                Editar
                            </button>
                            <?php endif; ?>
 				
                            <p></p>
                            <?php if ($permiso_eliminacion == 1) : ?>
                            <form id="deleteForm" method="POST" action="modelos/eliminar_periodicidad.php" style="display: inline;">
                                <input type="hidden" name="id_periodo" value="<?= $datos->id_periodo ?>">
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


</div>

<!-- Modal para editar usuarios -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">EDITAR PRODUCTOR</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioEditar" method="POST" action="#">
                    <div class="row">
                        
                        <div class="col-6">
                            <div class="form-group">
                                <label for="id_ficha">ID Ficha</label>
                                <input type="text" class="form-control" id="id_ficha" name="id_ficha" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                            <div class="form-group" style="display: none;">
                                <input type="text" class="form-control" id="id_productor" name="id_productor" readonly>
                                <label for="id_productor">Código</label>
                            </div>
                        </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="primer_nombre">Primer Nombre</label>
                                <input type="text" class="form-control" id="primer_nombre" name="primer_nombre" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="segundo_nombre">Segundo Nombre</label>
                                <input type="text" class="form-control" id="segundo_nombre" name="segundo_nombre" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="primer_apellido">Primer Apellido</label>
                                <input type="text" class="form-control" id="primer_apellido" name="primer_apellido" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="segundo_apellido">Segundo Apellido</label>
                                <input type="text" class="form-control" id="segundo_apellido" name="segundo_apellido" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="identificacion">Identificación</label>
                                <input type="text" class="form-control" id="identificacion" name="identificacion" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="fecha_nacimiento">Fecha de Nacimiento</label>
                                <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="genero">Género</label>
                                <select class="form-control" id="genero" name="genero" required>
                                    <option value="" disabled selected>Selecciona el género</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Femenino">Femenino</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="estado_civil">Estado Civil</label>
                                <select class="form-control" id="estado_civil" name="estado_civil" required>
                                    <option value="" disabled selected>Selecciona el estado civil</option>
                                    <option value="Soltero(a)">Soltero(a)</option>
                                    <option value="Casado(a)">Casado(a)</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="nivel_escolaridad">Nivel de Escolaridad</label>
                                <input type="text" class="form-control" id="nivel_escolaridad" name="nivel_escolaridad" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="ultimo_grado_escolar_aprobado">Último Grado Escolar Aprobado</label>
                                <input type="text" class="form-control" id="ultimo_grado_escolar_aprobado" name="ultimo_grado_escolar_aprobado" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="telefono_1">Teléfono 1</label>
                                <input type="text" class="form-control" id="telefono_1" name="telefono_1" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="telefono_2">Teléfono 2</label>
                                <input type="text" class="form-control" id="telefono_2" name="telefono_2">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="telefono_3">Teléfono 3</label>
                                <input type="text" class="form-control" id="telefono_3" name="telefono_3">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="email_1">Correo Electrónico 1</label>
                                <input type="email" class="form-control" id="email_1" name="email_1" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="email_2">Correo Electrónico 2</label>
                                <input type="email" class="form-control" id="email_2" name="email_2">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="email_3">Correo Electrónico 3</label>
                                <input type="email" class="form-control" id="email_3" name="email_3">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    <div class="col-6">
                            <label for="estado">Estado</label>
                            <select class="form-control" id="estado" name="estado" required>
                                <option value="" disabled selected>Selecciona un estado</option>
                                <option value="A">Activo</option>
                                <option value="I">Inactivo</option>
                            </select>
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
                        <button type="submit" class="btn btn-actualizar">Actualizar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Modal para crear usuarios -->
<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" role="document">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">CREAR PERIODO </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos/agregar_datos_productor.php" method="POST">
                <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="id_ficha">ID Ficha</label>
                                <input type="text" class="form-control" id="id_ficha" name="id_ficha" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="primer_nombre">Primer Nombre</label>
                                <input type="text" class="form-control" id="primer_nombre" name="primer_nombre" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="segundo_nombre">Segundo Nombre</label>
                                <input type="text" class="form-control" id="segundo_nombre" name="segundo_nombre" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="primer_apellido">Primer Apellido</label>
                                <input type="text" class="form-control" id="primer_apellido" name="primer_apellido" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="segundo_apellido">Segundo Apellido</label>
                                <input type="text" class="form-control" id="segundo_apellido" name="segundo_apellido" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="identificacion">Identificación</label>
                                <input type="text" class="form-control" id="identificacion" name="identificacion" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="fecha_nacimiento">Fecha de Nacimiento</label>
                                <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="genero">Género</label>
                                <select class="form-control" id="genero" name="genero" required>
                                    <option value="" disabled selected>Selecciona el género</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Femenino">Femenino</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="estado_civil">Estado Civil</label>
                                <select class="form-control" id="estado_civil" name="estado_civil" required>
                                    <option value="" disabled selected>Selecciona el estado civil</option>
                                    <option value="Soltero(a)">Soltero(a)</option>
                                    <option value="Casado(a)">Casado(a)</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="nivel_escolaridad">Nivel de Escolaridad</label>
                                <input type="text" class="form-control" id="nivel_escolaridad" name="nivel_escolaridad" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="ultimo_grado_escolar_aprobado">Último Grado Escolar Aprobado</label>
                                <input type="text" class="form-control" id="ultimo_grado_escolar_aprobado" name="ultimo_grado_escolar_aprobado" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="telefono_1">Teléfono 1</label>
                                <input type="text" class="form-control" id="telefono_1" name="telefono_1" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="telefono_2">Teléfono 2</label>
                                <input type="text" class="form-control" id="telefono_2" name="telefono_2">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="telefono_3">Teléfono 3</label>
                                <input type="text" class="form-control" id="telefono_3" name="telefono_3">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="email_1">Correo Electrónico 1</label>
                                <input type="email" class="form-control" id="email_1" name="email_1" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="email_2">Correo Electrónico 2</label>
                                <input type="email" class="form-control" id="email_2" name="email_2">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="email_3">Correo Electrónico 3</label>
                                <input type="email" class="form-control" id="email_3" name="email_3">
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

<!-- JavaScript para manejar la edición de usuarios -->
<script>
    // Función para abrir el modal de edición
    function abrirModalEditar(id_productor, id_ficha, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, identificacion, fecha_nacimiento, genero, estado_civil, nivel_escolaridad, ultimo_grado_escolar_aprobado, telefono_1, telefono_2, telefono_3, email_1, email_2, email_3, descripcion, estado) {
        document.getElementById("id_productor").value = id_productor;
        document.getElementById("id_ficha").value = id_ficha;
        document.getElementById("primer_nombre").value = primer_nombre;
        document.getElementById("segundo_nombre").value = segundo_nombre;
        document.getElementById("primer_apellido").value = primer_apellido;
        document.getElementById("segundo_apellido").value = segundo_apellido;
        document.getElementById("identificacion").value = identificacion;
        document.getElementById("fecha_nacimiento").value = fecha_nacimiento;
        document.getElementById("genero").value = genero;
        document.getElementById("estado_civil").value = estado_civil;
        document.getElementById("nivel_escolaridad").value = nivel_escolaridad;
        document.getElementById("ultimo_grado_escolar_aprobado").value = ultimo_grado_escolar_aprobado;
        document.getElementById("telefono_1").value = telefono_1;
        document.getElementById("telefono_2").value = telefono_2;
        document.getElementById("telefono_3").value = telefono_3;
        document.getElementById("email_1").value = email_1;
        document.getElementById("email_2").value = email_2;
        document.getElementById("email_3").value = email_3;
        document.getElementById("descripcion").value = descripcion;

        document.getElementById("estado").value = estado;

        $('#modalEditar').modal('show'); // Mostrar el modal de edición
    }
</script>

<!-- Script para mostrar el mensaje al momento de editar un usuario-->
<script>
    $(document).ready(function() {
        $("#formularioEditar").on("submit", function(event) {
            event.preventDefault();

            $.ajax({
                url: "modelos/editar_datos_productor.php",
                method: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "Periodo actualizado correctamente",
                            text: "El periodo se ha actualizado correctamente.",
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
                            text: "Hubo un problema al actualizar el periodo.",
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
                                    title: "Periodo eliminado correctamente",
                                    text: "El periodo se ha eliminado correctamente.",
                                    icon: "success",
                                    showCancelButton: false,
                                    confirmButtonText: "Cerrar"
                                }).then(function() {
                                    location.reload(); // Recarga la página
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: "Hubo un problema al eliminar el periodo.",
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>