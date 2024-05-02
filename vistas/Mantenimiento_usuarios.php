<?php 
session_start();
 $_SESSION['url'] = 'vistas/Mantenimiento_usuarios.php';
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
                <h1 class="poppins-font mb-2">MANTENIMIENTO USUARIOS</h1>
                <br>
                <a href="#" data-bs-toggle="modal" data-bs-target="#modalForm" class="btn btn-info">
                    <i class="nav-icon bi bi-people-fill"></i> Crear
                </a>
            </div>

        <div class="mb-4 border-bottom">
            <form class="d-flex" role="search">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-search"></i></span>
                    </div>
                    <input class="form-control" id="searchInput" type="search" placeholder="Buscar..." aria-label="Search">
                </div>
            </form>
        </div>
    </div>

    <div class="table-responsive">
     <!--El diseño de la table cuando ya esté todo unido 
    <table id="tablax" class="table table-striped table-bordered" style="width:100%"> -->
    <table id="tablax" class="table table-hover">
            <thead class="table-dark text-center" style="background-color: #343A40;">
                <tr>
                <th scope="col">Id Usuario</th>
                <th scope="col">Nombre Completo</th>
                <th scope="col">Usuario</th>
                <th scope="col">Correo</th>
                <th scope="col">Rol</th>
                <th scope="col">Estado</th>
                <th scope="col">Acciones</th> <!-- Added text-center class here -->
                </tr>
            </thead>
            <tbody class="text-center">
                <?php
                include "../php/conexion_be.php";
                $sql = $conexion->query("
                SELECT 
                usuario.Id_Usuario,
                usuario.nombre_completo,
                usuario.usuario,
                usuario.correo,
                usuario.contrasena,
                usuario.id_estado,
                roles.nombre,
                roles.id_rol
                FROM usuario
                INNER JOIN roles ON usuario.Id_rol = roles.Id_rol
            ");
            
                while ($datos = $sql->fetch_object()) { ?>
                    <tr>
                        <td><?= $datos->Id_Usuario ?></td>
                        <td><?= $datos->nombre_completo ?></td>
                        <td><?= $datos->usuario ?></td>
                        <td><?= $datos->correo?></td>
                        <td><?= $datos->nombre?></td>

                        <td><?php
                            if ($datos->id_estado == 1) {
                                echo '<span class="badge bg-success">Activo</span>';
                            } else if($datos->id_estado == 2) {
                                echo '<span class="badge bg-info">Inactivo</span>';
                            }else if ($datos->id_estado == 3){
                                echo '<span class="badge bg-warning">Nuevo</span>';
                            }else if ($datos->id_estado == 4){
                                echo '<span class="badge bg-danger">Bloqueado</span>';
                            }
                            ?></td>
                        <td>
                       
                            <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar(
                                '<?= $datos->Id_Usuario ?>', '<?= $datos->nombre_completo ?>', '<?= $datos->usuario ?>', '<?= $datos->correo ?>' ,'<?= $datos->id_estado ?>','<?= $datos->id_rol ?>')">
                                <i class="bi bi-pencil-square"></i>
                                Editar
                            </button>
                     

                     
                            <form id="deleteForm" method="POST" action="modelos/delete_usuario.php" style="display: inline;">
                                <input type="hidden" name="id" value="<?= $datos->Id_Usuario ?>">
                                <button type="submit" class="btn btn-eliminar">
                                    <i class="bi bi-trash"></i>
                                    Eliminar
                                </button>
                            </form>
                       

                        
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalCambioContrasena" onclick="abrirCambioContrasena('<?= $datos->Id_Usuario ?>')">
                            <i class="bi bi-lock-fill"></i>
                                Cambiar Contraseña
                            </button>
                      
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

<!-- Modal crear Permisos -->
<div class="modal fade" id="modalCrear" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Listado de Permisos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <h2><span id="nombreRolSeleccionado"></span></h2> <!-- Mostrar el nombre del rol -->
                <h2>Rol: <span id="idRolSeleccionado"></span></h2> <!--  Mostrar el ID del rol -->
                <form id="permissionForm" method="POST" action="vistas/guardar_permisos.php">
                    <input type="hidden" id="Id_rol_modal" name="Id_rol">
                    <table class="table table-hover">
                        <thead class="table-dark text-center" style="background-color: #343A40;">
                            <tr>
                                <th>Objeto</th>
                                <th>Crear</th>
                                <th>Actualizar</th>
                                <th>Eliminar</th>
                            </tr>
                        </thead>
                        <tbody class="text-center">
                            <?php
                            include "../php/conexion_be.php";

                            // Obtener los datos de la tabla objetos de la base de datos
                            $sql = $conexion->query("SELECT Id_objetos, Objeto FROM objetos");


                            // Recorre los datos obtenidos de la base de datos
                            while ($datos = $sql->fetch_object()) {
                                echo "<tr>";
                                echo "<td>" . $datos->Objeto . "</td>";
                                echo "<td><input type='checkbox' name='crear_" . $datos->Id_objetos . "' value='1'></td>";
                                echo "<td><input type='checkbox' name='actualizar_" . $datos->Id_objetos . "' value='1'></td>";
                                echo "<td><input type='checkbox' name='eliminar_" . $datos->Id_objetos . "' value='1'></td>";
                                echo "</tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
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
                <form id="formularioEditar" method="POST" action="modelos\update_usuario.php">
                    <div class="form-group" style="display: none;">
                        <label for="id">ID Usuario</label>
                        <input type="text" class="form-control" id="id" name="id" readonly>
                    </div>

                    <div class="form-group">
                        <label for="nombre_completo">Nombre Completo:</label>
                        <input type="text" class="form-control" id="nombre_completo" name="nombre_completo" required>
                    </div>

                    <div class="form-group">
                        <label for="usuario">Usuario:</label>
                        <input type="text" class="form-control" id="usuario" name="usuario" required>
                    </div>

                    <div class="form-group">
                        <label for="correo">Correo:</label>
                        <input type="email" class="form-control" id="correo" name="correo" required>
                    </div>

                    <div class="form-group">
                        <label for="Id_rol">ROL</label>
                        <select class="form-control" id="Id_rol_edit" name="Id_rol" required>
                            
                        </select>
                    </div>

                    <div class="form-group">
                            <label for="id_estado">Estado:</label>
                            <select class="form-control" id="id_estado" name="id_estado" required>
                                <option value=""disabled selected>Seleccione una opción</option>
                                <option value="1">ACTIVO</option>
                                <option value="2">INACTIVO</option>
                                <option value="3">NUEVO</option>
                                <option value="4">BLOQUEADO</option>
                            </select>
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
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">CREAR</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="modelos/insert_usuario.php" method="POST">
                <div class="form-group">
                        <label for="nombre_completo">Nombre Completo:</label>
                        <input type="text" class="form-control" id="nombre_completo" name="nombre_completo" required>
                    </div>

                    <div class="form-group">
                        <label for="usuario">Usuario:</label>
                        <input type="text" class="form-control" id="usuario" name="usuario" required>
                    </div>

                    <div class="form-group">
                        <label for="correo">Correo:</label>
                        <input type="email" class="form-control" id="correo" name="correo" required>
                    </div>

                    <div class="form-group">
                        <label for="Id_rol">ROL</label>
                        <select class="form-control" id="Id_rol" name="Id_rol" required>
                           
                        </select>
                    </div>

                    <div class="form-group">
                            <label for="id_estado">Estado:</label>
                            <select class="form-control" id="id_estado" name="id_estado" required>
                                <option value=""disabled selected>Seleccione una opción</option>
                                <option value="1">ACTIVO</option>
                                <option value="2">INACTIVO</option>
                                <option value="3">NUEVO</option>
                                <option value="4">BLOQUEADO</option>
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


<div class="modal fade" id="modalCambioContrasena" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #17A2B8;">
                <h5 class="poppins-modal mb-2" id="exampleModalLabel">CAMBIAR CONTRASEÑA DE USUARIO</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formularioCambio" method="POST" action="">

                    <div class="form-group">
                        <label for="idCambio">ID Usuario</label>
                        <input type="text" class="form-control" id="idCambio" name="idCambio" readonly>
                    </div>

                    <div class="form-group" style="position:relative;">
                        <label for="contrasena">Contraseña:</label>
                        <input type="password" class="form-control" id="contrasena" name="contrasena" required>
                        <span style="position: absolute; top: 74%; right: 7%; transform: translateY(-50%); cursor: pointer;" onclick="togglePasswordVisibility(this.previousElementSibling, this)">🔒</span>
                    </div>


                    <div class="form-group" style="position:relative;">
                        <label for="confContrasena">Confirmar Contraseña:</label>
                        <input type="password" class="form-control" id="confContrasena" name="confContrasena" required>
                        <span style="position: absolute; top: 74%; right: 7%; transform: translateY(-50%); cursor: pointer;" onclick="togglePasswordVisibility(this.previousElementSibling, this)">🔒</span>
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


<script>
    $(document).ready(function() {
        $("#Id_rol").load("demo.txt", function (responseTxt, statusTxt, xhr) {
            let selectRol= document.getElementById('Id_rol')

            $.ajax({
                url: "modelos/cargarDatosSelect.php",
                type: "GET",
                data: {select:'Roles'},
                success: function(data) {
                const roles=JSON.parse(data)
            
                roles.forEach(rol => {
                    //Creación de la fila
                    const opcion = document.createElement("option");
                    opcion.value = rol.id;
                    opcion.textContent=rol.nombre;
                    
                    selectRol.appendChild(opcion)
                    }) 
                },
            });
        });
    });
</script>

<script>
    $(document).ready(function() {
        $("#Id_rol_edit").load("demo.txt", function (responseTxt, statusTxt, xhr) {
            let selectRol= document.getElementById('Id_rol_edit')

            $.ajax({
                url: "modelos/cargarDatosSelect.php",
                type: "GET",
                data: {select:'Roles'},
                success: function(data) {
                const roles=JSON.parse(data)
            
                roles.forEach(rol => {
                    //Creación de la fila
                    const opcion = document.createElement("option");
                    opcion.value = rol.id;
                    opcion.textContent=rol.nombre;
                    
                    selectRol.appendChild(opcion)
                    }) 
                },
            });
        });
    });
</script>

<!-- JavaScript para manejar la edición de usuarios -->
<script>
    // Función para abrir el modal de edición
    function abrirModalEditar(id, nombre_completo, usuario, correo, id_estado, Id_rol) {
        document.getElementById("id").value = id;
        document.getElementById("nombre_completo").value = nombre_completo;
        document.getElementById("usuario").value = usuario;
        document.getElementById("correo").value = correo;
        document.getElementById("Id_rol_edit").value = Id_rol;
        document.getElementById("id_estado").value = id_estado;
        $('#modalEditar').modal('show'); // Mostrar el modal de edición
    }


    function abrirCambioContrasena(id) {
        console.log(id)

        document.getElementById("idCambio").value = id;
        $('#modalCambioContrasena').modal('show'); // Mostrar el modal de edición
    }
</script>



<script>
    $(document).ready(function() {
        // Validación para el formulario de edición
        $("#formularioEditar").on("submit", function(event) {
            event.preventDefault();
            validarEdicion($(this));
        });

        // Validación para el formulario de creación
        $("form[action='modelos/insert_usuario.php']").on("submit", function(event) {
            event.preventDefault();
            validarCreacion($(this));
        });

        function validarEdicion(formulario) {
            // Convertir el valor del campo de nombre a mayúsculas antes de enviar el formulario
            var nombreEditInput = formulario.find("input[name='nombre_completo']");
            nombreEditInput.val(nombreEditInput.val().toUpperCase());

            $.ajax({
                url: formulario.attr("action"),
                method: "POST",
                data: formulario.serialize(),
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
                            title: "Registro actualizado correctamente",
                            text: "El Registro se ha actualizado correctamente.",
                            icon: "success",
                            showCancelButton: false,
                            confirmButtonText: "Cerrar"
                        }).then(function() {
                            $("#modalEditar").modal("hide");
                            location.reload(); // Recarga la página
                        });
                    }
                }
            });
        }

        function validarCreacion(formulario) {
            // Convertir el valor del campo de nombre a mayúsculas antes de enviar el formulario
            var nombreInput = formulario.find("input[name='nombre_completo']");
            nombreInput.val(nombreInput.val().toUpperCase());

            $.ajax({
                url: formulario.attr("action"),
                method: "POST",
                data: formulario.serialize(),
                dataType: "json",
                success: function(response) {
                    if (response.success) {
                        Swal.fire({
                            title: "Registro creado correctamente",
                            text: "El Registro se ha creado correctamente.",
                            icon: "success",
                            showCancelButton: false,
                            confirmButtonText: "Cerrar"
                        }).then(function() {
                            $("#modalForm").modal("hide");
                            location.reload(); // Recarga la página
                        });
                    } else {
                        Swal.fire({
                            title: "Error",
                            text: "EHubo un error al crear un registro.",
                            icon: "error",
                            showCancelButton: false,
                            confirmButtonText: "Cerrar"
                        })
                    }
                }
            });
        }
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


<script>
        document.getElementById('formularioCambio').addEventListener('submit', function(event) {
            event.preventDefault();

            var contrasena = document.getElementById("contrasena").value;
            var confirmacionContrasena = document.getElementById("confContrasena").value;
            var id = document.getElementById("idCambio").value;

            var regexMayuscula = /[A-Z]/;
            var regexMinuscula = /[a-z]/;
            var regexNumero = /[0-9]/;
            var regexEspecial = /[!@#$%^&*(),.?":{}|<>]/;

            var esContrasenaValida = regexMayuscula.test(contrasena) &&
                regexMinuscula.test(contrasena) &&
                regexNumero.test(contrasena) &&
                regexEspecial.test(contrasena) &&
                contrasena.length >= 8 &&
                contrasena.length <= 15;

            var contrasenasCoinciden = contrasena === confirmacionContrasena;

            if (!esContrasenaValida || !contrasenasCoinciden) {
                var errores = [];

                if (!regexMayuscula.test(contrasena)) errores.push("Una mayúscula");
                if (!regexMinuscula.test(contrasena)) errores.push("Una minúscula");
                if (!regexNumero.test(contrasena)) errores.push("Un número");
                if (!regexEspecial.test(contrasena)) errores.push("Un carácter especial");
                if (contrasena.length < 8 || contrasena.length > 15) errores.push("Entre 8 y 15 caracteres");
                if (!contrasenasCoinciden) errores.push("Las contraseñas deben coincidir");

                var mensajeError = "La clave debe contener: " + errores.join(", ") + ".";

                Swal.fire({
                    title: 'Error en la validación',
                    text: mensajeError,
                    icon: 'error',
                    confirmButtonText: 'Ok'
                });
                return;
            }

            const datos = {
                password: contrasena,
                token: new URLSearchParams(window.location.search).get('token'),
                id:id
            };

            $.ajax({
                type: 'POST',
                url: 'modelos/update_passwordAdmin.php', 
                data: datos,
                success: function(response) {
                    if (response === 'Tu contraseña ha sido actualizada.') {
                        Swal.fire({
                            title: 'Éxito',
                            text: 'Tu contraseña ha sido actualizada correctamente.',
                            icon: 'success',
                            confirmButtonText: 'Ok'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                location.reload(); 
                            }
                        });
                    } else {
                        Swal.fire({
                            title: 'Error',
                            text: 'No se pudo cambiar la contraseña.',
                            icon: 'error',
                            confirmButtonText: 'Ok'
                        });
                    }
                },
                error: function(xhr, status, error) {
                    Swal.fire({
                        title: 'Error',
                        text: 'Hubo un problema al enviar la solicitud: ' + error,
                        icon: 'error',
                        confirmButtonText: 'Ok'
                    });
                }
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

<script type="text/javascript">
            function togglePasswordVisibility(inputField, eyeIcon) {
                var fieldType = inputField.type;
                if (fieldType === "password") {
                    inputField.type = "text";
                    eyeIcon.textContent = "👁️"; // Cambia el ícono de ojo abierto
                } else {
                    inputField.type = "password";
                    eyeIcon.textContent = "🔒"; // Cambia el ícono de ojo cerrado
                }
            }
        </script>
