<%-- 
    Document   : admin_add_reception
    Created on : 14 May 2021, 01:23:43
    Author     : alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //No access if there is no session attribute
    if (session.getAttribute("username") == null) {
        response.sendRedirect("/CareAndCure/admin_login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Reception</title>
        <link href="assets/img/favicon.ico" rel="icon">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
                        <a class="nav-link dropdown-toggle active " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                        
                          <div class="container">
            <div class="card bg-light">
                <article class="card-body mx-auto" style="max-width: 400px;">
                    <h4 class="card-title mt-3 text-center">Update doctor</h4>
                    <div>${status}</div>
                    <form action="Admin_add_recep" method="post">
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="fname" class="form-control" placeholder="First Name" type="text" required>
                        </div> <!-- form-group// -->
                        
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="lname" class="form-control" placeholder="Last Name" type="text" required>
                        </div> <!-- form-group// -->
                        
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                            </div>
                            <input name="email" class="form-control" placeholder="Email" type="text" required>
                        </div> <!-- form-group// -->

                         <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                            </div>
                            <select class="custom-select" style="max-width: 120px;">
                                <option selected="">+94</option>
                            </select>
                            <input name="phone_no" class="form-control" placeholder="Phone Number" type="text" required>
                        </div> <!-- form-group// -->

                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="username" class="form-control" placeholder="Username" type="text" required>
                        </div> <!-- form-group// -->
                        
                         <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                            </div>
                             <input name="password" class="form-control" placeholder="Password" type="password" required>
                        </div> <!-- form-group// -->

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block"> Add Receptionist </button>
                        </div> <!-- form-group// -->      

                    </form>

                </article>
            </div> <!-- card.// -->

        </div> 
        <!--container end.//-->

        
    </body>
</html>
