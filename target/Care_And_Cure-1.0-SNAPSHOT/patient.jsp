<%-- 
    Document   : patient
    Created on : 26 Apr 2021, 14:49:38
    Author     : alex
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.DBCon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="model.Patient" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //No access if there is no session attribute
    if (session.getAttribute("username") == null) {
        response.sendRedirect("/CareAndCure/res_login.jsp");
    }
%>
<%! DBCon con = new DBCon(); %>
<%! Patient patient = new Patient();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient</title>

        <link href="assets/img/favicon.ico" rel="icon">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css"/>
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

        <!--patient-->     
        <div class="heading">
            <h4>Patient details</h4>
            <hr>
        </div>

        <div class="container mb-3 mt-3">
             <div>${status}</div>
            <table class="table table-striped table-bordered table-responsive table-light pdatatable">
                <thead>
                <th scope="col">ID</th>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Age</th>
                <th scope="col">Gender</th>
                <th scope="col">Status</th>
                <th scope="col">DOB</th>
                <th scope="col">Address</th>
                <th scope="col">City</th>
                <th scope="col">Phone</th>
                <th scope="col">Appoints</th>
                <th scope="col">Edit</th>
                <th scope="col">Delete</th>
                </thead>

                <tbody>
                    <%
                        try {
                            ResultSet rs = patient.getAllPatient();

                              while (rs.next()) {%>
                    <tr>
                        <td><%= rs.getInt("patient_id")%></td>
                        <td><%= rs.getString("fname")%></td>
                        <td><%= rs.getString("lname")%></td>
                        <td><%= rs.getString("age")%></td>
                        <td><%= rs.getString("gender")%></td>
                        <td><%= rs.getString("martial_status")%></td>
                        <td><%= rs.getString("dob")%></td>
                        <td><%= rs.getString("address")%></td>
                        <td><%= rs.getString("city")%></td>
                        <td><%= rs.getInt("phone_no")%></td>
                        <td>
                            <form method="post" action="">
                                <input type="hidden" value="<%= rs.getString("patient_id")%>" name="id">
                                <input type="submit" value="View" class="btn btn-info">
                            </form>
                        </td>
                        <td>
                            <form method="post" action="update_patient.jsp">
                                <input type="hidden" value="<%= rs.getInt("patient_id")%>" name="id">
                                <input type="submit" value="Update" class="btn btn-warning">
                            </form> 
                        </td>
                        <td>


                            <form method="post" action="Delete_patient">
                                <input type="hidden" value="<%= rs.getInt("patient_id")%>" name="id" >
                                <input type="submit" value="Delete" class="btn btn-danger">
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


                <tfoot>
                <th scope="col">ID</th>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Age</th>
                <th scope="col">Gender</th>
                <th scope="col">Status</th>
                <th scope="col">DOB</th>
                <th scope="col">Address</th>
                <th scope="col">City</th>
                <th scope="col">Phone</th>
                <th scope="col">Appointments</th>
                <th scope="col">Edit</th>
                <th scope="col">Delete</th>
                </tfoot>
            </table>

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
