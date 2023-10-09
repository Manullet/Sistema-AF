<?php
include("conexion_be.php");

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["Editar"])) {
    $Id_objetos = $_POST["Id_objetos"];
    $Objeto = mysqli_real_escape_string($conexion, $_POST["Objeto"]);
    $Descripcion = mysqli_real_escape_string($conexion, $_POST["Descripcion"]);
    $Status = mysqli_real_escape_string($conexion, $_POST["Status"]);

    // Verificar si el registro existe antes de actualizar
    $checkQuery = "SELECT * FROM objetos WHERE Id_objetos = '$Id_objetos'";
    $checkResult = mysqli_query($conexion, $checkQuery);

    if (mysqli_num_rows($checkResult) === 1) {
        $updateQuery = "UPDATE objetos SET Objeto = '$Objeto', Descripcion = '$Descripcion', Status = '$Status' WHERE Id_objetos = '$Id_objetos'";
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
    $Id_objetos = $_GET["Id_objetos"];

    // Verificar si el registro existe antes de editar
    $checkQuery = "SELECT * FROM objetos WHERE Id_objetos = '$Id_objetos'";
    $checkResult = mysqli_query($conexion, $checkQuery);

    if (mysqli_num_rows($checkResult) === 1) {
        $row = mysqli_fetch_assoc($checkResult);
        $Objeto = $row["Objeto"];
        $Descripcion = $row["Descripcion"];
        $Status = $row["Status"];
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
    <title>Editar Objeto</title>
</head>
<body>
<h1>Editar Objeto</h1>
<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
    <label>Objeto</label>
    <input type="text" name="Objeto" value="<?php echo $Objeto; ?>"> <br>
    <label>Descripción</label>
    <input type="text" name="Descripcion" value="<?php echo $Descripcion; ?>"> <br>
    <label>Status</label>
    <input type="text" name="Status" value="<?php echo $Status; ?>"> <br>
    <input type="hidden" name="Id_objetos" value="<?php echo $Id_objetos; ?>">
    <input type="submit" name="Editar" value="EDITAR">
    <a href="../bienvenida.php">Regresar</a>
</form>
</body>
</html>
