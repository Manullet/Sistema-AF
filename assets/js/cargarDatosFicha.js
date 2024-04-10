$(document).ready(function() { 
    $("#datosFichaForm").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let id= document.getElementById('codigo').value;
        $.ajax({
            url: "modelos/cargarDatosFicha.php",
            type: "GET",
            data: {
                contenedor: 'Ficha', id:id
            },
            success: function(data) {
                const datos = JSON.parse(data)

                document.getElementById('fecha_solicitud').value= datos.fecha_solicitud
                document.getElementById('fecha_entrevista').value= datos.fecha_entrevista
                document.getElementById('nombre_encuestador').value= datos.nombre_encuentrador
                document.getElementById('nombre_encuestado').value= datos.nombre_encuestador
                document.getElementById('nombre_supervisor').value= datos.nombre_supervisor
                document.getElementById('descripcion').value= datos.descripcion
            },
        });

    })


    $("#datosTrabajadorForm").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let id= document.getElementById('codigo').value;
        $.ajax({
            url: "modelos/cargarDatosFicha.php",
            type: "GET",
            data: {
                contenedor: 'Productor', id:id
            },
            success: function(data) {
                const datos = JSON.parse(data)

                document.getElementById('primerNombre').value= datos.primer_nombre
                document.getElementById('segundoNombre').value= datos.segundo_nombre
                document.getElementById('primerApellido').value= datos.primer_apellido
                document.getElementById('segundoApellido').value= datos.segundo_apellido
                document.getElementById('identidadProductor').value= datos.identificacion
                document.getElementById('fechaNacimiento').value= datos.fecha_nacimiento
                document.getElementById('escolaridadProductor').value= datos.nivel_escolaridad
                document.getElementById('sexoProductor').value= datos.genero
                document.getElementById('estadoCivilProductor').value= datos.estado_civil
                document.getElementById('ultimoGradoEscolar').value= datos.ultimo_grado_escolar_aprobado
                document.getElementById('telefonoPrincipal').value= datos.telefono_1
                document.getElementById('telefonoSecundario').value= datos.telefono_2
                document.getElementById('telefonoOpcional').value= datos.telefono_3
                document.getElementById('correoPrincipal').value= datos.email_1
                document.getElementById('correoSecundario').value= datos.email_2
                document.getElementById('correoOpcional').value= datos.email_3

            },
        });
    });


    /*Cargar los municipios de cada departamento*/
    $("#datosUbiForm").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let idDepartamento= document.getElementById('Id_Departamento').value
        let selectMunicipio = document.getElementById('Id_Municipio');

        // Eliminar opciones existentes del select de municipios
        while (selectMunicipio.firstChild) {
            selectMunicipio.removeChild(selectMunicipio.firstChild);
        }

        $.ajax({
            url: "modelos/cargarDatosSelect.php",
            type: "GET",
            data: {select:'MunicipiosSinFiltro'},
            success: function(data) {
            const municipios=JSON.parse(data)

            const opcionPrimera = document.createElement("option");
            opcionPrimera.value = "";
            opcionPrimera.textContent='Seleccione un municipio';
            selectMunicipio.appendChild(opcionPrimera)

            municipios.forEach(municipio => {
                //Creación de la fila
                const opcion = document.createElement("option");
                opcion.value = municipio.id;
                opcion.textContent=municipio.nombre;
                
                selectMunicipio.appendChild(opcion)
                }) 
            },
        });
    });


    /*Cargar las aldeas de cada municipio*/
    $("#datosUbiForm").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let idMunicipio= document.getElementById('Id_Municipio').value
        let selectAldea = document.getElementById('Id_Aldea');

        // Eliminar opciones existentes del select de municipios
        while (selectAldea.firstChild) {
            selectAldea.removeChild(selectAldea.firstChild);
        }

        $.ajax({
            url: "modelos/cargarDatosSelect.php",
            type: "GET",
            data: {select:'AldeasSinFiltro'},
            success: function(data) {
            const aldeas=JSON.parse(data)
        
            aldeas.forEach(aldea => {
                //Creación de la fila
                const opcion = document.createElement("option");
                opcion.value = aldea.id;
                opcion.textContent=aldea.nombre;
                
                selectAldea.appendChild(opcion)
                }) 
            },
        });
    });


    /*Cargar los caserios de cada municipio*/
    $("#datosUbiForm").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let idMunicipio= document.getElementById('Id_Municipio').value
        let selectCaserio = document.getElementById('Id_Cacerio');

        // Eliminar opciones existentes del select de municipios
        while (selectCaserio.firstChild) {
            selectCaserio.removeChild(selectCaserio.firstChild);
        }

        $.ajax({
            url: "modelos/cargarDatosSelect.php",
            type: "GET",
            data: {select:'CaseriosSinFiltro'},
            success: function(data) {
            const caserios=JSON.parse(data)
        
            caserios.forEach(caserio => {
                //Creación de la fila
                const opcion = document.createElement("option");
                opcion.value = caserio.id;
                opcion.textContent=caserio.nombre;
                
                selectCaserio.appendChild(opcion)
                }) 
            },
        });
    });


    $("#datosUbiForm").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let id= document.getElementById('codigo').value;
        $.ajax({
            url: "modelos/cargarDatosFicha.php",
            type: "GET",
            data: {
                contenedor: 'Ubicacion', id:id
            },
            success: function(data) {
                const datos = JSON.parse(data)
                document.getElementById('Id_Departamento').value= datos.id_departamento
                document.getElementById('Id_Municipio').value= datos.id_municipio
                document.getElementById('Id_Aldea').value= datos.id_aldea
                document.getElementById('Id_Cacerio').value= datos.id_cacerio
                document.getElementById('nombreFinca').value= datos.nombre_finca
                document.getElementById('ubicacion').value= datos.ubicacion_geografica
                document.getElementById('distanciaVivienda').value= datos.distancia_parcela_vivienda
                document.getElementById('latitudParcela').value= datos.latitud_parcela
                document.getElementById('longitudParcela').value= datos.longitud_parcela
                document.getElementById('msnm').value= datos.msnm
                document.getElementById('direccionPrincipal').value= datos.direccion_1
                document.getElementById('direccionSecundario').value= datos.direccion_2
                document.getElementById('direccionOpcional').value= datos.direccion_3

                if(datos.vive_en_finca=='S'){
                    document.getElementById('viveFincaSi').checked = true;
                }else{
                    document.getElementById('viveFincaNo').checked = true;
                }
                

            },
        });
    });


    $("#datosPertenenciaForm").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let id= document.getElementById('codigo').value;
        $.ajax({
            url: "modelos/cargarDatosFicha.php",
            type: "GET",
            data: {
                contenedor: 'Organizacion', id:id
            },
            success: function(data) {
                const datos = JSON.parse(data)

                if(datos.pertenece_a_organizacion=='S'){
                    document.getElementById('si').checked = true;
                    mostrarOrganizaciones();
                }else{
                    document.getElementById('no').checked = true;
                }
                

            },
        });
    });


    $("#datosEtniaForm").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let id= document.getElementById('codigo').value;
        $.ajax({
            url: "modelos/cargarDatosFicha.php",
            type: "GET",
            data: {
                contenedor: 'Etnia', id:id
            },
            success: function(data) {
                const datos = JSON.parse(data)
                console.log(datos.id_etnia)

                switch (parseInt(datos.id_etnia)) {
                    case 1:
                        document.getElementById('id_etnia').checked = true;
                        break;
                    case 2:
                        document.getElementById('pech').checked = true;
                        break;
                    case 3:
                        document.getElementById('tolupanes').checked = true;
                        break;
                    case 4:
                        document.getElementById('garifunas').checked = true;
                        break;
                    case 5:
                        document.getElementById('mayaChortis').checked = true;
                        break;
                    case 6:
                        document.getElementById('tawahkas').checked = true;
                        break;
                    case 7:
                        document.getElementById('misquitos').checked = true;
                        break;
                    case 8:
                        document.getElementById('nahua').checked = true;
                        break;
                    case 9:
                        document.getElementById('ladino').checked = true;
                        break;
                    case 10:
                        document.getElementById('negroHablaInglesa').checked = true;
                        break;
                    case 11:
                        document.getElementById('otros').checked = true;
                        break;
                    default:
                        console.log("Número inválido de día");
                }

            },
        });
    });


    $("#datosRelevoForm").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let id= document.getElementById('codigo').value;

        $.ajax({
            url: "modelos/cargarDatosFicha.php",
            type: "GET",
            data: {
                contenedor: 'Relevo', id:id
            },
            success: function(data) {
                console.log(data)
                const datos = JSON.parse(data)

                if(datos.relevo=='S'){
                    document.getElementById('Si').checked = true;
                    document.getElementById('cuantos').value = datos.cantidad;
                    mostrarCuadro();
                }else{
                    document.getElementById('No').checked = true;
                }
                
            },
        });
    });


    $("#datosMigraForm").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let id= document.getElementById('codigo').value;

        $.ajax({
            url: "modelos/cargarDatosFicha.php",
            type: "GET",
            data: {
                contenedor: 'Migracion', id:id
            },
            success: function(data) {
                const datos = JSON.parse(data)

                if(datos.tiene_migrantes=='S'){
                    document.getElementById('MigraSi').checked = true;
                }else{
                    document.getElementById('MigraNo').checked = true;
                }


                if(datos.migracion_dentro_pais=='S'){
                    document.getElementById('dentroDelPais').checked = true;
                }else{
                    document.getElementById('otroPais').checked = true;
                }


                if(datos.remesas=='S'){
                    document.getElementById('siRemesas').checked = true;
                }else{
                    document.getElementById('noRemesas').checked = true;
                }

            },
        });
    });


    $("#datosUnidadForm").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let id= document.getElementById('codigo').value;
        $.ajax({
            url: "modelos/cargarDatosFicha.php",
            type: "GET",
            data: {
                contenedor: 'UnidadProductiva', id:id
            },
            success: function(data) {
                const datos = JSON.parse(data)

                switch (datos.Tipo_De_Manejo) {
                    case 'Propia':
                        document.getElementById('propia').checked = true;
                        break;
                    case 'Alquilada':
                        document.getElementById('alquilada').checked = true;
                        break;
                    case 'Prestada':
                        document.getElementById('prestada').checked = true;
                        break;
                    case 'Ejidal':
                        document.getElementById('ejidal').checked = true;
                        break;
                    default:
                        console.log("Número inválido de día");
                }

                document.getElementById('Id_Superficie_Produccion').value= datos.Id_Medida_Produccion
                document.getElementById('Id_Superficie_Agricultura').value= datos.Id_Medida_Agricultura
                document.getElementById('areaAgricultura').value= datos.Superficie_Agricultura
                document.getElementById('Id_Superficie_Ganaderia').value= datos.Id_Medida_Ganaderia
                document.getElementById('areaGanaderia').value= datos.Superficie_Ganaderia
                document.getElementById('Id_Superficie_Apicultura').value= datos.Id_Medida_Apicultura
                document.getElementById('areaApicultura').value= datos.Superficie_Apicultura
                document.getElementById('Id_Superficie_Forestal').value= datos.Id_Medida_Forestal
                document.getElementById('areaForestal').value= datos.Superficie_Forestal
                
                document.getElementById('areaAcuacultura').value= datos.Superficie_Acuacultura
                document.getElementById('numEstanques').value= datos.Numero_Estanques
                
                document.getElementById('areaAgroturismo').value= datos.Superficie_Agroturismo
                document.getElementById('otrosUsos').value= datos.Otros_Descripcion

            },
        });
    });

    $("#datosUnidadForm").load("demo.txt", function(responseTxt, statusTxt, xhr) {
        let id= document.getElementById('codigo').value;
        $.ajax({
            url: "modelos/cargarDatosFicha.php",
            type: "GET",
            data: {
                contenedor: 'Riego', id:id
            },
            success: function(data) {
                const datos = JSON.parse(data)

                if(datos.Tiene_Riego=='S'){
                    document.getElementById('SistemaSi').checked = true;
                }else{
                    document.getElementById('SistemaNo').checked = true;
                }

                document.getElementById('Medida_Riego').value= datos.Id_Medida_Superficie_Riego
                document.getElementById('areaRiego').value= datos.Superficie_Riego
                document.getElementById('tipoRiego').value= datos.Id_Tipo_Riego
                document.getElementById('fuenteAgua').value= datos.Fuente_Agua
                document.getElementById('disponibilidadAgua').value= datos.Disponibilidad_Agua_Meses

            },
        });
    });


    function mostrarCuadro() {
        var radioSi = document.getElementById("Si");
        var cuantosDiv = document.getElementById("cuantosHay");

        if (radioSi.checked) {
            cuantosDiv.classList.remove("hidden");
        } else {
            cuantosDiv.classList.add("hidden");
        }
    }

})