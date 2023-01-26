import React, { Fragment, useState } from 'react'
import Book from "./components/Book"
import Cart from "./components/Cart"

function App() {

  //estado de libros
  const [books, setBooks] = useState([
    

    { id: 1, name: 'Card Title', text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint unde quam iusto placeat suscipit minima. Porro nemo ab accusantium asperiores atque sint laudantium eligendi modi officiis maiores, facere, dicta corporis!' },
    { id: 2, name: 'Card Title', text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint unde quam iusto placeat suscipit minima. Porro nemo ab accusantium asperiores atque sint laudantium eligendi modi officiis maiores, facere, dicta corporis!' },
    { id: 3, name: 'Card Title', text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint unde quam iusto placeat suscipit minima. Porro nemo ab accusantium asperiores atque sint laudantium eligendi modi officiis maiores, facere, dicta corporis!' },
    { id: 4, name: 'Card Title', text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint unde quam iusto placeat suscipit minima. Porro nemo ab accusantium asperiores atque sint laudantium eligendi modi officiis maiores, facere, dicta corporis!' },
    { id: 5, name: 'Card Title', text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint unde quam iusto placeat suscipit minima. Porro nemo ab accusantium asperiores atque sint laudantium eligendi modi officiis maiores, facere, dicta corporis!' },
    { id: 6, name: 'Card Title', text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint unde quam iusto placeat suscipit minima. Porro nemo ab accusantium asperiores atque sint laudantium eligendi modi officiis maiores, facere, dicta corporis!' },
    { id: 7, name: 'Card Title', text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint unde quam iusto placeat suscipit minima. Porro nemo ab accusantium asperiores atque sint laudantium eligendi modi officiis maiores, facere, dicta corporis!' },
    { id: 8, name: 'Card Title', text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint unde quam iusto placeat suscipit minima. Porro nemo ab accusantium asperiores atque sint laudantium eligendi modi officiis maiores, facere, dicta corporis!' },

  ])

  //cart status
  const [cart, setCart] = useState([])


  return (
    <Fragment>

      <div className="col-sm">
        <div className="card w-100 card-border mb-5">
          <a href="html/principal.html">a</a>
          <div className="card-body">
            <h5 className="card-title">Card TItle</h5>
            <p className="card-text">Libro</p>
          </div>
        </div>
      </div>
      
      <h3>Books</h3>
      {books.map((book) => (
        <Book
          key={book.id}
          book={book}
          cart={cart}
          setCart={setCart}
          books={books}
        />
      ))}

      <section className="container">
        <section className="container__header">
          <div className="container__header__menu">
            <button className="container__header__menu--button"></button>
          </div>

          <div className="container__header__title">
            <h3 className="container__header__title--text">book</h3>
          </div>

          <div className="container__header__cartDiv">
            <Cart cart={cart} setCart={setCart} />
          </div>
        </section>

        <section>
          <h3>Books</h3>
          {books.map((book) => (
            <Book
              key={book.id}
              book={book}
              cart={cart}
              setCart={setCart}
              books={books}
            />

          ))}
        </section>
      </section>

    </Fragment>
  );
}

export default App;
