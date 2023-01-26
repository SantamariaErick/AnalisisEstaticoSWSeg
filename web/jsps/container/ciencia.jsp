<%-- 
    Document   : ciencia
    Created on : 11/01/2022, 15:49:44
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-sm">
    <div class="card w-100 card-border mb-5">
        <a href="html/principal.html"><img src="img/ciencia1.jpg" class="card-img-top" alt="" id="imagen4"></a>
        <div class="card-body">
            <h5 class="card-title" id="libro4">Ciencia</h5>
            <p class="card-text" id="editorial4">Libro</p>
        </div>
    </div>
</div>
<div class="col-sm">
    <div class="card w-100 card-border mb-5">
        <a href="html/principal.html"><img src="img/ciencia2.jpg" class="card-img-top" alt="" id="imagen2"></a>
        <div class="card-body">
            <h5 class="card-title" id="libro2">Card Title</h5>
            <p class="card-text" id="editorial2">Libro</p>
        </div>
    </div>
</div>
<div class="col-sm">
    <div class="card w-100 card-border mb-5">
        <a href="html/principal.html"><img src="img/ciencia3.jpg" class="card-img-top" alt="" id="imagen3"></a>
        <div class="card-body">
            <h5 class="card-title" id="libro2">Card Title</h5>
            <p class="card-text" id="editorial2">Libro</p>
        </div>
    </div>
</div>

<script type="text/javascript">
    const aplicacion = document.querySelector('.content')
    fetch('http://localhost:8080/ClasicaBookStore/Book/books/search/4')
            .then(response => response.json())
            .then(data => {
                document.getElementById('imagen4').src = data.image;
                document.getElementById('libro4').innerHTML = data.name;
                document.getElementById('editorial4').innerHTML = data.editorial;
            })
            .catch(err => console.log(err))
    
    fetch('http://localhost:8080/ClasicaBookStore/Book/books/search/5')
            .then(response => response.json())
            .then(data => {
                document.getElementById('imagen2').src = data.image;
                document.getElementById('libro2').innerHTML = data.name;
                document.getElementById('editorial2').innerHTML = data.editorial
            })
            .catch(err => console.log(err))
    
    fetch('http://localhost:8080/ClasicaBookStore/Book/books/search/5')
            .then(response => response.json())
            .then(data => {
                document.getElementById('libro3').innerHTML = data.name;
                document.getElementById('editorial3').innerHTML = data.editorial
            })
            .catch(err => console.log(err))
</script>