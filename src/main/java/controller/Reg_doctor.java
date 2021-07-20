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
public class Reg_doctor extends HttpServlet {

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
        
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String degree = request.getParameter("degree");
        String department = request.getParameter("department");
        String phoneno = request.getParameter("contact");
        int contact = Integer.parseInt(phoneno);
        String address = request.getParameter("address");
        String fee = request.getParameter("fees");
        int fees = Integer.parseInt(fee);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
//        int hashpass = password.hashCode() ;
        
        Doctor doc = new Doctor();
        doc.setFname(fname);
        doc.setLname(lname);
        doc.setEmail(email);
        doc.setGender(gender);
        doc.setDegree(degree);
        doc.setDepartment(department);
        doc.setContact(contact);
        doc.setAddress(address);
        doc.setFees(fees);
        doc.setUsername(username);
        doc.setPassword(password);
        
        
        if (doc.registerDoctor()) {
//            out.println("Registration Success");
            request.setAttribute("status", "<div class='alert alert-primary' role='alert'>Doctor registered</div>");
            RequestDispatcher req = request.getRequestDispatcher("add_doctor.jsp");
            req.include(request, response);
        } else {
//            out.println("Registration Failed!");
            request.setAttribute("status", "<div class='alert alert-danger' role='alert'>Username already exists</div>");
            RequestDispatcher req = request.getRequestDispatcher("add_doctor.jsp");
            req.include(request, response);
        }
//        response.sendRedirect("doctor.jsp");
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
