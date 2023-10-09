<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Mantenimiento Permisos</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">inicio</a></li>
                    <li class="breadcrumb-item active">Mantenimiento Permisos</li>
                    
                </ol>
            </div><!-- /.col -->   
    <div class="actions">
        <a class="btn btn-primary" href='modelos/agregar_mant_permisos.php' >Nuevo Permiso</a>
    </div>   
        </div><!-- /.row -->
        <p></p>
        <form action='#' method='get'>
        <input  type='text' id='search' name='search' placeholder='Buscar Permiso'>
        <input  type='submit' value='Buscar'>
    </form>
        <?php
       //conexion a la base de datoa
    include '../php/conexion_be.php';
        
        $query = "SELECT * FROM permisos";
        $result = $conexion->query($query);

        
        if ($result === false) {
            die("Error en la consulta: " . $conexion->error);
        }

        
        $rows = $result->fetch_all(MYSQLI_ASSOC);

       
        $chunks = array_chunk($rows, 20 );

        
        $sectionCounter = 1;

        
        echo "<p>Mostrando " . count($rows) . " registros</p>";

        
        foreach ($chunks as $chunk) {
            echo "<table class='table table-hover text-nowrap'>
                    <thead>
                        <tr>
                            <th>Id_Permisos</th>
                            <th>Nombre</th>
                            <th>Nombre_Guard</th>
                            <th>Fecha_Creacion</th>
                            <th>Fecha_Actualizacion</th>
                        </tr>
                    </thead>
                    <tbody>";

          
            foreach ($chunk as $row) {
                echo "<tr>
                        <td>{$row['Id_Permisos']}</td>
                        <td>{$row['Nombre']}</td>
                        <td>{$row['Nombre_Guard']}</td>
                        <td>{$row['Fecha_Creacion']}</td>
                        <td>{$row['Fecha_Actualizacion']}</td>
                        <td>
                            <a href='php/editar_mant_permisos.php?Id_Permisos=".$row['Id_Permisos']."'>EDITAR</a>
                            <a href='php/eliminar_mant_permisos.php?Id_Permisos=".$row['Id_Permisos']."'>ELIMINAR</a>
                        </td>
                    </tr>";
            }

            echo "</tbody>
                  </table>";

           


            
            $sectionCounter++;
        }

        
        $conexion->close();
    ?>
    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<div class="content">
    <div class="container-fluid">

        <!-- /.row -->
    </div><!-- /.container-fluid -->
</div>