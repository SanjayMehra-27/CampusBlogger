package edu1.campusbloggerPgsql.student1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import edu1.campusbloggerPgsql.dao1.BlogPostDAO;
import edu1.campusbloggerPgsql.dao1.BlogPostDAOImpl;
import edu1.campusbloggerPgsql.entity1.BlogPost;

@WebServlet("/BlogPostController")
@MultipartConfig(maxRequestSize = 169999999, maxFileSize = 169999999)
public class BlogPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BlogPostDAO blogPostDAO = null;

	public BlogPostController() {

		blogPostDAO = new BlogPostDAOImpl();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// save blogpost...
		BlogPost blogPost = new BlogPost();

		Part filepart = request.getPart("postImage");
		String cardColor = request.getParameter("cardColor");

		blogPost.setCollegeId(request.getParameter("collegeId"));
		blogPost.setCardColor(cardColor);
		String postId = request.getParameter("viewId");

		blogPost.setTitle(request.getParameter("title"));
		blogPost.setPost(request.getParameter("post"));
		blogPost.setSid(request.getParameter("sid"));
		blogPost.setPostImage(filepart);
		System.out.println("Card-Color : " + cardColor);

		if (postId.isEmpty() || postId == null) {

			// Save Post In DB
			if (blogPostDAO.savePost(blogPost) || blogPostDAO.savePostImage(blogPost)) {

				response.sendRedirect("StudentController?action=HOME&cId=" + request.getParameter("collegeId"));
			}

			else {

				response.sendRedirect("login.jsp?action=false");
			}

		}

		else {
			// update Post In DB
			blogPost.setPostImage(filepart);

			blogPost.setBlogpostId(Integer.parseInt(postId));
			if (blogPostDAO.updatePost(blogPost)) {

				response.sendRedirect("StudentController?action=PROFILE&cId=" + request.getParameter("collegeId")
						+ "&branchId=" + request.getParameter("branch"));
			}

		}

	}

}
