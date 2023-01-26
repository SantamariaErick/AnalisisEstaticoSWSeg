const {response} = require("express");

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function getClientsRest() {
    const aplicacion = document.querySelector('.content')
    var contentTab = document.getElementById("contentTable")
    fetch('http://localhost:8080/ClasicaBookStore/Book/clients/listClients')
            .then(response => response.json())
            .then(data => {
                data.forEach(clients => {
                    console.log(clients.firstname + " " + clients.lastname)
                    contentTab.innerHTML += "<tr><td>" + clients.firstname + "</td>" +
                            "<td>" + clients.lastname + "</td>" +
                            "<td>" + clients.email + "</td>" +
                            "<td>" + clients.ci + "</td>" +
                            "<td>" + clients.birthDate + "</td>" +
                            "<td>" + clients.telephone + "</td>" +
                            "<td>" + clients.cellphone + "</td>" +
                            "<td>" + clients.username + "</td></tr>"
                            /*+ "<td> "
                            + "<button type='button' class='btn btn-primary'>Editar</button>"
                            + "&nbsp;&nbsp;"
                            + "<button type='button' class='btn btn-danger'>Eliminar</button>"
                            + "</td></tr>"*/
                });
            })
            .catch(err => console.log(err))
}
function getBooksRest() {
    const aplicacion = document.querySelector('.content')
    var contentTab = document.getElementById("contentTable")
    fetch('http://localhost:8080/ClasicaBookStore/Book/books/listBooks')
            .then(response => response.json())
            .then(data => {
                data.forEach(book => {
                    console.log(book.name)
                    const response = document.createElement('response')
                    contentTab.innerHTML += "<tr><td>" + book.id + "</td>" +
                            "<td>" + book.name + "</td>" +
                            "<td>" + book.author + "</td>" +
                            "<td>" + book.editorial + "</td>" +
                            "<td>" + book.gender + "</td>" +
                            "<td>" + book.price + "</td>" +
                            "<td><img src='" + book.image + "' width='70' height='100'></td>" +
                            "<td>" + book.description + "</td></tr>"
                            /*+ "<td> "
                            + "<button type='submit' id='"
                            + book.id
                            + "' class='btn btn-primary' onclick=window.open('../jsps/forms/updateBookFrm.jsp','ventana','width=640,height=480,scrollbars=NO,menubar=NO,resizable=NO,titlebar=NO,status=NO'); >Editar</button>"
                            + "&nbsp;&nbsp;"
                            + "<button type='button' class='btn btn-danger'>Eliminar</button>"
                            + "</td></tr>"*/
                });
            })
            .catch(err => console.log(err))
}
function getBookById(id_) {
    var book = []
    var uri = 'http://localhost:8080/ClasicaBookStore/Book/books/search/' + id_
    fetch(uri)
            .then(response => response.json())
            .then(data => {
                book.push(data.id, data.name, data.author, data.gender, data.price, data.image, data.description)
                console.log(book);
            })
            .catch(err => console.log(err))
    return book;
}
function putBooksRest(id_, name_, author_, editorial_, gender_, price_, description_, image_) {
    var uri = "http://localhost:8080/ClasicaBookStore/Book/books/updateBook/" + id;
    fetch(uri, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            id: id_,
            name: name_,
            author: author_,
            editorial: editorial_,
            gender: gender_,
            price: price_,
            description: description_,
            image: image_
        })
    }).then(response => response.json).then(data => {
        console.log(data);
    })
}

