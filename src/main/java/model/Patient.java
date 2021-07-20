/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

// patient bean class

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Patient {
    
    DBCon con = new DBCon();
    
    private String id;
    private String fname;
    private String lname;
    private int age;
    private String gender;
    private String martial_status;
    private Date dob;
    private String address;    
    private String city;
    private int phone; 
     String search = null;

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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getMartial_status() {
        return martial_status;
    }

    public void setMartial_status(String martial_status) {
        this.martial_status = martial_status;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }
    
    public boolean registerPatient() {
        int x = 0;
        
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into patient(fname, lname, age, gender, martial_status, dob, address, city, phone_no) values (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, this.fname);
            ps.setString(2, this.lname);
            ps.setInt(3, this.age);
            ps.setString(4, this.gender);
            ps.setString(5, this.martial_status);
            ps.setDate(6, this.dob);
            ps.setString(7, this.address);
            ps.setString(8, this.city);
            ps.setInt(9, this.phone);
                
            x = ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return x == 1;
    }
    
        public ResultSet getAllPatient() {
        ResultSet rs = null;
        
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from patient");
            rs = ps.executeQuery();
            
                
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return rs;        
    }
        
        
           public boolean deletePatient() {
        int x = 0;
        
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("delete from patient where patient_id = ?");
            ps.setString(1, this.id);
                
            x = ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return x == 1;     
    }
           
          
     public boolean updatePatient() {
        int x = 0;
        
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("update patient set fname = ?, lname = ?, age = ?, gender = ?, martial_status = ?, dob = ?, address = ?, city = ?, phone_no = ? where patient_id = ?");
            ps.setString(1, this.fname);
            ps.setString(2, this.lname);
            ps.setInt(3, this.age);
            ps.setString(4, this.gender);
            ps.setString(5, this.martial_status);
            ps.setDate(6, this.dob);
            ps.setString(7, this.address);
            ps.setString(8, this.city);
            ps.setInt(9, this.phone);
            ps.setString(10, this.id);
                
            x = ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return x == 1;     
    }
}
