package com.scalar.web.ControlServletsPack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.scalar.web.servicePack.CommonUtil;
import com.scalar.web.servicePack.EmailComposer;
import com.scalar.web.servicePack.Mailer;
import com.scalar.web.userModelPack.Inquiry;
import com.scalar.web.utilityPack.inquiryDbUtil;

/**
 * Servlet implementation class InquiryHandlerServlet
 */
@WebServlet("/InquiryHandlerServlet")
public class InquiryHandlerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private inquiryDbUtil inquiryDbUtils;
	
	@Resource(name="jdbc/OOP") 
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		
		try {
			
			inquiryDbUtils = new inquiryDbUtil(dataSource);
			
		}catch(Exception exc) {
			throw new ServletException(exc);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		System.out.println(command);
		try {
			
			// If the command is missing, then default to listing users
			if(command == null ) {
				command = "LIST";
			}
			
			switch(command) {
				case "LIST":listInquiry(request,response);
							break;
				default:listInquiry(request,response);
				
			}
			
		} catch (Exception exc) {
			// TODO Auto-generated catch block
			exc.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String command = request.getParameter("command");
		System.out.println(command);
		try {
			
			// If the command is missing, then default to listing user
			
			switch(command) {
						
				case "ADD":addInquiry(request,response);
							break;
				default:listInquiry(request,response);
				
			}
			
		} catch (Exception exc) {
			// TODO Auto-generated catch block
			throw new ServletException(exc);
		}
	}

	
	private void listInquiry(HttpServletRequest request, HttpServletResponse response)  {
		
		try {
			
			List<Inquiry> inq = inquiryDbUtil.getInquiries();
			
			
			request.setAttribute("INQUIRY_LIST", inq);
			
			request.getRequestDispatcher("Admin_Dashboard.jsp").forward(request, response);
			
		} catch (IOException e) {
			
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void addInquiry(HttpServletRequest request, HttpServletResponse response) {
	
		try {
			
			// Generate a unique inquiry id 
			String InqID = CommonUtil.generateInquiryIDs(getInquiryIDs());
			
			
			//read inquiry info from form data
			String user_id = request.getParameter("user_id");
			String username = request.getParameter("fullname");
			String email = request.getParameter("email");
			String message = request.getParameter("message");
			
			
			//create a new user object
			Inquiry newInquiry = new Inquiry(user_id,InqID,username,email,message);
			
			//add the user data to the database
			inquiryDbUtil.addInquiry(newInquiry);
			
			EmailComposer emailComposer = new EmailComposer(dataSource);
			HttpSession session = request.getSession();
			List<String> sendEmail = EmailComposer.compose_email("INQUIRY", (String)session.getAttribute("user"));
			
			//List<String> message = EmailComposer.compose_email("RESET_PW", user.get(0).getFirstName());
	        
	        String WalertMsg = Mailer.send(sendEmail.get(0), sendEmail.get(1), email, sendEmail.get(2), sendEmail.get(3));
			
			
			if(WalertMsg == null)
				request.setAttribute("SalertMsg", "You have successfully sent your inquiry...We'll contact you soon Thank You");
			else
				request.setAttribute("WalertMsg", WalertMsg);
			
			request.getRequestDispatcher("Contact_Us.jsp").forward(request, response);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("WalertMsg", "Something went wrong !	ooops..! its a I/O issue");
			
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("WalertMsg", "Something went wrong !	ooops..! its a Servlet issue");
		}
		
	}

	private ArrayList<String> getInquiryIDs() {

		ArrayList<String> arrayList = new ArrayList<String>();
		
		Connection MyConn = null;
		Statement Mystmt = null;
		ResultSet MyRS = null;
		
		try {
			
			MyConn = dataSource.getConnection();
			
			String sql = "select inq_id from inquiries";
					
			Mystmt = MyConn.createStatement();
			
			
			// execute query
			MyRS = Mystmt.executeQuery(sql);
			
			
			
			while (MyRS.next()) {
				arrayList.add(MyRS.getString("inq_id"));
			}
			
			return arrayList;
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(MyConn,Mystmt,MyRS);
		}
		return arrayList;
	}

	private void close(Connection MyConn, Statement Mystmt, ResultSet MyRS) {
		
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

	

}
