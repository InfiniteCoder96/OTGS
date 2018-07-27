package com.scalar.web.servicePack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.Format;
import java.text.SimpleDateFormat;


import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.scalar.web.ControlServletsPack.UserControllerServlet;

/**
 * Servlet implementation class UserValidate
 */
@WebServlet("/UserValidate")
public class UserValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	
	@Resource(name="jdbc/OOP") 
	private DataSource dataSource;

	
		
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		Connection MyConn = null;
		
		Statement Mystmt1 = null;
		Statement Mystmt2 = null;
		
		
		ResultSet MyRS1 = null;
		ResultSet MyRS2 = null;
		
		
		String username = request.getParameter("user");
		String password = request.getParameter("pass");
			
			
				try {
						
					// get a connection
					MyConn = dataSource.getConnection();
					
					// create sql statement
					String sql1 = "select username,password from user_login_info where username='"+username+"' and password='"+password+"' ";
					String sql2	= "select firstName from user_info where username='"+username+"' ";		
								
					Mystmt1 = MyConn.createStatement();
					Mystmt2 = MyConn.createStatement();
					// execute query
					MyRS1 = Mystmt1.executeQuery(sql1);
					MyRS2 = Mystmt2.executeQuery(sql2);
					
					if(MyRS1.next()) {
							PreparedStatement Mystmt = null;
				    		Connection MyConn_ex = null;
				    		
							if(username.equals("admin")) {
								HttpSession session = request.getSession();
								session.setAttribute("user",MyRS1.getString("username"));
								session.setMaxInactiveInterval(50000);
								
						        
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
						        	close(MyConn_ex,Mystmt, null, null, null);
						        }
						       
								request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
								
							}
							if(MyRS2.next()) {
								
								String fname = MyRS2.getString("firstName");
								HttpSession session = request.getSession();
								session.setMaxInactiveInterval(60000);
								session.setAttribute("user", fname);
								
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
						        	close(MyConn_ex,Mystmt, null, null, null);
						        }
						        
								request.getRequestDispatcher("WelcomeUser.jsp").forward(request, response);
					                
							}	
						
					}
					
					else {
						
							HttpSession session = request.getSession();
							session.setAttribute("errorMessage", "Invalid username or password");
							session.setAttribute("errorMessage2", "If you are the Admin..Yeah you're fired..!");
			                request.getRequestDispatcher("InvalidLogin.jsp").forward(request, response);
			                //response.sendRedirect("http://localhost:8080/Scalar_Online_Tour_Guide/Login.jsp?username=false");
					}
					 
					
				
				} catch (Exception exc) {
					// TODO Auto-generated catch block
					exc.printStackTrace();
				}
				finally{
					//close JDBC objects
					close(MyConn,Mystmt1,Mystmt2,MyRS1,MyRS2);
				}
			
			
						
		
		
		
	}

	private void close(Connection MyConn, Statement Mystmt1, Statement Mystmt2, ResultSet MyRS1,ResultSet MyRS2) {
		
		try {
			if(MyRS1 != null)
				MyRS1.close();
			if(MyRS2 != null)
				MyRS2.close();
			if(MyConn != null)
				MyConn.close();
			if(Mystmt1 != null)
				Mystmt1.close();
			
			if(Mystmt2 != null)
				Mystmt1.close();
			
			
		}catch (Exception exc){
			exc.printStackTrace();
		}
		
	}
}

