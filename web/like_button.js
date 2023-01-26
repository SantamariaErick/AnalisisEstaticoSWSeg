/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


'use strict';

import Book from './ReactJS/BookReact'
const e = React.createElement;

class LikeButton extends React.Component {
    constructor (props){
        super(props)
        this.state ={
            books:[],
            isFetch: true,
        }
    }

    componentDidMount() {
        //const aplicacion = document.querySelector('.content');
        fetch('http://localhost:8080/ClasicaBookStore/Book/books/listBooks')
                .then(response => response.json())
                .then((data) => this.setState({books:data, isFetch:false
                    //this.setState({books: data})
                    //data.forEach(book => {
                        //console.log(book.name);
                        //response.innerHTML = "<table class='table'>" + "<td align='center'>"+book.name +"</td>" +"</table>";
                        //aplicacion.appendChild(response);
                        //React.createElement('h1', {}, book.name)
                    //});
                }))
                .catch((error) => {
                    console.error(error);
                })
    }

    render() {
        if(this.state.isFetch){
            return 'Loading...'
        }
        const name = this.state.books[1].name
        
        return <Book name={name}/>
    }
}
const domContainer = document.getElementById('like_button_container');
ReactDOM.render((LikeButton), domContainer);
/*
 function app() {
 const url = 'http://localhost:8080/ClasicaBookStore/Book/books/listBooks'
 const [todos, setTodos] = useState()
 const fetchApi = async () => {
 const response = await fetch(url)
 console.log(response.status)
 const resopnseJSON = await response.json()
 setTodos(responseJSON)
 consele.log(responseJSON)
 }
 useEffect(() => {
 fetch()
 }, [])
 
 return (
 
 <div>
 <ul>
 {!todos ? 'Cargando...' :
 todos.map((todo, index) => {
 return <li>{todo.nombre}</li>
 })}
 </ul>
 </div>
 
 )
 }
 const domContainer = document.querySelector('#like_button_container');
 ReactDOM.render((LikeButton), document.getElementById('like_button_container');
 */