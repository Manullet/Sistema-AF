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


        if(isset($_POST['Editar'])){
            
            $id =  $_POST['Id_objetos'];
            $objeto = mysqli_real_escape_string($conexion, $_POST['objeto']);
            $Descripcion = mysqli_real_escape_string($conexion, $_POST['Descripcion']);
            $actualizadoPor =mysqli_real_escape_string($conexion, $_POST['Actualizado_Por']);
            $status = mysqli_real_escape_string($conexion, $_POST['Status']);


            


            $sql = "UPDATE objetos SET objeto='$objeto', Descripcion='$Descripcion', Actualizado_Por='$actualizadoPor', Status='$status' WHERE Id_objetos=$id";

            $resultado = mysqli_query($conexion, $sql);

            if($resultado){
                echo "<script language='JavaScript'>
                alert('Los datos fueron actualizados correctamente');
                //location.assign('index.php');
                </script>";
                header("location: ../models/mantenimiento.php");
            } else {
                echo "<script language='JavaScript'>
                alert('ERROR: No se han podido actualizar los datos');
                </script>";
            }

            mysqli_close($conexion);
        }


        $id = $_GET['Id_objetos'];


        $query = "SELECT * FROM objetos WHERE Id_objetos = $id";
        $result = $conexion->query($query);

        if ($result === false) {
            die("Error en la consulta: " . $conexion->error);
        }

        $objeto = $result->fetch_assoc();

        if (!$objeto) {
            die("Objeto no encontrado");
        }
    
        if(isset($_GET['Id_objetos']) && is_numeric($_GET['Id_objetos'])){
            $id = $_GET['Id_objetos'];
    
            if (isset($_POST['confirmar'])) {
                
                $query = "DELETE FROM objetos WHERE Id_objetos = $id";
                $result = $conexion->query($query);
    
                if ($result) {
                    echo "<script language='JavaScript'>
                    alert('Registro eliminado correctamente');
                    //location.assign('index.php');
                    
                    </script>";
                    header("location: ../models/mantenimiento.php");
                } else {
                    echo "<script language='JavaScript'>
                    alert('Error al intentar eliminar el registro');
                    location.assign('index.php');
                    </script>";
                }
            }
        } else {
            die("ID no válido");
        }




    ?>