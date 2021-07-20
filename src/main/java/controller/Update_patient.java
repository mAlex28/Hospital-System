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
import javax.servlet.http.HttpSession;
import model.Patient;

/**
 *
 * @author alex
 */
public class Update_patient extends HttpServlet {

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
        
        Patient pat = new Patient();
        
        pat.setId(request.getParameter("id"));
        pat.setFname(request.getParameter("fname"));
        pat.setLname(request.getParameter("lname"));
        pat.setAge(Integer.parseInt(request.getParameter("age")));
        pat.setGender(request.getParameter("gender"));
        pat.setMartial_status(request.getParameter("martial_status"));
    
        try {
            pat.setDob(new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dob")).getTime()));
        } catch (ParseException ex) {
            Logger.getLogger(Update_patient.class.getName()).log(Level.SEVERE, null, ex);
        }
        pat.setPhone(Integer.parseInt(request.getParameter("phone")));
        pat.setAddress(request.getParameter("address"));
        pat.setCity(request.getParameter("city"));
         
 
        if (pat.updatePatient()) {
//            out.println("Success!");
            request.setAttribute("status", "<div class='alert alert-primary' role='alert'>Successfully updated</div>");
            RequestDispatcher req = request.getRequestDispatcher("patient.jsp");
            req.include(request, response);   
            
        } else {
//            out.println("Fail!");
            request.setAttribute("status", "<div class='alert alert-danger' role='alert'>Phone number already exists</div>");
            RequestDispatcher req = request.getRequestDispatcher("patient.jsp");
            req.include(request, response);
//            response.sendRedirect("patient.jsp");
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
