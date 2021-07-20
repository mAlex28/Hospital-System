<%-- 
    Document   : doctor_login
    Created on : 27 Apr 2021, 18:48:24
    Author     : alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //No access if there is no session attribute
    if (session.getAttribute("username") != null) {
        response.sendRedirect("/CareAndCure/doc_home.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Doctor Login</title>
 
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">

<!-- CSS Files -->
<link href="./assets/css/style.css" rel="stylesheet">
<link href="./assets/css/doc_login.css" rel="stylesheet">
    </head>
    <body>
       <!-- ======= Top Bar ======= -->
        <div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
            <div class="container d-flex">
                <div class="contact-info mr-auto">
                    <i class="icofont-envelope"></i> <a href="mailto:careAndCure@example.com">careAndcure@gmail.com</a>
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
                        <li class=""><a href="index.jsp">Home</a></li>
                        <li><a href="index.jsp#about">About</a></li>
                        <li><a href="index.jsp#services">Services</a></li>
                        <li><a href="index.jsp#doctors">Doctors</a></li>
                        <li class="drop-down active"><a href="">Login</a>
                            <ul>
                                <li><a href="res_login.jsp">Reception</a></li>
                                <li><a href="doctor_login.jsp">Doctor</a></li>
                                <li><a href="admin_login.jsp">Admin</a></li>
                            </ul>
                        </li>
                        <li><a href="contact.jsp">Contact</a></li>

                    </ul>
                </nav><!-- .nav-menu -->

                <a href="payment.jsp" class="appointment-btn scrollto">Online payment</a>

            </div>
        </header><!-- End Header -->
  
    <!-- ======= Login ======= -->
    <section id="login" class="login">
        <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-2"></div>
            <div class="col-lg-6 col-md-8 login-box">
                <div class="col-lg-12 login-key">
                    <i class="bx bx-user" aria-hidden="true"></i>
                </div>
                <div class="col-lg-12 login-title">
                    DOCTORS LOGIN
                </div>

                <div class="col-lg-12 login-form">
                    <div class="col-lg-12 login-form">
                        <!--connect form to servlet-->
                        <form method="post" action="Login_doctor">
                            <div>${error}</div>
                            <div class="form-group">
                                <label class="form-control-label">USERNAME</label>
                                <input type="text" class="form-control" name="username" required> 
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">PASSWORD</label>
                                <input type="password" class="form-control" name="password" required>
                            </div>

                            <div class="col-lg-12 loginbttm">
                                <div class="col-lg-6 login-btm login-text">
                                    <!-- Error Message -->
                                </div>
                                <div class="col-lg-6 login-btm login-button">
                                    <button type="submit" class="btn btn-outline-primary">LOGIN</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-3 col-md-2"></div>
            </div>
        </div>
    </section>
    </body>
</html>
