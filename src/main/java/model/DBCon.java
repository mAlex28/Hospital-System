/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author alex
 */
public class DBCon {

    public Connection createConnection() throws ClassNotFoundException, SQLException, URISyntaxException {
       Class.forName("com.mysql.jdbc.Driver");

       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/care_and_cure", "root", "");
       return con;

        
        
       

    }
}
