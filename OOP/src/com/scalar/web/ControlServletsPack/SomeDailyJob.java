package com.scalar.web.ControlServletsPack;

import java.sql.Connection;
import java.sql.ResultSet;

import javax.annotation.Resource;
import javax.sql.DataSource;

public class SomeDailyJob  implements Runnable {

	@Resource(name="jdbc/OOP") 
	private static DataSource dataSource;
	
	public SomeDailyJob(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void run() {
		try {
        	for(;;) {
        		
        	
            	//HttpSession session = request.getSession();
            	
            	Connection conn = dataSource.getConnection();
                ResultSet rs_count_users = conn.prepareStatement("Select Count(*) from user_info").executeQuery();
                ResultSet rs_count_guides = conn.prepareStatement("select count(*) from tour_guide_info").executeQuery();
                
                
                
                if(rs_count_users.next()) {
                	int count_users = rs_count_users.getInt(1);
                	System.out.println(count_users);//session.setAttribute("USERS_COUNT", count_users);
                	
                }
                	 
                if(rs_count_guides.next()) {
                	int count_guides = rs_count_guides.getInt(1);
                	System.out.println(count_guides);
                	// session.setAttribute("TOUR_GUIDE_COUNT", count_guides);
                }
               
                //session.removeAttribute("TOUR_GUIDE_LIST");
                //session.removeAttribute("USERS_LIST");
                
                //System.out.println("Count diff:"+ (prevCount-count));
               
    			
                Thread.sleep(5000);
        	}
        } catch (Exception e) {}

	}

}
