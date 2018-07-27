package com.scalar.web.ControlServletsPack;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.scalar.web.userModelPack.Hotel;
import com.scalar.web.userModelPack.Places;
import com.scalar.web.userModelPack.TourGuide;
import com.scalar.web.userModelPack.User;
import com.scalar.web.utilityPack.HotelDbUtil;
import com.scalar.web.utilityPack.PlacesDbUtil;
import com.scalar.web.utilityPack.TourGuideDbUtil;
import com.scalar.web.utilityPack.UserDbUtil;

/**
 * Servlet implementation class TourGuideControllerServlet
 */
@WebServlet("/TourGuideControllerServlet")
public class TourGuideControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private UserDbUtil userDbUtil;
	private TourGuideDbUtil tourguideDbUtil;
	private HotelDbUtil hotelDbUtil;
	private PlacesDbUtil placeDbUtil;
	
	
	@Resource(name="jdbc/OOP") 
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		
		super.init();
		
		try {
			
			tourguideDbUtil = new TourGuideDbUtil(dataSource);
			
		}catch(Exception exc) {
			throw new ServletException(exc);
		}
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourGuideControllerServlet() {
        super();
       
    }

    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String command = request.getParameter("command");
		
		
		System.out.println(command);
		try {
			
				
	            
	            // If the command is missing, then default to listing users
				if(command == null ) {
					command = "LIST";
				}
				
				switch(command) {
					case "LIST":listTourGuides(request,response);
								break;
					case "LIST_EXP":listExpTourGuides(request,response);
								break;
					case "SEARCH":SearchGuides(request,response);
								break;
					case "LOAD":loadGuide(request,response);
								break;
					case "DELETE":deleteGuide(request,response);
								break;
					default:listTourGuides(request,response);
					
				}
			
			
		} catch (Exception exc) {
			
			exc.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String command = request.getParameter("command");
		
		
		System.out.println(command);
		try {
			
				
	            
	            // If the command is missing, then default to listing users
				if(command == null ) {
					command = "LIST";
				}
				
				switch(command) {
					
					case "UPDATE":updateGuide(request,response);
								break;
					default:listTourGuides(request,response);
					
				}
			
			
		} catch (Exception exc) {
			
			exc.printStackTrace();
		}
	}
	
	
	private void updateGuide(HttpServletRequest request, HttpServletResponse response) {
		try {
			// read user id from form data
			String guide_id = request.getParameter("guide_id");
			String name = request.getParameter("Name");
			String email = request.getParameter("email");
			String expdate = request.getParameter("expdate");
			String address = request.getParameter("address");
			String category = request.getParameter("category");
			String telephone = request.getParameter("telephone");
			String language_1 = request.getParameter("language_1");
			String language_2 = request.getParameter("language_2");
			String language_3 = request.getParameter("language_3");
			String language_4 = request.getParameter("language_4");
			String language_5 = request.getParameter("language_5");
			
			java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(expdate);
			java.sql.Date expDate = new java.sql.Date(date.getTime());
			
			TourGuide theGuide = new TourGuide(guide_id,name,null,email,null,null,category,telephone,address, expDate,language_1,language_2,language_3,language_4,language_5);
			
			// delete user from database
			TourGuideDbUtil.updateGuide(theGuide);
			
			
			request.setAttribute("SalertMsg", "Tour Guide Details Updated successfully");
	
			tourguideDbUtil = new TourGuideDbUtil(dataSource);
			userDbUtil = new UserDbUtil(dataSource);
			hotelDbUtil = new HotelDbUtil(dataSource);
			placeDbUtil = new PlacesDbUtil(dataSource);
	        
			List<User> users = userDbUtil.getUsers();
			List<TourGuide> tourguides = TourGuideDbUtil.getTourGuides("Admin_Dashboard.jsp", 0, 0);
			List<Hotel> hotels = hotelDbUtil.getHotels();
			List<Places> places = PlacesDbUtil.searchPlaces(null, null);
			
			request.setAttribute("USERS_LIST", users);
			request.setAttribute("TOUR_GUIDE_LIST", tourguides);
			request.setAttribute("HOTEL_LIST", hotels);
			request.setAttribute("PLACES_LIST", places);
	        
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

	private void deleteGuide(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			// read user id from form data
			String guide_id = request.getParameter("guide_id");
			
			TourGuideDbUtil.deleteGuide(guide_id);
			// delete user from database
			tourguideDbUtil = new TourGuideDbUtil(dataSource);
			userDbUtil = new UserDbUtil(dataSource);
			hotelDbUtil = new HotelDbUtil(dataSource);
			placeDbUtil = new PlacesDbUtil(dataSource);
	        
			List<User> users = userDbUtil.getUsers();
			List<TourGuide> tourguides = TourGuideDbUtil.getTourGuides("Admin_Dashboard.jsp", 0, 0);
			List<Hotel> hotels = hotelDbUtil.getHotels();
			List<Places> places = PlacesDbUtil.searchPlaces(null, null);
			
			request.setAttribute("USERS_LIST", users);
			request.setAttribute("TOUR_GUIDE_LIST", tourguides);
			request.setAttribute("HOTEL_LIST", hotels);
			request.setAttribute("PLACES_LIST", places);
	        
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

	private void loadGuide(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//read user id from form data
		String guide_id = request.getParameter("guide_id");
		
		//get user from database (db util)
		TourGuide theGuide = TourGuideDbUtil.getGuides(guide_id);
		
		//place user in the request attribute
		request.setAttribute("THE_GUIDE", theGuide);
		
		//send to jsp page
		RequestDispatcher dispatcher = request.getRequestDispatcher("/updateGuideDetails.jsp");
		dispatcher.forward(request,response);
	}

	private void listTourGuides(HttpServletRequest request, HttpServletResponse response) {

		try {
			int page = 1;
			int recordsPerPage = 5;
            
            if(request.getParameter("records_per_page") != null)
            	recordsPerPage = Integer.parseInt(request.getParameter("records_per_page"));
            if(request.getParameter("page") != null)
                page = Integer.parseInt(request.getParameter("page"));
            
            String destination = request.getParameter("destination");
            
            List<TourGuide> guides = TourGuideDbUtil.searchTourGuides(null, null);
			int noOfRecords = guides.size();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            
			List<TourGuide> tourguides = TourGuideDbUtil.getTourGuides(destination, (page-1)*recordsPerPage, recordsPerPage);
			
			request.setAttribute("TOUR_GUIDE_LIST", tourguides);
			request.setAttribute("noOfPages", noOfPages);
			request.setAttribute("currentPage",page);
			
			System.out.println(page);
			
			request.getRequestDispatcher(destination).forward(request, response);
			
		} catch (ServletException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void listExpTourGuides(HttpServletRequest request, HttpServletResponse response) {
		
		String destination = request.getParameter("destination");
        
        List<TourGuide> tourguides;
        
        try {
        	
        	tourguides = TourGuideDbUtil.searchExpTourGuides();
			
	        if(tourguides != null) {
				
				int size = tourguides.size();
				request.setAttribute("TOUR_GUIDE_LIST", tourguides);
				request.setAttribute("COMMAND", "SEARCH");
				request.setAttribute("NO_OF_RESULTS", size);
			}
			else {
				request.setAttribute("errorMessage", "Results Not found");
			}
	
		
			request.getRequestDispatcher(destination).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void SearchGuides(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException  {
		
		
		String keyword = request.getParameter("key");
		String category = request.getParameter("category");
		String destination = request.getParameter("destination");
		
		List<TourGuide> tourguides;
		
		tourguides = TourGuideDbUtil.searchTourGuides(keyword,category);
		
			 
		
			if(tourguides != null) {
				
				int size = tourguides.size();
				request.setAttribute("TOUR_GUIDE_LIST", tourguides);
				request.setAttribute("COMMAND", "SEARCH");
				request.setAttribute("NO_OF_RESULTS", size);
			}
			else {
				request.setAttribute("errorMessage", "Results Not found");
			}
		
			request.getRequestDispatcher(destination).forward(request, response);
	}
}
