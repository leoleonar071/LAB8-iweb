<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">

    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/jpg" href="favicon.png"/>
    <link rel="stylesheet" href="sweetalert2.min.css">
    <script src="js/showError.js"></script>
    <title>Semana de Ingeniería 2023</title>
</head>


<body>

<section class="index">

    <div class="register-container">

        <div class="register-form">

            <form action="<%=request.getContextPath()%>/login?action=registrarse" method="POST" id="form" >
                <h2>Registrarse</h2>
                <div class="register-input">
                    <input type="text" id="jugadorNombre" name="jugadorNombre" required>
                    <label for="jugadorNombre">Nombres</label>
                </div>
                <div class="register-input">
                    <input type="text" id="jugadorEdad" name="jugadorEdad" required>
                    <label for="jugadorEdad">Edad</label>
                </div>
                <div class="register-input">
                    <input type="email" id="jugadorCorreo" name="jugadorCorreo" required>
                    <label for="jugadorCorreo">correo</label>
                </div>
                <div class="register-input">
                    <input type="text" id="jugadorUsuario" name="jugadorUsuario" required>
                    <label for="jugadorUsuario">Usuario</label>
                </div>
                <div class="register-input">
                    <input type="password" id="jugadorPassword" name="jugadorPassword" required>
                    <label for="jugadorPassword">Contraseña</label>
                </div>

                <div class="register-input">
                    <input type="password" id="passwordconf" name="passwordconf" required>
                    <label for="passwordconf">Confirmar contraseña</label>
                </div>

                <input type="submit" value="Registrarse" class="register-button">

                <div class="register-back">
                    <label><a href="<%=request.getContextPath()%>/login">Regresar</a></label>

                </div>

            </form>

        </div>
    </div>

    <div class="container-fluid footer-container"><p>© LOS TRES MOSQUETEROS - Todos los derechos reservados</p></div>

</section>


<script>
    const nombre = document.getElementById("jugadorNombre")
    const usuario = document.getElementById("jugadorUsuario")
    const contra = document.getElementById("jugadorPassword")
    const edad = document.getElementById("jugadorEdad")
    const contraConf = document.getElementById("passwordconf")
    const form = document.getElementById("form")

    form.addEventListener("submit", e=>{

        const password = contra.value;
        const uppercaseRegex = /[A-Z]/;
        const numberRegex = /[0-9]/;
        const specialCharRegex = /[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]/;

        if (!isNaN(nombre.value.charAt(0))){
            showError('EL nombre no puede iniciar con un número')
            e.preventDefault()
        }else if(nombre.value.length>20){
            showError('EL nombre ingresado es muy largo')
            e.preventDefault()
        }
        else if(!isNaN(usuario.value.charAt(0))){
            showError('EL nombre de usuario no puede iniciar con un número')
            e.preventDefault()
        }
        else if(isNaN(edad.value)){
            showError('La edad debe ser un número')
            e.preventDefault()
        }
        else if(edad.value<13){
            event.preventDefault();

            Swal.fire({
                iconColor: '#DC3545',
                title: "INCUMPLIMIENTO MÍNIMO DE EDAD",
                color: "#000000",
                icon: "warning",
                confirmButtonColor: '#DC3545',
                confirmButtonText: "Regresar"
            }).then((result) => {
                // Redirige al servlet después de cerrar la alerta
                if (result.isConfirmed){
                    document.getElementById('form').submit(); // Envía el formulario
                }

            });
        }else if (!uppercaseRegex.test(password) || !numberRegex.test(password) || !specialCharRegex.test(password)) {
            showError('La contraseña debe contener al menos una mayúscula, un número y uno de los siguientes caracteres especiales: "! @ # $ % ^ & * ( ) _ + - = [ ] { } ; \' " \\ | , . < > / ?"  ');
            e.preventDefault();
        }
        else if (contraConf.value != contra.value) {
            showError('Error al confirmar la contraseña. Las contraseñas deben coincidir');
            e.preventDefault();
        }
        else{

        }
    })
</script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>

</body>
</html>