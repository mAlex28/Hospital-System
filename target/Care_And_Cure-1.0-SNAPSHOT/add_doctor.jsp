<%-- 
    Document   : add_doctor
    Created on : 28 Apr 2021, 00:26:58
    Author     : alex
--%>

<%@page import="model.Department"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //No access if there is no session attribute
    if (session.getAttribute("username") == null) {
        response.sendRedirect("/CareAndCure/res_login.jsp");
    }
%>
<%! Department dep = new Department();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add doctor</title>

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
                        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="sr-only">(current)</span>Add
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="add_patient.jsp" >Add Patient</a>
                            <a class="dropdown-item active" href="add_doctor.jsp">Add Doctor</a>
                            <a class="dropdown-item" href="add_appointment.jsp">Add Appointment</a>
                            <a class="dropdown-item" href="add_ward.jsp">Allocate Ward</a>
                             <a class="dropdown-item" href="add_schedule.jsp">Schedule doctor</a>
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



        <div class="container">
            <div class="card bg-light">

                <article class="card-body mx-auto" style="max-width: 400px;">

                    <h4 class="card-title mt-3 text-center">Register doctor</h4>

                    <form action="Reg_doctor" method="post">
                        <div>${status}</div>
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="fname" class="form-control" placeholder="First name" type="text" required>
                        </div> <!-- form-group// -->
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="lname" class="form-control" placeholder="Last name" type="text" required>
                        </div> <!-- form-group// -->
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                            </div>
                            <input name="email" class="form-control" placeholder="Email" type="email" required>
                        </div> <!-- form-group// -->
                        
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fas fa-venus-mars"></i> </span>
                            </div>
                            <select name="gender" class="form-control" required>
                                <option value="">Select Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                                <option>Other</option>
                            </select>
                        </div> <!-- form-group end.// -->
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fas fa-university"></i> </span>
                            </div>
                            <select name="degree" class="form-control" required>
                                <option value="">Select Degree</option>
                                <option>MBBS</option>
                                <option>BMBS</option>
                                <option>MBCh</option>
                                <option>MBBCh</option>
                            </select>
                        </div> <!-- form-group end.// -->
                        <%
                            try {
                                ResultSet rs = dep.getAllDepartment();
                        %>
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fas fa-medkit"></i> </span>
                            </div>
                            <select name="department" class="form-control" required>
                                <option value="">Select Department</option>
                                <% while (rs.next()) {%>
                                <option value="<%= rs.getInt("dep_id")%>"><%= rs.getString("dep_name")%></option>
                                <%  } %>
                            </select>
                        </div>  
                        <%
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                            </div>
                            <select class="custom-select" style="max-width: 120px;">
                                <option selected="">+94</option>
                            </select>
                            <input name="contact" class="form-control" placeholder="Phone number" type="text">
                        </div> <!-- form-group// -->
                        
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-map"></i> </span>
                            </div>
                            <input name="address" class="form-control" placeholder="Address" type="text">
                        </div> <!-- form-group// -->

                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fas fa-money-bill-alt"></i> </span>
                            </div>
                            <input name="fees" class="form-control" placeholder="Fees" type="text">
                        </div> <!-- form-group// -->

                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="username" class="form-control" placeholder="Username" type="text">
                        </div> <!-- form-group// -->

                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                            </div>
                            <input name="password" class="form-control" placeholder="Password" type="password">
                        </div> <!-- form-group// -->

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block"> Register doctor </button>
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
