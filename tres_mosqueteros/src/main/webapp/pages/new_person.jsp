<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

    <!-- UIkit CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.17.4/dist/css/uikit.min.css" />

    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.17.4/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.17.4/dist/js/uikit-icons.min.js"></script>

    <link rel="icon" type="image/jpg" href="favicon.png" />

    <style>
        #imagen-container img {
            display: none;
        }
    </style>


    <style>
        #iframe-container iframe {
            display: none;
        }
    </style>

    <style>
        #texto-mostrado-url {
            color: blue; /* Establece el color del texto en azul */
        }
    </style>

    <title>Home | Semana de Ingeniería 2023</title>
</head>

<body-form>
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
    <div class="text-secondary px-4 py-2 text-center">
        <div style="padding-bottom: 20px; padding-top: 30px">
            <h1 class="display-5 fw-bold text-black" style="color: #292826">Creación de Persona</h1>
            <div style="margin-bottom: 5px"></div>
        </div>
    </div>
</div>



<div class="container">

    <div style="margin-bottom: 50px"></div>
    <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Interfaz de Creación de Persona</strong></h2>
    <div style="margin-bottom: 20px"></div>

    <hr style="border-top: 1px solid #262626;">

    <div style="margin-bottom: 40px"></div>

    <div class="container">



        <div class="row">
            <form method="post" action="<%=request.getContextPath()%>" enctype="multipart/form-data">
                <div class="col-lg-6 col-md-12" style="text-align: left; padding-top: 1.5em">


                    <div class="card">
                        <div class="card-body" style="padding-left: 35px">

                            <div style="padding-top: 1.5em;"></div>

                            <div>
                                <div class="form-group" style="padding-right: 1rem">
                                    <label  style="text-align: left;"><strong>Título del evento:</strong></label>
                                    <input name="titulo" type="text" class="form-control"  required>
                                </div>
                            </div>

                            <div style="padding-top: 1.5em;"></div>

                            <div>
                                <div class="form-group" style="padding-right: 1rem">
                                    <label  style="text-align: left;"><strong>Subtítulo del evento:</strong></label>

                                    <div class="row">

                                        <div class="col-md-4">
                                            <input  type="text" class="form-control" value="Fibra Tóxica" disabled readonly>
                                        </div>

                                        <div class="col-md-2">
                                            <h1 style="font-size:26px; text-align: center">vs</h1>
                                        </div>


                                        <div class="col-md-6">
                                            <select class="form-select" name="subtituloP2" aria-label="Default select example" required>
                                                <option selected disabled value="">Seleccionar equipo</option>
                                                <option value=" vs Hormigón Armado">Hormigón Armado</option>
                                                <option value=" vs Naranja Mecánica">Naranja Mecánica</option>
                                                <option value=" vs Electroshock">Electroshock</option>
                                                <option value=" vs Memoria Cache">Memoria Cache</option>
                                                <option value=" vs Descontrol">Descontrol</option>
                                                <option value=" vs PXO">PXO</option>
                                                <option value=" vs Mafia Cuántica">Mafia Cuántica</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div style="padding-top: 1.5em;"></div>

                            <div class="form-group" style="padding-right: 1rem">
                                <label style="text-align: left;"><strong>Hora del evento:</strong></label>
                                <input name="hora" type="time" class="form-control"  required>
                            </div>

                            <div style="padding-top: 1.5em;"></div>

                            <div class="form-group" style="padding-right: 1rem">
                                <label  style="text-align: left;"><strong>Fecha del evento:</strong></label>
                                <input name="fecha" type="date" class="form-control"  required>
                            </div>

                            <div style="padding-top: 1.5em;"></div>

                            <label style="text-align: left;"><strong>Lugar:</strong></label>
                            <select class="form-select" id="eleccion" aria-label="Default select example" required>
                                <option selected disabled value>Selecciona una opción</option>
                                <option value="1">Granjero</option>
                                <option value="2">Constructor</option>
                                <option value="3">Soldado</option>
                                <option value="4">Sin oficio</option>

                            </select>
                            <div id="imagen-container">
                                <img id="imagen1" src="https://th.bing.com/th/id/OIG.4yvtJarKEiznGuLgyXvL?pid=ImgGn" alt="Imagen 1">
                                <img id="imagen2" src="https://th.bing.com/th/id/OIG.IElTutWh8V5DqQw4zfrp?w=1024&h=1024&rs=1&pid=ImgDetMain" alt="Imagen 2">
                                <img id="imagen3" src="https://th.bing.com/th/id/OIG.jjCi01.YZWQ_f6NgFdmi?pid=ImgGn" alt="Imagen 3">
                                <img id="imagen4" src="https://th.bing.com/th/id/OIG.zsC6bLxpwnxYsFL97wQO?pid=ImgGn" alt="Imagen 4">
                            </div>
                            <input type="hidden" name="lugar" id="lugarTexto" value="">




                            <div style="padding-top: 1.5em;"></div>

                            <div>
                                <div class="form-group">
                                    <label style="text-align: left;"><strong>Descripción del evento:</strong></label>
                                    <textarea class="form-control" name="descripcion" aria-label="With textarea" placeholder="250 palabras máximo." required></textarea>
                                </div>
                                <div style="padding-top: 1em;"></div>
                            </div>





                        </div>
                    </div>

                    <div class="uk-flex uk-flex-center uk-margin-top">
                        <div class="uk-flex uk-flex-center">
                            <a id="redirect-button" class="btn btn-secondary m-2" href="<%=request.getContextPath()%>/admin_act?action=home">Cancelar</a>
                            <button type="submit" class="btn btn-primary m-2">Guardar</button>
                        </div>
                    </div>



                </div>



                <div class="col-lg-6 col-md-12" style="padding-left: 2em; padding-right: 2em; padding-top: 1.5em">

                </div>


            </form>
        </div>

        <div style="padding-top: 10px;"></div>

    </div>

</div>

<div style="margin-bottom: 50px"></div>


<footer-form class="footer">
    <p style="color: black; font-weight: bold;">© LOS TRES MOSQUETEROS - Todos los derechos reservados</p>
</footer-form>



<script>
    const selectElement = document.getElementById("eleccion");
    const imagenContainer = document.getElementById("imagen-container");
    const lugarTextoInput = document.getElementById("lugarTexto");


    // Escucha el evento de cambio en el select
    selectElement.addEventListener("change", function () {

        const selectedValue = selectElement.value;

        // Oculta todas las imágenes
        imagenContainer.querySelectorAll("img").forEach(img => {
            img.style.display = "none";
        });

        if (selectedValue === "1") {
            document.getElementById("imagen1").style.display = "block";
            lugarTextoInput.value = "GRA";
        } else if (selectedValue === "2") {
            document.getElementById("imagen2").style.display = "block";
            lugarTextoInput.value = "CONS";
        } else if (selectedValue === "3") {
            document.getElementById("imagen3").style.display = "block";
            lugarTextoInput.value = "SOL";
        }else if (selectedValue === "4") {
            document.getElementById("imagen4").style.display = "block";
            lugarTextoInput.value = "UNSET";
        } else {
            textoMostrado.textContent = ""; // Limpia el texto si no se selecciona una opción válida
            urlDireccion.textContent = "";
            lugarTextoInput.value = "";
        }
    });
</script>




<script src="js/upload.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>



</body-form>

</html>
