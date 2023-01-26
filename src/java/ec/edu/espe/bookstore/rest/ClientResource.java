/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/GenericResource.java to edit this template
 */
package ec.edu.espe.bookstore.rest;

import ec.edu.espe.bookstore.controller.MongoDBManager;
import ec.edu.espe.bookstore.model.Book;
import ec.edu.espe.bookstore.model.Client;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author erick
 */
@Path("clients")
public class ClientResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of ClientResource
     */
    public ClientResource() {
    }
    MongoDBManager client = new MongoDBManager();
    ArrayList<Object> list = new ArrayList<>();
    
    /**
     * Retrieves representation of an instance of ec.edu.espe.bookstore.rest.ClientResource
     * @return an instance of java.lang.String
     */
    
    @GET
    @Path("listClients")
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList listBooks() {
        
        try {
            list = client.getClient();

        } catch (Exception e) {
            System.out.println("<p>Error en MONGODB</p>");
        }
        return list;
    }

    /**
     * PUT method for updating or creating an instance of ClientResource
     * @param content representation for the resource
     */
    @PUT
    @Path("updateClient/{ci}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Client putJson(@PathParam("ci") String ci, Client cli) {
        Client resp = new Client();
        try {
            resp = client.updateClient(ci, cli);
        } catch (Exception e) {
            System.out.println("<p>Error en MONGODB</p>");
        }
        return resp;
    }
    
    @GET
    @Path("client/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Client buscar(@PathParam("id") String id) {
        Client resp = new Client();
        try {
            resp = client.getClient(id);
        } catch (Exception e) {
            System.out.println("<p>Error en MONGODB</p>");
        }
        return resp;
    }
    
    @DELETE
    @Path("delete/{ci}")
    @Produces(MediaType.APPLICATION_JSON)
    public Client delete(@PathParam("ci") String ci) {
        MongoDBManager cliDele = new MongoDBManager(); 
        Client cDeleted = new Client();
        try{
            cDeleted = cliDele.deleteClient(ci);
        }catch (Exception e){
            System.out.println("<p>Error en MONGODB</p>");
        }
        return cDeleted;
    }
    
    @POST
    @Path("addClient")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Client guardar(Client c) {

        MongoDBManager clientDB = new MongoDBManager();
        try {
            clientDB.addClient(c);
        } catch (Exception e) {
            System.out.println("<p>Error en MONGODB</p>");
        }
        return c;
    }
}
