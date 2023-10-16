<?php
include("conexion_be.php");

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["Editar"])) {
    $Id_Permisos = $_POST["Id_Permisos"];
    $Nombre = mysqli_real_escape_string($conexion, $_POST["Nombre"]);
    $Nombre_Guard = mysqli_real_escape_string($conexion, $_POST["Nombre_Guard"]);
    $Fecha_Creacion = mysqli_real_escape_string($conexion, $_POST["Fecha_Creacion"]);
    $Fecha_Actualizacion = mysqli_real_escape_string($conexion, $_POST["Fecha_Actualizacion"]);

    // Verificar si el registro existe antes de actualizar
    $checkQuery = "SELECT * FROM permisos WHERE Id_Permisos = '$Id_Permisos'";
    $checkResult = mysqli_query($conexion, $checkQuery);

    if (mysqli_num_rows($checkResult) === 1) {
        $updateQuery = "UPDATE permisos SET Nombre = '$Nombre', Nombre_Guard = '$Nombre_Guard', Fecha_Creacion = '$Fecha_Creacion', Fecha_Actualizacion = '$Fecha_Actualizacion' WHERE Id_Permisos = '$Id_Permisos'";
        $updateResult = mysqli_query($conexion, $updateQuery);

        if ($updateResult) {
            echo "
                <script language='JavaScript'>
                    alert('Datos Actualizados');
                    location.assign('bienvenida.php');
                </script>
            ";
        } else {
            echo "
                <script language='JavaScript'>
                    alert('Error al actualizar los datos');
                    location.assign('bienvenida.php');
                </script>
            ";
        }
    } else {
        echo "
            <script language='JavaScript'>
                alert('El registro no existe');
                location.assign('bienvenida.php');
            </script>
        ";
    }

    mysqli_close($conexion);
} else {
    $Id_Permisos = $_GET["Id_Permisos"];

    // Verificar si el registro existe antes de editar
    $checkQuery = "SELECT * FROM permisos WHERE Id_Permisos = '$Id_Permisos'";
    $checkResult = mysqli_query($conexion, $checkQuery);

    if (mysqli_num_rows($checkResult) === 1) {
        $row = mysqli_fetch_assoc($checkResult);
        $Nombre = $row["Nombre"];
        $Nombre_Guard = $row["Nombre_Guard"];
        $Fecha_Creacion = $row["Fecha_Creacion"];
        $Fecha_Actualizacion = $row["Fecha_Actualizacion"];
    } else {
        echo "
            <script language='JavaScript'>
                alert('El registro no existe');
                location.assign('bienvenida.php');
            </script>
        ";
    }

    mysqli_close($conexion);
}
?>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../dist/css/diseño.css">
    <title>Editar Permiso</title>
</head>
<body>
<h1>Editar Permiso</h1>
<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
    <label>Nombre</label>
    <input type="text" name="Nombre" value="<?php echo $Nombre; ?>"> <br>
    <label>Nombre_Guard</label>
    <input type="text" name="Nombre_Guard" value="<?php echo $Nombre_Guard; ?>"> <br>
    <label>Fecha_Creacion</label>
    <input type="date" name="Fecha_Creacion" value="<?php echo $Fecha_Creacion; ?>"> <br>
    <label>Fecha_Actualizacion</label>
    <input type="date" name="Fecha_Actualizacion" value="<?php echo $Fecha_Actualizacion; ?>"> <br>
    <input type="hidden" name="Id_Permisos" value="<?php echo $Id_Permisos; ?>">
    <input type="submit" name="Editar" value="EDITAR">
    <a href="../bienvenida.php">Regresar</a>
</form>
</body>
</html>
