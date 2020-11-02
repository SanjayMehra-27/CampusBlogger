package edu1.campusbloggerPgsql.util1;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	

	//define the database property
	private static final String DRIVER="org.postgresql.Driver"; //com.mysql.jdbc.Driver
	private static final String URL="jdbc:postgresql://localhost:5432/campusblogger"; //jdbc:mysql://localhost:3306/campusblogger 
	private static final String USERNAME="postgres"; //root
	private static final String PASSWORD="postgres"; // 
	
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
			System.out.println("Connection Failed");
			System.out.println(e.getMessage());
		}
		}
		System.out.println("Connection Established");
		return connection;
		
		
	}


}
