/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
'use strict';

const e = React.createElement;

class LikeButton extends React.Component {
  componentDidMount=()=> {
        const aplicacion = document.querySelector('.content');
        fetch('http://localhost:8080/ClasicaBookStore/Book/books/listBooks',{
            method: 'GET'
        })
                .then(response => response.json())
                .then(data => {
                        data.forEach(book => {
                            console.log(book.name);
                            //const response = document.createElement('response');
                            //response.innerHTML = "<table class='table'>" + "<td align='center'>"+book.name +"</td>" +"</table>";
                            //aplicacion.appendChild(response);
                        });
                    })
                    .catch((error)=>{
                        console.error(error);
                    })
    }

  render() {
     return <h1>my Component has Mounted, Check the browser 'console' </h1>;
  }
}

export default myComponent;