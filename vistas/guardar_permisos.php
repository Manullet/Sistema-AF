<?php
include '../php/conexion_be.php';
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Id_rol = $_POST["Id_rol"];
    $actualizado_por = $_SESSION["usuario"]['usuario'];

    // Array para almacenar los permisos seleccionados
    $permisos = [];

    // Iterar sobre los checkboxes y construir el array de permisos
    foreach ($_POST as $key => $value) {
        // Verificar si el nombre del campo es un checkbox de permiso
        if (strpos($key, 'crear_') === 0 || strpos($key, 'actualizar_') === 0 || strpos($key, 'eliminar_') === 0) {
            // Obtener el tipo de permiso y el ID del objeto
            $parts = explode('_', $key);
            $permiso = $parts[0];
            $id_objeto = $parts[1];

            // Determinar el valor del permiso (1 si está seleccionado, 0 si no)
            $valor_permiso = isset($_POST[$key]) ? 1 : 0;

            // Agregar el permiso al array de permisos
            $permisos[$id_objeto][$permiso] = $valor_permiso;
        }
    }

    // Insertar los permisos en la tabla
    foreach ($permisos as $id_objeto => $permiso) {
        // Obtener los valores de los permisos para el objeto actual
        $permiso_insercion = isset($permiso['crear']) ? $permiso['crear'] : 0;
        $permiso_actualizacion = isset($permiso['actualizar']) ? $permiso['actualizar'] : 0;
        $permiso_eliminacion = isset($permiso['eliminar']) ? $permiso['eliminar'] : 0;

        // Llamar al procedimiento almacenado con los valores correspondientes
        $sql = "CALL InsertOrUpdatePermiso('$Id_rol', '$permiso_eliminacion', '$id_objeto', '$permiso_actualizacion', '$permiso_insercion', '$actualizado_por')";

        if (mysqli_query($conexion, $sql)) {
            header("Location: ../bienvenida.php?success=true"); 
        } else {
            echo "Error al insertar el registro para el objeto $id_objeto: " . mysqli_error($conexion) . "<br>";
        }
    }

    mysqli_close($conexion);
    
      // Redireccionar al usuario de vuelta a la misma página
      
}
?>