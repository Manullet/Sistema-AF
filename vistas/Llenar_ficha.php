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
        color: #007bff;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        border: 2px solid #007bff;
        margin-right: 10px;
        position: relative;
    }

    .menu-number.one {
        background-color: #007bff;
        color: #fff;
    }
    
    .menu-number::after {
        content: '';
        position: absolute;
        width: 2px;
        height: 100%;
        left: 14px;
        top: 30px;
        background-color: #007bff;
    }

    .menu-item:last-child .menu-number::after {
        height: 50%;

    }

    .menu-text {
        color: #333;
    }

    .menu-item.active .menu-number {
        background-color: #007bff;
        color: #fff;
    }

    .menu-item:target .menu-number,
    .menu-item:target .menu-text {
        background-color: #007bff;
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
        color: #007bff;
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
                <a href="#datosEmpresaForm" class="menu-item">
                    <div class="menu-number">2</div>
                    <div class="menu-text">Datos de la Empresa</div>
                </a>
                <a href="#datosEmpresaForm" class="menu-item">
                    <div class="menu-number">3</div>
                    <div class="menu-text">Datos de la Empresa</div>
                </a>
                <a href="#datosEmpresaForm" class="menu-item">
                    <div class="menu-number">4</div>
                    <div class="menu-text">Datos de la Empresa</div>
                </a>
                <a href="#datosEmpresaForm" class="menu-item">
                    <div class="menu-number">5</div>
                    <div class="menu-text">Datos de la Empresa</div>
                </a>

            </div>
        </div>

        <!-- Formulario de Datos del Trabajador -->
        <div class="col-md-9">
            <form id="datosTrabajadorForm" class="form-section">
                <!-- Datos del Trabajador -->
                <h3>Datos del Trabajador</h3>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombreTrabajador">Nombre del Trabajador</label>
                        <input type="text" class="form-control" id="nombreTrabajador" placeholder="Nombre">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="apellidoTrabajador">Apellido del Trabajador</label>
                        <input type="text" class="form-control" id="apellidoTrabajador" placeholder="Apellido">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="sexoTrabajador">Sexo</label>
                        <select id="sexoTrabajador" class="form-control">
                            <option selected>Masculino</option>
                            <option>Femenino</option>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="edadTrabajador">Edad</label>
                        <input type="number" class="form-control" id="edadTrabajador">
                    </div>
                </div>
                <button type="button" class="btn btn-primary" onclick="navigateToForm('#datosEmpresaForm')">Siguiente</button>
            </form>

            <!-- Formulario de Datos de la Empresa -->
            <form id="datosEmpresaForm" class="form-section" style="display: none;">

                <h3>Datos de la Empresa</h3>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombreTrabajador">Nombre de la empresa</label>
                        <input type="text" class="form-control" id="nombreTrabajador" placeholder="Nombre">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="apellidoTrabajador">Apellido del Trabajador</label>
                        <input type="text" class="form-control" id="apellidoTrabajador" placeholder="Apellido">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="sexoTrabajador">Sexo</label>
                        <select id="sexoTrabajador" class="form-control">
                            <option selected>Masculino</option>
                            <option>Femenino</option>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="edadTrabajador">Edad</label>
                        <input type="number" class="form-control" id="edadTrabajador">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
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
            link.querySelector('.menu-number').style.color = '#007bff';
        });

        // Activa el elemento del menú correspondiente.
        const activeLink = document.querySelector(`a[href='${sectionId}']`);
        if (activeLink) {
            activeLink.classList.add('active');
            const activeMenuNumber = activeLink.querySelector('.menu-number');
            if (activeMenuNumber) {
                activeMenuNumber.style.backgroundColor = '#007bff';
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
            firstMenuItem.style.backgroundColor = '#007bff';
            firstMenuItem.style.color = '#fff';
        }
    });
</script>