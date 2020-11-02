package edu1.campusbloggerPgsql.dao1;

import java.io.IOException;
import java.util.List;

import edu1.campusbloggerPgsql.entity1.BlogPost;
import edu1.campusbloggerPgsql.entity1.Student;

public interface StudentDAO {

	boolean saveStudent(Student student);

	Student get(String cId) throws IOException;

	boolean updateStudent(Student student);

	// get list of student || Student
	List<Student> getStudent(String branch);

	// get list of blogs || BlogPOst
	List<BlogPost> getBlogs();

	// viewUserPost
	Student getUserPost(int postId);

	// get single blog for one person
	List<BlogPost> getSingleBlogs(String cId);

	// Delete user blog Post
	boolean deleteBlog(int PostId);

	// Save | Update Student Image
	boolean updateStudentImage(Student student);

	// Fetch Student Image
	Student getstudentImage(String cId);

	// Save Student Dummy Profile
	void saveUserProfileImage(Student student);

	// Delete User Account
	boolean deleteUserAccount(String collegeId);

	// Delete User All Post
	boolean deleteAllUserPost(String collegeId);

	// Delete User Profile Image
	boolean deleteUserProfileImage(String collegeId);

	// Gets User Posts Count
	BlogPost getCountUserPost(String cId);

}
