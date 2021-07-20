<%-- 
    Document   : recep_home
    Created on : 26 Apr 2021, 12:46:33
    Author     : alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //No access if there is no session attribute
    if (session.getAttribute("username") == null) {
        response.sendRedirect("/CareAndCure/res_login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>

        <link href="assets/img/favicon.ico" rel="icon">

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="./assets/css/res_home.css" rel="stylesheet">

    </head>
    <body>
        <div class="box">
            <div class="d-flex justify-content-between pl-4 pr-4">
                <h4>Welcome <%= session.getAttribute("username")%></h4>
                <form action="Logout_reception">
                    <input type="submit" name="logout" class="btn btn-primary" value="Logout"/>
                </form>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

                        <div class="box-part text-center">

                            <i class="fa fa-heartbeat fa-4x" aria-hidden="true"></i>

                            <div class="title">
                                <a href="patient.jsp"><h4>Patients</h4></a>
                            </div>



                            <!--<a href="#">Learn More</a>-->

                        </div>
                    </div>	 

                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

                        <div class="box-part text-center">

                            <i class="fa fa-user-md fa-4x" aria-hidden="true"></i>

                            <div class="title">
                                <a href="doctor.jsp"><h4>Doctors</h4></a>

                            </div>



                            <!--<a href="#">Learn More</a>-->

                        </div>
                    </div>	 

                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

                        <div class="box-part text-center">

                            <i class="fa fa-calendar fa-4x" aria-hidden="true"></i>

                            <div class="title">
                                <a href="appointment.jsp"><h4>Appointments</h4></a>
                            </div>



                            <!--<a href="#">Learn More</a>-->

                        </div>
                    </div>	 

                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

                        <div class="box-part text-center">

                            <i class="fa fa-bed fa-4x" aria-hidden="true"></i>

                            <div class="title">
                                <a href="wards.jsp"><h4>Ward Allocation</h4></a>
                            </div>



                            <!--<a href="#">Learn More</a>-->

                        </div>
                    </div>	 

                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

                        <div class="box-part text-center">

                            <i class="fa fa-medkit fa-4x" aria-hidden="true"></i>

                            <div class="title">
                                <a href="symptoms.jsp"><h4>Symptoms</h4></a>
                            </div>



                            <!--<a href="#">Learn More</a>-->

                        </div>
                    </div>	 

                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

                        <div class="box-part text-center">

                            <i class="fa fa-user fa-4x" aria-hidden="true"></i>

                            <div class="title">
                                <a href="recep_profile.jsp"><h4>Profile</h4></a>

                            </div>

                            <form method="post" action="Delete_doctor">
                                <input type="hidden" value="<%= session.getAttribute("username")%>" name="id" >

                            </form>

                            <!--                        <a href="#">View Profile</a>-->
                        </div>
                    </div>

                </div>		
            </div>
        </div>
    </body>
</html>
