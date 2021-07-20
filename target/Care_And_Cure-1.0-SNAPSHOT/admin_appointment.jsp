<%-- 
    Document   : admin_appointment
    Created on : 14 May 2021, 08:35:08
    Author     : alex
--%>

<%@page import="model.Patient"%>
<%@page import="model.Appointments"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Schedule"%>
<%@page import="model.Doctor"%>
<%@page import="model.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //No access if there is no session attribute
    if (session.getAttribute("username") == null) {
        response.sendRedirect("/CareAndCure/admin_login.jsp");
    }
%>
<%! DBCon con = new DBCon(); %>
<%! Doctor doc = new Doctor();%>
<%! Schedule sch = new Schedule();%>
<%! Appointments apt = new Appointments();%>
<%! Patient patient = new Patient();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin appointments</title>
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
                    <li class="nav-item ">
                        <a class="nav-link" href="admin_reception.jsp">Reception</a>
                    </li>
                    <li class="nav-item active">
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
                        <a class="nav-link dropdown-toggle  " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                        
                   <!--appointments-->     
        <div class="heading">
            <h4>Appointment details</h4>
            <hr>
        </div>
        <div>${status}</div>

        <div class="container mb-3 mt-3">
            <table class="table table-striped table-bordered table-responsive table-light pdatatable">
                <thead>
                    <tr>
                        <th scope="col">App_ID</th>
                        <th scope="col">Date</th>
                        <th scope="col">Time</th>
                        <th scope="col">Patient</th>
                        <th scope="col">Doctor</th>
                        <th scope="col">Department</th>
                        <th scope="col">Status</th>
                        <th scope="col">Edit</th>
                        <th scope="col">Cancel</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        try {
                            ResultSet rs = apt.getAllAppointments();

                            while (rs.next()) {

                                ResultSet rst = null;
                                ResultSet rsp = null;

                                String doc = rs.getString("doctor_id");
                                String pat = rs.getString("patient_id");

                                PreparedStatement pst = con.createConnection().prepareStatement("select * from doctor where doctor_id = ?");
                                pst.setString(1, doc);

                                PreparedStatement psp = con.createConnection().prepareStatement("select * from patient where patient_id = ?");
                                psp.setString(1, pat);

                                rst = pst.executeQuery();
                                rsp = psp.executeQuery();

                                while (rst.next() && rsp.next()) {
                                    ResultSet depst = null;
                                    String depart = rst.getString("department");

                                    PreparedStatement psd = con.createConnection().prepareStatement("select * from department where dep_id = ?");
                                    psd.setString(1, depart);

                                    depst = psd.executeQuery();

                                    while (depst.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id")%></td>
                        <td><%= rs.getString("date")%></td>
                        <td><%= rs.getString("time")%></td>                                 
                        <td><%= rsp.getString("fname")%> <%= rsp.getString("lname")%></td>
                        <td><%= rst.getString("fname")%> <%= rst.getString("lname")%></td>
                        <td><%= depst.getString("dep_name")%></td>
                        <td><%= rs.getString("status")%></td>
                        <td>
                            <form method="post" action="appointment_update.jsp">
                                <input type="hidden" value="<%= rs.getInt("id")%>" name="pid">
                                <input type="hidden" value="<%= rs.getInt("patient_id")%>" name="pid">
                                <input type="hidden" value="<%= rs.getInt("doctor_id")%>" name="did" >
                                <input type="submit" value="Update" class="btn btn-warning">
                            </form> 
                        </td>
                        <td>
                            <form method="post" action="Change_appointment_status">
                                <input type="hidden" value="<%= rs.getString("id")%>" name="aid">
                                <input type="hidden" value="<%= rs.getString("status")%>" name="status">
                                <input type="submit" value="Cancel" class="btn btn-danger">
                            </form>
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
                        <th scope="col">Doctor</th>
                        <th scope="col">Department</th>
                        <th scope="col">Status</th>
                        <th scope="col">Edit</th>
                        <th scope="col">Cancel</th>
                    </tr>

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
