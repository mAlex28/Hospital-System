/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Patient;

/**
 *
 * @author alex
 */
public class Reg_patient extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");     
            PrintWriter out = response.getWriter();
            processRequest(request, response);
             
        try {
            
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            
            String ages = request.getParameter("age");
            int age = Integer.parseInt(ages);
            
            String gender = request.getParameter("gender");
            String martial_status = request.getParameter("martial_status");
            
            java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dob"));
            
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            
            String phoneno = request.getParameter("phone");           
            int phone = Integer.parseInt(phoneno);
            
            Patient pat = new Patient();
            pat.setFname(fname);
            pat.setLname(lname);
            pat.setAge(age);
            pat.setGender(gender);
            pat.setMartial_status(martial_status);
            pat.setDob(new java.sql.Date(date.getTime()));
            pat.setAddress(address);
            pat.setCity(city);
            pat.setPhone(phone);
                      
            if (pat.registerPatient()) {         
//                out.println("Success!");
                request.setAttribute("status", "<div class='alert alert-primary' role='alert'>Patient Added</div>");
                RequestDispatcher req = request.getRequestDispatcher("add_patient.jsp");
                req.include(request, response);
//                response.sendRedirect("add_patient.jsp");
                
            } else {
//                out.println("Fail!");
                request.setAttribute("status", "<div class='alert alert-danger' role='alert'>Phone no already exist</div>");
                RequestDispatcher req = request.getRequestDispatcher("add_patient.jsp");
                req.include(request, response);
//                response.sendRedirect("add_patient.jsp");
            }
            
//            response.sendRedirect("add_patient.jsp");
            
            
        } catch (ParseException ex) {
            Logger.getLogger(Reg_patient.class.getName()).log(Level.SEVERE, null, ex);
        }
            
   
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
