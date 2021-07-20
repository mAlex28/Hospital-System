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
public class Payment {

    DBCon con = new DBCon();

    private String payid;
    private String type;
    private String invoice;
    private String amount;

    public String getPayid() {
        return payid;
    }

    public void setPayid(String payid) {
        this.payid = payid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getInvoice() {
        return invoice;
    }

    public void setInvoice(String invoice) {
        this.invoice = invoice;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public boolean payFees() {
        int x = 0;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into payment(payment_type, invoice_no, amount) values (?, ?, ?)");
            ps.setString(1, this.type);
            ps.setString(2, this.invoice);
            ps.setString(3, this.amount);

            x = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return x == 1;
    }
    
        public ResultSet getAllPayments() {
        ResultSet rs = null;

        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from payment");
            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }
}
