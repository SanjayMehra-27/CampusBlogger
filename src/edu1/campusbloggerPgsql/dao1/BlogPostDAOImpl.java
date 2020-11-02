package edu1.campusbloggerPgsql.dao1;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.Part;

import edu1.campusbloggerPgsql.entity1.BlogPost;
import edu1.campusbloggerPgsql.util1.DBConnection;

public class BlogPostDAOImpl implements BlogPostDAO {

	@Override
	public boolean savePost(BlogPost blogPost) {
		boolean flag = false;

		try {

//			Part filepart = blogPost.getPostImage();
//			
//			System.out.println("part = " +blogPost.getPostImage());
//			InputStream inputStream = null;
//
//			if (filepart != null) {
//				
//				try {
//				long fileSize = filepart.getSize();
//				String fileContent = filepart.getContentType();
//				
//					inputStream  = filepart.getInputStream();
//				
//				} catch (IOException e) {
//			
//					e.printStackTrace();
//				}
//			}

			String sql = "INSERT INTO blogpost(create_time,date,title,post,scollegeid,cardcolor) VALUES ((SELECT CURRENT_TIME),(SELECT CURRENT_DATE),?,?,?,?)"; // postImage
																																								// -
																																								// removed

			System.out.println(sql + blogPost.getTitle());
			Connection connection = DBConnection.openConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, blogPost.getTitle());
			preparedStatement.setString(2, blogPost.getPost());
			preparedStatement.setString(3, blogPost.getSid());
			preparedStatement.setString(4, blogPost.getCardColor());
//			preparedStatement.setBlob(4, inputStream);

			preparedStatement.executeUpdate();
			flag = true;
			System.out.println(flag);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean updatePost(BlogPost blogPost) {

		boolean flag = false;

		try {
//			Part filepart = blogPost.getPostImage();
//			
//			System.out.println("part = " +blogPost.getPostImage());
//			InputStream inputStream = null;
//
//			if (filepart != null) {
//				
//				try {
//				long fileSize = filepart.getSize();
//				String fileContent = filepart.getContentType();
//				
//					inputStream  = filepart.getInputStream();
//				
//				} catch (IOException e) {
//			
//					e.printStackTrace();
//				}
//			}
			String sql = "UPDATE blogpost SET title = ?,post = ?,cardcolor = ? WHERE blogpostid = "
					+ blogPost.getBlogpostId();

			System.out.println(sql + blogPost.getTitle());

			Connection connection = DBConnection.openConnection();

			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, blogPost.getTitle());
			preparedStatement.setString(2, blogPost.getPost());
			preparedStatement.setString(3, blogPost.getCardColor());
//			preparedStatement.setBlob(3, inputStream);

			preparedStatement.executeUpdate();
			flag = true;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;

	}

	@Override
	public boolean savePostImage(BlogPost blogPost) {
		boolean flag = false;

		try {

			Part filepart = blogPost.getFilepart();
			String fileName = filepart.getSubmittedFileName();
			System.out.println("part = " + blogPost.getFilepart());
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
			preparedStatement.setString(3, blogPost.getCollegeId());

			preparedStatement.executeUpdate();
			flag = true;

			System.out.println("SQL of Image :" + sql);

		} catch (SQLException e) {
			System.out.println("FLAG Of Image :" + flag);

			e.getMessage();
			e.printStackTrace();
		}
		return flag;

	}

}
