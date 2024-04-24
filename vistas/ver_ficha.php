<?php
session_start();
$_SESSION['url'] = 'vistas/editar_ficha.php';
$_SESSION['content-wrapper'] = 'content-wrapper';

include "../php/conexion_be.php";

$numeroFicha = $_GET['parametro'];
$_SESSION['id_ficha'] = $numeroFicha;


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

<button class="btn btn-danger" onclick="CargarContenido('vistas/Mantenimiento_Ficha.php','content-wrapper');">
<i class="fas fa-reply"></i>&nbsp;Regresar a Fichas</button>
<br>
<br>

<div class="containertable">
    <div class="header">
        <h1 class="poppins-font mb-2">EDICIÓN DE FICHA</h1>
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
            <form action="" id="datosFichaForm" class="form-section">
                <h3>Ficha</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="codigo">Código ficha</label>
                        <input type="text" class="form-control" id="codigo" placeholder="Código Ficha" value="<?php echo  $numeroFicha; ?>" readonly>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="fecha_solicitud">Fecha de solicitud</label>
                        <input type="date" class="form-control" id="fecha_solicitud" name="fecha_solicitud" placeholder="Fecha" readonly>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="anio_solicitud">Año de solicitud</label>
                        <input type="number" class="form-control" id="anio_solicitud" name="anio_solicitud" placeholder="Año Actual" readonly>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="fecha_entrevista" class="form-label">Fecha de la entrevista</label>
                        <input type="date" class="form-control" id="fecha_entrevista" name="fecha_entrevista" placeholder="Fecha Actual" readonly>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="nombre_encuestador" class="form-label">Encuestador</label>
                        <input type="text" class="form-control" id="nombre_encuestador" name="nombre_encuestador" placeholder="Nombre Encuestador" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="nombre_encuestado" class="form-label">Encuestado</label>
                        <input type="text" class="form-control" id="nombre_encuestado" name="nombre_encuestado" placeholder="Nombre Encuestado" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="nombre_supervisor" class="form-label">Supervisor</label>
                        <input type="text" class="form-control" id="nombre_supervisor" name="nombre_supervisor" placeholder="Nombre Supervisor" readonly>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="descripcion">Descripción</label>
                        <textarea cols="50" rows="5" class="form-control" id="descripcion" name="descripcion" placeholder="Descripción" readonly> </textarea>
                        <!-- <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="Descripción">-->
                    </div>
                </div>
                <div class="modal-footer center-content-between">
                    <button type="button" id="guardarBtn" onclick="navigateToForm('#datosTrabajadorForm')" class="btn btn-actualizar">Siguiente</button>
                    <!-- <button type="button" class="btn btn-info" onclick="navigateToForm('#datosTrabajadorForm')">Siguiente</button> -->
                </div>
            </form>


            <!-- Formulario de Datos Generales -->
            <form action="" id="datosTrabajadorForm" class="form-section" style="display: none;">
                <!-- Agrega el campo formType -->
                <input type="hidden" name="formType" value="datosTrabajador">
                <!-- Datos del Trabajador -->
                <h3>Datos Generales</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="primerNombre">Primer Nombre</label>
                        <input type="text" class="form-control" id="primerNombre" name="primerNombre" placeholder="Primer Nombre" readonly>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="segundoNombre">Segundo Nombre</label>
                        <input type="text" class="form-control" id="segundoNombre" name="segundoNombre" placeholder="Segundo Nombre" readonly>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="primerApellido">Primer Apellido</label>
                        <input type="text" class="form-control" id="primerApellido" name="primerApellido" placeholder="Primer Apellido" readonly>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="segundoApellido">Segundo Apellido</label>
                        <input type="text" class="form-control" id="segundoApellido" name="segundoApellido" placeholder="Segundo Apellido" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="identidadProductor" class="form-label">Número de identidad</label>
                        <input type="text" class="form-control" id="identidadProductor" name="identidadProductor" placeholder="Identidad" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="sexoProductor">Sexo</label>
                        <select id="sexoProductor" class="form-control" name="sexoProductor" readonly>
                            <option value="" disabled selected>Seleccione...</option>
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="fechaNacimiento">Fecha de nacimiento</label>
                        <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" placeholder="Fecha de Nacimiento" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="estadoCivilProductor" class="form-label">Estado Civil</label>
                        <select class="form-control" id="estadoCivilProductor" name="estadoCivilProductor" readonly>
                            <option value="" disabled selected>Seleccione...</option>
                            <option value="Casado(a)">Casado(a)</option>
                            <option value="Soltero(a)">Soltero(a)</option>
                            <option value="Unión libre">Unión libre</option>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="escolaridadProductor" class="form-label">Nivel Educativo</label>
                        <select class="form-control" id="escolaridadProductor" name="escolaridadProductor" readonly>
                            <option value="" disabled selected>Seleccione...</option>
                            <option value="ninguno">Ninguno</option>
                            <option value="primaria">Primaria</option>
                            <option value="secundaria">Secundaria</option>
                            <option value="universitaria">Universitaria</option>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="ultimoGradoEscolar" class="form-label">Último grado escolar aprobado</label>
                        <select class="form-control" id="ultimoGradoEscolar" name="ultimoGradoEscolar" readonly>
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

                    <div class="form-group col-md-4">
                        <label for="telefonoPrincipa" class="form-label">Teléfono Principal</label>
                        <input type="tel" class="form-control" id="telefonoPrincipal" name="telefonoPrincipal" placeholder="Teléfono Principal" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="telefonoSecundario" class="form-label">Teléfono Secundario</label>
                        <input type="tel" class="form-control" id="telefonoSecundario" name="telefonoSecundario" placeholder="Teléfono Secundario" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="telefonoOpcional" class="form-label">Teléfono Opcional</label>
                        <input type="tel" class="form-control" id="telefonoOpcional" name="telefonoOpcional" placeholder="Teléfono Opcional" readonly>
                    </div>


                    <div class="form-group col-md-4">
                        <label for="correoPrincipal" class="form-label">Correo Principal</label>
                        <input type="email" class="form-control" id="correoPrincipal" name="correoPrincipal" placeholder="Correo Principal" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="correoSecundario" class="form-label">Correo Secundario</label>
                        <input type="email" class="form-control" id="correoSecundario" name="correoSecundario" placeholder="Correo Secundario" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="correoOpcional" class="form-label">Correo Opcional</label>
                        <input type="email" class="form-control" id="correoOpcional" name="correoOpcional" placeholder="Correo Opcional" readonly>
                    </div>

                </div>


                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosFichaForm')">Regresar</button>
                    <button type="button" id="guardarBtn" onclick="navigateToForm('#datosUbiForm')" class="btn btn-actualizar">Siguiente</button>
                </div>
            </form>

            <!-- Formulario de Ubicación Geográfica -->
            <form action="" id="datosUbiForm" class="form-section" style="display: none;">
                <!-- Agrega el campo formType -->
                <input type="hidden" name="formType" value="datosUbi">
                <h3>Ubicación Geográfica</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="Id_Departamento">Departamento </label>
                        <select class="form-control" id="Id_Departamento" name="Id_Departamento" readonly>
                            <option value="" selected disabled>Seleccione una opción</option>
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
                        <select class="form-control" id="Id_Municipio" name="Id_Municipio" readonly>

                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="Id_Aldea">Aldea:</label>
                        <select class="form-control" id="Id_Aldea" name="Id_Aldea" readonly>
                            <option value="" selected disabled>Seleccione una opción</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="Id_Cacerio">Caseríos:</label>
                        <select class="form-control" id="Id_Cacerio" name="Id_Cacerio" readonly>
                            <option value="" selected disabled>Seleccione una opción</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label>Vive en la finca el productor(a):</label>
                        <div>
                            <input type="radio" id="viveFincaSi" name="viveFinca" value="S" disabled>
                            <label for="viveFincaSi">Si</label>
                            <input type="radio" id="viveFincaNo" name="viveFinca" value="N" disabled>
                            <label for="viveFincaNo">No</label>
                        </div>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="nombreFinca" class="form-label">Nombre de la finca</label>
                        <input class="form-control" type="text" id="nombreFinca" name="nombreFinca" placeholder="Nombre de la finca" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="ubicacion" class="form-label">Ubicación</label>
                        <input type="text" class="form-control" id="ubicacion" name="ubicacion" placeholder="Ubicación" readonly>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="distanciaVivienda" class="form-label">Distancia(km/m):</label>
                        <input type="text" class="form-control" id="distanciaVivienda" name="distanciaVivienda" placeholder="Distancia entre parcela y vivienda(km/m)" readonly>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="latitudParcela" class="form-label">Latitud de la parcela:</label>
                        <input type="text" class="form-control" id="latitudParcela" name="latitudParcela" placeholder="Longitud" readonly>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="longitudParcela" class="form-label">Longitud de la parcela:</label>
                        <input type="text" class="form-control" id="longitudParcela" name="longitudParcela" placeholder="Latitud" readonly>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="msnm" class="form-label">MSNM:</label>
                        <input type="number" class="form-control" id="msnm" name="msnm" placeholder="Metros sobre el nivel del mar" readonly>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="direccionPrincipal" class="form-label">Dirección Principal</label>
                        <textarea cols="40" rows="3" class="form-control" id="direccionPrincipal" name="direccionPrincipal" placeholder="Dirección 1" readonly> </textarea>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="direccionSecundario" class="form-label">Dirección Secundario</label>
                        <textarea cols="40" rows="3" class="form-control" id="direccionSecundario" name="direccionSecundario" placeholder="Dirección 2" readonly></textarea>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="direccionOpcional" class="form-label">Dirección Opcional</label>
                        <textarea cols="40" rows="3" class="form-control" id="direccionOpcional" name="direccionOpcional" placeholder="Dirección 3" readonly></textarea>
                    </div>
                </div>

                <div class="modal-footer center-content-between">


                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosTrabajadorForm')">Regresar</button>
                    <button type="button" id="guardarBtn" onclick="navigateToForm('#datosPertenenciaForm')" class="btn btn-actualizar">Siguiente</button>


                </div>
            </form>


            <!-- Formulario de Pertenencia a Organizaciones -->
            <form action="" id="datosPertenenciaForm" class="form-section" style="display: none;">
                <h3>Pertenencia a Organizaciones</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="pertenece">¿Pertenece a alguna organización?</label>
                        <div>
                            <input type="radio" id="si" name="pertenece" value="si" disabled>
                            <label for="si"> Si </label>
                            <input type="radio" id="no" name="pertenece" value="no" disabled>
                            <label for="no"> No </label>
                        </div>
                    </div>
                </div>
                <div id="organizaciones">
                    <div class="form-group col-md-8">
                        <label for="PerteneceOr">A qué organizaciones pertenece</label>
                        <br>
                        <div class="form-checkbox" id="CheckboxOrganizacion" > </div>
                    </div>
                </div>
                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosUbiForm')">Regresar</button>
                    <button type="button" id="guardarBtn" onclick="navigateToForm('#datosHogarForm')" class="btn btn-actualizar">Siguiente</button>

                </div>
            </form>

            <!-- Formulario de Composición del hogar -->
            <form action="" id="datosHogarForm" class="form-section" style="display: none;">
                <h3>Composición del Hogar</h3>
                <br>

                <br>
                <table class="table">
                    <thead class="table-dark">
                        <tr>
                            <th>Edad</th>
                            <th>Género</th>
                            <th>Cantidad</th>
                        </tr>
                    </thead>
                    <tbody id="tablaTemporal" class="table-hover">
                        <!-- Los elementos agregados aparecerán aquí -->
                    </tbody>
                </table>

                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosPertenenciaForm')">Regresar</button>
                    <button type="button" id="guardarBtn" onclick="navigateToForm('#datosEtniaForm')" class="btn btn-actualizar">Siguiente</button>

                </div>
            </form>

            <!-- Formulario de Etnicidad-->
            <form action="" id="datosEtniaForm" class="form-section" style="display: none;">
                <h3>Etnicidad</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-8">
                        <label for="PerteneceEt"> A cuál de las siguientes etnias pertenece usted</label>
                        <p>
                        <div class="form-group">
                            <div>
                                <input type="radio" id="id_etnia" name="etnia" value="1" disabled>
                                <label for="lencas">Lencas</label>
                            </div>

                            <div>
                                <input type="radio" id="pech" name="etnia" value="2" disabled>
                                <label for="pech">Pech</label>
                            </div>

                            <div>
                                <input type="radio" id="tolupanes" name="etnia" value="3" disabled>
                                <label for="tolupanes">Tolupanes</label>
                            </div>

                            <div>
                                <input type="radio" id="garifunas" name="etnia" value="4" disabled>
                                <label for="garifunas">Garífunas</label>
                            </div>

                            <div>
                                <input type="radio" id="mayaChortis" name="etnia" value="5" disabled>
                                <label for="mayaChortis">Maya Chortís</label>
                            </div>

                            <div>
                                <input type="radio" id="tawahkas" name="etnia" value="6" disabled>
                                <label for="tawahkas">Tawahkas</label>
                            </div>

                            <div>
                                <input type="radio" id="misquitos" name="etnia" value="7" disabled>
                                <label for="misquitos">Misquitos</label>
                            </div>

                            <div>
                                <input type="radio" id="nahua" name="etnia" value="8" disabled>
                                <label for="nahua">Nahua</label>
                            </div>

                            <div>
                                <input type="radio" id="ladino" name="etnia" value="9" disabled>
                                <label for="ladino">Ladino</label>
                            </div>

                            <div>
                                <input type="radio" id="negroHablaInglesa" name="etnia" value="10" disabled>
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
                    <button type="button" id="guardarBtn" onclick="navigateToForm('#datosRelevoForm')" class="btn btn-actualizar">Siguiente</button>

                </div>
            </form>

            <!-- Formulario de Relevo Generacional -->
            <form action="" id="datosRelevoForm" class="form-section" style="display: none;">
                <h3>Relevo Generacional</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-8">
                        <label>¿De las actividades agropecuarias que desarrolla, usted cree que la seguirán practicando alguno o algunos de los miembros del hogar?</label>
                        <div>
                            <input type="radio" id="relevoSi" name="relevo" value="Si" disabled>
                            <label for="Si">Si</label>
                            <div id="cuantosHay">
                                <div class="form-group col-md-8">
                                    <label for="cuantos">Cuantos</label>
                                    <input type="number" name="cuantos" id="cuantos" min="0" class="cuadro-texto" readonly>
                                    <br>
                                </div>
                            </div>
                            <br>
                            <input type="radio" id="relevoNo" name="relevo" value="No" disabled>
                            <label for="No">No</label>
                        </div>
                    </div>
                </div>



                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosEtniaForm')">Regresar</button>
                    <button type="button" id="guardarBtn" onclick="navigateToForm('#datosMigraForm')" class="btn btn-actualizar">Siguiente</button>

                </div>
            </form>

            <!-- Formulario de Migración Familiar -->
            <form action="" id="datosMigraForm" class="form-section" style="display: none;">
                <h3>Migración Familiar</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label>Alguien del hogar ha emigrado?</label>
                        <div>
                            <input type="radio" id="MigraSi" name="migra" value="S" disabled>
                            <label for="Si">Si</label>

                            <input type="radio" id="MigraNo" name="migra" value="N" disabled>
                            <label for="No">No</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label for="destino">¿Hacia dónde emigró?</label>
                        <div>
                            <input type="radio" name="destino" value="dentro_del_pais" id="dentroDelPais" disabled>
                            <label for="dentroDelPais">Dentro del país</label>

                            <input type="radio" name="destino" value="otro_pais" id="otroPais" disabled>
                            <label for="otroPais">Otro país</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label for="destino">¿Por qué emigró?</label>
                        <div class="form-checkbox" id="CheckboxMigracion">

                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label>¿Le envía remesas?</label>
                        <div>
                            <input type="radio" name="remesas" value="si" id="siRemesas" disabled>
                            <label for="siRemesas"> Si</label>

                            <input type="radio" name="remesas" value="no" id="noRemesas" disabled>
                            <label for="noRemesas"> No</label>
                        </div>
                    </div>
                </div>

                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosRelevoForm')">Regresar</button>
                    <button type="button" id="guardarBtn" class="btn btn-actualizar" onclick="navigateToForm('#datosUnidadForm')">Siguiente</button>
                </div>
            </form>


            <!-- Formulario de Información Básica de la Unidad Productiva -->
            <form action="" id="datosUnidadForm" class="form-section" style="display: none;">
                <h3>Información Básica de la Unidad Productiva</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="tierra">La tierra que maneja es</label>
                        <br>
                        <div class="form-radio">

                            <input type="radio" name="razon" value="Propia" id="propia" disabled>
                            <label for="propia">Propia</label>

                            <input type="radio" name="razon" value="Alquilada" id="alquilada" disabled>
                            <label for="alquilada">Alquilada</label>

                            <input type="radio" name="razon" value="Prestada" id="prestada" disabled>
                            <label for="prestada">Prestada</label>

                            <input type="radio" name="razon" value="Ejidal" id="ejidal" disabled>
                            <label for="ejidal">Ejidal</label>
                        </div>
                        <br>
                        <div class="form-group col-md-8">
                            <label for="produccion" class="form-label">Cuánta de esa área disponible es apta para la producción agropecuaria</label>
                            <select class="form-control" id="Id_Superficie_Produccion" name="Id_Superficie_Produccion" readonly>
                                <?php
                                // Conexión a la base de datos
                                include '../php/conexion_be.php';

                                // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                                $sql = "SELECT id_medida, medida FROM tbl_medidas_tierra";

                                // Ejecutar la consulta
                                $result = mysqli_query($conexion, $sql);

                                if (mysqli_num_rows($result) > 0) {
                                    while ($row = mysqli_fetch_assoc($result)) {
                                        // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                        echo '<option value="' . $row["id_medida"] . '">' . $row["medida"] . '</option>';
                                    }
                                } else {
                                    echo '<option value="">No hay municipios disponibles</option>';
                                }

                                // Cierra la conexión a la base de datos
                                mysqli_close($conexion);
                                ?>
                            </select>
                        </div>
                    </div>
                </div>

                <h4>
                    Del total de tierra que maneja, ¿cuánta superficie dedica a las actividades siguientes?
                </h4>
                <br>
                <h5>Agricultura</h5>

                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="Id_Superficie_Agricultura">Medida Superficie Agricultura:</label>
                        <select class="form-control" id="Id_Superficie_Agricultura" name="Id_Superficie_Agricultura" readonly>
                            <option value="" selected disabled>Seleccione una opción</option>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                            $sql = "SELECT id_medida, medida FROM tbl_medidas_tierra";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                    echo '<option value="' . $row["id_medida"] . '">' . $row["medida"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay municipios disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="areaAgricultura">Superficie dedicada a Agricultura</label>
                        <input type="number" class="form-control" name="areaAgricultura" id="areaAgricultura" placeholder="" readonly>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="rubrosAgricultura">Rubros</label>
                        <input type="text" class="form-control" name="rubrosAgricultura" id="rubrosAgricultura" readonly>
                    </div>
                </div>

                <br>
                <h5>Ganadería</h5>

                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="Id_Superficie_Ganaderia">Medida Superficie Ganadería:</label>
                        <select class="form-control" id="Id_Superficie_Ganaderia" name="Id_Superficie_Ganaderia" readonly>
                            <option value="" selected disabled>Seleccione una opción</option>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                            $sql = "SELECT id_medida, medida FROM tbl_medidas_tierra";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                    echo '<option value="' . $row["id_medida"] . '">' . $row["medida"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay municipios disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="areaGanaderia">Superficie dedicada a Ganadería</label>
                        <input type="number" class="form-control" name="areaGanaderia" id="areaGanaderia" placeholder="" readonly>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="rubrosGanaderia">Rubros</label>
                        <input type="text" class="form-control" name="rubrosGanaderia" id="rubrosGanaderia" readonly>
                    </div>
                </div>

                <br>
                <h5>Apicultura</h5>

                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="Id_Superficie_Apicultura">Medida Superficie Apicultura:</label>
                        <select class="form-control" id="Id_Superficie_Apicultura" name="Id_Superficie_Apicultura" readonly>
                            <option value="" selected disabled>Seleccione una opción</option>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                            $sql = "SELECT id_medida, medida FROM tbl_medidas_tierra";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                    echo '<option value="' . $row["id_medida"] . '">' . $row["medida"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay municipios disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="areaApicultura">Superficie dedicada a Apicultura</label>
                        <input type="number" class="form-control" name="areaApicultura" id="areaApicultura" placeholder="" readonly>
                    </div>
                </div>


                <br>
                <h5>Forestal</h5>

                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="Id_Superficie_Forestal">Medida Superficie Forestal:</label>
                        <select class="form-control" id="Id_Superficie_Forestal" name="Id_Superficie_Forestal" readonly>
                            <option value="" selected disabled>Seleccione una opción</option>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                            $sql = "SELECT id_medida, medida FROM tbl_medidas_tierra";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                    echo '<option value="' . $row["id_medida"] . '">' . $row["medida"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay municipios disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="areaForestal">Superficie dedicada a Forestal</label>
                        <input type="number" class="form-control" name="areaForestal" id="areaForestal" placeholder="" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="rubrosForestal">Rubros</label>
                        <input type="text" class="form-control" name="rubrosForestal" id="rubrosForestal" readonly>
                    </div>
                </div>

                <br>
                <h5>Acuacultura</h5>

                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="Id_Superficie_Acuacultura">Medida Superficie Acuacultura:</label>
                        <select class="form-control" id="Id_Superficie_Acuacultura" name="Id_Superficie_Acuacultura" readonly>
                            <option value="" selected disabled>Seleccione una opción</option>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                            $sql = "SELECT id_medida, medida FROM tbl_medidas_tierra";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                    echo '<option value="' . $row["id_medida"] . '">' . $row["medida"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay municipios disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="areaAcuacultura">Superficie dedicada a Acuacultura</label>
                        <input type="number" class="form-control" name="areaAcuacultura" id="areaAcuacultura" placeholder="" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="numEstanques">Número de estanques</label>
                        <input type="text" class="form-control" name="numEstanques" id="numEstanques" readonly>
                    </div>
                </div>


                <br>
                <h5>Agroturismo</h5>

                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="Id_Superficie_Agroturismo">Medida Superficie Agroturismo:</label>
                        <select class="form-control" id="Id_Superficie_Agroturismo" name="Id_Superficie_Agroturismo" readonly>
                            <option value="" selected disabled>Seleccione una opción</option>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                            $sql = "SELECT id_medida, medida FROM tbl_medidas_tierra";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                    echo '<option value="' . $row["id_medida"] . '">' . $row["medida"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay municipios disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="areaAgroturismo">Superficie dedicada a Agroturismo</label>
                        <input type="number" class="form-control" name="areaAgroturismo" id="areaAgroturismo" placeholder="" readonly>
                    </div>
                </div>
                <br>

                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="otrosUsos">Otros Usos</label>
                        <input type="text" name="otrosUsos" id="otrosUsos" placeholder="Escriba aquí..." class="form-control" readonly>
                        <br>
                    </div>
                </div>


                <h3>Riego</h3>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="sistemaRiego">¿Posee sistema de riego?</label><br>
                        <input type="radio" name="sistemaRiego" value="Si" id="SistemaSi" disabled> Si
                        <input type="radio" name="sistemaRiego" value="No" id="SistemaNo" disabled> No<br>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="Medida_Riego">Medida de Riego </label>
                        <select class="form-control" id="Medida_Riego" name="Medida_Riego" readonly>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                            $sql = "SELECT id_medida, medida FROM tbl_medidas_tierra";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                    echo '<option value="' . $row["id_medida"] . '">' . $row["medida"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay municipios disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="areaRiego">Área bajo riego</label>
                        <input type="text" name="areaRiego" id="areaRiego" placeholder="(Ha.)(Mz.)(Tarea)" class="form-control" readonly>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="tipoRiego">Tipo de Riego</label>
                        <select class="form-control" id="tipoRiego" name="tipoRiego" readonly>
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                            $sql = "SELECT id_tipo_riego, tipo_riego FROM tbl_tipo_riego";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                    echo '<option value="' . $row["id_tipo_riego"] . '">' . $row["tipo_riego"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay municipios disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="fuenteAgua">Fuente de agua</label>
                        <input type="text" name="fuenteAgua" id="fuenteAgua" class="form-control" readonly>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="disponibilidadAgua">Disponibilidad de agua en el año (meses)</label>
                        <input type="text" name="disponibilidadAgua" id="disponibilidadAgua" class="form-control" readonly>
                    </div>
                </div>

                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosMigraForm')">Regresar</button>
                    <button type="button" id="guardarBtn" onclick="navigateToForm('#datosAgricolaForm')" class="btn btn-actualizar">Siguiente</button>
                </div>
            </form>



            <!-- Formulario de Produccion Agricola -->
            <form action="" id="datosAgricolaForm" class="form-section" style="display: none;">
                <h3>Información de Cultivos</h3>
                <div class="cultivo-info">
                    <h4>Cultivo</h4>

                    <table class="table">
                        <thead class="table-dark">
                            <tr>
                                <th>Cultivo</th>
                                <th>Siembra</th>
                                <th>Área</th>
                                <th>Producción</th>
                                <th>Medida Producción</th>
                                <th>Cantidad</th>
                                <th>Medida Venta</th>
                                <th>Precio Unidad</th>
                                <th>A quién vendió</th>
                            </tr>
                        </thead>
                        <tbody id="tablaTemporalCultivo" class="table-hover">
                            <!-- Los elementos agregados aparecerán aquí -->
                        </tbody>
                    </table>
                </div>

                <div class="modal-footer center-content-between">
                    
                    <button type="button" onclick="navigateToForm('#datosPecuariaForm')" class="btn btn-actualizar">Siguiente</button>
                </div>
            </form>
        <!-- 10 -->

        <form action="" id="datosPecuariaForm" class="form-section" style="display: none;">
            <h3>Producción Pecuaria (Inventario)</h3>
            <br>

            <div class="row">
                <!-- Tipo de Animal -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="tipoAnimal">Tipo de Animal</label>
                        <select class="form-control" id="tipoAnimal" name="tipoAnimal">
                            <?php
                            // Conexión a la base de datos
                            include '../php/conexion_be.php';

                            // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                            $sql = "SELECT id_tipo_pecuario, tipo_pecuario FROM tbl_tipo_pecuarios";

                            // Ejecutar la consulta
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                    echo '<option value="' . $row["id_tipo_pecuario"] . '">' . $row["tipo_pecuario"] . '</option>';
                                }
                            } else {
                                echo '<option value="">No hay municipios disponibles</option>';
                            }

                            // Cierra la conexión a la base de datos
                            mysqli_close($conexion);
                            ?>
                        </select>
                    </div>
                </div>

                <!-- Género -->
                <div class="col-md-4">
                    <div class="form-group" id="divGenero">
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
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody id="tablaTemporalAnimales" class="table-hover">
                    <!-- Los elementos agregados aparecerán aquí -->
                </tbody>
            </table>


            <h3>Unidades vendidas año anterior</h3>
            <div class="row form-group">
                <!-- Tipo de Animal -->
                <div class="col-md-3">
                    <label for="tipoAnimal">Tipo de Animal</label>
                    <select class="form-control" id="tipoAnimalU" name="tipoAnimalU">
                        <?php
                        // Conexión a la base de datos
                        include '../php/conexion_be.php';

                        // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                        $sql = "SELECT id_tipo_pecuario, tipo_pecuario FROM tbl_tipo_pecuarios";

                        // Ejecutar la consulta
                        $result = mysqli_query($conexion, $sql);

                        if (mysqli_num_rows($result) > 0) {
                            while ($row = mysqli_fetch_assoc($result)) {
                                // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                echo '<option value="' . $row["id_tipo_pecuario"] . '">' . $row["tipo_pecuario"] . '</option>';
                            }
                        } else {
                            echo '<option value="">No hay municipios disponibles</option>';
                        }

                        // Cierra la conexión a la base de datos
                        mysqli_close($conexion);
                        ?>
                    </select>
                </div>

                <!-- Precio de Venta -->
                <div class="col-md-3">
                    <label for="precioVentaU">Precio de venta (Lps)</label>
                    <input type="number" class="form-control" id="precioVentaU" name="precioVentaU" min="0" step="0.01">
                </div>

                <!-- Unidad de Medida -->
                <div class="col-md-3">
                    <label for="unidadMedida">Unidad de medida:</label>
                    <select class="form-control" id="unidadMedida" name="unidadMedida">
                        <?php
                        // Conexión a la base de datos
                        include '../php/conexion_be.php';

                        // Consulta SQL para obtener los valores disponibles de ID y Nombre de Municipio
                        $sql = "SELECT id_medida, medida FROM tbl_medidas_tierra";

                        // Ejecutar la consulta
                        $result = mysqli_query($conexion, $sql);

                        if (mysqli_num_rows($result) > 0) {
                            while ($row = mysqli_fetch_assoc($result)) {
                                // Genera opciones con el nombre del municipio como etiqueta y el ID como valor
                                echo '<option value="' . $row["id_medida"] . '">' . $row["medida"] . '</option>';
                            }
                        } else {
                            echo '<option value="">No hay municipios disponibles</option>';
                        }

                        // Cierra la conexión a la base de datos
                        mysqli_close($conexion);
                        ?>
                    </select>
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
                <button type="button" id="guardarBtn" onclick="navigateToForm('#datosPrCoForm')" class="btn btn-actualizar">Siguiente</button>

            </div>
        </form>

        <!-- 11 -->

        <form action="" id="datosPrCoForm" class="form-section" style="display: none;">
            <h3>11. Producción y Comercialización Pecuaria</h3>

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
                        <tbody id="tablaDatosPecuaria">
                            <!-- Las filas agregadas se visualizarán aquí -->
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="modal-footer center-content-between">
                <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosPecuariaForm')">Regresar</button>
                <button type="button" id="guardarBtn" onclick="navigateToForm('#datosOtrosForm')" class="btn btn-actualizar">Siguiente</button>

            </div>
        </form>


        <!-- 12 -->
        <form action="" id="datosOtrosForm" class="form-section" style="display: none;">
            <h3>12. Otros ingresos en el hogar</h3>

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
                <button type="button" id="guardarBtn" onclick="navigateToForm('#datosCreditoForm')" class="btn btn-actualizar">Siguiente</button>
            </div>
        </form>

        <!-- 13 -->
        <form action="" id="datosCreditoForm" class="form-section" style="display: none;">
            <h3>13. Crédito para la producción agropecuaria</h3>

            <!-- Pregunta sobre préstamos -->
            <div class="form-group">
                <label>¿Ha solicitado préstamos para la producción agropecuaria?</label><br>
                <input type="radio" id="prestamoSi" name="prestamo" value="Si" disabled>
                <label for="prestamoSi">SI</label>
                <input type="radio" id="prestamoNo" name="prestamo" value="No" disabled>
                <label for="prestamoNo">NO</label>
            </div>

            <!-- Opciones si la respuesta es SI -->
            <div class="form-group" id="opcionesPrestamoSi">

            </div>

            <!-- Opciones si la respuesta es NO -->
            <div class="form-group" id="opcionesPrestamoNo">

            </div>

            <div class="modal-footer center-content-between">
                <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosOtrosForm')">Regresar</button>
                <button type="button" id="guardarBtn" onclick="navigateToForm('#datosActividadesForm')" class="btn btn-actualizar">Siguiente</button>

            </div>
        </form>


        <!-- 14 -->
        <form action="" id="datosActividadesForm" class="form-section" style="display: none;">
            <h3>14. Actividades externas a la unidad productiva</h3>

            <!-- Actividades fuera de la finca -->
            <div class="form-group">
                <label>¿Miembros de este hogar realizan actividades fuera de la finca?</label><br>
                <input type="radio" id="actividadesFueraSi" name="actividadesFuera" value="Yes" disabled>
                <label for="actividadesFueraSi">SI</label>
                <input type="radio" id="actividadesFueraNo" name="actividadesFuera" value="Not" disabled>
                <label for="actividadesFueraNo">NO</label>
                <input type="text" class="form-control" id="cuantosActividadesFuera" name="cuantosActividadesFuera" placeholder="cuantos" readonly>

            </div>

            <!-- Contratación de trabajadores no miembros -->
            <div class="form-group" id="seccionTrabajadores">
                <label>En las actividades productivas de su finca, ¿contrata trabajadores(as) que no son miembros de su hogar?</label>
                <div class="row">
                    <!-- Trabajadores Permanentes -->
                    <div class="col-md-6">
                        <label for="trabajadoresPermanentes">Permanentes</label>
                        <input type="number" class="form-control" id="trabajadoresPermanentes" name="trabajadoresPermanentes" placeholder="cuántos" readonly>
                    </div>

                    <!-- Trabajadores Temporales -->
                    <div class="col-md-6">
                        <label for="trabajadoresTemporales">Temporales</label>
                        <input type="number" class="form-control" id="trabajadoresTemporales" name="trabajadoresTemporales" placeholder="cuántos" readonly>
                    </div>
                </div>
            </div>


            <!-- Tomador de decisiones -->

            <div class="form-group" id="seccionTomadorDecisiones">
                <h4>14.1. ¿Quién es el tomador de decisiones con relación a las actividades agropecuarias de la finca?</h4>
                <div class="form-checkbox" id="CheckboxDecisiones"></div>
            </div>

            <div class="modal-footer center-content-between">
                <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosCreditoForm')">Regresar</button>
                <button type="button" id="guardarBtn" onclick="navigateToForm('#datosPracticaForm')" class="btn btn-actualizar">Siguiente</button>

            </div>
        </form>

        <!-- 15 -->

        <form action="modelos/EdicionFichas/editar_practica.php" method="POST" id="datosPracticaForm" class="form-section" style="display: none;">
            <h3>15. Prácticas para producción en la unidad productiva</h3>

            <div class="form-group">
                <label>Seleccione las prácticas que realiza en su finca:</label>
                <div class="form-checkbox" id="CheckboxPracticas"></div>
            </div>


            <div class="modal-footer center-content-between">
                <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosActividadesForm')">Regresar</button>
                <button type="button" id="guardarBtn" onclick="navigateToForm('#datosApoyoForm')" class="btn btn-actualizar">Siguiente</button>

            </div>
        </form>

        <!-- 16 -->

        <form action="" id="datosApoyoForm" class="form-section" style="display: none;">
            <h3>16. Apoyo para la producción agropecuaria</h3>

            <!-- Pregunta sobre la recepción de apoyo -->
            <div class="form-group">
                <label>¿Recibe apoyo para la producción agrícola?</label><br>
                <input type="radio" id="apoyoSi" name="recibeApoyo" value="SiApoyo" disabled>
                <label for="apoyoSi">SI</label>
                <input type="radio" id="apoyoNo" name="recibeApoyo" value="NoApoyo" disabled>
                <label for="apoyoNo">NO</label> (Finalice la entrevista)
            </div>

            <!-- Selección múltiple de quién provee el apoyo -->
            <div class="form-group seccionOculta">
                <label>¿De quién recibe apoyo para la producción agropecuaria? (selección múltiple)</label><br>
                <div class="form-checkbox" id="CheckboxTipoOrganizacion"></div>
            </div>

            <div class="form-group seccionOculta">
                <label>¿Qué tipo de apoyo recibe? (selección múltiple)</label>
                <div class="form-checkbox" id="CheckboxApoyo"></div>
            </div>

            <div class="form-group seccionOculta">
                <label>Está siendo usted atendido por la Unidad de Agricultura Familiar:</label><br>
                <input type="radio" id="atendidoSi" name="atendidoUnidadAgricultura" value="Si" disabled>
                <label for="atendidoSi">SI</label>
                <input type="radio" id="atendidoNo" name="atendidoUnidadAgricultura" value="No" disabled>
                <label for="atendidoNo">NO</label>
            </div>

            <div class="form-group seccionOculta">
                <label>¿Usted sabe si algunos de sus productos son vendidos para el Programa de Alimentación Escolar?</label><br>
                <input type="radio" id="productosVendidosSi" name="productosVendidosProgramaAlimentacion" value="Siyes" disabled>
                <label for="productosVendidosSi">SI</label>
                <input type="radio" id="productosVendidosNo" name="productosVendidosProgramaAlimentacion" value="Nonot" disabled>
                <label for="productosVendidosNo">NO</label>
            </div>




            <div class="modal-footer center-content-between">
                <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosPracticaForm')">Regresar</button>
                <button type="button" id="guardarBtn" class="btn btn-actualizar" onclick="CargarContenido('vistas/Mantenimiento_Ficha.php','content-wrapper')">Enviar</button>

            </div>
        </form>

    </div>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- Tu HTML existente -->
<script>
   

</script>

<script>
    $(document).ready(function() {
        $("#CheckboxOrganizacion").load("demo.txt", function(responseTxt, statusTxt, xhr) {
            let contenedor = document.getElementById('CheckboxOrganizacion')
            $.ajax({
                url: "modelos/cargarDatosCheckbox.php",
                type: "GET",
                data: {
                    checkbox: 'Organizacion'
                },
                success: function(data) {
                    const nombres = JSON.parse(data)

                    var label = document.createElement("label");
                    nombres.forEach(nombre => {

                        // Crear un nuevo elemento checkbox
                        var checkbox = document.createElement('input');

                        // Establecer el tipo de elemento como checkbox
                        checkbox.type = 'checkbox';
                        checkbox.id = nombre.id;
                        checkbox.name = 'organizacion[]';

                        // Establecer el valor del checkbox
                        checkbox.value = nombre.nombre;
                        checkbox.disabled = true;

                        var label = document.createElement('label');
                        label.htmlFor = 'miCheckbox';
                        label.appendChild(document.createTextNode(nombre.nombre));

                        var br = document.createElement("br");

                        contenedor.appendChild(checkbox);
                        contenedor.appendChild(label);
                        contenedor.appendChild(br);
                    })
                },
            });

        })
    })
</script>


<script src="assets/js/selectsUbicacionDinamicos.js"></script>
<script src="assets/js/cargarFichaSoloLectura.js"></script>

<script>
    function eliminarFila(boton) {
            var fila = boton.parentNode.parentNode;
            fila.parentNode.removeChild(fila);
        }


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
        var tipoAnimal = document.getElementById('tipoAnimal');
        var generoAnimal = document.getElementById('generoAnimal').value;
        var cantidadAnimal = document.getElementById('cantidadAnimal').value;

        if (generoAnimal == '') {
            generoAnimal = 'No aplica'
        }

        var tipoAnimalName = tipoAnimal.options[tipoAnimal.selectedIndex].text;

        // Crear una nueva fila
        var fila = "<tr><td>" + tipoAnimalName + "</td><td>" + generoAnimal + "</td><td>" + cantidadAnimal + "</td><td><button onclick='eliminarFila(this)' class='btn btn-danger eliminar-btn'><i class='fas fa-trash-alt'></i></button></td></tr>";

        // Agregar la fila a la tabla
        document.getElementById('tablaTemporalAnimales').innerHTML += fila;

        //Limpiar los campos después de agregar
        document.getElementById('tipoAnimal').value = '';
        document.getElementById('generoAnimal').value = '';
        document.getElementById('cantidadAnimal').value = '';

        
        function eliminarFila(fila) {
            fila.parentNode.removeChild(fila);
        }
    }
</script>

<script>
 function agregarTablaCultivo() {
    var cultivo = document.getElementById('nombreCultivo');
    var siembra = document.getElementById('tipoSiembra');
    var areaSembrada = document.getElementById('areaSembrada');
    var pObtenida = document.getElementById('produccionObtenida').value;
    var uProduccion = document.getElementById('unidadMedidaProduccion');
    var cantidadV = document.getElementById('cantidadVendida').value;
    var uVenta = document.getElementById('unidadMedidaVenta');
    var precioUnidad = document.getElementById('precioVenta').value;
    var Venta = document.getElementById('comprador').value;

    var cultivoName = cultivo.options[cultivo.selectedIndex].text;
    var siembraText = siembra.options[siembra.selectedIndex].text; // Cambié el nombre de la variable para evitar la colisión de nombres
    var areaSembradaText = areaSembrada.options[areaSembrada.selectedIndex].text; // Cambié el nombre de la variable para evitar la colisión de nombres
    var uProduccionText = uProduccion.options[uProduccion.selectedIndex].text; // Cambié el nombre de la variable para evitar la colisión de nombres
    var uVentaText = uVenta.options[uVenta.selectedIndex].text; // Cambié el nombre de la variable para evitar la colisión de nombres

    // Crear una nueva fila
    var fila = "<tr><td>" + cultivoName + "</td><td>" + siembraText + "</td><td>" + areaSembradaText + "</td><td>" + pObtenida + "</td><td>" + uProduccionText + "</td><td>" + cantidadV + "</td><td>" + uVentaText + "</td><td>" + precioUnidad + "</td><td>" + Venta + "</td><td><button onclick='eliminarFila(this)' class='btn btn-danger eliminar-btn'><i class='fas fa-trash-alt'></i></button></td></tr>";

    // Agregar la fila a la tabla
    document.getElementById('tablaTemporalCultivo').innerHTML += fila;

    //Limpiar los campos después de agregar
    cultivo.value = '';
    siembra.value = '';
    areaSembrada.value = '';
    document.getElementById('produccionObtenida').value = '';
    uProduccion.value = '';
    document.getElementById('cantidadVendida').value = '';
    uVenta.value = '';
    document.getElementById('precioVenta').value = '';
    document.getElementById('comprador').value = '';
}

</script>

<script>
    function agregarEdad() {
            var Edad = document.getElementById('edad').value;
            var generoEdad = document.getElementById('generoEdad').value;
            var cantidad = document.getElementById('cantidad').value;

            var fila = "<tr><td>" + Edad + "</td><td>" + generoEdad + "</td><td>" + cantidad + "</td><td><button onclick='eliminarFila(this)' class='btn btn-danger eliminar-btn'><i class='fas fa-trash-alt'></i></button></td></tr>";

            document.getElementById('tablaTemporal').innerHTML += fila;

            document.getElementById('edad').value = '';
            document.getElementById('generoEdad').value = '';
            document.getElementById('cantidad').value = '';
        }
</script>

<script>
    function mostrarOpcionesEdad(Edad) {
        var divGenero = document.getElementById("divGenero");
        var generoEdad = document.getElementById("generoEdad");

        // Mostrar el campo de género solo si se selecciona una edad
        if (Edad !== "") {
            divGenero.style.display = "block";
        } else {
            divGenero.style.display = "none";
            // Reiniciar el valor del campo de género cuando no se selecciona una edad
            generoEdad.value = "";
        }
    }
</script>

<script>
    function agregarAUnidadesVendidas() {
        var tipoAnimal = document.getElementById('tipoAnimalU');
        var precioVenta = document.getElementById('precioVentaU').value;
        var unidadMedida = document.getElementById('unidadMedida').value;
        var mercado = document.getElementById('mercado').value;

        var tipoAnimalName = tipoAnimal.options[tipoAnimal.selectedIndex].text;
        // Crear una nueva fila para la tabla de unidades vendidas
        var filaUnidadesVendidas = "<tr><td>" + tipoAnimalName + "</td><td>" + precioVenta + "</td><td>" + unidadMedida + "</td><td>" + mercado + "</td><td><button onclick='eliminarFila(this)' class='btn btn-danger eliminar-btn'><i class='fas fa-trash-alt'></i></button></td></tr>";

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
        var tipoProduccion = document.getElementById('tipoProduccion');
        var periodicidad = document.getElementById('periodoTiempo');
        var unidadMedida = document.getElementById('unidadMedidaPC');
        var cantidadVendida = document.getElementById('cantidadVendidaPC').value;
        var precioVenta = document.getElementById('precioVentaPC').value;
        var cliente = document.getElementById('cliente').value;

        console.log(periodicidad.value)

        var tipoProduccionName = tipoProduccion.options[tipoProduccion.selectedIndex].text;
        var periodicidadName = periodicidad.options[periodicidad.selectedIndex].text;
        var unidadMedidaName = unidadMedida.options[unidadMedida.selectedIndex].text;

        // Crear una nueva fila para la tabla
        var nuevaFila = `<tr>
                        <td>${tipoProduccionName}</td>
                        <td>${periodicidadName}</td>
                        <td>${unidadMedidaName}</td>
                        <td>${cantidadVendida}</td>
                        <td>${precioVenta}</td>
                        <td>${cliente}</td>
                        <td><button onclick='eliminarFila(this)' class='btn btn-danger eliminar-btn'><i class='fas fa-trash-alt'></i></button></td>
                     </tr>`;

        // Agregar la nueva fila a la tabla
        document.getElementById('tablaDatosPecuaria').innerHTML += nuevaFila;

        // Limpiar los campos después de agregar
        document.getElementById('tipoProduccion').value = '';
        document.getElementById('unidadMedidaVenta').value = '';
        document.getElementById('unidadMedidaPC').value = '';
        document.getElementById('cantidadVendidaPC').value = '';
        document.getElementById('precioVentaPC').value = '';
        document.getElementById('cliente').value = '';
    }
</script>

<script>
    function agregarIngreso() {
        var tipoIngreso = document.getElementById('tipoIngreso');
        var cantidadIngreso = document.getElementById('cantidadIngreso').value;

        var tipoIngresoName = tipoIngreso.options[tipoIngreso.selectedIndex].text;
        // Crear una nueva fila para la tabla
        var nuevaFila = `<tr>
                        <td>${tipoIngresoName}</td>
                        <td>${cantidadIngreso}</td>
                        <td><button onclick='eliminarFila(this)' class='btn btn-danger eliminar-btn'><i class='fas fa-trash-alt'></i></button></td>
                     </tr>`;

        // Agregar la nueva fila a la tabla
        document.getElementById('tablaIngresos').innerHTML += nuevaFila;

        // Limpiar los campos después de agregar
        document.getElementById('tipoIngreso').selectedIndex = 0;
        document.getElementById('cantidadIngreso').value = '';
    }
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

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
    $("#CheckboxMigracion").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let contenedor = document.getElementById('CheckboxMigracion')
        $.ajax({
            url: "modelos/cargarDatosCheckbox.php",
            type: "GET",
            data: {
                checkbox: 'Migracion'
            },
            success: function(data) {
                const motivos = JSON.parse(data)

                motivos.forEach(motivo => {
                    // Crear un nuevo elemento checkbox
                    var checkbox = document.createElement('input');

                    // Establecer el tipo de elemento como checkbox
                    checkbox.type = 'checkbox';
                    checkbox.id = 'miCheckbox';
                    checkbox.name = 'razon[]';
                    checkbox.disabled = true;

                    // Establecer el valor del checkbox
                    checkbox.value = motivo.motivo;

                    var label = document.createElement('label');
                    label.htmlFor = 'miCheckbox';
                    label.appendChild(document.createTextNode(motivo.motivo));
                    var br = document.createElement("br");

                    contenedor.appendChild(checkbox);
                    contenedor.appendChild(label);
                    contenedor.appendChild(br);
                })
            },
        });

    })


</script>

<script>
    $("#opcionesPrestamoSi").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let contenedor = document.getElementById('opcionesPrestamoSi')
        $.ajax({
            url: "modelos/cargarDatosCheckbox.php",
            type: "GET",
            data: {
                checkbox: 'OpcionesPrestamo'
            },
            success: function(data) {
                const nombres = JSON.parse(data)

                var label = document.createElement("label");

                label.innerText = "¿A quien acude?";
                label.setAttribute("for", "miCheckbox");
                contenedor.appendChild(label);

                var br = document.createElement("br");
                contenedor.appendChild(br);
                nombres.forEach(nombre => {

                    // Crear un nuevo elemento checkbox
                    var checkbox = document.createElement('input');

                    // Establecer el tipo de elemento como checkbox
                    checkbox.type = 'checkbox';
                    checkbox.id = 'miCheckbox';
                    checkbox.name = 'fuentePrestamo[]';

                    // Establecer el valor del checkbox
                    checkbox.value = nombre.nombre;
                    checkbox.disabled = true;

                    var label = document.createElement('label');
                    label.htmlFor = 'miCheckbox';
                    label.appendChild(document.createTextNode(nombre.nombre));

                    var br = document.createElement("br");

                    contenedor.appendChild(checkbox);
                    contenedor.appendChild(label);
                    contenedor.appendChild(br);
                })
            },
        });

    })


    $("#opcionesPrestamoNo").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let contenedor = document.getElementById('opcionesPrestamoNo')
        $.ajax({
            url: "modelos/cargarDatosCheckbox.php",
            type: "GET",
            data: {
                checkbox: 'MotivoNoPrestamo'
            },
            success: function(data) {
                const nombres = JSON.parse(data)

                var label = document.createElement("label");

                label.innerText = "¿Por qué no ha solicitado préstamos agropecuarios?";
                label.setAttribute("for", "otroCheckbox");
                contenedor.appendChild(label);

                var br = document.createElement("br");
                contenedor.appendChild(br);
                nombres.forEach(nombre => {
                    // Crear un nuevo elemento checkbox
                    var checkbox = document.createElement('input');

                    // Establecer el tipo de elemento como checkbox
                    checkbox.type = 'checkbox';
                    checkbox.id = 'otroCheckbox';
                    checkbox.name = 'motivoNoPrestamo[]';

                    // Establecer el valor del checkbox
                    checkbox.value = nombre.nombre;
                    checkbox.disabled = true;

                    var label = document.createElement('label');
                    label.htmlFor = 'otroCheckbox';
                    label.appendChild(document.createTextNode(nombre.nombre));

                    var br = document.createElement("br");

                    contenedor.appendChild(checkbox);
                    contenedor.appendChild(label);
                    contenedor.appendChild(br);
                })
            },
        });

    })


   
</script>


<script>
    $("#CheckboxDecisiones").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let contenedor = document.getElementById('CheckboxDecisiones')
        $.ajax({
            url: "modelos/cargarDatosCheckbox.php",
            type: "GET",
            data: {
                checkbox: 'TomadorDecisiones'
            },
            success: function(data) {
                const motivos = JSON.parse(data)

                motivos.forEach(motivo => {
                    // Crear un nuevo elemento checkbox
                    var checkbox = document.createElement('input');

                    // Establecer el tipo de elemento como checkbox
                    checkbox.type = 'checkbox';
                    checkbox.id = 'miCheckbox';
                    checkbox.name = 'tomador[]';

                    // Establecer el valor del checkbox
                    checkbox.value = motivo.nombre;
                    checkbox.disabled = true;

                    var label = document.createElement('label');
                    label.htmlFor = 'miCheckbox';
                    label.appendChild(document.createTextNode(motivo.nombre));
                    var br = document.createElement("br");

                    contenedor.appendChild(checkbox);
                    contenedor.appendChild(label);
                    contenedor.appendChild(br);
                })
            },
        });

    })

</script>

<script>
    $("#CheckboxPracticas").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let contenedor = document.getElementById('CheckboxPracticas')
        $.ajax({
            url: "modelos/cargarDatosCheckbox.php",
            type: "GET",
            data: {
                checkbox: 'Practicas'
            },
            success: function(data) {
                const motivos = JSON.parse(data)

                motivos.forEach(motivo => {
                    // Crear un nuevo elemento checkbox
                    var checkbox = document.createElement('input');

                    // Establecer el tipo de elemento como checkbox
                    checkbox.type = 'checkbox';
                    checkbox.id = 'miCheckbox';
                    checkbox.name = 'practicas[]';

                    // Establecer el valor del checkbox
                    checkbox.value = motivo.nombre;
                    checkbox.disabled = true;

                    var label = document.createElement('label');
                    label.htmlFor = 'miCheckbox';
                    label.appendChild(document.createTextNode(motivo.nombre));
                    var br = document.createElement("br");

                    contenedor.appendChild(checkbox);
                    contenedor.appendChild(label);
                    contenedor.appendChild(br);
                })
            },
        });

    })

</script>


<script>
    $("#CheckboxTipoOrganizacion").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let contenedor = document.getElementById('CheckboxTipoOrganizacion')
        $.ajax({
            url: "modelos/cargarDatosCheckbox.php",
            type: "GET",
            data: {
                checkbox: 'TipoOrganizacion'
            },
            success: function(data) {
                const motivos = JSON.parse(data)

                motivos.forEach(motivo => {
                    // Crear un nuevo elemento checkbox
                    var checkbox = document.createElement('input');

                    // Establecer el tipo de elemento como checkbox
                    checkbox.type = 'checkbox';
                    checkbox.id = 'miCheckbox';
                    checkbox.name = 'fuenteApoyo[]';

                    // Establecer el valor del checkbox
                    checkbox.value = motivo.nombre;
                    checkbox.disabled = true;

                    var label = document.createElement('label');
                    label.htmlFor = 'miCheckbox';
                    label.appendChild(document.createTextNode(motivo.nombre));
                    var br = document.createElement("br");

                    contenedor.appendChild(checkbox);
                    contenedor.appendChild(label);
                    contenedor.appendChild(br);
                })
            },
        });

    })

</script>



<script>
    $("#CheckboxApoyo").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let contenedor = document.getElementById('CheckboxApoyo')
        $.ajax({
            url: "modelos/cargarDatosCheckbox.php",
            type: "GET",
            data: {
                checkbox: 'Apoyo'
            },
            success: function(data) {
                const motivos = JSON.parse(data)

                motivos.forEach(motivo => {
                    // Crear un nuevo elemento checkbox
                    var checkbox = document.createElement('input');

                    // Establecer el tipo de elemento como checkbox
                    checkbox.type = 'checkbox';
                    checkbox.id = 'miCheckbox';
                    checkbox.name = 'apoyo[]';

                    // Establecer el valor del checkbox
                    checkbox.value = motivo.nombre;
                    checkbox.disabled = true;

                    var label = document.createElement('label');
                    label.htmlFor = 'miCheckbox';
                    label.appendChild(document.createTextNode(motivo.nombre));
                    var br = document.createElement("br");

                    contenedor.appendChild(checkbox);
                    contenedor.appendChild(label);
                    contenedor.appendChild(br);
                })

                var input = document.createElement('input');

                // Establecer el tipo de elemento como checkbox
                input.type = 'text';
                input.id = 'otroTipoApoyo';
                input.name = 'otroTipoApoyo';
                input.placeholder = 'Escriba aqui...'
                //input.addClassList('cuadro-texto');


                var label2 = document.createElement('label');
                label2.htmlFor = 'otroTipoApoyo';
                label2.appendChild(document.createTextNode('Otro (especifique)'));
                container.appendChild(label2);
                container.appendChild(input);
            },
        });

    })

</script>



<!-- ------------- MONEDAS ------------->
<script>
    function formatoMoneda(input) {

        let valor = input.value.replace(/[^0-9.]/g, "");

        valor = parseFloat(valor).toString();

        let [integerPart, decimalPart] = valor.split('.');
        if (decimalPart) {
            decimalPart = decimalPart.substr(0, 2);
            valor = integerPart + '.' + decimalPart;
        }

        valor = valor.replace(/\B(?=(\d{3})+(?!\d))/g, ",");

        input.value = valor;
    }
</script>