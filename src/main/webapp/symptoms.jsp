<%-- 
    Document   : symptoms
    Created on : 13 May 2021, 00:18:45
    Author     : alex
--%>

<%@page import="model.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
        <title>Symptoms</title>
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
                    <li class="nav-item active">
                        <a class="nav-link" href="symptoms.jsp">Symptoms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="schedule.jsp">Schedule</a>
                    </li>
                    <li class="nav-item dropdown ">
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

        <!--check symptoms-->            
        <div class="heading">
            <h4>Allocate Wards</h4>
            <hr>
        </div>

        <div class="container bg-light">
            <div class="row pt-4 pl-4">
                <div class="col">
                    <form>
                        <h4 style="font-size: 18px;">Select your age</h4>
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-plus-square"></i> </span>
                            </div>
                            <select name="age" class="form-control" required>
                                <option selected=""></option>
                                <option>-10</option>
                                <option>10-20</option>
                                <option>20-40</option>
                                <option>40-50</option>
                                <option>50+</option>
                            </select>
                        </div> <!-- form-group end.// -->

                        <h4 style="font-size: 18px;">Select the symptoms</h4>
                        <%
                            try {
                                ResultSet rs = null;

                                PreparedStatement ps = con.createConnection().prepareStatement("select * from symptoms");
                                rs = ps.executeQuery();

                        %>
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-plus-square"></i> </span>
                            </div>
                            <select name="symp1" class="form-control">
                                <option value="">Symptom #1</option>
                                <% while (rs.next()) {%>
                                <option value="<%= rs.getString("symp_one")%>"><%= rs.getString("symp_one")%></option>
                                <%  } %>
                            </select>
                        </div> <!-- form-group end.// -->
                        <%
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                        
                        
                         <%
                            try {
                                ResultSet rs = null;

                                PreparedStatement ps = con.createConnection().prepareStatement("select * from symptoms");
                                rs = ps.executeQuery();

                        %>
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-plus-square"></i> </span>
                            </div>
                            <select name="symp2" class="form-control">
                                <option value="">Symptom #2</option>
                                <% while (rs.next()) {%>
                                <option value="<%= rs.getString("symp_two")%>"><%= rs.getString("symp_two")%></option>
                                <%  } %>
                            </select>
                        </div> <!-- form-group end.// -->
                        <%
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>

                        <div class="form-group pl-3">
                            <button type="submit" class="btn btn-primary"> Search </button>
                            <input type="reset" class="btn btn-danger" value="Clear">
                        </div>
                    </form>
                </div>

                <div class="col">
                    <h4 style="font-size: 18px;">Related diagnosis</h4>
                    <table class="table table-bordered table-responsive">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">Symptoms</th>
                                <th scope="col">Disease</th>
                            </tr>
                        </thead>
                        <tbody>
                              <%
                                try {
                                    ResultSet rs = null;

                                    String sympone = request.getParameter("symp1");
                                    String symptwo = request.getParameter("symp2");

                                    PreparedStatement ps = con.createConnection().prepareStatement("select * from symptoms where symp_one = ? and symp_two = ?");
                                    ps.setString(1, sympone);
                                    ps.setString(2, symptwo);
                                    rs = ps.executeQuery();

                                    while (rs.next()) {
                            %>
                            <tr>
                                <td scope="col"><%= rs.getString("symp_one")%>, <%= rs.getString("symp_two")%></td>
                                <td scope="col"><%= rs.getString("diagnosi")%></td>
                            </tr>
                             <%
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>

                        </tbody>
                    </table>
                    <a href="add_patient.jsp" class="btn btn-success">Chanel doctor</a>

                </div>
            </div>
        </div>

    </body>
</html>
