<%-- 
    Document   : doc_schedule_update
    Created on : 13 May 2021, 10:36:13
    Author     : alex
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.Schedule"%>
<%@page import="model.Doctor"%>
<%@page import="model.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //No access if there is no session attribute
    if (session.getAttribute("username") == null) {
        response.sendRedirect("/CareAndCure/doctor_login.jsp");
    }
%>
<%! DBCon con = new DBCon(); %>
<%! Doctor doc = new Doctor();%>
<%! Schedule sch = new Schedule();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Schedule</title>

        <link href="assets/img/favicon.ico" rel="icon">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
        <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" /> 
        <link rel="stylesheet" type="text/css" href="dist/bootstrap-clockpicker.min.css">
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


        <!--update schedule-->
        <div class="container bootstrap-iso">
            <div class="card bg-light">

                <article class="card-body mx-auto" style="max-width: 400px;">

                    <h4 class="card-title mt-3 text-center">Update doctor schedule</h4>

                    <form class="form-horizontal" action="Doc_update_schedule" method="post">
                        <%
                            ResultSet rs = null;

                            String num = request.getParameter("id");

                            PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor_shedule where shedule_id = ?");
                            ps.setString(1, num);
                            rs = ps.executeQuery();

                            while (rs.next()) {
                                ResultSet rst = null;
                                String dept = rs.getString("doc_id");

                                PreparedStatement pst = con.createConnection().prepareStatement("select * from doctor where doctor_id = ?");
                                pst.setString(1, dept);
                                rst = pst.executeQuery();
                                while (rst.next()) {
                        %>
                        <div>${status}</div>
                        <input type="hidden" name="id" value="<%= rs.getString("shedule_id")%>"/>
                        <%
                            try {
                                ResultSet doctall = doc.getAllDoctor();
                        %>
                        <div class="form-group ">  
                            <label for="docname">Doctor Name</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-user-md"></i>
                                </div>
                                <select name="docname" class="form-control">
                                    <option value="<%= rst.getInt("doctor_id")%>"><%= rst.getString("fname")%> <%= rst.getString("lname")%></option>

                                    <% while (doctall.next()) {%>
                                    <option value="<%= doctall.getInt("doctor_id")%>"><%= doctall.getString("fname")%> <%= doctall.getString("lname")%></option>
                                    <%  } %>
                                </select>
                            </div>      
                        </div>
                        <%
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>

                        <div class="form-group ">    
                            <label for="sheduledate">Date</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar">
                                    </i>
                                </div>
                                <input class="form-control" id="sheduledate" name="sheduledate" value="<%= rs.getString("shedule_date")%>" type="text"/>
                            </div>                         
                        </div>

                        <div class="form-group ">  
                            <label for="stime">Start Time</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-clock"></i>
                                </div>
                                <input name="stime" class="form-control" type="text" value="<%= rs.getString("start_time")%>" required>
                            </div>      
                        </div>

                        <div class="form-group ">  
                            <label for="etime">End Time</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-clock"></i>
                                </div>
                                <input name="etime" class="form-control" type="text" value="<%= rs.getString("end_time")%>" required>
                            </div>      
                        </div>


                        <div class="form-group ">  
                            <label for="constime">Consulting Time</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-clock"></i>
                                </div>
                                <select name="constime" class="form-control" required>
                                    <option selected=""><%= rs.getString("consulting_time")%></option>
                                    <option>10 </option>
                                    <option>15</option>
                                    <option>20</option>
                                    <option>25</option>
                                    <option>30</option>
                                    <option>35</option>
                                    <option>40</option>
                                </select>
                            </div>      
                        </div>

                        <div class="form-group ">  
                            <label for="status">Status</label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-user"></i>
                                </div>
                                <select name="status" class="form-control">
                                    <option selected=""><%= rs.getString("shedule_status")%></option>
                                    <option value="Active">Active </option>
                                    <option value="Inactive">Inactive </option>
                                </select>
                            </div>      
                        </div>

                        <%
                                }
                            }
                        %>

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block"> Update schedule </button>
                        </div> <!-- form-group// -->      

                    </form>

                </article>
            </div> <!-- card.// -->

        </div> 


        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
        <!-- Include Date Range Picker -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
        <script type="text/javascript" src="dist/bootstrap-clockpicker.min.js"></script>
        <script type="text/javascript">
            $('.clockpicker').clockpicker();
        </script>
        <script>
            $(document).ready(function () {
                var date_input = $('input[name="sheduledate"]'); //our date input has the name "date"
                var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                date_input.datepicker({
                    format: 'yyyy-mm-dd',
                    container: container,
                    todayHighlight: true,
                    autoclose: true,
                })
            });

            $(function () {
                $('#datetimepicker3').datetimepicker({
                    format: 'LT'
                });
            });
        </script>


    </body>
</html>
