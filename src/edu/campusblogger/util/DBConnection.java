package edu.campusblogger.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	

	//define the database property
	private static final String DRIVER="com.mysql.jdbc.Driver"; //com.mysql.jdbc.Driver
	private static final String URL="jdbc:mysql://localhost:3306/campusblogger"; //jdbc:mysql://localhost:3306/campusblogger 
	private static final String USERNAME="root"; //root
	private static final String PASSWORD="Sanjay@mysql"; // 
	
	private static Connection connection = null;
	
	//define the static method
	public static Connection openConnection() {
		
		//check connection
		if (connection != null) {
			return connection;
			
		}
		else {
			try {
			
				//load driver
				Class.forName(DRIVER);
				
				//get connection
			connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
			}
		 catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
		}
		}
		return connection;
		
		
	}


}
