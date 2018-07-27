package com.scalar.web.ControlServletsPack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.scalar.web.servicePack.CommonUtil;
import com.scalar.web.servicePack.EmailComposer;
import com.scalar.web.servicePack.Mailer;
import com.scalar.web.userModelPack.TourGuide;
import com.scalar.web.userModelPack.User;
import com.scalar.web.utilityPack.TourGuideDbUtil;
import com.scalar.web.utilityPack.UserDbUtil;


/**
 * Servlet implementation class UserControllerServlet
 */
@WebServlet("/UserControllerServlet")
public class UserControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDbUtil userDbUtil;
	private TourGuideDbUtil tourDbUtil;
	
	@Resource(name="jdbc/OOP") 
	private static DataSource dataSource;

	
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		
		try {
			
			userDbUtil = new UserDbUtil(dataSource);
			
		}catch(Exception exc) {
			throw new ServletException(exc);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// read the command
		String command = request.getParameter("command");
		
		try {
			
			// If the command is missing, then default to listing users
			if(command == null) {
				command = "LIST";
			}
			
			switch(command) {
						
				case "ADD":addUser(request,response);
							break;
				case "ADMIN_ADD":adminaddUser(request,response);
							break;
				case "RESET":userPasswordReset(request,response);
							break;
				case "VERIFY":addTempUser(request,response);
							break;
				case "VERIFY_FOR_PW_RESET":Emai_Verification_for_PW_Reset(request,response);
							break;
				case "VALIDATE":validateUser(request,response);
							break;
				case "UPDATE":updateUser(request,response);
							break;
				
				default:listUsers(request,response);
				
			}
			
		} catch (Exception exc) {
			// TODO Auto-generated catch block
			throw new ServletException(exc);
		}
		
	}

	

	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// read the command
		String command = request.getParameter("command");
		
		
		try {
			
			
			// If the command is missing, then default to listing users
			if(command == null) {
				command = "LIST";
			}
			
			switch(command) {
				case "DELETE":deleteUser(request,response);
							break;
				case "LIST":listUsers(request,response);
							break;
				case "LOAD":loadUser(request,response);
							break;
				case "SEARCH":SearchUsers(request,response);
							break;
				
				
				default:listUsers(request,response);
			}
			
		} catch (Exception exc) {
			
			throw new ServletException(exc);
		}
		
		
	}

	
	private void validateUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Connection MyConn = null;
		
		Statement Mystmt1 = null;
		Statement Mystmt2 = null;
		
		
		ResultSet MyRS1 = null;
		ResultSet MyRS2 = null;
		
		String username = request.getParameter("user");
		String password = UserDbUtil.encrypt(request.getParameter("pass"),"SCALAR2018");
		
			
			
				try {
						
					// get a connection
					MyConn = dataSource.getConnection();
					
					// create sql statement
					String sql1 = "select * from user_login_info where username='"+username+"' and password='"+password+"' ";
					String sql2	= "select * from user_info where username='"+username+"' ";		
								
					Mystmt1 = MyConn.createStatement();
					Mystmt2 = MyConn.createStatement();
					// execute query
					MyRS1 = Mystmt1.executeQuery(sql1);
					MyRS2 = Mystmt2.executeQuery(sql2);
					
					if(MyRS1.next()) {
							PreparedStatement Mystmt = null;
				    		Connection MyConn_ex = null;
				    		
							if(username.equals("admin")) {
								
						        response.sendRedirect("http://localhost:8080/OOP/Admin_Manager_ControllerServlet?command=VALIDATE");
						
							}
							if(MyRS2.next()) {
								
								HttpSession session = request.getSession();
								session.setMaxInactiveInterval(10*60);
								
								
								Date date = new Date(session.getLastAccessedTime());
								
						        try {
				
									MyConn_ex = dataSource.getConnection();
									
									String sql = "update user_login_info set last_seen=? where username=?";
											
									Mystmt = MyConn_ex.prepareStatement(sql);
									
									// set parameters
									Mystmt.setDate(1, date);
									Mystmt.setString(2, username);
									
									// execute SQL statement
									Mystmt.execute();
									
								
								} catch (SQLException e) {
									
									e.printStackTrace();
								}
						        finally {
						        	close(MyConn_ex,Mystmt, null, null, null, MyRS1);
						        }
						        
						        session.setAttribute("user",  MyRS2.getString("firstName"));
								session.setAttribute("id", MyRS2.getString("user_id"));
								session.setAttribute("last_seen", MyRS1.getString("last_seen"));
								
								request.getRequestDispatcher("WelcomeUser.jsp").forward(request, response);
					                
							}	
						
					}
					
					else {
						
							HttpSession session = request.getSession();
							request.setAttribute("errorLoginMsg", "Invalid username or password");
							request.setAttribute("errorLoginMsg2", "If you are the Admin..Yeah you're fired..!");
			                request.getRequestDispatcher("InvalidLogin.jsp").forward(request, response);
			                
					}
					 
					
				
				} catch (Exception exc) {
					
					exc.printStackTrace();
				}
				finally{
					//close JDBC objects
					close(MyConn,null,Mystmt1,Mystmt2,MyRS1,MyRS2);
				}
	}

	private void userPasswordReset(HttpServletRequest request, HttpServletResponse response) {
		
		
		try {
			// read user id from form data
			String password = request.getParameter("password");
			String user_id = request.getParameter("token");
			
			// delete user from database
			List<User> user = UserDbUtil.searchUsers(user_id, "User ID");
			
			UserDbUtil.resetUserPassword(user_id,password);
			System.out.println("Password Reset Successful");
			
			request.setAttribute("SalertMsg", "Password Reset Successful");
			EmailComposer emailComposer = new EmailComposer(dataSource);
			List<String> message = EmailComposer.compose_email("RESET_PW", user.get(0).getFirstName());
	        
	        String msg = Mailer.send(message.get(0), message.get(1), user.get(0).getEmailAddress(), message.get(2), message.get(3));
	        
			// send back to admin dashboard 
			RequestDispatcher dispatcher = request.getRequestDispatcher("Reset_Password.jsp");
			dispatcher.forward(request, response);
			
		} catch (ServletException e) {
			request.setAttribute("WalertMsg", "Something went wrong ! .... I think its a Servlet issue");
			try {
				request.getRequestDispatcher("Reset_Password.jsp").forward(request, response);
			} catch (ServletException e1) {
				
				e1.printStackTrace();
			} catch (IOException e1) {
				
				e1.printStackTrace();
			}
			e.printStackTrace();
		} catch (IOException e) {
			request.setAttribute("WalertMsg", "Something went wrong ! .... I think its a I/O issue");
			try {
				request.getRequestDispatcher("Reset_Password.jsp").forward(request, response);
			} catch (ServletException e1) {
				
				e1.printStackTrace();
			} catch (IOException e1) {
				
				e1.printStackTrace();
			}
			e.printStackTrace();
		} catch (SQLException e) {
			request.setAttribute("WalertMsg", "Something went wrong ! .... I think its a I/O issue");
			try {
				request.getRequestDispatcher("Reset_Password.jsp").forward(request, response);
			} catch (ServletException e1) {
				
				e1.printStackTrace();
			} catch (IOException e1) {
				
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		
	}

	private void Emai_Verification_for_PW_Reset(HttpServletRequest request, HttpServletResponse response) {
		
		
		String email = request.getParameter("email");
		
		User validity = CheckEmailValidation(email);
		
		if(validity != null) {
			
			EmailComposer emailComposer = new EmailComposer(dataSource);
			List<String> message = EmailComposer.compose_email("CONFIRM_RESET_PW", validity.getId());
	        
	        String msg = Mailer.send(message.get(0), message.get(1), email, message.get(2), message.get(3));
			
			
			request.setAttribute("SalertMsg", "An Email has been sent to you");
			
			
			try {
				request.getRequestDispatcher("Email_Confirmation_PW_Reset.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			request.setAttribute("WalertMsg", "Email Not found..Make sure you have registered in the System");
			
			// send back to admin dashboard 
			try {
				request.getRequestDispatcher("Email_Confirmation_PW_Reset.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}

	private User CheckEmailValidation(String email) {
		
		Connection MyConn = null;
		PreparedStatement Mystmt = null;
		ResultSet MyRS = null;
		
		
		
		try {
			
			
			MyConn = dataSource.getConnection();
			
			String sql = "select * from user_info u,user_login_info l where u.emailAddress = ? AND u.username = l.username";
					
			Mystmt = MyConn.prepareStatement(sql);
			
			// set parameters
			Mystmt.setString(1, email);
						
			// execute query
			MyRS  = Mystmt.executeQuery();
			
			
			
			if(MyRS.next()) {
				
				//retrieve result set
				String id = MyRS.getString("user_id");;
				String firstName = MyRS.getString("firstName");
				String lastName = MyRS.getString("lastName");
				String emailAddress = MyRS.getString("emailAddress");
				String country = MyRS.getString("country");
				String username = MyRS.getString("username");
				String password = MyRS.getString("password");
				
				
				// create a new user object
				User tmpUser = new User(id,firstName,lastName,emailAddress,country, username,password);
				
				
				return tmpUser;
			}
			else
				return null;
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally {
		
		close(MyConn,Mystmt,null, null, MyRS, null);
		}
				
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			// read user id from form data
			String user_id = request.getParameter("user_id");
			String username = request.getParameter("username");
			
			// delete user from database
			UserDbUtil.deleteUser(user_id,username);
			
			
			request.setAttribute("SalertMsg", "User deleted successfully");
	
			tourDbUtil = new TourGuideDbUtil(dataSource);
	        
	        List<User> users = userDbUtil.getUsers();
	        List<TourGuide> tourguides = TourGuideDbUtil.getTourGuides("Admin_Dashboard.jsp", 0, 0);
	        
	        request.setAttribute("TOUR_GUIDE_LIST", tourguides);
	        request.setAttribute("USERS_LIST", users);
	        
			// send back to admin dashboard 
			RequestDispatcher dispatcher = request.getRequestDispatcher("Admin_Dashboard.jsp");
			dispatcher.forward(request, response);
			
		} catch (ServletException e) {
			request.setAttribute("WalertMsg", "Something went wrong ! .... I think its a Servlet issue");
			e.printStackTrace();
		} catch (IOException e) {
			request.setAttribute("WalertMsg", "Something went wrong ! .... I think its a I/O issue");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void updateUser(HttpServletRequest request, HttpServletResponse response) {
		
		// read user info from form data
		String user_id = request.getParameter("user_id");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
		String username = request.getParameter("username");
		
		try {
			// create a new user object
			User theUser = new User(user_id,firstName,lastName,email,country,username);
			
			// perform update on database
			UserDbUtil.updateUser(theUser);
	        
			tourDbUtil = new TourGuideDbUtil(dataSource);
	        
	        List<User> users = userDbUtil.getUsers();
	        List<TourGuide> tourguides = TourGuideDbUtil.getTourGuides("Admin_Dashboard.jsp", 0, 0);
	        
	        request.setAttribute("TOUR_GUIDE_LIST", tourguides);
	        request.setAttribute("USERS_LIST", users);
	        
			request.setAttribute("SalertMsg", "User info updated successfully");
	        
			// send them back to the admin page
			RequestDispatcher dispatcher = request.getRequestDispatcher("Admin_Dashboard.jsp");
			
			dispatcher.forward(request, response);
			
		} catch (ServletException e) {
			request.setAttribute("WalertMsg", "Something went wrong ! .... I think its a Servlet issue");
			e.printStackTrace();
		} catch (IOException e) {
			request.setAttribute("WalertMsg", "Something went wrong ! .... I think its a I/O issue");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void adminaddUser(HttpServletRequest request, HttpServletResponse response) {
		
		String temp_per = "perm";
		
		try {
			String userID = CommonUtil.generateIDs(getUserIDs(temp_per));
			
			//read user info from form data
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String country = request.getParameter("country");
			String username = request.getParameter("username");
			String password = UserDbUtil.encrypt(request.getParameter("password"),"SCALAR2018");
			
			//create a new user object
			User newUser = new User(userID,firstName,lastName,email,country,username,password);
			
			//add the user data to the database
			String msg = UserDbUtil.addUser(newUser, temp_per);
			
			if(msg == null) {
				request.setAttribute("SalertMsg", "User Added Successfully");
			}
			else {
				request.setAttribute("WalertMsg", "Invalid Email/Please Check your internet connection");
			}
			
			tourDbUtil = new TourGuideDbUtil(dataSource);
	        
	        List<User> users = userDbUtil.getUsers();
	        List<TourGuide> tourguides = TourGuideDbUtil.getTourGuides("Admin_Dashboard.jsp", 0, 0);
	        
	        request.setAttribute("TOUR_GUIDE_LIST", tourguides);
	        request.setAttribute("USERS_LIST", users);
	        
			RequestDispatcher dispatcher = request.getRequestDispatcher("Admin_Dashboard.jsp");
			
			dispatcher.forward(request, response);
			
		} catch (SQLException e) {
			request.setAttribute("WalertMsg", "Something went wrong ! .... I think its a SQL issue");
			e.printStackTrace();
		} catch (ServletException e) {
			request.setAttribute("WalertMsg", "Something went wrong ! .... I think its a Servlet issue");
			e.printStackTrace();
		} catch (IOException e) {
			request.setAttribute("WalertMsg", "Something went wrong ! .... I think its a I/O issue");
			e.printStackTrace();
		} catch (Exception e) {
			request.setAttribute("WalertMsg", "Something went wrong !");
			e.printStackTrace();
		}
}
	
	private void loadUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//read user id from form data
		String user_id = request.getParameter("user_id");
		
		//get user from database (db util)
		User theUser = userDbUtil.getUsers(user_id);
		
		//place user in the request attribute
		request.setAttribute("THE_USER", theUser);
		
		//send to jsp page
		RequestDispatcher dispatcher = request.getRequestDispatcher("/updateUserDetails.jsp");
		dispatcher.forward(request,response);
	}

	private void SearchUsers(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		
		
		String keyword = request.getParameter("key");
		String category = request.getParameter("category");
		
		List<User> users;
		
		
				users = UserDbUtil.searchUsers(keyword,category);
			
			if(users != null) {
				request.setAttribute("USERS_LIST", users);
				request.setAttribute("SalertMsg", users.size() + " matched results found");
				request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
				
			
				
			}
			if(users == null ) {
				request.setAttribute("WalertMsg", "Results Not found");
				tourDbUtil = new TourGuideDbUtil(dataSource);
		        
		        List<User> users_list = userDbUtil.getUsers();
		        List<TourGuide> tourguides = TourGuideDbUtil.getTourGuides("Admin_Dashboard.jsp", 0, 0);
		        
		        request.setAttribute("TOUR_GUIDE_LIST", tourguides);
		        request.setAttribute("USERS_LIST", users_list);
				request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
			
			}
		
		
	}

	private void addTempUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//read user info from form data
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		List<User> username_chk = UserDbUtil.searchUsers(username, "Username");
		List<User> email_chk = UserDbUtil.searchUsers(email, "Email");
		
		if(username_chk == null && email_chk == null) {
			
			String temp_per = "temp";
			
			String userID = CommonUtil.generateTempIDs(getUserIDs(temp_per));
			
			//create a new user object
			User newUser = new User(userID,firstName,lastName,email,country,username,password);
			try {
				
				//add the user data to the database
				UserDbUtil.addUser(newUser,temp_per);
						
				//send back to main page
					
						
						
				request.setAttribute("SalertMsg", "You have registered successfully....Check your mail for futher info	Thank you");
						
							/*RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
							
							dispatcher.forward(request, response);*/
				request.getRequestDispatcher("Registration.jsp").forward(request, response);
			}
			catch(Exception e) {
				request.setAttribute("WalertMsg", "Something went wrong ! .... I think its a SQL issue");
				e.printStackTrace();
			}
		}
		else {
			
			if(email_chk != null && username_chk != null) {
				request.setAttribute("WalertMsg", "Username & Email Address has already taken please try another");
			}
			else if(email_chk != null) {
				request.setAttribute("WalertMsg", "Another User registered with the same email address..Please make sure you're not registered");
			}
			else if(username_chk != null) {
				request.setAttribute("WalertMsg", "Username has already taken please try another");
			}
				
			request.getRequestDispatcher("Registration.jsp").forward(request, response);
		}
		
	}
	
	private void addUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String user_id = request.getParameter("token");
		
		
		
		String temp_per = "perm";
		String userID = CommonUtil.generateIDs(getUserIDs(temp_per));
		
		
		
		try {
			//add the user data to the database
			
			UserDbUtil.addUser(selectUser(user_id,userID), temp_per);
			deleteTempUser(user_id);
			//send back to main page
		
			
			
			request.setAttribute("SalertMsg", "You have registered successfully....Check your mail for futher info	Thank you");
			
				/*RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
				
				dispatcher.forward(request, response);*/
			request.getRequestDispatcher("Email_Verify.jsp").forward(request, response);
		}
		catch(Exception e) {
			request.setAttribute("WalertMsg", "Something went wrong ! .... I think its a SQL issue");
			e.printStackTrace();
		}
		
		
	}


	private void deleteTempUser(String user_id) {
		
		Connection MyConn = null;
		PreparedStatement Mystmt = null;
		
		
		try{
			
			// get db connection
			MyConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "delete from temp_user_info where user_id=?";
			
			
			// prepare statement
			Mystmt = MyConn.prepareStatement(sql);
			
			
			// set parameters
			Mystmt.setString(1, user_id);
			
			
			// execute SQL statement
			Mystmt.execute();
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(MyConn,Mystmt, null, null, null, null);
		}
			
		
	}

	private User selectUser(String user_id, String userID) {
		
	
		Connection MyConn = null;
		PreparedStatement Mystmt = null;
		ResultSet MyRS = null;
		
		
			try {
				MyConn = dataSource.getConnection();
				
				String sql = "select * from temp_user_info where user_id=?";
						
				Mystmt = MyConn.prepareStatement(sql);
				
				Mystmt.setString(1, user_id);
				
				// execute query
				MyRS = Mystmt.executeQuery();
				
				
				
				// process result set
				if(MyRS.next()) {
					
					//retrieve result set
					String id = userID;
					String firstName = MyRS.getString("firstName");
					String lastName = MyRS.getString("lastName");
					String emailAddress = MyRS.getString("emailAddress");
					String country = MyRS.getString("country");
					String username = MyRS.getString("username");
					String password = MyRS.getString("password");
					
					// create a new user object
					User tmpUser = new User(id,firstName,lastName,emailAddress,country, username,password);
					
					return tmpUser;
				}
				else
					return null;
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			} finally {
				
				close(MyConn,Mystmt,null, null, MyRS, null);
			}
			
			
	}

	private void listUsers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<User> users = userDbUtil.getUsers();
		
		request.setAttribute("USERS_LIST", users);
		
		request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
		
		
	}
	
	private ArrayList<String> getUserIDs(String temp_per) throws SQLException{
		
		ArrayList<String> arrayList = new ArrayList<String>();
		
		Connection MyConn = null;
		Statement Mystmt = null;
		ResultSet MyRS = null;
		
		if(temp_per.equals("perm")){
			try {
				MyConn = dataSource.getConnection();
				
				String sql = "select user_id from user_info";
						
				Mystmt = MyConn.createStatement();
				
				
				// execute query
				MyRS = Mystmt.executeQuery(sql);
				
				
				
				while (MyRS.next()) {
					arrayList.add(MyRS.getString("user_id"));
				}
				
				return arrayList;
			
			} finally {
				
				close(MyConn,Mystmt,null, null, MyRS, null);
			}
		}
		if(temp_per.equals("temp")){
			try {
				MyConn = dataSource.getConnection();
				
				String sql = "select user_id from temp_user_info";
						
				Mystmt = MyConn.createStatement();
				
				
				// execute query
				MyRS = Mystmt.executeQuery(sql);
				
				
				
				while (MyRS.next()) {
					arrayList.add(MyRS.getString("user_id"));
				}
				
				return arrayList;
			
			} finally {
				
				close(MyConn,Mystmt,null, null, MyRS, null);
			}
		}
		else
			return null;
			
		
		
	}

	
	
	private static void close(Connection MyConn, Statement Mystmt, Statement mystmt1, Statement mystmt2, ResultSet MyRS, ResultSet myRS2) {
		
		try {
			if(MyRS != null)
				MyRS.close();
			if(MyConn != null)
				MyConn.close();
			if(Mystmt != null)
				Mystmt.close();
			
		}catch (Exception exc){
			exc.printStackTrace();
		}
		
	}
}
