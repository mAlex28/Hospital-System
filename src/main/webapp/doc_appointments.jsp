<%-- 
    Document   : doc_appointments
    Created on : 11 May 2021, 00:09:58
    Author     : alex
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //No access if there is no session attribute
    if (session.getAttribute("username") == null) {
        response.sendRedirect("/CareAndCure/doctor_login.jsp");
    }
%>
<%! DBCon con = new DBCon(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointments</title>

        <link href="assets/img/favicon.ico" rel="icon">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
        <link rel="stylesheet" href="assets/css/patient.css"/>
        
        <style>
            .container {
                font-size: 15px;
            }
        </style>
    </head>
    <body>
        <!--navigation bar-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="doc_home.jsp">Care&Cure</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="doc_appointments.jsp">Appointments</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="doc_schedule.jsp">Schedule</a>
                    </li>
                </ul>

                <ul class="navbar-nav mr-2">
                    <li class="nav-item dropdown float-right">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%= session.getAttribute("username")%>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="doc_profile.jsp">Profile</a>      
                        </div>
                    </li>
                </ul>   
                <form class="form-inline my-2 my-lg-0" action="Logout_doctor">
                    <input type="submit" name="logout" class="btn btn-primary my-2 my-sm-0" value="Logout"/>
                </form>
            </div>
        </nav>

        <!--appointments-->     
        <div class="heading">
            <h4>Appointment details</h4>
            <hr>
        </div>

        <div class="container mb-3 mt-3">
            <div class="d-flex justify-content-center">
            <table class="table table-striped table-bordered table-responsive table-light pdatatable">
                <thead>
                    <tr>
                        <th scope="col">App_ID</th>
                        <th scope="col">Date</th>
                        <th scope="col">Time</th>
                        <th scope="col">Patient</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {

                            String docname = (String) session.getAttribute("username");

                            ResultSet rs = null;

                            PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor where username = ?");
                            ps.setString(1, docname);

                            rs = ps.executeQuery();

                            while (rs.next()) {

                                ResultSet rst = null;
                                ResultSet rsp = null;

                                String docid = rs.getString("doctor_id");

                                PreparedStatement pst = con.createConnection().prepareStatement("select * from appointments where doctor_id = ?");
                                pst.setString(1, docid);

                                rst = pst.executeQuery();

                                while (rst.next()) {

                                    String pat = rst.getString("patient_id");

                                    PreparedStatement psp = con.createConnection().prepareStatement("select * from patient where patient_id = ?");
                                    psp.setString(1, pat);

                                    rsp = psp.executeQuery();

                                    while (rsp.next()) {

                    %>
                    <tr>
                        <td><%= rst.getInt("id")%></td>
                        <td><%= rst.getString("date")%></td>
                        <td><%= rst.getString("time")%></td>                                 
                        <td><%= rsp.getString("fname")%> <%= rsp.getString("lname")%></td>
                        <td>
                            <input type="button" value="<%= rst.getString("status")%>" class="btn btn-info">
                        </td>
                    </tr>
                    <%
                                    }
                                }
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>   


                <tfoot>
                    <tr>
                        <th scope="col">App.ID</th>
                        <th scope="col">Date</th>
                        <th scope="col">Time</th>
                        <th scope="col">Patient</th>           
                        <th scope="col">Status</th>
                    </tr>
                </tfoot>
            </table>
                </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

        <script>
            $('.pdatatable').DataTable();
        </script>
    </body>
</html>
