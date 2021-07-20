<%-- 
    Document   : update_patient
    Created on : 28 Apr 2021, 10:15:26
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
        response.sendRedirect("/CareAndCure/res_login.jsp");
    }
%>
<%! DBCon con = new DBCon();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update patient</title>

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
                    <li class="nav-item active">
                        <a class="nav-link" href="patient.jsp">Patient <span class="sr-only">(current)</span></a>
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
     
        <!--update patient-->
        <div class="container">
            <div class="card bg-light">
                <article class="card-body mx-auto" style="max-width: 400px;">

                    <h4 class="card-title mt-3 text-center">Update Patient</h4>

                    <form action="Update_patient" method="post">
                        <%
                            ResultSet rs = null;
                            Statement st = null;

                            String data;
                            String num = request.getParameter("id");

                            PreparedStatement ps = con.createConnection().prepareStatement("select * from patient where patient_id = ?");
                            ps.setString(1, num);
                            
                            rs = ps.executeQuery();

                            while (rs.next()) {
                        %>
                        <input type="hidden" name="id" value="<%= rs.getInt("patient_id")%>"/>
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
                            <input name="age" class="form-control" value="<%= rs.getInt("age")%>" type="text">
                        </div> <!-- form-group// -->
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fas fa-venus-mars"></i> </span>
                            </div>
                            <select name="gender" class="form-control">
                                <option selected=""><%= rs.getString("gender")%></option>
                                <option>Male</option>
                                <option>Female</option>
                                <option>Other</option>
                            </select>
                        </div> <!-- form-group end.// -->

                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fas fa-male"></i> </span>
                            </div>
                            <select name="martial_status" class="form-control">
                                <option selected=""><%= rs.getString("martial_status")%></option>
                                <option>Married</option>
                                <option>Unmarried</option>
                                <option>Divorced</option>
                            </select>
                        </div> <!-- form-group end.// -->

                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-calendar"></i> </span>
                            </div>
                            <input name="dob" class="form-control" value="<%= rs.getDate("dob") %>" type="text">
                        </div> <!-- form-group// -->

                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                            </div>
                            <select class="custom-select" style="max-width: 120px;">
                                <option selected="">+94</option>
                            </select>
                            <input name="phone" class="form-control" value="<%= rs.getInt("phone_no")%>" type="text">
                        </div> <!-- form-group// -->
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-map"></i> </span>
                            </div>
                            <input name="address" class="form-control" value="<%= rs.getString("address")%>" type="text">
                        </div> <!-- form-group// -->
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-university"></i> </span>
                            </div>
                            <input name="city" class="form-control" value="<%= rs.getString("city")%>" type="text">
                        </div> <!-- form-group// -->

                        <%
                            }
                        %>


                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block"> Update </button>
                        </div> <!-- form-group// -->      

                    </form>

                </article>
            </div> <!-- card.// -->

        </div> 
        <!--container end.//-->

    </body>
</html>
