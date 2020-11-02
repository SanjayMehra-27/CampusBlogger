<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Blog Post</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
  </head>
  <body>
  
<div class="row">
<div class="col-sm-12">

  <!-- Blog Post Modal -->
<a class="" data-toggle="modal" data-target="#myBlog">  
               
               <input type="button" value="Write Blog" class="btn btn-dark" >
</a>
             
            
            
<div class="container">            
            
<div class="modal fade" id="myBlog" style="display: none;" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
					
					<!-- Modal Header -->	
    				 <div class="modal-header bg-dark">
					<h5 class="modal-title text-light">Write Your Blog</h5>
					<button type="button" class="close" data-dismiss="modal">
					<h5 class="text-white">x</h5>
					</button>
					</div>
 															
 				   <!-- Modal body -->
 					<div class="modal-body">
						
						<!-- text Editor Form -->
 						<form action="BlogPostController" method="post" enctype="multipart/form-data">
    					<div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                        
                        	<div class="input-group ">
                         	
                         	<select  class="form-control custom-select" name="cardColor">
                           
                            <option value="${userBlog.cardColor}" selected="selected"> Card Color </option>
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
						<input type="hidden" name="viewId" value="${userBlog.blogpostId}">
                        <input type="hidden" name="collegeId" value="${student.collegeId}">
						<input type="hidden" name="branch" value="${student.branch}">
            		  	
            		  	<input required="required" value="${userBlog.title }" name="title" type="text" autofocus="autofocus" class=" form-control" placeholder=" Enter Title " >
            		  	<br>
  						<textarea  id="summernote" name="post"> ${userBlog.post }</textarea>
  							<button  type="submit" class="btn btn-dark">Post</button>
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
    
<!-- row | col end -->
</div>
</div>    
    <script>
    $('#summernote').summernote({
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
    	  $('#summernote').summernote();
    });</script>
  </body>
</html>
