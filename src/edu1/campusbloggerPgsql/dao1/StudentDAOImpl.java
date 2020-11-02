package edu1.campusbloggerPgsql.dao1;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.Part;

import edu1.campusbloggerPgsql.entity1.BlogPost;
import edu1.campusbloggerPgsql.entity1.Student;
import edu1.campusbloggerPgsql.util1.DBConnection;

public class StudentDAOImpl implements StudentDAO {

	// SignUp User ||
	@Override
	public boolean saveStudent(Student student) {
		boolean flag = false;

		try {

			String sql = "INSERT INTO student(sfirstname,slastname,scollegeid,semail,sphonenumber,spassword,sbranch,sprofession)VALUES('"
					+ student.getFirstname().trim() + "','" + student.getLastname().trim() + "','"
					+ student.getCollegeId().trim() + "','" + student.getEmail().trim() + "','"
					+ student.getPhonenumber().trim() + "','" + student.getPassword().trim() + "','"
					+ student.getBranch() + "','" + student.getProfesion() + "')";
			System.out.println(sql);
			Connection connection = DBConnection.openConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;

			System.out.println("Save User :" + flag);

		} catch (SQLException e) {
			e.getStackTrace();
		}
		System.out.println("Complete Save User :" + flag);

		return flag;
	}

	public Student get(String cId) throws IOException {

		Student student = null;
		try {
			student = new Student();

			String sql = "SELECT * FROM  student WHERE scollegeid = '" + cId.toString().trim() + "'";

			Connection connection = DBConnection.openConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sql);

			System.out.println(sql);

			while (resultSet.next()) {

				student.setId(resultSet.getInt("sid"));
				student.setFirstname(resultSet.getString("sfirstname").trim().toUpperCase());
				student.setLastname(resultSet.getString("slastname").trim().toUpperCase());
				student.setCollegeId(resultSet.getString("scollegeid").trim());
				student.setEmail(resultSet.getString("semail").trim());
				student.setPhonenumber(resultSet.getString("sphonenumber").trim());
				student.setPassword(resultSet.getString("spassword").trim());
				student.setBranch(resultSet.getString("sbranch"));
				student.setProfesion(resultSet.getString("sprofession").trim());

//				   Blob blob = resultSet.getBlob("photo");
//                 
//	                InputStream inputStream = blob.getBinaryStream();
//	                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//	                byte[] buffer = new byte[4096];
//	                int bytesRead = -1;
//	                 
//	                while ((bytesRead = inputStream.read(buffer)) != -1) {
//	                    outputStream.write(buffer, 0, bytesRead);                  
//	                }
//	                 
//	                byte[] imageBytes = outputStream.toByteArray();
//	                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
//	                 
//	                 
//	                inputStream.close();
//	                outputStream.close();
//	                 
//	                student.setPhoto(base64Image);
//	           
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out
				.println(student.getFirstname() + student.getLastname() + student.getBranch() + student.getCollegeId());

		return student;

	}

	public boolean updateStudent(Student student) {
		boolean flag = false;

		try {

			Part filepart = student.getFilepart();
			System.out.println("part = " + student.getFilepart());
			InputStream inputStream = null;

			if (filepart != null) {

				try {

					long fileSize = filepart.getSize(); // image Length/Size
					String fileContent = filepart.getContentType(); // type

					inputStream = filepart.getInputStream(); // converts Part data to input stream

				}

				catch (IOException e) {

					e.printStackTrace();
				}
			}

			String sql = "UPDATE student SET sfirstname = ?,slastname = ?,semail = ?,scollegeid = ?,sphonenumber = ?,spassword = ?,sbranch = ?,sprofession = ? WHERE sid = ? ";
			String sqlImage = "";
			System.out.println("Update :" + sql);

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
//			preparedStatement.setBinaryStream(9,inputStream);
			preparedStatement.setInt(9, student.getId());

			preparedStatement.executeUpdate();
			flag = true;
			// Test
			System.out.println(
					flag + " " + student.getFirstname() + " " + student.getLastname() + " " + student.getEmail() + " "
							+ student.getCollegeId() + " " + student.getPhonenumber() + " " + student.getPassword()
							+ " " + student.getBranch() + " " + student.getProfesion() + " " + student.getId());

		} catch (SQLException e) {
			e.getMessage();
			e.printStackTrace();
		}
		return flag;

	}

	@Override
	public List<Student> getStudent(String branch) {

		List<Student> allStudent = null;
		Student student = null;

		try {

			allStudent = new ArrayList<Student>();

			String sql = " SELECT DISTINCT(scollegeid),sid,sfirstname,spassword,slastname,semail,sphonenumber,sbranch,sprofession,image FROM public.student JOIN public.images USING (scollegeid) WHERE sbranch = '"
					+ branch.toString() + "' ORDER BY sfirstname ASC ";

			// get the database connection
			Connection connection = DBConnection.openConnection();

			Statement statement = connection.createStatement();

			// Execute the sql query
			ResultSet resultSet = statement.executeQuery(sql);

			// Process the resultset
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

				try {

					InputStream inputStream = resultSet.getBinaryStream("image");

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

				} catch (IOException e) {
					System.out.println("Image Fetching With List Of Student :" + sql);

					e.getMessage();
					e.printStackTrace();
				}

				// test

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

			String sql = "SELECT DISTINCT * FROM blogpost INNER JOIN student ON blogpost.scollegeid = student.scollegeid ORDER BY blogpostid DESC";

			// get the database connection
			Connection connection = DBConnection.openConnection();

			Statement statement = connection.createStatement();

			// Execute the sql query
			ResultSet resultSet = statement.executeQuery(sql);
			System.out.println(sql);// test
			// Process the resultset
			while (resultSet.next()) {

				blogPost = new BlogPost();

				blogPost.setTitle(resultSet.getString("title"));
				blogPost.setPost(resultSet.getString("post")); // .strip() removed
				blogPost.setSid(resultSet.getString("scollegeId"));
				blogPost.setPostDate(resultSet.getString("date"));
				blogPost.setPostTime(resultSet.getString("create_time"));
				blogPost.setBranch(resultSet.getString("sbranch"));
				blogPost.setFirstname(resultSet.getString("sfirstname").toUpperCase());
				blogPost.setLastname(resultSet.getString("slastname").toUpperCase());
				blogPost.setBlogpostId(resultSet.getInt("blogpostid"));
				blogPost.setCardColor(resultSet.getString("cardcolor"));

//				 	Blob blob = resultSet.getBlob("postImage");
//                 
//	                InputStream inputStream = blob.getBinaryStream();
//	                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//	                byte[] buffer = new byte[4096];
//	                int bytesRead = -1;
//	                 
//	                while ((bytesRead = inputStream.read(buffer)) != -1) {
//	                    outputStream.write(buffer, 0, bytesRead);                  
//	                }
//	                 
//	                byte[] imageBytes = outputStream.toByteArray();
//	                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
//	                 
//	                 
//	                inputStream.close();
//	                outputStream.close();
//	                 
//	                blogPost.setBlogPostImage(base64Image);
//	        
				allBlogs.add(blogPost);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		System.out.println("BlogPost Table Data :" + blogPost.getSid() + " " + blogPost.getFirstname() + " "
				+ blogPost.getLastname() + " " + blogPost.getBranch() + " " + blogPost.getPhonenumber() + " "
				+ blogPost.getBlogpostId() + " " + blogPost.getEmail());

		return allBlogs;

	}

	@Override
	public Student getUserPost(int postId) {

		BlogPost blogPost = null;

		try {
			blogPost = new BlogPost();

			String sql = "SELECT * FROM blogpost INNER JOIN student ON blogpost.scollegeid = student.scollegeid WHERE blogpostid = "
					+ postId;

			// get the database connection
			Connection connection = DBConnection.openConnection();

			Statement statement = connection.createStatement();

			// Execute the sql query
			ResultSet resultSet = statement.executeQuery(sql);

			// Process the resultset
			while (resultSet.next()) {

				blogPost = new BlogPost();

				blogPost.setTitle(resultSet.getString("title"));
				blogPost.setPost(resultSet.getString("post"));

				blogPost.setPostDate(resultSet.getString("create_time"));
				blogPost.setBranch(resultSet.getString("sbranch"));
				blogPost.setFirstname(resultSet.getString("sfirstname"));
				blogPost.setLastname(resultSet.getString("slastname"));
				blogPost.setBlogpostId(resultSet.getInt("blogpostid"));
				blogPost.setCardColor(resultSet.getString("cardcolor"));

			}

		} catch (SQLException e) {

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

			String sql = "SELECT * FROM blogpost INNER JOIN student ON blogpost.scollegeid = student.scollegeid WHERE student.scollegeid = '"
					+ cId.toString() + "' ORDER BY blogpostid DESC";

			// get the database connection
			Connection connection = DBConnection.openConnection();

			Statement statement = connection.createStatement();

			// Execute the sql query
			ResultSet resultSet = statement.executeQuery(sql);

			// Process the resultset
			while (resultSet.next()) {

				blogPost = new BlogPost();

				blogPost.setTitle(resultSet.getString("title"));
				blogPost.setPost(resultSet.getString("post"));
				blogPost.setSid(resultSet.getString("scollegeId"));
				blogPost.setPostDate(resultSet.getString("create_time"));
				blogPost.setBranch(resultSet.getString("sbranch"));
				blogPost.setFirstname(resultSet.getString("sfirstname"));
				blogPost.setLastname(resultSet.getString("slastname"));
				blogPost.setBlogpostId(resultSet.getInt("blogpostid"));
				blogPost.setCardColor(resultSet.getString("cardColor"));

//				 Blob blob = resultSet.getBlob("postImage");
//                 
//	                InputStream inputStream = blob.getBinaryStream();
//	                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//	                byte[] buffer = new byte[4096];
//	                int bytesRead = -1;
//	                 
//	                while ((bytesRead = inputStream.read(buffer)) != -1) {
//	                    outputStream.write(buffer, 0, bytesRead);                  
//	                }
//	                 
//	                byte[] imageBytes = outputStream.toByteArray();
//	                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
//	                 
//	                 
//	                inputStream.close();
//	                outputStream.close();
//	                 
//	                blogPost.setBlogPostImage(base64Image);
//	        
//			

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

			String sql = "DELETE FROM blogpost WHERE blogpostid=" + postId;
			Connection connection = DBConnection.openConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;

	}

	@Override
	public boolean updateStudentImage(Student student) {
		boolean flag = false;

		try {

			Part filepart = student.getFilepart();
			String fileName = filepart.getSubmittedFileName();
			System.out.println("part = " + student.getFilepart());
			InputStream inputStream = null;

			if (filepart != null) {

				try {

					long fileSize = filepart.getSize();
					String fileContent = filepart.getContentType();

					inputStream = filepart.getInputStream();

				} catch (IOException e) {

					e.printStackTrace();
				}
			}

			String sql = "UPDATE images SET imgname=?,image=? WHERE scollegeid=?";

			Connection connection = DBConnection.openConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, fileName);
			preparedStatement.setBinaryStream(2, inputStream);
			preparedStatement.setString(3, student.getCollegeId());

			preparedStatement.executeUpdate();
			flag = true;

			System.out.println("SQL of Image :" + sql);

		} catch (SQLException e) {
			System.out.println("FLAG Of Image :" + flag);

			e.getMessage();
			e.printStackTrace();
		}
		return flag;

//	try {
//		
//		Connection conn = DBConnection.openConnection();
//		
//		// All LargeObject API calls must be within a transaction block
//		conn.setAutoCommit(false);
//
//		// Get the Large Object Manager to perform operations with
//		LargeObjectManager lobj = ((org.postgresql.PGConnection)conn).getLargeObjectAPI();
//
//		// Create a new large object
//		long oid = (long) lobj.createLO(LargeObjectManager.READ | LargeObjectManager.WRITE);
//
//		// Open the large object for writing
//		LargeObject obj = lobj.open(oid, LargeObjectManager.WRITE);
//
//		// Now open the file
//		Part filepart = student.getFilepart();
//		
//		String filePath = filepart.getSubmittedFileName();//Retrieves complete file name with path and directories 
//        Path p = Paths.get(filePath); //creates a Path object
//        String fileName = p.getFileName().toString();//Retrieves file name from Path object
//      
//		File file = new File(fileName);
//		FileInputStream fis;
//		try {
//			fis = new FileInputStream(file);
//		
//
//		// Copy the data from the file to the large object
//		byte buf[] = new byte[2048];
//		int s, tl = 0;
//		try {
//			while ((s = fis.read(buf, 0, 2048)) > 0) {
//			    obj.write(buf, 0, s);
//			    tl += s;
//			}
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		// Close the large object
//		obj.close();
//
//		// Now insert the row into imageslo
//		String sql = "INSERT INTO images VALUES (?, ?)";
//		PreparedStatement ps = conn.prepareStatement(sql);
//		ps.setString(1, file.getName());
//		ps.setInt(2, (int) oid);
//		ps.executeUpdate();
//		flag = true;
//		ps.close();
//		fis.close();
//		
//		
//	System.out.println(flag+"  "+sql);
//	} catch (SQLException e) {
//		e.printStackTrace();
//	}
//		
//	
//	
//	} catch (Exception e) {
//		e.printStackTrace();
//	}

	}

// Fetch Student Image Using College Id
	public Student getstudentImage(String cId) {
		Student student = null;
		boolean flag = false;
		try {
			student = new Student();

			String sql = "SELECT * FROM  images WHERE scollegeid = '" + cId.toString().trim() + "'";

			Connection connection = DBConnection.openConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sql);

			System.out.println("Image Fetching Sql" + sql);
			try {
				while (resultSet.next()) {

					InputStream inputStream = resultSet.getBinaryStream("image");

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
					System.out.println("Image Fetching :" + flag + sql);

				}

			} catch (IOException e) {
				System.out.println("Image Fetching :" + flag + sql);

				e.getMessage();
				e.printStackTrace();
			}

		} catch (SQLException e) {
			System.out.println("Image Fetching :" + flag);

			e.printStackTrace();
		}

		return student;

	}

	@Override
	public void saveUserProfileImage(Student student) {
		boolean flag = false;
		try {

			String fileName = student.getFilepart().getSubmittedFileName();
			InputStream inputStream = null;

			try {

				inputStream = student.getFilepart().getInputStream();

				System.out.println("FILE NAME USER PROFILE :" + fileName + inputStream);

			} catch (IOException e) {

				e.printStackTrace();
			}

			String sql = "INSERT INTO images(imgname, scollegeid, image) VALUES (?, ?, ?)";

			Connection connection = DBConnection.openConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, fileName);
			preparedStatement.setString(2, student.getCollegeId());
			preparedStatement.setBinaryStream(3, inputStream);

			preparedStatement.executeUpdate();
			flag = true;

			System.out.println("SQL of Image :" + sql);

		} catch (SQLException e) {
			System.out.println("FLAG Of Image :" + flag);

			e.getMessage();
			e.printStackTrace();
		}

	}

	/* Delete User Account */
	@Override
	public boolean deleteUserAccount(String collegeId) {
		boolean flag = false;
		try {

			String sql = "DELETE FROM public.student WHERE student.scollegeid='" + collegeId.toString().trim() + "'";
			Connection connection = DBConnection.openConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;

			System.out.println(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;

	}

	public boolean deleteAllUserPost(String collegeId) {

		boolean flag = false;
		try {

			String sql = "'DELETE FROM public.blogpost WHERE blogpost.scollegeid='" + collegeId.toString().trim() + "'";
			Connection connection = DBConnection.openConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;

			System.out.println(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;

	}

	@Override
	public boolean deleteUserProfileImage(String collegeId) {
		boolean flag = false;
		try {

			String sql = "'DELETE FROM public.images WHERE scollegeid='" + collegeId.toString().trim() + "'";
			Connection connection = DBConnection.openConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;

			System.out.println(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public BlogPost getCountUserPost(String cId) {
		BlogPost blogPost = null;

		try {
			blogPost = new BlogPost();

			String sql = "SELECT COUNT(*) FROM public.blogpost WHERE scollegeid = '" + cId.trim() + "'";

			System.out.println(sql);
			// get the database connection
			Connection connection = DBConnection.openConnection();

			Statement statement = connection.createStatement();

			// Execute the sql query
			ResultSet resultSet = statement.executeQuery(sql);

			resultSet.next();

			blogPost.setPostCount(resultSet.getInt("count"));

			System.out.println("Post COUNT : " + resultSet.getInt("count"));

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return blogPost;

	}

}
