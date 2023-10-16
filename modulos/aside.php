<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4" style="padding-top: 20px;">
    <!-- Brand Logo -->
    <a href="bienvenida.php" class="brand-link" style="display: flex; flex-direction: column; align-items: center;">
        <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
         <span class="poppins-font-aside mb-2" style="text-align: center;">AGRICULTURA FAMILIAR</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar" style="padding-top: 30px;">

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link active" onclick="CargarContenido('vistas/dashboard.php','content-wrapper')">
                        <i class="nav-icon bi bi-house-door"></i>
                        <p>Inicio</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_obejetos.php','content-wrapper')">
                        <i class="nav-icon bi bi-gear"></i>
                        <p>Objetos</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_usuarios.php','content-wrapper')">
                        <i class="nav-icon bi bi-people-fill"></i>
                        <p>Usuarios</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_permisos.php','content-wrapper')">
                        <i class="nav-icon bi bi-shield-lock"></i>
                        <p>Permisos</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_preguntas.php','content-wrapper')">
                        <i class="nav-icon bi bi-question-circle"></i>
                        <p>Preguntas</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_roles.php','content-wrapper')">
                        <i class="nav-icon bi bi-badge-ad"></i>
                        <p>Roles</p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>


<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
        <h5>Bienvenido</h5>
    </div>
</aside>
<!-- /.control-sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
        <h5>Mi Perfil</h5>
        <a href="modelos\cambiar_contraseña.php">Cambiar Contraseña</a>
    </div>
</aside>

<script>
    $(".nav-link").on('click', function() {
        $(".nav-link").removeClass('active');
        $(this).addClass('active');
    })
</script>