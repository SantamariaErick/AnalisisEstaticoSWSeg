<%-- 
    Document   : process_user_prof
    Created on : 16 ene. 2022, 17:10:09
    Author     : erick
--%>

<%@page import="ec.edu.espe.bookstore.model.Client"%>
<%@page import="ec.edu.espe.bookstore.controller.MongoDBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process user profile information</title>
    </head>
    <body>
        <%
            if (request.getParameter("update") != null) {
                MongoDBManager updateData = new MongoDBManager();
                String firstname = request.getParameter("name");
                String lastname = request.getParameter("lastName");
                String email = request.getParameter("email");
                String ci = request.getParameter("ci");
                String birthDate = request.getParameter("dateOfBirth");
                String telephone = request.getParameter("telfNumb");
                String cellphone = request.getParameter("cellNumb");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String level = request.getParameter("level");
                Client client = new Client(firstname, lastname, email, ci, birthDate, telephone, cellphone, username, password, level);
                try {
                    Client resp = updateData.updateClient(ci, client);
                    out.println("<script>console.log('"
                            + client.toString() + " ci:"+ci+"')</script>");
                    out.println("<script>alert('Usuario actualizado correctamente')</script>");
                    response.sendRedirect("userProfile.jsp");

                } catch (Exception e) {
                    out.println("<script>alert('Error al actualizar los datos')</script>");
                    response.sendRedirect("userProfile.jsp");
                }
            }
        %>
    </body>
</html>
