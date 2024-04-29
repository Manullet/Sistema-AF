<?php
include "../php/conexion_be.php";

// Verificar si el formulario ha sido enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Validar y obtener datos del formulario
    $usuario = $_POST["usuario"];
    $contrasena_actual = $_POST["contrasena_actual"];
    $nueva_contrasena = $_POST["nueva_contrasena"];

    // Agregar más validaciones según sea necesario

    // Consultar la contraseña actual desde la base de datos
    $consulta = "SELECT contrasena, Id_Usuario FROM usuario WHERE usuario = ?";
    $stmt = $conexion->prepare($consulta);

    if ($stmt) {
        $stmt->bind_param("s", $usuario);
        $stmt->execute();
        $stmt->bind_result($contrasena_hash, $usuario_id);
        $stmt->fetch();
        $stmt->close();

        // Verificar si la contraseña actual es válida
        if (password_verify($contrasena_actual, $contrasena_hash)) {

            // Generar el hash para la nueva contraseña
            $nueva_contrasena_hash = password_hash($nueva_contrasena, PASSWORD_DEFAULT);

            // Verificar si la nueva contraseña ya existe en el historial
            $consulta_historial_existente = "SELECT contrasena_hash FROM historial_contrasenas WHERE usuario_id = ?";
            $stmt_historial_existente = $conexion->prepare($consulta_historial_existente);

            if ($stmt_historial_existente) {
                $stmt_historial_existente->bind_param("s", $usuario_id);
                $stmt_historial_existente->execute();
                $stmt_historial_existente->bind_result($contrasena_historial);

                while ($stmt_historial_existente->fetch()) {
                    if (password_verify($nueva_contrasena, $contrasena_historial)) {
                        // La nueva contraseña ya ha sido utilizada anteriormente
                        // Puedes mostrar un mensaje al usuario y redirigirlo
                        echo '
                            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                            <script>
                                document.addEventListener("DOMContentLoaded", function() {
                                    Swal.fire({
                                        title: "Error!",
                                        text: "La nueva contraseña ya ha sido utilizada anteriormente. Por favor, elige una nueva.",
                                        icon: "error",
                                        confirmButtonText: "Ok"
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            window.location = "../bienvenida.php";
                                        }
                                    });
                                });
                            </script>
                        ';
                        exit; // Agrega esta línea para evitar que el código continúe después de mostrar el mensaje de error.
                    }
                }

                $stmt_historial_existente->close();
            } else {
                // Manejar el caso de error en la consulta del historial existente
                echo '
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                    <script>
                        document.addEventListener("DOMContentLoaded", function() {
                            Swal.fire({
                                title: "Error!",
                                text: "Error en la consulta del historial existente. Contacta al administrador para obtener ayuda.",
                                icon: "error",
                                confirmButtonText: "Ok"
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    window.location = "../bienvenida.php";
                                }
                            });
                        });
                    </script>
                ';
                exit; // Agrega esta línea para evitar que el código continúe después de mostrar el mensaje de error.
            }

            // Actualizar la contraseña en la base de datos
            $update_query = "UPDATE usuario SET contrasena = ? WHERE usuario = ?";
            $stmt_update = $conexion->prepare($update_query);

            if ($stmt_update) {
                $stmt_update->bind_param("ss", $nueva_contrasena_hash, $usuario);
                $stmt_update->execute();
                $stmt_update->close();

                // Insertar la nueva contraseña en el historial
                $insert_historial_query = "INSERT INTO historial_contrasenas (usuario_id, contrasena_hash) VALUES (?, ?)";
                $stmt_insert_historial = $conexion->prepare($insert_historial_query);

                if ($stmt_insert_historial) {
                    $stmt_insert_historial->bind_param("ss", $usuario_id, $nueva_contrasena_hash);
                    $stmt_insert_historial->execute();
                    $stmt_insert_historial->close();
                }

                echo '
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                    <script>
                        document.addEventListener("DOMContentLoaded", function() {
                            Swal.fire({
                                title: "Contraseña actualizada!",
                                text: "Contraseña Actualizada Correctamente",
                                icon: "success",
                                confirmButtonText: "Ok"
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    window.location = "../bienvenida.php";
                                }
                            });
                        });
                    </script>
                ';
            } else {
                // Manejar el caso de error al actualizar la contraseña
                echo '
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                    <script>
                        document.addEventListener("DOMContentLoaded", function() {
                            Swal.fire({
                                title: "Error!",
                                text: "Error al actualizar la contraseña. Contacta al administrador para obtener ayuda.",
                                icon: "error",
                                confirmButtonText: "Ok"
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    window.location = "../bienvenida.php";
                                }
                            });
                        });
                    </script>
                ';
            }

        } else {
            // La contraseña actual no coincide
            // Puedes mostrar un mensaje al usuario y redirigirlo
            echo '
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <script>
                    document.addEventListener("DOMContentLoaded", function() {
                        Swal.fire({
                            title: "Error!",
                            text: "La contraseña actual no coincide. Inténtalo nuevamente.",
                            icon: "error",
                            confirmButtonText: "Ok"
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location = "../bienvenida.php";
                            }
                        });
                    });
                </script>
            ';
        }
    } else {
        // Manejar el caso de error en la consulta de la contraseña actual
        echo '
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    Swal.fire({
                        title: "Error!",
                        text: "Error al consultar la contraseña actual. Contacta al administrador para obtener ayuda.",
                        icon: "error",
                        confirmButtonText: "Ok"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location = "../bienvenida.php";
                        }
                    });
                });
            </script>
        ';
    }
}

// Cerrar la conexión a la base de datos al finalizar
$conexion->close();
?>
