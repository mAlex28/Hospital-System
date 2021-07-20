<%-- 
    Document   : admin_reception
    Created on : 14 May 2021, 00:46:00
    Author     : alex
--%>

<%@page import="model.Reception"%>
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
<%! Reception recep = new Reception();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reception</title>
        <link href="assets/img/favicon.ico" rel="icon">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css"/>
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
                    <li class="nav-item active">
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
                            Add
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
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%= session.getAttribute("username")%>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="admin_update.jsp">Profile</a>      
                        </div>
                    </li>
                </ul>   
                <form class="form-inline my-2 my-lg-0" action="Logout_admin">
                    <input type="submit" name="logout" class="btn btn-primary my-2 my-sm-0" value="Logout"/>
                </form>
            </div>
        </nav>

        <div class="heading">
            <h4>Reception Details</h4>
            <hr>
        </div>

        <div class="container mb-3 mt-3">
            <div class="d-flex justify-content-center">
                <table class="table table-striped table-bordered table-responsive table-light pdatatable">
                    <thead>
                        <tr>
                            <th scope="col">Recep_ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Phone_No</th>
                            <th scope="col">Username</th>
                            <th scope="col">Update</th>
                            <th scope="col">Delete</th>
                        </tr>
                    </thead>

                    <tbody>
                        <%
                            try {
                                ResultSet rs = recep.getAllReception();

                                while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt("recep_id")%></td>
                            <td><%= rs.getString("fname")%> <%= rs.getString("lname")%></td>
                            <td><%= rs.getString("email")%></td>                                 
                            <td><%= rs.getString("phone_no")%></td>
                            <td><%= rs.getString("username")%></td>
                            <td>
                                <form method="post" action="admin_recep_update.jsp">
                                    <input type="hidden" value="<%= rs.getInt("recep_id")%>" name="recepid">
                                <input type="submit" value="Update" class="btn btn-warning">
                                </form>
                            </td>
                            <td>
                                 <form method="post" action="Admin_recep_delete">
                                <input type="hidden" value="<%= rs.getInt("recep_id")%>" name="recepid">
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
                        <tr>
                            <th scope="col">Recep_ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Phone_No</th>
                            <th scope="col">Username</th>
                            <th scope="col">Update</th>
                            <th scope="col">Delete</th>
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
