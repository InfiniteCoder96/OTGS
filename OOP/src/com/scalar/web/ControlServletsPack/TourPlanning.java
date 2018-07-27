package com.scalar.web.ControlServletsPack;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.scalar.web.utilityPack.PlacesDbUtil;
import com.scalar.web.utilityPack.TourPlanningDbUtil;

/**
 * Servlet implementation class tourPlanning
 */
@WebServlet("/TourPlanningServlet")
public class TourPlanning extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/OOP")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {

		super.init();

		try {

			new TourPlanningDbUtil(dataSource);

		} catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TourPlanning() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {

	}

	/**
	 * @throws IOException
	 * @throws ServletException
	 * @throws @throws
	 *             Exception
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException  {

		// read the command
		String command = request.getParameter("command");

		try {

			// If the command is missing, then default to listing users
			if (command == null) {
				command = "LIST";
			}

			switch (command) {

				case "ADD":
					addTourPlan(request, response);
					break;
				
				default:
					listTourPlan(request, response);
			}

		} catch (Exception exc) {

			throw new ServletException(exc);
		}
	}

	private void addTourPlan(HttpServletRequest request, HttpServletResponse response) {

		try {
			
			
			
			String tour_guide = request.getParameter("tourguide_options") + "/" + request.getParameter("keyword");
			String fullname = request.getParameter("title") + request.getParameter("fullname");
			String country = request.getParameter("country");
			String nationality = request.getParameter("nationality");
			String email = request.getParameter("email");
			String phone_no = request.getParameter("phone_no");
			String transport = request.getParameter("transport");
			String regions = request.getParameter("regions");
			String requirements = request.getParameter("requirements");
			String comments = request.getParameter("comments");

			String str_arr_date = request.getParameter("arrival_date");
			String str_dep_date = request.getParameter("depature_date");
			String str_no_of_nights = request.getParameter("no_nights");
			String str_no_of_adults = request.getParameter("no_adults");
			String str_no_of_children = request.getParameter("no_childs");
			String str_budget = request.getParameter("budget");

			int no_nights = Integer.parseInt(str_no_of_nights);
			int no_adults = Integer.parseInt(str_no_of_adults);
			int no_childs = Integer.parseInt(str_no_of_children);

			java.util.Date util_arr_date = new SimpleDateFormat("yyyy-MM-dd").parse(str_arr_date);
			java.sql.Date arr_date = new java.sql.Date(util_arr_date.getTime());

			java.util.Date util_dep_date;

			util_dep_date = new SimpleDateFormat("yyyy-MM-dd").parse(str_dep_date);

			java.sql.Date dep_date = new java.sql.Date(util_dep_date.getTime());

			double budget = Double.parseDouble(str_budget);
			
			
			/*
			 * String country = (String) request.getAttribute("country"); String country =
			 * (String) request.getAttribute("country"); String country = (String)
			 * request.getAttribute("country"); String country = (String)
			 * request.getAttribute("country"); String country = (String)
			 * request.getAttribute("country"); String country = (String)
			 * request.getAttribute("country");
			 */

			List<Object> tourPlanningList = new ArrayList<>();

			tourPlanningList.add(fullname);// 0
			tourPlanningList.add(country);// 1
			tourPlanningList.add(nationality);// 2
			tourPlanningList.add(email);// 3
			tourPlanningList.add(phone_no);// 4
			tourPlanningList.add(transport);// 5
			tourPlanningList.add(tour_guide);// 6
			tourPlanningList.add(arr_date);// 7
			tourPlanningList.add(dep_date);// 8
			tourPlanningList.add(no_nights);// 9
			tourPlanningList.add(no_adults);// 10
			tourPlanningList.add(no_childs);// 11
			tourPlanningList.add(regions);// 12
			tourPlanningList.add(requirements);// 13
			tourPlanningList.add(comments);// 14
			tourPlanningList.add(budget);// 15
			

			TourPlanningDbUtil.tourPlan(tourPlanningList);

			request.setAttribute("SalertMsg",
					"Your Tour Plan Submitted Successfully.Please check your Email for further info");
			request.getRequestDispatcher("Tour_Planning.jsp").forward(request, response);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void listTourPlan(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

}
