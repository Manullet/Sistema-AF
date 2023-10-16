<?php

    $Id_Permisos=$_GET['Id_Permisos'];
    include ("conexion_be.php");
    $sql="delete from permisos where Id_Permisos='".$Id_Permisos."'";
    $resultado=mysqli_query($conexion,$sql);

?>