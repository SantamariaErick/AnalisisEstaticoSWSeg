/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.espe.bookstore.model;

/**
 *
 * @author aizen
 */
public class Client {
    private String firstname;
    private String lastname;
    private String email;
    private String ci;
    private String birthDate;
    private String telephone;
    private String cellphone;
    private String username;
    private String pass;
    private String level;

    public Client() {
    
    }
    
    public Client(String firstname, String lastname, String email, String ci, String birthDate, String telephone, String cellphone, String username, String pass) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.ci = ci;
        this.birthDate = birthDate;
        this.telephone = telephone;
        this.cellphone = cellphone;
        this.username = username;
        this.pass = pass;
    }

    public Client(String firstname, String lastname, String email, String ci, String birthDate, String telephone, String cellphone, String username, String pass, String level) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.ci = ci;
        this.birthDate = birthDate;
        this.telephone = telephone;
        this.cellphone = cellphone;
        this.username = username;
        this.pass = pass;
        this.level = level;
    }

    
    /**
     * @return the firstname
     */
    public String getFirstname() {
        return firstname;
    }

    /**
     * @param firstname the firstname to set
     */
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    /**
     * @return the lastname
     */
    public String getLastname() {
        return lastname;
    }

    /**
     * @param lastname the lastname to set
     */
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the ci
     */
    public String getCi() {
        return ci;
    }

    /**
     * @param ci the ci to set
     */
    public void setCi(String ci) {
        this.ci = ci;
    }

    /**
     * @return the birthDate
     */
    public String getBirthDate() {
        return birthDate;
    }

    /**
     * @param birthDate the birthDate to set
     */
    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    /**
     * @return the telephone
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * @param telephone the telephone to set
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    /**
     * @return the cellphone
     */
    public String getCellphone() {
        return cellphone;
    }

    /**
     * @param cellphone the cellphone to set
     */
    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the pass
     */
    public String getPass() {
        return pass;
    }

    /**
     * @param pass the pass to set
     */
    public void setPass(String pass) {
        this.pass = pass;
    }

    /**
     * @return the level
     */
    public String getLevel() {
        return level;
    }

    /**
     * @param level the level to set
     */
    public void setLevel(String level) {
        this.level = level;
    }

    @Override
    public String toString() {
        return "Client{" + "firstname=" + firstname + ", lastname=" + lastname + ", email=" + email + ", ci=" + ci + ", birthDate=" + birthDate + ", telephone=" + telephone + ", cellphone=" + cellphone + ", username=" + username + ", pass=" + pass + ", level=" + level + '}';
    }


    
}
