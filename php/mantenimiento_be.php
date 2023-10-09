<?php
include 'conexion_be.php';

        if(isset($_POST['Agregar'])){
            $objeto = $_POST['objeto'];
            $Descripcion = $_POST['Descripcion'];
            $actualizadoPor = $_POST['Actualizado_Por'];
            $creadoPor = $_POST['Creado_Por'];
            $status = $_POST['Status'];

            if (empty($objeto) || empty($Descripcion) || empty($actualizadoPor) || empty($creadoPor) || empty($status)) {
                echo "<script language='JavaScript'>
                alert('Por favor, complete todos los campos');
                </script>";
            } else {
                include("conexion_be.php");
                $objeto = mysqli_real_escape_string($conexion, $objeto);
                $Descripcion = mysqli_real_escape_string($conexion, $Descripcion);
                $actualizadoPor = mysqli_real_escape_string($conexion, $actualizadoPor);
                $creadoPor = mysqli_real_escape_string($conexion, $creadoPor);
                $status = mysqli_real_escape_string($conexion, $status);

                $sql = "INSERT INTO objetos (objeto, Descripcion, Actualizado_Por, Creado_Por, Status) 
                        VALUES ('$objeto', '$Descripcion', '$actualizadoPor', '$creadoPor', '$status')";
                
                $resultado = mysqli_query($conexion, $sql);

                if($resultado){
                    echo "<script language='JavaScript'>
                    alert('Los datos fueron ingresados correctamente a la BD');
                    //location.assign('index.php');
                    </script>";
                    header("location: ../bienvenida.php");
                } else {
                    echo "<script language='JavaScript'>
                    alert('ERROR: No se han podido ingresar a la BD');
                    </script>";
                }

                mysqli_close($conexion);
            }
        }


       



    ?>