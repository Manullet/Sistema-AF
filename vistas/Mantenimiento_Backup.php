<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generador de Backup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/estilos.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>

    <div class="containertable text-center">
        <!-- Título -->
        <h1 class="poppins-font mb-3">Generador de Backup</h1>

        <!-- Imagen de la base de datos -->
        <div>
            <img src="assets/images/img-backup.jpg" alt="Imagen de la base de datos" class="img-fluid" style="max-width: 100%;">
        </div>

        <!-- Botón debajo de la imagen -->
        <div class="mt-3">
            <button type="button" class="btn btn-success" id="excelButton">Generar Backup</button>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
    <!-- ... (resto de tus scripts) ... -->

    <script>
        document.getElementById("excelButton").addEventListener("click", function() {
            // Redirigir a excel.php al hacer clic en el botón de Excel
            window.location.href = "respaldo/backup.php";
        });
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.8/xlsx.full.min.js"></script>
    <!-- ... (resto de tus scripts) ... -->

    <script>
        document.getElementById("excelButton").addEventListener("click", function() {
            // Código para generar el archivo Excel usando SheetJS
            const data = [
                ["Nombre", "Edad"],
                ["Juan", 30],
                ["María", 25],
                ["Pedro", 28]
            ];
            const ws = XLSX.utils.aoa_to_sheet(data);
            const wb = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(wb, ws, "Hoja1");
            XLSX.writeFile(wb, "datos.xlsx");
        });
    </script>

</body>

</html>
