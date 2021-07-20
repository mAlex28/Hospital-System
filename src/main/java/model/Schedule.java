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
public class Schedule {

    DBCon con = new DBCon();

    private String id;
    private String docname;
    private String scheduledate;
    private String starttime;
    private String endtime;
    private String consulting;
    private String status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDocname() {
        return docname;
    }

    public void setDocname(String docname) {
        this.docname = docname;
    }

    public String getScheduledate() {
        return scheduledate;
    }

    public void setScheduledate(String scheduledate) {
        this.scheduledate = scheduledate;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getConsulting() {
        return consulting;
    }

    public void setConsulting(String consulting) {
        this.consulting = consulting;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean scheduleDoctor() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into doctor_shedule(doc_id, shedule_date, start_time, end_time, consulting_time, shedule_status) values (?, ?, ?, ?, ?, ?)");
            ps.setString(1, this.docname);
            ps.setString(2, this.scheduledate);
            ps.setString(3, this.starttime);
            ps.setString(4, this.endtime);
            ps.setString(5, this.consulting);
            ps.setString(6, this.status);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }

    public ResultSet getAllSchedule() {
        ResultSet rs = null;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor_shedule order by shedule_date desc");
            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public boolean updateSchedule() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("update doctor_shedule set doc_id = ?, shedule_date = ?, start_time = ?, end_time = ?, consulting_time = ?, shedule_status = ? where shedule_id = ?");
            ps.setString(1, this.docname);
            ps.setString(2, this.scheduledate);
            ps.setString(3, this.starttime);
            ps.setString(4, this.endtime);
            ps.setString(5, this.consulting);
            ps.setString(6, this.status);
            ps.setString(7, this.id);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }

    public boolean deleteSchedule() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("delete doctor_shedule, appointments from doctor_shedule inner join appointments on appointments.shedule_id = doctor_shedule.shedule_id where doctor_shedule.shedule_id = ?");
            ps.setString(1, this.id);

            x = ps.executeUpdate();
 
        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }
    
     public boolean deleteScheduleWithoutApp() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("delete from doctor_shedule where shedule_id = ?");
            ps.setString(1, this.id);

            x = ps.executeUpdate();
 
        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }
    
    public boolean changeStatus() {
         int x = 0;
         
         try {
             PreparedStatement ps = con.createConnection().prepareStatement("UPDATE doctor_shedule SET shedule_status = ? Where shedule_id = ?");
             ps.setString(1, status);
             ps.setString(2, id);
             
              x = ps.executeUpdate();
             
         } catch (Exception e) {
            e.printStackTrace();
        }
         
         return x == 1;
    }
    
    public ResultSet viewAvailableSchedule() {
        ResultSet rs = null;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor_shedule where doc_id = ? and schedule_date = ?");
           
            ps.setString(1, this.docname);
             ps.setString(2, this.scheduledate);
            
            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }
}
