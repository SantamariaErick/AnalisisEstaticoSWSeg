<%-- 
    Document   : userProfile
    Created on : 4 ene. 2022, 17:26:04
    Author     : aizen
--%>

<%@page import="ec.edu.espe.bookstore.model.Client"%>
<%@page import="ec.edu.espe.bookstore.controller.MongoDBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Profile</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css" crossorigin="anonymous">
        <link href="../../css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="../../css/style.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Client cli = new Client();
            String userName = sesion.getAttribute("user").toString();
            String passW = sesion.getAttribute("password").toString();
            MongoDBManager information = new MongoDBManager();
            cli = information.getLoginUser(userName, passW);
        %>
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <!--<div class="container-fluid">--> 
                <!--<div class="collapse navbar-collapse" id="navbarSupportedContent">-->
                    <ul class="navbar-nav mr-auto">
                        <a class="nav-link"></a><a href="../../index.jsp">
                            <button class="btn btn-primary" type="button" name="return"><i class="fas fa-arrow-circle-left"></i>&nbsp;&nbsp;Regresar</button>
                        </a>  
                    </ul>     
                <!--</div>-->
<!--            </div>    -->
        </nav>
        <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
        <div class="container-md p-2">
            <h3 class="text-center pb-0 pt-0 h1">Perfil de usuario</h3>
            <div class="row">
                <div class="col-6" align="center">
                    <div class="col-sm">
                        <div class="card w-50 card-border mb-8"> <img src="../../img/user.png" class="card-img-top" alt=""> </div>
                    </div>
                </div>
                <div class="col-6">
                    <form id="form1" name="form1" method="post" action="processUserProf.jsp" onsubmit="return validateForm()">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <p>
                                    <label for="name" class="formulario__label">Nombres: </label>
                                </p>
                                <p>
                                    <input type='text' name='name' id='name' class='form-control' value='<%=cli.getFirstname()%>' onchange="validateInp('name')">
                                </p>
                            </div>
                            <div class="form-group col-md-6">
                                <p>
                                    <label for="lastName" class="formulario__label">Apellidos:</label>
                                </p>
                                <p>
                                    <input type="text" name="lastName" id="lastName" class="form-control" value="<%=cli.getLastname()%>" onchange="validateInp('lastName')">
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <p>
                                    <label for="email" class="formulario__label">Email: </label>
                                </p>
                                <input type='email' name='email' id='email' class='form-control' value="<%=cli.getEmail()%>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <p>
                                    <label for="cardId" class="formulario__label">Cédula: </label>
                                </p>
                                <p>
                                    <input type='text' name='ci' id='ci' class='form-control' value="<%=cli.getCi()%>" onchange="validateInp('ci')" >
                                </p>
                            </div>
                            <div class="form-group col-md-6">
                                <p>
                                    <label for="dateOfBirth" class="formulario__label">Fecha de nacimiento: </label>
                                </p>
                                <input type='date' name='dateOfBirth' id='dateOfBirth' class='form-control' max='2011-01-01' min='1921-01-01' value='<%=cli.getBirthDate()%>'>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <p>
                                    <label for="telfNumb" class="formulario__label">Número de teléfono: </label>
                                </p>
                                <input name="telfNumb" type="tel" class="form-control" id="telfNumb" placeholder="(00) 000-000" value="<%=cli.getTelephone()%>">
                            </div>
                            <div class="form-group col-md-6">
                                <p>
                                    <label for="cellNumb" class="formulario__label">Número celular: </label>
                                </p>
                                <input name="cellNumb" type="tel" class="form-control" id="cellNumb" placeholder="0999999999" value="<%=cli.getCellphone()%>">
                            </div>


                            <input type="hidden" id="level" name="level" value="<%=cli.getLevel()%>">
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <p>
                                    <label for="username" class="formulario__label">Nombre de usuario: </label>
                                </p>
                                <input type="text" id="username" class="form-control" name="username" value="<%=cli.getUsername()%>">
                            </div>
                            <div class="form-group col-md-6">
                                <p>
                                    <label for="username" class="formulario__label">Contraseña: </label>
                                </p>
                                <input type="password" id="password" class="form-control" name="password" value="<%=cli.getPass()%>">
                            </div>

                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12">
                            <button type="submit" name="update" id="update" class="btn btn-primary"><i class="fas fa-save fa-fw"></i>&nbsp;&nbsp;Actualizar</button>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="../../js/bootstrap.bundle.min.js"></script>
        <script src="../../jsProject/validations.js"></script>
        <script src="https://unpkg.com/react@17/umd/react.development.js" crossorigin></script>
        <script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js" crossorigin></script>
    </body>
</html>
