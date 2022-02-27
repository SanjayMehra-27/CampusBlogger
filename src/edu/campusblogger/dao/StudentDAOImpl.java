package edu.campusblogger.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.Part;

import edu.campusblogger.entity.BlogPost;
import edu.campusblogger.entity.Student;
import edu.campusblogger.util.DBConnection;




public class StudentDAOImpl implements StudentDAO {

	@Override
	public boolean saveStudent(Student student) {
		boolean flag = false;
		
		
		try {
			
			String sql = "INSERT INTO campusblogger.student(sfirstname,slastname,scollegeid,semail,sphonenumber,spassword,sbranch,sprofession,photo)VALUES('"+student.getFirstname().trim()+"','"+student.getLastname().trim()+"','"+student.getCollegeId().trim()+"','"+student.getEmail().trim()+"','"+student.getPhonenumber().trim()+"','"+student.getPassword().trim()+"','"+student.getBranch()+"','"+student.getProfesion()+"','"+student.getPhoto()+"')"; 
			System.out.println(sql);
			Connection connection = DBConnection.openConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
						
		} catch (SQLException e) {
			e.getStackTrace();
		}

		System.out.println("Complete Save User :" +flag);

	return flag;
	}

	public Student get(String cId) throws IOException {
		
		Student student = null;
		try {
			student = new Student();
			
			String sql = "SELECT * FROM  campusblogger.student WHERE scollegeid = '"+cId.toString()+"'";
			Connection connection = DBConnection.openConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sql);
			
			System.out.println(sql);
			
			while (resultSet.next()) {
				
				student.setId(resultSet.getInt("sid"));
				student.setFirstname(resultSet.getString("sfirstname").trim().toUpperCase());
				student.setLastname(resultSet.getString("slastname").trim().toUpperCase());
				student.setCollegeId(resultSet.getString("scollegeid").trim().toUpperCase());
				student.setEmail(resultSet.getString("semail").trim());
				student.setPhonenumber(resultSet.getString("sphonenumber").trim());
				student.setPassword(resultSet.getString("spassword").trim());
				student.setBranch(resultSet.getString("sbranch"));
				student.setProfesion(resultSet.getString("sprofession").trim());
				
				   Blob blob = resultSet.getBlob("photo");
                 
	                InputStream inputStream = blob.getBinaryStream();
	                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	                byte[] buffer = new byte[4096];
	                int bytesRead = -1;
	                 
	                while ((bytesRead = inputStream.read(buffer)) != -1) {
	                    outputStream.write(buffer, 0, bytesRead);                  
	                }
	                 
	                byte[] imageBytes = outputStream.toByteArray();
	                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	                 
	                 
	                inputStream.close();
	                outputStream.close();
	                 
	                student.setPhoto(base64Image);
	            }
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(student.getFirstname()+student.getLastname()+student.getBranch()+student.getCollegeId());
		
		return student;
	
		
	}
		
  

	public boolean updateStudent(Student student) {
		boolean flag = false;
		 	
		  

		try {
			
			Part filepart = student.getFilepart();
		
				System.out.println("part = " +student.getFilepart());
				InputStream inputStream = null;

				if (filepart != null) {
					
					try {
					long fileSize = filepart.getSize();
					String fileContent = filepart.getContentType();
					
						inputStream  = filepart.getInputStream();
					
					} catch (IOException e) {
				
						e.printStackTrace();
					}
				}
				
	
			String sql = "UPDATE campusblogger.student SET sfirstname = ?,slastname = ?,semail = ?,scollegeid = ?,sphonenumber = ?,spassword = ?,sbranch = ?,sprofession = ?,photo = ? WHERE sid = ? ";
			
			
			
			
			
			Connection connection = DBConnection.openConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, student.getFirstname());
			preparedStatement.setString(2, student.getLastname());
			preparedStatement.setString(3, student.getEmail());
			preparedStatement.setString(4, student.getCollegeId());
			preparedStatement.setString(5, student.getPhonenumber());
			preparedStatement.setString(6, student.getPassword());
			preparedStatement.setString(7, student.getBranch());
			preparedStatement.setString(8, student.getProfesion());
			preparedStatement.setBlob(9, inputStream);
			preparedStatement.setInt(10, student.getId());
			
			preparedStatement.executeUpdate();
			flag  = true;
			
			
			
		} catch (SQLException e) {
			 e.getMessage();
			e.printStackTrace();
		}
		return flag;
		
		
		
		
	}

	@Override
	public List<Student> getStudent(String branch) {

		
//		Student student = null;
//		try {
//			
//			
//			student = new Student();
//			String sql = "SELECT * FROM campusblogger.student WHERE id = "+sid;
//			
//			
//			
//			Connection connection = DBConnection.openConnection();
//			Statement statement = connection.createStatement();
//			ResultSet resultSet = statement.executeQuery(sql);
//			
//			System.out.println(sql);
//			
//			while (resultSet.next()) {
//				
//				student.setId(resultSet.getInt("sid"));
//				student.setFirstname(resultSet.getString("sfirstname"));
//				student.setLastname(resultSet.getString("slastname"));
//				student.setCollegeId(resultSet.getString("scollegeid"));
//				student.setEmail(resultSet.getString("semail"));
//				student.setPhonenumber(resultSet.getString("sphonenumber"));
//				student.setPassword(resultSet.getString("spassword"));
//				student.setBranch(resultSet.getString("sbranch"));
//				
//			
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return student;
	

		
		List<Student> allStudent = null;
		Student student = null;
		
		try {
			
			
			allStudent = new ArrayList<Student>();
			
			String sql = " SELECT DISTINCT(scollegeid),sid,sfirstname,spassword,slastname,semail,sphonenumber,sbranch,sprofession FROM campusblogger.student WHERE sbranch = '"+branch.toString()+"' ORDER BY student.sfirstname ASC ";
			System.out.println(sql);
			//get the database connection
			 Connection connection = DBConnection.openConnection();
			 
			 Statement statement = connection.createStatement();
			
			//Execute the sql query
			 ResultSet resultSet = statement.executeQuery(sql);
			 
			//Process the resultset
			 while (resultSet.next()) {
				 	student = new Student();
				 	student.setId(resultSet.getInt("sid"));
					student.setFirstname(resultSet.getString("sfirstname").toUpperCase());
					student.setLastname(resultSet.getString("slastname").toUpperCase());
					student.setCollegeId(resultSet.getString("scollegeid").toUpperCase());
					student.setEmail(resultSet.getString("semail"));
					student.setPhonenumber(resultSet.getString("sphonenumber"));
					student.setPassword(resultSet.getString("spassword"));
					student.setProfesion(resultSet.getString("sprofession").toUpperCase());
					
					//test
					 System.out.println(student.getFirstname());

					allStudent.add(student);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return allStudent;
		
	}

	@Override
	public List<BlogPost> getBlogs() {
		
		List<BlogPost> allBlogs = null;
		BlogPost blogPost = null;
		
		
		try {
			
			
			
			allBlogs = new ArrayList<BlogPost>();
			
			String sql = "SELECT DISTINCT * FROM campusblogger.blogpost INNER JOIN campusblogger.student ON blogpost.scollegeid = student.scollegeid ORDER BY blogpost.blogpostid DESC";
					
			
			//get the database connection
			 Connection connection = DBConnection.openConnection();
			 
			 Statement statement = connection.createStatement();
			
			//Execute the sql query
			 ResultSet resultSet = statement.executeQuery(sql);
			 
			//Process the resultset
			 while (resultSet.next()) {
				 
				 blogPost = new BlogPost();
				
				 blogPost.setTitle(resultSet.getString("title"));
				 blogPost.setPost(resultSet.getString("post")); //.strip() removed  

				 blogPost.setSid(resultSet.getString("scollegeId"));
				 blogPost.setPostDate(resultSet.getString("create_time"));
				 blogPost.setBranch(resultSet.getString("sbranch"));
				 blogPost.setFirstname(resultSet.getString("sfirstname").toUpperCase());
				 blogPost.setLastname(resultSet.getString("slastname").toUpperCase());
				 blogPost.setBlogpostId(resultSet.getInt("blogpostid"));

				 	Blob blob = resultSet.getBlob("postImage");
                 
	                InputStream inputStream = blob.getBinaryStream();
	                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	                byte[] buffer = new byte[4096];
	                int bytesRead = -1;
	                 
	                while ((bytesRead = inputStream.read(buffer)) != -1) {
	                    outputStream.write(buffer, 0, bytesRead);                  
	                }
	                 
	                byte[] imageBytes = outputStream.toByteArray();
	                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	                 
	                 
	                inputStream.close();
	                outputStream.close();
	                 
	                blogPost.setBlogPostImage(base64Image);
	        
				 allBlogs.add(blogPost);
			}
			
		
			
		} catch (SQLException | IOException e) {
		
			e.printStackTrace();
		}
		System.out.println(blogPost.getSid());
	return allBlogs;
		
	}

	@Override
	public Student getUserPost(int postId) {
		
		BlogPost blogPost = null;
		
		try {
			blogPost = new BlogPost();
			
			String sql ="SELECT * FROM campusblogger.blogpost INNER JOIN campusblogger.student ON blogpost.scollegeid = student.scollegeid WHERE blogpost.blogpostid = "+postId;
			

			//get the database connection
			 Connection connection = DBConnection.openConnection();

			 Statement statement = connection.createStatement();

			 //Execute the sql query
			 ResultSet resultSet = statement.executeQuery(sql);

			 //Process the resultset
			 while (resultSet.next()) {
				 
				blogPost = new BlogPost();
				
				 blogPost.setTitle(resultSet.getString("title"));
				 blogPost.setPost(resultSet.getString("post"));
				 blogPost.setSid(resultSet.getString("scollegeId"));
				 blogPost.setPostDate(resultSet.getString("create_time") );
				 blogPost.setBranch(resultSet.getString("sbranch"));
				 blogPost.setFirstname(resultSet.getString("sfirstname"));
				 blogPost.setLastname(resultSet.getString("slastname"));
				 blogPost.setBlogpostId(resultSet.getInt("blogpostid"));

				 Blob blob = resultSet.getBlob("postImage");
                 
	                InputStream inputStream = blob.getBinaryStream();
	                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	                byte[] buffer = new byte[4096];
	                int bytesRead = -1;
	                 
	                while ((bytesRead = inputStream.read(buffer)) != -1) {
	                    outputStream.write(buffer, 0, bytesRead);                  
	                }
	                 
	                byte[] imageBytes = outputStream.toByteArray();
	                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	                 
	                 
	                inputStream.close();
	                outputStream.close();
	                 
	                blogPost.setBlogPostImage(base64Image);
	        
			}
			
						
		} catch (SQLException | IOException e) {
			
			e.printStackTrace();
		}
		
		return blogPost;		
		
		
	}

	@Override
	public List<BlogPost> getSingleBlogs(String cId) {
		
		List<BlogPost> allBlogs = null;
		BlogPost blogPost = null;
		
		
		try {
			
			allBlogs = new ArrayList<BlogPost>();
			
			String sql = "SELECT * FROM campusblogger.blogpost INNER JOIN campusblogger.student ON blogpost.scollegeid = student.scollegeid WHERE student.scollegeid = '"+cId.toString()+"' ORDER BY blogpost.blogpostid DESC";
					
			
			//get the database connection
			 Connection connection = DBConnection.openConnection();
			 
			 Statement statement = connection.createStatement();
			
			//Execute the sql query
			 ResultSet resultSet = statement.executeQuery(sql);
			 
			//Process the resultset
			 while (resultSet.next()) {
				 
				blogPost = new BlogPost();
				
				 blogPost.setTitle(resultSet.getString("title"));
				 blogPost.setPost(resultSet.getString("post"));
				 blogPost.setSid(resultSet.getString("scollegeId"));
				 blogPost.setPostDate(resultSet.getString("create_time") );
				 blogPost.setBranch(resultSet.getString("sbranch"));
				 blogPost.setFirstname(resultSet.getString("sfirstname"));
				 blogPost.setLastname(resultSet.getString("slastname"));
				 blogPost.setBlogpostId(resultSet.getInt("blogpostid"));
				 
				 Blob blob = resultSet.getBlob("postImage");
                 
	                InputStream inputStream = blob.getBinaryStream();
	                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	                byte[] buffer = new byte[4096];
	                int bytesRead = -1;
	                 
	                while ((bytesRead = inputStream.read(buffer)) != -1) {
	                    outputStream.write(buffer, 0, bytesRead);                  
	                }
	                 
	                byte[] imageBytes = outputStream.toByteArray();
	                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	                 
	                 
	                inputStream.close();
	                outputStream.close();
	                 
	                blogPost.setBlogPostImage(base64Image);
	        
			
			
				 
				 
				 
				 allBlogs.add(blogPost);
			}
			
		
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		finally {
			return allBlogs;
		}
	
	}
	
	
	

   public boolean deleteBlog(int postId) {
		
		boolean flag = false;
	try {
			
		String sql = "DELETE FROM campusblogger.blogpost WHERE blogpostid="+postId;
		Connection connection = DBConnection.openConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.executeUpdate();
		flag =true;
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return flag;

		
	}

	
	
	
}
