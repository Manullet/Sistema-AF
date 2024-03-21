<?php
// Incluir el archivo de conexión

error_reporting(E_ALL);
ini_set('display_errors', 1);

// Resto del código del archivo obtener_municipios.php continuará aquí...


require '../php/conexion_be.php';

// Obtener el ID del departamento enviado por la solicitud AJAX
$departamento = $_GET['departamento'];
echo "Departamento seleccionado: " . $departamento;

// Consultar los municipios relacionados con el departamento seleccionado
$sql = "SELECT Id_Municipio, Nombre_Municipio FROM tbl_municipios WHERE Id_Departamento = $departamento AND Estado = 'A'";
$result = $conexion->query($sql);

// Generar las opciones de municipios
$options = "";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $options .= "<option value='" . $row["Id_Municipio"] . "'>" . $row["Nombre_Municipio"] . "</option>";
    }
} else {
    $options .= "<option value=''>No hay municipios disponibles</option>";
}

// Enviar las opciones de municipios al cliente
echo $options;

// No es necesario cerrar la conexión aquí, ya que se cerrará automáticamente al finalizar el script
?>
