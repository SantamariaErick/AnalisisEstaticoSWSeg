<%-- 
    Document   : addClient
    Created on : 29 nov. 2021, 17:43:15
    Author     : aizen
--%>

<%@page import="ec.edu.espe.bookstore.model.Client"%>
<%@page import="ec.edu.espe.bookstore.controller.MongoDBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css" crossorigin="anonymous">
        <link href="../../css/bootstrap.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            MongoDBManager mongo = new MongoDBManager();

            String firstname = request.getParameter("name");
            String lastname = request.getParameter("lastName");
            String email = request.getParameter("email");
            String ci = request.getParameter("ci");
            String birthDate = request.getParameter("birthDate");
            String telephone = request.getParameter("telephone");
            String cellphone = request.getParameter("cellphone");
            String username = request.getParameter("username");
            String pass = request.getParameter("password");
            Client client = new Client(firstname, lastname, email, ci, birthDate, telephone, cellphone, username, pass, "1");
            try {
                mongo.addClient(client);
                out.println("<script>/*window.location.href = '../../html/register.html';*/window.history.back(-1); window.alert('Registro completado correctamente'); </script>");
            } catch (Exception e) {
                out.println("<script>window.history.back(-1); window.alert('Error al ingresar datos, intente nuevamente')</script>");
            }
        %>
    </body>
</html>
