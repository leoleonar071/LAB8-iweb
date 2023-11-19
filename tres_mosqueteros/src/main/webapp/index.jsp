<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/jpg" href="favicon.png"/>

    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>

    <title>Login | Inicio de Sesión</title>
</head>
<body>
<section class="index">






    <div class="row">

        <div class="col-md-8" >
            <p style="margin-left:30px; font-weight: bold; margin-right: 30px">¡Bienvenido a Era de Civilizaciones!

                En un mundo donde la historia se teje a través de conflictos y civilizaciones, te damos la oportunidad de forjar tu propio destino. En este juego, tendrás el poder de crear y dirigir tu civilización hacia la grandeza, enfrentando desafíos, administrando recursos y liderando en tiempos de guerra.

                En tu viaje, explorarás cinco áreas principales: el menú de inicio, la gestión de personas, la gestión de recursos, la guerra y el tablero de líderes. Desde el primer paso, podrás sumergirte en la experiencia, establecer tu identidad, reclutar habitantes y administrarlos mientras luchas por el dominio en estas tierras.

                Adelante, crea tu civilización, forma alianzas, gestiona tus recursos y lleva a tu gente hacia un glorioso futuro. ¡Únete y sé parte de la historia en Era de Civilizaciones!</p>
        </div>


        <div class="col-md-4" >
            <div class="login-container">

                <div class="login-form">
                    <form method="POST" action="<%=request.getContextPath()%>/login?action=iniciar_sesion">
                        <h2>Iniciar Sesión</h2>
                        <% if (request.getAttribute("err") != null) {%>
                        <div class="alert alert-danger" role="alert"><%=request.getAttribute("err")%>
                        </div>
                        <% } %>
                        <div class="login-input">
                            <i class="fa-solid fa-envelope"></i>
                            <input type="text" id="user" name="user" required>
                            <label for="user">Email</label>
                        </div>

                        <div class="login-input">
                            <i class="fa-solid fa-lock"></i>
                            <input type="password" id="password" name="password" required>
                            <label for="password">Contraseña</label>
                        </div>

                        <a href="#"><input type="submit" value="Acceder" class="login-button"></a>

                    </form>

                    <div>
                        <div class="login-register">
                            <p>¿No tiene cuenta? <a href="<%=request.getContextPath()%>/menu?action=register"> Registrarse</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

















    <div class="container-fluid footer-container"><p>© LOS TRES MOSQUETEROS - Todos los derechos reservados</p></div>

</section>
</body>
</html>