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
public class Ward {

    DBCon con = new DBCon();

    private String id;
    private String ward_id;
     private String ward_name;
    private String patient_id;
    private String adate;
    private String rdate;
    private String status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getWard_id() {
        return ward_id;
    }

    public void setWard_id(String ward_id) {
        this.ward_id = ward_id;
    }

    public String getAdate() {
        return adate;
    }

    public void setAdate(String adate) {
        this.adate = adate;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }

    public String getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(String patient_id) {
        this.patient_id = patient_id;
    }

    public boolean addToWard() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into allocate_wards(pat_no, ward_no, admit_date, status) values (?, ?, ?, ?)");
            ps.setString(1, this.patient_id);
            ps.setString(2, this.ward_id);
            ps.setString(3, this.adate);
            ps.setString(4, this.status);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }
    
     public boolean addToWardAdmin() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into wards(ward_name) values (?)");
            ps.setString(1, this.ward_name);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }

    public String getWard_name() {
        return ward_name;
    }

    public void setWard_name(String ward_name) {
        this.ward_name = ward_name;
    }

    public ResultSet getAllWardPatients() {
        ResultSet rs = null;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from allocate_wards");
            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }
    
     public ResultSet getAllWards() {
        ResultSet rs = null;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from wards");
            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public boolean updateWard() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("update allocate_wards set pat_no = ?, ward_no = ?, admit_date = ?, release_date = ?, status = ? where id = ?");
            ps.setString(1, this.patient_id);
            ps.setString(2, this.ward_id);
            ps.setString(3, this.adate);
            ps.setString(4, this.rdate);
            ps.setString(5, this.status);
            ps.setString(6, this.id);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }

    public boolean deleteWard() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("delete from allocate_wards where id = ?");
            ps.setString(1, this.id);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }
    
        public boolean deleteWardAdmin() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("delete from wards where ward_id = ?");
            ps.setString(1, this.ward_id);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }
}
