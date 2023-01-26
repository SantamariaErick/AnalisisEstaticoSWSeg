<%-- 
    Document   : getBook
    Created on : 29 nov. 2021, 17:43:01
    Author     : aizen
--%>

<%@page import="java.util.List"%>
<%@page import="ec.edu.espe.bookstore.model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ec.edu.espe.bookstore.controller.MongoDBManager"%>
<%@page import="org.bson.Document"%>
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
        <h1>
            <div align="center">Libros</div>
        </h1>
        <br>
        <table  class="table">
            <thead class="thead-dark">
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Autor</th>
                    <th>Editorial</th>
                    <th>Genero</th>
                    <th>Precio</th>
                    <th>Opciones</th>
                </tr>
            </thead>
            <%
                MongoDBManager mongo = new MongoDBManager();
                try {
                    ArrayList<Book> books = mongo.getBook();
                    for (Book b : books) {
                        out.println("<tr><td>" + b.getId() + "</td>");
                        out.println("<td>" + b.getName() + "</td>");
                        out.println("<td>" + b.getAuthor() + "</td>");
                        out.println("<td>" + b.getEditorial() + "</td>");
                        out.println("<td>" + b.getGender() + "</td>");
                        out.println("<td>" + b.getPrice() + "</td>");
                        out.println("<td> "
                                + "<button type='button' class='btn btn-primary'>Editar</button>"
                                + "&nbsp;&nbsp;"
                                + "<button type='button' class='btn btn-danger'>Eliminar</button>"
                                + "</td></tr>");
                    }
                } catch (Exception e) {
                    out.println("<p>Error en MONGODB</p>");
                }
            %>

        </table>
    </body>
</html>
