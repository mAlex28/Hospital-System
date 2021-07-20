<%-- 
    Document   : check_symptoms
    Created on : 28 Apr 2021, 09:18:09
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
          <title>Check symptoms</title>
        
         <link href="assets/img/favicon.ico" rel="icon">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

        
        <link rel="stylesheet" href="assets/css/symptoms.css"/>
    </head>
    <body>
       <div class="heading">
            <h4>Allocate Wards</h4>
            <hr>
        </div>
        
        <div class="container pt-2">
    <div class="row">
        <div class="col">
             <h4>Select your age</h4>
               <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-plus-square"></i> </span>
		</div>
         <select name="age" class="form-control">
			<option selected="">Age</option>
                        <option>-17</option>
			<option>17-24</option>
			<option>25-40</option>
			<option>40-60</option>
                        <option>60+</option>
		</select>
	</div> <!-- form-group end.// -->
        </div>
        <div class="col">
            <h4>Related diagnosis</h4>
            <table class="table table-bordered table-responsive">
                  <thead class="thead-light">
                <tr>
                    <th scope="col">Symptom</th>
                    <th scope="col">Disease</th>
                    
                </tr>
                  </thead>
                  <tbody>
                      <tr>
                    <td scope="col">Headache</td>
                    <td scope="col">Fever</td>
                    
                </tr>
                  </tbody>
            </table>
        </div>
        
  </div>
            <div class="row">
        <div class="col">
             <h4>Select the symptoms</h4>
               <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-plus-square"></i> </span>
		</div>
         <select name="symp1" class="form-control">
			<option selected="">Symptom #1</option>
                        <option>Headache</option>
			<option>Knee Pain</option>
			<option>Elbow Pain</option>
			<option>Vomiting</option>
                        <option>Dizzy</option>
		</select>
	</div> <!-- form-group end.// -->
          <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-plus-square"></i> </span>
		</div>
         <select name="symp2" class="form-control">
			<option selected="">Symptom #2</option>
                        <option>-Headache</option>
			<option>Knee Pain</option>
			<option>Elbow Pain</option>
			<option>Vomiting</option>
                        <option>Back pain</option>
		</select>
	</div> <!-- form-group end.// -->
        </div>
        <div class="col">
            <a href="" class="btn btn-success">Chanel doctor</a>
        </div>
        
  </div>
            
            <div class="row">
        <div class="col">
             <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block"> Search </button>
       
    </div> <!-- form-group// -->   
        </div>
                <div class="col">
             <div class="form-group">
                
       <a href="" class="btn btn-danger">Cancel</a>
    </div> <!-- form-group// -->   
        </div>
  </div>
</div>
    </body>
</html>
