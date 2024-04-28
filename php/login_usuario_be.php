<?php
session_start();
include 'conexion_be.php';

$correo = trim($_POST['correo']);
$contrasena = trim($_POST['contrasena']);

$consulta = "SELECT * FROM usuario WHERE correo = ?";
$stmt = mysqli_prepare($conexion, $consulta);
mysqli_stmt_bind_param($stmt, "s", $correo);
mysqli_stmt_execute($stmt);

$resultado = mysqli_stmt_get_result($stmt);

if ($usuario = mysqli_fetch_assoc($resultado)) {
    // Verificar la contraseña encriptada
    if (password_verify($contrasena, $usuario['contrasena'])) {
        // Cookies cache

        if ($usuario['id_estado'] == 1) {
            $_SESSION['usuario'] = $usuario;
            // Usuario activo
            $_SESSION['url'] = '';
            $_SESSION['content-wrapper'] = '';

            // Verificar si el usuario está bloqueado
            if ($usuario['id_estado'] != 4) {
                // Reiniciar los intentos fallidos a cero
                $updateIntentosQuery = "UPDATE usuario SET Intentos_Fallidos = 0 WHERE Id_Usuario = ?";
                $stmt = mysqli_prepare($conexion, $updateIntentosQuery);
                mysqli_stmt_bind_param($stmt, "i", $usuario['Id_Usuario']);
                mysqli_stmt_execute($stmt);

                echo 'Intentos reiniciados a cero.';
            }

            if ($usuario['Primera_Vez'] == 1) {
                header("Location: configurar_usuario.php");
            } else {
                header("Location: ../bienvenida.php");
            }

            exit();
        } elseif ($usuario['id_estado'] == 2) {
            // Usuario inactivo
            echo '
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    Swal.fire({
                        title: "Error!",
                        text: "Tu cuenta está inactiva. Contacta al administrador para obtener ayuda",
                        icon: "error",
                        confirmButtonText: "Ok"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location = "../index.php";
                        }
                    });
                });
            </script>
        ';
        } elseif ($usuario['id_estado'] == 3) {
            // Usuario nuevo
            $_SESSION['usuario'] = $usuario;
            $_SESSION['url'] = '';
            $_SESSION['content-wrapper'] = '';
            header("Location: ../php/insertar_respuesta.php");
            //header("Location: ../php/cambiar_contrasena_nuevo.php");
            exit();
        } elseif ($usuario['id_estado'] == 4) {
            // Usuario bloqueado
            echo '
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    Swal.fire({
                        title: "Error!",
                        text: "Tu cuenta está bloqueada. Contacta al administrador para obtener ayuda",
                        icon: "error",
                        confirmButtonText: "Ok"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location = "../index.php";
                        }
                    });
                });
            </script>
        ';
        } else {
            // Estado no reconocido
            echo '
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    Swal.fire({
                        title: "Error!",
                        text: "Estado No Reconocido",
                        icon: "error",
                        confirmButtonText: "Ok"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location = "../index.php";
                        }
                    });
                });
            </script>
        ';
        }
    } else {
        // Contraseña incorrecta
        // Incrementar el contador de intentos fallidos
        $consulta_incrementar_intentos = "UPDATE usuario SET Intentos_Fallidos = Intentos_Fallidos + 1 WHERE correo = ?";
        $stmt_incrementar_intentos = mysqli_prepare($conexion, $consulta_incrementar_intentos);
        mysqli_stmt_bind_param($stmt_incrementar_intentos, "s", $correo);
        mysqli_stmt_execute($stmt_incrementar_intentos);

        // Obtener el nuevo valor de intentos fallidos
        $consulta_intentos_actuales = "SELECT Intentos_Fallidos FROM usuario WHERE correo = ?";
        $stmt_intentos_actuales = mysqli_prepare($conexion, $consulta_intentos_actuales);
        mysqli_stmt_bind_param($stmt_intentos_actuales, "s", $correo);
        mysqli_stmt_execute($stmt_intentos_actuales);

        $resultado_intentos_actuales = mysqli_stmt_get_result($stmt_intentos_actuales);
        $usuario_intentos_actuales = mysqli_fetch_assoc($resultado_intentos_actuales);

        $intentos_fallidos_actuales = isset($usuario_intentos_actuales['Intentos_Fallidos']) ? $usuario_intentos_actuales['Intentos_Fallidos'] : 0;

        if ($intentos_fallidos_actuales >= 3) {
            // Si hay 3 o más intentos fallidos, bloquear al usuario
            $consulta_bloquear_usuario = "UPDATE usuario SET id_estado = 4 WHERE correo = ?";
            $stmt_bloquear_usuario = mysqli_prepare($conexion, $consulta_bloquear_usuario);
            mysqli_stmt_bind_param($stmt_bloquear_usuario, "s", $correo);
            mysqli_stmt_execute($stmt_bloquear_usuario);

            echo '
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    Swal.fire({
                        title: "Error!",
                        text: "Tu cuenta está bloqueada debido a múltiples intentos fallidos. Contacta al administrador para obtener ayuda",
                        icon: "error",
                        confirmButtonText: "Ok"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location = "../index.php";
                        }
                    });
                });
            </script>
        ';
        exit();
        } else {
            echo '
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    Swal.fire({
                        title: "Error!",
                        text: "Contraseña incorrecta",
                        icon: "error",
                        confirmButtonText: "Ok"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location = "../index.php";
                        }
                    });
                });
            </script>
        ';
        }
    }
} else {
    // Usuario no encontrado
    echo '
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            Swal.fire({
                title: "Error!",
                text: "Usuario no encontrado",
                icon: "error",
                confirmButtonText: "Ok"
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location = "../index.php";
                }
            });
        });
    </script>
';
}
?>
