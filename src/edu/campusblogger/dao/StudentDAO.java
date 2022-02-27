package edu.campusblogger.dao;

import java.io.IOException;
import java.util.List;

import edu.campusblogger.entity.BlogPost;
import edu.campusblogger.entity.Student;

public interface StudentDAO {

	boolean saveStudent(Student student);
	
	Student get(String cId) throws IOException;
	
	

	boolean updateStudent(Student student);
	
	//get list of student || Student
	List<Student> getStudent(String branch);
	
	//get list of blogs || BlogPOst
	List<BlogPost> getBlogs();

	//viewUserPost
	Student getUserPost(int postId);

	//get single blog for one person
	List<BlogPost> getSingleBlogs(String cId);

	boolean deleteBlog(int PostId);
	
}
