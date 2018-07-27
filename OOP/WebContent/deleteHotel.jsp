
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
</head>
<body>

<%
Statement stmt = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/oop","root","toor"); 
	stmt=con.createStatement(); 
	
} catch (Exception e) {
	
	response.getWriter().append(e.toString());
	e.printStackTrace();
}
%>
	

<form method="get" action="ReservationHandler">
	<table id="customers">
	  <tr>
	    <th>Hotel ID</th>
	    <th>Hotel Name</th>
	    <th>DELETE</th>
	  </tr>
	 
	 
	 <%
	 ResultSet hotelset = stmt.executeQuery("select * from hotel");
	 while(hotelset.next()){
	 	//String h = hotelset.getString(2);
	 	//out.print(hotelset.getString(2));
	 	String hotelId = hotelset.getString(1);
	 	String hotelName = hotelset.getString(2);
	 	
	 	String resultString = "<tr>"+
	    	"<td>"+hotelId+"</td>"+
	   		 "<td>"+hotelName+"</td>"+
	    	"<td><button type='submit' name='delete' value='"+hotelId+"' >DELETE</button></td>"+
	  		"</tr>";
	  	out.print(resultString);
	 }
	 
	 
	 %>
	 
	
	
	</table>
</form>

</body>
</html>