/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author alex
 */
public class Contact {
    
    DBCon con = new DBCon();
    
    private String name;
    private String email;
    private String subject;
    private String message;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
     public boolean sendContactMsg() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into contacts(name, email, subject, message) values (?, ?, ?, ?)");
            ps.setString(1, this.name);
            ps.setString(2, this.email);
            ps.setString(3, this.subject);
            ps.setString(4, this.message);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }
     
     
    public ResultSet getAllContacts() {
        ResultSet rs = null;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from contacts");
            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }
    
}
