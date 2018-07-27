package com.scalar.web.utilityPack;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.scalar.web.userModelPack.Hotel;

public class HotelDbUtil {

	private static DataSource dataSource;
	
	public HotelDbUtil(DataSource dataSource) {

		this.dataSource = dataSource;
	}

	public List<Hotel> getHotels() throws Exception{
		
		List<Hotel> Hotels = new ArrayList<>();
		
		Connection MyConn = null;
		Statement Mystmt = null;
		ResultSet MyRS = null;
		
		try {
			// get a connection
			MyConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from hotel";
			
			
			Mystmt = MyConn.createStatement();
			
			
			// execute query
			MyRS = Mystmt.executeQuery(sql);
			
			
			// process result set
			while(MyRS.next()) {
				
				//retrieve result set
				int id = MyRS.getInt("idhotel");
				String name = MyRS.getString("hotelName");
				String city = MyRS.getString("hotelCity");
				String address = MyRS.getString("hotelAddress");
				String phone = MyRS.getString("hotelPhone");
				String web = MyRS.getString("hotelWeb");
				String type = MyRS.getString("hotelType");
				
				// create a new user object
				Hotel hotel = new Hotel(id,null,name,city, address, phone, web, type);
				
				// add it to the list of users
				Hotels.add(hotel);
			}
			return Hotels;
		}
		finally{
			//close JDBC objects
			close(MyConn,null, Mystmt,null, MyRS, null);
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
