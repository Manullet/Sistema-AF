<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES["archivo_sql"])) {
    // Variables de conexión a la base de datos
    $db_host = 'localhost';
    $db_name = 'bd_af_p';
    $db_user = 'root';
    $db_pass = ''; 

    $archivo_temporal = $_FILES["archivo_sql"]["tmp_name"];

    // Conecta a la base de datos
    $conexion = new mysqli($db_host, $db_user, $db_pass, $db_name);

// Verificar la conexión
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}

// Abrir el archivo de respaldo SQL
$handle = fopen($archivo_temporal, "r");

if ($handle) {
    $query = '';
    // Lee el archivo línea por línea
    while (($line = fgets($handle)) !== false) {
        // Ignora líneas en blanco y comentarios
        if (trim($line) != '' && strpos($line, '--') === false) {
            // Omitir instrucciones DELIMITER
            if (strpos($line, 'DELIMITER') !== false) {
                continue;
            }
            $query .= $line;
            // Si la línea termina con un punto y coma, ejecuta la consulta
            if (substr(trim($line), -1, 1) == ';') {
                if ($conexion->query($query) === false) {
                    echo "Error en la consulta: " . $query . "<br>" . $conexion->error;
                }
                // Restablecer la variable de consulta
                $query = '';
            }
        }
    }

    // Cierra el archivo
    fclose($handle);
    // Si quedó alguna consulta pendiente sin ejecutar
    if (!empty($query)) {
        if ($conexion->query($query) === false) {
            echo "Error en la consulta: " . $query . "<br>" . $conexion->error;
        }
    }

    echo "Importación de respaldo completada exitosamente.";
} else {
    echo "Error al abrir el archivo.";
}

// Cerrar la conexión
$conexion->close();
} else {
    echo "Acceso no autorizado.";
}
?>
