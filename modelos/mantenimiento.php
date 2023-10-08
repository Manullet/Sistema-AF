<?php 

session_start();
//para validar si inicio sesion
if(!isset($_SESSION['usuario'])){
    echo'

    <script> 
        alert("Debes iniciar sesion");
        window.location = "index.php";
    </script>
    
    ';

    //header("location: index.php");
    //destruye cualquier session
    session_destroy();
    //para el codigo
    die();
    
}

//include '/php/mantenimiento_be.php'
include('..\php\conexion_be.php');

?>


<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mantenimiento de Objetos</title>
    <link rel="stylesheet" type="text/css" href="../dist/css/diseño.css">
</head>
<body>
    <header>
        <h1>Mantenimiento de Objetos</h1>
    </header>

    <div class="actions">
        <a href='../models/agregar_mant.php'>Nuevo Objeto</a>
    </div>

    <form action='#' method='get'>
        <input type='text' id='search' name='search' placeholder='Buscar Objeto'>
        <input type='submit' value='Buscar'>
    </form>

    <?php
       //conexion a la base de datoa
    //include 'php/conexion_be.php';
        
        
        
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
            echo "<table border='1'>
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
                            <a href='models/editar_mant.php?Id_objetos=".$row['Id_objetos']."'>EDITAR</a>
                            <a href='eliminar_mant.php?Id_objetos=".$row['Id_objetos']."'>ELIMINAR</a>
                        </td>
                    </tr>";
            }

            echo "</tbody>
                  </table>";

           


            
            $sectionCounter++;
        }

        
        $conexion->close();
    ?>
</body>
</html>
