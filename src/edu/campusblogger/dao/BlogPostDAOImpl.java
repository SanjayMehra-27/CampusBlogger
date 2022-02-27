package edu.campusblogger.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.Part;

import edu.campusblogger.entity.BlogPost;
import edu.campusblogger.util.DBConnection;

public class BlogPostDAOImpl implements BlogPostDAO {

	@Override
	public boolean savePost(BlogPost blogPost) {
		boolean flag = false;
		
		try {
			
			Part filepart = blogPost.getPostImage();
			
			System.out.println("part = " +blogPost.getPostImage());
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
	
			
			String sql = "INSERT INTO campusblogger.blogpost(title,post,scollegeid,postImage) VALUES (?,?,?,?)";

			System.out.println(sql+blogPost.getTitle());
			Connection connection = DBConnection.openConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1,blogPost.getTitle());
			preparedStatement.setString(2,blogPost.getPost());
			preparedStatement.setString(3,blogPost.getSid());
			preparedStatement.setBlob(4, inputStream);
			
			preparedStatement.executeUpdate();
			flag =true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean updatePost(BlogPost blogPost) {
		
		boolean flag = false;
		
		try {
			Part filepart = blogPost.getPostImage();
			
			System.out.println("part = " +blogPost.getPostImage());
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
			String sql = "UPDATE campusblogger.blogpost SET title = ?,post = ?,postImage = ? WHERE blogpostid = "+blogPost.getBlogpostId();

			System.out.println(sql+blogPost.getTitle());
			
			Connection connection = DBConnection.openConnection();
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1,blogPost.getTitle());
			preparedStatement.setString(2, blogPost.getPost());
			preparedStatement.setBlob(3, inputStream);
			
			preparedStatement.executeUpdate();
			flag =true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;

		
			}

}
