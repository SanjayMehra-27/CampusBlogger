package edu1.campusbloggerPgsql.dao1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import edu1.campusbloggerPgsql.entity1.Login;
import edu1.campusbloggerPgsql.util1.DBConnection;


public class LoginDAOImpl implements LoginDAO {

	public String authenticate(Login login) {
		
		
		try {
			String sql = "SELECT * FROM student WHERE scollegeid=? AND spassword=?";
			Connection connection = DBConnection.openConnection();
			PreparedStatement ps1 =  connection.prepareStatement(sql);
			
			ps1.setString(1, login.getCollegeId());
			ps1.setString(2, login.getPassword());
			
			ResultSet rs1 =  ps1.executeQuery();
			
			System.out.println("UserCollegeId :"+login.getCollegeId());
			System.out.println("Password :"+login.getPassword());
			if (rs1.next()) {
				
				System.out.println("Password"+login.getPassword());
				return "true";
				
			}
			else {
				System.out.println("false");
				return "false";
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "error";
		
		
		
		
	}

}
