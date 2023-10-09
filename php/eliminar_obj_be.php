<?php

    $Id_objetos=$_GET['Id_objetos'];
    include ("conexion_be.php");
    $sql="delete from objetos where Id_objetos='".$Id_objetos."'";
    $resultado=mysqli_query($conexion, $sql);
    echo "
                <script language='JavaScript'>
                    alert('Datos Actualizados');
                    location.assign('../index.php');
                </script>
            ";

?>