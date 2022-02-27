<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="view/assets/img//apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img//favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>
        Home
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
        name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <!-- CSS Files -->
    <link href="views/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="views/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="views/assets/demo/demo.css" rel="stylesheet" />
    
    <style type="text/css">
    img{
    height: 100px;
    width: 100px;
    }
    img[src="data:image/jpg;base64,"] {
	visibility: hidden;
	}
	
	
    </style>
    
</head>

<body class="profile-page sidebar-collapse">
    
    
   
<%
	//if user is logged out redirect it to index.jsp...
	String collegeId = (String)session.getAttribute("collegeId1");
		
	if(collegeId==null){
	
		response.sendRedirect("login.jsp");
		
	}


%> 
    
    
     <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top " color-on-scroll="70">
        <div class="container">
            <div class="navbar-translate">
                <a class="navbar-brand" href="${pageContext.request.contextPath }/StudentController?action=HOME&cId=${student.collegeId}" rel="tooltip" title="Home" data-placement="bottom">
                   

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
                        <a href="${pageContext.request.contextPath }/StudentController?action=PROFILE&cId=${student.collegeId}&branchId=${student.branch}" class="nav-link">
                       <i class="fa fa-user-circle" aria-hidden="true"></i> Profile </a>
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
    
    
    
   <!-- Post -->
   
    <div class="container" >
    
	<div class="card bg-light fixed" style="width:100%; margin:1px; margin-top:10%;" >
     
                  <div class="card-header"><time >${userBlog.postDate }</time>
                <h3 class="text-justify text-capitalize	"> <b>  ${userBlog.title} </b></h3>
                <h6 class="card-title text-muted"> Written By ${userBlog.firstname} ${userBlog.lastname} </h6>
                 <h6 class="card-subtitle text-muted"> ${userBlog.branch} </h6>
                 </div>
         
         		
         		<div class="card-body">
            	 <img src="data:image/jpg;base64,${userBlog.blogPostImage}" class="bg-light img-fluid img-responsive img-thumbnail" style="width:40%; margin: auto; margin-top:; float: left; padding: 2px;"  >    
             	
 				<textarea rows="20" cols="85" class="bg-light" disabled="disabled" style="border: hidden;"> ${userBlog.post}</textarea>
             	
               <!-- <aside>
           		 <p class="card-text text-justify " align="right"  inputmode="none" style=" margin-left:40%;"> ${userBlog.post} </p>
               </aside>
               --> 
                </div>
                
                
             <div class="card-footer">
             		<a> Like </a>	
              </div>
              
             </div>
       </div>
     <br>
              
                 
            
    
    
     
     
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