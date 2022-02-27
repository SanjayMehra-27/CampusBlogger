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
    
      <style type="text/css">
    img{
    
    padding: auto;
    height: 50%;
    width: 50%;
    }
    img[src="data:image/jpg;base64,"] {
	visibility: hidden;
	}
	
	
    </style>
    
</head>

<body class="container bg-white ">


<div class="container">





<div class="card-body">

<div class="container">

<div class="flex-sm-row">

<form action="BlogPostController" method="post" enctype="multipart/form-data">


 						<div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                           
                                <div class="input-group  mb-5 p-5">
                                    
                                   <input required="required" value="${userBlog.title }" name="title" type="text" autofocus="autofocus" class=" form-control-plaintext" placeholder="   Enter Title " >
								     <div class="">
                              
                                       <span class=" text-light btn btn-dark"> - Title </span>
                                    </div><br>
                                    
                                        
         
								</div>
                            
                        </div>
        

			<!-- Choose Photo -->
			<div class="flex-sm-column form-group flex-fill justify-content-sm-center">
			<div class=" input-group custom-file mb-3 p-3 ">
            <input type="file" class="custom-file-input " id="customFile"  name="postImage">
            <label class="custom-file-label" for="customFile">Choose Image</label>
            
         	 </div>                            
         	 </div>

				
			<img src="data:image/jpg;base64,${userBlog.blogPostImage}" alt="Circle Image" class="img-thumbnail img-fluid img-responsive">
                
                        <input type="hidden" name="sid" value="${student.collegeId}">
						<input type="hidden" name="viewId" value="${userBlog.blogpostId}">
                        <input type="hidden" name="collegeId" value="${student.collegeId}">
						<input type="hidden" name="branch" value="${student.branch}">
            		    
            		    <div class="flex-sm-column form-group flex-fill justify-content-sm-center">
                           
                                <div class="input-group mb-3 p-3">
                                    <textarea required="required" rows="12" name="post" spellcheck="true" cols="150" placeholder="Enter Post Here"> ${userBlog.post }</textarea><br>
									
									<div class="input-group float-left">
                                    <input type="submit" value="Post" class=" btn btn-dark"/>
                                    </div>
								</div>
                             		
                        </div>
                        
    </form>                     
           </div>  
                             


</div>

</div>

</div>


</body>

</html>