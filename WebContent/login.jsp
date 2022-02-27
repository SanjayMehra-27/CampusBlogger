<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>

<head>
<style type="text/css">

#alertMessage:{

}

</style>

    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Login in</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href=''>
    <script src=''></script>

    <!-- Bootstrap CDN -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>

<body>

				<!-- SuccessMessage -->

      <p id="alertMessage" class="alert alert-danger" style="width: 30%; margin:auto; margin-top:3%; padding: 40px; top: auto;"  > <b class="text-dark"> ${SuccessMessage} </b> <span class="close" data-dismiss="alert"> X </span></p>
	
   <!-- body of shadow form -->
    <div class=" container mt-2 pt-2 d-sm-flex justify-content-sm-center ">
    
    
        <!-- shadow -->
        <div class="shadow  bg-white  border rounded ">
            <!-- body of form -->
            <div class="d-sm-flex justify-content-sm-center ">
    
 
<form action="LoginController" method="post" enctype="application/x-www-form-urlencoded">
 
<div class="card">

   
      
<div class="card-header bg-dark">
<h4 class="text-light">LogIn</h4>
 <!-- Logo -->
                    <img alt="" src="views/img/logo1.png" style="width:17em; ">


</div>

<div class="card-body">


                        <!-- College Id -->
                        <div class="flex-sm-column form-group flex-fill justify-content-sm-center">
    
                            <div class="input-group mb-3 p-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">College ID</span>
                                </div>
                                <input type="text" class="form-control" name="collegeId" id="" placeholder="College ID">
    
                            </div>
                          </div>
                          
                            <!-- Password -->
                            <div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                            
                                <div class="input-group mb-3 p-4">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Password</span>
                                    </div>
                                    <input type="password" class="form-control" name="password" id="" placeholder="Password">
                            
                                </div>
                              </div>
    
                        
    
                            <!-- SignIn Button -->
                            <div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                                <div class="input-group mb-3 p-4">
                                    <button type="submit" class="btn btn-primary">Sign In</button>
                                </div>
                            </div>

                          <!--  signup link   -->
                          <div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                            <div class="input-group mb-3 p-4">
                            <p> <b> Click Here For </b>
                             <a href="${pageContext.request.contextPath }/index.jsp" > 
                              Sign Up
                              </a> 
                              </p>
                   
                        	</div>
                          </div>
</div>                  
</div>
</form>

    </div>
    
     </div>
   
    </div>
  
               
                   
    
                
    
     


</body>

</html>