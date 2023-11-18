
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="jugadorLogueado" scope="session" type="com.example.tres_mosqueteros.Beans.Jugador" class="com.example.tres_mosqueteros.Beans.Jugador"/>


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
<div class="text-secondary px-4 py-5 text-center">
            <div style="padding-bottom: 25px; padding-top: 30px">
                <h1 class="display-5 fw-bold text-black" style="color: #292826">Bienvenido Jugador: @...</h1>
                <div style="margin-bottom: 10px"></div>
                <h3 class="fw-bold text-black" style="color: #292826">Panel de Gestión de Personas</h3>
            </div>
        </div>
    </div>

<div style="padding-top: 40px;"></div>

<div class="container">
    <div class="row">

        <div class="col-md-10">

            <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=home&ac=busqueda">

                <div class="custom-form-group">
                    <input type="text" class="form-control" name="busquedaNombreCodigo" placeholder="Buscar por nombre o código" style="width: 120%">
                </div>
                <button type="submit" class="btn btn-primary">Aplicar filtros</button>

                <a class="btn btn-primary" href="<%=request.getContextPath()%>/admin_gen" role="button">Borrar filtros</a>
            </form>
        </div>

        <div class="col-md-2" >
            <div class="btn-group">
                <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                    ESTADO
                </button>
                <ul class="dropdown-menu dropdown-menu-lg-end">
                    <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=home&ac=busquedaPorEstado&id=ACC">
                        <li><button class="dropdown-item" type="submit">Aceptados</button></li>
                    </form>
                    <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=home&ac=busquedaPorEstado&id=VER">
                        <li><button class="dropdown-item" type="submit">Sin Asignar</button></li>
                    </form>
                    <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=home&ac=busquedaPorEstado&id=BAN">
                        <li><button class="dropdown-item" type="submit">Baneados</button></li>
                    </form>
                </ul>
            </div>
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
    <table class="admintable generaltable table-sm" id="users">
        <thead>
            <tr>
                <th class="header c0 centeralign" style="" scope="col"><a><strong>NOMBRE</strong></a> / <a><strong>APELLIDO</strong></a></th>
                <th class="header c1 centeralign" style="" scope="col"><a><strong>CÓDIGO</strong></a></th>
                <th class="header c2" style="" scope="col"><a><strong>ROL EN EL SISTEMA</strong></a></th>
                <th class="header c2" style="" scope="col"><a><strong>ROL ACADÉMICO</strong></a></th>
                <th class="header c3" style="" scope="col"><a><strong>ESTADO</strong></a></th>
                <th class="header c5" style="" scope="col">EDITAR</th>
                <td class="header c6 lastcol" style=""></td>
            </tr>
        </thead>



        <tbody>
            <tr class="">
                <td class="centeralign cell c0" style=""><a>Juan Perez</a></td>
                <td class="centeralign cell c1" style="">123123123321</td>
                <td class="cell c2" style="">asdasd</td>
                <td class="cell c2" style="">sdfsdf</td>
                <td class="cell c3" style="">sdfsdf</td>
                <td class="cell c5" style=""><a href="<%=request.getContextPath()%>/admin_gen?action=editar"><img width="24" height="24" src="https://img.icons8.com/sf-regular/48/edit-row.png" alt="edit-row"/></a></td>

                <td class="cell c6 lastcol" style=""></td>
            </tr>




        </tbody>

    </table>
</div>



<div class="container">
    <nav class="mt-4">
        <ul class="pagination justify-content-center">

            <li class="page-item">
                <a href="#" class="page-link">1</a>
            </li>

            <li class="page-item">
                <a href="#" class="page-link">2</a>
            </li>

            <li class="page-item">
                <a href="#" aria-label="Next" class="page-link">
                    <span aria-hidden="true">»</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>

        </ul>
    </nav>
</div>




<footer class="footer">
    <p style="color: black; font-weight: bold;">Derechos Reservados &copy; 2023</p>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


</body>

</html>