<?php
$db_host = 'localhost';
$db_name = 'bd_af_p';
$db_user = 'root';
$db_pass = ''; // Deja la contraseña vacía si no hay una

include "../php/conexion_be.php";

$fecha = date("Ymd-His");

$salida_sql = $db_name . '_' . $fecha . '.sql';

// Modifica la ruta completa al ejecutable mysqldump
$mysqldump_path = 'C:\\xampp\\mysql\\bin\\mysqldump.exe';

// Construir el comando mysqldump con opciones para incluir procedimientos almacenados y triggers
$dump_command = $db_pass !== '' ?
    "\"$mysqldump_path\" -h$db_host -u$db_user -p$db_pass --opt --routines --triggers $db_name > $salida_sql" :
    "\"$mysqldump_path\" -h$db_host -u$db_user --opt --routines --triggers $db_name > $salida_sql";

// Ejecutar el comando mysqldump y capturar la salida y el código de retorno
exec($dump_command, $output, $return_code);

if ($return_code !== 0) {
    echo "Error en la ejecución de mysqldump: " . implode("\n", $output);
    exit; // Salir del script en caso de error
}

$zip = new ZipArchive();

$salida_zip = $db_name . '_' . $fecha . '.zip';

if ($zip->open($salida_zip, ZipArchive::CREATE) === true) {
    $zip->addFile($salida_sql, basename($salida_sql));
    $zip->close();
    unlink($salida_sql);

    header("Location: $salida_zip");
    exit; // Asegurarse de salir después de redirigir para evitar problemas adicionales

} else {
    echo 'ERROR al crear el archivo ZIP';
    exit; // Salir en caso de error al crear el archivo ZIP
}
?>
