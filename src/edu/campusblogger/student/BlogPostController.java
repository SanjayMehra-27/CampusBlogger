package edu.campusblogger.student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import edu.campusblogger.dao.BlogPostDAO;
import edu.campusblogger.dao.BlogPostDAOImpl;
import edu.campusblogger.entity.BlogPost;

@WebServlet("/BlogPostController")
@MultipartConfig(maxRequestSize = 169999999,maxFileSize = 169999999)
public class BlogPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	BlogPostDAO blogPostDAO = null;
    
    public BlogPostController() {
       
    	blogPostDAO = new BlogPostDAOImpl();
    }

	

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		//save blogpost...
		BlogPost blogPost = new BlogPost();
		
		Part filepart = request.getPart("postImage");

		request.getParameter("collegeId");
		
		String postId =  request.getParameter("viewId");
		
		blogPost.setTitle(request.getParameter("title"));
		blogPost.setPost(request.getParameter("post"));
		blogPost.setSid(request.getParameter("sid"));
		blogPost.setPostImage(filepart);
		
		if (postId.isEmpty() || postId == null) {
			
			if (blogPostDAO.savePost(blogPost)) {
				
				response.sendRedirect("StudentController?action=HOME&cId="+request.getParameter("collegeId"));
			}
			
			else {
				
				response.sendRedirect("login.jsp?action=false");
			}
		
		}
		
		else {
			//update
			blogPost.setPostImage(filepart);
			

			blogPost.setBlogpostId(Integer.parseInt(postId));
			if (blogPostDAO.updatePost(blogPost)) {
				
				response.sendRedirect("StudentController?action=PROFILE&cId="+request.getParameter("collegeId")+"&branchId="+request.getParameter("branch"));
			}
			
		}
		
		
		
		
		

		
	}
		
	}


