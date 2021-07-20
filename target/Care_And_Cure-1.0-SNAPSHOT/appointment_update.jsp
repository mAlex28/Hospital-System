<%-- 
    Document   : appointment_update
    Created on : 12 May 2021, 23:11:08
    Author     : alex
--%>

<%@page import="model.Schedule"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DBCon"%>
<%@page import="model.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //No access if there is no session attribute
    if (session.getAttribute("username") == null) {
        response.sendRedirect("/CareAndCure/res_login.jsp");
    }
%>
<%! DBCon con = new DBCon();%>
<%! Patient pat = new Patient();%>
<%! Schedule sch = new Schedule();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Appointments</title>
        <link href="assets/img/favicon.ico" rel="icon">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
        <link rel="stylesheet" href="assets/css/patient.css"/>
    </head>
    <body>
         <!--navigation bar-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="recep_home.jsp">Care&Cure</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="patient.jsp">Patient </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="doctor.jsp">Doctor</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="appointments.jsp">Appointments<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="wards.jsp">Wards</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="symptoms.jsp">Symptoms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="schedule.jsp">Schedule</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Add
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="add_patient.jsp">Add Patient</a>
                            <a class="dropdown-item" href="add_doctor.jsp">Add Doctor</a>
                            <a class="dropdown-item" href="recep_appointment.jsp">Add Appointment</a>
                            <a class="dropdown-item" href="add_ward.jsp">Allocate Ward</a>
                             <a class="dropdown-item" href="add_schedule.jsp">Schedule Doctor</a>
                        </div>
                    </li>
                </ul>

                <ul class="navbar-nav mr-2">
                    <li class="nav-item dropdown float-right">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%= session.getAttribute("username")%>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="recep_profile.jsp">Profile</a>      
                        </div>
                    </li>
                </ul>   
                <form class="form-inline my-2 my-lg-0" action="Logout_reception">
                    <input type="submit" name="logout" class="btn btn-primary my-2 my-sm-0" value="Logout"/>
                </form>
            </div>
        </nav>
            
        <!--schedule-->  
        <div class="container">
            <div class="card bg-light">

                <article class="card-body mx-auto" style="max-width: 400px;">

                    <h4 class="card-title mt-3 text-center">Add appointment</h4>

                    <form class="form-horizontal" action="Update_appointments" method="post">
                        <%
                            String sid = request.getParameter("sid");
                            String did = request.getParameter("docid");
                        %>

                        
                       
                        <input type="hidden" value="<%= request.getParameter("docid")%>" name="did">
                        <input type="hidden" value="<%= request.getParameter("shedate")%>" name="schdate">
                        <input type="hidden" value="Active" name="status">
                        
                       <%
                            try {
                                ResultSet rst = sch.getAllSchedule();
                        %>
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>    
                            <select name="schid" class="form-control" required>
                                <option value=""></option>
                                <% while (rst.next()) {%>
                                <option value="<%= rst.getInt("schedule_id")%>"><%= rst.getString("schedule_date")%> <%= rst.getString("schedule_time")%></option>
                                <%  } %>
                            </select>
                        </div> <!-- form-group// -->

                        <%
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                        
                        
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-clock"></i> </span>
                            </div>    
                             <input name="aptime" class="form-control" type="time" required>
                        </div> <!-- form-group// -->
                        
                        <%
                            try {
                                ResultSet rst = pat.getAllPatient();
                        %>
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>    
                            <select name="patname" class="form-control" required>
                                <option value=""></option>
                                <% while (rst.next()) {%>
                                <option value="<%= rst.getInt("patient_id")%>"><%= rst.getString("fname")%> <%= rst.getString("lname")%></option>
                                <%  } %>
                            </select>
                        </div> <!-- form-group// -->

                        <%
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-clock"></i> </span>
                            </div>    
                             <input name="aptime" class="form-control" type="time" required>
                        </div> <!-- form-group// -->
 

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block"> Update </button>   
                        </div> <!-- form-group// -->      

                    </form>

                </article>
            </div> <!-- card.// -->

        </div>                 
                        
                        
    </body>
</html>
