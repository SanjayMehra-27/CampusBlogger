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
        User Profile | CampusBlogger
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
					<li class="nav-item">
                       <a href="${pageContext.request.contextPath }/StudentController?action=HOME&cId=${student.collegeId}" class="nav-link text-uppercase font-weight-bold">
                        <i class="fa fa-home" aria-hidden="true"></i> HOME </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath }/StudentController?action=PROFILE&cId=${student.collegeId}&branchId=${student.branch}" class="nav-link text-uppercase font-weight-bold">
                        <i class="fa fa-user-circle" aria-hidden="true"></i> Profile </a>
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
	
	 <!-- END Navbar -->
    
    
    
    
<div class="py-5 px-4">
    <div class="col-xl-12 col-md-12 col-sm-12 mx-auto">

        <!-- Profile widget -->
        <div class="bg-white shadow overflow-hidden">
            <div class="px-4 pt-0 pb-4 bg-dark">
                <div class="media align-items-end profile-header">
                    <div class="profile mr-3">
                    
                    <!-- Profile Picture -->
                    <a data-toggle="modal" data-target="#myImage">
                    <img src="data:image/jpg;base64,${studentImage.photo}" onerror="this.onerror=null; this.src='views/assets/img/default-avatar.png'"  alt="Circle Image" width="130" class="circleImg mb-2 img-thumbnail">
                    </a>
                    <a href="#"> </a></div>
                    
                    <!-- Profile Info -->
                    <div class="media-body mb-5 text-white">
                        <h4 class="mt-0 mb-0 font-italic"> ${student2.firstname } ${student2.lastname } </h4>
                        <p class="small mb-4 font-italic"> <b> ${student2.profesion }</b>
                        
                        <br><i class="fa fa-id-card" aria-hidden="true"></i> ${student2.collegeId}
                         
                        <br><i class="fa fa-envelope" aria-hidden="true"></i> ${student2.email}
                         
                        <br><i class="fa fa-phone-square" aria-hidden="true"></i> ${student2.phonenumber}
                         
                        <br><i class="fa fa-graduation-cap" aria-hidden="true"></i> ${student2.branch}<br>
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

            
<!-- START Of  BlogPosts || Class-Mate Tabs -->
			                             
            <br />
           <div  class="container">
        <!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			
			<li class="nav-item ">
            <a class="nav-link text-dark text-uppercase font-weight-bold active" data-toggle="tab" href="#home"> POST </a>
            </li>
            
            <li class="nav-item">
            <a  class="nav-link text-dark text-uppercase font-weight-bold" data-toggle="tab" href="#menu1"> CLASS-MATES </a>
           
            </li>
        </ul>
                                                  
<!-- Tab panes -->
<div class="tab-content">
<div id="home" class="container tab-pane active"><br>
                                                      
   
        
      <!--My Post --> 
 <div class="card-group">
 
  <c:forEach items="${singleBlog}" var="blog">
                                                 
	 
     <!-- READ ME Blog Card -->
   
<div class="modal fade" id="readBlog${blog.blogpostId}" style="display: none;" aria-hidden="true">
<div class="modal-dialog  modal-xl">
<div class="modal-content">
					
					<!-- Modal Header -->	
    				 <div class="card-header ${blog.cardColor} ">
					
					<!-- Close Button -->
					<button type="button" class="close" data-dismiss="modal">
					<a href="#" class="btn btn-outline-light btn-lg"><i class="fa fa-times" aria-hidden="true"></i></a>
					</button>
					
						<h5 class="text-capitalize text-justify text-capitalize text-center" > 
						<b>  ${blog.title} </b></h5>
						
						<h6 class="card-title"><i class="fa fa-clock-o" aria-hidden="true"></i>
                  		${blog.postTime }
                 		</h6> 
                  		<h6 class="card-title"> <i class="fa fa-calendar" aria-hidden="true"></i>
                  		${blog.postDate }
                  		</h6>
                  							
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
 
     <div class="col-md-6 col-sm-6 col-xl-6">                        
	
    
     		<div class="card bg-white shadow mt-2 mb-5">
     
                  <div class="card-header ${blog.cardColor}">
                  
				  <a class="btn btn-dark btn-sm text-light" data-toggle="modal" data-target="#readBlog${blog.blogpostId}">Read Me</a>
                  
                   <h6><i class="fa fa-clock-o" aria-hidden="true"></i>
                  ${blog.postTime }
                  </h6> 
                  <h6> <i class="fa fa-calendar" aria-hidden="true"></i>
                  ${blog.postDate }
                  </h6>
                  <h5 class="text-capitalize"> <b>  ${blog.title} </b> </h5>
                 </div>
              		
            	 
                
                 
         
        
      		</div>
  	
     </div>
     
     
     
</c:forEach>
     </div>                                           
</div>

<!-- START Class-Mate Tabs -->

<div id="menu1" class="tab-pane fade">
<div class="card-group">
 <c:forEach items="${listStudent}" var="Student">
    
   <div class="col-md-4 col-sm-4 mb-4">                                                                                               
	<div class="card bg-white shadow rounded overflow-hidden mt-5" style="width: 13rem;">
 	 <img  src="data:image/jpg;base64,${Student.photo}" class="card-img-top" onerror="this.onerror=null; this.src='views/assets/img/default-avatar.png'" alt="...">
 		 
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

</div>
</div>
</div>
</div>


<!-- End Of  BlogPosts || Class-Mate -->



<div class="modal fade" id="myImage" style="display: none;" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
					
					<!-- Modal Header -->	
    				 <div class="modal-header bg-dark">
					<h5 class="modal-title text-light">Profile Picture</h5>
					<button type="button" class="close" data-dismiss="modal">
					<h5 class="text-light">x</h5>
					</button>
					</div>
 															
 				   <!-- Modal body -->
 					<div class="modal-body">
                    <img src="data:image/jpg;base64,${studentImage.photo}" alt="Circle Image"  onerror="this.onerror=null; this.src='views/assets/img/default-avatar.png'" class="img-thumbnail img-fluid img-responsive">

 		
				</div> 
         			 
         		  <!--End Modal body -->
                                                                
               
		<!-- Modal footer -->
			<div class="modal-footer">
			<button  type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
			</div>
</div>
</div>
</div>



    
    
  <%--    <!-- Navbar -->
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
    --%>
   <%-- 
   
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
                    <img src="data:image/jpg;base64,${studentImage.photo}" alt="Circle Image" onerror="this.onerror=null; this.src='views/assets/img/default-avatar.png'" class="img-thumbnail img-fluid img-responsive">
                </div>
			
            </div>
            
</a>
            
            
            
            
            
<div class="modal fade" id="myImage" style="display: none;" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
					
					<!-- Modal Header -->	
    				 <div class="modal-header bg-dark">
					<h5 class="modal-title text-light">Profile Picture</h5>
					<button type="button" class="close" data-dismiss="modal">
					<h5 class="text-light">x</h5>
					</button>
					</div>
 															
 				   <!-- Modal body -->
 					<div class="modal-body">
                    <img src="data:image/jpg;base64,${studentImage.photo}" alt="Circle Image"  onerror="this.onerror=null; this.src='views/assets/img/default-avatar.png'" class="img-thumbnail img-fluid img-responsive">

 		
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
    <div class="card-group">
 
     <c:forEach items="${singleBlog}" var="blog">
     
     <!-- READ ME Blog Card -->
   
<div class="modal fade" id="readBlog${blog.blogpostId}" style="display: none;" aria-hidden="true">
<div class="modal-dialog  modal-xl">
<div class="modal-content">
					
					<!-- Modal Header -->	
    				 <div class="modal-header ${blog.cardColor} ">
						
						<h6><i class="fa fa-clock-o" aria-hidden="true"></i>
                  		${blog.postTime }
                 		</h6> 
                  		<h6> <i class="fa fa-calendar" aria-hidden="true"></i>
                  		${blog.postDate }
                  		</h6>
                  		<h5 class="text-capitalize" > <b>  ${blog.title} </b></h5>
                  							
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
 
     <div class="col-md-6 col-sm-6 col-xl-6">                        
	
    
     		<div class="card">
     
                  <div class="card-header ${blog.cardColor}">
                  
				  <a class="btn btn-White btn-sm text-light" data-toggle="modal" data-target="#readBlog${blog.blogpostId}">Read Me</a>
                  
                   <h6><i class="fa fa-clock-o" aria-hidden="true"></i>
                  ${blog.postTime }
                  </h6> 
                  <h6> <i class="fa fa-calendar" aria-hidden="true"></i>
                  ${blog.postDate }
                  </h6>
                  <h5 class="text-capitalize"> <b>  ${blog.title} </b> </h5>
                 </div>
              		
            	 <!--- Card Body -->
             <div class="collapse multi-collapse" id="msd${blog.blogpostId}">
             
             </div>
                
                 
         
        
      </div>
  	
     </div>
     </c:forEach>
     </div>
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
    </div>   --%>
    
    
    
    
    
    
                                            
                                <!-- TEXT EDITOR Blog Modal || Post Blog-->
       
						
    				
    			
    				
     				<div class="modal fade "  tabindex="-1" id="myEditor" style="display: none;" aria-hidden="true">
					<div class="modal-dialog modal-xl">
					<div class="modal-content">
						
						<!-- Header -->
						
					<div class="card-header bg-dark text-light">
						<!-- Close Button -->
						<button type="button" class="close" data-dismiss="modal">
						<h5 class="text-white">X</h5>
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
       

    
    
    
    
    
    
    
   
</body>

</html>