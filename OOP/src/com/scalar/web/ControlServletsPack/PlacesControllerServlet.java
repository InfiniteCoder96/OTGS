package com.scalar.web.ControlServletsPack;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;
import javax.sql.DataSource;

import com.scalar.web.userModelPack.Places;
import com.scalar.web.userModelPack.TourGuide;
import com.scalar.web.userModelPack.User;
import com.scalar.web.utilityPack.CommonDbUtil;
import com.scalar.web.utilityPack.PlacesDbUtil;
import com.scalar.web.utilityPack.TourGuideDbUtil;

/**
 * Servlet implementation class PlacesControllerServlet
 */
@WebServlet("/PlacesControllerServlet")

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50)
public class PlacesControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static final String UPLOAD_DIR = "images";
	public String dbFileName = "";

	@Resource(name = "jdbc/OOP")
	private DataSource dataSource;

	

	@Override
	public void init() throws ServletException {

		super.init();

		try {

			new PlacesDbUtil(dataSource);

		} catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	public PlacesControllerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String command = request.getParameter("command");

		System.out.println(command);
		try {

			// If the command is missing, then default to listing users
			switch (command) {

			case "ADD":
				addplaces(request, response);
				break;
			case "SEARCH":
				SearchPlaces(request, response);
				break;
			case "LIST":
				listPlaces(request, response);
				break;
			case "LOAD_THE_PLACE":
				loadThePlace(request, response);
				break;
			case "DELETE":
				deletePlaces(request, response);
				break;

			}

		} catch (Exception exc) {

			exc.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		
		String command = request.getParameter("command");

		
		try {

			// If the command is missing, then default to listing users
			switch (command) {

			
			case "UPDATE":
				UpdatePlaces(request, response);
				break;
			case "PHOTO_UPLOAD":
				photoUploadPlace(request, response);
				break;
			

			}

		} catch (Exception exc) {

			exc.printStackTrace();
		}
		
	}
	
	private void deletePlaces(HttpServletRequest request, HttpServletResponse response) {
		
		String placeID = request.getParameter("place_id");
		String destination = request.getParameter("destination");
		
		
		
		try {
			PlacesDbUtil.deletePlaces(placeID);
		
			request.setAttribute("SalertMsg", "Place Deleted Successfully");
			
			request.getRequestDispatcher(destination).forward(request, response);
			
		} catch (ServletException e) {
			request.setAttribute("WalertMsg", "Something Went Wrong...Please Try Again Later");
			e.printStackTrace();
		} catch (IOException e) {
			request.setAttribute("WalertMsg", "Something Went Wrong...Please Try Again Later");
			e.printStackTrace();
		}
		
	}

	private void UpdatePlaces(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		
		
		String image_ID = request.getParameter("imageID");
		String image_no = request.getParameter("imageNo");
		String image_path = null;
		
		if(image_no.equals("Main Image")) {
			image_no = "img_name_01";
			image_path = "img_path_01";
		}
		else if(image_no.equals("Sub Image 02")) {
			image_no = "img_name_02";
			image_path = "img_path_02";
		}
		else if(image_no.equals("Sub Image 03")) {
			image_no = "img_name_03";
			image_path = "img_path_03";
		}
		else if(image_no.equals("Sub Image 04")) {
			image_no = "img_name_04";
			image_path = "img_path_04";
		}
		else if(image_no.equals("Sub Image 05")) {
			image_no = "img_name_05";
			image_path = "img_path_05";
		}
		
		Part part = request.getPart("file");//
		String fileName = extractFileName(part);// file name

		/**
		 * *** Get The Absolute Path Of The Web Application ****
		 */
		String applicationPath = getServletContext().getRealPath("");
		String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
		System.out.println("applicationPath:" + applicationPath);
		File fileUploadDirectory = new File(uploadPath);
		if (!fileUploadDirectory.exists()) {
			fileUploadDirectory.mkdirs();
		}
		String savePath = uploadPath + File.separator + fileName;
		System.out.println("savePath: " + savePath);
		String sRootPath = new File(savePath).getAbsolutePath();
		System.out.println("sRootPath: " + sRootPath);
		part.write(savePath + File.separator);
		File fileSaveDir1 = new File(savePath);
		/*
		 * if you may have more than one files with same name then you can calculate
		 * some random characters and append that characters in fileName so that it will
		 * make your each image name identical.
		 */
		 dbFileName = UPLOAD_DIR + File.separator + fileName;
		part.write(savePath + File.separator);
		// out.println(id+" "+firstName+" "+lastName+" "+fileName+" "+savePath);
		/*
					 * You need this loop if you submitted more than one file
					 * 
					 * for (Part parts : request.getParts()) { String fileNames =
					 * extractFileName(parts); dbFileName = UPLOAD_DIR + File.separator + fileNames;
					 * parts.write(savePath + File.separator + fileNames);
					 */
		try {

			Connection MyConn = null;
			PreparedStatement Mystmt = null;
			
			MyConn = dataSource.getConnection();

			Mystmt = MyConn.prepareStatement("update tour_places_images set "+image_no+"=?,"+image_path+"=?  where place_ID=? ");

			Mystmt.setString(1, dbFileName);
			Mystmt.setString(2, savePath);
			Mystmt.setString(3, image_ID);

			Mystmt.execute();

			

		} catch (Exception e) {
				e.printStackTrace();
		}
		
		
		//place 'place' in the request attribute
		request.setAttribute("SalertMsg", "Photo Upload Complete");
		
		//send to jsp page
		request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
		
		
	}

	private void listPlaces(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			int page = 1;
			int recordsPerPage = 5;
            
            if(request.getParameter("records_per_page") != null)
            	recordsPerPage = Integer.parseInt(request.getParameter("records_per_page"));
            if(request.getParameter("page") != null)
                page = Integer.parseInt(request.getParameter("page"));
            
            String destination = request.getParameter("destination");
            System.out.println(destination);
            
            List<Places> places_count_ = PlacesDbUtil.searchPlaces(null,null);
            
			int noOfRecords = places_count_.size();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            System.out.println(noOfRecords+" "+noOfPages);
            
			List<Places> places = PlacesDbUtil.listPlaces(destination, (page-1)*recordsPerPage, recordsPerPage);
			
			request.setAttribute("PLACES_LIST", places);
			request.setAttribute("noOfPages", noOfPages);
			request.setAttribute("currentPage",page);
			
			System.out.println(page);
			
			request.getRequestDispatcher(destination).forward(request, response);
			
		} catch (ServletException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
		
	}

	private void addplaces(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

	}
	
	
	


	
	
	

	private String extractFileName(Part part) {// This method will print the file name.
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

	private void SearchPlaces(HttpServletRequest request, HttpServletResponse response) {
		
		String keyword = request.getParameter("key");
		String category = request.getParameter("category");
		String destination = request.getParameter("destination");
		
		
		
		try {
			List<Places> places = PlacesDbUtil.searchPlaces(keyword,category);
		
			if(places != null) {
				
				int size = places.size();
				request.setAttribute("PLACES_LIST", places);
				request.setAttribute("COMMAND", "SEARCH");
				request.setAttribute("NO_OF_RESULTS", size);
			}
			else {
				request.setAttribute("errorMessage", "Results Not found");
			}
		
			request.getRequestDispatcher(destination).forward(request, response);
			
		} catch (ServletException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}

	private void loadThePlace(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//read place id from form data
		String place_id = request.getParameter("place_id");
		String destination = request.getParameter("destination");
		
		List<Places> Places = new ArrayList<>();
		
			//get place from database (db util)
			Places = PlacesDbUtil.searchPlaces(place_id, "place id");
			
			Places place = Places.get(0);
			
			//place 'place' in the request attribute
			request.setAttribute("THE_PLACE", place);
			
			//send to jsp page
			request.getRequestDispatcher(destination).forward(request, response);
		
	}
	
	
	private void photoUploadPlace(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String image_ID = request.getParameter("imageID");
		String image_no = request.getParameter("imageNo");
		String image_path = null;
		
		if(image_no.equals("Main Image")) {
			image_no = "img_name_01";
			image_path = "img_path_01";
		}
		else if(image_no.equals("Sub Image 02")) {
			image_no = "img_name_02";
			image_path = "img_path_02";
		}
		else if(image_no.equals("Sub Image 03")) {
			image_no = "img_name_03";
			image_path = "img_path_03";
		}
		else if(image_no.equals("Sub Image 04")) {
			image_no = "img_name_04";
			image_path = "img_path_04";
		}
		else if(image_no.equals("Sub Image 05")) {
			image_no = "img_name_05";
			image_path = "img_path_05";
		}
		
		Part part = request.getPart("file");//
		String fileName = extractFileName(part);// file name

		/**
		 * *** Get The Absolute Path Of The Web Application ****
		 */
		String applicationPath = getServletContext().getRealPath("");
		String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
		System.out.println("applicationPath:" + applicationPath);
		File fileUploadDirectory = new File(uploadPath);
		if (!fileUploadDirectory.exists()) {
			fileUploadDirectory.mkdirs();
		}
		String savePath = uploadPath + File.separator + fileName;
		System.out.println("savePath: " + savePath);
		String sRootPath = new File(savePath).getAbsolutePath();
		System.out.println("sRootPath: " + sRootPath);
		part.write(savePath + File.separator);
		File fileSaveDir1 = new File(savePath);
		/*
		 * if you may have more than one files with same name then you can calculate
		 * some random characters and append that characters in fileName so that it will
		 * make your each image name identical.
		 */
		 dbFileName = UPLOAD_DIR + File.separator + fileName;
		part.write(savePath + File.separator);
		// out.println(id+" "+firstName+" "+lastName+" "+fileName+" "+savePath);
		/*
					 * You need this loop if you submitted more than one file
					 * 
					 * for (Part parts : request.getParts()) { String fileNames =
					 * extractFileName(parts); dbFileName = UPLOAD_DIR + File.separator + fileNames;
					 * parts.write(savePath + File.separator + fileNames);
					 */
		try {

			Connection MyConn = null;
			PreparedStatement Mystmt = null;
			
			MyConn = dataSource.getConnection();

			Mystmt = MyConn.prepareStatement("update tour_places_images set "+image_no+"=?,"+image_path+"=?  where place_ID=? ");

			Mystmt.setString(1, dbFileName);
			Mystmt.setString(2, savePath);
			Mystmt.setString(3, image_ID);

			Mystmt.execute();

			

		} catch (Exception e) {
				e.printStackTrace();
		}
		
		
		//place 'place' in the request attribute
		request.setAttribute("SalertMsg", "Photo Upload Complete");
		
		//send to jsp page
		request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
		
	}
	
	

}
