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
public class Doctor {
    
    DBCon con = new DBCon();
    
    private String id;
    private String fname;
    private String lname;
    private String gender;
    private String degree;
    private String email;
    private String department;
    private int contact;
    private String address;
    private int fees;
    private String username;
    private String password;
//    private String depId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
//     public String getDepId() {
//        return depId;
//    }
//
//    public void setDepId(String depId) {
//        this.depId = depId;
//    }
    
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getContact() {
        return contact;
    }

    public void setContact(int contact) {
        this.contact = contact;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public float getFees() {
        return fees;
    }

    public void setFees(int fees) {
        this.fees = fees;
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
    
        public boolean registerDoctor() {
        int x = 0;
        
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into doctor(fname, lname, email, gender, degree, department, contact, address, fees, username, password) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, this.fname);
            ps.setString(2, this.lname);
            ps.setString(3, this.email);
            ps.setString(4, this.gender);
            ps.setString(5, this.degree);
            ps.setString(6, this.department);
            ps.setInt(7, this.contact);
            ps.setString(8, this.address);
            ps.setInt(9, this.fees);
            ps.setString(10, this.username);       
            ps.setString(11, this.password);
                
            x = ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return x == 1;
    }
        
           public boolean verifyDoctor() {
        boolean verified = false;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor where username = ?");
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
        
       public ResultSet getAllDoctor() {
        ResultSet rs = null;
        
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor");
            rs = ps.executeQuery();
            
                
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return rs;        
    }
       
        public boolean deleteDoctor() {
        int x = 0;
        
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("delete from doctor where doctor_id = ?");
            ps.setString(1, this.id);
                
            x = ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return x == 1;     
    }
        
            
    public boolean updateDoctor() {
        int x = 0;
        
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("update doctor set fname = ?, lname = ?, email = ?, gender = ?, degree = ?, department = ?, contact = ?, address =?, fees = ? , username = ? where doctor_id = ?");
            ps.setString(1, this.fname);
            ps.setString(2, this.lname);
            ps.setString(3, this.email);
            ps.setString(4, this.gender);
            ps.setString(5, this.degree);
            ps.setString(6, this.department);
            ps.setInt(7, this.contact);
            ps.setString(8, this.address);
            ps.setFloat(9, this.fees);
            ps.setString(10, this.username);
            ps.setString(11, this.id);
                
            x = ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return x == 1;     
    }
    
    public boolean updateDoctorWithUsername() {
        int x = 0;
        
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("update doctor set fname = ?, lname = ?, email = ?, gender = ?, degree = ?, department = ?, contact = ?, address =?, fees = ? , username = ? where username = ?");
            ps.setString(1, this.fname);
            ps.setString(2, this.lname);
            ps.setString(3, this.email);
            ps.setString(4, this.gender);
            ps.setString(5, this.degree);
            ps.setString(6, this.department);
            ps.setInt(7, this.contact);
            ps.setString(8, this.address);
            ps.setFloat(9, this.fees);
            ps.setString(10, this.username);
            ps.setString(11, this.username);
                
            x = ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return x == 1;     
    }
     public boolean resetPassword() {
        int x = 0;
        
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("update doctor set password = ? where username = ?");
            ps.setString(1,this.password);
            ps.setString(2, this.username);
            
       
             x = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
         
        return x == 1;     
    }
}
