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
public class Admin_add_appointments extends HttpServlet {

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
        
        String docid = request.getParameter("did");
        String patid = request.getParameter("patname");
        String date = request.getParameter("schdate");
        String time = request.getParameter("aptime");        
        String schid = request.getParameter("schid");
        String status = request.getParameter("status");
        
        Appointments app = new Appointments();
        app.setDoc_id(docid);
        app.setPat_id(patid);
        app.setDate(date);
        app.setTime(time);
        app.setSch_id(schid);
        app.setStatus(status);
        
         if (app.addAppointment()) {
            request.setAttribute("status", "<div class='alert alert-primary' role='alert'>Appointment Added</div>");
            RequestDispatcher req = request.getRequestDispatcher("admin_appointment.jsp");
            req.include(request, response);
        } else { 
            request.setAttribute("status", "<div class='alert alert-danger' role='alert'>Error! Please re-try</div>");
            RequestDispatcher req = request.getRequestDispatcher("admin_appointment.jsp");
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
