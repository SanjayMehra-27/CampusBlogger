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
    
     <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top navbar-transparent " color-on-scroll="200">
        <div class="container">
            <div class="navbar-translate">
                <a class="navbar-brand" href="${pageContext.request.contextPath }/StudentController?action=HOME&cId=${student.collegeId}" rel="tooltip" title="Home" data-placement="bottom">
                  <!-- Logo -->
                    <img alt="" src="views/img/logo.png" style="width:17em; ">

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
    
    
    <!-- End Navbar -->
   
    <div class="page-header page-header-xs" data-parallax="true" >
        <div class="filter"></div>
    </div>
    <div class="section profile-content">
        <div class="container">
            <div class="owner">
                
                                    
<!-- profile photo Modal -->
<a class="" data-toggle="modal" data-target="#myImage">  
        
            <div class="owner">

                <div class="avatar float-left">
                    <img src="data:image/jpg;base64,${student2.photo}" alt="Circle Image" class="img-thumbnail img-fluid img-responsive">
                </div>
			
            </div>
            
</a>
            
            
            
            
            
<div class="modal fade" id="myImage" style="display: none;" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
					
					<!-- Modal Header -->	
    				 <div class="modal-header bg-dark">
					<h5 class="modal-title text-light">Profile Picture Edit</h5>
					<button type="button" class="close" data-dismiss="modal">
					<h5 class="text-light">x</h5>
					</button>
					</div>
 															
 				   <!-- Modal body -->
 					<div class="modal-body">
                    <img src="data:image/jpg;base64,${student2.photo}" alt="Circle Image" class="img-thumbnail img-fluid img-responsive">

 		
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
         </div> 
      
            <!-- profile details -->
            <div class="row">
                <div class="col" >

                    <h4 class="title">${student2.firstname } ${student2.lastname }
                    </h4>
                    <h6 class="description"> Aspire As - ${student2.profesion} </h6>

                    <b>
                        <p>
                        
                        <br> ${student2.collegeId}
                        <br> ${student2.email} 
                        <br> ${student2.phonenumber}
                        <br> ${student2.branch}
                        
                        </p>
                    </b>
        </div>
        </div>
                  
                    <br/>
                    
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
        <!--My Post --> 
        
     <c:forEach items="${singleBlog}" var="blog">
                                                 
	<div class="container">
    
     		<div class="card bg-light " style="width:25%; margin:10px; float: left;">
     
                  <div class="card-header">
                   <h6><i class="fa fa-clock-o" aria-hidden="true"></i>
                  ${blog.postTime }
                  </h6> 
                  <h6> <i class="fa fa-calendar" aria-hidden="true"></i>
                  ${blog.postDate }
                  </h6>
                  <h5 class="text-capitalize" data-toggle="collapse" data-target="#msd${blog.blogpostId}" aria-expanded="true"> <b>  ${blog.title} </b></h5>
                 </div>
              		<a href="${pageContext.request.contextPath }/StudentController?action=ViewPOST&cId=${student.collegeId }&viewId=${blog.blogpostId}" class="nav-link text-primary">
         
             <img src="data:image/jpg;base64,${blog.blogPostImage}" class="img-fluid collapsed" data-toggle="collapse" data-target="#msd${blog.blogpostId}" aria-expanded="false" >    
            
             <div class="card-body collapse" id="msd${blog.blogpostId}">
             
                 <h6 class="card-title"> ${blog.firstname} ${blog.lastname} </h6>
                 <h6 class="card-subtitle text-muted"> ${blog.branch} </h6>

                 <p class="card-text" id="post"> ${blog.post} ... </p>
             <br>
                 <b id="readmore">Read More</b>
              
                 
             </div> 
             </a>   
                 <hr>
                 
         
        
      </div>
  
     </div>
     </c:forEach>
     
                                                      </div>
                                                      <div id="menu1" class="container tab-pane fade"><br>
                                                        <h3>This Page Will Comming Soon...Keep Enjoy Blogging</h3>
                                                      </div>
                                                     
                                                    </div>
                                                  </div>
       </div>
    <div class="container" style="float: left"> 
    <footer class="footer">
        <div class="container">
            <div class="row">
                <nav class="footer-nav">
                    <ul>
                        <li>
                            <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com/" target="_blank">Blog</a>
                        </li>
                        <li>
                            <a href="https://www.creative-tim.com/license" target="_blank">Licenses</a>
                        </li>
                    </ul>
                </nav>
                <div class="credits ml-auto">
                    <span class="copyright">
                        ©
                        <script>
                            document.write(new Date().getFullYear())
                        </script>, made with <i class="fa fa-heart heart"></i> by Creative Tim
                    </span>
                </div>
            </div>
        </div>
    </footer>
    </div>  
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