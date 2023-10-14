<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Usuario Nuevo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/1ce2b9e5a7.js" crossorigin="anonymous"></script>
    </head>
    <body>
    <form action="../modelos/registro_usuario.php" class="col-4 p-2 m-auto" method="POST">
        <h3 class="text-center alert alert-secondary p-3" >Crear Usuario</h3>
        <?php
        //include "php/conexion_be.php";
        //include "php/registro_usuario_be.php";
      ?>

      
<div class="form-floating mb-3">
  <input type="text" class="form-control" name="Nombre">
  <label for="floatingInput">nombre</label>
</div>
<div class="form-floating mb-3">
  <input type="text" class="form-control" name="Correo">
  <label for="floatingInput">usuario </label>
</div>
<div class="form-floating mb-3">
  <input type="password" class="form-control" name="Contraseña">
  <label for="floatingPassword">contraseña</label>
</div>
<div class="form-floating mb-3">
  <input type="text" class="form-control" name="Usuario">
  <label for="floatingInput">correo </label>
</div>
<div class="form-floating mb-3">
  <input type="text" class="form-control" name="Estado">
  <label for="floatingInput">estado </label>
</div>

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
  <button type="submit" class="btn btn-success" name="btnnuevo" value="ok">Crear</button>
  <a href="../index.php"><i class="btn btn btn-danger" style="color: #fafcff;">Cancelar</i></a>
</form>
</body>
    </html>