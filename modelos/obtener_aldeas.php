<?php
// Requerir el archivo de conexión
require '../php/conexion_be.php';

// Obtener el ID del municipio enviado por la solicitud AJAX
$municipio = $_GET['municipio'];

// Consultar las aldeas relacionadas con el municipio seleccionado
$sql = "SELECT Id_Aldea, Nombre_Aldea FROM tbl_aldeas WHERE Id_Municipio = $municipio AND Estado = 'A'";
$result = $conexion->query($sql);

// Generar las opciones de aldeas
$options = "";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $options .= "<option value='" . $row["Id_Aldea"] . "'>" . $row["Nombre_Aldea"] . "</option>";
    }
} else {
    $options .= "<option value=''>No hay aldeas disponibles</option>";
}

// Enviar las opciones de aldeas al cliente
echo $options;

// Cerrar la conexión
$conexion->close();
?>
