<?php
include 'conexion_be.php';

if(isset($_POST['Agregar'])){
    $Id_Permisos = $_POST['Id_Permisos'];
    $Nombre = $_POST['Nombre'];
    $Nombre_Guard = $_POST['Nombre_Guard'];
    $Fecha_Creacion = $_POST['Fecha_Creacion'];
    $Fecha_Actualizacion = $_POST['Fecha_Actualizacion'];

    if (empty($Id_Permisos) || empty($Nombre) || empty($Nombre_Guard) || empty($Fecha_Creacion) || empty($Fecha_Actualizacion)) {
        echo "<script language='JavaScript'>
        alert('Por favor, complete todos los campos');
        </script>";
    } else {
        include("conexion_be.php");
        $Id_Permisos = mysqli_real_escape_string($conexion, $Id_Permisos);
        $Nombre = mysqli_real_escape_string($conexion, $Nombre);
        $Nombre_Guard = mysqli_real_escape_string($conexion, $Nombre_Guard);
        $Fecha_Creacion = mysqli_real_escape_string($conexion, $Fecha_Creacion);
        $Fecha_Actualizacion = mysqli_real_escape_string($conexion, $Fecha_Actualizacion);

        $sql = "INSERT INTO permisos (Id_Permisos, Nombre, Nombre_Guard, Fecha_Creacion, Fecha_Actualizacion) 
                VALUES ('$Id_Permisos', '$Nombre', '$Nombre_Guard', '$Fecha_Creacion', '$Fecha_Actualizacion')";
        
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