<%-- 
    Document   : index
    Created on : 4 ene. 2022, 16:13:04
    Author     : aizen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>

        <title>Clásica</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" crossorigin="anonymous">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link href="cssProject/styleCards.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String user;
            String level;

            if (sesion.getAttribute("user") != null && sesion.getAttribute("level") != null) {
                user = sesion.getAttribute("user").toString();
                level = sesion.getAttribute("level").toString();
                //out.print("<a href='jsps/login.jsp?cerrar=true'><h5>Cerrar Sesion"+user+"</h5></a>");
            } else {
                out.print("<script>location.replace('jsps/login.jsp')</script>");
            }

        %>
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">            
                </a>
                <button class="navbar-toggler" type="button" 
                        data-toggle="collapse" data-target="navbarSupportedContent"
                        aria-controls = "navbatSupportedContent"
                        aria-expanded = "false"
                        aria-label = "Toogle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="jsps/resources/userProfile.jsp">Perfil de usuario</a></li>
                        <li class="nav-item"><a class="nav-link" href='jsps/login.jsp?cerrar=true'>Cerrar Sesión</a></li>
                    </ul>
                </div>

            </div>
        </nav>

        <div id="colorlib-page">
            <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
            <aside id="colorlib-aside" role="complementary" class="js-fullheight">
                <nav id="colorlib-main-menu" role="navigation">
                    <ul>
                        <li class="colorlib-active"><a href="#">Inicio</a></li>
                        <li class="colorlib-inactive"><a href="#Arte">Arte</a></li>
                        <li class="colorlib-inactive"><a href="#Ciencia">Ciencia</a></li>
                        <li class="colorlib-inactive"><a href="#Cine">Cine</a></li>
                        <!--<li><a href="#Comics">Cómics</a></li>-->
                        <li class="colorlib-inactive"><a href="#Comics">Comics</a></li>

                        <li class="colorlib-inactive"><a href="#Educacion">Educación</a></li>
                        <li class="colorlib-inactive"><a href="#Fantasia">Fantasía</a></li>
                        <li class="colorlib-inactive"><a href="#Filosofia">Filosofía</a></li>
                        <li class="colorlib-inactive"><a href="#Novelas">Novelas</a></li>
                        <li class="colorlib-inactive"><a href="#Mas">Más</a></li>
                    </ul>
                </nav>
                <div id="like_button_container">

                </div>
            </aside> <!-- END COLORLIB-ASIDE -->

            <div id="colorlib-main">
                <div id="books">
                    <div class="container-md p-5">
                        <div class ="row pt-5">
                            <!--<h3 class="text-center pb-5 pt-5 h1">Librería Clasica</h3>-->
                            <h3 class="text-center pb-5 pt-5 h1">Librería Clásica</h3>
                        </div>
                        <%@include file="jsps/container/arte.jsp" %>
                    </div> 
                </div>
                <section class="">
                    <!-- Footer -->
                    <footer class="bg-secondary text-white">
                        <!-- Grid container -->
                        <div class="container p-4" style="background-color: #383c44">
                            <!--Grid row-->
                            <div class="row">
                                <!--Grid column-->
                                <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
                                    <h5 class="text-uppercase" style="color: #FFFFFF"><b>Footer Content</b></h5>

                                    <p>
                                        Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iste atque ea quis
                                        molestias. Fugiat pariatur maxime quis culpa corporis vitae repudiandae
                                        aliquam voluptatem veniam, est atque cumque eum delectus sint!
                                        Lorem #
                                        Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iste atque ea quis
                                        molestias. Fugiat pariatur maxime quis culpa corporis vitae repudiandae
                                        aliquam voluptatem veniam, est atque cumque eum delectus sint!
                                        Lorem #
                                        Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iste atque ea quis
                                        molestias. Fugiat pariatur maxime quis culpa corporis vitae repudiandae
                                        aliquam voluptatem veniam, est atque cumque eum delectus sint!
                                        Lorem #
                                    </p>
                                </div>
                                <!--Grid column-->

                                <!--Grid column-->
                                <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
                                    <h5 class="text-uppercase" style="color: #FFFFFF"><b>Librería Clásica</b></h5>

                                    <ul class="list-unstyled mb-0">
                                        <li>
                                            <a href="#!" class="text-white">Información de contacto:</a>
                                        </li>
                                        <li>
                                            <a href="#!" class="text-white">Nombre: Gabriel Herrera</a>
                                        </li>
                                        <li>
                                            <a href="#!" class="text-white">Email: gabrielherrera7285@hotmail.com</a>
                                        </li>
                                        <li>
                                            <a href="#!" class="text-white">Dirección: Sector Solanda, Calle José María Alemán "Jota".</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!--Grid row-->
                        </div>
                        <!-- Grid container -->

                        <!-- Copyright -->
                        <div class="text-center p-3" style="background-color: /*#FFC107*/#212328">
                            © 2022 Copyright:
                            <a class="text-white">Hi5</a>
                        </div>
                        <!-- Copyright -->
                    </footer>
                    <!-- Footer -->
                </section>
            </div>
        </div>
        <script src="js/main.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>   
        <script src="https://unpkg.com/react@16/umd/react.production.min.js"></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"></script>
        <script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script>
        <!--<script type="text/babel" src="like_button.js" ></script>-->
        <script src="like_button.js"></script>
        <script type="text/babel">
            ReactDOM.render(<App />, document.getElementById('root'));
        </script>
    </body>
</html>
