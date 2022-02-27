<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img//apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img//favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>
        Home
    </title>


    
    <style type="text/css">
    
    #post{
    
    max-height:60px;
    overflow: hidden;
    
     }
    #readmoreLine{
     
    padding:5px;
    visibility: collapse;
    opacity: inherit;
    
    
    }
  	img[src="data:image/jpg;base64,"] {
	visibility: hidden;
	}
	
	    
    </style>
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
</head>

<body class="profile-page sidebar-collapse ">
    
    
   
<%//if user is logged out redirect it to index.jsp
	String collegeId = (String)session.getAttribute("collegeId1");
		
	if( collegeId.toString().isEmpty()){
	
		response.sendRedirect("login.jsp");
		
	}


%> 
    
   
    
    
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top bg-dark" color-on-scroll="10">
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
                        <a href="${pageContext.request.contextPath }/StudentController?action=PROFILE&cId=${student.collegeId}&branchId=${student.branch}" class="nav-link">
                       <i class="fa fa-user-circle" aria-hidden="true"></i>Profile </a>
                    </li>
                    
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath }/StudentController?action=BlogPOST&cId=${student.collegeId}" class="nav-link">
                        <i class="nc-icon nc-book-bookmark"></i>PostBlog</a>
                    </li>
                    
                     <li class="nav-item">
                          
                          <a href="${pageContext.request.contextPath }/logout.jsp" class="nav-link">
                        <i class="fa fa-sign-out" aria-hidden="true"></i> LogOut </a>
                        
                    </li>
                   <li class="nav-item">
                      
                    </li>
           
                </ul>
            </div>
        </div>
    </nav>
    <br><br><br>
  
    
                     <!-- Post Titles -->
   
    <div class="card" style="justify-content; width:30%; padding :10px; position: fixed;">
    
    <div class="card-header bg-dark " >
    
    <h4 class="text-light">Related Title</h4>
    
    </div>
    
    <div class="card-body">
         <c:forEach items="${allBlogs}" var="blogTitle">

	<a href="${pageContext.request.contextPath }/StudentController?action=viewPROFILE&cId= ${student.collegeId }&viewId=${blogTitle.sid}" class="nav-link text-primary">

    	<h6 class="text-muted"> ${blogTitle.title} </h6>
    	
    </a>
    	</c:forEach>
    	<br>
    </div>
    </div>
   
    <!-- SuccessMessage -->
   
     <p class="alert alert-danger" id="alert"  style="width: 40%; margin:auto; margin-top:3%; padding: 40px; top: auto;"  > <b> ${SuccessMessage} </b> <span class="close" data-dismiss="alert"> X </span></p>
          
    
    <!-- List Of Post -->
      
    <c:forEach items="${allBlogs}" var="blog">
  
    <div class="container"  style="padding-top: 40px;" >
    
    <div class="card fixed" style="width:40%; margin:auto;" >
     
                  <div class="card-header">
                 <h6><i class="fa fa-clock-o" aria-hidden="true"></i>
                  ${blog.postTime }
                  </h6> 
                  <h6> <i class="fa fa-calendar" aria-hidden="true"></i>
                  ${blog.postDate }
                  </h6>
                <h3 class="text-capitalize	"><b>${blog.title}</b></h3>
                 </div>
         
         	 <img src="data:image/jpg;base64,${blog.blogPostImage}" class="img-fluid img-responsive" > 
             
             <div class="card-body">

                 <a href="${pageContext.request.contextPath }/StudentController?action=viewPROFILE&cId=${student.collegeId }&viewId=${blog.sid}" class="nav-link text-primary">
                  
                  <h5 class="card-title" > ${blog.firstname} ${blog.lastname} </h5>
			     <h6 class="card-subtitle text-muted"> ${blog.branch} </h6>
                  
                  </a>

				<a href="${pageContext.request.contextPath}/StudentController?action=ViewPOST&cId=${student.collegeId }&viewId=${blog.blogpostId}" class="nav-link text-primary">
                               
                 <p class="card-text text-justify" id="post"> ${blog.post}... </p> 
                 
                 <p class="text-dark">
                 <b id="readmore">Read More</b>
                 </p>
                 </a>
              </div>
              <hr>
              <div class="card-footer" id="footer">
              <p id="like"></p>
            </div>
      </div>
     </div>
     <br>
     
     </c:forEach>
     
    
     
     
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