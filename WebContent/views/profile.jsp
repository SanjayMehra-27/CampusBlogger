<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img//apple-icon.png">
    <link rel="icon" type="image/png" href="views/assets/img//favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>
        Profile
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
        name='viewport' />
        
         <!-- Bootstrap CDN -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        
	<style type="text/css">
    
    #post{
    
    max-height: 60px;
    overflow: hidden;
    
     }
    #readmoreLine{
     
    padding:10px;
    visibility: collapse;
    opacity: inherit;
    
    }
    img[src = "data:image/jpg;base64,bnVsbA=="]{
    visibility: hidden;
    }
    img[src="data:image/jpg;base64,"] {
	visibility: hidden;
	}
    
    </style>
        
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <!-- CSS Files -->
    <link href="views/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="views/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="views/assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="profile-page sidebar-collapse">
    
  <%
  //if user is logged out redirect it to index.jsp
	String collegeId = (String)session.getAttribute("collegeId1");
		
	if(collegeId==null){
	
		response.sendRedirect("login.jsp");
		
	}


%> 
    
    
  
  
  
  
    <!-- Navbar -->
    
    <nav class="navbar navbar-expand-lg fixed-top navbar-transparent " color-on-scroll="300">
        <div class="container">
            <div class="navbar-translate">
                <a class="navbar-brand" href="${pageContext.request.contextPath }/StudentController?action=HOME&cId=${student.collegeId}" rel="tooltip" title="Home" data-placement="bottom">
                   <!-- Logo -->
                    <img alt="" src="views/img/logo1.png" style="width:17em; ">

                </a>
                
                <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navigation" aria-controls="navigation-index" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-bar bar1"></span>
                    <span class="navbar-toggler-bar bar2"></span>
                    <span class="navbar-toggler-bar bar3"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse justify-content-end" id="navigation">
                <ul class="navbar-nav">
                    <li class="nav-item">
                       <a href="${pageContext.request.contextPath }/StudentController?action=HOME&cId=${student.collegeId}" class="nav-link">
                        <i class="fa fa-home" aria-hidden="true"></i> HOME </a>
                    </li>
                   <li class="nav-item">
                        <a href="${pageContext.request.contextPath }/StudentController?action=BlogPOST&cId=${student.collegeId}"
                            target="_blank" class="nav-link"><i class="nc-icon nc-book-bookmark"></i> Post Blog </a>
                    </li>
 					
                    <li class="nav-item">
                    
                          
                          <a href="${pageContext.request.contextPath }/logout.jsp" class="nav-link">
                       <i class="fa fa-sign-out" aria-hidden="true"></i> LogOut </a>
                        
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->
   
               <!-- profile photo -->
    <div class="page-header page-header-xs" data-parallax="true" >
        <div class="filter"></div>
    </div>
    
    <div class="section profile-content">
    
    	<div class="container">
                     
<!-- profile photo Modal -->
<a class="" data-toggle="modal" data-target="#myImage">  
        
            <div class="owner">

                <div class="avatar float-left">
                    <img src="data:image/jpg;base64,${student.photo}" alt="Circle Image" class="img-thumbnail img-fluid img-responsive"  style="">
                </div>

            </div>
            
</a>
            
            
            
            
            
<div class="modal fade" id="myImage" style="display: none;" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
					
					<!-- Modal Header -->	
    				 <div class="modal-header bg-dark">
					<h5 class="modal-title text-light">View Profile Picture</h5>
					<button type="button" class="close" data-dismiss="modal">
					<h5 class="text-light">x</h5>
					</button>
					</div>
 															
 				   <!-- Modal body -->
 					<div class="modal-body">
                    <img src="data:image/jpg;base64,${student.photo}" alt="Circle Image" class="img-thumbnail img-fluid img-responsive">

 		
				</div> 
         			 
         		  <!--End Modal body -->
                                                                
               
		<!-- Modal footer -->
			<div class="modal-footer">
		<button  type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
			</div>
</div>
</div>
</div>

         
            <!-- profile details -->
            <div class="row">
                <div class="col">

                    <h4 class="title">${student.firstname } ${student.lastname }
                    </h4>
                    <h6 class="description"> Aspire As - ${student.profesion } </h6>

                    <b>
                        <p>
                        
                        <br><i class="fa fa-id-card" aria-hidden="true"></i> ${student.collegeId}
                         
                        <br><i class="fa fa-envelope" aria-hidden="true"></i> ${student.email}
                         
                        <br><i class="fa fa-phone-square" aria-hidden="true"></i> ${student.phonenumber}
                         
                        <br><i class="fa fa-graduation-cap" aria-hidden="true"></i> ${student.branch}<br>
                         
                        </p>
                    </b>
                    
                    <br/>
                    
                    
							<button type="button" class="btn btn-outline-dark text-dark" data-toggle="modal" data-target="#myModal">
                             Edit
                                                        
                            </button> 
                        
                           </div>
                           
                           
                           </div>
            
            
            
         			<div class="modal fade" id="myModal" style="display: none;" aria-hidden="true">
                                 
                                 								 
                                                                                         
								    	 <div class="modal-dialog">
                                                           
										 <div class="modal-content">
          			
          												<!-- Modal Header -->	
          								
          														 <div class="modal-header bg-dark">
                                                                    <h5 class="modal-title text-light">Profile Edit</h5>
                                                                    <button type="button" class="close" data-dismiss="modal"><h5 class="text-light">x</h5></button>
                                                                  </div>
 															
 																
                                                           <!-- Modal body -->
                                                                  <div class="modal-body">
                                                                   
 <!-- body of form -->
 
            <div class="d-sm-flex justify-content-sm-center">            
			
	<form method="post" action="StudentController" enctype="multipart/form-data" >			
		

	
                  <div class="flex-sm-row">
                      
                        <!-- name -->
                        <div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                           
                                <div class="input-group ">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-dark text-light">Student</span>
                                    </div>
                                     <input autofocus="autofocus" required="required" type="text" class="form-control" name="firstname" value="${student.firstname }" placeholder="First Name">
                                  	 <input required="required" type="text" class="form-control" name="lastname" value="${student.lastname }" placeholder="Last Name">
                                </div>
                        </div>

                        <!-- College Id -->
                        <div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                        
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-dark text-light">College ID</span>
                                </div>
                                <input required="required" type="text" class="form-control" name="collegeId" value="${student.collegeId }" placeholder="College ID">
                            </div>
                          </div> 
    
                           <!-- Email -->
                            <div class="flex-sm-column form-group flex-fill justify-content-sm-center">

                            <div class="input-group ">
                                <input required="required" type="text" class="form-control" placeholder="Your Email" value="${student.email }" name="email">
                                <div class="input-group-append">
                                    <span class="input-group-text bg-dark text-light"> @gmail.com </span>
                                </div>
                            </div>
                            
                            </div>
                              <!-- phone Number -->
                        <div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                        
                             <div class="input-group ">
                              
                                <div class="input-group-prepend">
                                
                                    <span class="input-group-text bg-dark text-light">Number</span>
                                    
                                </div>
                                
                                <input type="text" class="form-control" name="phonenumber" value="${student.phonenumber }" placeholder="Phone Number">
                        
                            </div>
                      	</div>
                      	
                      	 <!-- profession -->
                        <div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                        
                            <div class="input-group ">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-dark text-light">Aspiring As </span>
                                </div>
                                <input type="text" class="form-control" name="profession" value="${student.profesion}" placeholder=" Ex. Java Developer ">
                        
                            </div>
                      	</div>

                        <!-- Password -->
                        <div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                        
                            <div class="input-group ">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-dark text-light">Password</span>
                                </div>
                                <input required="required" type="password" class="form-control" name="password" value="${student.password}" placeholder="Create Password">
                            </div>
                            
                      	</div>

			<!-- Choose Photo -->
			<div class="flex-sm-column form-group flex-fill justify-content-sm-center">
			<div class="custom-file mb-3">
            <input src="data:image/jpg;base64,${student.photo}" value="data:image/jpg;base64,${student.photo}" type="file" class="custom-file-input" id="customFile"  name="profileImage">
            <label class="custom-file-label" for="customFile">Choose file</label>
         	 </div>                            
         	 </div>
                      	
                      	<!-- Branch -->
                      	<div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                        
                        <div class="input-group ">
                         	<select class="form-control" name="branch">
                           
                            <option value="${student.branch}" selected="selected">Branch</option>
                            <option value="B.TECH">B.Tech</option>
                            <option value="B.C.A">B.C.A</option>
                            <option value="B.B.A">B.B.A</option>
                            
                            </select>
                        
                        </div>
                           
                        </div>
                        
                       <!-- Id || Hidden -->
                      <input type="hidden" name="id"  value="${student.id}" />
                      	
           
	</div>

 				  <!-- SignUp Button -->
 				   <div class="justify-content-sm-center">				   
 				   <div class="flex-sm-column form-group flex-fill">
                            
                            <div class="input-group">
                       		<button type="submit" class="btn btn-outline-dark rounded text-dark">Save</button>
       	                    </div>
       	                    
                    </div>
					</div>
                       
 </form>
 
</div>
           
           
           </div> 
           
           <!--End Modal body -->
                                                                  
                                                                  <!-- Modal footer -->
                                                                  <div class="modal-footer">
                                                                    <button  type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                                                                  </div>
                                                         
                                                     </div>
                                                     </div>
                                            </div>
                                        </div>                                                                                        
                                                             
                                <hr>                               
            <br />
           <div  class="container">
        <!-- Nav tabs -->
                                                    <ul class="nav nav-tabs" role="tablist">
                                                      <li class="nav-item ">
                                                       
                                                        <a class="nav-link active" data-toggle="tab" href="#home">  Post
                                                 
                                                      	</a>   
                                                      </li>
                                                      
                                                      <li class="nav-item">
                                                        <a class="nav-link " data-toggle="tab" href="#menu1"> CLASS-MATES </a>
                                                      </li>
                                                      
                                                    </ul>
                                                  
                                                    <!-- Tab panes -->
                                                    <div class="tab-content">
                                                      <div id="home" class="container tab-pane active"><br>
                                                      
                                                       <!-- SuccessMessage -->
   
     <p class="alert alert-danger" style="width: 40%; margin:auto; margin-top:3%; padding: 40px; top: auto;"  > <b> ${SuccessMessage} </b> <span class="close" data-dismiss="alert"> X </span></p>
          
   
        <!--My Post --> 
        
  <c:forEach items="${singleBlog}" var="blog">
                                                 
	<div class="container">
    
     		<div class="card bg-light " style="width:25%; margin:10px; float: left;">
                  <img src="data:image/jpg;base64,${blog.blogPostImage}" class="img-fluid collapsed" data-toggle="collapse" data-target="#msd${blog.blogpostId}" aria-expanded="true" >    
     
                  <div class="card-header">
                   <h6><i class="fa fa-clock-o" aria-hidden="true"></i>
                  ${blog.postTime }
                  </h6> 
                  <h6> <i class="fa fa-calendar" aria-hidden="true"></i>
                  ${blog.postDate }
                  </h6>
                  
                <h5 class="text-capitalize" > <b>  ${blog.title} </b></h5>
                 
             
               
         
            </div>
             <div class="card-body collapse" id="msd${blog.blogpostId}">
             
                 <h6 class="card-title"> ${blog.firstname} ${blog.lastname} </h6>
                 <h6 class="card-subtitle text-muted"> ${blog.branch} </h6>
				<a href="${pageContext.request.contextPath }/StudentController?action=ViewPOST&cId=${student.collegeId }&viewId=${blog.blogpostId}" class="nav-link text-primary">
					<p class="card-text" id="post"> ${blog.post} ... </p>
             		<br>
                	 <b id="readmore"> Read More </b>
                </a>
                 
             </div> 
              
                 <hr>
                 
             
             <div class="card-footer">
             <a href="${pageContext.request.contextPath }/StudentController?action=EditPOST&cId=${student.collegeId }&viewId=${blog.blogpostId}" class="nav-link text-success">
                 <i class="fa fa-pencil-square" aria-hidden="true"></i><b> EDIT </b>
              </a>
               <a href="${pageContext.request.contextPath }/StudentController?action=DeletePOST&cId=${student.collegeId }&viewId=${blog.blogpostId}" class="nav-link text-success">
                 <i class="fa fa-trash" aria-hidden="true"></i>
                 <b> DELETE  </b>
              </a>
              </div>
        
      </div>
  
     </div>
     </c:forEach>
                                                      </div>
                                                      <div id="menu1" class="container tab-pane fade"><br>
                                                    <c:forEach items="${listStudent}" var="Student">
                                                        <h5>${Student.firstname} ${Student.lastname} </h5>
                                                        <h6>${Student.profesion}</h6>
                                                        <h6>${Student.collegeId} </h6>
                                                      <br>
                                                     </c:forEach>
                                                     </div>
                                                     
                                                    </div>
                                                  </div>
       </div>
                   <!-- 
                        <script>
                        
                            document.write(new Date().getFullYear())
                        </script>
                     --> 
                        
                        
    <!--   Core JS Files   -->
    <script src="views/assets/js/core/jquery.min.js" type="text/javascript"></script>
    <script src="views/assets/js/core/popper.min.js" type="text/javascript"></script>
    <script src="views/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
    <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
    <script src="views/assets/js/plugins/bootstrap-switch.js"></script>
    <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
    <script src="views/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
    <!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
    <script src="views/assets/js/plugins/moment.min.js"></script>
    <script src="views/assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- Control Center for Paper Kit: parallax effects, scripts for the example pages etc -->
    <script src="views/assets/js/paper-kit.js?v=2.2.0" type="text/javascript"></script>
    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
</body>

</html>