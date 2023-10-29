<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Roles</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets\css\estilos.css">
</head>
<div class="containertable">
    
    <div class="d-flex justify-content-between align-items-end mb-4">
        <div>
            <h1 class="poppins-font mb-2">MANTENIMIENTO ROLES</h1>
            <br>
            
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#miModal">
            <i class="nav-icon bi bi-shield-lock"></i> Crear nuevo rol
            </button>
        
        <?php 
           include ("../php/conexion_be.php");
           $select = "SELECT Id_rol, Nombre, STATUS, Fecha_Creacion, Fecha_Actualizacion FROM roles";
            $query = mysqli_query($conexion, $select);
        ?>
        
        </div>
        <div class="mb-4 border-bottom">
            <form class="d-flex" role="search">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-search"></i></span>
                    </div>
                    <input class="form-control" id="searchInput" type="search" placeholder="Buscar rol..." aria-label="Search">
                </div>
            </form>
        </div>
    </div>

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
                    <form method="POST" action="php/insert_roles.php">
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
    <!--Tabla Mostrar-->
    
      
      <table id="tabla-datos" class="table table-hover text-nowrap" >
        <thead class="table-dark text-center" style="background-color: #343A40;">
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
        while ($row= mysqli_fetch_array($query)){ ?> 
          <tr>
            <td><?= $row['Id_rol'] ?></td>
            <td><?= $row['Nombre'] ?></td>
            <td><?= $row['STATUS'] ?></td>
            <td><?= $row['Fecha_Creacion'] ?></td>
            <td><?= $row['Fecha_Actualizacion'] ?></td>
            <td>
                <button type="button" class="btn btn-editar" data-toggle="modal" data-target="#modalEditar" onclick="abrirModalEditar
                ('<?= $row['Id_rol'] ?>', '<?= $row['Nombre'] ?>', '<?= $row['STATUS'] ?>')">
                <i class="bi bi-pencil-square"></i>
                Editar
                </button>
                <form method="POST" action="php/delete_roles.php" style="display: inline;">
                <input type="hidden" name="Id_rol" value="<?= $row['Id_rol'] ?>">
                <button type="submit" class="btn btn-danger btn-eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar este rol?')">
                <i class="bi bi-trash"></i>
                Eliminar
                </button>
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
            <form method="POST" action="php/update_roles.php">
                    <div class="form-group">
                            <label for="Id_rol">ID del Rol:</label>
                            <input type="text" class="form-control" id="Id_rol" name="Id_rol" readonly>
                        </div>
                        <div class="form-group">
                            <label for="Nombre">Nombre:</label>
                            <input type="text" class="form-control" id="Nombre" name="Nombre" required>
                        </div>
                        <div class="form-group">
                            <label for="STATUS">Status:</label>
                            <select class="form-control" id="STATUS" name="STATUS" required>
                                <option value="ACTIVO">Activo</option>
                                <option value="INACTIVO">Inactivo</option>
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
        function abrirModalEditar(Id_rol, Nombre, STATUS) {
            document.getElementById("Id_rol").value = Id_rol;
            document.getElementById("Nombre").value = Nombre;
            // Seleccionar la opción correcta en el campo "Status"
            document.getElementById("STATUS").value = STATUS;
            $('#modalEditar').modal('show'); // Mostrar el modal de edición
        }
    </script>
    
    
    
          <!-- Agrega más filas aquí si es necesario -->
        </tbody>
      </table>
      
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
    



    
</div>
<!-- /.content-header -->

<!-- Main content -->
<div class="content">
    <div class="container-fluid">

        <!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
</html>