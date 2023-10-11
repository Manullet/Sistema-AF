<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Mantenimiento Preguntas</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                    <li class="breadcrumb-item active">Mantenimiento Preguntas</li>
                </ol>
            </div><!-- /.col -->
            div class="actions">
        <a class="btn btn-primary" href='modelos/agregar_mant.php' >Nueva Pregunta</a>
    </div>   
        </div>
        </div><!-- /.row -->


        <!-- /.row -->
        <p></p>
        <form action='#' method='get'>
        <input  type='text' id='search' name='search' placeholder='Buscar Pregunta'>
        <input  type='submit' value='Buscar'>
    </form>
        <?php
       //conexion a la base de datoa
    include '../php/conexion_be.php';
        
        $query = "SELECT * FROM preguntas";
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
                            <th>Id_pregunta</th>
                            <th>Pregunta</th>
                            <th>Actualizado por</th>
                            <th>Creado por</th>
                            <th>Fecha de Creación</th>
                            <th>Fecha de Actualización</th>
                        </tr>
                    </thead>
                    <tbody>";

          
            foreach ($chunk as $row) {
                echo "<tr>
                        <td>{$row['Id_pregunta']}</td>
                        <td>{$row['Pregunta']}</td>
                        <td>{$row['Actualizado_Por']}</td>
                        <td>{$row['Creado_Por']}</td>
                        <td>{$row['Fecha_Creacion']}</td>
                        <td>{$row['Fecha_Actualizacion']}</td>
                        <td>
                            <a href='php/editar_preg.php?Id_pregunta=".$row['Id_pregunta']."'>EDITAR</a>
                            <a href='php/eliminar_preg.php?Id_pregunta=".$row['Id_pregunta']."'>ELIMINAR</a>
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
    </div><!-- /.container-fluid -->
</div>