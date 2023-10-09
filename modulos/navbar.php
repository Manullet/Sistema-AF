<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
        <a style="cursor:pointer;" class="nav-link active" onclick="CargarContenido('vistas/dashboard.php','content-wrapper')">
                Inicio</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="/sistema-af/php/cerrar_sesion.php" class="nav-link">Cerrar Sesion</a> <!-- cambiar la direccion  -->
        </li>
        <li class="nav-item d-none d-sm-inline-block">
        <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_obejetos.php','content-wrapper')">
                Mantenimiento Obejetos</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
        <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_usuarios.php','content-wrapper')">
                Mantenimiento Usuarios</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
        <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_permisos.php','content-wrapper')">
                Mantenimiento Permisos</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
        <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_preguntas.php','content-wrapper')">
                Mantenimiento Preguntas</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
        <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_roles.php','content-wrapper')">
                Mantenimiento Roles</a>
        </li>
    </ul>


</nav>
<!-- /.navbar -->