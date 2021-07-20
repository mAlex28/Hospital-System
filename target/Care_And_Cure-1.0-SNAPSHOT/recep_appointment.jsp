<%-- 
    Document   : recep_appointment
    Created on : 28 Apr 2021, 07:38:09
    Author     : alex
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.Schedule"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Doctor"%>
<%@page import="model.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //No access if there is no session attribute
    if (session.getAttribute("username") == null) {
        response.sendRedirect("/CareAndCure/res_login.jsp");
    }
%>
<%! DBCon con = new DBCon(); %>
<%! Doctor doc = new Doctor();%>
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
                    <li class="nav-item ">
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
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Add
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="add_patient.jsp">Add Patient</a>
                            <a class="dropdown-item" href="add_doctor.jsp">Add Doctor</a>
                            <a class="dropdown-item active" href="recep_appointment.jsp">Add Appointment<span class="sr-only">(current)</span></a>
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

        <div class="heading">
            <h4>Add an appointment</h4>
            <hr>
        </div>
                        <div>${status}</div>
        <div class="container">
            <div class="card bg-light">
                <article class="card-body mx-auto" style="max-width: 400px;">
                    <form>

                        <%
                            try {
                                ResultSet rst = doc.getAllDoctor();
                        %>
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user-md"></i> </span>
                            </div>    
                            <select name="docname" class="form-control" required>
                                <option value=""></option>
                                <% while (rst.next()) {%>
                                <option value="<%= rst.getInt("doctor_id")%>"><%= rst.getString("fname")%> <%= rst.getString("lname")%></option>
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
                                <span class="input-group-text"> <i class="fa fa-calendar"></i> </span>
                            </div>
                            <input name="date" class="form-control" type="date" required>
                        </div> <!-- form-group// -->

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block">Search </button>
                        </div> <!-- form-group// -->      

                    </form>

                </article>




                <div class="d-flex justify-content-center">
                    <div id="schtable"></div>
                    <table class="table table-striped table-bordered table-responsive table-light"  style="width: auto;">
                        <thead>
                            <tr>
                                <th scope="col">Doctor Name</th>
                                <th scope="col">Date</th>
                                <th scope="col">Start Time</th>
                                <th scope="col">End Time</th>
                                <th scope="col">Book</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    ResultSet rs = null;

                                    String docname = request.getParameter("docname");
                                    String datesch = request.getParameter("date");

                                    PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor_shedule where doc_id = ? and shedule_date = ?");
                                    ps.setString(1, docname);
                                    ps.setString(2, datesch);
                                    rs = ps.executeQuery();

                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%= rs.getString("doc_id")%></td>
                                <td><%= rs.getString("shedule_date")%></td>
                                <td><%= rs.getString("start_time")%></td>                                 
                                <td><%= rs.getString("end_time")%></td>
                                <td> <form method="post" action="recep_appointment2.jsp">
                                        <input type="hidden" value="<%= rs.getString("shedule_id")%>" name="sid">
                                        <input type="hidden" value="<%= rs.getString("doc_id")%>" name="docid">
                                         <input type="hidden" value="<%= rs.getString("shedule_date")%>" name="shedate">
                                        <input type="submit" value="Book" class="btn btn-info">
                                    </form> 
                                </td>
                            </tr>
                            <%
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>


                        </tbody>   
                    </table>

                </div> <!-- card.// -->

            </div> 
            <!--container end.//-->
        </div>

        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
        <!--<script src="https://code.jquery.com/jquery-autocomplete.jsp"></script>-->


    </body>
</html>
