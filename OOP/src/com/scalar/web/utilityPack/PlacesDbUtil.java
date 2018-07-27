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

import com.scalar.web.userModelPack.Places;
import com.scalar.web.userModelPack.TourGuide;

public class PlacesDbUtil {

	
	private static DataSource dataSource;
	
	
	

	public PlacesDbUtil(DataSource thedataSource) {
		dataSource = thedataSource;
	}

	public static List<Places> listPlaces(String destination, int page, int recordsPerPage) {
		
		List<Places> places = new ArrayList<>();
		
		Connection MyConn = null;
		PreparedStatement Mystmt = null;
		Statement Mystmt_stmt_img_name = null;
		Statement Mystmt_stmt = null;
		ResultSet MyRS = null;
		ResultSet MyRS_image_name = null;
		
		if(destination.equals("Admin_Dashboard.jsp")) {
			try{
				// get a connection
				MyConn = dataSource.getConnection();
				
				// create sql statement
				String sql = "select * from tour_places";
				
				Mystmt_stmt = MyConn.createStatement();
				
				// execute query
				MyRS = Mystmt_stmt.executeQuery(sql);
				
			
				
				// process result set
				while(MyRS.next()) {
					
					String place_ID = MyRS.getString("place_ID");
					String place_names = MyRS.getString("P_name");
					String place_city = MyRS.getString("P_city");
					String place_description = MyRS.getString("P_description");
					String place_caption = MyRS.getString("P_caption");
					String category = MyRS.getString("P_category");
		
					// create sql statement for retrieve image name
					String image_name_query = "select img_path_01 from tour_places_images where place_ID = '"+place_ID+"' ";
					
					Mystmt_stmt_img_name = MyConn.createStatement();
					
					// execute query
					MyRS_image_name = Mystmt_stmt_img_name.executeQuery(image_name_query);
					
					if(MyRS_image_name.next()) {
						String image_name = MyRS_image_name.getString("img_name_01");
						
						// create new tour guide object
						Places newplace = new Places(place_names, place_city, place_description, category,place_caption, image_name,place_ID);
						
						// add it to list of tour guides
						places.add(newplace);
					}
					
					
					
					
				}
				
				System.out.println(places);
				return places;
				
			} catch (SQLException e) {
				
				e.printStackTrace();
				return null;
			}
			finally {
				// close JDBC objects
				close(MyConn,Mystmt_stmt,MyRS);
			}
		}
		if(destination.equals("View_Places.jsp")) {
			try{
				// get a connection
				MyConn = dataSource.getConnection();
				
				// create sql statement
				String sql = "select * from tour_places limit ?,?";
				
				Mystmt = MyConn.prepareStatement(sql);
				
				Mystmt.setInt(1, page);
				Mystmt.setInt(2, recordsPerPage);
				
				// execute query
				MyRS = Mystmt.executeQuery();
				 
				
				
				// process result set
				while(MyRS.next()) {
					
					String place_names = MyRS.getString("P_name");
					String place_city = MyRS.getString("P_city");
					String place_description = MyRS.getString("P_description");
					String place_caption = MyRS.getString("P_caption");
					String category = MyRS.getString("P_category");
					String place_ID = MyRS.getString("place_ID");
					
					// create sql statement for retrieve image name
					String image_name_query = "select img_name_01 from tour_places_images where place_ID = '"+place_ID+"' ";
					
					Mystmt_stmt_img_name = MyConn.createStatement();
					
					// execute query
					MyRS_image_name = Mystmt_stmt_img_name.executeQuery(image_name_query);
					
					if(MyRS_image_name.next()) {
						String image_name = MyRS_image_name.getString("img_name_01");
						
						// create new tour guide object
						Places newplace = new Places(place_names, place_city, place_description, category,place_caption, image_name,place_ID);
						
						// add it to list of tour guides
						places.add(newplace);
					}
				}
				
				
				
				System.out.println(places);
				return places;
			} catch (SQLException e) {
				
				e.printStackTrace();
				return null;
			}
			finally {
				// close JDBC objects
				close(MyConn,Mystmt_stmt,MyRS);
			}
		}
		else {
			return null;
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

	public static List<Places> searchPlaces(String keyword, String category) {

		List<Places> places = new ArrayList<>();
		int count = 0;
		Connection MyConn = null;
		PreparedStatement Mystmt = null;
		Statement Mystmt_stmt_img_name = null;
		ResultSet MyRS = null;
		ResultSet MyRS_image_name = null;
		
		try {
			
				
				// get a connection
				MyConn = dataSource.getConnection();
				
				String sql = null;
				
				// create sql statement
				if(category == null) {
					sql = "select * from tour_places";
				}
				else if(category.equals("Place Name")) {
					sql = "select * from tour_places where P_name=?";
					
				}
				else if(category.equals("City")) {
					sql = "select * from tour_places where P_city=?";
					
				}
				else if(category.equals("Category")) {
					sql = "select * from tour_places where P_category=?";
					
				}
				else if(category.equals("place id")) {
					sql = "select * from tour_places where place_ID=?";
					
				}
				
				
				if(category == null) {
					Mystmt = MyConn.prepareStatement(sql);
					
				}
				else {
					Mystmt = MyConn.prepareStatement(sql);
					
					Mystmt.setString(1, keyword);
					
					
				} 
				
				
				// execute query
				MyRS = Mystmt.executeQuery();
				
				
				// process result set
				while(MyRS.next()) {
					
					// retrieve data from result set row
					String place_names = MyRS.getString("P_name");
					String place_city = MyRS.getString("P_city");
					String place_description = MyRS.getString("P_description");
					String place_caption = MyRS.getString("P_caption");
					String place_category = MyRS.getString("P_category");
					String place_ID = MyRS.getString("place_ID");
					
					// create sql statement for retrieve image name
					String image_name_query = "select img_name_01 from tour_places_images where place_ID = '"+place_ID+"' ";
					
					Mystmt_stmt_img_name = MyConn.createStatement();
					
					// execute query
					MyRS_image_name = Mystmt_stmt_img_name.executeQuery(image_name_query);
					
					if(MyRS_image_name.next()) {
						String image_name = MyRS_image_name.getString("img_name_01");
						
						// create new tour guide object
						Places newplace = new Places(place_names, place_city, place_description, place_category,place_caption, image_name,place_ID);
						
						// add it to list of tour guides
						places.add(newplace);
					}
					
					count++;
				}
				
				if(count == 0)
					return null;
				else
					return places;
				
				
				
				
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

	public static void deletePlaces(String placeID) {
		
		try{
			
			Connection MyConn = null;
			Statement stmt = null;
		
			// get a connection
			MyConn = dataSource.getConnection();
			
			stmt = MyConn.createStatement();
			
			// create sql statement
			String sql = "delete from tour_places where place_ID='"+placeID+"'";
			
			stmt.executeUpdate(sql);
			
			
			// execute query
		
			 
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	

	
}
