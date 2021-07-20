<%-- 
    Document   : pat_appointment2
    Created on : 13 May 2021, 11:14:28
    Author     : alex
--%>

<%@page import="model.Patient"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! Patient pat = new Patient();%>
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


        <!--schedule-->  
       <div class="class1">
            <div class="forms-container"> 
                 <div class="appoinments">
           

                <h4 class="card-title mt-3 text-center">Add appointment</h4>

                <form class="form-horizontal" action="Chanel_doctor" method="post">
                    <%
                        String sid = request.getParameter("sid");
                        String did = request.getParameter("docid");
                    %>

                    <div>${status}</div>
                    <input type="hidden" value="<%= request.getParameter("sid")%>" name="schid">
                    <input type="hidden" value="<%= request.getParameter("docid")%>" name="did">
                    <input type="hidden" value="<%= request.getParameter("shedate")%>" name="schdate">

                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                        </div>    
                        <input name="fname" class="form-control" type="text" placeholder="Full Name" required>
                    </div> <!-- form-group// -->

                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                        </div>    
                        <input name="age" class="form-control" type="text" placeholder="Age" required>
                    </div> <!-- form-group// -->

                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fas fa-venus-mars"></i> </span>
                        </div>   
                        <select name="gender" class="form-control" required>
                            <option>Male</option>
                            <option>Female</option>
                            <option>Other</option>
                        </select>
                    </div> <!-- form-group// -->

                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                        </div>    
                        <input name="phoneno" class="form-control" type="text" placeholder="Mobile Number" required>
                    </div> <!-- form-group// -->

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block"> Chanel </button>
                    </div> <!-- form-group// -->      
                </form>
        </div> <!-- card.// -->
    </div>
          


    </body>
</html>
