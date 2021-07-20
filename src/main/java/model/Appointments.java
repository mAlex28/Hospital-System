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
public class Appointments {

    DBCon con = new DBCon();

    private String id;
    private String pat_id;
    private String doc_id;
    private String time;
    private String date;
    private String status;
    private String sch_id;
    private String pname;
    private String age;
    private String gender;
    private String phoneno;

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSch_id() {
        return sch_id;
    }

    public void setSch_id(String sch_id) {
        this.sch_id = sch_id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPat_id() {
        return pat_id;
    }

    public void setPat_id(String pat_id) {
        this.pat_id = pat_id;
    }

    public String getDoc_id() {
        return doc_id;
    }

    public void setDoc_id(String doc_id) {
        this.doc_id = doc_id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public ResultSet getAllAppointments() {
        ResultSet rs = null;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from appointments");
            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public boolean addAppointment() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into appointments(patient_id, doctor_id, time, date, shedule_id, status) values (?, ?, ?, ?, ?, ?)");
            ps.setString(1, this.pat_id);
            ps.setString(2, this.doc_id);
            ps.setString(3, this.time);
            ps.setString(4, this.date);
            ps.setString(5, this.sch_id);
            ps.setString(6, this.status);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }

    public boolean deleteAppointment() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("delete from appointments where id = ?");
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
            PreparedStatement ps = con.createConnection().prepareStatement("update appointments set patient_id = ?, doctor_id = ?, time = ?, date = ?, shedule_id = ?, status = ? where id = ?");
            ps.setString(1, this.pat_id);
            ps.setString(2, this.doc_id);
            ps.setString(3, this.time);
            ps.setString(4, this.date);
            ps.setString(5, this.sch_id);
            ps.setString(6, this.status);
            ps.setString(7, this.id);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }

    public boolean changeStatus() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("UPDATE appointments SET status = ? Where id = ?");
            ps.setString(1, status);
            ps.setString(2, id);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }

    public boolean chanelDoctor() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into pat_chanel(sch_id, doc_id, sch_date, patient_name, age, gender, phoneno) values (?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, this.sch_id);
            ps.setString(2, this.doc_id);
            ps.setString(3, this.date);
            ps.setString(4, this.pname);
            ps.setString(5, this.age);
            ps.setString(6, this.gender);
            ps.setString(7, this.phoneno);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }

}
