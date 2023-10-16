<?php
include("conexion_be.php");

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["Editar"])) {
    $Id_pregunta = $_POST["Id_pregunta"];
    $Pregunta = mysqli_real_escape_string($conexion, $_POST["Pregunta"]);
    $Actualizado_Por = mysqli_real_escape_string($conexion, $_POST["Actualizado_Por"]);
    $Creador_Por = mysqli_real_escape_string($conexion, $_POST["Creador_Por"]);

    // Verificar si el registro existe antes de actualizar
    $checkQuery = "SELECT * FROM preguntas WHERE Id_preguntas = '$Id_preguntas'";
    $checkResult = mysqli_query($conexion, $checkQuery);

    if (mysqli_num_rows($checkResult) === 1) {
        $updateQuery = "UPDATE preguntas SET Pregunta = '$Pregunta', Actualizado_Por = '$Actualizado_Por', 
        Creador_Por = '$Creador_Por' WHERE Id_preguntas = '$Id_preguntas'";
        $updateResult = mysqli_query($conexion, $updateQuery);

        if ($updateResult) {
            echo "
                <script language='JavaScript'>
                    alert('Datos Actualizados');
                    location.assign('../bienvenida.php');
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
    $Id_pregunta = $_GET["Id_pregunta"];

    // Verificar si el registro existe antes de editar
    $checkQuery = "SELECT * FROM preguntas WHERE Id_pregunta = '$Id_pregunta'";
    $checkResult = mysqli_query($conexion, $checkQuery);

    if (mysqli_num_rows($checkResult) === 1) {
        $row = mysqli_fetch_assoc($checkResult);
        $Pregunta = $row["Pregunta"];
        $Actualizado_Por = $row["Actualizado_Por"];
        $Creador_Por = $row["Creador_Por"];
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
    <title>Editar Pregunta</title>
</head>
<body>
<h1>Editar Pregunta</h1>
<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
    <label>Pregunta</label>
    <input type="text" name="Pregunta" value="<?php echo $Pregunta; ?>"> <br>
    <label>Actualizado Por</label>
    <input type="text" name="Actualizado_Por" value="<?php echo $Actualizado_Por; ?>"> <br>
    <label>Creado Por</label>
    <input type="text" name="Creado_Por" value="<?php echo $Creador_Por; ?>"> <br>
    <input type="hidden" name="Id_pregunta" value="<?php echo $Id_pregunta; ?>">
    <input type="submit" name="Editar" value="EDITAR">
    <a href="../bienvenida.php">Regresar</a>
</form>
</body>
</html>
