<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/estilos.css">

<div class="containertable">
    <div class="d-flex justify-content-between align-items-end mb-4">
        <div>
            <h1 class="poppins-font mb-2">MANTENIMIENTO PERMISOS</h1>
            <br>
            <a href='../php/mantenimiento_permisos.php' class="btn btn-info">
                <i class="nav-icon bi bi-shield-lock"></i> Crear nuevo permiso
            </a>
        </div>

        <div class="mb-4 border-bottom">
            <form class="d-flex" role="search">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-search"></i></span>
                    </div>
                    <input class="form-control" id="searchInput" type="search" placeholder="Buscar usuarios..." aria-label="Search">
                </div>
            </form>
        </div>
    </div>
    <?php
    //conexion a la base de datoa
    include '../php/conexion_be.php';

    $query = "SELECT * FROM permisos";
    $result = $conexion->query($query);


    if ($result === false) {
        die("Error en la consulta: " . $conexion->error);
    }


    $rows = $result->fetch_all(MYSQLI_ASSOC);


    $chunks = array_chunk($rows, 20);


    $sectionCounter = 1;


    /*echo "<p>Mostrando " . count($rows) . " registros</p>";*/


    foreach ($chunks as $chunk) {
        echo "<table class='table table-hover'>
                    <thead class='table-dark text-center' style='background-color: #343A40;'>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Nombre_Guard</th>
                            <th>Fecha Creación</th>
                            <th>Fecha Actualización</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody class='text-center'>";


        foreach ($chunk as $row) {
            echo "<tr>
                        <td>{$row['Id_Permisos']}</td>
                        <td>{$row['Nombre']}</td>
                        <td>{$row['Nombre_Guard']}</td>
                        <td>{$row['Fecha_Creacion']}</td>
                        <td>{$row['Fecha_Actualizacion']}</td>
                        <td>

                        <a href='php/editar_mant_permisos.php?Id_Permisos=" . $row['Id_Permisos'] . "' class='btn btn-editar'>
                            <i class='bi bi-pencil-square'></i> EDITAR
                        </a>
                        <a href='php/eliminar_mant_permisos.php?Id_Permisos=" . $row['Id_Permisos'] . "' class='btn btn-eliminar'>
                            <i class='bi bi-trash'></i>ELIMINAR                            
                        </a>
                        </td>
                    </tr>";
        }

        echo "</tbody>
                  </table>";
        $sectionCounter++;
    }
    $conexion->close();
    ?>
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