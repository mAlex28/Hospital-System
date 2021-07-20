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
public class Department {

    DBCon con = new DBCon();

    private String dep_id;
    private String dep_name;

    public String getDep_id() {
        return dep_id;
    }

    public void setDep_id(String dep_id) {
        this.dep_id = dep_id;
    }

    public String getDep_name() {
        return dep_name;
    }

    public void setDep_name(String dep_name) {
        this.dep_name = dep_name;
    }

    public boolean addDepartment() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into department(dep_name) values (?)");
            ps.setString(1, this.dep_name);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }

    public ResultSet getAllDepartment() {
        ResultSet rs = null;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from department");
            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public boolean deleteDepartment() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("delete from department where dep_id = ?");
            ps.setString(1, this.dep_id);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }
}
