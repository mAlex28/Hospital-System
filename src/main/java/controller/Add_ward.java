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
import model.Ward;

/**
 *
 * @author alex
 */
public class Add_ward extends HttpServlet {

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
                PrintWriter out = response.getWriter();
        processRequest(request, response);

        String pname = request.getParameter("patient");
        String wname = request.getParameter("ward");
        String adate = request.getParameter("dadmit");
         String status = request.getParameter("status");

        Ward ward = new Ward();
        ward.setPatient_id(pname);
        ward.setWard_id(wname);
        ward.setAdate(adate);
        ward.setStatus(status);

        if (ward.addToWard()) {
            request.setAttribute("status", "<div class='alert alert-primary' role='alert'>Patient added to the ward</div>");
            RequestDispatcher req = request.getRequestDispatcher("add_ward.jsp");
            req.include(request, response);
        } else {
            request.setAttribute("status", "<div class='alert alert-danger' role='alert'>Error occured</div>");
            RequestDispatcher req = request.getRequestDispatcher("add_ward.jsp");
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
