<?php
ob_start();
include "../php/conexion_be.php";
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos del formulario
    $idFicha=$_SESSION['id_ficha'];

    $sql = "SELECT id_productor from tbl_productor where id_ficha='$idFicha' limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();
   
    $idProductor = $row['id_productor'];

    $sql = "SELECT id_ubicacion from tbl_ubicacion_productor where id_productor=$idProductor limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();
   
    $idUbicacion = $row['id_ubicacion'];

    $p_Id_Tipo_Cultivo = $_POST['nombreCultivo'];
    $p_Superficie_Primera_Postrera = $_POST['tipoSiembra'];
    $p_Id_Medida_Primera_Postrera = $_POST['areaSembrada'];
    $p_Produccion_Obtenida = $_POST['produccionObtenida'];
    $p_Id_Medida_Produccion_Obtenida = $_POST['unidadMedidaProduccion'];
    $p_Cantidad_Vendida = $_POST['cantidadVendida'];
    $p_Id_Medida_Vendida = $_POST['unidadMedidaVenta'];
    $p_Precio_Venta = $_POST['precioVenta'];
    $p_A_Quien_Se_Vendio = $_POST['comprador'];
    $Creado_por = $_SESSION["usuario"]["usuario"];  // Reemplaza "NombreUsuario" con el nombre real del usuario o método para obtener el usuario actual


    // Llamar al procedimiento almacenado
    $query = "CALL INSERTProduccion_AgrAnterior(
        $idUbicacion,
        $idFicha,
        $idProductor,
        $p_Id_Tipo_Cultivo,
        '$p_Superficie_Primera_Postrera',
        $p_Id_Medida_Primera_Postrera,
        $p_Produccion_Obtenida,
        $p_Id_Medida_Produccion_Obtenida,
        $p_Cantidad_Vendida,
        $p_Id_Medida_Vendida,
        $p_Precio_Venta,
        '$p_A_Quien_Se_Vendio',
        '$Creado_por'
    )";

    $result = mysqli_query($conexion, $query);

    if ($result) {
        // Éxito: Redirige o realiza acciones adicionales
        header('Location: tu_pagina_exitosa.php');
        exit();
    } else {
        // Error en la consulta
        echo "Error al ejecutar la consulta: " . mysqli_error($conexion);
    }

    // Cierra la conexión a la base de datos
    mysqli_close($conexion);
}
?>
