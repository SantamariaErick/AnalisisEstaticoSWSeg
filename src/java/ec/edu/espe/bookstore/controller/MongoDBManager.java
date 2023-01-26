/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.espe.bookstore.controller;

import com.mongodb.BasicDBObject;
import com.mongodb.ConnectionString;
import com.mongodb.DBObject;
import com.mongodb.MongoClientSettings;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import ec.edu.espe.bookstore.model.Book;
import ec.edu.espe.bookstore.model.Client;
import static java.lang.Float.parseFloat;
import static java.lang.System.out;
import java.util.ArrayList;
import org.bson.Document;
import org.bson.conversions.Bson;
import com.mongodb.DBCollection;
import ec.edu.espe.bookstore.model.Invoice;
import java.util.Objects;

/**
 *
 * @author aizen
 */
public class MongoDBManager {
    //////////////esta parte creo que no es de presentar todavia, pero ya esta la estructura

    //aqui pongan el link de cluster//
    ConnectionString connectionString = new ConnectionString("mongodb+srv://Kgsuntaxi:angelbeats@clasica.bdcuq.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");
    //
    MongoClientSettings settings = MongoClientSettings.builder()
            .applyConnectionString(connectionString)
            .build();
    MongoClient mongoClient = MongoClients.create(settings);

    //aqui pongan el nombre de la base de datos//
    MongoDatabase database = mongoClient.getDatabase("Clasica");
    //

    //aqui pongan el nombre de su collecion para insertar y recuperar libros
    public MongoCollection getCollecBook() {
        MongoCollection<Document> bookDB = database.getCollection("Books");
        return bookDB;
    }

    public MongoCollection getColleClient() {
        MongoCollection<Document> clientCollec = database.getCollection("Clients");
        return clientCollec;
    }

    //aqui pongan el nombre de su collecion para insertar y recuperar clientes
    //MongoCollection<Document> clientDB = new MongoDBManager().obtenerDB().getCollection("");
    public MongoDatabase obtenerDB() {
        return database;
    }

    public void addBook(String id, String name, String author, String editorial, String gender, Float price, String description, String image) {
        MongoCollection<Document> bookDB = new MongoDBManager().obtenerDB().getCollection("Books");
        Document data = new Document();
        data.put("id", id);
        data.put("name", name);
        data.put("author", author);
        data.put("editorial", editorial);
        data.put("gender", gender);
        data.put("price", price);
        data.put("description", description);
        data.put("image", image);

        bookDB.insertOne(data);
    }

    public Book deleteBook(String idDelete) {
        MongoCollection<Document> bookDB = new MongoDBManager().obtenerDB().getCollection("Books");
        Document data = new Document();
        Book deleBook = getBook(idDelete);
        data.put("id", idDelete);
        bookDB.deleteOne(data);
        return deleBook;
    }

    //Obtencion de datos e insercion en un objeto Book
    public ArrayList getBook() {
        MongoCollection<Document> bookDB = new MongoDBManager().obtenerDB().getCollection("Books");
        MongoCursor<Document> getBook = bookDB.find().iterator();
        ArrayList<Book> doc = new ArrayList<Book>();

        while (getBook.hasNext()) {
            Book book = new Book();
            Document dbObject = getBook.next();
            book.setId(dbObject.get("id").toString());
            book.setName(dbObject.get("name").toString());
            book.setAuthor(dbObject.get("author").toString());
            book.setEditorial(dbObject.get("editorial").toString());
            book.setGender(dbObject.get("gender").toString());
            book.setPrice(parseFloat(dbObject.get("price").toString()));
            book.setDescription(dbObject.get("description").toString());
            book.setImage(dbObject.get("image").toString());
            doc.add(book);
        }
        return doc;
    }

    public void addClient(Client client) {
        MongoCollection<Document> clientDB = new MongoDBManager().obtenerDB().getCollection("Clients");
        String firstname = client.getFirstname();
        String lastname = client.getLastname();
        String email = client.getEmail();
        String ci = client.getCi();
        String birthDate = client.getBirthDate();
        String telephone = client.getTelephone();
        String cellphone = client.getCellphone();
        String level = client.getLevel();
        String username = client.getUsername();
        String pass = client.getPass();

        Document data = new Document();
        data.put("firstname", firstname);
        data.put("lastname", lastname);
        data.put("email", email);
        data.put("ci", ci);
        data.put("birthDate", birthDate);
        data.put("telephone", telephone);
        data.put("cellphone", cellphone);
        data.put("level", level);
        data.put("username", username);
        data.put("pass", pass);

        clientDB.insertOne(data);
    }

    public Book getBook(String id) {
        Book resp = new Book();
        MongoDBManager mongo = new MongoDBManager();
        ArrayList<Book> books = mongo.getBook();
        for (Book b : books) {
            if (id.equals(b.getId())) {
                resp = new Book(b.getId(), b.getName(), b.getAuthor(), b.getEditorial(), b.getGender(), b.getPrice(), b.getDescription(), b.getImage());
            }
        }
        return resp;
    }

    public Book updateBook(String id, Book book) {
        MongoCollection colec = getCollecBook();
        Document data = new Document();
        data.put("id", book.getId());
        data.put("name", book.getName());
        data.put("author", book.getAuthor());
        data.put("editorial", book.getEditorial());
        data.put("gender", book.getGender());
        data.put("price", book.getPrice());
        data.put("description", book.getDescription());
        data.put("image", book.getImage());
        BasicDBObject searchID = new BasicDBObject();
        searchID.append("id", id);
        BasicDBObject updateoperation = new BasicDBObject("$set",data);
        try {
            colec.updateOne(searchID, updateoperation);
        } catch (Exception e) {
            out.println("Error en MongoDB");
        }
        return book;
    }

    public Client updateClient(String ci, Client cli) {
        MongoCollection colec = getColleClient();
        Document data = new Document();
        data.put("firstname", cli.getFirstname());
        data.put("lastname", cli.getLastname());
        data.put("email", cli.getEmail());
        data.put("ci", cli.getCi());
        data.put("birthDate", cli.getBirthDate());
        data.put("telephone", cli.getTelephone());
        data.put("cellphone", cli.getCellphone());
        data.put("level", cli.getLevel());
        data.put("username", cli.getUsername());
        data.put("pass", cli.getPass());
        BasicDBObject searchCI = new BasicDBObject();
        searchCI.append("ci", ci);
        BasicDBObject updateoperation = new BasicDBObject("$set",data);
        try{
            colec.updateOne(searchCI, updateoperation);
        }catch(Exception e){
            out.println("Error en MongoDB");
        }
        
        return cli;
    }

    //Obtencion de datos e insercion en un objeto Client
    public ArrayList getClient() {
        MongoCollection<Document> clientDB = new MongoDBManager().obtenerDB().getCollection("Clients");
        MongoCursor<Document> getClient = clientDB.find().iterator();
        ArrayList<Client> doc = new ArrayList<Client>();

        while (getClient.hasNext()) {
            Client client = new Client();
            Document dbObject = getClient.next();
            client = new Client(dbObject.get("firstname").toString(), dbObject.get("lastname").toString(),
                    dbObject.get("email").toString(), dbObject.get("ci").toString(), dbObject.get("birthDate").toString(),
                    dbObject.get("telephone").toString(), dbObject.get("cellphone").toString(), dbObject.get("username").toString(), dbObject.get("pass").toString(), dbObject.get("level").toString());
            doc.add(client);
        }
        return doc;
    }

    public Client getClient(String id) {
        Client resp = new Client();
        MongoDBManager mongo = new MongoDBManager();
        ArrayList<Client> clients = mongo.getClient();
        for (Client c : clients) {
            if (id.equals(c.getCi())) {
                resp = new Client(c.getFirstname(), c.getLastname(),
                        c.getEmail(), c.getCi(), c.getBirthDate(),
                        c.getTelephone(), c.getCellphone(), c.getUsername(), c.getPass(), c.getLevel());
            }
        }
        return resp;
    }
    
    public Client deleteClient(String ci) {
        MongoCollection<Document> cli = getColleClient();
        Document data = new Document();
        Client deleteCli = getClient(ci); 
        data.put("ci", cli);
        cli.deleteOne(data);
        return deleteCli;
    }

    public int login(String user, String pass) {
        boolean statePass = false, stateUser = false;
        Client resp = new Client();
        ArrayList<Client> clients = getClient();
        for (Client c : clients) {
            if (user.equals(c.getUsername())) {
                stateUser = true;
                if (pass.equals(c.getPass())) {
                    statePass = true;
                    resp = new Client(c.getFirstname(), c.getLastname(),
                            c.getEmail(), c.getCi(), c.getBirthDate(),
                            c.getTelephone(), c.getCellphone(), c.getUsername(), c.getPass(), c.getLevel());
                }
            }
        }
        if (!stateUser) {
            return 4;
        } else if (!statePass) {
            return 3;
        } else {
            int response = Integer.parseInt(resp.getLevel());
            return response;
        }
    }

    public Client getLoginUser(String user, String pass) {
        Client resp = new Client();
        ArrayList<Client> clients = getClient();
        for (Client c : clients) {
            if (user.equals(c.getUsername())) {
                if (pass.equals(c.getPass())) {
                    resp = new Client(c.getFirstname(), c.getLastname(),
                            c.getEmail(), c.getCi(), c.getBirthDate(),
                            c.getTelephone(), c.getCellphone(), c.getUsername(), c.getPass(), c.getLevel());
                }
            }
        }
        return resp;
    }

    public Client showData(String user) {
        Client resp = new Client();
        MongoDBManager mongo = new MongoDBManager();
        ArrayList<Client> clients = mongo.getClient();
        for (Client c : clients) {
            if (user.equals(c.getUsername())) {
                resp = new Client(c.getFirstname(), c.getLastname(),
                        c.getEmail(), c.getCi(), c.getBirthDate(),
                        c.getTelephone(), c.getCellphone(), c.getUsername(), c.getPass(), c.getLevel());
            }
        }

        return resp;
    }

    public Invoice buy(String id_product) {
        MongoCollection<Document> bookDB = new MongoDBManager().obtenerDB().getCollection("Invoice");

        MongoDBManager product = new MongoDBManager();
        product.getBook(id_product);
        String precio = product.getBook(id_product).getPrice().toString();
        String iva12 = "0.00";
        Document data = new Document();
        data.put("name_book", product.getBook(id_product).getName());
        data.put("total", precio);
        data.put("precio", precio);
        data.put("subtotal", precio);
        data.put("iva12", iva12);
        data.put("total", precio);

        Invoice i = new Invoice(product.getBook(id_product).getName(), precio, precio, iva12, precio);
        bookDB.insertOne(data);
        return i;
    }
}
