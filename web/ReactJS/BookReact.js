/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


import React from 'react'
import PropTypes from 'prop-types'

const Book = ({
  id,
  name,
  author,
  editorial,
  gender,
  price
}) => (
  <div className="single-meme">
    <p>id: {id}</p>
    <p>name: {name}</p>
    <p>author: {author}</p>
    <p>editorial: {editorial}</p>
    <p>gender: {gender}</p>
    <p>price: {price}</p>
  </div>
)

Book.propTypes = {
  id: PropTypes.string.isRequired,
  name: PropTypes.string.isRequired,
  author: PropTypes.string.isRequired,
  editorial: PropTypes.string.isRequired,
  gender: PropTypes.string.isRequired,
  price: PropTypes.string.isRequired,
}

export default Book