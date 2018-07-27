
package com.scalar.web.utilityPack;

import java.security.Security;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.sql.DataSource;

import com.scalar.web.servicePack.EmailComposer;
import com.scalar.web.servicePack.Mailer;
import com.scalar.web.userModelPack.User;

public class UserDbUtil {

	private static DataSource dataSource;
	
	
	
	public UserDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
		
	}
	
	public List<User> getUsers() throws Exception{
		
		List<User> Users = new ArrayList<>();
		
		Connection MyConn = null;
		Statement Mystmt = null;
		ResultSet MyRS = null;
		
		try {
			// get a connection
			MyConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from user_info";
			
			
			Mystmt = MyConn.createStatement();
			
			
			// execute query
			MyRS = Mystmt.executeQuery(sql);
			
			
			// process result set
			while(MyRS.next()) {
				
				//retrieve result set
				String id = MyRS.getString("user_id");
				String firstName = MyRS.getString("firstName");
				String lastName = MyRS.getString("lastName");
				String emailAddress = MyRS.getString("emailAddress");
				String country = MyRS.getString("country");
				String username = MyRS.getString("username");
				
				// create a new user object
				User tmpUser = new User(id,firstName,lastName,emailAddress,country, username);
				
				// add it to the list of users
				Users.add(tmpUser);
			}
			return Users;
		}
		finally{
			//close JDBC objects
			close(MyConn,null, Mystmt,null, MyRS, null);
		}
		
		
	}

	public static String addUser(User newUser, String temp_per) throws Exception{
		
		
		
		Connection MyConn = null;
		
		PreparedStatement Mystmt1 = null;
		PreparedStatement Mystmt2 = null;
		String msg = null;
		if(temp_per.equals("perm")){
			try {
				// Get DB connection
				MyConn = dataSource.getConnection();
				
				
				//create sql for insert
				String sql1 = "INSERT INTO user_info (user_id,firstName,lastName,emailAddress,country,username) values (?,?,?,?,?,?)";
				String sql2 = "INSERT INTO user_login_info (username,password) values (?,?)";
				
				Mystmt1 = MyConn.prepareStatement(sql1);
				Mystmt2 = MyConn.prepareStatement(sql2);
				
				// set the parameter values for the user
				Mystmt1.setString(1, newUser.getId());
				Mystmt1.setString(2, newUser.getFirstName());
				Mystmt1.setString(3, newUser.getLastName());
				Mystmt1.setString(4, newUser.getEmailAddress());
				Mystmt1.setString(5, newUser.getCountry());
				Mystmt1.setString(6, newUser.getUsername());
				
				Mystmt2.setString(1, newUser.getUsername());
				Mystmt2.setString(2, newUser.getPassword());
				
				// execute sql insert
				Mystmt1.execute();
				Mystmt2.execute();
				
				
				
				EmailComposer emailComposer = new EmailComposer(dataSource);
				
				List<String> message = EmailComposer.compose_email("WELCOME", null);
		        
		        msg = Mailer.send(message.get(0), message.get(1), newUser.getEmailAddress(), message.get(2), message.get(3));
				return msg;
				
			} catch (SQLException e) {
				
				e.printStackTrace();
				return msg;
			}
			finally {
				// clean up JDBC objects
				close(MyConn,MyConn,Mystmt1,Mystmt2,null, null);
			}
		}
		else if(temp_per.equals("temp")) {
			
			try {
				// Get DB connection
				MyConn = dataSource.getConnection();
				
				
				//create sql for insert
				String sql1 = "INSERT INTO temp_user_info (user_id,firstName,lastName,emailAddress,country,username,password) values (?,?,?,?,?,?,?)";
				
				
				Mystmt1 = MyConn.prepareStatement(sql1);
				
				// set the parameter values for the user
				Mystmt1.setString(1, newUser.getId());
				Mystmt1.setString(2, newUser.getFirstName());
				Mystmt1.setString(3, newUser.getLastName());
				Mystmt1.setString(4, newUser.getEmailAddress());
				Mystmt1.setString(5, newUser.getCountry());
				Mystmt1.setString(6, newUser.getUsername());
				Mystmt1.setString(7, encrypt(newUser.getPassword(),"SCALAR2018"));
				
				
				// execute sql insert
				Mystmt1.execute();
				
				EmailComposer emailComposer = new EmailComposer(dataSource);
				
				List<String> message = EmailComposer.compose_email("VERIFY_NEW_USER", newUser.getId());
		        
				msg = Mailer.send(message.get(0), message.get(1), newUser.getEmailAddress(), message.get(2), message.get(3));
				return msg;
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
			finally {
				// clean up JDBC objects
				close(MyConn,MyConn,Mystmt1,Mystmt2,null, null);
			}
		}
		else{
			return null;
		}
		
		
	}
	
	
	
	public static String encrypt(String strClearText,String strKey) throws Exception{
		String strData="";
		
		try {
			SecretKeySpec skeyspec=new SecretKeySpec(strKey.getBytes(),"Blowfish");
			Cipher cipher=Cipher.getInstance("Blowfish");
			cipher.init(Cipher.ENCRYPT_MODE, skeyspec);
			byte[] encrypted=cipher.doFinal(strClearText.getBytes());
			strData=new String(encrypted);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return strData;
	}
	


	public static String decrypt(String strEncrypted,String strKey) throws Exception{
		String strData="";
		
		try {
			SecretKeySpec skeyspec=new SecretKeySpec(strKey.getBytes(),"Blowfish");
			Cipher cipher=Cipher.getInstance("Blowfish");
			cipher.init(Cipher.DECRYPT_MODE, skeyspec);
			byte[] decrypted=cipher.doFinal(strEncrypted.getBytes());
			strData=new String(decrypted);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return strData;
	}


	
	
	public static List<User> searchUsers(String keyword, String category) throws SQLException{
		
		List<User> Users = new ArrayList<>();
		int count = 0;
		Connection MyConn = null;
		PreparedStatement Mystmt = null;
		ResultSet MyRS = null;
		
		try {
			
				// get a connection
				MyConn = dataSource.getConnection();
				
				String sql = null;
				
				// create sql statement
				if(category.equals("User ID")) {
					sql = "select * from user_info where user_id=? ";
				}
				if(category.equals("First Name")) {
					sql = "select * from user_info where firstName=? ";
				}
				if(category.equals("Last Name")) {
					sql = "select * from user_info where lastName=? ";
				}
				if(category.equals("Username")) {
					sql = "select * from user_info where username=? ";
				}
				if(category.equals("Country")) {
					sql = "select * from user_info where country=? ";
				}
				if(category.equals("Email")) {
					sql = "select * from user_info where emailAddress=? ";
				}
				
				Mystmt = MyConn.prepareStatement(sql);
				
				Mystmt.setString(1, keyword);
				
				// execute query
				MyRS = Mystmt.executeQuery();
				
				
				// process result set
				
					while(MyRS.next()) {
						
						//retrieve result set
						String id = MyRS.getString("user_id");
						String firstName = MyRS.getString("firstName");
						String lastName = MyRS.getString("lastName");
						String emailAddress = MyRS.getString("emailAddress");
						String country = MyRS.getString("country");
						String username = MyRS.getString("username");
						
						// create a new user object
						User tmpUser = new User(id,firstName,lastName,emailAddress,country, username);
						
						// add it to the list of users
						Users.add(tmpUser);
						count++;
					}
					
					if(count == 0)
						return null;
					else
						return Users;
				
					
			
		}
		catch(NullPointerException e) {
			return null;
		}
		finally{
			//close JDBC objects
			close(MyConn,null, Mystmt,null, MyRS, null);
		}
		
		
		
	}
	
	

	public User getUsers(String user_id) {

		
		
		Connection MyConn = null;
		PreparedStatement Mystmt = null;
		ResultSet MyRS = null;
		
		
		try{
			
			// get connection to  database
			MyConn = dataSource.getConnection();
			
			//create sql to get selected user
			String sql = "select * from user_info where user_id=?";
			
			// create prepared statement
			Mystmt = MyConn.prepareStatement(sql);
			
			// set parameters
			Mystmt.setString(1, user_id);
			
			// execute statement 
			MyRS = Mystmt.executeQuery();
			
			// retrieve data from result set row
			if(MyRS.next()) {
				
				//retrieve result set
				String firstName = MyRS.getString("firstName");
				String lastName = MyRS.getString("lastName");
				String emailAddress = MyRS.getString("emailAddress");
				String country = MyRS.getString("country");
				String username = MyRS.getString("username");
				
				// create a new user object
				User tmpUser = new User(user_id,firstName,lastName,emailAddress,country, username);
				return tmpUser;
				
			}
			else {
				
				throw new Exception("Couldn't find user id: " +user_id);
				
			}
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally {
			close(MyConn,null, Mystmt,null, MyRS, null);
		}
		
		
		
	
	}

	public static void updateUser(User theUser) {
		
		Connection MyConn = null;
		PreparedStatement Mystmt = null;
	
		
		try{
			
			// get db connection
			MyConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "update user_info set firstName=?, lastName=?, emailAddress=?, country=?, username=? where user_id=?";
			
			// prepare statement
			Mystmt = MyConn.prepareStatement(sql);
			
			// set parameters
			Mystmt.setString(1, theUser.getFirstName());
			Mystmt.setString(2, theUser.getLastName());
			Mystmt.setString(3, theUser.getEmailAddress());
			Mystmt.setString(4, theUser.getCountry());
			Mystmt.setString(5, theUser.getUsername());
			Mystmt.setString(6, theUser.getId());
			
			// execute SQL statement
			Mystmt.execute();
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(MyConn,null, Mystmt,null, null, null);
		}
		
	}
	
	public static void deleteUser(String user_id, String username) {
		
		Connection MyConn = null;
		PreparedStatement Mystmt1 = null;
		PreparedStatement Mystmt2 = null;
		
		try{
			
			// get db connection
			MyConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql1 = "delete from user_info where user_id=?";
			String sql2 = "delete from user_login_info where username=?";
			
			// prepare statement
			Mystmt1 = MyConn.prepareStatement(sql1);
			Mystmt2 = MyConn.prepareStatement(sql2);
			
			// set parameters
			Mystmt1.setString(1, user_id);
			Mystmt2.setString(1, username);
			
			// execute SQL statement
			Mystmt1.execute();
			Mystmt2.execute();
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(MyConn,null, Mystmt1,Mystmt2, null, null);
		}
		
	}

	

	public static void resetUserPassword(String user_id, String password) {
		
		Connection MyConn = null;
		PreparedStatement Mystmt = null;
		
		
		try{
			
			// get db connection
			MyConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "update user_login_info l,user_info u set l.password=? where u.user_id=? AND u.username=l.username";
			
			// prepare statement
			Mystmt = MyConn.prepareStatement(sql);
			
			
			// set parameters
			Mystmt.setString(1, UserDbUtil.encrypt(password,"SCALAR2018"));
			Mystmt.setString(2, user_id);
			
			// execute SQL statement
			Mystmt.execute();
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(MyConn,null, Mystmt,null, null, null);
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
