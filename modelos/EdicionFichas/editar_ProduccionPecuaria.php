<?php
ob_start();
include "../../php/conexion_be.php";
session_start();

//Se guarda el dato del usuario creador
$creado_por = $_SESSION["usuario"]["usuario"]; // Reemplaza con la lógica adecuada para obtener el nombre de usuario

 // Obtener datos del formulario
 $idFicha=$_SESSION['id_ficha'];

 $sql = "SELECT id_productor from tbl_productor where id_ficha='$idFicha' limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();
   
    $idProductor = $row['id_productor'];

    $sql = "SELECT id_ubicacion from tbl_ubicacion_productor where id_productor=$idProductor limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();
   
    $idUbicacion = $row['id_ubicacion'];

    // Decodificar los datos JSON a un array PHP
    $jsonData = file_get_contents('php://input');

// Verificar si se recibieron datos
if (!empty($jsonData)) {
    // Decodificar los datos JSON a un array PHP
    $data = json_decode($jsonData, true);

    if ($data !== null) {
        // Bandera para verificar si hubo algún error en las inserciones
        $error = false;

        // Consulta DELETE
        $sql = "DELETE FROM tbl_produccion_pecuaria WHERE Id_Ficha = '$idFicha' 
        and Id_Productor = '$idProductor' and Id_Ubicacion = '$idUbicacion'";
        $result = $conexion->query($sql);

        foreach ($data as $fila) {
            $cantidadMachos=0;
            $cantidadHembras=0;

            $tipoPecuario = mysqli_real_escape_string($conexion, $fila[0]);
            $genero = mysqli_real_escape_string($conexion, $fila[1]);
            $cantidad = (int)$fila[2];

            if($genero=='Hembra'){
                $cantidadHembras= $cantidad;

            }else{
                $cantidadMachos=$cantidad;
            }

            //$cantidadTotal=$cantidadHembras+$cantidadMachos;

            $query = "SELECT id_tipo_pecuario FROM tbl_tipo_pecuarios WHERE tipo_pecuario = '$tipoPecuario' limit 1";
            $result = mysqli_query($conexion, $query);

            if ($result) {
                // Verificar si se encontró el ID del motivo
                if ($row = mysqli_fetch_assoc($result)) {
                    $idTipo = $row['id_tipo_pecuario'];
                }
            }
        
            // Consulta SQL para insertar los datos en la tabla
            $sql = "INSERT INTO tbl_produccion_pecuaria(Id_Ficha, Id_Ubicacion, Id_Productor, Año_Produccion, Id_Tipo_Pecuario,
                    Cantidad_Hembras, Cantidad_Machos, Cantidad_Total, Creado_Por, Fecha_Creacion)
                    VALUES($idFicha,$idUbicacion,$idProductor,'a', $idTipo, $cantidadHembras, $cantidadMachos, $cantidadHembras+$cantidadMachos,
                    NULL, now())";
        
            // Ejecutar la consulta
            if (!mysqli_query($conexion, $sql)) {
                // Si hay un error en alguna de las inserciones, establece la bandera a true
                $error = true;
                echo "Error al guardar los datos: " . mysqli_error($conexion);
                break;
            }
        }

        // Si no hubo errores en las inserciones, redirige a la siguiente página
        if (!$error) {
            // Redirige a la siguiente página
            exit(); // Detener la ejecución del script
        }

        // Cierra la conexión a la base de datos
        mysqli_close($conexion);
        
        // Puedes enviar una respuesta al cliente si es necesario
        echo "Datos recibidos correctamente.";

    } else {
        echo "Error al decodificar los datos JSON.";
    }
} else {
    echo "No se recibieron datos.";
}

?>
