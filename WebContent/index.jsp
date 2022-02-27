<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>SignUp</title>
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

<body class="container bg-white ">

<!-- body of shadow form -->
 <div class="container mt-1 p-1 d-sm-flex justify-content-sm-center ">

       
        <!-- shadow -->
        <div class="shadow bg-white  border rounded " >
		
			<!-- body of form -->
            <div class="d-sm-flex justify-content-sm-center">            
			
<form method="post" action="StudentController" enctype="multipart/form-data">			
		
<div class="card">
 
<div class="card-header bg-dark">
<h5 class="text-danger">  </h5>
<h3 class="text-light">Sign Up</h3>
 <!-- Logo -->
                    <img alt="" src="views/img/logo1.png" style="width:17em; ">

</div>

	<div class="card-body">
	
                  <div class="flex-sm-row">
                      
                        <!-- name -->
                        <div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                           
                                <div class="input-group mb-3 p-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Student</span>
                                    </div>
                                    <input required="required" type="text" class="form-control" name="firstname" id="" placeholder="First Name">
                                    <input required="required" type="text" class="form-control" name="lastname" id="" placeholder="Last Name">
                                </div>
                            
                        </div>

                        <!-- College Id -->
                        <div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                        
                            <div class="input-group mb-3 p-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">College ID</span>
                                </div>
                                <input required="required" type="text" class="form-control" name="collegeId" id="" placeholder="College ID">
                               
                            </div>
                          </div> 
                          
                           <!-- phone Number -->
                        <div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                        
                            <div class="input-group mb-3 p-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> +91 </span>
                                </div>
                                <input type="text" class="form-control" name="phonenumber" id="" placeholder="Phone Number">
                        
                            </div>
                      	</div>
	 

                            <!-- Email -->
                            <div class="flex-sm-column form-group flex-fill justify-content-sm-center">

                            <div class="input-group mb-3 p-3">
                                <input required="required" type="text" class="form-control" placeholder="Your Email" id="" name="email">
                                <div class="input-group-append">
                                    <span class="input-group-text">@gmail.com</span>
                                </div>
                            </div>
                            
                            </div>

                        <!-- Password -->
                        <div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                        
                            <div class="input-group mb-3 p-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Password</span>
                                </div>
                                <input required="required" type="password" class="form-control" name="password" id="" placeholder="Create Password">
                            </div>
                      	</div>
                      	
                      	 <!-- Branch -->
                      	<div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                        
                        <div class="input-group mb-3 p-3">
                         	<select class="form-control" name="branch">
                           
                            <option disabled="disabled" selected="selected">Branch</option>
                            <option value="B.TECH">B.Tech</option>
                            <option value="B.C.A">B.C.A</option>
                            <option value="B.B.A">B.B.A</option>
                            
                            </select>
                        
                        </div>
                           
                        </div>
                        
                      	           
                      <input type="hidden" name="id" />
                      	
                       <input type="file" class="custom-file-input" id="customFile"  name="profileImage">
           
	</div>

 				  <!-- SignUp Button -->
 				   <div class="justify-content-sm-center">
 				   
 				   <div class="flex-sm-column mb-3 p-3 form-group flex-fill">
                            <div class="input-group ">
                            <button type="submit" class="btn btn-primary">Sign Up</button>
       	                    </div>
                    </div>
                    
					</div>
                       


 					<!-- signIn link   -->
                       <div class="justify-content-sm-center">
                            <div class="input-group mb-2 p-3">
                        
                                <p> <b> Click Here For </b><a href="${pageContext.request.contextPath }/login.jsp" class="text-warning"><b> Sign In </b></a>
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