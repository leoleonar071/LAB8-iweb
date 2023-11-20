<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.tres_mosqueteros.Models.Beans.Jugador" %>
<%@ page import="com.example.tres_mosqueteros.Models.Beans.Persona" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="jugadorLogueado" scope="session" type="com.example.tres_mosqueteros.Models.Beans.Jugador" class="com.example.tres_mosqueteros.Models.Beans.Jugador"/>
<% ArrayList<Persona> listaPersonas = (ArrayList<Persona>) request.getAttribute("listaPersonas"); %>


<!doctype html>
<html lang="es">

<head>

    <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

    <link rel="icon" type="image/jpg" href="favicon.png" />

    <title>Administración de Personas</title>
</head>

<body>
<header>
    <div class="logo" style="margin-left: 30px; margin-top: 30px">
        <a href="#">
            <img class="logo-img" src='images/logo0.png' alt="logo" style="width: 150px; height: auto;">
        </a>
    </div>

    <div class="bars">
        <div class="line"></div>
        <div class="line"></div>
        <div class="line"></div>
    </div>

    <nav class="nav-bar">
        <ul>
            <li>
                <a href="#" style="color: #000000; font-weight: bold;" class="active">Gestión de Personas</a>
            </li>

            <li>
                <a href="#" style="color:#000000; font-weight: bold;">Gestión de Recursos</a>
            </li>
            <li>
                <a href="#" style="color:#000000; font-weight: bold;">Guerra</a>
            </li>
            <li>
                <a href="#" style="color:#000000; font-weight: bold;">Leaderboard</a>
            </li>

            <li>
                <% if(jugadorLogueado.getIdJugador() !=0){ %>
                <a href="<%=request.getContextPath()%>" style="color:#000000; font-weight: bold;">Cerrar Sesión</a>
                <%}%>
            </li>
        </ul>
    </nav>
</header>


<div class="container-fluid" style="padding-left:0 !important; padding-right: 0 !important; background: rgb(255, 255, 0) !important;
    background: radial-gradient(circle, rgba(255, 255, 0, 1) 0%, rgba(255, 102, 0, 1) 100%) !important;">
<div class="text-secondary px-1 py-10 text-center">
        <div style="padding-bottom: 5px; padding-top: 0px">
            <h1 class="display-5 fw-bold text-black" style="color: #292826">Bienvenido Jugador: <%=jugadorLogueado.getNombre()%></h1>
            <div style="margin-bottom: 5px"></div>
            <h3 class="fw-bold text-black" style="color: #292826">Panel de Gestión de Personas</h3>
        </div>
    </div>
</div>


<div style="padding-top: 25px;"></div>

<div class="table-responsive container">
    <table class="table" >
        <thead>
            <tr>
                <th class="header c0 centeralign" style="" scope="col"><a><strong>ID</strong></a></th>
                <th class="header c0 centeralign" style="" scope="col"><a><strong>NOMBRE</strong></a></th>
                <th class="header c1 centeralign" style="" scope="col"><a><strong>GÉNERO</strong></a></th>
                <th class="header c2" style="" scope="col"><a><strong>CONSUMO ALIMENTO</strong></a></th>
                <th class="header c2" style="" scope="col"><a><strong>MORAL</strong></a></th>
                <th class="header c3" style="" scope="col"><a><strong>TIEMPO EN COLONIA</strong></a></th>
                <th class="header c5" style="" scope="col">FUERZA</th>
                <th class="header c5" style="" scope="col">PRODUCCION</th>
                <th class="header c5" style="" scope="col">EDITAR</th>
                <th class="header c5" style="" scope="col">ELIMINAR</th>
                <td class="header c6 lastcol" style=""></td>
            </tr>
        </thead>



        <tbody>

        <% for (Persona persona : listaPersonas){%>
            <tr>
                <td><a><%=persona.getIdPoblador()%></a></td>
                <td><%=persona.getNombre()%></td>
                <td><%=persona.getGenero()%></td>
                <td><%=persona.getAlimentacionXdia()%></td>
                <td><%=persona.getMoral()%></td>
                <td><a><%=persona.getTiempo_en_colonia()%></a></td>
                <td><%=persona.getFuerza()%></td>
                <td><%=persona.getProduccionAlimento()%></td>
                <td><a href="<%=request.getContextPath()%>/menu?action=editarPersona&idPersona=<%=persona.getIdPoblador()%>"><img width="24" height="24" src="https://img.icons8.com/sf-regular/48/edit-row.png" alt="edit-row"/></a></td>
                <td class="cell c6 "><a  href="#" disabled=""><img width="24" height="24" src="https://img.icons8.com/sf-regular/48/filled-trash.png" alt="filled-trash"/></a></td>


            </tr>
        <%}%>



        </tbody>

    </table>


    <div>
        <a class="btn btn-primary" style="margin-left: 2px;" href="<%=request.getContextPath()%>/menu?action=crearPersona">Crear Persona</a>
    </div>
</div>




<footer class="footer">
    <p style="color: black;">© LOS TRES MOSQUETEROS - Todos los derechos reservados</p>
    <hr/>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


</body>

</html>