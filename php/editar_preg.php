<?php
include("conexion_be.php");

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["Editar"])) {
    $Id_pregunta = $_POST["Id_pregunta"];
    $Pregunta = mysqli_real_escape_string($conexion, $_POST["Pregunta"]);
    $Fecha_Creacion = mysqli_real_escape_string($conexion, $_POST["Fecha_Creacion"]);
    $Fecha_Actualizacion = mysqli_real_escape_string($conexion, $_POST["Fecha_Actualizacion"]);

    // Verificar si el registro existe antes de actualizar
    $checkQuery = "SELECT * FROM preguntas WHERE Id_pregunta = '$Id_pregunta'";
    $checkResult = mysqli_query($conexion, $checkQuery);

    if (mysqli_num_rows($checkResult) === 1) {
        $updateQuery = "UPDATE preguntas SET Pregunta = '$Pregunta', Fecha_Creacion = '$Fecha_Creacion', Fecha_Actualizacion = '$Fecha_Actualizacion' WHERE Id_pregunta = '$Id_pregunta'";
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
    $Id_pregunta = $_GET["Id_pregunta"];

    // Verificar si el registro existe antes de editar
    $checkQuery = "SELECT * FROM preguntas WHERE Id_pregunta = '$Id_pregunta'";
    $checkResult = mysqli_query($conexion, $checkQuery);

    if (mysqli_num_rows($checkResult) === 1) {
        $row = mysqli_fetch_assoc($checkResult);
        $Pregunta = $row["Pregunta"];
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
    <title>Editar Pregunta</title>
</head>
<body>


<h1>Editar Pregunta</h1>
<form action="php/mant_pregunta.php" method="post">
        <label>Pregunta</label>
        <input type="text" name="Pregunta" value="<?=$Pregunta['Pregunta']?>"> <br>
        <label>Fecha Creación</label>
        <input type="text" name="Fecha_Creacion" value="<?=$Pregunta['Fecha_Creacion']?>"> <br>
        <label>Fecha Actualización</label>
        <input type="text" name="Fecha_Actualizacion" value="<?=$Pregunta['Fecha_Actualizacion']?>"> <br>
        <input type="submit" name="Editar" value="EDITAR">
        <a href="../bienvenida.php">Regresar</a>
    </form>
</body>
</html>
