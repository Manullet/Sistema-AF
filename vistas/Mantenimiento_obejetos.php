<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Mantenimiento Objetos</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">inicio</a></li>
                    <li class="breadcrumb-item active">Mantenimiento Objetos</li>
                    
                </ol>
            </div><!-- /.col -->   
    <div class="actions">
        <a class="btn btn-primary" href='modelos/agregar_mant.php' >Nuevo Objeto</a>
    </div>   
        </div><!-- /.row -->



        
        <p></p>
        <form action='#' method='get'>
        <input  type='text' id='search' name='search' placeholder='Buscar Objeto'>
        <input  type='submit' value='Buscar'>
    </form>
        <?php
       //conexion a la base de datoa
    include '../php/conexion_be.php';
        
        $query = "SELECT * FROM objetos";
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
                            <th>ID</th>
                            <th>Objeto</th>
                            <th>Descripción</th>
                            <th>Actualizado por</th>
                            <th>Creado por</th>
                            <th>Fecha de Creación</th>
                            <th>Fecha de Actualización</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>";

          
            foreach ($chunk as $row) {
                echo "<tr>
                        <td>{$row['Id_objetos']}</td>
                        <td>{$row['Objeto']}</td>
                        <td>{$row['Descripcion']}</td>
                        <td>{$row['Actualizado_Por']}</td>
                        <td>{$row['Creado_Por']}</td>
                        <td>{$row['Fecha_Creacion']}</td>
                        <td>{$row['Fecha_Actualizacon']}</td>
                        <td>{$row['Status']}</td>
                        <td>
                            <a href='php/editar_obj.php?Id_objetos=".$row['Id_objetos']."'>EDITAR</a>
                            <a href='php/eliminar_obj_be.php?Id_objetos=".$row['Id_objetos']."'>ELIMINAR</a>
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