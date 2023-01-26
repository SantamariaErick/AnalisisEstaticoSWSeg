import React from "react"
import Book from "./Book"
import './cart.css'

const Cart = ({cart, setCart}) => {
    
    return(
        <div className="cart">
            <h3>Shopping Cart</h3>
            {cart.length === 0 ? (
            <p>No hay nada por aquí...</p>
        ) : (
            cart.map((book) => (
            <Book
                key={book.id}
                book={book}
                cart={cart}
                setCart={setCart}
            />
            ))
        )}

    </div>
    )
}
export default Cart;