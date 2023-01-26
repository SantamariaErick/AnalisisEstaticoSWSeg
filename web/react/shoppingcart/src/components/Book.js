import React from "react";


const Book = ({ book, cart, setCart, books }) => {
    const { name, id } = book;

    const addBook = (id) => {
        const book = books.filter((book) => book.id === id)
        setCart([...cart, ...book])
    }

    const delBook = (id) => {
        const books = cart.filter((book) => book.id !== id);
        setCart(books);
    };

    return (

        

        <ul className="col-sm card-body">
            <li className="card-title">{name}</li>
            <li className="card-text">${id}</li>
            {books ? (
                <button
                    type="button"
                    onClick={() => addBook(id)}
                >
                    Agregar +
                </button>
            ) : (
                <div>
                    <button
                        type="button"
                        onClick={() => delBook(id)}
                    >
                        Eliminar
                    </button>
                    <button
                        type="button"
                        onClick={() => delBook(id)}
                    >
                        Confirmar
                    </button>
                </div>
            )}
        </ul>
    );
};

export default Book 