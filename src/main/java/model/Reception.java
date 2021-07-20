/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

// reception bean class
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Reception {

    DBCon con = new DBCon();

    private String id;
    private String fname;
    private String lname;
    private String username;
    private String password;
    private String email;
    private String phone;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean registerReception() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into reg_reception(fname, lname, email, phone_no, username, password) values (?, ?, ?, ?, ?,?)");
            ps.setString(1, this.fname);
            ps.setString(2, this.lname);
            ps.setString(3, this.email);
            ps.setString(4, this.phone);
            ps.setString(5, this.username);
            ps.setString(6, this.password);

            x = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;

    }

    public boolean verifyReception() {
        boolean verified = false;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from reg_reception where username = ?");
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
            PreparedStatement ps = con.createConnection().prepareStatement("update reg_reception set fname = ?, lname = ?, email = ?, phone_no = ?, username = ? where username = ?");
            ps.setString(1, this.fname);
            ps.setString(2, this.lname);
            ps.setString(3, this.email);
            ps.setString(4, this.phone);
            ps.setString(5, this.username);
            ps.setString(6, this.username);
//            ps.setString(6, this.id);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }

    public boolean resetPassword() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("update reg_reception set password = ? where username = ?");
            ps.setString(1, this.password);
            ps.setString(2, this.username);

            x = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }

    public ResultSet getAllReception() {
        ResultSet rs = null;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from reg_reception");
            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public boolean deleteReception() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("delete from reg_reception where recep_id = ?");
            ps.setString(1, this.id);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }

}
