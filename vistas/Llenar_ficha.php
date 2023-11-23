<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/estilos.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
</style>

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
        <div class="col-md-9">
            <!-- Datos de la ficha -->
            <form id="datosFichaForm" class="form-section">   
                <h3>Ficha</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="codigo">Código Ficha</label>
                        <input type="text" class="form-control" id="codigo" placeholder="Código Ficha">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="fechaFicha">Fecha de Solicitud</label>
                        <input type="date" class="form-control" id="fechaFicha" placeholder="Fecha ">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="anioSolicitud">Año de Solicitud</label>
                        <input type="number" class="form-control" id="anioSolicitud" placeholder="Año Actual">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="descripcion">Descripción</label>
                        <input type="text" class="form-control" id="descripcion" placeholder="Descripción">
                    </div>
                    </div>

                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="fechaEntrevista" class="form-label">Fecha de la Entrevista</label>
                        <input type="date" class="form-control" id="fechaEntrevista" name="fechaEntrevista" placeholder="Fecha Actual">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="encuestador" class="form-label">Nombre Encuestador</label>
                        <input type="text" class="form-control" id="encuestador" name="encuestador" placeholder="Nombre Encuestador">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="encuestado" class="form-label">Nombre Encuestado</label>
                        <input type="text" class="form-control" id="encuestado" name="encuestado" placeholder="Nombre Encuestado">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="nombreS" class="form-label">Nombre Supervisor</label>
                        <input type="text" class="form-control" id="nombreS" name="nombreS" placeholder="Nombre Supervisor">
                    </div>
                </div>
                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosTrabajadorForm')">Siguiente</button>
                </div>
            </form>

            <!-- Formulario de Datos Generales -->
            <form id="datosTrabajadorForm" class="form-section" style="display: none;">
                <!-- Datos del Trabajador -->
                <h3>Datos Generales</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="primerNombre">Primer Nombre</label>
                        <input type="text" class="form-control" id="primerNombre" placeholder="Primer Nombre">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="segundoNombre">Segundo Nombre</label>
                        <input type="text" class="form-control" id="segundoNombre" placeholder="Segundo Nombre">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="primerApellido">Primer Apellido</label>
                        <input type="text" class="form-control" id="primerApellido" placeholder="Primer Apellido">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="segundoApellido">Segundo Apellido</label>
                        <input type="text" class="form-control" id="segundoApellido" placeholder="Segundo Apellido">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="identidadProductor" class="form-label">Número de identidad</label>
                        <input type="text" class="form-control" id="identidadProductor" name="telefonoProductor" placeholder="Identidad">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="sexoProductor">Sexo</label>
                        <select id="sexoProductor" class="form-control">
                            <option value="" disabled selected>Seleccione...</option>
                            <option selected>Masculino</option>
                            <option>Femenino</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="fechaNacimiento">Fecha de nacimiento</label>
                        <input type="date" class="form-control" id="fechaNacimiento" placeholder="Fecha de Nacimiento">
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
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosFichaForm')">Regresar</button>
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosUbiForm')">Siguiente</button>
                </div>
            </form>

            <!-- Formulario de Ubicación Geográfica -->
            <form id="datosUbiForm" class="form-section" style="display: none;">
                <h3>Ubicación Geográfica</h3>
                <br>
                <div class="form-row">
                <div class="form-group col-md-3">
                        <label for="departamento">Departamento</label>
                        <select id="departamento" class="form-control">
                            <option value="" disabled selected>Seleccione...</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="municipio">Municipio</label>
                        <select id="municipio" class="form-control">
                            <option value="" disabled selected>Seleccione...</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="aldea">Aldea</label>
                        <select id="aldea" class="form-control">
                            <option value="" disabled selected>Seleccione...</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="caserio">Caserío</label>
                        <select id="caserio" class="form-control">
                            <option value="" disabled selected>Seleccione...</option>
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
                            <input type="radio" id="viveFincaSi" name="viveFinca" value="Si">
                            <label for="viveFincaSi">Si</label>
                            <input type="radio" id="viveFincaNo" name="viveFinca" value="No">
                            <label for="viveFincaNo">No</label>
                        </div>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="nombreFinca" class="form-label">Nombre de la finca</label>
                        <input class="form-control" type="text" id="nombreFinca" name="nombreFinca"placeholder="Nombre de la finca" >
                   </div>
                </div>

                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosTrabajadorForm')">Regresar</button>
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosPertenenciaForm')">Siguiente</button>
                </div>
            </form>


            <!-- Formulario de Pertenencia a Organizaciones -->
            <form id="datosPertenenciaForm" class="form-section" style="display: none;">
                <h3>Pertenencia a Organizaciones</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label>Pertenece a alguna organización</label>
                        <div>
                            <input type="radio" id="perteneceOSi" name="perteneceO" value="Si">
                            <label for="perteneceOSi"> Si </label>
                            <input type="radio" id="perteneceONo" name="perteneceO" value="No">
                            <label for="perteneceONo"> No </label>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-8">
                        <label for="PerteneceOr">A qué organizaciones pertenece</label>
                        <br>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" value="option1" id="inlineCheckbox1">
                            <label class="form-check-label" for="inlineCheckbox1">
                                Asociación
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" value="option2" id="inlineCheckbox2">
                            <label class="form-check-label" for="inlineCheckbox2">
                                Cooperativa
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" value="option3" id="inlineCheckbox3">
                            <label class="form-check-label" for="inlineCheckbox3">
                                Caja rural
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" value="option4" id="inlineCheckbox4">
                            <label class="form-check-label" for="inlineCheckbox4">
                                Patronato
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" value="option5" id="inlineCheckbox5">
                            <label class="form-check-label" for="inlineCheckbox5">
                                Junta de agua
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" value="option6" id="inlineCheckbox6">
                            <label class="form-check-label" for="inlineCheckbox6"> Otra </label>
                        </div>
                        <br>
                        <br>
                        <div class="mb-4">
                            <label for="otrasOrg" id="otrasOrgLabel">Indique el(los) nombre(s) de la(s) organización(es)</label>
                            <input type="text" class="cuadro-texto" id="otrasOrg" name="otrasOrg" placeholder="Escriba aquí...">
                        </div>
                    </div>
                </div>
                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosUbiForm')">Regresar</button>
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosHogarForm')">Siguiente</button>
                </div>
            </form>

            <!-- Formulario de Composición del hogar -->
            <form id="datosHogarForm" class="form-section" style="display: none;">
                <h3>Composición del Hogar</h3>
                <br>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad0-4">0 - 4 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres0-4" name="mujeres0-4">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres0-4" name="hombres0-4">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad10-14">10 - 14 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres10-14" name="mujeres10-14">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres10-14" name="hombres10-14">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad20-24">20 - 24 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres20-24" name="mujeres20-24">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres20-24" name="hombres20-24">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad30-34">30 - 34 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres30-34" name="mujeres30-34">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres30-34" name="hombres30-34">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad40-44">40 - 44 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres40-44" name="mujeres40-44">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres40-44" name="hombres40-44">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad50-54">50 - 54 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres50-54" name="mujeres50-54">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres50-54" name="hombres50-54">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad60-64">60 - 64 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres60-64" name="mujeres60-64">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres60-64" name="hombres60-64">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad70-74">70 - 74 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres70-74" name="mujeres70-74">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres70-74" name="hombres70-74">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad80-84">80 - 84 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres80-84" name="mujeres80-84">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres80-84" name="hombres80-84">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad10-14"> 90 - 94 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres90-94" name="mujeres90-94">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres90-94" name="hombres90-94">
                                </div>
                            </div>

                        </div>

                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad5-9">5 - 9 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres5-9" name="mujeres5-9">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres5-9" name="hombres5-9">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad15-19">15 - 19 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres15-19" name="mujeres15-19">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres15-19" name="hombres15-19">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad25-29">25 - 29 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres25-29" name="mujeres25-29">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres25-29" name="hombres25-29">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad35-39">35 - 39 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres35-39" name="mujeres35-39">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres35-39" name="hombres35-39">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad45-49">45 - 49 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres45-49" name="mujeres45-49">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres45-49" name="hombres45-49">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad55-59">55 - 59 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres55-59" name="mujeres55-59">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres55-59" name="hombres55-59">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad65-69">65 - 69 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres65-69" name="mujeres65-69">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres65-69" name="hombres65-69">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad75-79">75 - 79 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres75-79" name="mujeres75-79">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres75-79" name="hombres75-79">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad85-89">85 - 89 Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres85-89" name="mujeres85-89">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres85-89" name="hombres85-89">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <label for="edad95">95+ Años</label>
                                </div>
                                <div class="col-sm-6">
                                    <label>Total mujeres:</label>
                                    <input type="number" id="mujeres95" name="mujeres95">
                                </div>
                                <div class="col-sm-6">
                                    <label>Total Hombres:</label>
                                    <input type="number" id="hombres95" name="hombres95">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosPertenenciaForm')">Regresar</button>
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosEtniaForm')">Siguiente</button>
                </div>
            </form>

            <!-- Formulario de Etnicidad-->
            <form id="datosEtniaForm" class="form-section" style="display: none;">
                <h3>Etnicidad</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-8">
                        <label for="PerteneceEt"> A cuál de las siguientes etnias pertenece usted</label>
                        <p>
                        <div class="form-group">
                            <div>
                                <input type="checkbox" id="lencas" name="etnia" value="Lencas">
                                <label for="lencas">Lencas</label>
                            </div>

                            <div>
                                <input type="checkbox" id="pech" name="etnia" value="Pech">
                                <label for="pech">Pech</label>
                            </div>

                            <div>
                                <input type="checkbox" id="tolupanes" name="etnia" value="Tolupanes">
                                <label for="tolupanes">Tolupanes</label>
                            </div>

                            <div>
                                <input type="checkbox" id="garifunas" name="etnia" value="Garífunas">
                                <label for="garifunas">Garífunas</label>
                            </div>

                            <div>
                                <input type="checkbox" id="mayaChortis" name="etnia" value="Maya Chortís">
                                <label for="mayaChortis">Maya Chortís</label>
                            </div>

                            <div>
                                <input type="checkbox" id="tawahkas" name="etnia" value="Tawahkas">
                                <label for="tawahkas">Tawahkas</label>
                            </div>

                            <div>
                                <input type="checkbox" id="misquitos" name="etnia" value="Misquitos">
                                <label for="misquitos">Misquitos</label>
                            </div>

                            <div>
                                <input type="checkbox" id="nahua" name="etnia" value="Nahua">
                                <label for="nahua">Nahua</label>
                            </div>

                            <div>
                                <input type="checkbox" id="ladino" name="etnia" value="Ladino">
                                <label for="ladino">Ladino</label>
                            </div>

                            <div>
                                <input type="checkbox" id="negroHablaInglesa" name="etnia" value="Negro habla inglesa">
                                <label for="negroHablaInglesa">Negro habla inglesa</label>
                            </div>

                            <div>
                                <input type="checkbox" id="otros" name="etnia" value="Otros">
                                <label for="otros">Otros (Especifique)</label>
                                <input type="text" id="otrosEspecifique" class="cuadro-texto" name="otrosEspecifique" placeholder="Especifique aquí...">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosHogarForm')">Regresar</button>
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosRelevoForm')">Siguiente</button>
                </div>
            </form>

            <!-- Formulario de Relevo Generacional -->
            <form id="datosRelevoForm" class="form-section" style="display: none;">
                <h3>Relevo Generacional</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-8">
                        <label>¿De las actividades agropecuarias que desarrolla, usted cree que la seguirán practicando alguno o algunos de los miembros del hogar?</label>
                        <div>
                            <input type="radio" id="viveFincaSi" name="viveFinca" value="Si">
                            <label for="viveFincaSi">Si</label>
                            <label for="cuantos">Cuantos:</label>
                            <input type="number" name="cuantos" id="cuantos" min="0">
                            <br>
                            <input type="radio" id="viveFincaNo" name="viveFinca" value="No">
                            <label for="viveFincaNo">No</label>
                        </div>
                    </div>
                </div>

                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosEtniaForm')">Regresar</button>
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosMigraForm')">Siguiente</button>
                </div>
            </form>

            <!-- Formulario de Migración Familiar -->
            <form id="datosMigraForm" class="form-section" style="display: none;">
                <h3>Migración Familiar</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label>Alguien del hogar ha emigrado?</label>
                        <div>
                            <input type="radio" id="viveFincaSi" name="viveFinca" value="Si">
                            <label for="viveFincaSi">Si</label>
                            <input type="radio" id="viveFincaNo" name="viveFinca" value="No">
                            <label for="viveFincaNo">No</label>
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
                            <br>
                            <label for="otroPaisInput">Especifique el país:</label>
                            <input type="text" name="otroPaisInput" id="otroPaisInput" class="cuadro-texto" placeholder="Escriba aquí...">
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
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosEtniaForm')">Regresar</button>
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosUnidadForm')">Siguiente</button>
                </div>
            </form>

            <!-- Formulario de Información Básica de la Unidad Productiva -->
            <form id="datosUnidadForm" class="form-section" style="display: none;">
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
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosAgricolaForm')">Siguiente</button>
                </div>
            </form>

            <!-- Formulario de Produccion Agricola -->
            <form id="datosAgricolaForm" class="form-section" style="display: none;">
                <h3>Información de Cultivos</h3>
                <br>

                <div class="cultivo-info">
                    <h4>Cultivo</h4>

                    <div class="form-group">
                        <label for="nombreCultivo">Nombre del Cultivo</label>
                        <input type="text" class="form-control" id="nombreCultivo" name="nombreCultivo">
                    </div>

                    <div class="form-group">
                        <label>Siembra</label>
                        <div class="form-checkbox">
                            <input type="checkbox" id="primera" name="tipoSiembra" value="Primera">
                            <label for="primera">Primera</label>
                            <input type="checkbox" id="postrera" name="tipoSiembra" value="Postrera">
                            <label for="postrera">Postrera</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="areaSembrada">Área Sembrada (mz)(ha)(tareas)</label>
                        <input type="text" class="form-control" id="areaSembrada" name="areaSembrada">
                    </div>

                    <div class="form-group">
                        <label for="produccionObtenida">Producción Obtenida</label>
                        <input type="text" class="form-control" id="produccionObtenida" name="produccionObtenida">
                    </div>

                    <div class="form-group">
                        <label for="unidadMedidaProduccion">Unidad de Medida de Producción</label>
                        <input type="text" class="form-control" id="unidadMedidaProduccion" name="unidadMedidaProduccion">
                    </div>

                    <div class="form-group">
                        <label for="cantidadVendida">Cantidad Vendida</label>
                        <input type="text" class="form-control" id="cantidadVendida" name="cantidadVendida">
                    </div>

                    <div class="form-group">
                        <label for="unidadMedidaVenta">Unidad de Medida de Venta</label>
                        <input type="text" class="form-control" id="unidadMedidaVenta" name="unidadMedidaVenta">
                    </div>

                    <div class="form-group">
                        <label for="precioVenta">Precio de Venta por Unidad de Medida</label>
                        <input type="text" class="form-control" id="precioVenta" name="precioVenta">
                    </div>

                    <div class="form-group">
                        <label for="comprador">A quién vendió</label>
                        <input type="text" class="form-control" id="comprador" name="comprador">
                    </div>
                </div>

                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosUnidadForm')">Regresar</button>
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosPecuariaForm')">Siguiente</button>
                </div>
            </form>

             <!-- 10 -->

            <form id="datosPecuariaForm" class="form-section" style="display: none;">
                <h3>Producción Pecuaria (Inventario)</h3>
                <br>

                <!-- Bovinos -->
                <div class="row form-group">
                    <div class="col-md-4">
                        <label for="bovinosHembras">(1) Bovinos - Hembras</label>
                        <input type="number" class="form-control" id="bovinosHembras" name="bovinosHembras" placeholder="Cantidad">
                    </div>
                    <div class="col-md-4">
                        <label for="bovinosMachos">Bovinos - Machos</label>
                        <input type="number" class="form-control" id="bovinosMachos" name="bovinosMachos" placeholder="Cantidad">
                    </div>
                </div>

                <!-- Caprino -->
                <div class="row form-group">
                    <div class="col-md-4">
                        <label for="caprinoHembras">(2) Caprino - Hembras</label>
                        <input type="number" class="form-control" id="caprinoHembras" name="caprinoHembras" placeholder="Cantidad">
                    </div>
                    <div class="col-md-4">
                        <label for="caprinoMachos">Caprino - Machos</label>
                        <input type="number" class="form-control" id="caprinoMachos" name="caprinoMachos" placeholder="Cantidad">
                    </div>
                </div>

                <!-- Ovino -->
                <div class="row form-group">
                    <div class="col-md-4">
                        <label for="ovinoHembras">(3) Ovino - Hembras</label>
                        <input type="number" class="form-control" id="ovinoHembras" name="ovinoHembras" placeholder="Cantidad">
                    </div>
                    <div class="col-md-4">
                        <label for="ovinoMachos">Ovino - Machos</label>
                        <input type="number" class="form-control" id="ovinoMachos" name="ovinoMachos" placeholder="Cantidad">
                    </div>
                </div>

                <!-- Cerdo -->
                <div class="row form-group">
                    <div class="col-md-4">
                        <label for="cerdoHembras">(4) Cerdo - Hembras</label>
                        <input type="number" class="form-control" id="cerdoHembras" name="cerdoHembras" placeholder="Cantidad">
                    </div>
                    <div class="col-md-4">
                        <label for="cerdoMachos">Cerdo - Machos</label>
                        <input type="number" class="form-control" id="cerdoMachos" name="cerdoMachos" placeholder="Cantidad">
                    </div>
                </div>

                <!-- Pollos de engorde -->
                <div class="row form-group">
                    <div class="col-md-8">
                        <label for="pollosEngorde">(5) Pollos de Engorde</label>
                        <input type="number" class="form-control" id="pollosEngorde" name="pollosEngorde" placeholder="Cantidad">
                    </div>
                </div>

                <!-- Aves -->
                <div class="row form-group">
                    <div class="col-md-8">
                        <label for="aves">(6) Aves</label>
                        <input type="number" class="form-control" id="aves" name="aves" placeholder="Cantidad">
                    </div>
                </div>

                <!-- Peces -->
                <div class="row form-group">
                    <div class="col-md-8">
                        <label for="peces">(7) Peces</label>
                        <input type="number" class="form-control" id="peces" name="peces" placeholder="Cantidad">
                    </div>
                </div>

                <!-- Camarones -->
                <div class="row form-group">
                    <div class="col-md-8">
                        <label for="camarones">(8) Camarones</label>
                        <input type="number" class="form-control" id="camarones" name="camarones" placeholder="Cantidad">
                    </div>
                </div>

                <!-- Otros -->
                <div class="row form-group">
                    <div class="col-md-4">
                        <label for="otrosTipo">(9) Otros (Especifique) - Tipo de animal</label>
                        <input type="text" class="form-control" id="otrosTipo" name="otrosTipo" placeholder="Tipo de animal">
                    </div>
                    <div class="col-md-4">
                        <label for="otrosCantidad">Otros - Cantidad</label>
                        <input type="number" class="form-control" id="otrosCantidad" name="otrosCantidad" placeholder="Cantidad">
                    </div>
                </div>

                <h3>Unidades vendidas año anterior</h3>
                <!-- Bovinos -->
                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="bovinosUnidades">(1) Bovinos</label>
                        <input type="number" class="form-control" id="bovinosUnidades" name="bovinosUnidades">
                    </div>
                    <div class="col-md-3">
                        <label for="bovinosPrecio">Precio de venta (Lempiras)</label>
                        <input type="text" class="form-control" id="bovinosPrecio" name="bovinosPrecio">
                    </div>
                    <div class="col-md-3">
                        <label for="bovinosUnidadMedida">Unidad de medida</label>
                        <input type="text" class="form-control" id="bovinosUnidadMedida" name="bovinosUnidadMedida">
                    </div>
                    <div class="col-md-4">
                        <label for="bovinosMercado">Mercado</label>
                        <input type="text" class="form-control" id="bovinosMercado" name="bovinosMercado">
                    </div>
                </div>

                <!-- Caprino -->
                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="caprinoUnidades">(2) Caprino</label>
                        <input type="number" class="form-control" id="caprinoUnidades" name="caprinoUnidades">
                    </div>
                    <div class="col-md-3">
                        <label for="caprinoPrecio">Precio de venta (Lempiras)</label>
                        <input type="text" class="form-control" id="caprinoPrecio" name="caprinoPrecio">
                    </div>
                    <div class="col-md-3">
                        <label for="caprinoUnidadMedida">Unidad de medida</label>
                        <input type="text" class="form-control" id="caprinoUnidadMedida" name="caprinoUnidadMedida">
                    </div>
                    <div class="col-md-4">
                        <label for="caprinoMercado">Mercado</label>
                        <input type="text" class="form-control" id="caprinoMercado" name="caprinoMercado">
                    </div>
                </div>

                <!-- Ovino -->
                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="ovinoUnidades">(3) Ovino</label>
                        <input type="number" class="form-control" id="ovinoUnidades" name="ovinoUnidades">
                    </div>
                    <div class="col-md-3">
                        <label for="ovinoPrecio">Precio de venta (Lempiras)</label>
                        <input type="text" class="form-control" id="ovinoPrecio" name="ovinoPrecio">
                    </div>
                    <div class="col-md-3">
                        <label for="ovinoUnidadMedida">Unidad de medida</label>
                        <input type="text" class="form-control" id="ovinoUnidadMedida" name="ovinoUnidadMedida">
                    </div>
                    <div class="col-md-4">
                        <label for="ovinoMercado">Mercado</label>
                        <input type="text" class="form-control" id="ovinoMercado" name="ovinoMercado">
                    </div>
                </div>

                <!-- Cerdos -->
                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="cerdosUnidades">(4) Cerdos</label>
                        <input type="number" class="form-control" id="cerdosUnidades" name="cerdosUnidades">
                    </div>
                    <div class="col-md-3">
                        <label for="cerdosPrecio">Precio de venta (Lempiras)</label>
                        <input type="text" class="form-control" id="cerdosPrecio" name="cerdosPrecio">
                    </div>
                    <div class="col-md-3">
                        <label for="cerdosUnidadMedida">Unidad de medida</label>
                        <input type="text" class="form-control" id="cerdosUnidadMedida" name="cerdosUnidadMedida">
                    </div>
                    <div class="col-md-4">
                        <label for="cerdosMercado">Mercado</label>
                        <input type="text" class="form-control" id="cerdosMercado" name="cerdosMercado">
                    </div>
                </div>

                <!-- Pollos de engorde -->
                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="pollosEngordeUnidades">(5) Pollos de Engorde</label>
                        <input type="number" class="form-control" id="pollosEngordeUnidades" name="pollosEngordeUnidades">
                    </div>
                    <div class="col-md-3">
                        <label for="pollosEngordePrecio">Precio de venta (Lempiras)</label>
                        <input type="text" class="form-control" id="pollosEngordePrecio" name="pollosEngordePrecio">
                    </div>
                    <div class="col-md-3">
                        <label for="pollosEngordeUnidadMedida">Unidad de medida</label>
                        <input type="text" class="form-control" id="pollosEngordeUnidadMedida" name="pollosEngordeUnidadMedida">
                    </div>
                    <div class="col-md-4">
                        <label for="pollosEngordeMercado">Mercado</label>
                        <input type="text" class="form-control" id="pollosEngordeMercado" name="pollosEngordeMercado">
                    </div>
                </div>

                <!-- Aves -->
                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="avesUnidades">(6) Aves</label>
                        <input type="number" class="form-control" id="avesUnidades" name="avesUnidades">
                    </div>
                    <div class="col-md-3">
                        <label for="avesPrecio">Precio de venta (Lempiras)</label>
                        <input type="text" class="form-control" id="avesPrecio" name="avesPrecio">
                    </div>
                    <div class="col-md-3">
                        <label for="avesUnidadMedida">Unidad de medida</label>
                        <input type="text" class="form-control" id="avesUnidadMedida" name="avesUnidadMedida">
                    </div>
                    <div class="col-md-4">
                        <label for="avesMercado">Mercado</label>
                        <input type="text" class="form-control" id="avesMercado" name="avesMercado">
                    </div>
                </div>

                <!-- Peces -->
                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="pecesUnidades">(7) Peces</label>
                        <input type="number" class="form-control" id="pecesUnidades" name="pecesUnidades">
                    </div>
                    <div class="col-md-3">
                        <label for="pecesPrecio">Precio de venta (Lempiras)</label>
                        <input type="text" class="form-control" id="pecesPrecio" name="pecesPrecio">
                    </div>
                    <div class="col-md-3">
                        <label for="pecesUnidadMedida">Unidad de medida</label>
                        <input type="text" class="form-control" id="pecesUnidadMedida" name="pecesUnidadMedida">
                    </div>
                    <div class="col-md-4">
                        <label for="pecesMercado">Mercado</label>
                        <input type="text" class="form-control" id="pecesMercado" name="pecesMercado">
                    </div>
                </div>

                <!-- Camarones -->
                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="camaronesUnidades">(8) Camarones</label>
                        <input type="number" class="form-control" id="camaronesUnidades" name="camaronesUnidades">
                    </div>
                    <div class="col-md-3">
                        <label for="camaronesPrecio">Precio de venta (Lempiras)</label>
                        <input type="text" class="form-control" id="camaronesPrecio" name="camaronesPrecio">
                    </div>
                    <div class="col-md-3">
                        <label for="camaronesUnidadMedida">Unidad de medida</label>
                        <input type="text" class="form-control" id="camaronesUnidadMedida" name="camaronesUnidadMedida">
                    </div>
                    <div class="col-md-4">
                        <label for="camaronesMercado">Mercado</label>
                        <input type="text" class="form-control" id="camaronesMercado" name="camaronesMercado">
                    </div>
                </div>


                <!-- Otros -->
                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="otrosUnidades">(9) Otros</label>
                        <input type="number" class="form-control" id="otrosUnidades" name="otrosUnidades">
                    </div>
                    <div class="col-md-3">
                        <label for="otrosPrecio">Precio de venta (Lempiras)</label>
                        <input type="text" class="form-control" id="otrosPrecio" name="otrosPrecio">
                    </div>
                    <div class="col-md-3">
                        <label for="otrosUnidadMedida">Unidad de medida</label>
                        <input type="text" class="form-control" id="otrosUnidadMedida" name="otrosUnidadMedida">
                    </div>
                    <div class="col-md-4">
                        <label for="otrosMercado">Mercado</label>
                        <input type="text" class="form-control" id="otrosMercado" name="otrosMercado">
                    </div>
                </div>

                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosAgricolaForm')">Regresar</button>
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosPrCoForm')">Siguiente</button>
                </div>
            </form>

            <!-- 11 -->

            <form id="datosPrCoForm" class="form-section" style="display: none;">
                <h3>11. Producción y Comercialización Pecuaria</h3>

                <!-- Producción de leche -->
                <div class="form-group">
                    <label for="prodLeche">Producción de leche (semanal, mensual, anual)</label>
                    <input type="text" class="form-control" id="prodLeche" name="prodLeche">
                    <label for="unidadMedidaLeche">Unidad de medida</label>
                    <input type="text" class="form-control" id="unidadMedidaLeche" name="unidadMedidaLeche">
                    <label for="cantidadVendidaLeche">Cantidad vendida</label>
                    <input type="text" class="form-control" id="cantidadVendidaLeche" name="cantidadVendidaLeche">
                    <label for="precioVentaLeche">Precio de venta en lempiras</label>
                    <input type="text" class="form-control" id="precioVentaLeche" name="precioVentaLeche">
                    <label for="clienteLeche">A quién le vendió</label>
                    <input type="text" class="form-control" id="clienteLeche" name="clienteLeche">
                </div>

                <!-- Producción de carne -->
                <div class="form-group">
                    <label for="prodCarne">Producción de carne (semanal, mensual, anual)</label>
                    <input type="text" class="form-control" id="prodCarne" name="prodCarne">
                    <label for="unidadMedidaCarne">Unidad de medida</label>
                    <input type="text" class="form-control" id="unidadMedidaCarne" name="unidadMedidaCarne">
                    <label for="cantidadVendidaCarne">Cantidad vendida</label>
                    <input type="text" class="form-control" id="cantidadVendidaCarne" name="cantidadVendidaCarne">
                    <label for="precioVentaCarne">Precio de venta en lempiras</label>
                    <input type="text" class="form-control" id="precioVentaCarne" name="precioVentaCarne">
                    <label for="clienteCarne">A quién le vendió</label>
                    <input type="text" class="form-control" id="clienteCarne" name="clienteCarne">
                </div>

                <!-- Producción de derivados de leche -->
                <div class="form-group">
                    <label for="prodDerivadosLeche">Producción de derivados de leche (semanal, mensual, anual)</label>
                    <input type="text" class="form-control" id="prodDerivadosLeche" name="prodDerivadosLeche">
                    <label for="unidadMedidaDerivados">Unidad de medida</label>
                    <input type="text" class="form-control" id="unidadMedidaDerivados" name="unidadMedidaDerivados">
                    <label for="cantidadVendidaDerivados">Cantidad vendida</label>
                    <input type="text" class="form-control" id="cantidadVendidaDerivados" name="cantidadVendidaDerivados">
                    <label for="precioVentaDerivados">Precio de venta en lempiras</label>
                    <input type="text" class="form-control" id="precioVentaDerivados" name="precioVentaDerivados">
                    <label for="clienteDerivados">A quién le vendió</label>
                    <input type="text" class="form-control" id="clienteDerivados" name="clienteDerivados">
                </div>

                <!-- Producción de huevos -->
                <div class="form-group">
                    <label for="prodHuevos">Producción de huevos (semanal, mensual, anual)</label>
                    <input type="text" class="form-control" id="prodHuevos" name="prodHuevos">
                    <label for="precioVentaHuevos">Precio de venta en lempiras</label>
                    <input type="text" class="form-control" id="precioVentaHuevos" name="precioVentaHuevos">
                    <label for="clienteHuevos">A quién le vendió</label>
                    <input type="text" class="form-control" id="clienteHuevos" name="clienteHuevos">
                </div>

                <!-- Producción apícola -->
                <div class="form-group">
                    <label for="prodApicola">Producción apícola (semanal, mensual, anual)</label>
                    <input type="text" class="form-control" id="prodApicola" name="prodApicola">
                    <label for="unidadMedidaApicola">Unidad de medida</label>
                    <input type="text" class="form-control" id="unidadMedidaApicola" name="unidadMedidaApicola">
                    <label for="cantidadVendidaApicola">Cantidad vendida</label>
                    <input type="text" class="form-control" id="cantidadVendidaApicola" name="cantidadVendidaApicola">
                    <label for="precioVentaApicola">Precio de venta en lempiras</label>
                    <input type="text" class="form-control" id="precioVentaApicola" name="precioVentaApicola">
                    <label for="clienteApicola">A quién le vendió</label>
                    <input type="text" class="form-control" id="clienteApicola" name="clienteApicola">
                </div>

                <!-- Producto de Transformación -->
                <div class="form-group">
                    <label for="prodTransformacion">Producto de Transformación (semanal, mensual, anual)</label>
                    <input type="text" class="form-control" id="prodTransformacion" name="prodTransformacion">
                    <label for="cantidadProdTransformacion">Cuantos produce</label>
                    <input type="text" class="form-control" id="cantidadProdTransformacion" name="cantidadProdTransformacion">
                    <label for="unidadMedidaTransformacion">Unidad de medida</label>
                    <input type="text" class="form-control" id="unidadMedidaTransformacion" name="unidadMedidaTransformacion">
                    <label for="cantidadVendidaTransformacion">Cantidad vendida</label>
                    <input type="text" class="form-control" id="cantidadVendidaTransformacion" name="cantidadVendidaTransformacion">
                    <label for="precioVentaTransformacion">Precio de venta en lempiras</label>
                    <input type="text" class="form-control" id="precioVentaTransformacion" name="precioVentaTransformacion">
                    <label for="clienteTransformacion">A quién le vendió</label>
                    <input type="text" class="form-control" id="clienteTransformacion" name="clienteTransformacion">
                </div>

                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosPecuariaForm')">Regresar</button>
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosOtrosForm')">Siguiente</button>
                </div>
            </form>

            <!-- 12 -->

            <form id="datosOtrosForm" class="form-section" style="display: none;">
                <h3>12. Otros ingresos en el hogar</h3>

                <!-- Negocio -->
                <div class="form-group">
                    <label for="negocio">Negocio</label>
                    <input type="text" class="form-control" id="negocio" name="negocio">
                    <label for="ingresoNegocio">Total ingreso (L) (semanal/mensual/anual)</label>
                    <input type="text" class="form-control" id="ingresoNegocio" name="ingresoNegocio">
                </div>

                <!-- Venta de servicio -->
                <div class="form-group">
                    <label for="ventaServicio">Venta de servicio</label>
                    <input type="text" class="form-control" id="ventaServicio" name="ventaServicio">
                    <label for="ingresoVentaServicio">Total ingreso (L) (semanal/mensual/anual)</label>
                    <input type="text" class="form-control" id="ingresoVentaServicio" name="ingresoVentaServicio">
                </div>

                <!-- Jornal agrícola -->
                <div class="form-group">
                    <label for="jornalAgricola">Jornal agrícola</label>
                    <input type="text" class="form-control" id="jornalAgricola" name="jornalAgricola">
                    <label for="ingresoJornalAgricola">Total ingreso (L) (semanal/mensual/anual)</label>
                    <input type="text" class="form-control" id="ingresoJornalAgricola" name="ingresoJornalAgricola">
                </div>

                <!-- Corte de café -->
                <div class="form-group">
                    <label for="corteCafe">Corte de café</label>
                    <input type="text" class="form-control" id="corteCafe" name="corteCafe">
                    <label for="ingresoCorteCafe">Total ingreso (L) (semanal/mensual/anual)</label>
                    <input type="text" class="form-control" id="ingresoCorteCafe" name="ingresoCorteCafe">
                </div>

                <!-- Jornal no agrícola -->
                <div class="form-group">
                    <label for="jornalNoAgricola">Jornal no agrícola</label>
                    <input type="text" class="form-control" id="jornalNoAgricola" name="jornalNoAgricola">
                    <label for="ingresoJornalNoAgricola">Total ingreso (L) (semanal/mensual/anual)</label>
                    <input type="text" class="form-control" id="ingresoJornalNoAgricola" name="ingresoJornalNoAgricola">
                </div>

                <!-- Alquileres -->
                <div class="form-group">
                    <label for="alquileres">Alquileres</label>
                    <input type="text" class="form-control" id="alquileres" name="alquileres">
                    <label for="ingresoAlquileres">Total ingreso (L) (semanal/mensual/anual)</label>
                    <input type="text" class="form-control" id="ingresoAlquileres" name="ingresoAlquileres">
                </div>

                <!-- Remesa del exterior -->
                <div class="form-group">
                    <label for="remesaExterior">Remesa del exterior</label>
                    <input type="text" class="form-control" id="remesaExterior" name="remesaExterior">
                    <label for="ingresoRemesaExterior">Total ingreso (L) (semanal/mensual/anual)</label>
                    <input type="text" class="form-control" id="ingresoRemesaExterior" name="ingresoRemesaExterior">
                </div>

                <!-- Remesa nacional -->
                <div class="form-group">
                    <label for="remesaNacional">Remesa nacional</label>
                    <input type="text" class="form-control" id="remesaNacional" name="remesaNacional">
                    <label for="ingresoRemesaNacional">Total ingreso (L) (semanal/mensual/anual)</label>
                    <input type="text" class="form-control" id="ingresoRemesaNacional" name="ingresoRemesaNacional">
                </div>

                <!-- Bono (10 mil, 3ra edad, escolar) -->
                <div class="form-group">
                    <label for="bono">Bono (10 mil, 3ra edad, escolar)</label>
                    <input type="text" class="form-control" id="bono" name="bono">
                    <label for="ingresoBono">Total ingreso (L) (semanal/mensual/anual)</label>
                    <input type="text" class="form-control" id="ingresoBono" name="ingresoBono">
                </div>

                <!-- Salario profesional -->
                <div class="form-group">
                    <label for="salarioProfesional">Salario profesional</label>
                    <input type="text" class="form-control" id="salarioProfesional" name="salarioProfesional">
                    <label for="ingresoSalarioProfesional">Total ingreso (L) (semanal/mensual/anual)</label>
                    <input type="text" class="form-control" id="ingresoSalarioProfesional" name="ingresoSalarioProfesional">
                </div>

                <!-- Artesanía -->
                <div class="form-group">
                    <label for="artesania">Artesanía</label>
                    <input type="text" class="form-control" id="artesania" name="artesania">
                    <label for="ingresoArtesania">Total ingreso (L) (semanal/mensual/anual)</label>
                    <input type="text" class="form-control" id="ingresoArtesania" name="ingresoArtesania">
                </div>

                <!-- Otro (especifique) -->
                <div class="form-group">
                    <label for="otroIngreso">Otro (especifique)</label>
                    <input type="text" class="form-control" id="otroIngreso" name="otroIngreso">
                    <label for="ingresoOtro">Total ingreso (L) (semanal/mensual/anual)</label>
                    <input type="text" class="form-control" id="ingresoOtro" name="ingresoOtro">
                </div>

                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-secondary" onclick="navigateToForm('#datosOtrosForm')">Regresar</button>
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosCreditoForm')">Siguiente</button>
                </div>
            </form>

             <!-- 13 -->

             <form id="datosCreditoForm" class="form-section" style="display: none;"> 
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
                <div class="form-group" id="opcionesPrestamoSi">
                    <label>Si la respuesta es SI, ¿a quién acude?</label><br>
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
                <div class="form-group" id="opcionesPrestamoNo">
                    <label>Si la respuesta es NO, ¿Por qué no ha solicitado préstamos agropecuarios?</label><br>
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
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosActividadesForm')">Siguiente</button>
                </div>
            </form>

             <!-- 14 -->

            <form id="datosActividadesForm" class="form-section" style="display: none;">
                <h3>14. Actividades externas a la unidad productiva</h3>

                <!-- Actividades fuera de la finca -->
                <div class="form-group">
                    <label>¿Miembros de este hogar realizan actividades fuera de la finca?</label><br>
                    <input type="radio" id="actividadesFueraSi" name="actividadesFuera" value="Si">
                    <label for="actividadesFueraSi">SI</label>
                    <input type="radio" id="actividadesFueraNo" name="actividadesFuera" value="No">
                    <label for="actividadesFueraNo">NO</label>
                    <input type="text" class="form-control" id="cuantosActividadesFuera" name="cuantosActividadesFuera" placeholder="cuantos">
                    
                </div>

                <!-- Contratación de trabajadores no miembros -->
                <div class="form-group">
                    <label>En las actividades productivas de su finca, ¿contrata trabajadores(as) que no son miembros de su hogar?</label><br>
                    <label for="trabajadoresPermanentes">Permanentes</label>
                    <input type="text" class="form-control" id="trabajadoresPermanentes" name="trabajadoresPermanentes" placeholder="cuantos">
                    <label for="trabajadoresTemporales">Temporales</label>
                    <input type="text" class="form-control" id="trabajadoresTemporales" name="trabajadoresTemporales" placeholder="cuantos">
                </div>

                <!-- Tomador de decisiones -->
                <h4>14.1. ¿Quién es el tomador de decisiones con relación a las actividades agropecuarias de la finca?</h4>
                <div class="form-group">
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
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosPracticaForm')">Siguiente</button>
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

    //Se asegura de activar el nombre de la finca
</script>