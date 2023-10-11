<?php
include 'conexion_be.php';

    if(isset($_POST['Agregar'])){
        $Pregunta = $_POST['Pregunta'];
        $Fecha_Creacion = $_POST['Fecha_Creacion'];
        $Fecha_Actualizacion = $_POST['Fecha_Actualizacion'];
        
        if ( empty($Pregunta) || empty($Fecha_Creacion) || empty($Fecha_Actualizacion)) {
            echo "<script language='JavaScript'>
            alert('Por favor, complete todos los campos');
            </script>";
        } else {
            include("conexion_be.php");
            $Pregunta = mysqli_real_escape_string($conexion, $Pregunta);
            $Fecha_Creacion = mysqli_real_escape_string($conexion, $Fecha_Creacion);
            $Fecha_Actualizacion = mysqli_real_escape_string($conexion, $Fecha_Actualizacion);
        
        $sql = "INSERT INTO preguntas (Pregunta, Fecha_Creacion, Fecha_Actualizacion) 
            VALUES ( '$Pregunta', '$Fecha_Creacion', '$Fecha_Actualizacion')";
            
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
                
        $Id_pregunta =  $_POST['Id_pregunta'];
        $Pregunta = mysqli_real_escape_string($conexion, $_POST['Pregunta']);
        $Fecha_Creacion = mysqli_real_escape_string($conexion, $_POST['Fecha_Creacion']);
        $Fecha_Actualizacion =mysqli_real_escape_string($conexion, $_POST['Fecha_Actualizacion']);


            $sql = "UPDATE preguntas SET Pregunta='$Pregunta', Fecha_Creacion='$Fecha_Creacion', Fecha_Actualizacion='$Fecha_Actualizacion'  WHERE Id_pregunta=$Id_pregunta";

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

    $Id_pregunta = $_GET['Id_pregunta'];

    $query = "SELECT * FROM preguntas WHERE Id_pregunta = $Id_pregunta";
            $result = $conexion->query($query);

            if ($result === false) {
                die("Error en la consulta: " . $conexion->error);
            }

            $Pregunta = $result->fetch_assoc();

            if (!$Pregunta) {
                die("Pregunta no encontrada");
            }
        
            if(isset($_GET['Id_pregunta']) && is_numeric($_GET['Id_pregunta'])){
                $id = $_GET['Id_pregunta'];

                if (isset($_POST['confirmar'])) {
                    
                    $query = "DELETE FROM preguntas WHERE Id_pregunta = $Id_pregunta";
                    $result = $conexion->query($query);
        
                    if ($result) {
                        echo "<script language='JavaScript'>
                        alert('Registro eliminado correctamente');
                        //location.assign('index.php');
                        
                        </script>";
                        header("location: ../modelos/mantenimiento.php");
                    } else {
                        echo "<script language='JavaScript'>
                        alert('Error al intentar eliminar el registro');
                        location.assign('index.php');
                        </script>";
                    }
                }
            } else {
                die("Id no válido");
            }

?>