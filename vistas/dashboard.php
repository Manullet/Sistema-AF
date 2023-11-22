<?php 
session_start();
 $_SESSION['url'] = 'vistas/dashboard.php';
 $_SESSION['content-wrapper'] = 'content-wrapper';
?>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/estilos.css">

<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0"></h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">inicio</a></li>
                    <li class="breadcrumb-item active"></li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->
<style>
        .centrado {
            text-align: left;
            margin-top: 10px; /* Ajusta el margen superior según sea necesario */
        }
            .contenedor-centro {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 65vh  /* O ajusta la altura según tus necesidades */
            
        }
    </style>
<!-- Main content -->
<div class="content">
    <div class="container-fluid">
        
    <h1 class="centrado">Bienvenidos Al Sistema-AF</h1>
        <div class="row">
       
        <div class="contenedor-centro" ><img src="https://cursodeadministraciondeempresas.com/wp-content/uploads/2020/09/El-Sistema-de-Informacion-Administrativa.png" alt="Descripción de la imagen"></div>
        
          <!--  <div class="col-lg-2">
              
                <div class="small-box bg-info">
                    <div class="inner">
                        <h4 id="totalUsuarios">1</h4>

                        <p>Usuarios Registrados</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a style="cursor:pointer;" onclick="abrirUrl('vistas/Mantenimiento_usuarios.php','content-wrapper')" class="small-box-footer">Mas Info <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <div class="col-lg-2">
                
                <div class="small-box bg-success">
                    <div class="inner">
                        <h4 id="totalUsuarios">1</h4>

                        <p>Muestra2</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-warning"></i>
                    </div>
                    <a style="cursor:pointer;" onclick="abrirUrl('vistas/Mantenimiento_usuarios.php','content-wrapper')" class="small-box-footer">Mas Info <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <div class="col-lg-2">
                
                <div class="small-box bg-danger">
                    <div class="inner">
                        <h4 id="totalUsuarios">1</h4>

                        <p>Muestra3</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a style="cursor:pointer;" onclick="abrirUrl('vistas/Mantenimiento_usuarios.php','content-wrapper')" class="small-box-footer">Mas Info <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <div class="col-lg-2">
             
                <div class="small-box bg-primary">
                    <div class="inner">
                        <h4 id="totalUsuarios">1</h4>

                        <p>Muestra4</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a style="cursor:pointer;" onclick="abrirUrl('vistas/Mantenimiento_usuarios.php','content-wrapper')" class="small-box-footer">Mas Info <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <div class="col-lg-2">
               
                <div class="small-box bg-secondary">
                    <div class="inner">
                        <h4 id="totalUsuarios">1</h4>

                        <p>Muestra5</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a style="cursor:pointer;" onclick="abrirUrl('vistas/Mantenimiento_usuarios.php','content-wrapper')" class="small-box-footer">Mas Info <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>
        <div class="col-lg-2">-->
            
        </div>
        <div class="col-lg-2"></div>
        <div class="col-lg-2"></div>
        <div class="col-lg-2"></div>
        <div class="col-lg-2"></div>



    </div>

    <!-- /.row -->
</div><!-- /.container-fluid -->
</div>
<script>

    $(document).ready(function(){

        $.ajax({
            url:"ajax/dashboard .ajax.php",
            dataType:'json',
            success:function(respuesta){
                console.log("respuesta",respuesta);
            }
        });
    })

</script>