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
import model.Doctor;

/**
 *
 * @author alex
 */
public class Doc_update_doctor extends HttpServlet {

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
       
        PrintWriter out = response.getWriter();
        processRequest(request, response);
        
        Doctor doc = new Doctor();
        
        doc.setFname(request.getParameter("fname"));
        doc.setLname(request.getParameter("lname"));
        doc.setEmail(request.getParameter("email"));      
        doc.setGender(request.getParameter("gender"));
        doc.setDegree(request.getParameter("degree"));
        doc.setDepartment(request.getParameter("department"));
        doc.setContact(Integer.parseInt(request.getParameter("contact")));
        doc.setAddress(request.getParameter("address"));
        doc.setFees(Integer.parseInt(request.getParameter("fees")));
        doc.setUsername(request.getParameter("username"));
    
 
        if (doc.updateDoctorWithUsername()) {
            request.setAttribute("status", "<div class='alert alert-primary' role='alert'>Doctor updated</div>");
            RequestDispatcher req = request.getRequestDispatcher("doc_profile.jsp");
            req.include(request, response);
        } else {
            request.setAttribute("status", "<div class='alert alert-danger' role='alert'>Username already exists</div>");
            RequestDispatcher req = request.getRequestDispatcher("doc_profile.jsp");
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
