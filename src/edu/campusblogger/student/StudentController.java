package edu.campusblogger.student;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import edu.campusblogger.dao.StudentDAO;
import edu.campusblogger.dao.StudentDAOImpl;
import edu.campusblogger.entity.BlogPost;
import edu.campusblogger.entity.Student;

@WebServlet("/StudentController")
@MultipartConfig(maxRequestSize = 169999999,maxFileSize = 169999999)
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	//Reference Variable

	StudentDAO studentDao = null;
	RequestDispatcher dispatcher =null;

	
	
	
    public StudentController() {
        studentDao = new StudentDAOImpl();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String action =request.getParameter("action");
	
		
		if (action==null || action.isEmpty()) {
			
			
				
				response.sendRedirect("login.jsp?action=false");

		}
		
		switch (action) {
		case "HOME":
			showHome(request,response);		
			break;
			
		case "PROFILE":
			getProfile(request,response);		
			break;
			
		case "BlogPOST":
			getBlogPost(request,response);		
			break;
			
		case "ViewPOST":
			viewUserPost(request,response);		
			break;
			
		case "EditPOST":
			editUserPost(request,response);		
			break;
			
		case "DeletePOST":
			deletePost(request,response);
			break;
			
		case "viewPROFILE":
			viewUserProfile(request,response);		
			break;


		default:
			response.sendRedirect("login.jsp?action=false");
			break;
		}
		
		
	}
	
	public void viewUserProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cId = request.getParameter("cId");
		String viewUsercId = request.getParameter("viewId");
		
		//test
		System.out.println("ViewPost-postId =" + viewUsercId);
		System.out.println("ViewPost-cId =" + cId);
		if (cId.isEmpty() || cId == null) {
			
			response.sendRedirect("login.jsp?action=false");

		}else {
		//viewUserProfile Student blog
		List <BlogPost> singleBlog = studentDao.getSingleBlogs(viewUsercId);
		
		//LoginUser Student Data
		Student student = studentDao.get(cId);
		
		//viewUserProfile Student Data
		Student student2 = studentDao.get(viewUsercId);
		
		request.setAttribute("student", student);
		
		request.setAttribute("student2", student2);
		
		request.setAttribute("singleBlog",singleBlog);
		
		 dispatcher = request.getRequestDispatcher("/views/viewUserProfile.jsp");
		 dispatcher.forward(request, response);
		
		}
	}


	public void deletePost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String postId =  request.getParameter("viewId");
		
		boolean flag =	studentDao.deleteBlog(Integer.parseInt(postId));
		
		if (flag) {
			
			request.setAttribute("SuccessMessage", "Your Post Deleted Sucessfully !");
			showHome(request, response);
			
		}
	}

	public void editUserPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String string = request.getParameter("branchId");
		String cId = request.getParameter("cId");
		String postId = request.getParameter("viewId"); 
		System.out.println("ViewPost-postId =" + postId);
		
		if (cId.isEmpty() || cId == null) {
			
			response.sendRedirect("login.jsp?action=false");

		}else {
		BlogPost blogPost = (BlogPost) studentDao.getUserPost(Integer.parseInt(postId));

		Student student = studentDao.get(cId);
		request.setAttribute("student", student);
		
		request.setAttribute("userBlog",blogPost);

		 dispatcher = request.getRequestDispatcher("/views/BlogPost.jsp");
		 dispatcher.forward(request, response);
		}
	}


	public void viewUserPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cId = request.getParameter("cId");
		String postId = request.getParameter("viewId");
		
		//test
		System.out.println("ViewPost-postId =" + postId);
		
		if (cId.isEmpty() || cId == null) {
			
			response.sendRedirect("login.jsp?action=false");

		}
		else {
		BlogPost blogPost = (BlogPost) studentDao.getUserPost(Integer.parseInt(postId));

		Student student = studentDao.get(cId);
		request.setAttribute("student", student);
		
		request.setAttribute("userBlog",blogPost);
		
		 dispatcher = request.getRequestDispatcher("/views/viewBlogPost.jsp");
		 dispatcher.forward(request, response);
		}
	}


	public void getBlogPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String cId = request.getParameter("cId");

		System.out.println("BlogPost-collegid =" + cId);
		if (cId.isEmpty() || cId == null) {
			
			response.sendRedirect("login.jsp?action=false");

		}
		else {
		
		Student student = studentDao.get(cId);
		request.setAttribute("student", student);
		
		
		dispatcher = request.getRequestDispatcher("/views/BlogPost.jsp");
		dispatcher.forward(request, response);
		}
	}


	private void getProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String branch = request.getParameter("branchId");
		String cId = request.getParameter("cId");

		System.out.println("PROFILE-collegid =" + cId);
		System.out.println("B-"+branch);
		
		if (cId.isEmpty() || cId == null) {
			
			response.sendRedirect("login.jsp?action=false");

		}else {
			
			
			Student student = studentDao.get(cId);

			List <BlogPost> singleBlog = studentDao.getSingleBlogs(cId);
			List <Student> allStudents = studentDao.getStudent(branch);

			
			request.setAttribute("singleBlog",singleBlog);
			request.setAttribute("listStudent", allStudents);

			request.setAttribute("student", student);

			dispatcher = request.getRequestDispatcher("/views/profile.jsp");
			dispatcher.forward(request, response);
			
		}
		
		
	}


	public void showHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
		
			String cId = request.getParameter("cId");

			System.out.println("HOME-collegid = " + cId);
			
			if (cId.isEmpty()) {
				
				response.sendRedirect("login.jsp?action=false");

			}else {
				List <BlogPost> allBlog = studentDao.getBlogs();
				
				
				Student student = studentDao.get(cId);
				
				
				
				request.setAttribute("allBlogs", allBlog);
				request.setAttribute("student", student);
				
				
			
			
				dispatcher = request.getRequestDispatcher("/views/home.jsp");
				dispatcher.forward(request, response);
			
			}
			
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	   //save user data, SignUp page...
		
		HttpSession session = request.getSession();
		Part filepart = request.getPart("profileImage");
		
		System.out.println(filepart);
	
//		
//		String strpath=request.getParameter("profileImage");
//        String filepath=strpath.substring(strpath.lastIndexOf("\\")+1);
//       
//        System.out.println("filepath = " +filepath +strpath);
		
	
	String id = request.getParameter("id");
	String firstname = 	request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String email = request.getParameter("email");
	String collegeId = request.getParameter("collegeId");
	String phonenumber = request.getParameter("phonenumber");
	String password = request.getParameter("password");
	String branch = request.getParameter("branch");
	String profession = request.getParameter("profession");
	
	

	Student student = new Student();
	
	
	student.setFirstname(firstname);
	student.setLastname(lastname);
	student.setEmail(email);
	student.setCollegeId(collegeId);
	student.setPhonenumber(phonenumber);
	student.setPassword(password);
	student.setBranch(branch);
	
	
	//save operation
	if(id.isEmpty()) {
		
		if (studentDao.saveStudent(student)) {
			System.out.println("Save Operation");
			request.setAttribute("student",student );
			
			session.setAttribute("collegeId1", student.getCollegeId());
			response.sendRedirect("?action=HOME&cId="+request.getParameter("collegeId"));
			
		}else{
			
			response.sendRedirect("?action=HOME&cId="+request.getParameter("collegeId"));

		}
		
	}else{
		
		
		//update Student Data
		student.setFilepart(filepart);

		student.setId(Integer.parseInt(id));
		student.setProfesion(profession);
		System.out.println("photo - "+student.getFilepart());
		boolean flag =  studentDao.updateStudent(student);
		
		if (flag) {
			
			
			response.sendRedirect("?action=PROFILE&cId="+request.getParameter("collegeId")+"&branchId="+student.getBranch());
				
				
		 }else {
			response.sendRedirect("?action=PROFILE&cId="+request.getParameter("collegeId"));
			
		}
		
	}
	
	System.out.println("doPost =  "+firstname+lastname+email+collegeId+phonenumber+branch+password);

	
	
	}
	
}


