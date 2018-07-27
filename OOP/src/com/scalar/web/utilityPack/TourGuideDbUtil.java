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

import com.scalar.web.userModelPack.TourGuide;
import com.scalar.web.userModelPack.User;

public class TourGuideDbUtil {
	
	private static DataSource dataSource;
	
	
	public TourGuideDbUtil(DataSource dataSource) {
		
			this.dataSource = dataSource;
		
	}
	
	public static List<TourGuide> getTourGuides(String destination, int start,int total){
		
		List<TourGuide> tourguides = new ArrayList<>();
		
		Connection MyConn = null;
		PreparedStatement Mystmt = null;
		ResultSet MyRS = null;
		
		long millis=System.currentTimeMillis();  
		Date date=new Date(millis);
		
		if(destination.equals("Admin_Dashboard.jsp")) {
			try{
				// get a connection
				MyConn = dataSource.getConnection();
				
				// create sql statement
				String sql = "select * from tour_guide_info";
				
				Mystmt = MyConn.prepareStatement(sql);
				
				// execute query
				MyRS = Mystmt.executeQuery();
				
				// process result set
				while(MyRS.next()) {
					
					// retrieve data from result set row
					String regNo = MyRS.getString("regNo");
					String fullname = MyRS.getString("fullname");
					String category = MyRS.getString("category");
					String telephone = MyRS.getString("telephone");
					String address = MyRS.getString("address");
					String email = MyRS.getString("email");
					Date expdate = MyRS.getDate("expdate");
					String language_1 = MyRS.getString("language_1");
					String language_2 = MyRS.getString("language_2");
					String language_3 = MyRS.getString("language_3");
					String language_4 = MyRS.getString("language_4");
					String language_5 = MyRS.getString("language_5");
					
					// create new tour guide object
					TourGuide newguide = new TourGuide(regNo, fullname,null, email, null, null,	category, telephone, address, expdate,language_1, language_2,language_3, language_4, language_5);
					
					// add it to list of tour guides
					tourguides.add(newguide);
				}
				
				
				
				System.out.println(tourguides);
				return tourguides;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
			finally {
				// close JDBC objects
				close(MyConn,Mystmt,MyRS);
			}
		}
		if(destination.equals("TourGuideDetails.jsp")) {
			try{
				 
				// get a connection
				MyConn = dataSource.getConnection();
				
				// create sql statement
				String sql = "select * from tour_guide_info where expdate > ? limit ?,?";
				
				Mystmt = MyConn.prepareStatement(sql);
				
				Mystmt.setDate(1, date);
				Mystmt.setInt(2, start);
				Mystmt.setInt(3, total);
				
				// execute query
				MyRS = Mystmt.executeQuery();
				
				// process result set
				while(MyRS.next()) {
					
					// retrieve data from result set row
					String regNo = MyRS.getString("regNo");
					String fullname = MyRS.getString("fullname");
					String category = MyRS.getString("category");
					String telephone = MyRS.getString("telephone");
					String address = MyRS.getString("address");
					String email = MyRS.getString("email");
					Date expdate = MyRS.getDate("expdate");
					String language_1 = MyRS.getString("language_1");
					String language_2 = MyRS.getString("language_2");
					String language_3 = MyRS.getString("language_3");
					String language_4 = MyRS.getString("language_4");
					String language_5 = MyRS.getString("language_5");
					
					// create new tour guide object
					TourGuide newguide = new TourGuide(regNo, fullname,null, email, null, null,	category, telephone, address, expdate,language_1, language_2,language_3, language_4, language_5);
					
					// add it to list of tour guides
					tourguides.add(newguide);
				}
				
				return tourguides;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
			finally {
				// close JDBC objects
				close(MyConn,Mystmt,MyRS);
			}
		}
		else {
			return null;
		}
	}

	

	public static List<TourGuide> searchTourGuides(String keyword, String category) throws SQLException{
		
		List<TourGuide> tourguides = new ArrayList<>();
		int count = 0;
		Connection MyConn = null;
		PreparedStatement Mystmt = null;
		ResultSet MyRS = null;
		
		long millis=System.currentTimeMillis();  
		Date date=new Date(millis);
		
		try {
			
				
				// get a connection
				MyConn = dataSource.getConnection();
				
				String sql = null;
				
				// create sql statement
				if(category == null) {
					sql = "select * from tour_guide_info where expdate > ?";
				}
				else if(category.equals("Tour Guide ID")) {
					sql = "select * from tour_guide_info where regNo=? AND expdate > ?";
					
				}
				else if(category.equals("Name")) {
					sql = "select * from tour_guide_info where fullname=? AND expdate > ?";
					
				}
				else if(category.equals("Category")) {
					sql = "select * from tour_guide_info where category=? AND expdate > ?";
					
				}
				else if(category.equals("Languages")) {
					sql = "select * from tour_guide_info where language_1=? or language_2=? or language_3=? or language_4=? or language_5=? AND expdate > ?";
					
				}
				
				
				if(category == null) {
					Mystmt = MyConn.prepareStatement(sql);
					Mystmt.setDate(1, date);
				}
				else if(category.equals("Languages")) {
					Mystmt = MyConn.prepareStatement(sql);
					
					Mystmt.setString(1, keyword);
					Mystmt.setString(2, keyword);
					Mystmt.setString(3, keyword);
					Mystmt.setString(4, keyword);
					Mystmt.setString(5, keyword);
					Mystmt.setDate(6, date);
				} 
				else {
					Mystmt = MyConn.prepareStatement(sql);
					
					Mystmt.setString(1, keyword);
					Mystmt.setDate(2, date);
				}
				
				// execute query
				MyRS = Mystmt.executeQuery();
				
				
				// process result set
				while(MyRS.next()) {
					
					// retrieve data from result set row
					String regNo = MyRS.getString("regNo");
					String fullname = MyRS.getString("fullname");
					String category_rs = MyRS.getString("category");
					String telephone = MyRS.getString("telephone");
					String address = MyRS.getString("address");
					String email = MyRS.getString("email");
					Date expdate = MyRS.getDate("expdate");
					String language_1 = MyRS.getString("language_1");
					String language_2 = MyRS.getString("language_2");
					String language_3 = MyRS.getString("language_3");
					String language_4 = MyRS.getString("language_4");
					String language_5 = MyRS.getString("language_5");
					
					// create new tour guide object
					TourGuide newguide = new TourGuide(regNo, fullname,null, email, null, null,	category_rs, telephone, address, expdate,language_1, language_2,language_3, language_4, language_5);
					
					// add it to list of tour guides
					tourguides.add(newguide);
					
					count++;
				}
				
				if(count == 0)
					return null;
				else
					return tourguides;
				
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
			finally {
				// close JDBC objects
				close(MyConn,Mystmt,MyRS);
			}
		
		
		
	}

	public static List<TourGuide> searchExpTourGuides() {
		
		List<TourGuide> tourguides = new ArrayList<>();
		int count = 0;
		Connection MyConn = null;
		PreparedStatement Mystmt = null;
		ResultSet MyRS = null;
		
		long millis=System.currentTimeMillis();  
		Date date=new java.sql.Date(millis);
		
		try {
			
			
			// get a connection
			MyConn = dataSource.getConnection();
			
			String sql = "select * from tour_guide_info where expdate < ?";
			
			Mystmt = MyConn.prepareStatement(sql);
			
			Mystmt.setDate(1, date);
			
		
			// execute query
			MyRS = Mystmt.executeQuery();
			
			
			// process result set
			while(MyRS.next()) {
				
				// retrieve data from result set row
				String regNo = MyRS.getString("regNo");
				String fullname = MyRS.getString("fullname");
				String category_rs = MyRS.getString("category");
				String telephone = MyRS.getString("telephone");
				String address = MyRS.getString("address");
				String email = MyRS.getString("email");
				Date expdate = MyRS.getDate("expdate");
				String language_1 = MyRS.getString("language_1");
				String language_2 = MyRS.getString("language_2");
				String language_3 = MyRS.getString("language_3");
				String language_4 = MyRS.getString("language_4");
				String language_5 = MyRS.getString("language_5");
				
				// create new tour guide object
				TourGuide newguide = new TourGuide(regNo, fullname,null, email, null, null,	category_rs, telephone, address, expdate,language_1, language_2,language_3, language_4, language_5);
				
				// add it to list of tour guides
				tourguides.add(newguide);
				
				count++;
			}
			
			if(count == 0)
				return null;
			else
				return tourguides;
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally {
			// close JDBC objects
			close(MyConn,Mystmt,MyRS);
		}
			
	
	}
	
	private static void close(Connection MyConn,Statement Mystmt,ResultSet MyRS) {
		
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

	public static TourGuide getGuides(String guide_id) {
		
		Connection MyConn = null;
		PreparedStatement Mystmt = null;
		ResultSet MyRS = null;
		
		
		try{
			
			// get connection to  database
			MyConn = dataSource.getConnection();
			
			//create sql to get selected user
			String sql = "select * from tour_guide_info where regNo=?";
			
			// create prepared statement
			Mystmt = MyConn.prepareStatement(sql);
			
			// set parameters
			Mystmt.setString(1, guide_id);
			
			// execute statement 
			MyRS = Mystmt.executeQuery();
			
			// retrieve data from result set row
			if(MyRS.next()) {
				
				//retrieve result set
				String regNo = MyRS.getString("regNo");
				String firstName = MyRS.getString("fullname");
				String category = MyRS.getString("category");
				String emailAddress = MyRS.getString("email");
				Date expdate = MyRS.getDate("expdate");
				String address = MyRS.getString("address");
				String telephone = MyRS.getString("telephone");
				String language_1 = MyRS.getString("language_1");
				String language_2 = MyRS.getString("language_2");
				String language_3 = MyRS.getString("language_3");
				String language_4 = MyRS.getString("language_4");
				String language_5 = MyRS.getString("language_5");
				
				// create a new user object
				TourGuide tmpGuide = new TourGuide(regNo, firstName, null, emailAddress, null, null,category, telephone, address, expdate,language_1, language_2,language_3,language_4,language_5);
				return tmpGuide;
				
			}
			else {
				
				throw new Exception("Couldn't find Guide id: " +guide_id);
				
			}
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(MyConn, Mystmt, MyRS);
		}
		
		
		return null;
	}

	public static void deleteGuide(String guide_id) {
		
		Connection MyConn = null;
		PreparedStatement Mystmt = null;
		
		
		try{
			
			// get db connection
			MyConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "delete from tour_guide_info where regNo=?";
			
			
			// prepare statement
			Mystmt = MyConn.prepareStatement(sql);
		
			
			// set parameters
			Mystmt.setString(1, guide_id);
			
			
			// execute SQL statement
			Mystmt.execute();
			
		
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		finally {
			close(MyConn,Mystmt, null);
		}
		
	}

	public static void updateGuide(TourGuide theGuide) {
		Connection MyConn = null;
		PreparedStatement Mystmt = null;
		
		
		try{
			
			// get db connection
			MyConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "update tour_guide_info set fullname=?,category=?,telephone=?,address=?,email=?,expdate=?, language_1=?,language_2=?,language_3=?,language_4=?,language_5=? where regNo=?";
			
			// prepare statement
			Mystmt = MyConn.prepareStatement(sql);
						
			// set parameters
			Mystmt.setString(1, theGuide.getFirstName());
			Mystmt.setString(2, theGuide.getCategory());
			Mystmt.setString(3, theGuide.getTelephone());
			Mystmt.setString(4, theGuide.getAddress());
			Mystmt.setString(5, theGuide.getEmailAddress());
			Mystmt.setDate(6, theGuide.getExpDate());
			Mystmt.setString(7, theGuide.getLanguage_1());
			Mystmt.setString(8, theGuide.getLanguage_2());
			Mystmt.setString(9, theGuide.getLanguage_3());
			Mystmt.setString(10, theGuide.getLanguage_4());
			Mystmt.setString(11, theGuide.getLanguage_5());
			Mystmt.setString(12, theGuide.getId());
						
			// execute SQL statement
			Mystmt.execute();
						
		
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		finally {
			close(MyConn,Mystmt, null);
		}
		
	}

}
