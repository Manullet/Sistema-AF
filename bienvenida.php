<?php
session_start();
//para validar si inicio sesion
if(!isset($_SESSION['usuario'])){
    echo'

    <script> 
        alert("Debes iniciar sesion");
        window.location = index.php";
    </script>
    
    ';

    //header("location: index.php");
    //destruye cualquier session
    session_destroy();
    //para el codigo
    die();
    
}



?>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Agricultura Familiar</title>

  <link rel="shortcut icon" href="../dis/img/AdminLTELogo.png" type="image/x-icon">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- DATATABLES -->
 <!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"> -->
    <!-- BOOTSTRAP -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">


  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <?php 
  include "modulos/navbar.php";
  include "modulos/aside.php";
  ?>

  <div class="content-wrapper">

  </div>
  <!-- /.content-wrapper -->

 
</div>
<?php include "modulos/footer.php";?>
<!-- ./wrapper -->

<script>

  function CargarContenido(pagina_php, contenedor, parametro_get = '') {
    let url = parametro_get !== '' ? pagina_php + '?parametro=' + parametro_get : pagina_php;
    $("." + contenedor).load(url);
  }


</script>
<?php
  if ($_SESSION["url"] !== '' && $_SESSION["content-wrapper"] !== '') { ?>
    <script>
      let url = '<?php echo $_SESSION['url'] ?>';
      let wrapper = '<?php echo $_SESSION['content-wrapper'] ?>';
      CargarContenido(url, wrapper);
    </script>

  <?php }else{ ?>
    <script>
      CargarContenido('vistas/dashboard.php','content-wrapper');
    </script>
  <?php } ?>

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
</body>
</html>
