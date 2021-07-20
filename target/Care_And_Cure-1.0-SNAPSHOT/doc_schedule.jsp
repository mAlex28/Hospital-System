<%-- 
    Document   : doc_schedule
    Created on : 11 May 2021, 00:10:10
    Author     : alex
--%>

<%@page import="model.Schedule"%>
<%@page import="model.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //No access if there is no session attribute
    if (session.getAttribute("username") == null) {
        response.sendRedirect("/CareAndCure/doctor_login.jsp");
    }
%>
<%! DBCon con = new DBCon(); %>
<%! Schedule sch = new Schedule();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule</title>
        
        <link href="assets/img/favicon.ico" rel="icon">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
        <link rel="stylesheet" href="assets/css/patient.css"/>

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
                    <li class="nav-item">
                        <a class="nav-link" href="doc_appointments.jsp">Appointments</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="doc_schedule.jsp">Schedule</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="doc_schedule_add.jsp">Add Schedule</a>
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

        <!--schedule-->     
        <div class="heading">
            <h4>Schedule details</h4>
            <hr>
        </div>

        <div class="container mb-3 mt-3">
            <div>${status}</div>
            <table class="table table-striped table-bordered table-responsive table-light pdatatable">
                <thead>
                    <tr>
                        <th scope="col">Schedule ID</th>
                        <th scope="col">Scheduled Date</th>
                        <th scope="col">Start Time</th>
                        <th scope="col">End Time</th>
                        <th scope="col">Avg. Consult Time</th>
                        <th scope="col">Status</th>
                        <th scope="col">Edit</th>
                        <th scope="col">Cancel</th>
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
                                String docid = rs.getString("doctor_id");

                                PreparedStatement pst = con.createConnection().prepareStatement("select * from doctor_shedule where doc_id = ?");
                                pst.setString(1, docid);
                                
                                rst = pst.executeQuery();
                                while (rst.next()) {
                    %>
                    <tr>
                        <td><%= rst.getInt("shedule_id")%></td>
                        <td><%= rst.getString("shedule_date")%></td>  
                        <td><%= rst.getString("start_time")%></td>
                        <td><%= rst.getString("end_time")%></td>
                        <td><%= rst.getString("consulting_time")%> Minutes</td>
                        <td>
                            <input type="button" value="<%= rst.getString("shedule_status")%>" class="btn btn-info">
                        </td>
                        <td>
                            <form method="post" action="doc_schedule_update.jsp">
                                <input type="hidden" value="<%= rst.getInt("shedule_id")%>" name="id">
                                <input type="submit" value="Update" class="btn btn-warning">
                            </form> 
                        </td>
                        <td>    
                            <form method="post" action="Doc_delete_schedule">
                                <input type="hidden" value="<%= rst.getInt("shedule_id")%>" name="id" >
                                <input type="submit" value="Delete" class="btn btn-danger">
                            </form>
                        </td>
                    </tr>
                    <%
                                }
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>   


                <tfoot>
                    <tr>
                        <th scope="col">Schedule ID</th>
                        <th scope="col">Scheduled Date</th>
                        <th scope="col">Start Time</th>
                        <th scope="col">End Time</th>
                        <th scope="col">Avg. Consult Time</th>
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
