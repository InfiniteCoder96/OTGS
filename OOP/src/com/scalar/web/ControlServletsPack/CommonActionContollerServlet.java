package com.scalar.web.ControlServletsPack;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.scalar.web.userModelPack.Places;
import com.scalar.web.userModelPack.TourGuide;
import com.scalar.web.utilityPack.CommonDbUtil;
import com.scalar.web.utilityPack.TourGuideDbUtil;

/**
 * Servlet implementation class CommonActionContollerServlet
 */
@WebServlet("/CACS")
public class CommonActionContollerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
private CommonDbUtil commonDbUtil;
	
	
	@Resource(name="jdbc/OOP") 
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		
		super.init();
		
		try {
			
			commonDbUtil = new CommonDbUtil(dataSource);
			
		}catch(Exception exc) {
			throw new ServletException(exc);
		}
	}
	
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommonActionContollerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		
		try {
			
			
            
            // If the command is missing, then default to listing users
			
			
			switch(command) {
				
				case "SEARCH":SearchAll(request,response);
							break;
				default:SearchAll(request,response);
				
			}
		
		
		} catch (Exception exc) {
			
			exc.printStackTrace();
		}
	}


	private void SearchAll(HttpServletRequest request, HttpServletResponse response) {
		
		String keyword = request.getParameter("search");
		try {
			List<?> resultList = CommonDbUtil.searchAll(keyword);
			
			
			int count_places = 0;
			int count_guides = 0;
			
			System.out.println(resultList.size());
			
			for(Object plc : resultList) {
				if(plc instanceof Places ) {
					count_places++;
				}
				else if(plc instanceof TourGuide) {
					count_guides++;
				}
			}
				request.setAttribute("list", resultList);
				request.setAttribute("count_places", count_places);
				request.setAttribute("count_guides", count_guides);
			
				
			
		
			request.getRequestDispatcher("search_results.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
