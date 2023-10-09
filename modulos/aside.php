

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
        <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
            style="opacity: .8">
        <span class="brand-text font-weight-light">Agricultura Familiar</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">

       

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

            <li class="nav-item">
                    <a style="cursor:pointer;" class="nav-link active" onclick="CargarContenido('vistas/dashboard.php','content-wrapper')">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Tablero Principal
                            <span class="right badge badge-danger"></span>
                        </p>
                    </a>
                </li>            
                        
                
                <li class="nav-item">
                <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_obejetos.php','content-wrapper')">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Mantenimiento Obejetos
                            <span class="right badge badge-danger"></span>
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_usuarios.php','content-wrapper')">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Mantenimiento Usuarios
                            <span class="right badge badge-danger"></span>
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_permisos.php','content-wrapper')">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Mantenimiento Permisos
                            <span class="right badge badge-danger"></span>
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_preguntas.php','content-wrapper')">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Mantenimiento Preguntas
                            <span class="right badge badge-danger"></span>
                        </p>
                    </a>
                </li>
                </li>
                <li class="nav-item">
                <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_roles.php','content-wrapper')">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Mantenimiento Roles
                            <span class="right badge badge-danger"></span>
                        </p>
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
      <a href="cambiar_contraseña.php">Cambiar Contraseña</a>
    </div>
  </aside>

<script>

    $(".nav-link").on('click',function(){
        $(".nav-link").removeClass('active');
        $(this).addClass('active');
    })

</script>