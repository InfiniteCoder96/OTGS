package com.scalar.web.utilityPack;


import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.scalar.web.servicePack.EmailComposer;
import com.scalar.web.userModelPack.Places;
import com.scalar.web.userModelPack.TourGuide;

public class CommonDbUtil {

	private static DataSource dataSource;
	
	public CommonDbUtil(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static <E> List searchAll(String keyword) {
		
		List<E> list = new ArrayList<>();
		Connection MyConn = null;
		Statement Mystmt_places = null;
		Statement Mystmt_stmt_img_name = null;
		Statement Mystmt_guides =null;
		Statement Mystmt_hotels =null;
		ResultSet MyRS_places = null;
		ResultSet MyRS_guides = null;
		ResultSet MyRS_hotels = null;
		ResultSet MyRS_image_name = null;
		
		// get a connection
		try{
			
			MyConn = dataSource.getConnection();
		
		// create sql statement
		String sql_places = "select * from tour_places where P_name Like '%"+keyword+"%' OR P_city Like '%"+keyword+"%' OR P_category Like '%"+keyword+"%' ";
		String sql_tourguides = "select * from tour_guide_info where fullname Like  '%"+keyword+"%' OR category Like '%"+keyword+"%' OR regNo Like '%"+keyword+"%' ";
		//String sql_hotels = "select * from starhotels where hotelName Like  '%"+keyword+"%' OR hotelCity Like '%"+keyword+"%' OR starNo Like '%"+keyword+"%' ";
		
		Mystmt_places = MyConn.createStatement();
		
	
		
		Mystmt_guides = MyConn.createStatement();
		
		
		
		Mystmt_hotels = MyConn.createStatement();
		
		
		
		// execute query
		MyRS_places = Mystmt_places.executeQuery(sql_places);
		MyRS_guides = Mystmt_guides.executeQuery(sql_tourguides);
		//MyRS_hotels = Mystmt_hotels.executeQuery(sql_hotels);
		
		// process result set
		while(MyRS_guides.next()) {
			
			
				// retrieve data from result set row
				String regNo = MyRS_guides.getString("regNo");
				String fullname = MyRS_guides.getString("fullname");
				String category = MyRS_guides.getString("category");
				String telephone = MyRS_guides.getString("telephone");
				String address = MyRS_guides.getString("address");
				String email = MyRS_guides.getString("email");
				Date expdate = MyRS_guides.getDate("expdate");
				String language_1 = MyRS_guides.getString("language_1");
				String language_2 = MyRS_guides.getString("language_2");
				String language_3 = MyRS_guides.getString("language_3");
				String language_4 = MyRS_guides.getString("language_4");
				String language_5 = MyRS_guides.getString("language_5");
				
				// create new tour guide object
				TourGuide newguide = new TourGuide(regNo, fullname,null, email, null, null,	category, telephone, address, expdate,language_1, language_2,language_3, language_4, language_5);
				
				// add it to list of tour guides
				list.add((E) newguide);
				
			
		}
			while(MyRS_places.next()) {
				
				
					String place_names = MyRS_places.getString("P_name");
					String place_city = MyRS_places.getString("P_city");
					String place_description = MyRS_places.getString("P_description");
					String place_caption = MyRS_places.getString("P_caption");
					String category_places = MyRS_places.getString("P_category");
					String place_ID = MyRS_places.getString("place_ID");
					
					
					// create sql statement for retrieve image name
					String image_name_query = "select img_name_01 from tour_places_images where place_ID = '"+place_ID+"' ";
					
					Mystmt_stmt_img_name = MyConn.createStatement();
					
					// execute query
					MyRS_image_name = Mystmt_stmt_img_name.executeQuery(image_name_query);
					
					if(MyRS_image_name.next()) {
						String image_name = MyRS_image_name.getString("img_name_01");
						
						// create new tour guide object
						Places newplace = new Places(place_names, place_city, place_description, category_places,place_caption, image_name,place_ID);
						
						// add it to list of tour guides
						list.add((E) newplace);
					}
					
					
					
					
			}
			
			
			return list;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		}
		finally {
			// close JDBC objects
			close(MyConn,Mystmt_places,Mystmt_guides,Mystmt_hotels,MyRS_guides,MyRS_places,MyRS_hotels);
		}
	}

	private static void close(Connection MyConn,Statement Mystmt,Statement mystmt_guides, Statement mystmt_hotels, ResultSet MyRS, ResultSet myRS_places, ResultSet myRS_hotels) {
		
		try {
			if(MyRS != null)
				MyRS.close();
			if(MyConn != null)
				MyConn.close();
			if(Mystmt != null)
				Mystmt.close();
			if(mystmt_guides != null)
				mystmt_guides.close();
			if(mystmt_hotels != null)
				mystmt_hotels.close();
			if(myRS_places != null)
				myRS_places.close();
			if(myRS_hotels != null)
				myRS_hotels.close();
			
			
		}catch (Exception exc){
			exc.printStackTrace();
		}
		
	}

	public static int countPlaces() {
		
		Connection MyConn = null;
		Statement Mystmt = null;
		ResultSet MyRS = null;
		
		int count = 0;
		
		try{
			// get a connection
			MyConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select count(*) from tour_places";
			
			Mystmt = MyConn.createStatement();
			
			// execute query
			MyRS = Mystmt.executeQuery(sql);
		
			
			// process result set
			while(MyRS.next()) {
				
				count = MyRS.getInt(1);
			}
			
			return count;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		finally {
			// close JDBC objects
			close(MyConn,Mystmt,null, null, MyRS, null, null);
		}
		
		
		
		
	}
}
