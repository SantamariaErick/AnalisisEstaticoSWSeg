<%-- 
    Document   : newjspgetClient
    Created on : 29 nov. 2021, 17:43:24
    Author     : aizen
--%>

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
        <h1>Resutados:!</h1>

        <%
            MongoDBManager mongo = new MongoDBManager();
            mongo.getClient();
        %>
    </body>
</html>
