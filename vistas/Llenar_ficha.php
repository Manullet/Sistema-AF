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
                <a href="#datosTrabajadorForm" class="menu-item">
                    <div class="menu-number one">1</div>
                    <div class="menu-text">Datos del Trabajador</div>
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

        <!-- Formulario de Datos del Trabajador -->
        <div class="col-md-9">
            <form id="datosTrabajadorForm" class="form-section">
                <!-- Datos del Trabajador -->
                <h3>Datos Generales</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="nombreProductor">Nombres del productor(a)</label>
                        <input type="text" class="form-control" id="nombreProductor" placeholder="Nombre">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="apellidoProductor">Apellidos del productor(a)</label>
                        <input type="text" class="form-control" id="apellidoProductor" placeholder="Apellido">
                    </div>
                    <div class="mb-4">
                        <label for="identidadProductor" class="form-label">Número de identidad</label>
                        <input type="tel" class="form-control" id="identidadProductor" name="telefonoProductor" placeholder="Identidad">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="sexoProductor">Sexo</label>
                        <select id="sexoProductor" class="form-control">
                            <option value="" disabled selected>Seleccione...</option>
                            <option selected>Masculino</option>
                            <option>Femenino</option>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="edadProductor">Edad</label>
                        <input type="number" class="form-control" id="edadProductor" placeholder="Edad">
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
                    <div class="mb-4">
                        <label for="telefonoProductor" class="form-label">Teléfono</label>
                        <input type="tel" class="form-control" id="telefonoProductor" name="telefonoProductor" placeholder="Teléfono">
                    </div>
                </div>

                <div class="form-row">
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
                </div>
                <div class="modal-footer center-content-between">
                    <button type="button" class="btn btn-info" onclick="navigateToForm('#datosUbiForm')">Siguiente</button>
                </div>
            </form>

            <!-- Formulario de Ubicación Geográfica -->
            <form id="datosUbiForm" class="form-section" style="display: none;">
                <h3>Ubicación Geográfica</h3>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="departamento">Departamento</label>
                        <input type="text" class="form-control" id="departamento" placeholder="Departamento">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="municipio">Municipio</label>
                        <input type="text" class="form-control" id="municipio" placeholder="Municipio">
                    </div>
                    <div class="mb-4">
                        <label for="aldea" class="form-label">Aldea</label>
                        <input type="text" class="form-control" id="aldea" name="aldea" placeholder="Aldea">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="caserio" class="form-label">Caserío</label>
                        <input type="text" class="form-control" id="caserio" name="caserio" placeholder="Caserío">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="longitudParcela" class="form-label">Longitud de la parcela:</label>
                        <input type="text" class="form-control" id="longitudParcela" name="longitudParcela">
                    </div>
                    <div class="mb-4">
                        <label for="latitudParcela" class="form-label">Latitud de la parcela:</label>
                        <input type="text" class="form-control" id="latitudParcela" name="latitudParcela">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="distanciaVivienda" class="form-label">Distancia entre parcela y vivienda (km/m):</label>
                        <input type="text" class="form-control" id="distanciaVivienda" name="distanciaVivienda" placeholder="(km/m)">
                    </div>
                    <div class="form-group col-md-3">
                        <label>Vive en la finca el productor(a):</label>
                        <div aling="center">
                            <input type="radio" id="viveFincaSi" name="viveFinca" value="Si">
                            <label for="viveFincaSi">Si</label>
                            <input type="radio" id="viveFincaNo" name="viveFinca" value="No">
                            <label for="viveFincaNo">No</label>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label for="msnm" class="form-label">MSNM:</label>
                        <input type="number" class="form-control" id="msnm" name="msnm" placeholder="Metros sobre el nivel del mar">
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
</script>