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
public class Admin {

    DBCon con = new DBCon();

    private String id;
    private String username;
    private String password;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean verifyAdmin() {
        boolean verified = false;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from admin where admin_name = ?");
            ps.setString(1, this.username);
            ResultSet rs = ps.executeQuery();

            if (rs.next() && this.password.equals(rs.getString("password"))) {
                verified = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return verified;
    }

    public boolean updateUser() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("update admin set admin_name = ?, password = ? where admin_name = ?");
            ps.setString(1, this.username);
            ps.setString(2, this.password);
            ps.setString(3, this.username);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }
}
