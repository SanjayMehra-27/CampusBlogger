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
        Profile | CampusBlogger
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
        name='viewport' />
     
     <!-- Google Fonts -->
     <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    
	<!-- SummerNote TextEditor Scripts -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	
	
	<!-- User Profile CSS File -->
	<link rel="stylesheet" href="views/css/userProfile.css">
        

        
    <!-- <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    
   
</head>

<body class="profile-page sidebar-collapse">
    
  <%
  //if user is logged out redirect it to index.jsp
	String collegeId = (String)session.getAttribute("collegeId1");
		
	if(collegeId==null){
	
		response.sendRedirect("login.jsp");
		
	}


%> 
    
    <!-- START NAVBAR -->
  
      <nav class="navbar navbar-expand-lg fixed-top py-3">
       		 <div class="container">
       			 <a class="navbar-brand text-uppercase font-weight-bold" href="${pageContext.request.contextPath }/StudentController?action=HOME&cId=${student.collegeId}" rel="tooltip" title="Home" data-placement="bottom">
                   <!-- Logo -->
                    CampusBlogger

             	 </a>
            <button type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right"><i class="fa fa-bars"></i></button>
            
            <div id="navbarSupportedContent" class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
					<li class="nav-item">
                       <a href="${pageContext.request.contextPath }/StudentController?action=HOME&cId=${student.collegeId}" class="nav-link text-uppercase font-weight-bold">
                        <i class="fa fa-home" aria-hidden="true"></i> HOME </a>
                    </li>                    
					<li class="nav-item">
                        <a data-toggle="modal" data-target="#myEditor" href="${pageContext.request.contextPath }/StudentController?action=BlogPOST&cId=${student.collegeId}"target="_blank" class="nav-link text-uppercase font-weight-bold">
                           <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Post </a>
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
	        if ( $(window).scrollTop() > 100 ) {
	            $('.navbar').addClass('active');
	        } else {
	            $('.navbar').removeClass('active');
	        }
	    });
	});</script>
  
   
	<!-- END NAVBAR -->





 <!-- PROFILE PAGE OUTER BODY -->

<div class="py-5 px-4">
    <div class="col-xl-12 col-md-12 col-sm-12 mx-auto">

        <!-- Profile widget -->
        <div class="bg-white shadow rounded overflow-hidden">
            <div class="px-4 pt-0 pb-4 bg-dark">
                <div class="media align-items-end profile-header">
                    <div class="profile mr-3">
                    
                    <!-- Profile Picture -->
                    <a class="rounded" data-toggle="modal" data-target="#myImage">
                    <img style="border-radius: 50%;" src="data:image/jpg;base64,${studentImage.photo}"  onerror="this.onerror=null; this.src='views/assets/img/default-avatar.png'"  alt="Circle Image" width="130" class="">
                    </a>
                    <a href="#"  data-toggle="modal" data-target="#myModal" class="btn btn-outline-dark btn-sm btn-block rounded mt-2"> Edit </a></div>
                    
                    <!-- Profile Info -->
                    <div class="media-body mb-5 text-white">
                        <h4 class="mt-0 mb-0 font-italic"> ${student.firstname } ${student.lastname } </h4>
                        <p class="small mb-4 font-italic text-uppercase"> <b> ${student.profesion }</b>
                        
                        <br><i class="fa fa-id-card " aria-hidden="true"></i> ${student.collegeId}
                         
                        <br><i class="fa fa-envelope" aria-hidden="true"></i> ${student.email}
                         
                        <br><i class="fa fa-phone-square" aria-hidden="true"></i> ${student.phonenumber}
                         
                        <br><i class="fa fa-graduation-cap" aria-hidden="true"></i> ${student.branch}<br>
                        
                        </p>
                    </div>
                </div>
                
            </div>

            <div class="bg-light p-4 d-flex justify-content-end text-center">
                <ul class="list-inline mb-0">
                    <li class="list-inline-item">
                        <h5 class="font-weight-bold mb-0 d-block"> ${UserPostCount.postCount} </h5><small class="text-muted"> <i class="fa fa-picture-o mr-1"></i>Posts</small>
                    </li>
                    <li class="list-inline-item">
                        <h5 class="font-weight-bold mb-0 d-block">84K</h5><small class="text-muted"> <i class="fa fa-user-circle-o mr-1"></i>Followers</small>
                    </li>
                </ul>
            </div>
            
 	<!--END PROFILE PAGE OUTER BODY -->
            



<!-- START Of  BlogPosts || Class-Mate Tabs -->
			                             
            <br />
           <div  class="container">
        <!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			
			<li class="nav-item ">
            <a  class="nav-link text-dark text-uppercase font-weight-bold active" data-toggle="tab" href="#home"> POST </a>
            </li>
            
            <li class="nav-item">
            <a class="nav-link text-dark text-uppercase font-weight-bold" data-toggle="tab" href="#menu1"> CLASS-MATES </a>
           
            </li>
            
             <li class="nav-item">
            <a class="nav-link text-dark text-uppercase font-weight-bold" data-toggle="tab" href="#account"> Account </a>
            </li>
        </ul>
                                                  
<!-- Tab panes -->
<div class="tab-content">
<div id="home" class="container tab-pane active"><br>
                                                      
   
        
      <!--My Post --> 
<div class="card-group">
 
<c:forEach items="${singleBlog}" var="blog">
                                                 
	 <!-- Delete Post Warning Card -->
            
            
<div class="modal fade" id="deleteBlog${blog.blogpostId}" style="display: none;" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
					
					<!-- Modal Header -->	
    				 <div class="modal-header ">
					<h3  class="modal-title text-capitalize text-danger"> <b>  Are You Sure To Delete This Post ! </b></h3>
					
					</div>
 															
 				   <!-- Modal body -->
 					<div class="modal-body">
						  <h5 class="text-capitalize" > <b>  ${blog.title} </b></h5>
						  <p class="card-text" id="post"> ${blog.post} </p>
					</div> 
         			 
         		  <!--End Modal body -->
                                                                
               
			<!-- Modal footer -->
			<div class="modal-footer">
			<a class="btn btn-danger"  href="${pageContext.request.contextPath }/StudentController?action=DeletePOST&cId=${student.collegeId }&viewId=${blog.blogpostId}">
						Delete </a>
			<button  type="button" class="btn btn-dark ml-3" data-dismiss="modal">Cancel</button>
			</div>
</div>
</div>
</div>
  

 <!-- END Delete Post Warning MODAL -->
 
  <!-- READ ME Blog MODAL -->
   
<div class="modal fade" id="readBlog${blog.blogpostId}" style="display: none;" aria-hidden="true">
<div class="modal-dialog modal-xl">
<div class="modal-content">
					
					<!-- Modal Header -->	
    				 <div class="card-header bg-white">
    				 
					<button type="button" class="close" data-dismiss="modal">
					<a href="#" class="btn btn-outline-dark btn-lg"><i class="fa fa-times" aria-hidden="true"></i></a>
					</button>
					
						<h5 class="text-capitalize text-justify text-capitalize text-center" > <b>  ${blog.title} </b></h5>
						<p class="card-title"><i class="fa fa-clock-o" aria-hidden="true"></i>
                  		 ${blog.postTime }
                 		</p> 
                  		<p class="card-title"> <i class="fa fa-calendar" aria-hidden="true"></i>
                  		 ${blog.postDate }
                  		</p>
                  	
                  							
					</div>
 															
 				   <!-- Modal body -->
 					<div class="modal-body">
						  <h6 class="card-title"> ${blog.firstname} ${blog.lastname} </h6>
                 <h6 class="card-subtitle text-muted"> ${blog.branch} </h6>
				
				 <p class="card-text" id="post"> ${blog.post} </p>
					</div> 
         			 
         		  <!--End Modal body -->
                                                                
               
			<!-- Modal footer -->
			<div class="modal-footer">
			
			<button  type="button" class="btn btn-dark ml-3" data-dismiss="modal">Cancel</button>
			
			</div>
</div>
</div>
</div>
  

 <!-- END READ ME Blog Card -->
 
 <!-- START Blog Post Card -->
	<div class="col-md-12 col-sm-12 mt-3 mb-5">
	
	
     
     		<div class="card bg-white shadow rounded">
     				<!-- Card Header -->
                  <div class="card-header ${blog.cardColor}">
				   <a class="btn btn-dark btn-sm text-light" data-toggle="collapse" href="#msd${blog.blogpostId}" role="button" aria-expanded="true" aria-controls="msd${blog.blogpostId}">Toggle</a>
                   <a class="btn btn-dark btn-sm text-light" data-toggle="modal" data-target="#readBlog${blog.blogpostId}">Read Me</a>
                  	
                  <h6><i class="fa fa-clock-o" aria-hidden="true"></i>
                  ${blog.postTime }
                  </h6> 
                  <h6> <i class="fa fa-calendar" aria-hidden="true"></i>
                  ${blog.postDate }
                  </h6>
                  
                  <h5 class="text-capitalize" > <b> ${blog.title} </b></h5>
                
                
             
               
         
            </div>
      	 		 <!--- Card Body -->
             <div class="collapse multi-collapse" id="msd${blog.blogpostId}">
            
             	
	              
	                
                 
             <!-- Card Footer -->
             <div class="card-footer">
             <a data-toggle="modal" data-target="#myBlogEdits${blog.blogpostId}" class="btn btn-danger btn-sm btn-block" href="${pageContext.request.contextPath }/StudentController?action=EditPOST&cId=${student.collegeId }&viewId=${blog.blogpostId}" >
                 <i class="fa fa-pencil-square" aria-hidden="true"></i><b> EDIT </b>
              </a>
               <a class="btn btn-danger btn-sm btn-block" data-toggle="modal" data-target="#deleteBlog${blog.blogpostId}"  href="${pageContext.request.contextPath }/StudentController?action=DeletePOST&cId=${student.collegeId }&viewId=${blog.blogpostId}">
                 <i class="fa fa-trash" aria-hidden="true"></i>
                 <b> DELETE  </b>
              </a>
              </div>
         	</div>
      </div>
	</div>
	
			
			
		


		<!-- END Blog Post Modal -->
             
      <!-- Text-Editor Model | Edit Post -->
            
<div class="container">            
            
<div class="modal fade"  id="myBlogEdits${blog.blogpostId}" style="display: none;" aria-hidden="true">
<div class="modal-dialog modal-xl">
<div class="modal-content">
					
					<!-- Modal Header -->	
    				 <div class="modal-header bg-dark">
					 
					<button type="button" class="close" data-dismiss="modal">
					<a href="#" class="btn btn-outline-light btn-lg"><i class="fa fa-times" aria-hidden="true"></i></a>
					</button>
					
					</div>
 															
 				   <!-- Modal body -->
 					<div class="modal-body">
						
						<!-- text Editor Form -->
 						<form action="BlogPostController" method="post" enctype="multipart/form-data">
    					<div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                        
                        	<div class="input-group ">
                         	
                         	<select  class="form-control custom-select" name="cardColor">
                           
                            <option value="${blog.cardColor}" selected="selected"> Card Color </option>
                            <option value="bg-dark text-light">DARK</option>
                            <option value="bg-white text-dark">WHITE</option>
                            <option value="bg-primary">BLUE(Dark)</option>
                            <option value="bg-info">BLUE(Light)</option>
                            <option value="bg-success">GREEN</option>
                            <option value="bg-danger">RED</option>
                            <option value="bg-warning">YELLOW</option>
                            <option value="bg-secondary text-light">GRAY</option>
                            <option value="bg-light text-dark">LIGHT</option>
                            
                            
                            </select>
                        
                        	</div>
                           
                        </div>			
    					<!-- hidden  -->
    					<input type="hidden" name="sid" value="${student.collegeId}">
						<input type="hidden" name="viewId" value="${blog.blogpostId}">
                        <input type="hidden" name="collegeId" value="${student.collegeId}">
						<input type="hidden" name="branch" value="${student.branch}">
            		  	
            		  	<input required="required" value="${blog.title }" name="title" type="text" autofocus="autofocus" class=" form-control" placeholder=" Enter Title " >
            		  	<br>
  						<textarea  id="summernote${blog.blogpostId}" name="post" required="required"> ${blog.post }</textarea>
  							<button  type="submit" class="btn btn-dark mt-2">Post</button>
  						</form>
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
    

    <script>
    $('#summernote${blog.blogpostId}').summernote({
    	  placeholder: ' Write Your Blog Here',
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
    	  $('#summernote${blog.blogpostId}').summernote();
    });</script>

	<!-- END Text-Editor Model | Edit Post -->
	

  
     </c:forEach>
    
  </div>
 </div>


<!-- Class-Mate TABS -->
<div id="menu1" class="tab-pane fade">
<div class="card-deck">
 <c:forEach items="${listStudent}" var="Student">
   
   
   <div class="col-md-4 col-sm-4 mb-4">                                                                                               
	<div class="card bg-white shadow-lg rounded overflow-hidden mt-3 w-75">
 	 <img  src="data:image/jpg;base64,${Student.photo}" class="card-img-top" onerror="this.onerror=null; this.src='views/assets/img/default-avatar.png'" style="" alt="...">
 		 
 		 <div class="card-header bg-white">
 		 	<h4>${Student.firstname} ${Student.lastname}</h4>
 		 </div>
 		 <div class="card-body">
 		 <h6>${Student.profesion}</h6>
   		 <p class="card-text">${Student.collegeId}</p>
  		 </div>
  		 
  		 
	</div>
	</div>
</c:forEach>
</div>
</div>
<!-- END Class-Mate Tabs -->


<!-- ACCOUNT Tabs -->

		<div id="account" class="tab-pane fade">
		
		
			<div class="col-md-12 col-sm-12 mt-3 mb-5">
	
	
     
     		<div class="card bg-white shadow rounded">
     				<!-- Card Header -->
                  <div class="card-header bg-white">
			
				<h5 class="text-capitalize text-danger" > <b> <i class="fa fa-exclamation-triangle" aria-hidden="true"></i> RED-Zone  </b></h5>
				     
         
            	  </div>
      	 	<!--- Card Body -->
             <div class="card-body">
            
             <a  data-toggle="modal" data-target="#deleteMyAccount" class="btn btn-danger btn-xl text-light" >DELETE THIS ACCOUNT </a>
     
	         </div>    
                 
             <!-- Card Footer -->
             <div class="card-footer">
              <p class="text-muted text-dark text-uppercase font-weight-bold"> You Can Create A New Account After Delete This. </p>
             </div>
         	
      </div>
	</div>

		</div>
		
		
		
</div>
</div>


<!-- End Of  BlogPosts || Class-Mate -->



<!-- End profile widget -->

    </div>
</div>
    
    
    
 
             
            
            
            
            
<div class="modal fade" id="myImage" style="display: none;" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
					
					<!-- Modal Header -->	
    				 <div class="modal-header bg-dark">
					<h5 class="modal-title text-light">View Profile Picture</h5>
					<button type="button" class="close" data-dismiss="modal">
					<a href="#" class="btn btn-outline-light btn-lg"><i class="fa fa-times" aria-hidden="true"></i></a>
					</button>
					</div>
 															
 				   <!-- Modal body -->
 					<div class="modal-body">
                    <img  src="data:image/jpg;base64,${studentImage.photo}" onerror="this.onerror=null; this.src='views/assets/img/default-avatar.png'" alt="Circle Image" class=" rounded img-thumbnail img-fluid img-responsive">

 		
				</div> 
         			 
         		  <!--End Modal body -->
                                                                
               
		<!-- Modal footer -->
			<div class="modal-footer">
			<button  type="button" class="btn btn-dark" data-dismiss="modal"> Close </button>
			</div>
</div>
</div>
</div>

         
            
            	<!-- PROFILE EDIT MODAL -->
<div class="modal fade" id="myModal" style="display: none;" aria-hidden="true">
		 
                                                                                         
<div class="modal-dialog">
                                                           
<div class="modal-content">
          			
          	<!-- Modal Header -->	
          								
	<div class="modal-header bg-dark">
	<h5 class="modal-title text-light">Profile Edit</h5>
		
		<button type="button" class="close" data-dismiss="modal">
		<a href="#" class="btn btn-outline-light btn-lg"><i class="fa fa-times" aria-hidden="true"></i></a>
		</button>
		
	</div>
 															
 																
	<!-- Modal body -->

	<div class="modal-body">
                                                                   
 	<!-- Form -->
 
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
                                <input required="required" type="text" class="form-control" readonly name="collegeId" value="${student.collegeId }" placeholder="College ID">
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
            <input src="data:image/jpg;base64,${studentImage.photo}" value="data:image/jpg;base64,${studentImage.photo}" type="file" class="custom-file-input" id="customFile"  name="profileImage">
            <label class="custom-file-label" for="customFile">Choose file</label>
         	 </div>                            
         	 </div>
                      	
                      	<!-- Branch -->
                      	<div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                        
                        <div class="input-group ">
                         	<select class="form-control custom-select" name="branch">
                           
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
 <!-- FORM END -->
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
                                                                                     
                 <!--End TEXT EDITOR Blog Modal -->                                       
       


 <!-- DELETE USER ACCOUNT POPUP -->
            
            
<div class="modal fade" id="deleteMyAccount" style="display: none;" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
					
					<!-- Modal Header -->	
    				 <div class="modal-header ">
					<h3  class="modal-title text-capitalize text-danger"> <b><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
					  WARNING ! </b></h3>
					
					</div>
 															
 				   <!-- Modal body -->
 					<div class="modal-body">
						  <h5 class=" text-muted text-capitalize" > <b>  THIS ACCOUNT WILL NEVER RECOVER AGAIN AFTER DELETE. </b></h5>
						  
					</div> 
         			 
         		  <!--End Modal body -->
                                                                
               
			<!-- Modal footer -->
			<div class="modal-footer">
			<a class="btn btn-danger"  href="${pageContext.request.contextPath }/StudentController?action=DeleteUserAccount&cId=${student.collegeId }">
						Sure </a>
			<button  type="button" class="btn btn-dark ml-3" data-dismiss="modal">Cancel</button>
			</div>
</div>
</div>
</div>
  

 <!-- END DELETE USER ACCOUNT -->

<!-- 
<script>
                        
document.write(new Date().getFullYear())
</script>
--> 
   
                        
   
</body>

</html>