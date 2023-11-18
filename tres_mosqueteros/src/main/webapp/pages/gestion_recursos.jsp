<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.tres_mosqueteros.Beans.Jugador" %>
<%@ page import="com.example.tres_mosqueteros.Beans.Persona" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="jugadorLogueado" scope="session" type="com.example.tres_mosqueteros.Beans.Jugador" class="com.example.tres_mosqueteros.Beans.Jugador"/>
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

    <title>Administración de Usuarios | Semana de Ingeniería 2023</title>
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
                <a href="#" style="color: #000000; font-weight: bold;" class="active">Gestión de Recursos</a>
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
    <div class="text-secondary px-4 py-2 text-center">
        <div style="padding-bottom: 20px; padding-top: 30px">
            <h1 class="display-5 fw-bold text-black" style="color: #292826">Gestión de Recursos del reino de  <%=jugadorLogueado.getNombre()%></h1>
            <div style="margin-bottom: 5px"></div>

        </div>
    </div>
</div>

<div style="padding-top: 40px;"></div>


<div class="container">
    <div class="row">

        <div class="col-md-12 text-center">

            <button type="submit" id="verEstadisticas" class="btn btn-primary">Estadisticas del día</button>
        </div>
        <br>






    </div>
</div>

<div class="container">
    <div class="row">

        <div class="col-md-10">





            <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=home&ac=pasar_horas">


                <button type="submit" class="btn btn-primary">Pasar horas</button>


            </form>
        </div>



        <div class="col-md-2" >

            <button type="submit" id="miBoton" class="btn btn-primary">Terminar día</button>
            <script src="pages/estadisticas.js"></script>
            <script>
                document.getElementById("miBoton").addEventListener("click", ejecutarEstadisticas);
            </script>


            <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=home&ac=terminar_dia">

            <%-- <button type="submit" class="btn btn-primary">Terminar dia</button> --%>

             </form>
        </div>

</div>





<div style="padding-top: 15px;"></div>
<hr class="hr hr-blurry"/>
</div>



<div class="container">
<form autocomplete="off"  method="post" accept-charset="utf-8" id="mform2_c5Hfs9zIVAeeWpH" class="mform">
<div style="display: none;"><input name="sesskey" type="hidden" value="mfwKCcurEd">
<input name="_qf__user_active_filter_form" type="hidden" value="1">
</div>
</form>
</div>

<div style="padding-top: 25px;"></div>





<div class="table-responsive container">
<H2>Pobladores en condición crítica hoy</H2><br>

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
<td><a href="<%=request.getContextPath()%>/admin_gen?action=editar"><img width="24" height="24" src="https://img.icons8.com/sf-regular/48/edit-row.png" alt="edit-row"/></a></td>

</tr>
<%}%>



</tbody>

</table>



</div>






<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</body>

</html>