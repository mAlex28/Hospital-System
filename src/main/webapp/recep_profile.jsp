<%-- 
    Document   : recep_profile
    Created on : 27 Apr 2021, 00:28:58
    Author     : alex
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="model.DBCon"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="model.Reception"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //No access if there is no session attribute
    if (session.getAttribute("username") == null) {
        response.sendRedirect("/CareAndCure/res_login.jsp");
    }
%>
<%! DBCon con = new DBCon(); %>
<%! Reception patient = new Reception();%>
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
                    <li class="nav-item">
                        <a class="nav-link" href="appointment.jsp">Appointments</a>
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
                        <a class="nav-link dropdown-toggle " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="sr-only">(current)</span>Add
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="add_patient.jsp" >Add Patient</a>
                            <a class="dropdown-item" href="add_doctor.jsp">Add Doctor</a>
                            <a class="dropdown-item" href="add_appointment.jsp">Add Appointment</a>
                            <a class="dropdown-item" href="add_ward.jsp">Allocate Ward</a>
                            <a class="dropdown-item" href="add_schedule.jsp">Schedule Doctor</a>
                        </div>
                    </li>
                </ul>

                <ul class="navbar-nav mr-2">
                    <li class="nav-item dropdown float-right">
                        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%= session.getAttribute("username")%>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item active" href="recep_profile.jsp">Profile</a>      
                        </div>
                    </li>
                </ul>   
                <form class="form-inline my-2 my-lg-0" action="Logout_reception">
                    <input type="submit" name="logout" class="btn btn-primary my-2 my-sm-0" value="Logout"/>
                </form>
            </div>
        </nav>

        <!--model popup-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Update password</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="Update_recep_pass">
                            <div class="form-group">
                                <label for="username" class="col-form-label">Username:</label>
                                <input type="text" class="form-control" id="old-password" name="username" required>
                            </div>
                            <div class="form-group">
                                <label for="newpassword" class="col-form-label">New Password</label>
                                <input type="text" class="form-control" id="new-password" name="newpassword" required>
                            </div>
                             <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Send message</button>
                    </div>
                        </form>
                    </div>
                   
                </div>
            </div>
        </div>


        <!--profile update-->
        <div class="container">
            <div class="card bg-light">
                <article class="card-body mx-auto" style="max-width: 400px;">
                    <h4 class="card-title mt-3 text-center">Update Account</h4>

                    <form action="Update_reception" method="post">
                        <div>${status}</div>
                        <%

                            ResultSet rs = null;
                            Statement st = null;

                            String data;

                            String username = session.getAttribute("username").toString();

                            PreparedStatement ps = con.createConnection().prepareStatement("select * from reg_reception where username like '%" + username + "%'");
                            rs = ps.executeQuery();

                            while (rs.next()) {
                        %>
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="fname" class="form-control" value="<%= rs.getString("fname")%>" type="text">
                        </div> <!-- form-group// -->

                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="lname" class="form-control" value="<%= rs.getString("lname")%>" type="text">
                        </div> <!-- form-group// -->

                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="email" class="form-control" value="<%= rs.getString("email")%>" type="text">
                        </div> <!-- form-group// -->

                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                            </div>
                            <select class="custom-select" style="max-width: 120px;">
                                <option selected="">+94</option>
                            </select>
                            <input name="phone_no" class="form-control" value="<%= rs.getInt("phone_no")%>" type="text">
                        </div> <!-- form-group// -->

                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="username" class="form-control" value="<%= rs.getString("username")%>" type="text">
                        </div> <!-- form-group// -->

                        <div class="form-group">
                            <a data-toggle="modal" data-target="#exampleModal" href="#">Reset Password</a>
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
