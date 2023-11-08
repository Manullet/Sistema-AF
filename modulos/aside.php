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

                <li class="nav-item has-treeview">
                    <a style="cursor:pointer;" class="nav-link">
                        <i class="nav-icon bi bi-gear"></i>
                        <p>
                            Mantenimiento
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
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
                        <!-- desde aqui se puede añadir mas Mantenimientos -->
                    </ul>
                </li>

                <li class="nav-item has-treeview">
                    <a style="cursor:pointer;" class="nav-link">
                        <i class="nav-icon bi bi-gear"></i>
                        <p>
                            Tablas
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">

                  
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_Migracion.php','content-wrapper')">
                        <i class="bi bi-airplane-fill"></i>
                        <p>Motivos Migracion</p>
                    </a>
                </li>

                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_Periodicidad.php','content-wrapper')">
                        <i class="bi bi-calendar-event"></i>
                        <p>Periodo</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_Cultivo.php','content-wrapper')">
                        <i class="bi bi-flower2"></i>
                        <p>Cultivo</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_Riego.php','content-wrapper')">
                        <i class="bi bi-droplet-half"></i>
                        <p>Riego</p>
                    </a>
                </li>

                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_Organizaciones.php','content-wrapper')">
                        <i class="bi bi-buildings-fill"></i>
                        <p>Organizaciones</p>
                    </a>
                </li>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_Tipo_Negocios.php','content-wrapper')">
                        <i class="bi bi-briefcase-fill"></i>
                        <p>Negocio</p>
                    </a>
                </li>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_Tipo_Organizacion.php','content-wrapper')">
                        <i class="bi bi-buildings"></i>
                        <p>Tipos Organización</p>
                    </a>
                </li>

                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_Tipo_Produccion.php','content-wrapper')">
                        <i class="bi bi-basket"></i>
                        <p>Tipos Producción</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_Practicas_Productivas.php','content-wrapper')">
                        <i class="bi bi-pin-map"></i>
                        <p>Practicas/Productivas</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_tomaD.php','content-wrapper')">
                    <i class="bi bi-graph-up"></i>
                        <p>Toma de decisiones</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_tipoT.php','content-wrapper')">
                    <i class="bi bi-people"></i>
                        <p>Tipo de trabajadores</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_medidas.php','content-wrapper')">
                    <i class="bi bi-ui-radios"></i>
                        <p>Medidas de tierra</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_apoyo.php','content-wrapper')">
                    <i class="bi bi-bar-chart-fill"></i>
                        <p>Apoyo</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_tipoA.php','content-wrapper')">
                    <i class="bi bi-bar-chart"></i>
                        <p>Tipo de apoyo</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_etnias.php','content-wrapper')">
                        <i class="bi bi-people"></i>
                        <p>Etnias</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_FuentesCredito.php','content-wrapper')">
                    <i class="bi bi-credit-card"></i>
                        <p>Fuentes de Credito</p>
                    </a>
                </li>
                <li class="nav-item nav-item-custom">
                    <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_Tipo_Pecuarios.php','content-wrapper')">
                    <i class="bi bi-house-door"></i>
                        <p>Tipo de Pecuarios</p>
                    </a>
                </li>
                    <!-- desde aqui se pueden añadir mas Mantenimientos -->
                    </ul>
                    <li class="nav-item has-treeview">
                    <a style="cursor:pointer;" class="nav-link">
                        <i class="bi bi-globe-americas"></i>
                        <p>
                            Ubicación
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">

                    <li class="nav-item nav-item-custom">
                        <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_Departamento.php','content-wrapper')">
                            <i class="bi bi-geo-alt-fill"></i>
                            <p>Departamento</p>
                        </a>
                     </li>
                     <li class="nav-item nav-item-custom">
                        <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_Municipio.php','content-wrapper')">
                            <i class="bi bi-geo-alt-fill"></i>
                            <p>Municipio</p>
                        </a>
                     </li>
                     <li class="nav-item nav-item-custom">
                        <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_Aldea.php','content-wrapper')">
                            <i class="bi bi-geo-alt-fill"></i>
                            <p>Aldea</p>
                        </a>
                     </li>
                     <li class="nav-item nav-item-custom">
                        <a style="cursor:pointer;" class="nav-link" onclick="CargarContenido('vistas/Mantenimiento_Cacerio.php','content-wrapper')">
                            <i class="bi bi-geo-alt-fill"></i>
                            <p>Cacerio</p>
                        </a>
                     </li>






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
