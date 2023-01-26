/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/GenericResource.java to edit this template
 */
package ec.edu.espe.bookstore.rest;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.client.MongoCollection;
import ec.edu.espe.bookstore.model.Book;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import ec.edu.espe.bookstore.controller.MongoDBManager;
import ec.edu.espe.bookstore.model.Invoice;
import javax.ws.rs.DELETE;
import org.bson.conversions.Bson;

/**
 * REST Web Service
 *
 * @author aizen
 */
@Path("books")
public class BooksResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of BooksResource
     */
    public BooksResource() {
    }

    private List<Book> list = new ArrayList<>();
    ArrayList<Object> listBooks = new ArrayList<Object>();

    /**
     * Retrieves representation of an instance of
     * ec.edu.espe.bookstore.rest.BooksResource
     *
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson() {
        //TODO return proper representation object
        throw new UnsupportedOperationException();
    }

    @GET
    @Path("listBooks")
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList listBooks() {
        MongoDBManager books = new MongoDBManager();
        try {
            listBooks = books.getBook();

        } catch (Exception e) {
            System.out.println("<p>Error en MONGODB</p>");
        }
        return listBooks;
    }

    /**
     * PUT method for updating or creating an instance of BooksResource
     *
     * @param content representation for the resource
     */
    @PUT
    @Path("updateBook/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Book updateBooks(@PathParam("id") String id, Book book) {
        Book resp = new Book();
        MongoDBManager mongo = new MongoDBManager();
        try {
            resp = mongo.updateBook(id, book);
        } catch (Exception e) {
            System.out.println("<p>Error en MONGODB</p>");
        }
        return resp;
    }

    @POST
    @Path("addBook")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public List<Book> guardar(Book b) {

        MongoDBManager books = new MongoDBManager();
        try {
            books.addBook(b.getId(), b.getName(), b.getAuthor(), b.getEditorial(), b.getGender(), b.getPrice(), b.getDescription(), b.getImage());

        } catch (Exception e) {
            System.out.println("<p>Error en MONGODB</p>");
        }

        list.add(b);
        return list;
    }
    
    //Buscar libros por ID
    @GET
    @Path("search/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Book buscar(@PathParam("id") String id) {
        Book resp = new Book();
        try{
            MongoDBManager books = new MongoDBManager();
            resp = books.getBook(id);
        }catch(Exception e){
            System.out.println("<p>Error en MONGODB</p>");
        }
        return resp;
    }

    @GET
    @Path("editorial/{editorial}")
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList<Object> buscarEditorial(@PathParam("editorial") String editorial) {
        Book resp = new Book();
        ArrayList<Object> listEditorial = new ArrayList<Object>();
        MongoDBManager mongo = new MongoDBManager();
        
        ArrayList<Book> books = mongo.getBook();
        for (Book b : books) {
            if (editorial.equals(b.getEditorial())) {
                resp.setId(b.getId());
                resp.setName(b.getName());
                resp.setAuthor(b.getAuthor());
                resp.setEditorial(b.getEditorial());
                resp.setGender(b.getGender());
                resp.setPrice(b.getPrice());
                listEditorial.add(b);
            }
            
        }
        return listEditorial;
    }
    
    @GET
    @Path("category/{category}")
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList<Object> searchBooksByCategory(@PathParam("category") String category) {
        Book resp = new Book();
        ArrayList<Object> booksCategories = new ArrayList<Object>();
        MongoDBManager mongo = new MongoDBManager();
        
        ArrayList<Book> books = mongo.getBook();
        for (Book b : books) {
            if (category.equals(b.getGender())) {
                resp.setId(b.getId());
                resp.setName(b.getName());
                resp.setAuthor(b.getAuthor());
                resp.setEditorial(b.getEditorial());
                resp.setGender(b.getGender());
                resp.setPrice(b.getPrice());
                booksCategories.add(b);
            }
            
        }
        return booksCategories;
    }

    @DELETE
    @Path("delete/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Book delete(@PathParam("id") String id) {
        MongoDBManager booksUpdate = new MongoDBManager();
        Book deletedBook = new Book();
        try{
            deletedBook = booksUpdate.deleteBook(id);
        }catch (Exception e){
            System.out.println("<p>Error en MONGODB</p>");
        }
        return deletedBook;
    }

    @POST
    @Path("buy/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Invoice buy(@PathParam("id") String id) {
        MongoDBManager invoice = new MongoDBManager();
        Invoice i = new Invoice();
        try {
            i = invoice.buy(id);

        } catch (Exception e) {
            System.out.println("<p>Error en MONGODB</p>");
        }
        return i;
    }
}
