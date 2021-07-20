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
public class Update_schedule extends HttpServlet {

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
        processRequest(request, response);

        Schedule sch = new Schedule();
        sch.setId(request.getParameter("id"));
        sch.setDocname(request.getParameter("docname"));
        sch.setScheduledate(request.getParameter("sheduledate"));
        sch.setStarttime(request.getParameter("stime"));
        sch.setEndtime(request.getParameter("etime"));
        sch.setConsulting(request.getParameter("constime"));
        sch.setStatus(request.getParameter("status"));

        if (sch.updateSchedule()) {
//            out.println("Success!");
            request.setAttribute("status", "<div class='alert alert-primary' role='alert'>Schedule updated</div>");
            RequestDispatcher req = request.getRequestDispatcher("schedule.jsp");
            req.include(request, response);
        } else {
//            out.println("Fail!");
            request.setAttribute("status", "<div class='alert alert-danger' role='alert'>Error occured</div>");
            RequestDispatcher req = request.getRequestDispatcher("schedule_update.jsp");
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