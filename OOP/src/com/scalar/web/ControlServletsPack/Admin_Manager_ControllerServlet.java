package com.scalar.web.ControlServletsPack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.scalar.web.servicePack.EmailComposer;
import com.scalar.web.servicePack.Mailer;
import com.scalar.web.userModelPack.Hotel;
import com.scalar.web.userModelPack.Places;
import com.scalar.web.userModelPack.TourGuide;
import com.scalar.web.userModelPack.User;
import com.scalar.web.utilityPack.HotelDbUtil;
import com.scalar.web.utilityPack.PlacesDbUtil;
import com.scalar.web.utilityPack.TourGuideDbUtil;
import com.scalar.web.utilityPack.UserDbUtil;

/**
 * Servlet implementation class Admin_Manager_ControllerServlet
 */
@WebServlet("/Admin_Manager_ControllerServlet")
@WebListener
public class Admin_Manager_ControllerServlet extends HttpServlet implements ServletContextListener{
	private static final long serialVersionUID = 1L;
       
	private UserDbUtil userDbUtil;
	private TourGuideDbUtil tourDbUtil;
	private HotelDbUtil hotelDbUtil;
	private PlacesDbUtil placeDbUtil;
	private EmailComposer emailComposer;
	private SomeDailyJob job;
	
	@Resource(name="jdbc/OOP") 
	private static DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		
		super.init();
		
		try {
			tourDbUtil = new TourGuideDbUtil(dataSource);
			userDbUtil = new UserDbUtil(dataSource);
			emailComposer = new EmailComposer(dataSource);
			hotelDbUtil = new HotelDbUtil(dataSource);
			placeDbUtil = new PlacesDbUtil(dataSource);
			job = new SomeDailyJob(dataSource);
		
		}catch(Exception exc) {
			throw new ServletException(exc);
		}
	}

	private ScheduledExecutorService scheduler;

    @Override
    public void contextInitialized(ServletContextEvent event) {
        scheduler = Executors.newSingleThreadScheduledExecutor();
        scheduler.scheduleAtFixedRate(new SomeDailyJob(null), 0, 1, TimeUnit.DAYS);
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        scheduler.shutdownNow();
    }
    
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// read the command
		String command = request.getParameter("command");
				
		try {
			
			// If the command is missing, then default to listing users
			if(command == null) {
				command = "LOAD";
			}
			
			switch(command) {
						
				case "VALIDATE":validate_admin(request,response);
							break;
				case "LOAD":load_data(request,response);
							break;
				
							
				default:load_data(request,response);
				
			}
			
		} catch (Exception exc) {
			
			throw new ServletException(exc);
		}
		
        
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// read the command
		String command = request.getParameter("command");
						
		try {
					
			// If the command is missing, then default to listing users
			if(command == null) {
						command = "LOAD";
			}
					
			switch(command) {
								
				case "LOAD":load_data(request,response);
								break;
				case "ADMIN_EMAIL":sendEmail(request,response);
								break;
						
						
				default:load_data(request,response);
						
			}
					
		} catch (Exception exc) {
					
			throw new ServletException(exc);
		}
	}
	
	private void sendEmail(HttpServletRequest request, HttpServletResponse response) {
		
		String FROM = request.getParameter("from");
		String TO = request.getParameter("to");
		String SUBJECT = request.getParameter("subject");
		String MSG = request.getParameter("message");
		System.out.println(FROM);
		List<String> message = EmailComposer.compose_email("ADMIN_EMAIL", FROM);
		System.out.println(FROM);
		try {
			String msg = Mailer.send(message.get(0), message.get(1), TO, SUBJECT, MSG);
			
			if(msg == null) {
				request.setAttribute("SalertMsg", "Email has been sent successfully");
			}
			else {
				request.setAttribute("WalertMsg", "Invalid Email/Please Check your internet connection");
			}
			
			request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
			
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void validate_admin(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(360);
			
	        Date date = new Date(session.getLastAccessedTime());
	        
	        
	        PreparedStatement Mystmt = null;
    		Connection MyConn_ex = null;
    		
	        try {
	        	
	        	MyConn_ex = dataSource.getConnection();
				
				String sql = "update user_login_info set last_seen=? where username=?";
						
				Mystmt = MyConn_ex.prepareStatement(sql);
				
				// set parameters
				Mystmt.setDate(1, date);
				Mystmt.setString(2, "admin");
				
				// execute SQL statement
				Mystmt.execute();
				
			
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	        finally {
	        	close(MyConn_ex,Mystmt, null, null, null, null);
	        }
			
	       
	        session.setAttribute("user","Admin");
	        /*session.setAttribute("TOUR_GUIDE_LIST", tourguides);
			session.setAttribute("USERS_LIST", users);*/
			
			request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
			
		    
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}

	
	
	
	private void load_data(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			List<User> users =null;
			List<TourGuide> tourguides = null;
			List<Hotel> hotels = null;
			List<Places> places = null;
			
			users = userDbUtil.getUsers();
			tourguides = TourGuideDbUtil.getTourGuides("Admin_Dashboard.jsp", 0, 0);
			hotels = hotelDbUtil.getHotels();
			places = PlacesDbUtil.searchPlaces(null, null);
			
			request.setAttribute("USERS_LIST", users);
			request.setAttribute("TOUR_GUIDE_LIST", tourguides);
			request.setAttribute("HOTEL_LIST", hotels);
			request.setAttribute("PLACES_LIST", places);
			
			request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
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
