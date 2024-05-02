<?php
include 'conexion_be.php';

// Verifica si se ha enviado un formulario y si se proporcionó un ID de rol válido
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["Id_rol"])) {
    // Obtiene el ID de rol desde el formulario
    $Id_rol = $_POST["Id_rol"];

    $sql = "SELECT * from usuario where id_rol='$Id_rol' limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();

    if($row  > 0){
        echo json_encode(array("error" => true));
        die();
    }

    $sql = "SELECT * from permisos where id_rol='$Id_rol' limit 1";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();

    if($row  > 0){
        echo json_encode(array("error" => true));
        die();
    }

    // Crea una consulta SQL para eliminar el rol con el ID proporcionado
    $delete_query = "DELETE FROM roles WHERE Id_rol = '$Id_rol'";
    
    if (mysqli_query($conexion, $delete_query)) {
        // Éxito en la eliminación
        echo json_encode(array("success" => true));
        exit();
    } else {
        // Error en la eliminación
        echo json_encode(array("success" => false));
        exit();
    }
}
?>