/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.espe.bookstore.model;

/**
 *
 * @author PC
 */
public class Invoice {
    private String name_book;
    private String price;
    private String subtotal;
    private String iva12;
    private String total;

    public Invoice() {
    }

    public Invoice(String name_book, String price, String subtotal, String iva12, String total) {
        this.name_book = name_book;
        this.price = price;
        this.subtotal = subtotal;
        this.iva12 = iva12;
        this.total = total;
    }

    /**
     * @return the name_book
     */
    public String getName_book() {
        return name_book;
    }

    /**
     * @param name_book the name_book to set
     */
    public void setName_book(String name_book) {
        this.name_book = name_book;
    }

    /**
     * @return the price
     */
    public String getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(String price) {
        this.price = price;
    }

    /**
     * @return the subtotal
     */
    public String getSubtotal() {
        return subtotal;
    }

    /**
     * @param subtotal the subtotal to set
     */
    public void setSubtotal(String subtotal) {
        this.subtotal = subtotal;
    }

    /**
     * @return the iva12
     */
    public String getIva12() {
        return iva12;
    }

    /**
     * @param iva12 the iva12 to set
     */
    public void setIva12(String iva12) {
        this.iva12 = iva12;
    }

    /**
     * @return the total
     */
    public String getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(String total) {
        this.total = total;
    }

    
    
}
