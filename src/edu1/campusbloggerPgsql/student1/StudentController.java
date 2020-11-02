package edu1.campusbloggerPgsql.student1;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
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

import edu1.campusbloggerPgsql.dao1.StudentDAO;
import edu1.campusbloggerPgsql.dao1.StudentDAOImpl;
import edu1.campusbloggerPgsql.entity1.BlogPost;
import edu1.campusbloggerPgsql.entity1.Student;

@WebServlet("/StudentController")
@MultipartConfig(maxRequestSize = 169999999, maxFileSize = 169999999)
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Reference Variable

	StudentDAO studentDao = null;
	RequestDispatcher dispatcher = null;

	public StudentController() {
		studentDao = new StudentDAOImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action == null || action.isEmpty()) {

			response.sendRedirect("login.jsp?action=false");

		}

		switch (action) {
		case "HOME":
			showHome(request, response);
			break;

		case "PROFILE":
			getProfile(request, response);
			break;

		case "BlogPOST":
			getBlogPost(request, response);
			break;

		case "ViewPOST":
			viewUserPost(request, response);
			break;

		case "EditPOST":
			editUserPost(request, response);
			break;

		case "DeletePOST":
			deletePost(request, response);
			break;

		case "viewPROFILE":
			viewUserProfile(request, response);
			break;

		case "DeleteUserAccount":
			DeleteUserAccount(request, response);

		default:
			response.sendRedirect("login.jsp?action=false");
			break;
		}

	}

	private void DeleteUserAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String collegeId = request.getParameter("cId");

		System.out.println("User College Id For DELETE ACCOUNT : " + collegeId);

		boolean flagAccount = studentDao.deleteUserAccount(collegeId);
		boolean flagAllPost = studentDao.deleteAllUserPost(collegeId);
		boolean flagImage = studentDao.deleteUserProfileImage(collegeId);

		if (flagAccount && flagAllPost && flagImage) {

		}
	}

	public void viewUserProfile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cId = request.getParameter("cId");
		String viewUsercId = request.getParameter("viewId");

		// test
		System.out.println("ViewPost-postId =" + viewUsercId);
		System.out.println("ViewPost-cId =" + cId);
		if (cId.isEmpty() || cId == null) {

			response.sendRedirect("login.jsp?action=false");

		} else {
			// Fetch viewUserProfile Student blog
			List<BlogPost> singleBlog = studentDao.getSingleBlogs(viewUsercId);

			// LoginUser || Main-User Student Data
			Student student = studentDao.get(cId);

			// viewUserProfile Student Data
			Student student2 = studentDao.get(viewUsercId);

			// Fetch viewUserProfile Student Image
			Student studentImage = studentDao.getstudentImage(viewUsercId);

			// Fetch Student Blogs Counts Number
			BlogPost blogPostCount = studentDao.getCountUserPost(viewUsercId);

			// Fetch Student Class-Mates
			List<Student> allStudents = studentDao.getStudent(student2.getBranch());

			List<Student> allStudentsFiltered = getStudentFilter(allStudents, student2);

			request.setAttribute("student", student);

			request.setAttribute("student2", student2);

			request.setAttribute("singleBlog", singleBlog);

			request.setAttribute("studentImage", studentImage);

			request.setAttribute("listStudent", allStudentsFiltered);

			request.setAttribute("UserPostCount", blogPostCount);

			dispatcher = request.getRequestDispatcher("/views/viewUserProfile.jsp");
			dispatcher.forward(request, response);

		}
	}

	public void deletePost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String postId = request.getParameter("viewId");

		boolean flag = studentDao.deleteBlog(Integer.parseInt(postId));

		if (flag) {

			request.setAttribute("SuccessMessage", "Your Post Deleted Sucessfully !");
			showHome(request, response);

		}
	}

	public void editUserPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String string = request.getParameter("branchId");
		String cId = request.getParameter("cId");
		String postId = request.getParameter("viewId");
		System.out.println("ViewPost-postId =" + postId);

		if (cId.isEmpty() || cId == null) {

			response.sendRedirect("login.jsp?action=false");

		} else {
			BlogPost blogPost = (BlogPost) studentDao.getUserPost(Integer.parseInt(postId));

			Student student = studentDao.get(cId);
			request.setAttribute("student", student);

			request.setAttribute("userBlog", blogPost);

			dispatcher = request.getRequestDispatcher("/views/BlogPost.jsp");
			dispatcher.forward(request, response);
		}
	}

	public void viewUserPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cId = request.getParameter("cId");
		String postId = request.getParameter("viewId");

		// test
		System.out.println("ViewPost-postId =" + postId);

		if (cId.isEmpty() || cId == null) {

			response.sendRedirect("login.jsp?action=false");

		} else {
			BlogPost blogPost = (BlogPost) studentDao.getUserPost(Integer.parseInt(postId));

			Student student = studentDao.get(cId);

			request.setAttribute("student", student);

			request.setAttribute("myBlog", blogPost);

			dispatcher = request.getRequestDispatcher("/views/home.jsp");
			dispatcher.forward(request, response);
		}
	}

	public void getBlogPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cId = request.getParameter("cId");

		System.out.println("BlogPost-collegid =" + cId);
		if (cId.isEmpty() || cId == null) {

			response.sendRedirect("login.jsp?action=false");

		} else {

			Student student = studentDao.get(cId);
			request.setAttribute("student", student);

			dispatcher = request.getRequestDispatcher("/views/BlogPost.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void getProfile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String branch = request.getParameter("branchId");
		String cId = request.getParameter("cId");

		System.out.println("PROFILE-collegid =" + cId);
		System.out.println("B-" + branch);

		if (cId.isEmpty() || cId == null) {

			response.sendRedirect("login.jsp?action=false");

		} else {

			// Fetch Student Data
			Student student = studentDao.get(cId);

			// Fetch Student Image
			Student studentImage = studentDao.getstudentImage(cId);

			// Fetch Student Blogs
			List<BlogPost> singleBlog = studentDao.getSingleBlogs(cId);

			// Fetch Student Class-Mates
			List<Student> allStudents = studentDao.getStudent(branch);

			// Fetch Student Blogs Counts Number
			BlogPost blogPostCount = studentDao.getCountUserPost(cId);

			List<Student> allStudentsFiltered = getStudentFilter(allStudents, student);

			request.setAttribute("singleBlog", singleBlog);
			request.setAttribute("listStudent", allStudentsFiltered);

			request.setAttribute("student", student);
			request.setAttribute("studentImage", studentImage);
			request.setAttribute("UserPostCount", blogPostCount);

			dispatcher = request.getRequestDispatcher("/views/profile.jsp");
			dispatcher.forward(request, response);

		}

	}

	public void showHome(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cId = request.getParameter("cId");
		String postId = request.getParameter("viewId");

		if (postId == null) {

		}
		// test
		System.out.println("ShowHome-postId =" + postId);
		System.out.println("HOME-collegid = " + cId);

		if (postId != null) {

			List<BlogPost> allBlog = studentDao.getBlogs();
			BlogPost blogPost = (BlogPost) studentDao.getUserPost(Integer.parseInt(postId));
			Student student = studentDao.get(cId);
			System.out.println("Test :" + blogPost.getBlogpostId() + blogPost.getPost() + blogPost.getFirstname()
					+ blogPost.getLastname());

			request.setAttribute("student", student);
			request.setAttribute("allBlogs", allBlog);
			request.setAttribute("blogPost", blogPost);

			dispatcher = request.getRequestDispatcher("/views/home.jsp");
			dispatcher.forward(request, response);
		} else {
			if (cId.isEmpty()) {

				response.sendRedirect("login.jsp?action=false");

			} else {

				List<BlogPost> allBlog = studentDao.getBlogs();

				Student student = studentDao.get(cId);
				System.out.println(
						student.getFirstname() + student.getLastname() + student.getCollegeId() + student.getId());
				request.setAttribute("allBlogs", allBlog);
				request.setAttribute("student", student);

				dispatcher = request.getRequestDispatcher("/views/home.jsp");
				dispatcher.forward(request, response);

			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// SignUp page...
		// save user data,
		HttpSession session = request.getSession();

		// Upload Image In DB
		Part filepart = request.getPart("profileImage"); // Retrieves <input type="file" name="image">`
		String filePath = filepart.getSubmittedFileName();// Retrieves complete file name with path and directories
		Path p = Paths.get(filePath); // creates a Path object
		String fileName = p.getFileName().toString();// Retrieves file name from Path object
		InputStream fileContent = filepart.getInputStream();// converts Part data to input stream

//	        //Duumy Image For User Profile
//	        File uFile = new File("views/img/userProfileImage.png");
//	        System.out.println("FILE NAME : "+fileName);
//	        
//	        InputStream fiInputStream = new FileInputStream(uFile);
//	        System.out.println("FILE NAME USER PROFILE :"+ uFile.getName()+fiInputStream);
//		

//		  System.out.println(filepart);

//		
//	      String =request.getParameter("profileImage");
//        String filepath=strpath.substring(strpath.lastIndexOf("\\")+1);
//       
//        System.out.println("filepath = " +filepath +strpath);

		String id = request.getParameter("id");
		String firstname = request.getParameter("firstname");
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
		student.setFilepart(filepart);
		System.out.println("profession :" + profession);

		// save operation

		String cId = request.getParameter("cId");
		String postId = request.getParameter("viewId");

		if (postId != null) {
			showHome(request, response);
		} else {
			if (id.isEmpty()) {

				if (studentDao.saveStudent(student)) {
					studentDao.saveUserProfileImage(student); // Save Dummy User Profile Image in DB

					System.out.println("Save Operation");
					request.setAttribute("student", student);

					session.setAttribute("collegeId1", student.getCollegeId());
					response.sendRedirect("?action=HOME&cId=" + request.getParameter("collegeId"));

				} else {

					response.sendRedirect("?action=HOME&cId=" + request.getParameter("collegeId"));

				}

			} else {

				// update Student Data

				student.setFilepart(filepart);
//
				student.setId(Integer.parseInt(id));
				student.setProfesion(profession);
				System.out.println("photo - " + student.getFilepart());

				boolean flag = studentDao.updateStudent(student);
				boolean flag2 = studentDao.updateStudentImage(student);

				if (flag) {

					response.sendRedirect("?action=PROFILE&cId=" + request.getParameter("collegeId") + "&branchId="
							+ student.getBranch());

				} else {
					response.sendRedirect("?action=PROFILE&cId=" + request.getParameter("collegeId"));

				}

			}
		}
		System.out.println("doPost =  " + firstname + " " + lastname + " " + email + " " + collegeId + " " + phonenumber
				+ " " + branch + " " + password);

	}

	/*
	 * 
	 * 
	 * BELOW ARE UTIL FUNCTIONS
	 * 
	 * 
	 * 
	 */

	/* This Code Remove Main-User From Class-Mate List || Get Filtered List */
	private List<Student> getStudentFilter(List<Student> allStudents, Student student) {

		boolean contain = false;
		int index = 0;

		for (Student student2 : allStudents) {

			if (student2.getId() == student.getId()) {
				contain = true;
			}

			if (contain) {
				allStudents.remove(index);
				break;
			}
			index++;
		}
		return allStudents;

	}

}
