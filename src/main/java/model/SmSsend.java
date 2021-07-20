/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

//import com.teknikindustries.bulksms.SMS;

public class SmSsend {
    
    private String patname;
    private String phoneno = "94770579146";
    private String date;
    private String time;
    
    private String url;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    private String username;
    private String password;
    private String msg;

    public String getPatname() {
        return patname;
    }

    public void setPatname(String patname) {
        this.patname = patname;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
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

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

//    public void sendSms() {
//        url = "enter bulk sms url here";
//        username = "alecfrench";
//        password = "kd!$R6XxTTCHjX9";
//        msg = "Dear Customer,\n Your appointment with Care & Cure Hospital is on" + date + ",+" + time;
//                   
//        SMS Smstus = new SMS();
//        Smstus.SendSMS(username, password, msg, phoneno, url);
//        
//    }
}
