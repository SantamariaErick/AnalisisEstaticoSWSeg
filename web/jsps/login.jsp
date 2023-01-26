<%-- 
    Document   : login
    Created on : 4 ene. 2022, 15:42:09
    Author     : aizen
--%>

<%@page import="ec.edu.espe.bookstore.model.Client"%>
<%@page import="ec.edu.espe.bookstore.controller.MongoDBManager"%>
<%@page session="true" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="../cssProject/login.css" />
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>

        <title>Login</title>
    </head>

    <body>
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark" style="background-color: #383c44;">
            <div class="container-fluid">
                <a class="navbar-brand" href="../"><i class=""></i>
                    &nbsp;&nbsp;&nbsp;Clasica</a>
                <button class="navbar-toggler" type="button" 
                        data-toggle="collapse" data-target="navbarSupportedContent"
                        aria-controls = "navbatSupportedContent"
                        aria-expanded = "false"
                        aria-label = "Toogle navigation"> <span class="navbar-toggler-icon"></span> </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link"></a>&nbsp;</li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="burbles">
        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="800px" height="600px" viewBox="0 0 800 600" enable-background="new 0 0 800 600" xml:space="preserve">
        <linearGradient id="SVGID_1_" gradientUnits="userSpaceOnUse" x1="174.7899" y1="186.34" x2="330.1259" y2="186.34" gradientTransform="matrix(0.8538 0.5206 -0.5206 0.8538 147.9521 -79.1468)">
        <stop offset="0" style="stop-color:#FFC035" />
        <stop offset="0.221" style="stop-color:#F9A639" />
        <stop offset="1" style="stop-color:#E64F48" />
        </linearGradient>
        <circle fill="url(#SVGID_1_)" cx="266.498" cy="211.378" r="77.668" />
        <linearGradient id="SVGID_2_" gradientUnits="userSpaceOnUse" x1="290.551" y1="282.9592" x2="485.449" y2="282.9592">
        <stop offset="0" style="stop-color:#FFA33A" />
        <stop offset="0.0992" style="stop-color:#E4A544" />
        <stop offset="0.9624" style="stop-color:#00B59C" />
        </linearGradient>
        <circle fill="url(#SVGID_2_)" cx="388" cy="282.959" r="97.449" />
        <linearGradient id="SVGID_3_" gradientUnits="userSpaceOnUse" x1="180.3469" y1="362.2723" x2="249.7487" y2="362.2723">
        <stop offset="0" style="stop-color:#12B3D6" />
        <stop offset="1" style="stop-color:#7853A8" />
        </linearGradient>
        <circle fill="url(#SVGID_3_)" cx="215.048" cy="362.272" r="34.701" />
        <linearGradient id="SVGID_4_" gradientUnits="userSpaceOnUse" x1="367.3469" y1="375.3673" x2="596.9388" y2="375.3673">
        <stop offset="0" style="stop-color:#12B3D6" />
        <stop offset="1" style="stop-color:#7853A8" />
        </linearGradient>
        <circle fill="url(#SVGID_4_)" cx="482.143" cy="375.367" r="114.796" />
        <linearGradient id="SVGID_5_" gradientUnits="userSpaceOnUse" x1="365.4405" y1="172.8044" x2="492.4478" y2="172.8044" gradientTransform="matrix(0.8954 0.4453 -0.4453 0.8954 127.9825 -160.7537)">
        <stop offset="0" style="stop-color:#FFA33A" />
        <stop offset="1" style="stop-color:#DF3D8E" />
        </linearGradient>
        <circle fill="url(#SVGID_5_)" cx="435.095" cy="184.986" r="63.504" />
        </svg>
        </div>
        <div class="container" style="margin-top: -100px">
            <h2>Inicio de sesión</h2>
            <form name="formLog" id="formLog" action="login.jsp" method="post">
                <input type="text" class="email" name="user" id="user" placeholder="Nombre de usuario" required>
                <br/>
                <input type="password" class="pwd" name="password" id="password" placeholder="Contraseña" required>
                <a href="#" class="link">
                    &nbsp;&nbsp;&nbsp;
                </a>
                <br/><br/>
                <button class="register" name="btnRegister">
                    <a href="../html/register.html" style="color: #FFFFFF">
                    <i class="fas fa-pen-alt"></i>&nbsp;&nbsp;Registrate
                    </a>
                </button>
                <button class="signin" type="submit" name="btnEnter" onClick="">
                    <span><i class="fas fa-sign-in-alt"></i>&nbsp;&nbsp;Iniciar sesión</span>
                </button>
            </form>
        </div>
        <%
            MongoDBManager logger = new MongoDBManager();
            String user = "";
            String pass = "";
            if (request.getParameter("btnEnter") != null) {
                user = request.getParameter("user");
                pass = request.getParameter("password");
                try {
                    Integer resp = logger.login(user, pass);
                    Client loginClient = logger.getLoginUser(user, pass);
                    session.setAttribute("logCli", loginClient);
                    HttpSession sesion = request.getSession();
                    switch (resp) {
                        case 1:
                            sesion.setAttribute("user", user);
                            sesion.setAttribute("level", "1");
                            sesion.setAttribute("password", pass);
                            //response.sendRedirect("../index.jsp?usern="+user+"&passw="+pass);
                            response.sendRedirect("../index.jsp");
                            break;

                        case 2:
                            sesion.setAttribute("user", user);
                            sesion.setAttribute("level", "2");
                            response.sendRedirect("resources/admin.jsp");
                            break;
                        case 3:
                            out.write("<script>window.alert('Contraseña incorrecta, intente de nuevo')</script>");
                            break;
                        case 4:
                            out.write("<script>window.alert('Usuario incorrecto, intente de nuevo')</script>");
                            break;        
                        default:
                            out.write("<script>window.alert('Usuario no existe, intente de nuevo')</script>");
                            break;
                    }
                } catch (Exception e) {
                    out.print("<script>window.alert('Error en la base de datos')</script>");
                }
            }
            if (request.getParameter("cerrar") != null) {
                session.invalidate();
            }
        %>
        <input type="hidden" name="userNameLog" id="userNameLog" value="<%user.toString();%>">
        <input type="hidden" name="passLog" id="passLog" value="<%pass.toString();%>">
        <script src="https://unpkg.com/react@17/umd/react.development.js" crossorigin></script>
        <script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js" crossorigin></script>
        
    </body>
</html>