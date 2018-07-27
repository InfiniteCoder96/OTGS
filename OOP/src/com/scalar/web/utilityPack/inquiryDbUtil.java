package com.scalar.web.utilityPack;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.List;

import javax.sql.DataSource;

import com.scalar.web.userModelPack.Inquiry;

public class inquiryDbUtil {

	private static DataSource dataSource;
	
	public inquiryDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	public static List<Inquiry> getInquiries() {
		
		List<Inquiry> inq = new ArrayList<>();
		
		Connection MyConn = null;
		Statement Mystmt = null;
		ResultSet MyRS = null;
		
		try {
			
			// get a connection
			MyConn = dataSource.getConnection();
						
			// create sql statement
			String sql = "select * from inquiries";
						
			Mystmt = MyConn.createStatement();
						
			// execute query
			MyRS = Mystmt.executeQuery(sql);
			
			// process result set
			while(MyRS.next()) {
							
				//retrieve result set
				String id = MyRS.getString("inq_id");
				String name = MyRS.getString("name");
				String emailAddress = MyRS.getString("email");
				String message = MyRS.getString("message");
				String user_id = MyRS.getString("user_id");
				Date inqdate = MyRS.getDate("date");
				
				if(user_id == null || user_id == "") {
					
					// create a new user object
					Inquiry tmpInquiry = new Inquiry(id,name,emailAddress,message,inqdate);
					
					// add it to the list of users
					inq.add(tmpInquiry);
				}
				if(!(user_id == null)) {
					
					// create a new user object
					Inquiry tmpInquiry = new Inquiry(user_id,id,name,emailAddress,message,inqdate);
					
					// add it to the list of users
					inq.add(tmpInquiry);
					
				}
							
				
			}
			
			
			System.out.println(inq);
			return inq;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			return inq;
		}
		
		finally {
			//close JDBC objects
			close(MyConn,Mystmt,MyRS);
		}
		
	}

	

	public static int countInquiries() {
		
		Connection MyConn = null;
		Statement Mystmt = null;
		ResultSet MyRS = null;
		int count = 0;
		try {
			
			// get a connection
			MyConn = dataSource.getConnection();
						
			// create sql statement
			String sql = "select count(*) from inquiries";
						
			Mystmt = MyConn.createStatement();
						
			// execute query
			MyRS = Mystmt.executeQuery(sql);
			
			// process result set
			if(MyRS.next()) {
							
				count = MyRS.getInt(1);
							
				
			}
			
			
			
			return count;
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
			return count;
		}
		finally {
			//close JDBC objects
			close(MyConn,Mystmt,MyRS);
		}
		
	}

	public static void addInquiry(Inquiry newInquiry) {
		
		Connection MyConn = null;
		PreparedStatement Mystmt = null;

		
		try {
			// Get DB connection
			MyConn = dataSource.getConnection();
			
			
			//create sql for insert
			String sql = "INSERT INTO inquiries (inq_id,name,email,message,user_id) values (?,?,?,?,?)";
			
			Mystmt = MyConn.prepareStatement(sql);
			
			// set the parameter values for the user
			Mystmt.setString(1, newInquiry.getInq_id());
			Mystmt.setString(2, newInquiry.getUsername());
			Mystmt.setString(3, newInquiry.getEmail());
			Mystmt.setString(4, newInquiry.getMessage());
			Mystmt.setString(5, newInquiry.getUser_id());
			
			// execute sql insert
			Mystmt.execute();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			// clean up JDBC objects
			close(MyConn,Mystmt,null);
		}
		
	}

	private static void close(Connection MyConn, Statement Mystmt, ResultSet myRS) {
		
		try {
			if(myRS != null)
				myRS.close();
			if(MyConn != null)
				MyConn.close();
			if(Mystmt != null)
				Mystmt.close();
			
		}catch (Exception exc){
			exc.printStackTrace();
		}
		
	}

}
