package com.scalar.web.ControlServletsPack;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

/**
 * Servlet implementation class generateReport
 */
@WebServlet("/generateReport")
public class ReportGenerateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/OOP")
	private static DataSource dataSource;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		
		if(type.equals("non_Parameterized")){
			
			String command = request.getParameter("command");
			
			if(command.equals("user")){
				try {
					Connection conn = dataSource.getConnection();
					JasperReport jasperReport = null;
					JasperDesign jasperDesign = null;

					String path = getServletContext().getRealPath("/Reports/");
					jasperDesign = JRXmlLoader.load(path + "/userInfo_NonPara.jrxml");
					jasperReport = JasperCompileManager.compileReport(jasperDesign);
					byte[] byteStream = JasperRunManager.runReportToPdf(jasperReport, null, conn);
					OutputStream outStream = response.getOutputStream();
					response.setContentType("application/pdf");
					response.setContentLength(byteStream.length);
						outStream.write(byteStream, 0, byteStream.length);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (JRException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				
			}
			if(command.equals("guide")) {
				try {
					Connection conn = dataSource.getConnection();
					JasperReport jasperReport = null;
					JasperDesign jasperDesign = null;

					String path = getServletContext().getRealPath("/Reports/");
					jasperDesign = JRXmlLoader.load(path + "/Tour_Guides_Info_NonPara.jrxml");
					jasperReport = JasperCompileManager.compileReport(jasperDesign);
					byte[] byteStream = JasperRunManager.runReportToPdf(jasperReport, null, conn);
					OutputStream outStream = response.getOutputStream();
					response.setContentType("application/pdf");
					response.setContentLength(byteStream.length);
						outStream.write(byteStream, 0, byteStream.length);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (JRException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
			if(command.equals("hotel")) {
				try {
					Connection conn = dataSource.getConnection();
					JasperReport jasperReport = null;
					JasperDesign jasperDesign = null;

					String path = getServletContext().getRealPath("/Reports/");
					jasperDesign = JRXmlLoader.load(path + "/Hotel_Details_NonPara.jrxml");
					jasperReport = JasperCompileManager.compileReport(jasperDesign);
					byte[] byteStream = JasperRunManager.runReportToPdf(jasperReport, null, conn);
					OutputStream outStream = response.getOutputStream();
					response.setContentType("application/pdf");
					response.setContentLength(byteStream.length);
						outStream.write(byteStream, 0, byteStream.length);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (JRException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

			}
			if(command.equals("inquiry")) {
				try {
					Connection conn = dataSource.getConnection();
					JasperReport jasperReport = null;
					JasperDesign jasperDesign = null;

					String path = getServletContext().getRealPath("/Reports/");
					jasperDesign = JRXmlLoader.load(path + "/Inquiry_Info.jrxml");
					jasperReport = JasperCompileManager.compileReport(jasperDesign);
					byte[] byteStream = JasperRunManager.runReportToPdf(jasperReport, null, conn);
					OutputStream outStream = response.getOutputStream();
					response.setContentType("application/pdf");
					response.setContentLength(byteStream.length);
						outStream.write(byteStream, 0, byteStream.length);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (JRException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

			}
			
		}
		else if(type.equals("Parameterized")) {
			
			String command = request.getParameter("command");
			
			if(command.equals("user")){
				try {
					String user_id = (String) request.getParameter("user_id");
					Connection conn = dataSource.getConnection();
					JasperReport jasperReport = null;
					JasperDesign jasperDesign = null;
					Map<String, Object> parameters = new HashMap<String, Object>();
					parameters.put("user_id", user_id);
					String path = getServletContext().getRealPath("/Reports/");
					jasperDesign = JRXmlLoader.load(path + "/userInfo.jrxml");
					jasperReport = JasperCompileManager.compileReport(jasperDesign);
					byte[] byteStream = JasperRunManager.runReportToPdf(jasperReport, parameters, conn);
					OutputStream outStream = response.getOutputStream();
					response.setContentType("application/pdf");
					response.setContentLength(byteStream.length);
					outStream.write(byteStream, 0, byteStream.length);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (JRException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				
			}
			if(command.equals("guide")){
				try {
					String category = (String) request.getParameter("category");
					String value = (String) request.getParameter("value");
					
					Connection conn = dataSource.getConnection();
					JasperReport jasperReport = null;
					JasperDesign jasperDesign = null;
					Map<String, Object> parameters = new HashMap<String, Object>();
					
					parameters.put("type", category);
					parameters.put("value", value);
					
					String path = getServletContext().getRealPath("/Reports/");
					jasperDesign = JRXmlLoader.load(path + "/Tour_Guides_Info.jrxml");
					jasperReport = JasperCompileManager.compileReport(jasperDesign);
					byte[] byteStream = JasperRunManager.runReportToPdf(jasperReport, parameters, conn);
					OutputStream outStream = response.getOutputStream();
					response.setContentType("application/pdf");
					response.setContentLength(byteStream.length);
					outStream.write(byteStream, 0, byteStream.length);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (JRException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				
			}
			if(command.equals("hotel")){
				try {
					String user_id = (String) request.getParameter("user_id");
					Connection conn = dataSource.getConnection();
					JasperReport jasperReport = null;
					JasperDesign jasperDesign = null;
					Map<String, Object> parameters = new HashMap<String, Object>();
					parameters.put("user_id", user_id);
					String path = getServletContext().getRealPath("/Reports/");
					jasperDesign = JRXmlLoader.load(path + "/userInfo.jrxml");
					jasperReport = JasperCompileManager.compileReport(jasperDesign);
					byte[] byteStream = JasperRunManager.runReportToPdf(jasperReport, parameters, conn);
					OutputStream outStream = response.getOutputStream();
					response.setContentType("application/pdf");
					response.setContentLength(byteStream.length);
					outStream.write(byteStream, 0, byteStream.length);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (JRException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				
			}
				
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
