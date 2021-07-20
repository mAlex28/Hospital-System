<%-- 
    Document   : pat_appointment
    Created on : 27 Apr 2021, 19:13:35
    Author     : alex
--%>

<%@page import="model.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.Doctor"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! Doctor doc = new Doctor();%>
<%! DBCon con = new DBCon(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Care & Cure</title>

        <!-- Favicons -->
        <link href="assets/img/favicon.ico" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
        <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">

        <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>


        <link href="./assets/css/style.css" rel="stylesheet">
        <link href="./assets/css/appoinment.css" rel="stylesheet">
    </head>
    <body>

        <!-- ======= Top Bar ======= -->
        <div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
            <div class="container d-flex">
                <div class="contact-info mr-auto">
                    <i class="icofont-envelope"></i> <a href="mailto:careAndCure@example.com">careAndcure@example.com</a>
                    <i class="icofont-phone"></i> +94 11 222 4545
                    <i class="icofont-google-map"></i> A108 Baker Street, Colombo
                </div>
                <div class="social-links">
                    <a href="#" class="twitter"><i class="icofont-twitter"></i></a>
                    <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
                    <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
                </div>
            </div>
        </div>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top">
            <div class="container d-flex align-items-center">


                <a href="index.jsp" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>

                <nav class="nav-menu d-none d-lg-block">
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="index.jsp#about">About</a></li>
                        <li><a href="index.jsp#services">Services</a></li>
                        <li><a href="index.jsp#doctors">Doctors</a></li>
                        <li class="drop-down"><a href="">Login</a>
                            <ul>
                                <li><a href="res_login.jsp">Reception</a></li>
                                <li><a href="doctor_login.jsp">Doctor</a></li>
                                <li><a href="admin_login.jsp">Admin</a></li>
                            </ul>
                        </li>
                        <li><a href="contact.jsp">Contact</a></li>

                    </ul>
                </nav><!-- .nav-menu -->

                <a href="payment.jsp" class="appointment-btn scrollto">Online Payment</a>

            </div>
        </header><!-- End Header -->

        <div class="class1">
            <div class="forms-container">
                <div class="appoinments">
                    <div class="section-title">
                        <h2>Make an Appointment</h2>
                    </div>
                    <div>${status}</div>
                    <form>
                        <%
                            try {
                                ResultSet rs = doc.getAllDoctor();
                        %>
                        <div class="input-field">
                            <i class="fa fa-user-md"></i>
                            <input id="doctor-input" list="doctor" class="form-control" placeholder="Doctor Name" name="docname" type="text">
                            <datalist id="doctor">
                                <% while (rs.next()) {%>
                                <option value="<%= rs.getString("doctor_id")%> <%= rs.getString("fname")%> <%= rs.getString("lname")%>"></option>
                                <%  } %>
                            </datalist>
                        </div>
                        <%
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                        

                        <div class="input-field">
                            <i class="fas fa-calendar"></i>
                            <input class="datetime-local" id="appointment-date" style="cursor:pointer; padding-left:15px;" name="date" type="date">
                        </div>
                        <button type="submit" class="button-primary button-primary--red btn btn-block btn-main-search"><i class="fa fa-search"></i> Search</button>
                    </form>
                        
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
                                <td><%= docname %></td>
                                <td><%= rs.getString("shedule_date")%></td>
                                <td><%= rs.getString("start_time")%></td>                                 
                                <td><%= rs.getString("end_time")%></td>
                                <td> <form method="post" action="pat_appointment2.jsp">
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
            </div>
        </div>
    </body>
</html>
