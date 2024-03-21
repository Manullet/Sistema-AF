<?php
ob_start();
// Incluye el archivo de conexión
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

    $p_Tipo_De_Manejo = $_POST['razon'];
    $p_Superficie_Produccion = $_POST['superficieProduccion'];
    $p_Id_Medida_Produccion = $_POST['medidaProduccion'];
    $p_Superficie_Agricultura = $_POST['superficieAgricultura'];
    $p_Id_Medida_Agricultura = $_POST['medidaAgricultura'];
    $p_Superficie_Ganaderia = $_POST['areaGanaderia'];  // Añadido para reflejar el campo que faltaba
    $p_Id_Medida_Ganaderia = $_POST['Id_Superficie_Ganaderia'];
    $p_Superficie_Apicultura = $_POST['areaApicultura'];
    $p_Id_Medida_Apicultura = $_POST['Id_Superficie_Apicultura'];
    $p_Superficie_Forestal = $_POST['areaForestal'];
    $p_Id_Medida_Forestal = $_POST['Id_Superficie_Forestal'];
    $p_Superficie_Acuacultura = $_POST['areaAcuacultura'];
    $p_Numero_Estanques = $_POST['numEstanques'];
    $p_Superficie_Agroturismo = $_POST['areaAgroturismo'];
    $p_Superficie_Otros = $_POST['otrosUsos'];
    $creado_por = $_SESSION["usuario"]["usuario"];
    $p_Tiene_Riego = $_POST['tieneRiego'];
    $p_Superficie_Riego = $_POST['areaRiego'];
    $p_Id_Medida_Superficie_Riego = $_POST['medidaSuperficieRiego'];
    $p_Id_Tipo_Riego = $_POST['tipoRiego'];
    $p_Fuente_Agua = $_POST['fuenteAgua'];
    $p_Disponibilidad_Agua_Meses = $_POST['disponibilidadAguaMeses'];

    // Llamar al procedimiento almacenado
    $query = "CALL TempInsertarUnidadProductoraYRiego(
        $idUbicacion,
        $idFicha,
        $idProductor,
        '$p_Tipo_De_Manejo',
        '$p_Superficie_Produccion',
        '$p_Id_Medida_Produccion',
        '$p_Superficie_Agricultura',
        '$p_Id_Medida_Agricultura',
        '$p_Superficie_Ganaderia',
        '$p_Id_Medida_Ganaderia',
        '$p_Superficie_Apicultura',
        '$p_Id_Medida_Apicultura',
        '$p_Superficie_Forestal',
        '$p_Id_Medida_Forestal',
        '$p_Superficie_Acuacultura',
        '$p_Numero_Estanques',
        '$p_Superficie_Agroturismo',
        '$p_Superficie_Otros',
        '$creado_por',  
        '$p_Tiene_Riego',
        '$p_Superficie_Riego',
        '$p_Id_Medida_Superficie_Riego',
        '$p_Id_Tipo_Riego',
        '$p_Fuente_Agua',
        '$p_Disponibilidad_Agua_Meses'
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
