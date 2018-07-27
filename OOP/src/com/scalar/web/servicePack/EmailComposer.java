package com.scalar.web.servicePack;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import com.scalar.web.userModelPack.User;

public class EmailComposer {
	
	@Resource(name="jdbc/OOP") 
	private static DataSource dataSource;
	
	public EmailComposer(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	
	public static List<String> compose_email(String request,String param) {
		
		if(request.equals("WELCOME")) {
			
			List<String> list = new ArrayList<>();
			list.clear();
			
			String email = "scalartourguide@gmail.com";
			
			String password = getPassword(email);
			
			String subject = "A warm Welcome from Scalar Online Tour Guide";
			
			String message = "<html><body><h1>Greetings From Scalar!</h1><br>";
	        message += "<p><b>You have successfully registered with our system</b></p><br>";
	        message += "<p>All Set..We're here to provide your tour guidance requirements<p><br>";
	        message += "<p>Thank You for choosing as your Online Tour Guide<p>";
	        message += "</body></html>";
	        
	        
	        list.add(email);
			list.add(password);
			list.add(subject);
			list.add(message);
	        
	        return list;
	       
		}
		else if(request.equals("RESET_PW")) {

			List<String> list = new ArrayList<>();
			list.clear();
			
			String email = "scalartourguide@gmail.com";
			
			String password = getPassword(email);
			
			String subject = "A warm Welcome from Scalar Online Tour Guide";
			String message = "<html><body><h1 style=\"";
			message += "color:white;Background-color:red";
			message += "\">Your Password Changed</h1><br>";
			message += "Hi,";
			message += param+"<br>";
	        message += "<p>The password for your Scalar Tour Guide Account was recently changed</p>";
	        message += "<p>Thank You<p>";
	        message += "<p>The SOTG Accounts Team<p>";
	        message += "</body></html>";
	        
	        list.add(email);
			list.add(password);
			list.add(subject);
			list.add(message);
	        
	        return list;
		}
		else if(request.equals("CONFIRM_RESET_PW")) {

			List<String> list = new ArrayList<>();
			list.clear();
			
			String email = "scalartourguide@gmail.com";
			
			String password = getPassword(email);
			
			String subject = "A warm Welcome from Scalar Online Tour Guide";
			long token = CommonUtil.generateTokens();
			
			String message = "<html><body><h4>A Password Reset Request has been received</h4><br>";
	        message += "<p><b>Please go to the following link to reset your password in Scalar Online Tour Guidance System</b></p><br>";
	        message += "<a href=\"";
	        message += "http://localhost:8080/OOP/Reset_Password.jsp?token=";
	        message += param;
	        message += token;
	        message += "\">Confirm Email</a><br>";
	        message += "<p>If this is not your request,don't bother at all you're secured<p>";
	        message += "<p>Thank You<p>";
	        message += "</body></html>";
	        
	        list.add(email);
			list.add(password);
			list.add(subject);
			list.add(message);
	        
	        return list;
		}
		else if(request.equals("VERIFY_NEW_USER")) {
			
			List<String> list = new ArrayList<>();
			list.clear();
			
			String email = "scalartourguide@gmail.com";
			
			String password = getPassword(email);
			
			String subject = "A warm Welcome from Scalar Online Tour Guide";
			
			long token = CommonUtil.generateTokens();
			
			String message = "<html><body><h3>Email Verfication Needed</h3><br>";
	        message += "<p>To successful you registration <h2>Please Verify Your email using following Link</h2></p><br>";
	        message += "<a href=\"";
	        message += "http://localhost:8080/OOP/Email_Verify.jsp?token=";
	        message += param;
	        message += token;
	        message += "\">Confirm Email</a><br>";
	        message += "<h1></body></html>";
	        
	        list.add(email);
			list.add(password);
			list.add(subject);
			list.add(message);
	        
	        return list;
		}
		else if(request.equals("ADMIN_EMAIL")) {
			
			List<String> list = new ArrayList<>();
			list.clear();
			
			String email = param;
			
			String password = getPassword(email);
			
			String subject = null;
			
			String message = null;
	        
			list.add(email);
			list.add(password);
			list.add(subject);
			list.add(message);
			
	        
	        
	        return list;
		}
		else if(request.equals("INQUIRY")) {
			
			List<String> list = new ArrayList<>();
			list.clear();
			
			String email = "scalarmanager@gmail.com";
			
			String password = getPassword(email);
			
			String subject = "A warm Welcome from Scalar Online Tour Guide";
			
			
			String message = "<html><body><h1 style=\"";
			message += "color:white;Background-color:green";
			message += "\">Your Inquiry has been Received</h1><br>";
			message += "Hi,";
			message += param+"<br>";
	        message += "<p>Your inquiry has sent successfully.We are working on it.</p><br>";
	        message += "<p>We'll contact you immedietly</p><br>";
	        message += "<p>Thank You<p><br>";
	        message += "<p>Manager SOGT<p>";
	        message += "</body></html>";
	        
			list.add(email);
			list.add(password);
			list.add(subject);
			list.add(message);
			
	        
	        
	        return list;
		}
		else {
			return null;
		}
			
		
	}

	private static String getPassword(String email) {
		
		Connection MyConn = null;
		Statement Mystmt = null;
		ResultSet MyRS = null;
		
		String pw = null;
		
		try {
			// get a connection
			MyConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select password from sys_email_address_info where email_address = '"+email+"' ";
			
			
			Mystmt = MyConn.createStatement();
			
			
			// execute query
			MyRS = Mystmt.executeQuery(sql);
			
			
			// process result set
			if(MyRS.next()) {
				
				//retrieve result set
				pw = MyRS.getString("password");
				
			}
			
			return pw;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally{
			//close JDBC objects
			close(MyConn,null, Mystmt,null, MyRS, null);
		}
		
	}
	
	private static void close(Connection MyConn1, Connection myConn2, Statement Mystmt1, Statement Mystmt2, ResultSet MyRS, ResultSet myRS2) {
		
		try {
			if(MyRS != null)
				MyRS.close();
			if(MyConn1 != null)
				MyConn1.close();
			if(myConn2 != null)
				myConn2.close();
			if(Mystmt1 != null)
				Mystmt1.close();
			if(Mystmt2 != null)
				Mystmt2.close();
			
		}catch (Exception exc){
			exc.printStackTrace();
		}
		
	}
}
