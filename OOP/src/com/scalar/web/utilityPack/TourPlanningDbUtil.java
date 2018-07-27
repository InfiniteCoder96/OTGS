package com.scalar.web.utilityPack;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.sql.DataSource;

public class TourPlanningDbUtil {

	private static DataSource dataSource;

	public TourPlanningDbUtil(DataSource dataSource) {
		TourPlanningDbUtil.dataSource = dataSource;
	}

	public static void tourPlan(List<?> tourPlanningList) {

		Connection MyConn = null;
		PreparedStatement Mystmt = null;
		ResultSet MyRS = null;

		try {
			
			
			// get a connection
			MyConn = dataSource.getConnection();

			// create sql statement
			String sql = "insert into tour_plan_info values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			Mystmt = MyConn.prepareStatement(sql);

			Mystmt.setString(1, (String) tourPlanningList.get(0));
			Mystmt.setString(2, (String) tourPlanningList.get(1));
			Mystmt.setString(3, (String) tourPlanningList.get(2));
			Mystmt.setString(4, (String) tourPlanningList.get(3));
			Mystmt.setString(5, (String) tourPlanningList.get(4));
			Mystmt.setString(6, (String) tourPlanningList.get(5));
			Mystmt.setString(7, (String) tourPlanningList.get(6));
			Mystmt.setDate(8, (Date) tourPlanningList.get(7));
			Mystmt.setDate(9, (Date) tourPlanningList.get(8));
			Mystmt.setInt(10, (int) tourPlanningList.get(9));
			Mystmt.setInt(11, (int) tourPlanningList.get(10));
			Mystmt.setInt(12, (int) tourPlanningList.get(11));
			Mystmt.setString(13, (String) tourPlanningList.get(12));
			Mystmt.setString(14, (String) tourPlanningList.get(13));
			Mystmt.setString(15, (String) tourPlanningList.get(14));
			Mystmt.setDouble(16, (double) tourPlanningList.get(15));

			Mystmt.execute();
			
		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			// close JDBC objects
			close(MyConn, Mystmt, MyRS);
		}

	}
	
	private static void close(Connection MyConn1, Statement Mystmt1, ResultSet MyRS) {
		
		try {
			if(MyRS != null)
				MyRS.close();
			if(MyConn1 != null)
				MyConn1.close();
			if(Mystmt1 != null)
				Mystmt1.close();
			
			
		}catch (Exception exc){
			exc.printStackTrace();
		}
		
	}

}
