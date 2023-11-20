<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="jugadorLogueado" scope="session" type="com.example.tres_mosqueteros.Models.Beans.Jugador" class="com.example.tres_mosqueteros.Models.Beans.Jugador"/>


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
    <link rel="stylesheet" href="sweetalert2.min.css">
    <script src="js/showError.js"></script>


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
                <a href="<%=request.getContextPath()%>/menu?action=home" style="color: #000000; font-weight: bold;" class="active">Gestión de Personas</a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/menu?action=gestionRecursos" style="color:#000000; font-weight: bold;">Gestión de Recursos</a>
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
            <form id="form" method="post" action="<%=request.getContextPath()%>/menu?action=newPerson">
                <div class="col-lg-6 col-md-12" style="text-align: left; padding-top: 1.5em">


                    <div class="card">
                        <div class="card-body" style="padding-left: 35px">

                            <div style="padding-top: 1.5em;"></div>

                            <div>
                                <div class="form-group" style="padding-right: 1rem">
                                    <label  style="text-align: left;"><strong>Nombre de la persona:</strong></label>
                                    <input name="nombre" id="nombrePersona" type="text" class="form-control"  required>
                                </div>
                            </div>

                            <div style="padding-top: 1.5em;"></div>

                            <div>
                                <div class="form-group" style="padding-right: 1rem">
                                    <label  style="text-align: left;"><strong>Género: </strong></label>

                                        <select class="form-select" name="genero" aria-label="Default select example" required>
                                            <option selected disabled value="">Seleccionar equipo</option>
                                            <option value="M">M (masculino)</option>
                                            <option value="F">F (femenino)</option>

                                        </select>

                                </div>
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
                                <img id="imagen1" src="https://th.bing.com/th/id/OIG.iOvKX4MmJxI4ZeAz3874?pid=ImgGn" alt="Imagen 1">
                                <img id="imagen2" src="https://th.bing.com/th/id/OIG.Ii_Gx0xWqZxFeMlvMaD_?pid=ImgGn" alt="Imagen 2">
                                <img id="imagen3" src="https://th.bing.com/th/id/OIG.DPGU4HHy7zWFDp_jYHZa?pid=ImgGn" alt="Imagen 3">
                                <img id="imagen4" src="https://th.bing.com/th/id/OIG.zsC6bLxpwnxYsFL97wQO?pid=ImgGn" alt="Imagen 4">
                            </div>
                            <input type="hidden" name="idProfesion" id="lugarTexto" value="">


                            <div style="padding-top: 1.5em;"></div>






                        </div>
                    </div>

                    <div class="uk-flex uk-flex-center uk-margin-top">
                        <div class="uk-flex uk-flex-center">
                            <a id="redirect-button" class="btn btn-secondary m-2" href="<%=request.getContextPath()%>/menu?action=home">Cancelar</a>
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


<footer class="footer-form">
    <p style="color: black">© LOS TRES MOSQUETEROS - Todos los derechos reservados</p>
    <hr/>
</footer>



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


<script>
    const nombre = document.getElementById("nombrePersona")
    const form = document.getElementById("form")

    form.addEventListener("submit", e=>{

        if (nombre.value.length>10){
            showError("El nombre de la persona es muy largo. Debe contener como máximo 10 caracteres")
            e.preventDefault()
        }
        else{
            //Envia el form al servlet
            event.preventDefault();

            Swal.fire({
                title: "Felicidades!! Haz añadido una nueva persona a tu civilización",
                width: 600,
                padding: "3em",
                color: "#FFFFFF",
                confirmButtonText: "Ver civilización",
                background: "#F0B20E",
                confirmButtonColor: "#1A1A18",
                backdrop: `
                        rgba(0,0,0,0.4)
                        url("https://i.pinimg.com/originals/28/1c/41/281c41a190e26ee83cd1da35008ac30a.gif")
                        center top
                        no-repeat
                        `
            }).then(() => {
                // Redirige al servlet después de cerrar la alerta
                document.getElementById('form').submit(); // Envía el formulario
            });
        }
    })
</script>






    <script src="js/upload.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>


</body-form>

</html>
