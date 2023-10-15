<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Roles</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="..\assets\css\roles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Mantenimiento Roles</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">inicio</a></li>
                    <li class="breadcrumb-item active">Mantenimiento Roles</li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
        <div class="app-title">
        <div>
        <?php 
           include ("../php/conexion_be.php");
           $select = "SELECT Id_rol, Nombre, STATUS, Fecha_Creacion, Fecha_Actualizacion FROM roles";
            $query = mysqli_query($conexion, $select);
        ?>
          <h1 style="border-bottom: 1px solid #fd7e14; "></h1><br>
          <h1 style="font-family: 'Arial'; font-weight: 600; font-size: 20px; text-align: center; color: #000;"> ROLES</h1>
          <p></p><br>
          <h1 style="border-bottom: 1px solid #fd7e14; left: -800px; "></h1>
        </div>
    </div>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#miModal">
        Agregar
    </button>

    <div class="modal fade" id="miModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Agregar Rol</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="POST" action="../php/insert_roles.php">
                        <div class="form-group">
                            <label for="Nombre">Nombre:</label>
                            <input type="text" class="form-control" id="Nombre" name="Nombre" required>
                        </div>
                        <div class="form-group">
                            <label for="Nombre_Guard">Nombre guardo rol:</label>
                            <input type="text" class="form-control" id="Nombre_Guard" name="Nombre_Guard" required>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <button type="submit" class="btn btn-primary">Confirmar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal de confirmación -->
    <?php if (isset($_GET["success"]) && $_GET["success"] === "true") : ?>
        <script>
            $(document).ready(function () {
                $('#mensajeModal').modal('show'); // Mostrar el modal automáticamente
            });
        </script>
    <?php endif; ?>
    <div class="modal fade" id="mensajeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Mensaje de Confirmación</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                <?php
                if (isset($_GET["message"])) {
                    echo $_GET["message"];
                } else {
                    echo "El rol ha sido agregado correctamente.";
                }
                ?>
                </div>
                <div class="modal-footer">
                <a href="Mantenimiento_roles.php" class="btn btn-primary">Aceptar</a>
                </div>
            </div>  
        </div>
    </div>
    <!--Tabla Mostrar-->
    <div class="container custom-search-container">
        <input type="text" id="buscar" class="form-control custom-search-input" placeholder="Buscar...">
      </div>
      
      <table id="tabla-datos" class="table" >
        <thead>
          <tr >
            <th>Id</th>
            <th>Nombre del Rol</th>
            <th>Estado de Rol</th>
            <th>Fecha Creacion </th>
            <th>Fecha Actualizacion </th>
          </tr>
        </thead>
        <tbody>
        <?php
        $start = 0; // Inicializamos la variable de inicio
        $items_per_page = 10; // Número de registros por página

        if (isset($_GET['page'])) {
            $page = $_GET['page'];
            $start = ($page - 1) * $items_per_page; // Calcular el inicio de la página actual
        } else {
            $page = 1; // Página predeterminada
        }

        // Consulta SQL para seleccionar registros limitados por página
        $select = "SELECT Id_rol, Nombre, STATUS, Fecha_Creacion, Fecha_Actualizacion FROM roles LIMIT $start, $items_per_page";
        $query = mysqli_query($conexion, $select);

        while ($row= mysqli_fetch_array($query)){ ?>

            
          <tr>
            <td><?= $row['Id_rol'] ?></td>
            <td><?= $row['Nombre'] ?></td>
            <td><?= $row['STATUS'] ?></td>
            <td><?= $row['Fecha_Creacion'] ?></td>
            <td><?= $row['Fecha_Actualizacion'] ?></td>
            <td>
            <button class="btn btn-primary btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar('<?= $row['Id_rol'] ?>', '<?= $row['Nombre'] ?>', '<?= $row['STATUS'] ?>')">Editar</button>
            <form method="POST" action="../php/delete_roles.php" style="display: inline;">
                <input type="hidden" name="Id_rol" value="<?= $row['Id_rol'] ?>">
                <button type="submit" class="btn btn-danger btn-eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar este rol?')">Eliminar</button>
            </form>


            </td>
          </tr>
          <?php }?>
          
           <!-- Modal para editar roles -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar Rol</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <form id="formularioEditar" method="POST" action="../php/update_roles.php">
                    <div class="form-group">
                            <label for="Id_rolEditar">ID del Rol:</label>
                            <input type="text" class="form-control" id="Id_rolEditar" name="Id_rol" readonly>
                        </div>
                        <div class="form-group">
                            <label for="NombreEditar">Nombre:</label>
                            <input type="text" class="form-control" id="NombreEditar" name="Nombre" required>
                        </div>
                        <div class="form-group">
                            <label for="StatusEditar">Status:</label>
                            <select class="form-control" id="StatusEditar" name="Status">
                                <option value="Activo">Activo</option>
                                <option value="Inactivo">Inactivo</option>
                            </select>
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

    <!-- JavaScript para manejar la edición de roles -->
    <script>
        // Función para abrir el modal de edición
        function abrirModalEditar(id, nombre, status) {
            document.getElementById("Id_rolEditar").value = id;
            document.getElementById("NombreEditar").value = nombre;
            // Seleccionar la opción correcta en el campo "Status"
            document.getElementById("StatusEditar").value = status;
            $('#modalEditar').modal('show'); // Mostrar el modal de edición
        }
    </script>
    
    
          <!-- Agrega más filas aquí si es necesario -->
        </tbody>
      </table>
      
      <div class="paginator">
        <ul>
          <li><a href="#">Anterior</a></li>
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">Siguiente</a></li>
        </ul>
      </div>
      
      <script>
        document.addEventListener('DOMContentLoaded', function() {
          var tablaDatos = document.getElementById('tabla-datos');
          var filas = tablaDatos.getElementsByTagName('tr');
      
          if (filas.length > 1) {
            tablaDatos.style.display = 'table';
      
            // Mostrar botones de editar y eliminar para cada fila
            for (var i = 1; i < filas.length; i++) {
              var fila = filas[i];
              var celdas = fila.getElementsByTagName('td');
              var accionesCell = celdas[celdas.length - 1];
              var btnEditar = accionesCell.querySelector('.btn-editar');
              var btnEliminar = accionesCell.querySelector('.btn-eliminar');
              btnEditar.style.display = 'inline-block';
              btnEliminar.style.display = 'inline-block';
            }
          }
        });
      </script>
    



    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<div class="content">
    <div class="container-fluid">

        <!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
</html>