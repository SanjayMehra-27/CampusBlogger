package edu.campusblogger.student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.campusblogger.dao.LoginDAO;
import edu.campusblogger.dao.LoginDAOImpl;
import edu.campusblogger.entity.Login;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    LoginDAO loginDao =null;
    public LoginController() {
       loginDao = new LoginDAOImpl();
    }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		
		
		Login login = new Login();
		
		login.setCollegeId(request.getParameter("collegeId"));
		login.setPassword(request.getParameter("password"));
		
		String status = loginDao.authenticate(login);
		
		if (status.equals("true")) {
			
			session.setAttribute("collegeId1", login.getCollegeId());
			response.sendRedirect("StudentController?action=HOME&cId="+request.getParameter("collegeId"));
		}
		
		if (status.equals("false")) {
			
			request.setAttribute("SuccessMessage","College ID Or Password Incorrecct");			
			response.sendRedirect("login.jsp?action=false");
		}
		if (status.equals("error")) {
			
			request.setAttribute("SuccessMessage","Some Error Occured ! Please Try Again");			
			response.sendRedirect("login.jsp?action=error");
		}

		
	}
	}


