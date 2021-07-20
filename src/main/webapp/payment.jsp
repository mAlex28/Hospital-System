<%-- 
    Document   : payment
    Created on : 27 Apr 2021, 18:55:19
    Author     : alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="./assets/css/payment.css" rel="stylesheet">

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
                        <li class="active"><a href="index.jsp">Home</a></li>
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
                        <li><a href="index.jsp#contact">Contact</a></li>

                    </ul>
                </nav><!-- .nav-menu -->

                <a href="pat_appointment.jsp" class="appointment-btn scrollto">Make an Appointment</a>

            </div>
        </header><!-- End Header -->

        <div class="class1">
            <div class="forms-container">
                <div class="appoinments">
                    <div>${status}</div>
                    <div class="section-title">
                        <h2>Payment Information</h2>
                    </div>
                    <br>
                    <form action="Pat_payment" method="post">
                    <div class="input-field">
                        <input list="payment" placeholder="Payment Type" name="type" type="text">

                        <datalist id="payment">
                            <option value="PCR Tests">
                            <option value="Final Bill">
                            <option value="Consultant Fee">
                            <option value="Lab Reciept">
                            <option value="Interim Bill">
                            <option value="Pharmacy Bill">

                        </datalist>             
                    </div>
                    <br>
                    <div class="input-field">
                        <i></i>
                        <input type="text" name="invoice" placeholder="invoice Number" required>
                    </div>
                    <br>
                    <div class="input-field">
                        <i></i>
                        <input type="text" name="amount" placeholder="Amount (RS)" required>
                    </div>
                    <br>
                    <div class="section-title">
                        <h2>Payer Information</h2>
                    </div>
                    <div class="input-field">
                        <i class="fa fa-user"></i>
                        <input type="text" name="Payer's Name" placeholder="Payer's Name" required>
                    </div>
                    <br>
                    <div class="input-field">
                        <i class="fa fa-credit-card"></i>
                        <input type="text" name="Card Number" placeholder="Credit/Debit" required>
                    </div>
                    <div class="input-field" class="expire-info clearfix">
                        <br>
                        <div class="cv-code"> 
                            <i class="fa fa-money-check"></i>
                            <input type="text" name="cv-number" placeholder="CV-Code"> 
                        </div>
                        <br>
                        <div class="input-field ex-date">  
                            <i class="fa fa-calendar-alt"></i>
                            <input type="text" name="text-date" placeholder="year">
                            <i class="fa fa-calendar-alt"></i>
                            <input type="text" name="text-month" placeholder="month">  
                        </div>
                        <br>
                        <button type="submit" class="button-primary button-primary--red btn btn-block btn-main-search">Submit</button>
                    </div>
                    </form>
                </div>
                
            </div>
        </div>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/venobox/venobox.min.js"></script>
        <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
        <script src="assets/vendor/counterup/counterup.min.js"></script>
        <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>
