<%-- 
    Document   : admin
    Created on : 4 ene. 2022, 16:15:34
    Author     : aizen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Administrador</title>
        <link href="../../css/estiloperfil.css" rel="stylesheet" type="text/css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@1,200&display=swap" rel="stylesheet">
        <link href="../../css/ace-responsive-menu.css" rel="stylesheet" type="text/css" />
    </head>
    <body id="portada">
        <%
            HttpSession sesion = request.getSession();
            String user;
            String level;

            if (sesion.getAttribute("user") != null && sesion.getAttribute("level") != null) {
                user = sesion.getAttribute("user").toString();
                level = sesion.getAttribute("level").toString();
                //out.print("<a href='jsps/login.jsp?cerrar=true'><h5>Cerrar Sesion"+user+"</h5></a>");
            } else {
                out.print("<script>location.replace('../login.jsp')</script>");
            }

        %>
        <header>
            <div class="contenedor">
                <div>
                    <h2 class="logotipo"><i class="fas fa-user-tie" style="margin-right: 10px;"></i>Administrador</h2>
                </div>
                <nav> 
                    <ul id="respMenu" class="ace-responsive-menu" data-menu-style="horizontal">
                        <li> <a> <i class="fas fa-book-reader"></i> <span class="title">Libros</span> <span class="arrow"></span></a> 
                            <!-- Level Two-->
                            <ul>
                                <li> <a href="../../forms/bookForm.html" target="frame"> <i class="fas fa-file-export" aria-hidden="true"></i> Registrar </a> </li>
                                <li> <a href="../../html/getBooks.html" target="frame"> <i class="fas fa-eye" aria-hidden="true"></i> Ver </a> </li>
                            </ul>
                        </li>
                        <li><a> <em class="fas fa-users-cog"></em> <span class="title">Usuarios</span> <span class="arrow"></span> </a>
                            <ul>
                                <li> <a href="../../forms/clientForm.html" target="frame"> <i class="fas fa-file-export" aria-hidden="true"></i> Registrar </a> </li>
                                <li> <a href="../../html/getClients.html" target="frame"> <i class="fas fa-eye" aria-hidden="true"></i> Ver </a> </li>
                            </ul>
                        </li>
                        <!--<li><a> <em class="fas fa-chalkboard-teacher"></em> <span class="title">Registro de ventas</span> <span class="arrow"></span> </a>
                            <ul>
                                <li> <a  href="" target="frame"> <i class="fas fa-file-export" aria-hidden="true"></i> Registrar </a> </li>
                                <li> <a href="" target="frame"> <i class="fas fa-eye" aria-hidden="true"></i> Ver </a> </li>
                            </ul>
                        </li>-->
                        <li style=" margin-top: 2px;"> <a href='../login.jsp?cerrar=true'> <i class="fas fa-power-off"></i> Cerrar Sesion</a> </li>
                    </ul>
                </nav>
            </div>
        </header>
        <div class="frame">
            <iframe  id="frame" name="frame"> </iframe>
        </div>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script> 
        <script src="../../js/jquery-1.10.1.min.js" type="text/javascript"></script> 
        <script src="../../js/ace-responsive-menu.js" type="text/javascript"></script> 
        <script src="https://unpkg.com/react@17/umd/react.development.js" crossorigin></script>
        <script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js" crossorigin></script>
        <!--Plugin Initialization--> 
        <script type="text/javascript">
            $(document).ready(function () {
                $("#respMenu").aceResponsiveMenu({
                    resizeWidth: '768', // Set the same in Media query       
                    animationSpeed: 'fast', //slow, medium, fast
                    accoridonExpAll: false //Expands all the accordion menu on click
                });
            });
        </script>
        
        <script src="https://unpkg.com/react@17/umd/react.development.js" crossorigin></script>
        <script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js" crossorigin></script>
    </body>
</html>