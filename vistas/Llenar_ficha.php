<?php
session_start();
$_SESSION['url'] = 'vistas/Llenar_ficha.php';
$_SESSION['content-wrapper'] = 'content-wrapper';
?>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/estilos.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="css/mobiscroll.javascript.min.css">
<script src="js/mobiscroll.javascript.min.js"></script>

<style>
    .sidebar-ficha {
        width: 250px;
        padding-top: 20px;
    }

    .menu {
        position: relative;
        list-style: none;
        padding: 0;
    }

    .menu-item {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
        padding: 10px;
    }

    .menu-number {
        width: 30px;
        height: 30px;
        background-color: #fff;
        border-radius: 50%;
        color: #5ce5d7;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        border: 2px solid #5ce5d7;
        margin-right: 10px;
        position: relative;
    }

    .menu-number.one {
        background-color: #5ce5d7;
        color: #fff;
    }

    .menu-number::after {
        content: '';
        position: absolute;
        width: 2px;
        height: 100%;
        left: 14px;
        top: 30px;
        background-color: #1ea6ea;
    }

    .menu-item:last-child .menu-number::after {
        height: 50%;

    }

    .menu-text {
        color: #333;
    }

    .menu-item.active .menu-number {
        background-color: #5ce5d7;
        color: #fff;
    }

    .menu-item:target .menu-number,
    .menu-item:target .menu-text {
        background-color: #5ce5d7;
        color: #fff;
    }

    #datosEmpresaForm {
        display: none;
    }

    :target#datosEmpresaForm {
        display: block;
    }

    :target#datosEmpresaForm~#datosTrabajadorForm .menu-item:first-child .menu-number {
        background-color: #fff;
        color: #5ce5d7;
    }


    .cuadro-texto {
        border: none;
        border-bottom: 1px solid #000;
        display: block;
        width: 500px;
        outline: none;
    }

    .hidden {
        display: none;
    }

    .multiselect {
        width: 200px;
    }

    .selectBox {
        position: relative;
    }

    .selectBox select {
        width: 100%;
        font-weight: bold;
    }

    .overSelect {
        position: absolute;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
    }

    #checkboxes {
        display: none;
        border: 1px #dadada solid;
    }

    #checkboxes label {
        display: block;
    }

    #checkboxes label:hover {
        background-color: #1e90ff;
    }
</style>
<?php
include "../php/conexion_be.php";
function obtenerNumeroFicha($conexion)
{
    // Obtener el número actual de fichas
    $sql = "SELECT COUNT(*) as id_ficha FROM fichas";
    $result = $conexion->query($sql);
    $row = $result->fetch_assoc();
    $numeroFicha = $row['id_ficha'] + 1;

    return $numeroFicha;
}

?>

<div class="containertable">
    <div class="header">
        <h1 class="poppins-font mb-2">FICHA DE REGISTRO</h1>
        <div class="mb-4 border-bottom"></div>
    </div>
    <div class="main-content row">
        <!-- Sidebar -->
        <div class="sidebar-ficha col-md-3">
            <div class="menu">
                <!-- Usando anclas para apuntar a los formularios -->
                <a href="#datosFichaForm" class="menu-item">
                    <div class="menu-number one">+</div>
                    <div class="menu-text">Ficha</div>
                </a>
                <a href="#datosTrabajadorForm" class="menu-item">
                    <div class="menu-number">1</div>
                    <div class="menu-text">Datos Generales</div>
                </a>
                <a href="#datosUbiForm" class="menu-item">
                    <div class="menu-number">2</div>
                    <div class="menu-text">Ubicación Geográfica</div>
                </a>
                <a href="#datosPertenenciaForm" class="menu-item">
                    <div class="menu-number">3</div>
                    <div class="menu-text">Pertenencia a Organizaciones</div>
                </a>
                <a href="#datosHogarForm" class="menu-item">
                    <div class="menu-number">4</div>
                    <div class="menu-text">Composición del Hogar</div>
                </a>
                <a href="#datosEtniaForm" class="menu-item">
                    <div class="menu-number">5</div>
                    <div class="menu-text">Etnicidad</div>
                </a>
                <a href="#datosRelevoForm" class="menu-item">
                    <div class="menu-number">6</div>
                    <div class="menu-text">Relevo Generacional</div>
                </a>
                <a href="#datosMigraForm" class="menu-item">
                    <div class="menu-number">7</div>
                    <div class="menu-text">Migración Familiar</div>
                </a>
                <a href="#datosUnidadForm" class="menu-item">
                    <div class="menu-number">8</div>
                    <div class="menu-text">Unidad Productiva</div>
                </a>
                <a href="#datosAgricolaForm" class="menu-item">
                    <div class="menu-number">9</div>
                    <div class="menu-text">Producción Agrícola</div>
                </a>
                <a href="#datosPecuariaForm" class="menu-item">
                    <div class="menu-number">10</div>
                    <div class="menu-text">Producción Pecuaria</div>
                </a>
                <a href="#datosPrCoForm" class="menu-item">
                    <div class="menu-number">11</div>
                    <div class="menu-text">Producción/Comercialización Pecuaria</div>
                </a>
                <a href="#datosOtrosForm" class="menu-item">
                    <div class="menu-number">12</div>
                    <div class="menu-text">Otros Ingresos</div>
                </a>
                <a href="#datosCreditoForm" class="menu-item">
                    <div class="menu-number">13</div>
                    <div class="menu-text">Crédito Producción Agropecuaria</div>
                </a>
                <a href="#datosActividadesForm" class="menu-item">
                    <div class="menu-number">14</div>
                    <div class="menu-text">Actividades Externas</div>
                </a>
                <a href="#datosPracticaForm" class="menu-item">
                    <div class="menu-number">15</div>
                    <div class="menu-text">Prácticas en la Unidad Productiva</div>
                </a>
                <a href="#datosApoyoForm" class="menu-item">
                    <div class="menu-number">16</div>
                    <div class="menu-text">Apoyo Producción Agropecuaria</div>
                </a>
            </div>
        </div>

        <!-- Formularios -->
        <!-- Formularios -->
        <div class="col-md-9">
            <!-- Datos de la ficha -->
            <form action="modelos/llenar_registro.php" method="POST" id="datosFichaForm" class="form-section">
                <h3>Ficha</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="codigo">Código Ficha</label>
                        
            <input type="text" class="form-control" id="codigo" placeholder="Código Ficha" value="<?php echo obtenerNumeroFicha($conexion); ?>" readonly>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="fecha_solicitud">Fecha de Solicitud</label>
                        <input type="date" class="form-control" id="fecha_solicitud" name="fecha_solicitud" placeholder="Fecha">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="anio_solicitud">Año de Solicitud</label>
                        <input type="number" class="form-control" id="anio_solicitud" name="anio_solicitud" placeholder="Año Actual">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="descripcion">Descripción</label>
                        <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="Descripción">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="fecha_entrevista" class="form-label">Fecha de la Entrevista</label>
                        <input type="date" class="form-control" id="fecha_entrevista" name="fecha_entrevista" placeholder="Fecha Actual">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="nombre_encuestador" class="form-label">Nombre Encuestador</label>
                        <input type="text" class="form-control" id="nombre_encuestador" name="nombre_encuestador" placeholder="Nombre Encuestador">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="nombre_encuestado" class="form-label">Nombre Encuestado</label>
                        <input type="text" class="form-control" id="nombre_encuestado" name="nombre_encuestado" placeholder="Nombre Encuestado">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="nombre_supervisor" class="form-label">Nombre Supervisor</label>
                        <input type="text" class="form-control" id="nombre_supervisor" name="nombre_supervisor" placeholder="Nombre Supervisor">
                    </div>
                </div>
                <div class="modal-footer center-content-between">
                <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosTrabajadorForm')" class="btn btn-actualizar">Siguiente</button>
                   <!-- <button type="button" class="btn btn-info" onclick="navigateToForm('#datosTrabajadorForm')">Siguiente</button> -->
                </div>
            </form>


            <!-- Formulario de Datos Generales -->
            <form action="modelos/datosTrabajadorForm.php" method="POST" id="datosTrabajadorForm" class="form-section" style="display: none;">
                <!-- Agrega el campo formType -->
                <input type="hidden" name="formType" value="datosTrabajador">
                <!-- Datos del Trabajador -->
                <h3>Datos Generales</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="primerNombre">Primer Nombre</label>
                        <input type="text" class="form-control" id="primerNombre" name="primerNombre" placeholder="Primer Nombre">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="segundoNombre">Segundo Nombre</label>
                        <input type="text" class="form-control" id="segundoNombre" name="segundoNombre" placeholder="Segundo Nombre">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="primerApellido">Primer Apellido</label>
                        <input type="text" class="form-control" id="primerApellido" name="primerApellido" placeholder="Primer Apellido">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="segundoApellido">Segundo Apellido</label>
                        <input type="text" class="form-control" id="segundoApellido" name="segundoApellido" placeholder="Segundo Apellido">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="identidadProductor" class="form-label">Número de identidad</label>
                        <input type="text" class="form-control" id="identidadProductor" name="identidadProductor" placeholder="Identidad">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="sexoProductor">Sexo</label>
                        <select id="sexoProductor" class="form-control" name="sexoProductor">
                            <option value="" disabled selected>Seleccione...</option>
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="fechaNacimiento">Fecha de nacimiento</label>
                        <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" placeholder="Fecha de Nacimiento">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="estadoCivilProductor" class="form-label">Estado Civil</label>
                        <select class="form-control" id="estadoCivilProductor" name="estadoCivilProductor">
                            <option value="" disabled selected>Seleccione...</option>
                            <option value="Casado(a)">Casado(a)</option>
                            <option value="Soltero(a)">Soltero(a)</option>
                            <option value="Unión libre">Unión libre</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="telefonoPrincipa" class="form-label">Teléfono Principal</label>
                        <input type="tel" class="form-control" id="telefonoPrincipal" name="telefonoPrincipal" placeholder="Teléfono Principal">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="telefonoSecundario" class="form-label">Teléfono Secundario</label>
                        <input type="tel" class="form-control" id="telefonoSecundario" name="telefonoSecundario" placeholder="Teléfono Secundario">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="telefonoOpcional" class="form-label">Teléfono Opcional</label>
                        <input type="tel" class="form-control" id="telefonoOpcional" name="telefonoOpcional" placeholder="Teléfono Opcional">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="escolaridadProductor" class="form-label">Nivel Educativo</label>
                        <select class="form-control" id="escolaridadProductor" name="escolaridadProductor">
                            <option value="" disabled selected>Seleccione...</option>
                            <option value="ninguno">Ninguno</option>
                            <option value="primaria">Primaria</option>
                            <option value="secundaria">Secundaria</option>
                            <option value="universitaria">Universitaria</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="ultimoGradoEscolar" class="form-label">Último grado escolar aprobado</label>
                        <select class="form-control" id="ultimoGradoEscolar" name="ultimoGradoEscolar">
                            <option value="" disabled selected>Seleccione...</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                        </select>
                    </div>

                    <div class="form-group col-md-3">
                        <label for="correoPrincipal" class="form-label">Correo Principal</label>
                        <input type="email" class="form-control" id="correoPrincipal" name="correoPrincipal" placeholder="Correo Principal">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="correoSecundario" class="form-label">Correo Secundario</label>
                        <input type="email" class="form-control" id="correoSecundario" name="correoSecundario" placeholder="Correo Secundario">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="correoOpcional" class="form-label">Correo Opcional</label>
                        <input type="email" class="form-control" id="correoOpcional" name="correoOpcional" placeholder="Correo Opcional">
                    </div>

                </div>
                <div class="modal-footer center-content-between">

                <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosUbiForm')" class="btn btn-actualizar">Siguiente</button>
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosFichaForm')">Regresar</button>
                   
                </div>
            </form>

            <!-- Formulario de Ubicación Geográfica -->
            <form action="modelos/datosUbiForm.php" method="POST" id="datosUbiForm" class="form-section" style="display: none;">
                <!-- Agrega el campo formType -->
                <input type="hidden" name="formType" value="datosUbi">
                <h3>Ubicación Geográfica</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="Id_Departamento">Departamento </label>
                        <select class="form-control" id="Id_Departamento" name="Id_Departamento" required>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Departamento
                            $sql = "SELECT Id_Departamento, Nombre_Departamento FROM tbl_departamentos";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del departamento como etiqueta y el ID como valor
                                    echo '<option value="' . $row["Id_Departamento"] . '">' . $row["Nombre_Departamento"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay departamentos disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="Id_Municipio">Municipio:</label>
                        <select class="form-control" id="Id_Municipio" name="Id_Municipio" required>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                            $sql = "SELECT Id_Municipio, Nombre_Municipio FROM Tbl_Municipios";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                    echo '<option value="' . $row["Id_Municipio"] . '">' . $row["Nombre_Municipio"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay municipios disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="Id_Aldea">Aldea:</label>
                        <select class="form-control" id="Id_Aldea" name="Id_Aldea" required>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Aldea
                            $sql = "SELECT Id_Aldea, Nombre_Aldea FROM Tbl_Aldeas";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del aldea como etiqueta y el ID como valor
                                    echo '<option value="' . $row["Id_Aldea"] . '">' . $row["Nombre_Aldea"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay aldeas disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="Id_Cacerio">tbl_cacerios:</label>
                        <select class="form-control" id="Id_Cacerio" name="Id_Cacerio" required>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Aldea
                            $sql = "SELECT Id_Cacerio, Nombre_Cacerio FROM tbl_cacerios";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del aldea como etiqueta y el ID como valor
                                    echo '<option value="' . $row["Id_Cacerio"] . '">' . $row["Nombre_Cacerio"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay aldeas disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="ubicacion" class="form-label">Ubicación</label>
                        <input type="text" class="form-control" id="ubicacion" name="ubicacion" placeholder="Ubicación">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="distanciaVivienda" class="form-label">Distancia(km/m):</label>
                        <input type="text" class="form-control" id="distanciaVivienda" name="distanciaVivienda" placeholder="Distancia entre parcela y vivienda(km/m)">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="longitudParcela" class="form-label">Longitud de la parcela:</label>
                        <input type="text" class="form-control" id="longitudParcela" name="longitudParcela" placeholder="Longitud">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="latitudParcela" class="form-label">Latitud de la parcela:</label>
                        <input type="text" class="form-control" id="latitudParcela" name="latitudParcela" placeholder="Latitud">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="msnm" class="form-label">MSNM:</label>
                        <input type="number" class="form-control" id="msnm" name="msnm" placeholder="Metros sobre el nivel del mar">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="direccionPrincipal" class="form-label">Dirección Principal</label>
                        <input type="text" class="form-control" id="direccionPrincipal" name="direccionPrincipal" placeholder="Dirección 1">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="direccionSecundario" class="form-label">Dirección Secundario</label>
                        <input type="text" class="form-control" id="direccionSecundario" name="direccionSecundario" placeholder="Dirección 2">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="direccionOpcional" class="form-label">Dirección Opcional</label>
                        <input type="text" class="form-control" id="direccionOpcional" name="direccionOpcional" placeholder="Dirección 3">
                    </div>
                    <div class="form-group col-md-3">
                        <label>Vive en la finca el productor(a):</label>
                        <div>
                            <input type="radio" id="viveFincaSi" name="viveFinca" value="S">
                            <label for="viveFincaSi">Si</label>
                            <input type="radio" id="viveFincaNo" name="viveFinca" value="N">
                            <label for="viveFincaNo">No</label>
                        </div>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="nombreFinca" class="form-label">Nombre de la finca</label>
                        <input class="form-control" type="text" id="nombreFinca" name="nombreFinca" placeholder="Nombre de la finca">
                    </div>
                </div>

                <div class="modal-footer center-content-between">
                    <button type="submit" id="guardarBtn" class="btn btn-actualizar">Guardar</button>
                    <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosPertenenciaForm')" class="btn btn-actualizar">Siguiente</button>
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosTrabajadorForm')">Regresar</button>
                    
                </div>
            </form>
            



            <!-- Formulario de Pertenencia a Organizaciones -->
            <form action="modelos/datosPertenenciaForm.php" method="POST" id="datosPertenenciaForm" class="form-section" style="display: none;">
                <h3>Pertenencia a Organizaciones</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="pertenece">¿Pertenece a alguna organización?</label>
                        <div>
                            <input type="radio" id="si" name="pertenece" value="si" onclick="mostrarOrganizaciones()">
                            <label for="si"> Si </label>
                            <input type="radio" id="no" name="pertenece" value="no" onclick="navigateToForm('#datosHogarForm')">
                            <label for="no"> No </label>
                        </div>
                    </div>
                </div>
                <div id="organizaciones" class="hidden">
                    <div class="form-group col-md-8">
                        <label for="PerteneceOr">A qué organizaciones pertenece</label>
                        <br>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="organizacion">
                            <label class="form-check-label" for="inlineCheckbox1">
                                Asociación
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="organizacion">
                            <label class="form-check-label" for="inlineCheckbox2">
                                Cooperativa
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="organizacion">
                            <label class="form-check-label" for="inlineCheckbox3">
                                Caja rural
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="organizacion">
                            <label class="form-check-label" for="inlineCheckbox4">
                                Patronato
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="organizacion">
                            <label class="form-check-label" for="inlineCheckbox5">
                                Junta de agua
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input type="checkbox" name="organizacion" value="otra" id="checkboxOtra" onchange="escribirOtra()">
                            <label class="form-check-label" for="checkboxOtra"> Otra </label>
                        </div>
                        <br>
                        <div id="otrasOrgContainer" class="hidden">
                            <br>
                            <label for="otrasOrg">Indique el(los) nombre(s) de la(s) organización(es)</label>
                            <input type="text" class="cuadro-texto" id="otrasOrg" name="otrasOrg" placeholder="Escriba aquí...">
                        </div>
                        <br>

                    </div>
                </div>
                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosUbiForm')">Regresar</button>
                    <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosHogarForm')" class="btn btn-actualizar">Siguiente</button>
                   
                </div>
            </form>

            <!-- Formulario de Composición del hogar -->
            <form action="modelos/datosHogarForm.php" method="POST" id="datosHogarForm" class="form-section" style="display: none;">
                <h3>Composición del Hogar</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <div class="multiselect">
                            <div class="selectBox" onclick="showCheckboxes()">
                                <select>
                                    <option>Seleccionar Edades Mujeres</option>
                                </select>
                                <div class="overSelect"></div>
                            </div>
                            <div id="checkboxes" style="display: none;" class="form-control">
                                <label for="uno">
                                    <input type="checkbox" id="uno">0-10 años</label>
                                <label for="dos">
                                    <input type="checkbox" id="dos">11-20 años</label>
                                <label for="tres">
                                    <input type="checkbox" id="tres">21-30 años</label>
                                <label for="cuatro">
                                    <input type="checkbox" id="cuatro">31-40 años</label>
                                <label for="cinco">
                                    <input type="checkbox" id="cinco">41-50 años</label>
                                <label for="seis">
                                    <input type="checkbox" id="seis">51-60 años</label>
                                <label for="siete">
                                    <input type="checkbox" id="siete">61-70 años</label>
                                <label for="ocho">
                                    <input type="checkbox" id="ocho">71-80 años</label>
                                <label for="nueve">
                                    <input type="checkbox" id="nueve">81-90 años</label>
                                <label for="diez">
                                    <input type="checkbox" id="diez">91+ años</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosPertenenciaForm')">Regresar</button>
                    <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosEtniaForm')" class="btn btn-actualizar">Siguiente</button>
                   
                </div>
            </form>

            <!-- Formulario de Etnicidad-->
            <form action="modelos/datosEtniaForm.php" method="POST" id="datosEtniaForm" class="form-section" style="display: none;">
                <h3>Etnicidad</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-8">
                        <label for="PerteneceEt"> A cuál de las siguientes etnias pertenece usted</label>
                        <p>
                        <div class="form-group">
                            <div>
                                <input type="radio" id="lencas" name="etnia" value="Lencas">
                                <label for="lencas">Lencas</label>
                            </div>

                            <div>
                                <input type="radio" id="pech" name="etnia" value="Pech">
                                <label for="pech">Pech</label>
                            </div>

                            <div>
                                <input type="radio" id="tolupanes" name="etnia" value="Tolupanes">
                                <label for="tolupanes">Tolupanes</label>
                            </div>

                            <div>
                                <input type="radio" id="garifunas" name="etnia" value="Garífunas">
                                <label for="garifunas">Garífunas</label>
                            </div>

                            <div>
                                <input type="radio" id="mayaChortis" name="etnia" value="Maya Chortís">
                                <label for="mayaChortis">Maya Chortís</label>
                            </div>

                            <div>
                                <input type="radio" id="tawahkas" name="etnia" value="Tawahkas">
                                <label for="tawahkas">Tawahkas</label>
                            </div>

                            <div>
                                <input type="radio" id="misquitos" name="etnia" value="Misquitos">
                                <label for="misquitos">Misquitos</label>
                            </div>

                            <div>
                                <input type="radio" id="nahua" name="etnia" value="Nahua">
                                <label for="nahua">Nahua</label>
                            </div>

                            <div>
                                <input type="radio" id="ladino" name="etnia" value="Ladino">
                                <label for="ladino">Ladino</label>
                            </div>

                            <div>
                                <input type="radio" id="negroHablaInglesa" name="etnia" value="Negro habla inglesa">
                                <label for="negroHablaInglesa">Negro habla inglesa</label>
                            </div>

                            <div>
                                <input type="radio" id="otros" name="etnia" value="Otros" onchange="escribirEtnia()">
                                <label for="otros">Otros(Especifique)</label>
                            </div>
                            <div id="otrasEtnContainer" class="hidden">
                                <input type="text" class="cuadro-texto" id="otrasEtn" name="otrasEtn" placeholder="Escriba aquí...">
                            </div>
                            <br>
                        </div>
                    </div>
                </div>
                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosHogarForm')">Regresar</button>
                    <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosRelevoForm')" class="btn btn-actualizar">Siguiente</button>
                  
                </div>
            </form>

            <!-- Formulario de Relevo Generacional -->
            <form action="modelos/datosRelevoForm.php" method="POST" id="datosRelevoForm" class="form-section" style="display: none;">
                <h3>Relevo Generacional</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-8">
                        <label>¿De las actividades agropecuarias que desarrolla, usted cree que la seguirán practicando alguno o algunos de los miembros del hogar?</label>
                        <div>
                            <input type="radio" id="Si" name="viveFinca" value="Si" onclick="mostrarCuadro()">
                            <label for="Si">Si</label>
                            <div id="cuantos" class="hidden">
                                <div class="form-group col-md-8">
                                    <label for="cuantos">Cuantos</label>
                                    <input type="number" name="cuantos" id="cuantos" min="0" class="cuadro-texto">
                                    <br>
                                </div>
                            </div>
                            <br>
                            <input type="radio" id="No" name="viveFinca" value="No" onclick="navigateToForm('#datosMigraForm')">
                            <label for="No">No</label>
                        </div>
                    </div>
                </div>



                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosEtniaForm')">Regresar</button>
                    <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosMigraForm')" class="btn btn-actualizar">Siguiente</button>
                    
                </div>
            </form>

            <!-- Formulario de Migración Familiar -->
            <form action="modelos/datosMigraForm.php" method="POST" id="datosMigraForm" class="form-section" style="display: none;">
                <h3>Migración Familiar</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label>Alguien del hogar ha emigrado?</label>
                        <div>
                            <input type="radio" id="Si" name="migra" value="Si">
                            <label for="Si">Si</label>
                            <input type="radio" id="No" name="migra" value="No">
                            <label for="No">No</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label for="destino">¿Hacia dónde emigró?</label>
                        <div>
                            <input type="radio" name="destino" value="dentro_del_pais" id="dentroDelPais"> <label for="dentroDelPais">Dentro del país</label>
                            <br>
                            <input type="radio" name="destino" value="otro_pais" id="otroPais"> <label for="otroPais">Otro país</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label for="destino">¿Por qué emigró?</label>
                        <div class="form-checkbox">
                            <input type="checkbox" name="razon" value="estudio" id="estudio">
                            <label for="estudio">Estudio</label>
                            <input type="checkbox" name="razon" value="trabajo" id="trabajo">
                            <label for="trabajo">Trabajo</label>
                            <input type="checkbox" name="razon" value="violencia" id="violencia">
                            <label for="violencia">Violencia</label>
                            <input type="checkbox" name="razon" value="cambio_climatico" id="cambioClimatico">
                            <label for="cambioClimatico">Cambio climático</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label>¿Le envía remesas?</label>
                        <div>
                            <input type="radio" name="remesas" value="si" id="siRemesas">
                            <label for="siRemesas">Si</label>
                            <input type="radio" name="remesas" value="no" id="noRemesas">
                            <label for="noRemesas">No</label>
                        </div>
                    </div>
                </div>

                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosRelevoForm')">Regresar</button>
                    <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosUnidadForm')" class="btn btn-actualizar">Siguiente</button>
                    
                </div>
            </form>

            <!-- Formulario de Información Básica de la Unidad Productiva -->
            <form action="modelos/datosUnidadForm.php" method="POST" id="datosUnidadForm" class="form-section" style="display: none;">
                <h3>Información Básica de la Unidad Productiva</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="tierra">La tierra que maneja es</label>
                        <div class="form-checkbox">
                            <input type="checkbox" name="razon" value="propia" id="propia">
                            <label for="propia">Propia</label>
                            <input type="checkbox" name="razon" value="alquilada" id="alquilada">
                            <label for="alquilada">Alquilada</label>
                            <input type="checkbox" name="razon" value="prestada" id="prestada">
                            <label for="prestada">Prestada</label>
                            <input type="checkbox" name="razon" value="ejidal" id="ejidal">
                            <label for="ejidal">Ejidal</label>
                        </div>

                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label for="produccion" class="form-label">Cuánta de esa área disponible es apta para la producción agropecuaria</label>
                        <select class="form-control" id="produccion" name="produccion">
                            <option value="" disabled selected>Seleccione...</option>
                            <option value="ma">Manzanas</option>
                            <option value="ha">Héctareas</option>
                            <option value="tareas">Tareas</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label for="destino">Del total de tierra que maneja, ¿cuánta superficie dedica a las actividades siguientes</label>
                        <br>
                        <div>
                            <label for="areaAgricultura">Superficie dedicada a Agricultura</label>
                            <input type="text" name="areaAgricultura" id="areaAgricultura" placeholder="(mz)(ha)(tareas)" class="cuadro-texto">
                            <br>
                            <label for="">Rubros</label>
                            <input type="text" name="rubrosAgricultura" id="rubrosAgricultura" class="cuadro-texto">
                            <br>
                            <label for="areaGanaderia">Superficie dedicada a Ganadería</label>
                            <input type="text" name="areaGanaderia" id="areaGanaderia" placeholder="(mz)(ha)(tareas)" class="cuadro-texto">
                            <br>
                            <label for="">Rubros</label>
                            <input type="text" name="rubrosGanaderia" id="rubrosGanaderia" class="cuadro-texto">
                            <br>

                            <label for="areaApicultura">Superficie dedicada a Apicultura</label>
                            <input type="text" name="areaApicultura" id="areaApicultura" placeholder="(colmenas)(otro)" class="cuadro-texto">
                            <br>

                            <label for="areaForestal">Superficie dedicada a Forestal</label>
                            <input type="text" name="areaForestal" id="areaForestal" placeholder="(mz)(ha)(tareas)" class="cuadro-texto">
                            <br>
                            <label for="">Rubros</label>
                            <input type="text" name="rubrosForestal" id="rubrosForestal" class="cuadro-texto">
                            <br>

                            <label for="areaAcuacultura">Superficie dedicada a Acuacultura</label>
                            <input type="text" name="areaAcuacultura" id="areaAcuacultura" placeholder="m2" class="cuadro-texto">
                            <br>
                            <label for="">Número de estanques</label>
                            <input type="text" name="numEstanques" id="numEstanques" class="cuadro-texto"><br>

                            <label for="areaAgroturismo">Superficie dedicada a Agroturismo</label>
                            <input type="text" name="areaAgroturismo" id="areaAgroturismo" placeholder="(mz)(ha)(tareas)" class="cuadro-texto">
                            <br>
                            <label for="otrosUsos">Otros Usos</label>
                            <input type="text" name="otrosUsos" id="otrosUsos" placeholder="Escriba aquí..." class="cuadro-texto">
                            <br>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label for="sistemaRiego">¿Posee sistema de riego?</label><br>
                        <input type="radio" name="sistemaRiego" value="Si"> Si
                        <input type="radio" name="sistemaRiego" value="No"> No<br>

                        <label for="areaRiego">Área bajo riego</label>
                        <input type="text" name="areaRiego" id="areaRiego" placeholder="(Ha.)(Mz.)(Tarea)" class="cuadro-texto"> <br>

                        <label for="tipoRiego">Tipo de Riego</label>
                        <input type="text" name="tipoRiego" id="tipoRiego" class="cuadro-texto"><br>

                        <label for="fuenteAgua">Fuente de agua</label>
                        <input type="text" name="fuenteAgua" id="fuenteAgua" class="cuadro-texto"><br>

                        <label for="disponibilidadAgua">Disponibilidad de agua en el año (meses)</label>
                        <input type="text" name="disponibilidadAgua" id="disponibilidadAgua" class="cuadro-texto"><br>
                    </div>
                </div>
                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosMigraForm')">Regresar</button>
                    <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosAgricolaForm')" class="btn btn-actualizar">Siguiente</button>
                    
                </div>
            </form>

            <!-- Formulario de Produccion Agricola -->
            <form action="modelos/datosAgricolaForm.php" method="POST" id="datosAgricolaForm" class="form-section" style="display: none;">
                <h3>Información de Cultivos</h3>
                <div class="cultivo-info">
                    <h4>Cultivo</h4>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="nombreCultivo">Nombre del Cultivo</label>
                                <input type="text" class="form-control" id="nombreCultivo" name="nombreCultivo">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="tipoSiembra">Siembra</label>
                                <select class="form-control" id="tipoSiembra" name="tipoSiembra">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Primera">Primera</option>
                                    <option value="Postrera">Postrera</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="areaSembrada">Área Sembrada (mz)(ha)(tareas)</label>
                                <input type="text" class="form-control" id="areaSembrada" name="areaSembrada">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="produccionObtenida">Producción Obtenida</label>
                                <input type="number" class="form-control" id="produccionObtenida" name="produccionObtenida" min="0" step="any">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="unidadMedidaProduccion">Unidad de Medida de Producción</label>
                                <input type="text" class="form-control" id="unidadMedidaProduccion" name="unidadMedidaProduccion">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="cantidadVendida">Cantidad Vendida</label>
                                <input type="number" class="form-control" id="cantidadVendida" name="cantidadVendida" min="0" step="any">
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="unidadMedidaVenta">Unidad de Medida de Venta</label>
                                <input type="text" class="form-control" id="unidadMedidaVenta" name="unidadMedidaVenta">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="precioVenta">Precio de Venta por Unidad de Medida</label>
                                <input type="number" class="form-control" id="precioVenta" name="precioVenta" min="0" step="0.01">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="comprador">A quién vendió</label>
                                <input type="text" class="form-control" id="comprador" name="comprador">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosUnidadForm')">Regresar</button>
                    <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosPecuariaForm')" class="btn btn-actualizar">Siguiente</button>
          
                </div>
            </form>
            <!-- 10 -->

            <form action="modelos/datosPecuariaForm.php" method="POST" id="datosPecuariaForm" class="form-section" style="display: none;">
                <h3>Producción Pecuaria (Inventario)</h3>
                <br>

                <div class="row">
                    <!-- Tipo de Animal -->
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="tipoAnimal">Tipo de Animal</label>
                            <select class="form-control" id="tipoAnimal" name="tipoAnimal" onchange="mostrarOpcionesGenero(this.value)">
                                <option value="">Seleccione un animal</option>
                                <option value="Bovinos">Bovinos</option>
                                <option value="Caprino">Caprino</option>
                                <option value="Ovino">Ovino</option>
                                <option value="Cerdo">Cerdo</option>
                                <option value="PollosEngorde">Pollos de Engorde</option>
                                <option value="Aves">Aves</option>
                                <option value="Peces">Peces</option>
                                <option value="Camarones">Camarones</option>
                                <option value="Otros">Otros</option>
                            </select>
                        </div>
                    </div>

                    <!-- Género -->
                    <div class="col-md-4">
                        <div class="form-group" id="divGenero" style="display:none;">
                            <label for="generoAnimal">Género</label>
                            <select class="form-control" id="generoAnimal" name="generoAnimal">
                                <option value="Hembra">Hembra</option>
                                <option value="Macho">Macho</option>
                            </select>
                        </div>
                    </div>

                    <!-- Cantidad -->
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="cantidadAnimal">Cantidad</label>
                            <input type="number" class="form-control" id="cantidadAnimal" name="cantidadAnimal" placeholder="Cantidad" min="1">
                        </div>
                    </div>

                    <!-- Botón Agregar -->
                    <div class="col-md-3 d-flex align-items-center">
                        <button type="button" class="btn btn-info" onclick="agregarATabla()">Agregar</button>
                    </div>
                    <br>
                    <br>
                </div>

                <table class="table">
                    <thead class="table-dark">
                        <tr>
                            <th>Tipo de Animal</th>
                            <th>Género</th>
                            <th>Cantidad</th>
                        </tr>
                    </thead>
                    <tbody id="tablaTemporal" class="table-hover">
                        <!-- Los elementos agregados aparecerán aquí -->
                    </tbody>
                </table>


                <h3>Unidades vendidas año anterior</h3>
                <div class="row form-group">
                    <!-- Tipo de Animal -->
                    <div class="col-md-3">
                        <label for="tipoAnimal">Tipo de Animal</label>
                        <select class="form-control" id="tipoAnimalU" name="tipoAnimalU">
                            <option value="Bovinos">Bovinos</option>
                            <option value="Caprino">Caprino</option>
                            <option value="Ovino">Ovino</option>
                            <option value="Cerdo">Cerdo</option>
                            <option value="PollosEngorde">Pollos de Engorde</option>
                            <option value="Aves">Aves</option>
                            <option value="Peces">Peces</option>
                            <option value="Camarones">Camarones</option>
                            <option value="Otros">Otros</option>
                        </select>
                    </div>

                    <!-- Precio de Venta -->
                    <div class="col-md-3">
                        <label for="precioVentaU">Precio de venta (Lps)</label>
                        <input type="number" class="form-control" id="precioVentaU" name="precioVentaU" min="0" step="0.01">
                    </div>

                    <!-- Unidad de Medida -->
                    <div class="col-md-3">
                        <label for="unidadMedida">Unidad de medida</label>
                        <input type="text" class="form-control" id="unidadMedida" name="unidadMedida">
                    </div>

                    <!-- Mercado y botón Agregar -->
                    <div class="col-md-3 d-flex align-items-end">
                        <div class="form-group flex-grow-1 mr-2">
                            <label for="mercado">Mercado</label>
                            <input type="text" class="form-control" id="mercado" name="mercado">
                        </div>
                    </div>

                    <!-- Botón Agregar -->
                    <div class="col-md-3 d-flex align-items-center">
                        <button type="button" class="btn btn-info" onclick="agregarAUnidadesVendidas()">Agregar</button>
                    </div>
                </div>

                <table class="table">
                    <thead class="table-dark">
                        <tr>
                            <th>Tipo de Animal</th>
                            <th>Precio de Venta</th>
                            <th>Unidad de Medida</th>
                            <th>Mercado</th>
                        </tr>
                    </thead>
                    <tbody id="tablaUnidadesVendidas">
                        <!-- Los datos agregados aparecerán aquí -->
                    </tbody>
                </table>



                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosAgricolaForm')">Regresar</button>
                    <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosPrCoForm')" class="btn btn-actualizar">Siguiente</button>
               
                </div>
            </form>

            <!-- 11 -->

            <form action="modelos/datosPrCoForm.php" method="POST" id="datosPrCoForm" class="form-section" style="display: none;">
                <h3>11. Producción y Comercialización Pecuaria</h3>


                <div class="row">
                    <!-- Formulario para tipo de producción -->
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="tipoProduccion">Tipo de Producción</label>
                            <select class="form-control" id="tipoProduccion" name="tipoProduccion">
                                <option value="Leche">Leche</option>
                                <option value="Carne">Carne</option>
                                <option value="DerivadosLeche">Derivados de leche</option>
                                <option value="Huevos">Huevos</option>
                                <option value="Apicola">Apícola</option>
                                <option value="Transformacion">Producto de Transformación</option>
                            </select>
                        </div>
                    </div>

                    <!-- Periodicidad -->
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="periodicidad">Periodicidad</label>
                            <select class="form-control" id="periodicidad" name="periodicidad">
                                <option value="Semanal">Semanal</option>
                                <option value="Mensual">Mensual</option>
                                <option value="Anual">Anual</option>
                            </select>
                        </div>
                    </div>

                    <!-- Unidad de Medida -->
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="unidadMedidaPC">Unidad de medida</label>
                            <input type="text" class="form-control" id="unidadMedidaPC" name="unidadMedidaPC">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!-- Cantidad Vendida -->
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="cantidadVendidaPC">Cantidad vendida</label>
                            <input type="number" class="form-control" id="cantidadVendidaPC" name="cantidadVendidaPC" min="0">
                        </div>
                    </div>

                    <!-- Precio de Venta -->
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="precioVentaPC">Precio de venta (Lps)</label>
                            <input type="number" class="form-control" id="precioVentaPC" name="precioVentaPC" min="0" step="0.01">
                        </div>
                    </div>

                    <!-- A quién Vendió -->
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="cliente">A quién le vendió</label>
                            <input type="text" class="form-control" id="cliente" name="cliente">
                        </div>
                    </div>


                </div>

                <!-- Botón Agregar -->
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-info" id="btnAgregar" onclick="agregarATablaProduccion()">Agregar</button>
                    </div>
                </div>
                <br>

                <!-- Tabla para visualizar los datos agregados -->
                <div class="row">
                    <div class="col-md-12">
                        <table class="table">
                            <thead class="table-dark">
                                <tr>
                                    <th>Tipo de Producción</th>
                                    <th>Periodicidad</th>
                                    <th>Unidad de Medida</th>
                                    <th>Cantidad Vendida</th>
                                    <th>Precio de Venta (Lps)</th>
                                    <th>A quién le vendió</th>
                                </tr>
                            </thead>
                            <tbody id="tablaDatosTemporal">
                                <!-- Las filas agregadas se visualizarán aquí -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosPecuariaForm')">Regresar</button>
                    <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosOtrosForm')" class="btn btn-actualizar">Siguiente</button>
                  
                </div>
            </form>

            <!-- 12 -->

            <form action="modelos/datosOtrosForm.php" method="POST" id="datosOtrosForm" class="form-section" style="display: none;">
                <h3>12. Otros ingresos en el hogar</h3>

                <div class="row">
                    <!-- Tipo de Ingreso -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="tipoIngreso">Tipo de Ingreso</label>
                            <select class="form-control" id="tipoIngreso" name="tipoIngreso">
                                <option value="Negocio">Negocio</option>
                                <option value="VentaServicio">Venta de servicio</option>
                                <option value="JornalAgricola">Jornal agrícola</option>
                                <option value="CorteCafe">Corte de café</option>
                                <option value="jornalNoAgricola">Jornal no agricola</option>
                                <option value="alquileres">Alquileres</option>
                                <option value="RemesaExterior">Remesa del exterior</option>
                                <option value="RemesaNacional">Remesa nacional</option>
                                <option value="Bono">Bono</option>
                                <option value="SalarioProfesional">Salario profesional</option>
                                <option value="Artesania">Artesanía</option>
                                <option value="Otro">Otro</option>
                            </select>
                        </div>
                    </div>

                    <!-- Cantidad -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="cantidadIngreso">Cantidad</label>
                            <input type="number" class="form-control" id="cantidadIngreso" name="cantidadIngreso" min="0" step="0.01" placeholder="Ingrese la cantidad">
                        </div>
                    </div>

                </div>

                <!-- Botón Agregar -->
                <div class="row">
                    <div class="col-md-12 text-left">
                        <button type="button" class="btn btn-info mt-2" onclick="agregarIngreso()">Agregar</button>
                    </div>
                </div>
                <br>

                <table class="table">
                    <thead class="table-dark">
                        <tr>
                            <th>Tipo de Ingreso</th>
                            <th>Cantidad (L)</th>
                        </tr>
                    </thead>
                    <tbody id="tablaIngresos">
                        <!-- Los datos agregados se mostrarán aquí -->
                    </tbody>
                </table>



                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosOtrosForm')">Regresar</button>
                    <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosCreditoForm')" class="btn btn-actualizar">Siguiente</button>
                    
                </div>
            </form>

            <!-- 13 -->

            <form action="modelos/datosCreditoForm.php" method="POST" id="datosCreditoForm" class="form-section" style="display: none;">
                <h3>13. Crédito para la producción agropecuaria</h3>

                <!-- Pregunta sobre préstamos -->
                <div class="form-group">
                    <label>¿Ha solicitado préstamos para la producción agropecuaria?</label><br>
                    <input type="radio" id="prestamoSi" name="prestamo" value="Si">
                    <label for="prestamoSi">SI</label>
                    <input type="radio" id="prestamoNo" name="prestamo" value="No">
                    <label for="prestamoNo">NO</label>
                </div>

                <!-- Opciones si la respuesta es SI -->
                <div class="form-group" id="opcionesPrestamoSi" style="display: none;">
                    <label>¿A quién acude?</label><br>
                    <input type="checkbox" id="banca" name="fuentePrestamo" value="Banca">
                    <label for="banca">A la banca</label>
                    <input type="checkbox" id="amigo" name="fuentePrestamo" value="Amigo">
                    <label for="amigo">A un amigo</label>
                    <input type="checkbox" id="familiar" name="fuentePrestamo" value="Familiar">
                    <label for="familiar">A un familiar</label>
                    <input type="checkbox" id="cooperativa" name="fuentePrestamo" value="Cooperativa">
                    <label for="cooperativa">A una cooperativa</label>
                    <input type="checkbox" id="prestamista" name="fuentePrestamo" value="Prestamista">
                    <label for="prestamista">A un prestamista</label>
                    <input type="checkbox" id="microfinanciera" name="fuentePrestamo" value="Microfinanciera">
                    <label for="microfinanciera">A una microfinanciera</label>
                    <input type="checkbox" id="cajaRural" name="fuentePrestamo" value="CajaRural">
                    <label for="cajaRural">A una caja rural</label>
                    <input type="checkbox" id="otroFuente" name="fuentePrestamo" value="Otro">
                    <label for="otroFuente">Otro</label>
                </div>

                <!-- Opciones si la respuesta es NO -->
                <div class="form-group" id="opcionesPrestamoNo" style="display: none;">
                    <label>¿Por qué no ha solicitado préstamos agropecuarios?</label><br>
                    <input type="checkbox" id="centralRiesgos" name="motivoNoPrestamo" value="CentralRiesgos">
                    <label for="centralRiesgos">Estoy en la central de riesgos</label>
                    <input type="checkbox" id="muchosRequisitos" name="motivoNoPrestamo" value="MuchosRequisitos">
                    <label for="muchosRequisitos">Son muchos los requisitos</label>
                    <input type="checkbox" id="noNecesitado" name="motivoNoPrestamo" value="NoNecesitado">
                    <label for="noNecesitado">No lo he necesitado</label>
                    <input type="checkbox" id="noCapacidadPago" name="motivoNoPrestamo" value="NoCapacidadPago">
                    <label for="noCapacidadPago">No tengo capacidad de pago</label>
                    <input type="checkbox" id="temorRechazo" name="motivoNoPrestamo" value="TemorRechazo">
                    <label for="temorRechazo">Temor al rechazo</label>
                    <input type="checkbox" id="temorNoPago" name="motivoNoPrestamo" value="TemorNoPago">
                    <label for="temorNoPago">Temor a no pagarlo</label>
                    <input type="checkbox" id="interesAlto" name="motivoNoPrestamo" value="InteresAlto">
                    <label for="interesAlto">Tasas de interés muy altas </label>
                </div>

                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosOtrosForm')">Regresar</button>
                    <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosActividadesForm')" class="btn btn-actualizar">Siguiente</button>
                    
                </div>
            </form>

            <!-- 14 -->
            <form action="modelos/datosActividadesForm.php" method="POST" id="datosActividadesForm" class="form-section" style="display: none;">
                <h3>14. Actividades externas a la unidad productiva</h3>

                <!-- Actividades fuera de la finca -->
                <div class="form-group">
                    <label>¿Miembros de este hogar realizan actividades fuera de la finca?</label><br>
                    <input type="radio" id="actividadesFueraSi" name="actividadesFuera" value="Yes">
                    <label for="actividadesFueraSi">SI</label>
                    <input type="radio" id="actividadesFueraNo" name="actividadesFuera" value="Not">
                    <label for="actividadesFueraNo">NO</label>
                    <input type="text" class="form-control" id="cuantosActividadesFuera" name="cuantosActividadesFuera" placeholder="cuantos" style="display: none;">

                </div>

                <!-- Contratación de trabajadores no miembros -->
                <div class="form-group" id="seccionTrabajadores" style="display: none;">
                    <label>En las actividades productivas de su finca, ¿contrata trabajadores(as) que no son miembros de su hogar?</label>
                    <div class="row">
                        <!-- Trabajadores Permanentes -->
                        <div class="col-md-6">
                            <label for="trabajadoresPermanentes">Permanentes</label>
                            <input type="number" class="form-control" id="trabajadoresPermanentes" name="trabajadoresPermanentes" placeholder="cuántos">
                        </div>

                        <!-- Trabajadores Temporales -->
                        <div class="col-md-6">
                            <label for="trabajadoresTemporales">Temporales</label>
                            <input type="number" class="form-control" id="trabajadoresTemporales" name="trabajadoresTemporales" placeholder="cuántos">
                        </div>
                    </div>
                </div>


                <!-- Tomador de decisiones -->
                <div class="form-group" id="seccionTomadorDecisiones" style="display: none;">
                    <h4>14.1. ¿Quién es el tomador de decisiones con relación a las actividades agropecuarias de la finca?</h4>
                    <input type="checkbox" id="esposoDecision" name="tomadorDecisiones" value="Esposo">
                    <label for="esposoDecision">Esposo</label>
                    <input type="checkbox" id="esposaDecision" name="tomadorDecisiones" value="Esposa">
                    <label for="esposaDecision">Esposa</label>
                    <input type="checkbox" id="consensoFamilia" name="tomadorDecisiones" value="ConsensoFamilia">
                    <label for="consensoFamilia">Consenso en familia</label>
                    <input type="checkbox" id="familiarDecision" name="tomadorDecisiones" value="Familiar">
                    <label for="familiarDecision">Un familiar</label>
                    <input type="checkbox" id="administradorDecision" name="tomadorDecisiones" value="Administrador">
                    <label for="administradorDecision">Un administrador</label>
                </div>

                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosCreditoForm')">Regresar</button>
                    <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosPracticaForm')" class="btn btn-actualizar">Siguiente</button>
                  
                </div>
            </form>

            <!-- 15 -->

            <form action="modelos/datosPracticaForm.php" method="POST" id="datosPracticaForm" class="form-section" style="display: none;">
                <h3>15. Prácticas para producción en la unidad productiva</h3>

                <div class="form-group">
                    <label>Seleccione las prácticas que realiza en su finca:</label>
                    <div class="row">
                        <div class="col-md-3"> <!-- Primera columna -->
                            <input type="checkbox" id="quema" name="practicas" value="quema">
                            <label for="quema">Quema</label><br>
                            <input type="checkbox" id="riega" name="practicas" value="riega">
                            <label for="riega">Riega</label><br>
                            <input type="checkbox" id="manejoRastrojo" name="practicas" value="manejoRastrojo">
                            <label for="manejoRastrojo">Manejo de rastrojo</label><br>
                            <input type="checkbox" id="ceroLabranzas" name="practicas" value="ceroLabranzas">
                            <label for="ceroLabranzas">Cero labranzas</label><br>
                            <input type="checkbox" id="labranzaMinima" name="practicas" value="labranzaMinima">
                            <label for="labranzaMinima">Labranza mínima</label><br>
                            <input type="checkbox" id="siembraHilerasSurcos" name="practicas" value="siembraHilerasSurcos">
                            <label for="siembraHilerasSurcos">Siembra en hileras o surcos</label><br>
                            <input type="checkbox" id="curvasNivel" name="practicas" value="curvasNivel">
                            <label for="curvasNivel">Curvas a nivel</label><br>
                            <input type="checkbox" id="cultivosAsocio" name="practicas" value="cultivosAsocio">
                            <label for="cultivosAsocio">Cultivos en asocio</label><br>
                            <input type="checkbox" id="desparasitantes" name="practicas" value="desparasitantes">
                            <label for="desparasitantes">Desparasitantes</label><br>
                            <input type="checkbox" id="preparacionSueloTractor" name="practicas" value="preparacionSueloTractor">
                            <label for="preparacionSueloTractor">Preparación de suelo con tractor</label><br>

                        </div>
                        <div class="col-md-3">
                            <input type="checkbox" id="cultivoRelevo" name="practicas" value="cultivoRelevo">
                            <label for="cultivoRelevo">Cultivo en relevo</label><br>
                            <input type="checkbox" id="tierraDescanso" name="practicas" value="tierraDescanso">
                            <label for="tierraDescanso">Tierra en descanso</label><br>
                            <input type="checkbox" id="barrerasVivas" name="practicas" value="barrerasVivas">
                            <label for="barrerasVivas">Barreras vivas</label><br>
                            <input type="checkbox" id="barrerasMuertas" name="practicas" value="barrerasMuertas">
                            <label for="barrerasMuertas">Barreras muertas</label><br>
                            <input type="checkbox" id="abonoOrganico" name="practicas" value="abonoOrganico">
                            <label for="abonoOrganico">Abono orgánico</label><br>
                            <input type="checkbox" id="abonoSintetico" name="practicas" value="abonoSintetico">
                            <label for="abonoSintetico">Abono sintético</label><br>
                            <input type="checkbox" id="cosechaAgua" name="practicas" value="cosechaAgua">
                            <label for="cosechaAgua">Cosecha de agua</label><br>
                            <input type="checkbox" id="manejoHumedad" name="practicas" value="manejoHumedad">
                            <label for="manejoHumedad">Manejo de humedad</label><br>
                            <input type="checkbox" id="semillaCriolla" name="practicas" value="semillaCriolla">
                            <label for="semillaCriolla">Semilla criolla</label><br>
                            <input type="checkbox" id="semillaMejorada" name="practicas" value="semillaMejorada">
                            <label for="semillaMejorada">Semilla mejorada</label><br>
                        </div>
                        <div class="col-md-3">
                            <input type="checkbox" id="huertoFamiliar" name="practicas" value="huertoFamiliar">
                            <label for="huertoFamiliar">Huerto familiar</label><br>
                            <input type="checkbox" id="almacenamientoGrano" name="practicas" value="almacenamientoGrano">
                            <label for="almacenamientoGrano">Almacenamiento de grano</label><br>
                            <input type="checkbox" id="agriculturaProtegida" name="practicas" value="agriculturaProtegida">
                            <label for="agriculturaProtegida">Agricultura protegida</label><br>
                            <input type="checkbox" id="secadoraSolar" name="practicas" value="secadoraSolar">
                            <label for="secadoraSolar">Secadora solar</label><br>
                            <input type="checkbox" id="usoInsecticidas" name="practicas" value="usoInsecticidas">
                            <label for="usoInsecticidas">Uso de insecticidas</label><br>
                            <input type="checkbox" id="usoFungicidas" name="practicas" value="usoFungicidas">
                            <label for="usoFungicidas">Uso de fungicidas</label><br>
                            <input type="checkbox" id="usoAcaricidas" name="practicas" value="usoAcaricidas">
                            <label for="usoAcaricidas">Uso de acaricidas</label><br>
                            <input type="checkbox" id="usoHerbicidas" name="practicas" value="usoHerbicidas">
                            <label for="usoHerbicidas">Uso de herbicidas</label><br>
                            <input type="checkbox" id="podas" name="practicas" value="podas">
                            <label for="podas">Podas</label><br>
                            <input type="checkbox" id="sistemaAgroforestal" name="practicas" value="sistemaAgroforestal">
                            <label for="sistemaAgroforestal">Sistema agroforestal</label><br>
                        </div>
                        <div class="col-md-3">
                            <input type="checkbox" id="controlSombra" name="practicas" value="controlSombra">
                            <label for="controlSombra">Control de sombra</label><br>
                            <input type="checkbox" id="sistemaSilvopastoril" name="practicas" value="sistemaSilvopastoril">
                            <label for="sistemaSilvopastoril">Sistema silvopastoril</label><br>
                            <input type="checkbox" id="terrazas" name="practicas" value="terrazas">
                            <label for="terrazas">Terrazas</label><br>
                            <input type="checkbox" id="cultivoCobertura" name="practicas" value="cultivoCobertura">
                            <label for="cultivoCobertura">Cultivo de cobertura</label><br>
                            <input type="checkbox" id="bancoProteina" name="practicas" value="bancoProteina">
                            <label for="bancoProteina">Banco de proteína</label><br>
                            <input type="checkbox" id="pastosMejorados" name="practicas" value="pastosMejorados">
                            <label for="pastosMejorados">Pastos mejorados</label><br>
                            <input type="checkbox" id="aplicacionVacunas" name="practicas" value="aplicacionVacunas">
                            <label for="aplicacionVacunas">Aplicación de vacunas</label><br>
                            <input type="checkbox" id="vitaminas" name="practicas" value="vitaminas">
                            <label for="vitaminas">Vitaminas</label><br>
                            <input type="checkbox" id="preparacionSueloTraccionAnimal" name="practicas" value="preparacionSueloTraccionAnimal">
                            <label for="preparacionSueloTraccionAnimal">Preparación de suelo con tracción animal</label><br>
                        </div>
                    </div>
                </div>

                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosActividadesForm')">Regresar</button>
                    <button type="submit" id="guardarBtn" onclick="navigateToForm('#datosApoyoForm')" class="btn btn-actualizar">Siguiente</button>
                    
                </div>
            </form>

            <!-- 16 -->

            <form action="modelos/datosApoyoForm.php" method="POST" id="datosApoyoForm" class="form-section" style="display: none;">
                <h3>16. Apoyo para la producción agropecuaria</h3>

                <!-- Pregunta sobre la recepción de apoyo -->
                <div class="form-group">
                    <label>¿Recibe apoyo para la producción agrícola?</label><br>
                    <input type="radio" id="apoyoSi" name="recibeApoyo" value="SiApoyo">
                    <label for="apoyoSi">SI</label>
                    <input type="radio" id="apoyoNo" name="recibeApoyo" value="NoApoyo">
                    <label for="apoyoNo">NO</label> (Finalice la entrevista)
                </div>

                <!-- Selección múltiple de quién provee el apoyo -->
                <div class="form-group seccionOculta">
                    <label>¿De quién recibe apoyo para la producción agropecuaria? (selección múltiple)</label><br>
                    <input type="checkbox" id="apoyoGobierno" name="fuenteApoyo" value="Gobierno">
                    <label for="apoyoGobierno">Gobierno</label><br>
                    <input type="checkbox" id="apoyoONG" name="fuenteApoyo" value="ONG">
                    <label for="apoyoONG">ONG</label><br>
                    <input type="checkbox" id="apoyoAmigo" name="fuenteApoyo" value="Amigo">
                    <label for="apoyoAmigo">Amigo</label><br>
                    <input type="checkbox" id="apoyoCooperativa" name="fuenteApoyo" value="Cooperativa">
                    <label for="apoyoCooperativa">Cooperativa</label><br>
                    <label for="apoyoOtro">Otro (especifique)</label>
                    <input type="text" class="form-control" id="apoyoOtro" name="apoyoOtro">
                </div>

                <div class="form-group seccionOculta">
                    <label>¿Qué tipo de apoyo recibe? (selección múltiple)</label>
                    <div class="row">
                        <div class="col-md-4">
                            <input type="checkbox" id="credito" name="tipoApoyo" value="Credito">
                            <label for="credito">Crédito</label><br>
                            <input type="checkbox" id="semilla" name="tipoApoyo" value="Semilla">
                            <label for="semilla">Semilla</label><br>
                            <input type="checkbox" id="fertilizante" name="tipoApoyo" value="Fertilizante">
                            <label for="fertilizante">Fertilizante</label><br>
                            <input type="checkbox" id="capacitacion" name="tipoApoyo" value="Capacitacion">
                            <label for="capacitacion">Capacitación</label><br>
                            <input type="checkbox" id="asistenciaTecnica" name="tipoApoyo" value="AsistenciaTecnica">
                            <label for="asistenciaTecnica">Asistencia técnica</label><br>
                        </div>
                        <div class="col-md-4">
                            <input type="checkbox" id="herramientasTrabajo" name="tipoApoyo" value="HerramientasTrabajo">
                            <label for="herramientasTrabajo">Herramientas de trabajo</label><br>
                            <input type="checkbox" id="sistemaRiego" name="tipoApoyo" value="SistemaRiego">
                            <label for="sistemaRiego">Sistema de riego</label><br>
                            <input type="checkbox" id="equipoAgricola" name="tipoApoyo" value="EquipoAgricola">
                            <label for="equipoAgricola">Equipo agrícola</label><br>
                            <input type="checkbox" id="silos" name="tipoApoyo" value="Silos">
                            <label for="silos">Silos</label><br>
                            <input type="checkbox" id="cosechadorasAgua" name="tipoApoyo" value="CosechadorasAgua">
                            <label for="cosechadorasAgua">Cosechadoras de agua</label><br>
                        </div>
                        <div class="col-md-4">
                            <input type="checkbox" id="pieDeCria" name="tipoApoyo" value="PieDeCria">
                            <label for="pieDeCria">Pie de cría</label><br>
                            <input type="checkbox" id="informacionPrecios" name="tipoApoyo" value="InformacionPrecios">
                            <label for="informacionPrecios">Información de precios</label><br>
                            <input type="checkbox" id="comercializacionMercados" name="tipoApoyo" value="ComercializacionMercados">
                            <label for="comercializacionMercados">Comercialización/mercados</label><br>
                            <input type="checkbox" id="organizacionRural" name="tipoApoyo" value="OrganizacionRural">
                            <label for="organizacionRural">Organización rural</label><br>
                            <input type="checkbox" id="transformacionProductos" name="tipoApoyo" value="TransformacionProductos">
                            <label for="transformacionProductos">Transformación de productos</label><br>
                            <label for="otroTipoApoyo">Otro (especifique)</label>
                            <input type="text" class="form-control" id="otroTipoApoyo" name="otroTipoApoyo">
                        </div>
                    </div>
                </div>

                <div class="form-group seccionOculta">
                    <label>Está siendo usted atendido por la Unidad de Agricultura Familiar:</label><br>
                    <input type="radio" id="atendidoSi" name="atendidoUnidadAgricultura" value="Si">
                    <label for="atendidoSi">SI</label>
                    <input type="radio" id="atendidoNo" name="atendidoUnidadAgricultura" value="No">
                    <label for="atendidoNo">NO</label>
                </div>

                <div class="form-group seccionOculta">
                    <label>¿Usted sabe si algunos de sus productos son vendidos para el Programa de Alimentación Escolar?</label><br>
                    <input type="radio" id="productosVendidosSi" name="productosVendidosProgramaAlimentacion" value="Siyes">
                    <label for="productosVendidosSi">SI</label>
                    <input type="radio" id="productosVendidosNo" name="productosVendidosProgramaAlimentacion" value="Nonot">
                    <label for="productosVendidosNo">NO</label>
                </div>

                <div class="form-group" id="seccionFinal">
                    <div class="row">

                        <div class="col-md-6">
                            <label for="fechaEntrevista">Fecha de la entrevista:</label>
                            <input type="text" class="form-control" id="fechaEntrevista" name="fechaEntrevista" placeholder="DD/MM/AAAA">
                        </div>

                        <div class="col-md-6">
                            <label for="nombreProductor">Nombre y firma del productor:</label>
                            <input type="text" class="form-control" id="nombreProductor" name="nombreProductor">
                        </div>

                        <div class="col-md-6">
                            <label for="nombreEncuestador">Nombre y firma del encuestador:</label>
                            <input type="text" class="form-control" id="nombreEncuestador" name="nombreEncuestador">
                        </div>

                        <div class="col-md-6">
                            <label for="nombreSupervisor">Nombre y firma del supervisor:</label>
                            <input type="text" class="form-control" id="nombreSupervisor" name="nombreSupervisor">
                        </div>

                    </div>
                </div>


                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosPracticaForm')">Regresar</button>
                    <button type="submit" id="guardarBtn" class="btn btn-actualizar">Enviar</button>
                    
                </div>
            </form>

        </div>
    </div>
</div>
</div>
</div>



<script>
    function navigateToForm(sectionId) {
        // Oculta todos los formularios.
        document.querySelectorAll('.form-section').forEach(form => {
            form.style.display = 'none';
        });

        // Muestra el formulario solicitado.
        const targetForm = document.querySelector(sectionId);
        if (targetForm) {
            targetForm.style.display = 'block';
        }

        // Desactiva todos los elementos del menú.
        document.querySelectorAll('.menu-item').forEach(link => {
            link.classList.remove('active');
            link.querySelector('.menu-number').style.backgroundColor = '#fff';
            link.querySelector('.menu-number').style.color = '#5ce5d7';
        });

        // Activa el elemento del menú correspondiente.
        const activeLink = document.querySelector(`a[href='${sectionId}']`);
        if (activeLink) {
            activeLink.classList.add('active');
            const activeMenuNumber = activeLink.querySelector('.menu-number');
            if (activeMenuNumber) {
                activeMenuNumber.style.backgroundColor = '#5ce5d7';
                activeMenuNumber.style.color = '#fff';
            }
        }
    }

    // Se asegura de activar el primer ítem del menú al cargar.
    document.addEventListener('DOMContentLoaded', () => {
        navigateToForm('#datosTrabajadorForm');
        // Activa visualmente el primer ítem del menú.
        const firstMenuItem = document.querySelector('.menu-item:first-child .menu-number');
        if (firstMenuItem) {
            firstMenuItem.style.backgroundColor = '#5ce5d7';
            firstMenuItem.style.color = '#fff';
        }
    });

    //Para mostrar las organizaciones en dado caso que pertenezca
    function mostrarOrganizaciones() {
        var radioSi = document.getElementById("si");
        var organizacionesDiv = document.getElementById("organizaciones");

        if (radioSi.checked) {
            organizacionesDiv.classList.remove("hidden");
        } else {
            organizacionesDiv.classList.add("hidden");
        }
    }
    //Relevo
    function mostrarCuadro() {
        var radioSi = document.getElementById("Si");
        var cuantosDiv = document.getElementById("cuantos");

        if (radioSi.checked) {
            cuantosDiv.classList.remove("hidden");
        } else {
            cuantosDiv.classList.add("hidden");
        }
    }

    //Para mostrar las organizaciones en dado caso que pertenezca
    function escribirOtra() {
        const otrasOrgContainer = document.getElementById('otrasOrgContainer');
        otrasOrgContainer.classList.toggle('hidden', !document.getElementById('checkboxOtra').checked);
    }


    function escribirEtnia() {
        const otrasEtnContainer = document.getElementById('otrasEtnContainer');
        otrasEtnContainer.classList.toggle('hidden', !document.getElementById('otros').checked);
    }
</script>

<script>
    function mostrarOpcionesGenero(tipoAnimal) {
        var divGenero = document.getElementById('divGenero');
        // Animales que no se diferencian por género
        var animalesSinGenero = ['PollosEngorde', 'Aves', 'Peces', 'Camarones'];

        if (animalesSinGenero.includes(tipoAnimal)) {
            divGenero.style.display = 'none';
        } else {
            divGenero.style.display = 'block';
        }
    }
</script>

<script>
    function agregarATabla() {
        var tipoAnimal = document.getElementById('tipoAnimal').value;
        var generoAnimal = document.getElementById('generoAnimal').value;
        var cantidadAnimal = document.getElementById('cantidadAnimal').value;

        // Crear una nueva fila
        var fila = "<tr><td>" + tipoAnimal + "</td><td>" + generoAnimal + "</td><td>" + cantidadAnimal + "</td></tr>";

        // Agregar la fila a la tabla
        document.getElementById('tablaTemporal').innerHTML += fila;

        //Limpiar los campos después de agregar
        document.getElementById('tipoAnimal').value = '';
        document.getElementById('generoAnimal').value = '';
        document.getElementById('cantidadAnimal').value = '';
    }
</script>

<script>
    function agregarAUnidadesVendidas() {
        var tipoAnimal = document.getElementById('tipoAnimalU').value;
        var precioVenta = document.getElementById('precioVentaU').value;
        var unidadMedida = document.getElementById('unidadMedida').value;
        var mercado = document.getElementById('mercado').value;

        // Crear una nueva fila para la tabla de unidades vendidas
        var filaUnidadesVendidas = "<tr><td>" + tipoAnimal + "</td><td>" + precioVenta + "</td><td>" + unidadMedida + "</td><td>" + mercado + "</td></tr>";

        // Agregar la fila a la tabla correspondiente
        document.getElementById('tablaUnidadesVendidas').innerHTML += filaUnidadesVendidas;

        // Limpiar los campos después de agregar
        document.getElementById('tipoAnimalU').value = '';
        document.getElementById('precioVentaU').value = '';
        document.getElementById('unidadMedida').value = '';
        document.getElementById('mercado').value = '';
    }
</script>

<script>
    function agregarATablaProduccion() {
        var tipoProduccion = document.getElementById('tipoProduccion').value;
        var periodicidad = document.getElementById('periodicidad').value;
        var unidadMedida = document.getElementById('unidadMedidaPC').value;
        var cantidadVendida = document.getElementById('cantidadVendidaPC').value;
        var precioVenta = document.getElementById('precioVentaPC').value;
        var cliente = document.getElementById('cliente').value;

        // Crear una nueva fila para la tabla
        var nuevaFila = `<tr>
                        <td>${tipoProduccion}</td>
                        <td>${periodicidad}</td>
                        <td>${unidadMedida}</td>
                        <td>${cantidadVendida}</td>
                        <td>${precioVenta}</td>
                        <td>${cliente}</td>
                     </tr>`;

        // Agregar la nueva fila a la tabla
        document.getElementById('tablaDatosTemporal').innerHTML += nuevaFila;

        // Limpiar los campos después de agregar
        document.getElementById('tipoProduccion').value = '';
        document.getElementById('periodicidad').value = '';
        document.getElementById('unidadMedidaPC').value = '';
        document.getElementById('cantidadVendidaPC').value = '';
        document.getElementById('precioVentaPC').value = '';
        document.getElementById('cliente').value = '';
    }
</script>

<script>
    function agregarIngreso() {
        var tipoIngreso = document.getElementById('tipoIngreso').value;
        var cantidadIngreso = document.getElementById('cantidadIngreso').value;

        // Crear una nueva fila para la tabla
        var nuevaFila = `<tr>
                        <td>${tipoIngreso}</td>
                        <td>${cantidadIngreso}</td>
                     </tr>`;

        // Agregar la nueva fila a la tabla
        document.getElementById('tablaIngresos').innerHTML += nuevaFila;

        // Limpiar los campos después de agregar
        document.getElementById('tipoIngreso').selectedIndex = 0;
        document.getElementById('cantidadIngreso').value = '';
    }
</script>

<script>
    function manejarSeleccionPrestamo() {
        var prestamoSi = document.getElementById('prestamoSi').checked;
        var prestamoNo = document.getElementById('prestamoNo').checked;

        if (prestamoSi) {
            document.getElementById('opcionesPrestamoSi').style.display = 'block';
            document.getElementById('opcionesPrestamoNo').style.display = 'none';
        } else if (prestamoNo) {
            document.getElementById('opcionesPrestamoSi').style.display = 'none';
            document.getElementById('opcionesPrestamoNo').style.display = 'block';
        }
    }

    document.getElementById('prestamoSi').addEventListener('change', manejarSeleccionPrestamo);
    document.getElementById('prestamoNo').addEventListener('change', manejarSeleccionPrestamo);

    document.addEventListener('DOMContentLoaded', manejarSeleccionPrestamo);
</script>

<script>
    function manejarSeleccionActividadesFuera() {
        var actividadesFueraSi = document.getElementById('actividadesFueraSi').checked;
        var actividadesFueraNo = document.getElementById('actividadesFueraNo').checked;

        if (actividadesFueraSi) {
            document.getElementById('seccionTrabajadores').style.display = 'block';
            document.getElementById('cuantosActividadesFuera').style.display = 'block';
            document.getElementById('seccionTomadorDecisiones').style.display = 'block';
        } else if (actividadesFueraNo) {
            document.getElementById('seccionTrabajadores').style.display = 'none';
            document.getElementById('cuantosActividadesFuera').style.display = 'none';
            document.getElementById('seccionTomadorDecisiones').style.display = 'block';
        }
    }

    document.getElementById('actividadesFueraSi').addEventListener('change', manejarSeleccionActividadesFuera);
    document.getElementById('actividadesFueraNo').addEventListener('change', manejarSeleccionActividadesFuera);

    document.addEventListener('DOMContentLoaded', manejarSeleccionActividadesFuera);
</script>

<script>
    var expanded = false;

    function showCheckboxes() {
        var checkboxes = document.getElementById("checkboxes");
        if (!expanded) {
            checkboxes.style.display = "block";
            expanded = true;
        } else {
            checkboxes.style.display = "none";
            expanded = false;
        }
    }
</script>

<script>
    function manejarSeleccionApoyo() {
        var apoyoSi = document.getElementById('apoyoSi').checked;
        var apoyoNo = document.getElementById('apoyoNo').checked;

        var seccionesOcultar = document.querySelectorAll('.seccionOculta');
        var seccionFinal = document.getElementById('seccionFinal');

        if (apoyoSi) {
            seccionesOcultar.forEach(function(seccion) {
                seccion.style.display = 'block';
            });
            seccionFinal.style.display = 'block';
        } else if (apoyoNo) {
            seccionesOcultar.forEach(function(seccion) {
                seccion.style.display = 'none';
            });
            seccionFinal.style.display = 'block';
        }
    }

    document.getElementById('apoyoSi').addEventListener('change', manejarSeleccionApoyo);
    document.getElementById('apoyoNo').addEventListener('change', manejarSeleccionApoyo);

    document.addEventListener('DOMContentLoaded', manejarSeleccionApoyo);
</script>

<script>
      $(document).ready(function () {
          $('#datosFichaForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/llenar_registro.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
      $(document).ready(function () {
          $('#datosTrabajadorForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosTrabajadorForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>





<script>
      $(document).ready(function () {
          $('#datosUbiForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosUbiForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>



<script>
      $(document).ready(function () {
          $('#datosPertenenciaForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosPertenenciaForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>

  <script>
      $(document).ready(function () {
          $('#datosHogarForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosHogarForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>


<script>
      $(document).ready(function () {
          $('#datosEtniaForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosEtniaForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>


<script>
      $(document).ready(function () {
          $('#datosRelevoForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosRelevoForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>




<script>
      $(document).ready(function () {
          $('#datosMigraForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosMigraForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>




<script>
      $(document).ready(function () {
          $('#datosUnidadForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosUnidadForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>



<script>
      $(document).ready(function () {
          $('#datosAgricolaForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosAgricolaForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>



<script>
      $(document).ready(function () {
          $('#datosPecuariaForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosPecuariaForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>


<script>
      $(document).ready(function () {
          $('#datosPrCoForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosPrCoForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>



<script>
      $(document).ready(function () {
          $('#datosOtrosForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosOtrosForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>


<script>
      $(document).ready(function () {
          $('#datosCreditoForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosCreditoForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>


<script>
      $(document).ready(function () {
          $('#datosActividadesForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosActividadesForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>

<script>
      $(document).ready(function () {
          $('#datosPracticaForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosPracticaForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>

<script>
      $(document).ready(function () {
          $('#datosApoyoForm').submit(function (e) {
              e.preventDefault();  // Evitar la recarga de la página

              // Realizar la solicitud AJAX
              $.ajax({
                  type: 'POST',
                  url: 'modelos/datosApoyoForm.php',
                  data: $(this).serialize(),
                  success: function (response) {
                      // Aquí puedes manejar la respuesta del servidor si es necesario
                      console.log(response);
                      // Deshabilita el botón después de hacer clic
                      $('#guardarBtn').prop('disabled', true);
                      // O puedes ocultar el botón si prefieres
                      // $('#guardarBtn').hide();
                  },
                  error: function (error) {
                      // Manejar el error si es necesario
                      console.error(error);
                  }
              });
          });
      });
  </script>