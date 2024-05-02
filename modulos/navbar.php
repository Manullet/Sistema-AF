<style>
        .user-info {
            color: #333; /* color del texto */
            font-weight: bold; /* texto en negrita */
        }

        .role-info {
            color: #666; /* color del texto */
            font-style: italic; /* texto en cursiva */
            margin-left: 20px; /* espacio a la izquierda */
        }
        .center-class-user {
           align-items: center;
            display: flex;
            justify-content: center;
        }

    </style>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="/sistema-af/php/cerrar_sesion.php" class="nav-link">Cerrar Sesion</a> <!-- cambiar la direccion  -->
        </li>
        <li class="center-class-user">
            <?php
            // Verifica si el usuario está autenticado
            if (isset($_SESSION['usuario'])) {
                $usuario = $_SESSION['usuario'];
           

                // Muestra el nombre de usuario y el rol con etiquetas HTML y estilos CSS
                echo "<span class='user-info'>Usuario: <strong>{$usuario['usuario']}</strong></span>";
                
                // Realiza una consulta para obtener el nombre del rol


            }
            ?>
        </li>
       <!--  <li class="nav-item d-none d-sm-inline-block">
            <a href="Llenar_ficha.php" class="nav-link">Llenar Formulario</a>  cambiar la direccion  
        </li>-->
    </ul>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class=" 	fas fa-user-alt"></i>
        </a>   
      </li>
      </ul>


</nav>
<!-- /.navbar -->
