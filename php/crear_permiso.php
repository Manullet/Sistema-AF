<?php
        //include "php/conexion_be.php";
        //include "php/registro_usuario_be.php";
        session_start();
        //para validar si inicio sesion
        if(!isset($_SESSION['usuario'])){
            echo'
        
            <script> 
                alert("Debes iniciar sesion");
                window.location = "index.php";
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
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Permiso Nuevo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/1ce2b9e5a7.js" crossorigin="anonymous"></script>
    </head>
    <body>
    <form action="../modelos/registro_permiso.php" class="col-4 p-2 m-auto" method="POST">
        <h3 class="text-center alert alert-secondary p-3" >Crear Permiso</h3>
      
<div class="form-floating mb-3">
  <input type="text" class="form-control" name="Nombre">
  <label for="floatingInput">Nombre</label>
</div>
<div class="form-floating mb-3">
  <input type="text" class="form-control" name="Nombre_Guard">
  <label for="floatingInput">Nombre Guardado</label>
</div>
<!--<div class="form-floating mb-3">
  <input type="date" class="form-control" name="Fecha_Creacion">
  <label for="floatingPassword">Fecha Creación</label>
</div> -->
<!--<div class="form-floating mb-3">
  <input type="date" class="form-control" name="Fecha_Actualizacion">
  <label for="floatingInput">Fecha Actualización</label>
</div> -->

<button href="../vistas/Mantenimiento_permisos.php" type="submit" class="btn btn-success" name="btnnuevo" value="ok">Crear</button>
<a href="../vistas/Mantenimiento_permisos.php"><i class="btn btn btn-danger" style="color: #fafcff;">Cancelar</i></a>



  <!--<div class="mb-2">
    <label for="exampleInputEmail1">Nombre</label>
    <input type="text" class="form-control" name="nombre">
  <div class="mb-2">
    <label for="exampleInputEmail1">Usuario</label>
    <input type="text" class="form-control" name="usuario">
  </div>
  <div class="mb-2">
    <label for="exampleInputEmail1">Contraseña</label>
    <input type="text" class="form-control" name="contraseña">
  </div>
  <div class="mb-2">
    <label for="exampleInputEmail1">Correo Electronico</label>
    <input type="text" class="form-control" name="correo">
  </div>
  <div class="mb-2">
    <label for="exampleInputEmail1">Estado</label>
    <input type="text" class="form-control" name="estado">
  </div> -->

</form>
</body>
    </html>