<%-- 
    Document   : admin_update
    Created on : 28 Apr 2021, 12:11:02
    Author     : alex
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //No access if there is no session attribute
    if (session.getAttribute("username") == null) {
        response.sendRedirect("/CareAndCure/admin_login.jsp");
    }
%>
<%! DBCon con = new DBCon();%>
<!DOCTYPE html>
<html>
    <head>       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link href="assets/img/favicon.ico" rel="icon">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
        <link rel="stylesheet" href="assets/css/patient.css"/>
    </head>
    <body>
       
        <!--navigation bar-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="admin_home.jsp">Care&Cure</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="admin_patient.jsp">Patient </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin_doctor.jsp">Doctor</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="admin_reception.jsp">Reception</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin_appointment.jsp">Appointments</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin_wardsAndDeps.jsp">Wards/Departments</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin_symptoms.jsp">Symptoms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin_payment.jsp">Payments</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="admin_contacts.jsp">Contacts</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="sr-only">(current)</span>Add
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="admin_add_patient.jsp">Patient</a>
                            <a class="dropdown-item" href="admin_add_doctor.jsp">Doctor</a>
                            <a class="dropdown-item" href="admin_add_reception.jsp">Receptionist</a>
                            <a class="dropdown-item" href="admin_add_appointment.jsp">Appointment</a>
                            <a class="dropdown-item" href="admin_add_wardep.jsp">Wards & Departments</a>
                        </div>
                    </li>
                </ul>

                <ul class="navbar-nav mr-2">
                    <li class="nav-item dropdown float-right">
                        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%= session.getAttribute("username")%>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item active" href="admin_update.jsp">Profile</a>      
                        </div>
                    </li>
                </ul>   
                <form class="form-inline my-2 my-lg-0" action="Logout_admin">
                    <input type="submit" name="logout" class="btn btn-primary my-2 my-sm-0" value="Logout"/>
                </form>
            </div>
        </nav>

        <!--profile update-->
        <div class="container">
            <div class="card bg-light">
                <article class="card-body mx-auto" style="max-width: 400px;">
                    <h4 class="card-title mt-3 text-center">Update Account</h4>

                    <form action="Update_admin" method="post">
                        <div>${status}</div>
                        <%

                            ResultSet rs = null;

                            String username = session.getAttribute("username").toString();

                            PreparedStatement ps = con.createConnection().prepareStatement("select * from admin where admin_name like '%" + username + "%'");
                            rs = ps.executeQuery();

                            while (rs.next()) {
                        %>
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="username" class="form-control" value="<%= rs.getString("admin_name")%>" type="text">
                        </div> <!-- form-group// -->

                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="password" class="form-control" value="<%= rs.getString("password")%>" type="text">
                        </div> <!-- form-group// --> 
                        <%
                            }
                        %>

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block"> Update Account  </button>
                        </div> <!-- form-group// -->      

                    </form>
                </article>
            </div> <!-- card.// -->

        </div> 
        <!--container end.//-->


        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
       
    </body>
</html>
