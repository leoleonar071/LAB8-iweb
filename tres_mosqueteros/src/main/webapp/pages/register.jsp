<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">

    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/jpg" href="favicon.png"/>
    <script> src="js/.showError.js"</script>
    <title>Semana de Ingeniería 2023</title>
</head>


<body>

<section class="index">

    <div class="register-container">

        <div class="register-form">

            <form action="<%=request.getContextPath()%>/login?action=registrarse" method="POST" id="form" >
                <h2>Registrarse</h2>
                <% if (request.getAttribute("error_edad") != null) {%>
                <div class="alert alert-danger" role="alert"><%=request.getAttribute("error_edad")%>
                </div>
                <% } %>
                <% if (request.getAttribute("error_usuario") != null) {%>
                <div class="alert alert-danger" role="alert"><%=request.getAttribute("error_usuario")%>
                </div>
                <% } %>
                <div class="register-input">
                    <input type="text" id="jugadorNombre" name="jugadorNombre" required>
                    <label for="jugadorNombre">Nombres</label>
                </div>
                <div class="register-input">
                    <input type="text" id="jugadorEdad" name="jugadorEdad" required>
                    <label for="jugadorEdad">Edad</label>
                </div>
                <div class="register-input">
                    <input type="text" id="jugadorCorreo" name="jugadorCorreo" required>
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
    function validateForm() {
        var password = document.getElementById("jugadorPassword").value;
        var passwordconf = document.getElementById("passwordconf").value;
        var tieneMayuscula = /[A-Z]/.test("jugadorPassword");
        var tieneNumero = /[0-9]/.test("jugadorPassword");
        var tieneCaracterEspecial = /[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]/.test("jugadorPassword");

        // Validar coincidencia de contraseñas
        if (password !== passwordconf) {
            alert("Las contraseñas no coinciden. Por favor, inténtalo de nuevo.");
            return false;
        }
        if (tieneMayuscula && tieneNumero && tieneCaracterEspecial) {
            return true;
        }else {
            alert("La contraseña debe tener por lo menos una mayúscula, un número y un carácter especial");
            return false;
        }
        return true;
    }
</script>


<script>
    const nombre = document.getElementById("jugadorNombre")
    const form = document.getElementById("form")

    form.addEventListener("submit", e=>{

        if (!isNaN(nombre.value.charAt(0))){
            showError('EL nombre no puede iniciar con un numero')
            e.preventDefault() // Evita el envío del formulario si la validación falla
        }else if (nombre.value.length<4){
            showError("El titulo de la actividad es muy corto")
            e.preventDefault()
        }else if (nombre.value.length>8){
            showError("El titulo de la actividad es muy largo")
            e.preventDefault()
        }
        else{
            //Envia el form al servlet
        }
    })
</script>

</body>
</html>