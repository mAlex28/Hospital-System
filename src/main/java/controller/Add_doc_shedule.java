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
import model.Schedule;

/**
 *
 * @author alex
 */
public class Add_doc_shedule extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
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
        
        String docname = request.getParameter("docname");
        String shdate = request.getParameter("sheduledate");
        String stime = request.getParameter("stime");
        String etime = request.getParameter("etime");        
        String constime = request.getParameter("constime");
        String status = request.getParameter("status");
        
        Schedule sch = new Schedule();
        sch.setDocname(docname);
        sch.setScheduledate(shdate);
        sch.setStarttime(stime);
        sch.setEndtime(etime);
        sch.setConsulting(constime);
        sch.setStatus(status);
        
        if (sch.scheduleDoctor()) {
//            out.println("Registration Success");
            request.setAttribute("status", "<div class='alert alert-primary' role='alert'>Schedule Added</div>");
            RequestDispatcher req = request.getRequestDispatcher("add_schedule.jsp");
            req.include(request, response);
        } else {
//            out.println("Registration Failed!");
            request.setAttribute("status", "<div class='alert alert-danger' role='alert'>Error Occurred</div>");
            RequestDispatcher req = request.getRequestDispatcher("add_schedule.jsp");
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
