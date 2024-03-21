/*Cargar los municipios de cada departamento*/
document.getElementById('Id_Departamento').addEventListener("change", function() {
    let idDepartamento= document.getElementById('Id_Departamento').value
    let selectMunicipio = document.getElementById('Id_Municipio');

    // Eliminar opciones existentes del select de municipios
    while (selectMunicipio.firstChild) {
        selectMunicipio.removeChild(selectMunicipio.firstChild);
    }

    $.ajax({
        url: "modelos/cargarDatosSelect.php",
        type: "GET",
        data: {select:'Municipios', id: idDepartamento},
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
document.getElementById('Id_Municipio').addEventListener("change", function() {
    let idMunicipio= document.getElementById('Id_Municipio').value
    let selectAldea = document.getElementById('Id_Aldea');

    // Eliminar opciones existentes del select de municipios
    while (selectAldea.firstChild) {
        selectAldea.removeChild(selectAldea.firstChild);
    }

    $.ajax({
        url: "modelos/cargarDatosSelect.php",
        type: "GET",
        data: {select:'Aldeas', id: idMunicipio},
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
document.getElementById('Id_Municipio').addEventListener("change", function() {
    let idMunicipio= document.getElementById('Id_Municipio').value
    let selectCaserio = document.getElementById('Id_Cacerio');

    // Eliminar opciones existentes del select de municipios
    while (selectCaserio.firstChild) {
        selectCaserio.removeChild(selectCaserio.firstChild);
    }

    $.ajax({
        url: "modelos/cargarDatosSelect.php",
        type: "GET",
        data: {select:'Caserios', id: idMunicipio},
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


document.getElementById('tipoAnimal').addEventListener("change", function() {
  let select= document.getElementById('tipoAnimal').value
  let contenedorOculto = document.getElementById('divGenero');

  $.ajax({
      url: "modelos/cargarDatosSelect.php",
      type: "GET",
      data: {select:'GeneroAnimales', id: select},
      success: function(data) {
        console.log(data)
        if(data=='s'){
          contenedorOculto.style.display = "block"
        }else{
          contenedorOculto.style.display = "none"
        }
      },
    });
});