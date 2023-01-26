<%-- 
    Document   : addBook
    Created on : 29 nov. 2021, 17:42:33
    Author     : aizen
--%>

<%@page import="ec.edu.espe.bookstore.model.Book"%>
<%@page import="ec.edu.espe.bookstore.controller.MongoDBManager"%>
<%@page session="true" %>
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

            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String author = request.getParameter("author");
            String editorial = request.getParameter("editorial");
            String gender = request.getParameter("gender");
            Float price = Float.parseFloat(request.getParameter("price"));
            String image = request.getParameter("image");
            String description = request.getParameter("description");

            //Book book = new Book(id, name, author, editorial, gender, price, description, image);
            try {
                mongo.addBook(id,name,author,editorial,gender,price,description,image);
                out.println("<script>windows.alert('Insertado correctamente');"
                        + "window.location.href(../admin.jsp)</script>");
            } catch (Exception e) {
                out.println("<script>windows.alert('Error al registrar los datos');"
                        + "window.location.href(../admin.jsp)</script>");
            }
        %>

    </body>
</html>
