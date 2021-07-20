/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Appointments;

/**
 *
 * @author alex
 */
public class Chanel_doctor extends HttpServlet {

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
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        
        String schid = request.getParameter("schid");
        String docid = request.getParameter("did");
        String date = request.getParameter("schdate");
        String patname = request.getParameter("fname");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");            
        String phone = request.getParameter("phoneno");
        
        Appointments app = new Appointments();
        app.setDoc_id(docid);
        app.setSch_id(schid);
        app.setDate(date);
        app.setPname(patname);
        app.setAge(age);
        app.setGender(gender);
        app.setPhoneno(phone);
        
        if (app.chanelDoctor()) {
             request.setAttribute("status", "<div class='alert alert-primary' role='alert'>Appointment Added</div>");
            RequestDispatcher req = request.getRequestDispatcher("pat_appointment.jsp");
            req.include(request, response);
        } else {
             request.setAttribute("status", "<div class='alert alert-danger' role='alert'>Error Occured</div>");
            RequestDispatcher req = request.getRequestDispatcher("pat_appointment.jsp");
            req.include(request, response);
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
