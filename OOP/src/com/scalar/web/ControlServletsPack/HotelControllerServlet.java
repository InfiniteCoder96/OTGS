package com.scalar.web.ControlServletsPack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.scalar.web.servicePack.EmailComposer;
import com.scalar.web.userModelPack.Hotel;
import com.scalar.web.userModelPack.Places;
import com.scalar.web.userModelPack.PropertiesList;
import com.scalar.web.userModelPack.TourGuide;
import com.scalar.web.userModelPack.User;
import com.scalar.web.utilityPack.HotelDbUtil;
import com.scalar.web.utilityPack.PlacesDbUtil;
import com.scalar.web.utilityPack.TourGuideDbUtil;
import com.scalar.web.utilityPack.UserDbUtil;



/**
 * Servlet implementation class ReservationHandler
 */
@WebServlet("/ReservationHandler")
public class HotelControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserDbUtil userDbUtil;
	private TourGuideDbUtil tourDbUtil;
	private HotelDbUtil hotelDbUtil;
	private PlacesDbUtil placeDbUtil;
	
	@Resource(name="jdbc/OOP") 
	private static DataSource dataSource;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelControllerServlet() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Statement stmt = null;
		PropertiesList propertyList = new PropertiesList();
		ArrayList<Hotel> generalPropertyList = new ArrayList<Hotel>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(  
					"jdbc:mysql://localhost:3306/oop","root","toor"); 
			stmt=con.createStatement(); 
			
		} catch (Exception e) {
			
			response.getWriter().append(e.toString());
			e.printStackTrace();
		}
		
		if (request.getParameter("submit") != null) {
			if (request.getParameter("submit").equalsIgnoreCase("insert")) {
				System.out.println("INSERT IN");
				String name = request.getParameter("name");
				String city = request.getParameter("city");
				String address = request.getParameter("address");
				String web = request.getParameter("web");
				String phone = request.getParameter("phone");
				String image = request.getParameter("image");
				String hotelType = request.getParameter("hotelType");
				
				
				String sql1 = "INSERT INTO `hotel` (`hotelName`, `hotelCity`, `hotelAddress`, `hotelPhone`, `hotelWeb`, `hotelType`,`hotelUrl`) VALUES('"+name+"', '"+city+"', '"+address+"', '"+phone+"', '"+web+"', '"+hotelType+"','"+image+"');";
				 try {
					stmt.executeUpdate(sql1);
					request.setAttribute("SalertMsg", "Hotel Inserted Successfully");
				} catch (SQLException e) {
					request.setAttribute("WalertMsg", "Something Went Wrong...Please Try Again Later");
					e.printStackTrace();
				}
				
				 request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
			}
		}
		
		else if(request.getParameter("delete") != null) {
			String idToDelete = request.getParameter("delete");
			
			String sql2 = "DELETE FROM `hotel` WHERE `idhotel`='"+idToDelete+"';";
			// Set response content type
		     response.setContentType("text/html");
		      // Actual logic goes here.
		     PrintWriter out = response.getWriter();
		     
					try {
						stmt.executeUpdate(sql2);
						request.setAttribute("SalertMsg", "Hotel Deleted Successfully");
					} catch (SQLException e) {
						request.setAttribute("WalertMsg", "Something Went Wrong...Please Try Again Later");
						e.printStackTrace();
					}
					request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
			
		}
		
		else if(request.getParameter("update") != null) {
			String idToUpdate = request.getParameter("update");
			int id = Integer.parseInt(idToUpdate);
			String name = request.getParameter("name");
			String city = request.getParameter("city");
			String address = request.getParameter("address");
			String web = request.getParameter("web");
			String phone = request.getParameter("phone");
			String image = request.getParameter("image");
			String hotelType = request.getParameter("hotelType");
			
			String sql1 = "update hotel set hotelName='"+name+"', hotelCity='"+city+"', hotelAddress='"+address+"', hotelPhone='"+phone+"', hotelWeb='"+web+"', hotelType='"+hotelType+"',hotelUrl ='"+image+"' where idhotel='"+id+"' ";
			 try {
				stmt.executeUpdate(sql1);
				request.setAttribute("SalertMsg", "Hotel Updated Successfully");
				
			} catch (SQLException e) {
				request.setAttribute("WalertMsg", "Something Went Wrong...Please Try Again Later");
				e.printStackTrace();
			}
			 
			tourDbUtil = new TourGuideDbUtil(dataSource);
			userDbUtil = new UserDbUtil(dataSource);
			hotelDbUtil = new HotelDbUtil(dataSource);
			placeDbUtil = new PlacesDbUtil(dataSource);
			
				try {
					 List<User> users = userDbUtil.getUsers();
					List<TourGuide> tourguides = TourGuideDbUtil.getTourGuides("Admin_Dashboard.jsp", 0, 0);
					List<Hotel> hotels = hotelDbUtil.getHotels();
					List<Places> places = PlacesDbUtil.searchPlaces(null, null);
					
					request.setAttribute("USERS_LIST", users);
					request.setAttribute("TOUR_GUIDE_LIST", tourguides);
					request.setAttribute("HOTEL_LIST", hotels);
					request.setAttribute("PLACES_LIST", places);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        
			 request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
			
		}
		else if(request.getParameter("load") != null) {
			String idToUpdate = request.getParameter("load");
			
		      // Actual logic goes here.
		     PrintWriter out = response.getWriter();
					try {
						ResultSet hotelResultSet = stmt.executeQuery("select * from hotel where `idhotel`='"+idToUpdate+"'");
						if(hotelResultSet.next()) {
							Hotel hotel = new Hotel(hotelResultSet.getInt(1), hotelResultSet.getString(8), hotelResultSet.getString(2), hotelResultSet.getString(3), hotelResultSet.getString(4), hotelResultSet.getString(5), hotelResultSet.getString(6),hotelResultSet.getString(7));
							request.setAttribute("propertyList", hotel);
							}
						
						
						request.getRequestDispatcher("updateHotel.jsp").forward(request, response);
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						out.println("<h1>" + "ERROR" + "</h1>");
						e.printStackTrace();
					}
					
			
		}
	
		else if ((request.getParameter("type")) != null) {
			String type = (request.getParameter("type"));
			
			if (type.equalsIgnoreCase("hotel")) {
				try {
					ResultSet hotelResultSet = stmt.executeQuery("select * from hotel where hotelType = 'star'");
					while(hotelResultSet.next()) {
						Hotel hotel = new Hotel(hotelResultSet.getInt(1), hotelResultSet.getString(8), hotelResultSet.getString(2), hotelResultSet.getString(3), hotelResultSet.getString(4), hotelResultSet.getString(5), hotelResultSet.getString(6),hotelResultSet.getString(7));
						generalPropertyList.add(hotel);
						}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}			
				int noOfHotels = generalPropertyList.size();
				request.setAttribute("noOfItems", noOfHotels);
				request.setAttribute("title", "Hotels");
				request.setAttribute("propertyList", generalPropertyList);
			} 
			
			else if (type.equalsIgnoreCase("bunglows")) {
				try {
					ResultSet bunglowResultSet = stmt.executeQuery("select * from hotel where hotelType = 'bunglow'");
						while(bunglowResultSet.next()) {
							Hotel bunglow = new Hotel(bunglowResultSet.getInt(1),bunglowResultSet.getString(8), bunglowResultSet.getString(2), bunglowResultSet.getString(3), bunglowResultSet.getString(4), bunglowResultSet.getString(5), bunglowResultSet.getString(6),bunglowResultSet.getString(7));
							generalPropertyList.add(bunglow);
							}
				} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();	
				}			
				int noOfBunglows = propertyList.getPropertyCount();
				request.setAttribute("noOfItems", noOfBunglows);
				request.setAttribute("title", "Bunglows");
				request.setAttribute("propertyList", generalPropertyList);
			}
			else if (type.equalsIgnoreCase("guestHouses")) {
				try {
					ResultSet guestResultSet = stmt.executeQuery("select * from hotel where hotelType = 'guest'");
						while(guestResultSet.next()) {
							Hotel guest = new Hotel(guestResultSet.getInt(1),guestResultSet.getString(8), guestResultSet.getString(2), guestResultSet.getString(3), guestResultSet.getString(4), guestResultSet.getString(5), guestResultSet.getString(6),guestResultSet.getString(7));
							generalPropertyList.add(guest);
							}
				} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
				}			
				int noOfGuestHouses = propertyList.getPropertyCount();
				request.setAttribute("noOfItems", noOfGuestHouses);
				request.setAttribute("title", "GuestHouse");
				request.setAttribute("propertyList", generalPropertyList);
			}
			
			else if (type.equalsIgnoreCase("HeritageHomes")) {
				try {
					ResultSet heritageResultSet = stmt.executeQuery("select * from hotel where hotelType = 'heritage'");
						while(heritageResultSet.next()) {
							Hotel heritage = new Hotel(heritageResultSet.getInt(1),heritageResultSet.getString(8), heritageResultSet.getString(2), heritageResultSet.getString(3), heritageResultSet.getString(4), heritageResultSet.getString(5), heritageResultSet.getString(6),heritageResultSet.getString(7));
							generalPropertyList.add(heritage);
							}
				} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
				}			
				int noOfHeritage = propertyList.getPropertyCount();
				request.setAttribute("noOfItems", noOfHeritage);
				request.setAttribute("title", "Heritage Homes");
				request.setAttribute("propertyList", generalPropertyList);
			}
			
			else if (type.equalsIgnoreCase("OtherHotels")) {
				try {
					ResultSet otherResultSet = stmt.executeQuery("select * from hotel where hotelType = 'other'");
						while(otherResultSet.next()) {
							Hotel other = new Hotel(otherResultSet.getInt(1),otherResultSet.getString(8), otherResultSet.getString(2), otherResultSet.getString(3), otherResultSet.getString(4), otherResultSet.getString(5), otherResultSet.getString(6),otherResultSet.getString(7));
							generalPropertyList.add(other);
							}
				} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
				}			
				int noOfOtherHotels = propertyList.getPropertyCount();
				request.setAttribute("noOfItems", noOfOtherHotels);
				request.setAttribute("title", "Other Hotels");
				request.setAttribute("propertyList", generalPropertyList);
			}
			
			else if (type.equalsIgnoreCase("RentedApartments")) {
				try {
					ResultSet apartmentResultSet = stmt.executeQuery("select * from hotel where hotelType = 'apartment'");
						while(apartmentResultSet.next()) {
							Hotel apartment = new Hotel(apartmentResultSet.getInt(1),apartmentResultSet.getString(8), apartmentResultSet.getString(2), apartmentResultSet.getString(3), apartmentResultSet.getString(4), apartmentResultSet.getString(5), apartmentResultSet.getString(6),apartmentResultSet.getString(7));
							generalPropertyList.add(apartment);
							}
				} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
				}			
				int noOfApartments = propertyList.getPropertyCount();
				request.setAttribute("noOfItems", noOfApartments);
				request.setAttribute("title", "Apartments");
				request.setAttribute("propertyList", generalPropertyList);
			}
			
			else if (type.equalsIgnoreCase("BontiqueHotels")) {
				try {
					ResultSet bontiqueResultSet = stmt.executeQuery("select * from hotel where hotelType = 'bontique'");
						while(bontiqueResultSet.next()) {
							Hotel bontique = new Hotel(bontiqueResultSet.getInt(1),bontiqueResultSet.getString(8), bontiqueResultSet.getString(2), bontiqueResultSet.getString(3), bontiqueResultSet.getString(4), bontiqueResultSet.getString(5), bontiqueResultSet.getString(6),bontiqueResultSet.getString(7));
							generalPropertyList.add(bontique);
							}
				} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
				}			
				int noOfBontiqueHotels = propertyList.getPropertyCount();
				request.setAttribute("noOfItems", noOfBontiqueHotels);
				request.setAttribute("title", "Bontique Hotels");
				request.setAttribute("propertyList", generalPropertyList);
			}
			
			else if (type.equalsIgnoreCase("homeStays")) {
				try {
					ResultSet homeStayResultSet = stmt.executeQuery("select * from hotel  where hotelType = 'home' ");
						while(homeStayResultSet.next()) {
							Hotel home = new Hotel(homeStayResultSet.getInt(1),homeStayResultSet.getString(8), homeStayResultSet.getString(2), homeStayResultSet.getString(3), homeStayResultSet.getString(4), homeStayResultSet.getString(5), homeStayResultSet.getString(6),homeStayResultSet.getString(7));
							generalPropertyList.add(home);
							}
				} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
				}			
				int noOfHomeStays = propertyList.getPropertyCount();
				request.setAttribute("noOfItems", noOfHomeStays);
				request.setAttribute("title", "Home Stays");
				request.setAttribute("propertyList", generalPropertyList);
			}
			
			else if (type.equalsIgnoreCase("tourismResorts")) {
				try {
					ResultSet tourismResultSet = stmt.executeQuery("select * from hotel where hotelType = 'tourism'");
						while(tourismResultSet.next()) {
							Hotel tourism = new Hotel(tourismResultSet.getInt(1),tourismResultSet.getString(8), tourismResultSet.getString(2), tourismResultSet.getString(3), tourismResultSet.getString(4), tourismResultSet.getString(5), tourismResultSet.getString(6),tourismResultSet.getString(7));
							generalPropertyList.add(tourism);
							}
				} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
				}			
				int noOfTourismResorts = propertyList.getPropertyCount();
				request.setAttribute("noOfItems", noOfTourismResorts);
				request.setAttribute("title", "Tourism Resorts");
				request.setAttribute("propertyList", generalPropertyList);
			
			
				
		} else {
			response.getWriter().append("No type parameter");
			}
			request.getRequestDispatcher("Properties.jsp").forward(request, response);
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
