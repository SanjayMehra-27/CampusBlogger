<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>

<html lang="en">

<head>
     <meta charset="UTF-8">
    <link rel="apple-touch-icon" sizes="" href="views/img/logo.png">
    <link rel="icon" type="image/png" href="views/img/logo.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>
        Home | CampusBlogger
    </title>
	
	<!-- SummerNote TextEditor Scripts -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	
	   <!-- <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
 
	
	 <link rel="stylesheet" href="views/css/home.css">
    
   
    

</head>

<body class="profile-page sidebar-collapse ">
    
    
   
<%//if user is logged out redirect it to login.jsp
	String collegeId = (String)session.getAttribute("collegeId1");
		
	if( collegeId.toString().isEmpty()){
	
		response.sendRedirect("login.jsp");
		
	}


%> 

    
	<!-- Navbar -->  
   
     
      <nav class="navbar navbar-expand-lg fixed-top py-3">
       		 <div class="container">
       			 <a class="navbar-brand text-uppercase font-weight-bold" href="${pageContext.request.contextPath }/StudentController?action=HOME&cId=${student.collegeId}" rel="tooltip" title="Home" data-placement="bottom">
                   <!-- Logo -->
                    CampusBlogger

             	 </a>
            <button type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right"><i class="fa fa-bars"></i></button>
             
            <div id="navbarSupportedContent" class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
					<li class="nav-item ">
                       <a href="${pageContext.request.contextPath }/StudentController?action=HOME&cId=${student.collegeId}" class="nav-link activeH text-uppercase font-weight-bold">
                        <i class="fa fa-home" aria-hidden="true"></i> HOME </a>
                    </li> 
                    <li class="nav-item">
                       
      					  <a class="nav-link text-uppercase font-weight-bold"  href="${pageContext.request.contextPath }/StudentController?action=PROFILE&cId=${student.collegeId}&branchId=${student.branch}">
	   						 <i class="fa fa-user-circle" aria-hidden="true"> </i> PROFILE 
   						  </a>
                    </li>                   
					<li class="nav-item">
                        <a data-toggle="modal" data-target="#myEditor" href="${pageContext.request.contextPath }/StudentController?action=BlogPOST&cId=${student.collegeId}" class="nav-link text-uppercase font-weight-bold">
                       <i class="fa fa-pencil-square-o" aria-hidden="true"></i> POST 
                        </a>
                    </li>                    
                   <li class="nav-item">
                    	  <a href="${pageContext.request.contextPath }/logout.jsp" class="nav-link text-uppercase font-weight-bold">
                          <i class="fa fa-sign-out" aria-hidden="true"></i> Log Out </a>
                    </li>
                   
                </ul>
            </div>
        </div>
    </nav>
  <script type="text/javascript">$(function () {
	    $(window).on('scroll', function () {
	        if ( $(window).scrollTop() > 10 ) {
	            $('.navbar').addClass('active');
	        } else {
	            $('.navbar').removeClass('active');
	        }
	    });
	});</script>
   
   
   <!--END Navbar --> 
   
   
   
   
    <!-- List Of Post -->
<div class="row mt-5">


      <div class="card-group">
     <c:forEach items="${allBlogs}" var="blog">
  
    <div class="container" >
    
    
    <div class="col-md-12 col-sm-12">
  
    <div class="card fixed mt-5 shadow-lg p-3 mb-5 bg-white rounded " style=" margin:auto;" >
     			
     				<!-- Header -->
                  <div class="card-header bg-white">
                	 <h6 class="text-dark"><i class="fa fa-clock-o " aria-hidden="true"></i>
                 		 ${blog.postTime }
                 	 </h6> 
                 	 <h6 class="text-dark"> <i class="fa fa-calendar" aria-hidden="true"></i>
                 		 ${blog.postDate }
                 	 </h6>
              		<h3 class="text-capitalize text-justify text-center"><b>${blog.title}</b></h3>
                 </div>
            		
            		 <!-- Body -->
             	 <div class="card-body text-justify" id="post">

                 	<a href="${pageContext.request.contextPath }/StudentController?action=viewPROFILE&cId=${student.collegeId }&viewId=${blog.sid}" class="nav-link text-primary">
                  
                 	 <p class="card-title text-muted" > <b> ${blog.firstname} ${blog.lastname} </b> </p>
			     	 <p class="card-subtitle text-muted" > ${blog.branch } </p>
                  
                 	</a>
                 	<p class="card-text text-justify " id="post"> ${blog.post} </p> 
                
              	 </div>
              
              <!-- View User Blog Modal -->
				
     				<div class="modal fade"  tabindex="-1" id="myBlog${blog.blogpostId}">
					<div class="modal-dialog modal-xl">
					<div class="modal-content">
						
						<!-- Header -->
						
					<div class="card-header bg-dark text-light">
						<!-- Close Button -->
					<button type="button" class="close" data-dismiss="modal">
					<a href="#" class="btn btn-outline-light btn-lg"><i class="fa fa-times" aria-hidden="true"></i></a>
					</button>
						 <h6 class="text-light"><i class="fa fa-clock-o " aria-hidden="true"></i>
                 			 ${blog.postTime }
                 	 	 </h6>
                 	 	 <h6 class="text-light"> <i class="fa fa-calendar" aria-hidden="true"></i>
                 		 ${blog.postDate }
                 		 </h6>
               			 <h3 class="text-justify text-capitalize"> <b>  ${blog.title} </b></h3>
               			 <h6 class="card-title text-muted"> Written By ${blog.firstname} ${blog.lastname} </h6>
                 		 <h6 class="card-subtitle text-muted"> ${blog.branch} </h6>
                	</div>
					
					<!-- Body -->
					<div class="card-body">
						<p class="card-text text-justify"> ${blog.post} </p>
					</div>
                   	
                   		<!-- Footer -->
                   	  <div class="card-footer shadow-lg bg-white">
                   	 	
             			<input type="button" class="btn btn-danger btn-small" value="Like">
             		  </div>
             		  
                   	</div>
					</div>
					
				</div>
				
			<!--End View Blog User Modal -->
             	
              			
              			
              		<!-- Main Card Footer -->
              		<div class="card-footer  rounded">
					<input type="submit" class="btn active btn-dark btn-block"  data-toggle="modal"  data-target="#myBlog${blog.blogpostId}" value="Read More">
             		</div>
             	
				<%-- 	<form  action="StudentController" name="myform${blog.blogpostId}" onsubmit="myjs();return true" id="myform${blog.blogpostId}" method="get" enctype="multipart/form-data">
                  			<!-- hidden  -->
                 		<input type="hidden" name="action" value="HOME">
    					<input type="hidden" name="cId" value="${student.collegeId }">
    					<input type="hidden" name="viewId" value="${blog.blogpostId}">		
						</form> --%>
             		
            			
            			
			
            		
      </div>
      </div>
      </div>
  	 
      			
					
     </c:forEach>
     </div>
       <!-- ENDList Of Post -->
        
<!-- <script type="text/javascript">

$(function myjs() {
    $('#myform${blog.blogpostId}').on('submit',function (e) {

              $.ajax({
                type: 'get',
                url: 'StudentController',
                data: $('#myform${blog.blogpostId}').serialize(),
                
              });
          e.preventDefault();
        });
});
</script> 
      -->
      
      
       <!-- TEXT EDITOR Blog Modal || Post Blog-->
       
						
    				
    			
    				
     				<div class="modal fade "  tabindex="-1" id="myEditor" style="display: none;" aria-hidden="true">
					<div class="modal-dialog modal-xl">
					<div class="modal-content">
						
						<!-- Header -->
						
					<div class="card-header bg-dark text-light">
						<!-- Close Button -->
					<button type="button" class="close" data-dismiss="modal">
					<a href="#" class="btn btn-outline-light btn-lg"><i class="fa fa-times" aria-hidden="true"></i></a>
					</button>
					
						 <h6 class="text-light"><i class="fa fa-clock-o " aria-hidden="true"></i>
                 			 
                 	 	 </h6>
                 	 	 <h6 class="text-light"> <i class="fa fa-calendar" aria-hidden="true"></i>
                 		 
                 		 </h6>
               			 <h3 class="text-justify text-capitalize"> <b>   </b></h3>
               			 <h6 class="card-title text-muted"> Write Your Blog </h6>
                 		 <h6 class="card-subtitle text-muted"> </h6>
                	</div>
					
						<!-- Body -->
					<div class="card-body">
						
							
						<!-- text Editor Form -->
 						<form action="BlogPostController" method="post" enctype="multipart/form-data">
    					
    					  <!-- hidden  -->
    					<input type="hidden" name="sid" value="${student.collegeId}">
						<input type="hidden" name="viewId" value="${userBlog.blogpostId}">
                        <input type="hidden" name="collegeId" value="${student.collegeId}">
						
						<div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                        
                        	<div class="input-group ">
                         	
                         	<select  class="form-control custom-select" name="cardColor">
                           
                            <option value="bg-secondary" selected="selected"> Card Color </option>
                            <option value="bg-dark text-light">DARK</option>
                            <option value="bg-white">WHITE</option>
                            <option value="bg-primary">BLUE(Dark)</option>
                            <option value="bg-info">BLUE(Light)</option>
                            <option value="bg-success">GREEN</option>
                            <option value="bg-danger">RED</option>
                            <option value="bg-warning">YELLOW</option>
                            <option value="bg-secondary text-light">GRAY</option>
                            <option value="bg-light">LIGHT</option>
                            
                            
                            </select>
                        
                        	</div>
                           
                        </div>						
            		  	<input required="required" name="title" type="text" autofocus="autofocus" class=" form-control" placeholder=" Enter Title " >
            		  	<br>
  						<textarea  id="summernote" name="post">  </textarea>
  						
  						<button  type="submit" class="btn btn-dark btn-block">Post</button>
  						</form>	
					
					</div>
                   	
                   		<!-- Footer -->
                   <div class="card-footer">
                   	 	
             			<input type="button" class="btn btn-danger btn-small" data-dismiss="modal"  value="Close">
             	   
             	   </div>
             		  
                   </div>
				   </div>
					
				</div>
	</div>
			
				
				
			<!--End TEXT EDITOR Blog Modal -->
    
    <script>
    $('#summernote').summernote({
    	  placeholder: ' Write Your Blog Here ',
    	  tabsize: 2,
    	  height: 300,                 // set editor height
    	  minHeight: 300,             // set minimum height of editor
    	  maxHeight: 500,             // set maximum height of editor
    	  focus: true                  // set focus to editable area after initializing summernote
    	
    });      
      /* To Know More .. */
      /* https://summernote.org/getting-started/#basic-api */
    </script>
    
    <script >
    $(document).ready(function() {
    	  $('#summernote').summernote();
    });</script>
    
  
     
  
    
</body>

</html>