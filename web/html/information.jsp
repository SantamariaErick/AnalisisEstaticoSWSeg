<%-- 
    Document   : information
    Created on : 11/01/2022, 18:24:36
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Clasica</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" crossorigin="anonymous">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="../css/main.css" rel="stylesheet" type="text/css">
        <link href="../css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>

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

                <div>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="../index.jsp">Atras</a></li>
                    </ul>
                </div>

            </div>
        </nav>

        <div>
            <hr><!-- comment -->
        </div>

        <div class="row mb-3">
            <div class="col-8">
                <h3>Descripcion</h3>
                <p id="description">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eu dictum mi, quis egestas metus. Nulla ligula nulla, fringilla ut diam nec, mollis tempor nulla. Sed sollicitudin eget dolor eget tristique. Aliquam quam lacus, ultrices id ex id, faucibus feugiat massa. Aliquam nec mauris molestie, interdum tellus sed, elementum nulla.
                </p>
                <p>
                    <b>Nombre:</b> <p id="name"> Lorem ipsum</p>
                </p>
                <p>
                    <b>Author</b> <p id="author"> Lorem ipsum</p>
                </p>
                <p>
                    <b>Editorial</b> <p id="editorial"> Lorem ipsum</p>
                </p>
                <p>
                    <b>Precio:</b> <p id="price"> Lorem ipsum</p>
                </p>
            </div>
            <div class="col-4">
                <div id="colorlib-main">
                    <div class="col-sm">       
                        <div class="card w-100 card-border mb-8">
                            <img src="../img/incognito.jpg" class="card-img-top" alt="" id="image">
                            <div class="card-body">
                                <h5 class="card-title" id="name_card">Card TItle</h5>
                                <p class="card-text" id="author_card">Libro
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%
            String datoUno = request.getParameter("id");
        %>
        <script type="text/javascript">
            var id = <%= datoUno %>
            const aplicacion = document.querySelector('.content')
            fetch('http://localhost:8080/ClasicaBookStore/Book/books/search/'+id)
                    .then(response => response.json())
                    .then(data => {
                        document.getElementById('description').innerHTML = data.description;
                        document.getElementById('name').innerHTML = data.name;
                        document.getElementById('author').innerHTML = data.author;
                        document.getElementById('editorial').innerHTML = data.editorial;
                        document.getElementById('price').innerHTML = data.price;
                        document.getElementById('name_card').innerHTML = data.name;
                        document.getElementById('author_card').innerHTML = data.author;
                        document.getElementById('author_card').innerHTML = data.author;
                        document.getElementById('image').src = data.image;
                    })
                    .catch(err => console.log(err))
        </script>
    </body>
</html>